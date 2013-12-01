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
		$this->load->helper(array('date', 'language'));
		
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

		// output
		$this->generate_page('front/templates/index/index_view', $output);
	}// index
	

	public function register( $info_page = 'home' )
	{
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

		$this->generate_page('front/templates/account/call_forget_password_view', $output);
	}


	public function freelance()
	{
		// SET VALUE 
		$output = '';

		$this->generate_page('front/templates/job/freelance_view', $output);
	}

	public function principal()
	{
		// SET VALUE 
		$output = '';

		$this->generate_page('front/templates/job/principal_view', $output);
	}

	
}