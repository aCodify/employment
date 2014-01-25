<h3>Update Project</h3>
<blockquote id="freelance" class="freelance-box-home">
	<table class="table table-striped table-hover table-bordered dataTable-project-home" >
		<thead>
			<tr>
				<th>Project</th>
				<th>Manager</th>
				<th>Phone</th>
				<th>Time line ( date )</th>
			</tr>
		</thead>
		<tbody>
			
				<?php foreach ( $data_project as $key => $value ): ?>
					
				<tr>
					<td><a href="<?php echo site_url( 'index/profile_project/'.$value->id ) ?>"><?php echo $value->project_name ?></a></td>
					<td><a href="<?php echo site_url( 'index/profile_project/'.$value->id ) ?>"><?php echo $value->name .' '.$value->last_name ?></a></td>
					<td><a href="<?php echo site_url( 'index/profile_project/'.$value->id ) ?>"><?php echo $value->phone ?></a></td>
					<td><a href="<?php echo site_url( 'index/profile_project/'.$value->id ) ?>"><?php echo $value->long_term ?></a></td>
				</tr>

				<?php endforeach ?>
				


		</tbody>
	</table>



</blockquote>



<h3>Update Freelance list</h3>
<blockquote id="freelance" class="freelance-box-home">
	<table class="table table-striped table-hover table-bordered dataTable" >
		<thead>
			<tr>
				<th>Name</th>
				<th>Job</th>
				<th>Phone</th>
			</tr>
		</thead>
		<tbody>

			<?php foreach ( $data_freelance as $key => $value ): ?>
				

				<?php  
				$this->db->from( 'job_ref_account AS jra' );
				$this->db->join( 'job AS j', 'jra.id_job = j.id', 'left' );
				$this->db->where( 'jra.id_account', $value->account_id );
				$query = $this->db->get();
				$data_job = $query->result();
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
		"iDisplayLength": 5
	});






var oTable_project = $('.dataTable-project-home').dataTable(
	{
		"aoColumns": [
					        { "sWidth": "30%" },
					        { "sWidth": "30%" },
					        { "sWidth": "15%" },
					        { "sWidth": "25%" }
						],
		"aaSorting": [[ 0, "asc" ]],
		"sPaginationType" : "full_numbers",
		"iDisplayLength": 5
	});

});

</script>