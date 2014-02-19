<h2 class="set-header-profile" >Add Project <?php echo $id = ( ! empty( $id ) ) ? $id : '' ; ?></h2>
<blockquote class="profile-freelance page-add-project">

	<?php echo form_open_multipart('', array('class' => 'form-horizontal')); ?> 
		<?php if (isset($form_status) && isset($form_status_message)) { ?> 
		<div class="alert alert-<?php echo $form_status; ?>"><button type="button" class="close" data-dismiss="alert">&times;</button><?php echo $form_status_message; ?></div>
		<?php } ?> 

			<div class="box_input">
				<div class="name_input">
					Number Project 	
				</div>
				: <?php echo $number_rand = number_rand() ?>
				<input type="hidden" name="project_code" value="<?php echo $number_rand ?>">
			</div>

			<div class="box_input">
				<div class="name_input">
					ชื่อโปรเจค
				</div> 
				<input class="span5" type="text" name="project_name">
			</div>

			<div class="box_input">
				<div class="name_input">
					เนื้อหาโปรเจค
				</div> 	
				<textarea class="span5" name="project_detail"></textarea>
			</div>

			<div class="box_input">
				<div class="name_input">
					ความสามารถในการทำงาน 	
				</div>
				<span style="display: table; padding-left: 0em;">
					<?php foreach ( $job as $key => $value ): ?>
						<input name="name_job[]" value="<?php echo $value->id ?>" type="checkbox">&nbsp; <?php echo $value->name_job ?> <br>
					<?php endforeach ?>
				</span>
			</div>

			<div class="box_input">
				<div class="name_input">
					ระยะเวลาในการทำงาน
				</div> 
				<input class="span5" type="text" name="long_term">
			</div>

			<div class="box_input">
				<div class="name_input">
					ระยะเวลาการแสดง
				</div> 
				<input class="span5" type="text" name="long_term">
			</div>

			<div class="box_input">
				<div class="name_input">
					ราคา
				</div> 
				<input class="span5" type="text" name="price">
			</div>

			<div class="box_input">
				<div class="name_input">
					&nbsp;
				</div> 
				<button class="btn" > บันทึก </button>
			</div>

	<?php echo form_close(); ?>


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