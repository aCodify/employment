<h2 class="set-header-profile" >Profile Project <?php echo $id = ( ! empty( $id ) ) ? $id : '' ; ?></h2>
<blockquote class="profile-freelance">

	<div class="box_input">
		<div class="name_input">
			Number Project 	
		</div>
		: <?php echo $show_data->project_code ?>
	</div>

	<div class="box_input">
		<div class="name_input">
			ชื่อโปรเจค
		</div> 
		: <?php echo $show_data->project_name ?>
	</div>

	<div class="box_input">
		<div class="name_input">
			ข้อมูลโปรเจค
		</div> 	
		:  <?php echo $show_data->project_detail ?>
	</div>

	<div class="box_input">
		<div class="name_input">
			ทักษะในการทำงาน	
		</div>
		<ul style="padding-left: 8em;">
			<?php foreach ( $data_job as $key => $value ): ?>
				
				<li><?php echo $value->name_job ?></li>

			<?php endforeach ?>
		</ul>
	</div>


	<div class="box_input">
		<div class="name_input">
			ระยะเวลา
		</div> 
		: <?php echo $show_data->long_term ?> วัน
	</div>

	<div class="box_input">
		<div class="name_input">
			ราคาในการจ้างงาน
		</div> 
		: <?php echo number_format( $show_data->price ) ?> บาท
	</div>

	<div class="box_input">
		<div class="name_input">
			ที่อยู่ 	
		</div>
		: <?php echo $show_data->address ?>
	</div>

	<div class="box_input">
		<div class="name_input">
			Phone
		</div> 
		: <?php echo $show_data->phone ?>
	</div>

	<div class="box_input">
		<div class="name_input">
			E-Mail
		</div> 
		: <?php echo $show_data->account_email ?>
	</div>

	<hr>

	<div class="box_input">
		<div class="name_input">
			ลงทะเบียนเข้าร่วมการทำงาน
		</div> 
		<textarea placeholder="รายละเอียด" name="" rows="4"></textarea>
		<br>
		<div class="name_input">
			&nbsp;
		</div> 
		<span class="btn" >ลงชื่อ</span>
	</div>

	<hr style="border-color: rgb(149, 183, 201); border-width: 3px;">	

	<div class="box_input">
		<div class="name_input">
			คุณ
		</div> 
		: Josny ได้ลงชื่อขอทำงาน
	</div>
	<div class="box_input">
		<div class="name_input">
			คุณ
		</div> 
		: Zilla ได้ลงชื่อขอทำงาน
	</div>
	<div class="box_input">
		<div class="name_input">
			คุณ
		</div> 
		: Marl ได้ลงชื่อขอทำงาน
	</div>

	<hr>

</blockquote>


<script>
	
  jQuery(document).ready(function($) {
  
	// Set fieldname
	$.ajaxUploadSettings.name = 'uploadfile';
	// Set promptzone
	$('#upload_img').ajaxUploadPrompt({
		url : '<?php echo base_url() ?>upload.php?info=img_cover',
		error : function () 
		{
			alert( 'upload error please try again' )
		},
		success : function (data) 
		{
			name_old = $('.cover_img_name').val();
			
			if ( name_old != '' ) 
			{

			};
			console.log(data);
			data = JSON.parse( data );
			$('.cover-img-tmp').attr( 'src' , '<?php echo base_url( "public/upload/img_cover" ) ?>/'+data.name_filemid ); 
			$('.cover_img_name').val( data.name_filemid );

		}
	});
    
  });



</script>