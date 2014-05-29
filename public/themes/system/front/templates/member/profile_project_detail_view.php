<h2 class="set-header-profile" >Add Project <?php echo $id = ( ! empty( $id ) ) ? $id : '' ; ?></h2>
<blockquote class="profile-freelance page-add-project">

	<div class="box_input">
		<div class="name_input">
			Number Project 	
		</div>
		: <?php echo number_rand() ?>
	</div>

	<div class="box_input">
		<div class="name_input">
			Project Name
		</div> 
		<input class="span5" type="text" value="โปรแกรมการคำนวน">
	</div>

	<div class="box_input">
		<div class="name_input">
			Detail Project
		</div> 	
		<textarea class="span5" name="">ใช้ในการคำนวนการตกกระทบของลูกผลไม้</textarea>
	</div>

	<div class="box_input">
		<div class="name_input">
			Type Job 	
		</div>
		<span style="display: table; padding-left: 0em;">
			<input type="checkbox" checked="" >&nbsp; PHP <br>
			<input type="checkbox">&nbsp; Javascript <br>
			<input type="checkbox" checked="" >&nbsp; MySQL <br>
		</span>
	</div>


	<div class="box_input">
		<div class="name_input">
			Long-Term
		</div> 
		<input class="span5" type="text" value="30 วัน">
	</div>

	<div class="box_input">
		<div class="name_input">
			Price
		</div> 
		<input class="span5" type="text" value="25,000 บาท">
	</div>

	<div class="box_input">
		<div class="name_input">
			Contact 	
		</div>
		<textarea class="span5" name="">38 Petkasem Road; Phasicharoen; Bangkae Bangkok 10160; Thailand </textarea>
	</div>

	<div class="box_input">
		<div class="name_input">
			Phone
		</div> 
		<input class="span5" type="text" value="0888888888">
	</div>

	<div class="box_input">
		<div class="name_input">
			E-Mail
		</div> 
		<input class="span5" type="text" value="i@me.com">
	</div>


	<div class="box_input">
		<div class="name_input">
			&nbsp;
		</div> 
		<span class="btn" > แก้ไข </span>
	</div>



	<h3>รายชื่อผู้เข้าร่วม</h3>

	<hr style="border-color: rgb(149, 183, 201); border-width: 3px;">	

	<div class="box_input">
		<div class="name_input">
			คุณ
		</div> 
		: Josny ได้ลงชื่อขอทำงาน
	</div>

	<div class="box_input">
		<div class="name_input">
			รายละเอียด
		</div> 
		: ผมทำได้ครับ แต่ขอเงินเป็น 600000 ได้ไหมครับ
	</div>

	<div class="box_input">
		<div class="name_input">
			&nbsp;
		</div> 
		<span class="btn" >ตอบรับ</span>
	</div>

	<hr>

	<div class="box_input">
		<div class="name_input">
			คุณ
		</div> 
		: Josny ได้ลงชื่อขอทำงาน
	</div>

	<div class="box_input">
		<div class="name_input">
			รายละเอียด
		</div> 
		: ผมไม่ค่อยเก่ง php แต่อยากทำครับ
	</div>

	<div class="box_input">
		<div class="name_input">
			&nbsp;
		</div> 
		<span class="btn" >ตอบรับ</span>
	</div>

	<hr>

	<div class="box_input">
		<div class="name_input">
			คุณ
		</div> 
		: Josny ได้ลงชื่อขอทำงาน
	</div>

	<div class="box_input">
		<div class="name_input">
			รายละเอียด
		</div> 
		: ผมทำได้ครับ เพราะผมจบจากมหาวิทยาลัยสยาม !!
	</div>

	<div class="box_input">
		<div class="name_input">
			&nbsp;
		</div> 
		<span class="btn" >ตอบรับ</span>
	</div>

	<hr>	

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