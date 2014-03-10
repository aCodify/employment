<?php if (! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 
 * PHP version 5
 * 
 * @package agni cms
 * @author vee w.
 * @license http://www.opensource.org/licenses/GPL-3.0
 *
 */


class index extends MY_Controller 
{
	
	
	public function __construct() 
	{
		parent::__construct();
		
		// load model
		$this->load->model(array('posts_model'));
		
		// set post_type
		$this->posts_model->post_type = 'article';
		
		// load helper
		$this->load->helper(array('date', 'language' , 'function'));

		
		// load language
		$this->lang->load('post');
	
	}// __construct
	
	
	// public function _remap($att1 = '', $att2 = '') 
	// {
	// 	// if there is uri like this http://domain/installed_dir/index, http://domain/installed_dir/index/index
	// 	// redirect to base url to prevent duplicate content. good for seo.
	// 	if ($this->uri->segment(1) != null) {
	// 		redirect(base_url());
	// 	}
		
	// 	$this->index();
	// }// _remap

	/**
	 * encrypt password
	 * @param string $password
	 * @return string
	 */
	public function encryptPassword($password = '') 
	{
		if (property_exists($this, 'modules_plug') && $this->modules_plug->has_filter('account_generate_hash_password')) {
			return $this->modules_plug->do_filter('account_generate_hash_password', $password);
		} else {
			include_once dirname(dirname(__FILE__)).'/libraries/PasswordHash.php';
			$PasswordHash = new PasswordHash(12, false);
			return $PasswordHash->HashPassword($password);
		}
	}// encryptPassword
	
	
	
	public function index() 
	{
		// if there is custom home module plug.
		if ($this->modules_plug->has_action('front_home_controller')) {
			return $this->modules_plug->do_action('front_home_controller');
		}
		
		// get frontpage category from config
		$fp_category = $this->config_model->loadSingle('content_frontpage_category', $this->lang->get_current_lang());
		
		if ($fp_category != null) {
			// load category for title, metas
			$this->db->where('tid', $fp_category);
			$query = $this->db->get('taxonomy_term_data');
			if ($query->num_rows() <= 0) {
				// not found category
				unset($_GET['tid']);
			} else {
				$row = $query->row();
				if ($row->theme_system_name != null) {
					// set theme
					$this->theme_path = base_url().config_item('agni_theme_path').$row->theme_system_name.'/';// for use in css
					$this->theme_system_name = $row->theme_system_name;// for template file.
				}
			}
			$query->free_result();
			unset($query);			
		}
		
		// list posts---------------------------------------------------------------
		if ($fp_category != null && is_numeric($fp_category)) {
			$_GET['tid'] = $fp_category;
		}
		$output['list_item'] = $this->posts_model->listPost('front');
		if (is_array($output['list_item'])) {
			$output['pagination'] = $this->pagination->create_links();
		}
		// end list posts---------------------------------------------------------------
		
		// head tags output ##############################
		if (isset($row) && $row->meta_title != null) {
			$output['page_title'] = $row->meta_title;
		} else {
			$output['page_title'] = $this->html_model->gen_title();
		}
		// meta tags
		$meta = '';
		if (isset($row) && $row->meta_description != null) {
			$meta[] = '<meta name="description" content="'.$row->meta_description.'" />';
		}
		if (isset($row) && $row->meta_keywords != null) {
			$meta[] = '<meta name="keywords" content="'.$row->meta_keywords.'" />';
		}
		$output['page_meta'] = $this->html_model->gen_tags($meta);
		unset($meta);
		// link tags
		// script tags
		// end head tags output ##############################



		// GET DATA PROJECT
		$this->db->from( 'project AS p' );
		$this->db->join( 'accounts AS a', 'p.account_id = a.account_id', 'left' );
		$this->db->where( ' ( p.end_date > '. strtotime( 'now' ) . 
		                  ' OR p.end_date = 0 ) ', false , false );
		$this->db->where( 'a.account_status', 1 );
		$query = $this->db->get();
		$output['data_project'] = $query->result();

		foreach ( $output['data_project'] as $key => $value ) 
		{
			$this->db->where( 'project_id', $value->id );
			$query = $this->db->get( 'project_ref_job' );
			$data = $query->result();

			$data_array = array();

			foreach ( $data as $key_info => $value_info ) 
			{
				$this->db->where( 'id', $value_info->id_job );
				$query = $this->db->get( 'job' );
				$data_name = $query->row();

				$data_array[] = $data_name->name_job;
			}

			if ( ! empty( $data_array ) ) 
			{
				$data_array = implode( ',' , $data_array );
			}
			else
			{
				$data_array = '';
			}
		

			$output['data_project'][$key]->name_job = $data_array;

			$this->db->where( 'id', $value->province );
			$query = $this->db->get( 'province' );
			$data = $query->row();

			$output['data_project'][$key]->name_province = $data->name_province;
			
		}



		// GET DATA FREELANCE
		$this->db->where( 'type', 1 );
		$query = $this->db->get( 'accounts' );
		$output['data_freelance'] = $query->result();

		// output
		$this->generate_page('front/templates/index/index_view', $output);
	}// index
	

	public function register( $info_page = 'home' )
	{

		$account_data = $this->account_model->get_account_cookie( 'member' );

		if ( ! empty( $account_data ) ) 
		{
			redirect( site_url() );
		}

		// SET VALUE 
		$output = '';

		if ( $info_page == 'home' ) 
		{
			$this->generate_page('front/templates/account/call_home_register_view', $output);
			return false;
		}


		/**
		*
		*** START IF SYSTEM HAS METHORD $_POST
		*
		**/

			if ( $this->input->post() ) 
			{
				echo '<pre>';
				print_r( $_POST );
				echo '</pre>';

				die();
			}

		/** END IF SYSTEM HAS METHORD $_POST **/

		// -------------------------------------

		/**
		*
		*** START GET PROVINCE
		*
		**/
		
		$query = $this->db->get( 'province' );
		$output['province'] = $query->result();
		
		
		/** END GET PROVINCE **/

		// -------------------------------------

		/**
		*
		*** START GET JOB
		*
		**/
		
		$query = $this->db->get( 'job' );
		$output['job'] = $query->result();
		
		
		/** END GET JOB **/	

		// -------------------------------------	


		if ( $info_page == 'freelance' ) 
		{
			$this->generate_page('front/templates/account/call_register_view', $output);
			return false;
		}
		elseif ( $info_page == 'principal' ) 
		{
			$this->generate_page('front/templates/account/call_register_principal_view', $output);
			return false;
		}

	}


	public function delete_file_img($info = 'img_cover', $filename = '')
	{

		die();
			//if file image check in befor upload now
			if (!empty($filename)) 
			{
				$file = './public/upload/all_img_blog/'.$info.'/'.$filename;
				if (file_exists($file)) {
					unlink($file);
				}			
			}
	}


	public function select_photo_upload_cover($info = 'img_cover')
	{
			//upload images
			require_once( APPPATH.'libraries/phpthumb/ThumbLib.inc.php' );			
			//--- change name -------------------
			$file_name = explode('.',$_FILES['uploadfile']['name']);
			$md = md5($_FILES['uploadfile']['name']);  
			$filename = $md.'.'.$file_name[1];  
			
			$uploaddir = './public/upload/'.$info.'/';   //path name save
			$file = $uploaddir . $filename;	
					 
			if (move_uploaded_file($_FILES['uploadfile']['tmp_name'], $file)) { 
			
				$thumb = PhpThumbFactory::create($this->config->item('agni_upload_path').$info.'/'.$filename);
				
				if ($info == 'img_cover') {
					$thumb->adaptiveResize(290,245);
				} else {
					$thumb->adaptiveResize(100,100);
				}

				$thumb->save($this->config->item( 'agni_upload_path' ).$info.'/mid-'.$filename);
				if (file_exists($file)) {
					unlink($file);
				}
				
				echo 'mid-'.$filename;			
			}  

	}	

	public function forget_password()
	{
		// SET VALUE 
		$output = '';



		if ( $this->input->post('email') ) 
		{

			$email = $this->input->post('email');


			$new_password = number_rand( 4 );
			$data['account_password'] = $this->encryptPassword( $new_password );
			$this->db->where( 'account_email', $email );
			$this->db->update( 'accounts', $data );

			/**
			*
			*** START SET SENT EMAIL	
			*
			**/
			require_once( APPPATH.'libraries/phpmailer/class.phpmailer.php' );

			$mail 				 = new PHPMailer();
			$mail->CharSet 		 = 'UTF-8';
			$body = '';
	    	$body .= '<h4>คุณได้ทำการร้องขอ ข้อมูล Password ใหม่ โดย Password ใหม่ของคุณคือ</h4><br>';
	    	$body .= '<b>Password : '.$new_password.'</b> <br> <br>';
	    	$body .= 'คุณสามารถเข้าไป login ได้ที่ '. site_url();
	 
			$mail->IsSMTP(); // telling the class to use SMTP
			$mail->SMTPAuth   = true; 
			$mail->SMTPSecure = "tls";                 // enable SMTP authentication
			$mail->Host       = "smtp.gmail.com"; 
			$mail->Port       = 587;                   // set the SMTP port for the GMAIL server			
			$mail->Username = 'phpmailer101@gmail.com';
			$mail->Password = 'RFVujm123@';
			
			$email_from = 'contact@domain.com'; 
			$from_name = 'System-Contact';
			$mail->SetFrom( $email_from , $from_name );
			$mail->Subject  = 'System Reset Password';
			$mail->MsgHTML( $body );
			$mail->AddAddress( $email );
			
			if(!$mail->Send()) 
			{
			  	// $this->data['error_sent_mail'] = $this->language->get( 'error_sent_mail' );
			} 

			/** END SET SENT EMAIL	 **/

			$output['success'] = 'ได้ทำการส่ง Password ใหม่ไปยัง อีเมล์ของคุณแล้ว';

		}



		$this->generate_page('front/templates/account/call_forget_password_view', $output);
	}


	public function freelance()
	{
		// SET VALUE 
		$output = '';

		$this->db->where( 'type', 1 );
		$this->db->where( 'account_status', 1 );
		$query = $this->db->get( 'accounts' );
		$data = $query->result();
		$output['data_list'] = $data;


		$this->generate_page('front/templates/job/freelance_view', $output);
	}

	public function principal()
	{
		// SET VALUE 
		$output = '';

		// GET DATA PROJECT
		$this->db->from( 'project AS p' );
		$this->db->join( 'accounts AS a', 'p.account_id = a.account_id', 'left' );
		$this->db->order_by( 'p.id', 'desc' );


		$this->db->where( ' ( p.end_date > '. strtotime( 'now' ) . 
		                  ' OR p.end_date = 0 ) ', false , false );

		$this->db->where( 'a.account_status', 1 );
		$query = $this->db->get();
		$output['data_list'] = $query->result();


		foreach ( $output['data_list'] as $key => $value ) 
		{
			$this->db->where( 'project_id', $value->id );
			$query = $this->db->get( 'project_ref_job' );
			$data = $query->result();

			$data_array = array();

			foreach ( $data as $key_info => $value_info ) 
			{
				$this->db->where( 'id', $value_info->id_job );
				$query = $this->db->get( 'job' );
				$data_name = $query->row();

				$data_array[] = $data_name->name_job;
			}

			if ( ! empty( $data_array ) ) 
			{
				$data_array = implode( ',' , $data_array );
			}
			else
			{

				$data_array = '';
			
			}
		

			$output['data_list'][$key]->name_job = $data_array;

			$this->db->where( 'id', $value->province );
			$query = $this->db->get( 'province' );
			$data = $query->row();

			$output['data_list'][$key]->name_province = $data->name_province;
			
		}

		$this->generate_page('front/templates/job/principal_view', $output);
	}

	public function profile_freelance( $id = '' )
	{
	
		// SET VALUE 
		$output = '';

		if ( empty( $id ) ) 
		{
			redirect( site_url() );
		}

		$output['id'] = $id;

		$this->db->where( 'account_id', $id );
		$this->db->where( 'type', 1 );
		$this->db->where( 'account_status', 1 );
		$query = $this->db->get( 'accounts' );
		$output['show_data'] = $query->row();

		if ( empty( $output['show_data'] ) ) 
		{
			redirect( site_url() );
		}


		$this->db->from( 'job_ref_account AS jra' );
		$this->db->join( 'job AS j', 'j.id = jra.id_job', 'left' );
		$this->db->where( 'id_account', $id );
		$query = $this->db->get();
		$job_data = $query->result();

		foreach ( $job_data as $key => $value ) 
		{
			$job[] = $value->name_job;
		}

		$output['job'] = implode( ' , ', $job );


		$this->generate_page('front/templates/member/profile_freelance_view', $output);
	
	} // END FUNCTION profile_freelance



	public function profile_project( $id = '' )
	{
	
		// SET VALUE 
		$output = '';

		$output['id'] = $id;

		if ( empty( $id ) ) 
		{
			redirect( site_url() );
		}

		$account_data = $this->account_model->get_account_cookie( 'member' );

		if ( ! empty( $account_data ) ) 
		{
			$this->db->where( 'account_id', $account_data['id'] );
			$this->db->where( 'account_status', 1 );
			$query = $this->db->get( 'accounts' );
			$account_data = $query->row();


			$this->db->where( 'account_id', $account_data->account_id );
			$query = $this->db->get( 'project' );
			$data_project = $query->result();
		}


		if ( ! empty( $data_project ) ) 
		{
			$output['this_project'] = true;
		}
		else
		{
			$output['this_project'] = false;
		}

		if ( $this->input->post() ) 
		{

			$this->db->set( 'account_id', $account_data->account_id );
			$this->db->set( 'ref_project_id', $id );
			$this->db->set( 'detail', $this->input->post('detail') );
			$this->db->set( 'price', $this->input->post('price') );
			$this->db->insert( 'project_log_price' );


			$this->db->where( 'id', $id );
			$this->db->set( 'count_countact', 'count_countact+1' , false );
			$this->db->update( 'project' );

		}


		$this->db->where( 'ref_project_id', $id );
		$query = $this->db->get( 'project_log_price' );
		$output['project_log_price'] = $query->result();

		foreach ( $output['project_log_price'] as $key => $value ) 
		{
			$this->db->select( 'name' );
			$this->db->where( 'account_id', $value->account_id );
			$this->db->where( 'account_status', 1 );
			$query = $this->db->get( 'accounts' );
			$data = $query->row();

			$output['project_log_price'][$key]->name_account = $data->name;

		}


		$this->db->from( 'project AS p' );
		$this->db->join( 'accounts AS a', 'p.account_id = a.account_id', 'left' );
		$this->db->where( 'a.account_status', 1 );
		$this->db->where( 'p.id', $id );
		$query = $this->db->get();
		$output['show_data'] = $query->row();

		if ( empty( $output['show_data'] ) ) 
		{
			redirect( site_url() );
		}

		$this->db->from( 'project_ref_job AS prj' );
		$this->db->join( 'job AS j', 'prj.id_job = j.id', 'left' );
		$this->db->where( 'prj.project_id', $id );
		$query = $this->db->get();
		$output['data_job'] = $query->result();

		$this->generate_page('front/templates/member/profile_project_view', $output);
	
	} // END FUNCTION profile_project


	public function member( $type = '' )
	{
	
		// SET VALUE 
		$output = '';


		if ( $type == 'add_project' ) 
		{
			$this->generate_page('front/templates/member/profile_project_add_view', $output);
			return true;
		}
		else if ( $type == 'view_project' )
		{
			$this->generate_page('front/templates/member/profile_project_list_view', $output);
			return true;
		}
		else if ( $type == 'detail_project' ) 
		{
			$this->generate_page('front/templates/member/profile_project_detail_view', $output);
			return true;
		}

		die();

	
	} // END FUNCTION member
	


	public function edit_account()
	{

		// SET VALUE 
		$output = '';

		/**
		*
		*** START GET PROVINCE
		*
		**/
		
		$query = $this->db->get( 'province' );
		$output['province'] = $query->result();
		
		
		/** END GET PROVINCE **/

		// -------------------------------------

		/**
		*
		*** START GET JOB
		*
		**/
		
		$query = $this->db->get( 'job' );
		$output['job'] = $query->result();
		
		
		/** END GET JOB **/	

		// -------------------------------------


		// CHECK ACCOUNT LOGIN
		$info = $this->account_model->get_account_cookie( 'member' );
		if ( empty( $info ) ) 
		{
			redirect( site_url( 'account/login' ) );
		}
		$output['info'] = $info;

		if ( $this->input->post() ) 
		{

			$data_post = $this->input->post();
			
			// load form validation
			$this->load->library('form_validation');
			$this->form_validation->set_rules('account_username', 'lang:account_username', 'trim|required|xss_clean|min_length[1]|no_space_between_text');
			$this->form_validation->set_rules('account_email', 'lang:account_email', 'trim|required|valid_email|xss_clean');
			$this->form_validation->set_rules('name', 'lang:Name', 'trim|required|xss_clean|min_length[1]|no_space_between_text');
			$this->form_validation->set_rules('last_name', 'lang:Last Name', 'trim|required|xss_clean|min_length[1]|no_space_between_text');
			$this->form_validation->set_rules('id_card', 'lang:กรุณาใส่เลขประจำตัวประชาชนให้ถูกต้อง', 'trim|required|xss_clean|exact_length[13]'); 
			if ($this->form_validation->run() == false) 
			{
				$output['form_status'] = 'error';
				$output['form_status_message'] = '<ul>'.validation_errors('<li>', '</li>').'</ul>';
				$output['show_data'] = $this->input->post();
				$this->generate_page('front/templates/account/form_profile_account_view', $output);
				return false;
			}


			$overset_error = '';
			// check duplicate account (duplicate username)
			$this->db->where('account_username', $data_post['account_username']);
			$this->db->where( 'account_id !=', $info['id'] );
			$query = $this->db->select('account_username')->get('accounts');
			if ($query->num_rows() > 0) {
				$query->free_result();
				$overset_error .= $this->lang->line('account_username_already_exists').'<br />';
			}
			$query->free_result();
			
			// check duplicate account (duplicate email)
			$this->db->where('account_email', $data_post['account_email']);
			$this->db->where( 'account_id !=', $info['id'] );
			$query = $this->db->select('account_email')->get('accounts');
			if ($query->num_rows() > 0) {
				$query->free_result();
				$overset_error .= $this->lang->line('account_email_already_exists');
			}
			$query->free_result();

			if ( ! empty( $overset_error ) ) 
			{
				$output['form_status'] = 'error';
				$output['form_status_message'] = $overset_error;
			}


			if ( empty( $output['form_status'] ) ) 
			{
				
				if ( empty( $data_post['account_password'] ) ) 
				{
					unset( $data_post['account_password'] );
				}
				else
				{
					$data_post['account_password'] = $this->encryptPassword($data_post['account_password']);
				}

				if ( empty( $data_post['name_job'] ) ) 
				{
					$this->db->where( 'id_account', $info['id'] );	
					$this->db->delete( 'job_ref_account' );

				}
				else
				{
					$this->db->where( 'id_account', $info['id'] );	
					$this->db->delete( 'job_ref_account' );

					foreach ( $data_post['name_job'] as $key => $value ) 
					{
						$this->db->set( 'id_account', $info['id'] );
						$this->db->set( 'id_job', $value );
						$this->db->insert( 'job_ref_account' );
					}
				}
				unset( $data_post['name_job'] );



				$this->db->where( 'account_id', $info['id'] );
				$this->db->update( 'accounts', $data_post );

				$output['form_status'] = 'success';
				$output['form_status_message'] = $this->lang->line('account_saved');
			}


			$output['show_data'] = $this->input->post();

		}
		else
		{

			// GET DATA ACCOUNT
			$this->db->where( 'account_id', $info['id'] );
			$query = $this->db->get( 'accounts' );
			$data = $query->row_array();
			$output['show_data'] = $data;

			// GET DATA JOB
			$this->db->where( 'id_account', $info['id'] );
			$query = $this->db->get( 'job_ref_account' );
			$data_job = $query->result();
			$array_job = array();
			foreach ( $data_job as $key => $value ) 
			{
				$array_job[] =  $value->id_job;
			}

			$output['show_data']['name_job'] = $array_job;	

		}

		$this->generate_page('front/templates/account/form_profile_account_view', $output);
	} // END FUNCTION edit_account


	public function project()
	{
		// SET VALUE 
		$output = '';

		// CHECK ACCOUNT LOGIN
		$info = $this->account_model->get_account_cookie( 'member' );
		if ( empty( $info ) ) 
		{
			redirect( site_url( 'account/login' ) );
		}

		$this->db->where( 'account_id', $info['id'] );
		$query = $this->db->get( 'project' );
		$data = $query->result();

		$output['data_list'] = $data;


		$this->generate_page('front/templates/member/profile_project_list_view', $output);
	
	} // END FUNCTION project


	public function project_add()
	{
		// SET VALUE 
		$output = '';

		// CHECK ACCOUNT LOGIN
		$info = $this->account_model->get_account_cookie( 'member' );
		if ( empty( $info ) ) 
		{
			redirect( site_url( 'account/login' ) );
		}

		/**
		*
		*** START GET JOB
		*
		**/
		
		$query = $this->db->get( 'job' );
		$output['job'] = $query->result();
		
		
		/** END GET JOB **/	


		if ( $this->input->post() ) 
		{
			$data_post = $this->input->post();

			// load form validation
			$this->load->library('form_validation');
			$this->form_validation->set_rules('project_name', 'lang:ชื่อโปรเจค', 'trim|required|xss_clean|min_length[1]');
			$this->form_validation->set_rules('project_detail', 'lang:ข้อมูลโปรเจค', 'trim|required|xss_clean|min_length[1]');
			$this->form_validation->set_rules('price', 'lang:ราคา', 'trim|required|xss_clean|min_length[1]|no_space_between_text');
			$this->form_validation->set_rules('long_term', 'lang:ระยะเวลา', 'trim|required|xss_clean|min_length[1]|no_space_between_text');
			if ($this->form_validation->run() == false) 
			{
				$output['form_status'] = 'error';
				$output['form_status_message'] = '<ul>'.validation_errors('<li>', '</li>').'</ul>';
				$output['show_data'] = $this->input->post();
				$this->generate_page('front/templates/member/profile_project_add_view', $output);
				return false;
			}
			else
			{

				$array_job = $data_post['name_job'];

				$this->db->select( 'a.account_id , a.account_email , jra.id_job' );
				$this->db->from( 'job_ref_account AS jra' );
				$this->db->where_in( 'jra.id_job', $array_job );
				$this->db->join( 'accounts AS a', 'a.account_id = jra.id_account', 'left' );
				$this->db->where( 'a.account_status', 1 );
				$this->db->where_in('a.type', 1);
				$this->db->group_by( 'a.account_id' );
				$query = $this->db->get();
				$data_email_group = $query->result();


				unset( $data_post['name_job'] );

				$data_post['create_date'] = time();
				$data_post['account_id'] = $info['id'];

				$this->db->insert( 'project', $data_post );

				$id_project = $this->db->insert_id();

				if ( ! empty( $array_job ) ) 
				{
					foreach ( $array_job as $key => $value ) 
					{
						$this->db->set( 'project_id', $id_project );
						$this->db->set( 'id_job', $value );
						$this->db->insert( 'project_ref_job' );
					}
				}

				if ( ! empty( $data_email_group ) ) 
				{
	
					/**
					*
					*** START SET SENT EMAIL	
					*
					**/
					require_once( APPPATH.'libraries/phpmailer/class.phpmailer.php' );

					$mail 				 = new PHPMailer();
					$mail->CharSet 		 = 'UTF-8';
					$body = '';
			    	$body .= '<h4>ได้มีการลงข้อมูล Project ใหม่</h4><br>';
			    	$body .= '<b>คุณสามารถเข้าไปดูได้ที่</b> <br> <br>';
			    	$body .= site_url( 'index/profile_project/'.$id_project );
			 
					$mail->IsSMTP(); // telling the class to use SMTP
					$mail->SMTPAuth   = true; 
					$mail->SMTPSecure = "tls";                 // enable SMTP authentication
					$mail->Host       = "smtp.gmail.com"; 
					$mail->Port       = 587;                   // set the SMTP port for the GMAIL server			
					$mail->Username = 'phpmailer101@gmail.com';
					$mail->Password = 'RFVujm123@';
					
					$email_from = 'contact@domain.com'; 
					$from_name = 'System-Contact';
					$mail->SetFrom( $email_from , $from_name );
					$mail->Subject  = 'System Reset Password';
					$mail->MsgHTML( $body );

					foreach ( $data_email_group as $key => $value ) 
					{
						$mail->AddAddress( $value->account_email );
					}

					
					if(!$mail->Send()) 
					{
					  	// $this->data['error_sent_mail'] = $this->language->get( 'error_sent_mail' );
					} 

					/** END SET SENT EMAIL	 **/

				}

				redirect( 'index/project' );

			}

		}

		$this->generate_page('front/templates/member/profile_project_add_view', $output);
	
	} // END FUNCTION project


	public function edit_project( $id = '' )
	{

		// SET VALUE 
		$output = '';

		// CHECK ACCOUNT LOGIN
		$info = $this->account_model->get_account_cookie( 'member' );
		if ( empty( $info ) ) 
		{
			redirect( site_url( 'account/login' ) );
		}

		/**
		*
		*** START GET JOB
		*
		**/
		
		$query = $this->db->get( 'job' );
		$output['job'] = $query->result();
		
		
		/** END GET JOB **/		



		$this->db->where( 'id', $id );
		$this->db->where( 'account_id', $info['id'] );
		$query = $this->db->get( 'project' );
		$data = $query->row();
		$output['show_data'] = $data;


		$this->db->where( 'project_id', $id );
		$query = $this->db->get( 'project_ref_job' );
		$data = $query->result();
		$project_job = array();
		foreach ( $data as $key => $value ) 
		{
			$project_job[] = $value->id_job;
		}

		$output['project_job'] = $project_job;


		if ( $this->input->post() ) 
		{
			$data_post = $this->input->post();

		
			// load form validation
			$this->load->library('form_validation');
			$this->form_validation->set_rules('project_name', 'lang:ชื่อโปรเจค', 'trim|required|xss_clean|min_length[1]');
			$this->form_validation->set_rules('project_detail', 'lang:ข้อมูลโปรเจค', 'trim|required|xss_clean|min_length[1]');
			$this->form_validation->set_rules('price', 'lang:ราคา', 'trim|required|xss_clean|min_length[1]|no_space_between_text');
			$this->form_validation->set_rules('long_term', 'lang:ระยะเวลา', 'trim|required|xss_clean|min_length[1]|no_space_between_text');
			if ($this->form_validation->run() == false) 
			{
				$output['form_status'] = 'error';
				$output['form_status_message'] = '<ul>'.validation_errors('<li>', '</li>').'</ul>';
				$output['show_data'] = $this->input->post();

				$output['show_data'] = json_decode(json_encode($output['show_data']) , false );

				$this->generate_page('front/templates/member/profile_project_edit_view', $output);
				return false;
			}
			else
			{

				$array_job = $data_post['name_job'];
				unset( $data_post['name_job'] );

				$data_post['create_date'] = time();

				$data_post['end_date'] = strtotime(reset_format_date($data_post['end_date']));

				$this->db->where( 'id', $id );
				$this->db->update( 'project', $data_post );

				$this->db->where( 'project_id', $id );
				$this->db->delete( 'project_ref_job' );

				if ( ! empty( $array_job ) ) 
				{
					foreach ( $array_job as $key => $value ) 
					{
						$this->db->set( 'project_id', $id );
						$this->db->set( 'id_job', $value );
						$this->db->insert( 'project_ref_job' );
					}
				}

				redirect( 'index/project' );

			}

		}




		$this->generate_page('front/templates/member/profile_project_edit_view', $output);
		
	
	} // END FUNCTION edit_project




	public function register_email( $email = '' )
	{

		$output = '';
		$email = rawurldecode($email);

		$this->db->where( 'account_email', $email );
		$query = $this->db->get( 'accounts' );
		$data = $query->row();

		if ( ! empty( $data ) ) 
		{
			$this->db->where( 'account_email', $email );
			$this->db->set( 'account_status', '1' );
			$this->db->update( 'accounts' );
			$output['status'] = 'คุณสามารถ login ด้วย Email: '. $email . ' ได้แล้ว';
		}
		else
		{
			$output['status'] = 'ไม่มี Email นี้อยู่ในระบบ';
		}


		$output['success'] = '';

		$this->generate_page('front/templates/member/register_email_view', $output);
	
	} // END FUNCTION register_email













}