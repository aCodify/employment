<?php 
// get data job
$query = $this->db->get( 'job' );
$data_job = $query->result();



// get data province

$query = $this->db->get( 'province' );
$data_province = $query->result();


$get_job = ( ! empty( $_GET['job'] ) ) ? $_GET['job'] : '' ;
$get_province = ( ! empty( $_GET['province'] ) ) ? $_GET['province'] : '' ;	
$get_price = ( ! empty( $_GET['price'] ) ) ? $_GET['price'] : '' ;	

?>


<h3>Project List</h3>


<div style="float: right; padding-left: 8px;">
	<select name="province" style="width: 10em;" >
			<option value="">ทุกจังหวัด</option>
			<?php foreach ( $data_province as $key => $value ): ?>
				<option <?php echo $select = ( $get_province == $value->id ) ? "selected" : '' ; ?> value="<?php echo $value->id ?>"><?php echo $value->name_province ?></option>
			<?php endforeach ?>
			
		</select>	
</div>

<div style="float: right; padding-left: 8px;">
	<select name="price" style="width: 8em;" >
			<option value="">ทุกราคา</option>
			<option <?php echo $select = ( 1 == $get_price ) ? "selected" : '' ; ?> value="1">0-2000</option>
			<option <?php echo $select = ( 2 == $get_price ) ? "selected" : '' ; ?> value="2">2001-4000</option>
			<option <?php echo $select = ( 3 == $get_price ) ? "selected" : '' ; ?> value="3">4001-8000</option>
			<option <?php echo $select = ( 4 == $get_price ) ? "selected" : '' ; ?> value="4">8001-12000</option>
			<option <?php echo $select = ( 5 == $get_price ) ? "selected" : '' ; ?> value="5">12001-20000</option>
			<option <?php echo $select = ( 6 == $get_price ) ? "selected" : '' ; ?> value="6">20001-3000</option>
			<option <?php echo $select = ( 7 == $get_price ) ? "selected" : '' ; ?> value="7">30001-ขึ้นไป</option>


		</select>	
</div>



<div style="float: right;">
	<!-- <span>ความสามารถ</span>	 -->
	<select name="job" style="width: 10em;" >
		<option value="">ทุกความสามารถ</option>
		<?php foreach ( $data_job as $key => $value ): ?>
			<option <?php echo $select = ( $get_job == $value->id ) ? "selected" : '' ; ?> value="<?php echo $value->id ?>"><?php echo $value->name_job ?></option>
		<?php endforeach ?>
	</select>
</div>


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
	
$('select').change(function(event) {
	set_job =  $('select[name*="job"]').val();
	set_province =  $('select[name*="province"]').val();
	price =  $('select[name*="price"]').val();

	window.location = "<?php echo site_url('index/principal'); ?>?job="+set_job+"&province="+set_province+"&price="+price;

});


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