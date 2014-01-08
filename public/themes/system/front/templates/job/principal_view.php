<h3>Update Project</h3>
<blockquote id="freelance">
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

			<?php for ( $i=0; $i < 15; $i++ ) 
			{ ?>
				<tr>
					<td>Project <?php echo $i ?> </td>
					<td>Ms. Joney Loyas</td>
					<td>0888888888</td>
					<td>30 date</td>
				</tr>
				
			<? } ?>

		</tbody>
	</table>



</blockquote>



<script>
	
jQuery(document).ready(function($) {
	

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
		"iDisplayLength": 15
	});

});

</script>