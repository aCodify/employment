<h3>Freelance List</h3>
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
		"iDisplayLength": 10
	});

});

</script>