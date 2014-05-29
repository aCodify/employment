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

class index extends admin_controller 
{

	
	public function __construct() 
	{
		parent::__construct();
	}// __construct
	
	
	public function index() 
	{
		// load session for flashdata
		$this->load->library('session');
		$form_status = $this->session->flashdata('form_status');
		if (isset($form_status['form_status']) && isset($form_status['form_status_message'])) {
			$output['form_status'] = $form_status['form_status'];
			$output['form_status_message'] = $form_status['form_status_message'];
		}
		unset($form_status);
		
		// head tags output ##############################
		$output['page_title'] = $this->html_model->gen_title($this->lang->line('admin_home'));
		// meta tags
		// link tags
		// script tags
		// end head tags output ##############################
		
		redirect( site_url( 'site-admin/account' ) );	

		// output
		$this->generate_page('site-admin/templates/index/index_view', $output);
	}// index
	

	public function principal( $id = '' )
	{	
	
		// SET VALUE 
		$output = '';

		$this->db->where( 'type', 2 );
		$query = $this->db->get( 'accounts' );
		$data = $query->result();
		$output['data_list'] = $data;

		$output['page_title'] = $this->html_model->gen_title($this->lang->line('admin_home'));

		$this->generate_page('site-admin/templates/index/principal_view', $output);
	
	} // END FUNCTION principal
	
	public function freelance( $id = '' )
	{
	
		// SET VALUE 
		$output = '';

		$this->db->where( 'type', 1 );
		$query = $this->db->get( 'accounts' );
		$data = $query->result();
		$output['data_list'] = $data;

		$output['page_title'] = $this->html_model->gen_title($this->lang->line('admin_home'));

		$this->generate_page('site-admin/templates/index/freelance_table_view', $output);
	
	} // end function freelance


	public function list_project( $id = '' )
	{
	
		// SET VALUE 
		$output = '';

		$this->db->where( 'account_id', $id );
		$query = $this->db->get( 'project' );
		$data = $query->result();

		$output['data_list'] = $data;

		$output['page_title'] = $this->html_model->gen_title($this->lang->line('admin_home'));

		$this->generate_page('site-admin/templates/index/list_project_view', $output);
	
	} // END FUNCTION list_project

}

