<div class="body-wrap">
	
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>Project</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>Project</th>
			</tr>
		</tfoot>
		<tbody>
		 
			<?php foreach ( $data_list as $key => $value ): ?>
				
				<tr>
					
					<td><a href="<?php echo site_url('index/profile_project/'.$value->id) ?>"><?php echo $value->project_name ?></a></td>

				</tr>

			<?php endforeach ?>	 

			<?php if ( empty( $data_list ) ): ?>
				
				<tr>
					
					<td>No data</td>

				</tr>


			<?php endif ?>
		 
		</tbody>
	</table>

</div>