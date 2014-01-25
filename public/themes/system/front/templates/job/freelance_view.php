<h3>Freelance list</h3>
<blockquote id="freelance">
	<table class="table table-striped table-hover table-bordered dataTable" >
		<thead>
			<tr>
				<th>Name</th>
				<th>Job</th>
				<th>Phone</th>
			</tr>
		</thead>
		<tbody>

			<?php for ( $i=0; $i < 100; $i++ ) 
			{ ?>
				<tr>
					<td>Zill<?php echo $i ?> </td>
					<td>Programmer</td>
					<td>0888888888</td>
				</tr>
				
			<?php } ?>

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