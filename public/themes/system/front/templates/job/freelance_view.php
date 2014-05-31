<h3>Freelance List</h3>


<?php 
// get data job
$query = $this->db->get( 'job' );
$data_job = $query->result();



// get data province

$query = $this->db->get( 'province' );
$data_province = $query->result();


$get_job = ( ! empty( $_GET['job'] ) ) ? $_GET['job'] : '' ;
$get_province = ( ! empty( $_GET['province'] ) ) ? $_GET['province'] : '' ;	

?>
<div style="float: right; padding-left: 8px;">
	<select name="province" >
			<option value="">ทุกจังหวัด</option>
			<?php foreach ( $data_province as $key => $value ): ?>
				<option <?php echo $select = ( $get_province == $value->id ) ? "selected" : '' ; ?> value="<?php echo $value->id ?>"><?php echo $value->name_province ?></option>
			<?php endforeach ?>
			
		</select>	
</div>


<div style="float: right;">
	<!-- <span>ความสามารถ</span>	 -->
	<select name="job" style="width: 10em;" >
		<option value="">ทุกความสามารถ</option>
		<?php foreach ( $data_job as $key => $value ): ?>
			<option <?php echo $select = ( $get_job == $value->id ) ? "selected" : '' ; ?> value="<?php echo $value->id ?>"><?php echo $value->name_job ?></option>
		<?php endforeach ?>
	</select>
</div>


<blockquote id="freelance">
	<table class="table table-striped table-hover table-bordered dataTable" >
		<thead>
			<tr>
				<th>ชื่อ-นามสกุล</th>
				<th>ความสามารถ</th>
				<th>เบอร์โทรศัพท์</th>
			</tr>
		</thead>
		<tbody>

			<?php foreach ( $data_list as $key => $value ): ?>				

				<?php  
				$this->db->from( 'job_ref_account AS jra' );
				$this->db->join( 'job AS j', 'jra.id_job = j.id', 'left' );

				if ( ! empty( $get_job ) ) 
				{
					$this->db->where( 'j.id', $get_job );
				}

				$this->db->where( 'jra.id_account', $value->account_id );
				$query = $this->db->get();
				$data_job = $query->result();

				if ( empty( $data_job ) ) 
				{
					continue;
				}

				$job = array();
				foreach ( $data_job as $key_job => $value_job ) 
				{
					$job[] = $value_job->name_job;
				}
				$job = implode( ' , ', $job);
				?>

				<tr>
					<td><a href="<?php echo site_url( 'index/profile_freelance/'.$value->account_id ) ?>"><?php echo $value->name . ' ' .$value->last_name ?></a></td>
					<td><a href="<?php echo site_url( 'index/profile_freelance/'.$value->account_id ) ?>"><?php echo $job = ( ! empty( $job ) ) ? $job : 'ไม่มีข้อมูล' ; ?></a></td>
					<td><a href="<?php echo site_url( 'index/profile_freelance/'.$value->account_id ) ?>"><?php echo $phone = ( ! empty( $value->phone ) ) ? $value->phone : 'ไม่มีข้อมูล' ; ?></a></td>
				</tr>

			<?php endforeach ?>

		</tbody>
	</table>



</blockquote>



<script>
	
$('select').change(function(event) {
	set_job =  $('select[name*="job"]').val();
	set_province =  $('select[name*="province"]').val();

	window.location = "<?php echo site_url('index/freelance'); ?>?job="+set_job+"&province="+set_province;

});


jQuery(document).ready(function($) {
	

var oTable = $('.dataTable').dataTable(
	{
		"aoColumns": [
					        { "sWidth": "35%" },
					        { "sWidth": "35%" },
					        { "sWidth": "30%" }
						],
		"aaSorting": [[ 0, "asc" ]],
		"sPaginationType" : "full_numbers",
		"iDisplayLength": 10
	});

});

</script>