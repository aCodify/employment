<h3>Project List</h3>
<blockquote id="freelance">
	<table class="table table-striped table-hover table-bordered dataTable-project-home" >
		<thead>
			<tr>
				<th>ชื่อโปรเจค</th>
				
				<th>ประเภทงาน</th>
				<th>งบประมาณ(บาท)</th>
				<th>จังหวัด</th>
				<th>ระยะเวลา(วัน)</th>
			</tr>
		</thead>
		<tbody>

				<?php foreach ( $data_list as $key => $value ): ?>


				


				
					
				<tr>
					<td><a href="<?php echo site_url( 'index/profile_project/'.$value->id ) ?>"><?php echo $value->project_name ?></a></td>
					<td><a href="<?php echo site_url( 'index/profile_project/'.$value->id ) ?>"><?php echo $value->name_job ?></a></td>
					<td><a href="<?php echo site_url( 'index/profile_project/'.$value->id ) ?>"><?php echo $value->price ?></a></td>
					<td><a href="<?php echo site_url( 'index/profile_project/'.$value->id ) ?>"><?php echo $value->name_province ?></a></td>
					<td><a href="<?php echo site_url( 'index/profile_project/'.$value->id ) ?>"><?php echo $value->long_term ?></a></td>
				</tr>

				<?php endforeach ?>

		</tbody>
	</table>



</blockquote>



<script>
	
jQuery(document).ready(function($) {
	

var oTable_project = $('.dataTable-project-home').dataTable(
	{
		"aoColumns": [
					        { "sWidth": "35%" },
					        
					        { "sWidth": "10%" },
					        { "sWidth": "15%" },
					        { "sWidth": "10%" },
					        { "sWidth": "5%" }
						],
		"aaSorting": [[ 0, "asc" ]],
		"sPaginationType" : "full_numbers",
		"iDisplayLength": 15
	});

});

</script>