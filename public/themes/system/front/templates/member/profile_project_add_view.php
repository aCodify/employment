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
		<input class="span5" type="text">
	</div>

	<div class="box_input">
		<div class="name_input">
			Detail Project
		</div> 	
		<textarea class="span5" name=""></textarea>
	</div>

	<div class="box_input">
		<div class="name_input">
			Type Job 	
		</div>
		<span style="display: table; padding-left: 0em;">
			<input type="checkbox">&nbsp; PHP <br>
			<input type="checkbox">&nbsp; Javascript <br>
			<input type="checkbox">&nbsp; MySQL <br>
		</span>
	</div>


	<div class="box_input">
		<div class="name_input">
			Long-Term
		</div> 
		<input class="span5" type="text">
	</div>

	<div class="box_input">
		<div class="name_input">
			Price
		</div> 
		<input class="span5" type="text">
	</div>

	<div class="box_input">
		<div class="name_input">
			Contact 	
		</div>
		<textarea class="span5" name=""></textarea>
	</div>

	<div class="box_input">
		<div class="name_input">
			Phone
		</div> 
		<input class="span5" type="text">
	</div>

	<div class="box_input">
		<div class="name_input">
			E-Mail
		</div> 
		<input class="span5" type="text">
	</div>


	<div class="box_input">
		<div class="name_input">
			&nbsp;
		</div> 
		<span class="btn" > บันทึก </span>
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