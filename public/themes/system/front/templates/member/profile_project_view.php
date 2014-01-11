<h2 class="set-header-profile" >Profile Project <?php echo $id = ( ! empty( $id ) ) ? $id : '' ; ?></h2>
<blockquote class="profile-freelance">

	<div class="box_input">
		<div class="name_input">
			Number Project 	
		</div>
		: 0000<?php echo $id = ( ! empty( $id ) ) ? $id : '' ; ?>
	</div>

	<div class="box_input">
		<div class="name_input">
			Project Name
		</div> 
		: Project <?php echo $id = ( ! empty( $id ) ) ? $id : '' ; ?>
	</div>

	<div class="box_input">
		<div class="name_input">
			Detail Project
		</div> 	
		:  ทำการเขียนโปรแกรมด้วย PHP โดยสั่งงานให้หุ่นยนต์ทำการทำงานเก็บขยะ
	</div>

	<div class="box_input">
		<div class="name_input">
			Type Job 	
		</div>
		<ul style="padding-left: 8em;">
			<li>PHP</li>
			<li>Javascript</li>
			<li>MySQL</li>
		</ul>
	</div>


	<div class="box_input">
		<div class="name_input">
			Long-Term
		</div> 
		: 30 วัน
	</div>

	<div class="box_input">
		<div class="name_input">
			Price
		</div> 
		: 25,000 บาท
	</div>

	<div class="box_input">
		<div class="name_input">
			Contact 	
		</div>
		: 38 Petkasem Road; Phasicharoen; Bangkae Bangkok 10160; Thailand 
	</div>

	<div class="box_input">
		<div class="name_input">
			Phone
		</div> 
		: 0888888888
	</div>

	<div class="box_input">
		<div class="name_input">
			E-Mail
		</div> 
		: i@me.com
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