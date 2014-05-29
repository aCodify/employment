<h3>Register Principal</h3>
<blockquote>

<?php $attributes = array('class' => 'set_table', 'id' => 'set_table'); ?>
<?php echo form_open_multipart(current_url(),$attributes); ?>

	<span>
		<?php if ( !empty( $data->cover_img ) ): ?><br />
			<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="<?php echo $this->base_url.'public/'.$data->cover_img; ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp" /></div>
		<?php else: ?>
			<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="<?php echo $this->base_url.'public/images/no_image.png'; ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp" /></div>
		<?php endif ?>
	</span>	

	<span id="upload_img" href="#" class="btn btn-mini">เลือกรูปภาพ</span> <span class="text-input-icon"></span>

	<span id="status_expert" style="color:red;"></span>
	<span class="wait_loader" style="display:none;"> <img src="<?php echo base_url();?>public/images/icon_loading.gif" /></span>
	<div style="color:#999; margin:5px 0 5px 0;">ควรใช้รูปภาพขนาด 150 x 150 px</div>
	<input class="cover_img_name" type="hidden" name="cover_img" value="">
	<br>

	<div class="box_input">
		<div class="name_input">
			xxxx
		</div> 
		<input type="text" class="span3">
	</div>

	<div class="box_input">
		<div class="name_input">
			Name
		</div> 
		<input type="text" class="span3"> 
	</div>

	<div class="box_input">
		<div class="name_input">
			Last Name
		</div> 
		<input type="text" class="span3">
	</div>


	<div class="box_input">
		<div class="name_input">
			Address
		</div> 	
		<textarea rows="3" name="" class="span6" style="margin-bottom: 0;"></textarea>
	</div>

	<div class="box_input">
		<div class="name_input">
			Province 	
		</div>
		<select name="" id="" class="span2">
			<?php foreach ( $province as $key => $value ): ?>
				<option value="<?php echo $value->id ?>"><?php echo $value->name_province ?></option>
			<?php endforeach ?>
		</select>
	</div>

	<div class="box_input">
		<div class="name_input">
			Phone
		</div> 
		<input type="text" class="span3">
	</div>
	<div class="box_input">
		<div class="name_input">
			Fax
		</div> 
		<input type="text" class="span3">
	</div>

	<div class="box_input">
		<div class="name_input">
			E-Mail
		</div> 
		<input type="text" class="span3">
	</div>

	<div class="box_input">
		<div class="name_input">
			User Name
		</div> 
		<input type="text" class="span3">
	</div>

	<div class="box_input">
		<div class="name_input">
			Password
		</div> 
		<input type="password" class="span3">
	</div>

	<div class="box_input">
		<div class="name_input">
			Confirm Password
		</div> 
		<input type="password" class="span3">
	</div>

	<div class="box_input">
		<div class="name_input">
			Other Detail
		</div> 	
		<textarea rows="5" name="" class="span6" style="margin-bottom: 0;"></textarea>
	</div>

	<div class="box_input">
		<div class="name_input">
		&nbsp;
		</div> 	
		<button type="" class="btn">บันทึก </button>
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