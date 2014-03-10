<div class="body-wrap">
	
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>ชื่อผู้ใช้</th>
				<th>อีเมล</th>

				<th>สถานะ</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>ID</th>
				<th>ชื่อผู้ใช้</th>
				<th>อีเมล</th>

				<th>สถานะ</th>
			</tr>
		</tfoot>
		<tbody>
		 
			<?php foreach ( $data_list as $key => $value ): ?>
				
				<tr>
					
					<td><a href="<?php echo site_url( 'index/profile_freelance/'.$value->account_id ) ?>"><?php echo $value->account_id ?></a></td>
					<td><a href="<?php echo site_url( 'index/profile_freelance/'.$value->account_id ) ?>"><?php echo $value->name . ' ' .$value->last_name ?></a></td>
					<td><?php echo $value->account_email ?></td>

					<td>
						<?php echo $retVal = ( $value->account_status == 1 ) ? "ON" : "OFF" ; ?>			
					</td>

				</tr>

			<?php endforeach ?>	 
		 
		</tbody>
	</table>

</div>