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

			<?php for ( $i=1; $i < 15; $i++ ) 
			{ ?>
				<tr>
					<td><a href="<?php echo site_url( 'index/profile_project/'.$i ) ?>">Project <?php echo $i ?></a></td>
					<td><a href="<?php echo site_url( 'index/profile_project/'.$i ) ?>">Ms. Joney Loyas</a></td>
					<td><a href="<?php echo site_url( 'index/profile_project/'.$i ) ?>">0888888888</a></td>
					<td><a href="<?php echo site_url( 'index/profile_project/'.$i ) ?>">30 date</a></td>
				</tr>
				
			<? } ?>

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

			<?php for ( $i=1; $i < 15; $i++ ) 
			{ ?>

				<tr>
					<td><a href="<?php echo site_url( 'index/profile_freelance/'.$i ) ?>">Joney Loyas <?php echo $i ?></a></td>
					<td><a href="<?php echo site_url( 'index/profile_freelance/'.$i ) ?>">Programmer</a></td>
					<td><a href="<?php echo site_url( 'index/profile_freelance/'.$i ) ?>">0888888888</a></td>
				</tr>
				
			<? } ?>

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