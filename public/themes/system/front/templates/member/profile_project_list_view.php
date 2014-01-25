<h3>My Project list</h3>
<blockquote id="freelance">

	<a href="<?php echo site_url( 'index/project_add' ) ?>" style="margin-bottom: 1em;" class="btn" > New Project </a>
	<table class="table table-striped table-hover table-bordered dataTable-project-home" >
		<thead>
			<tr>
				<th>Project</th>
				<th>Post Date</th>
				<th>จำนวนผู้มาติดต่อ</th>
				<th>สถานนะ</th>

			</tr>
		</thead>
		<tbody>
				<?php foreach ( $data_list as $key => $value ): ?>
					<tr>
						<td><a href="<?php echo site_url( 'index/edit_project/'.$value->id ) ?>"><?php echo $value->project_name ?></a></td>
						<td><a href="<?php echo site_url( 'index/edit_project/'.$value->id ) ?>"><?php echo date("d-M-Y" , $value->create_date); ?></a></td>
						<td><a href="<?php echo site_url( 'index/edit_project/'.$value->id ) ?>"><?php echo $value->count_countact ?></a></td>
						<td>
											
						<?php  

						switch ( $value->status ) 
						{
							case '1':
								echo 'เปิด';
								break;

							case '0':
								echo 'ปิด';
								break;
								
							case '2':
								echo 'มีผู้รับงานแล้ว';
								break;		
							
							default:
								# code...
								break;
						}

						?>

						</td>
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