<h3>My Project list</h3>
<blockquote id="freelance">

	<a href="<?php echo site_url( 'index/member/add_project' ) ?>" style="float: right; margin-bottom: 1em;" class="btn" > New Project </a>
	<table class="table table-striped table-hover table-bordered dataTable-project-home" >
		<thead>
			<tr>
				<th>Project</th>
				<th>Post Date</th>
				<th>จำนวนผู้มาติดต่อ</th>

			</tr>
		</thead>
		<tbody>

			<?php for ( $i=0; $i < 15; $i++ ) 
			{ ?>
				<tr>
					<td><a href="<?php echo site_url( 'index/member/detail_project/'.$i ) ?>">Project <?php echo $i ?></a></td>
					<td><a href="<?php echo site_url( 'index/member/detail_project/'.$i ) ?>"><?php echo date("d-M-Y"); ?></a></td>
					<td><a href="<?php echo site_url( 'index/member/detail_project/'.$i ) ?>"><?php echo number_rand( 1 ) ?></a></td>
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
					        { "sWidth": "25%" }
						],
		"aaSorting": [[ 0, "asc" ]],
		"sPaginationType" : "full_numbers",
		"iDisplayLength": 15
	});

});

</script>