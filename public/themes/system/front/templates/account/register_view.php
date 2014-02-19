<article class="general-page-container">
	
	<h1><?php echo lang('account_register'); ?> <?php $name_register = ( $this->input->get( 'type' ) == 2 ) ? "แบบ ฟรีแลนซ์" : 'แบบ ผู้ว่าจ้าง' ; ?></h1>

	<?php echo form_open( site_url( 'account/register?type='.$this->input->get( 'type' ) ) , array('class' => 'form-horizontal')); ?> 
		<div class="form-status-placeholder">
			<?php if (isset($form_status) && isset($form_status_message)) { ?> 
			<div class="alert alert-<?php echo $form_status; ?>"><button type="button" class="close" data-dismiss="alert">&times;</button><?php echo $form_status_message; ?></div>
			<?php } ?> 
		</div>

		<?php if (!isset($hide_register_form) || (isset($hide_register_form) && $hide_register_form == false)): ?> 
		<div class="page-account-register">
			
			<span>
				<?php if ( !empty( $show_data['account_avatar'] ) ): ?><br />
					<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="<?php echo $this->base_url.'public/upload/img_cover/'.$show_data['account_avatar']; ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp" /></div>
				<?php else: ?>
					<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="<?php echo $this->base_url.'public/images/no_image.png'; ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp" /></div>
				<?php endif ?>
			</span>	

			<span id="upload_img" href="#" class="btn btn-mini">เลือกรูปภาพ</span> <span class="text-input-icon"></span>

			<span id="status_expert" style="color:red;"></span>
			<span class="wait_loader" style="display:none;"> <img src="<?php echo base_url();?>public/images/icon_loading.gif" /></span>
			<div style="color:#999; margin:5px 0 5px 0;">ควรใช้รูปภาพขนาด 150 x 150 px</div>
			<input class="cover_img_name" type="hidden" name="account_avatar" value="<?php echo $account_avatar = ( ! empty( $show_data['account_avatar'] ) ) ? $show_data['account_avatar'] : '' ; ?>">
			<br>


			<div class="box_input">
				<div class="name_input">
					ชื่อผู้ใช้
				</div> 
				<input type="text" class="span3" name="account_username" value="<?php if (isset($show_data['account_username'])) {echo $show_data['account_username'];} ?>" maxlength="255" id="account_username" />
			</div>


			<div class="box_input">
				<div class="name_input">
					อีเมล์
				</div> 
				<input type="email" class="span3" name="account_email" value="<?php if (isset($account_email)) {echo $account_email;} ?>" maxlength="255" id="account_email" />
			</div>

			<div class="box_input">
				<div class="name_input">
					รหัสผ่าน
				</div> 
				<input type="password" class="span3" name="account_password" value="" maxlength="255" id="account_password" />
			</div>		

			<div class="box_input">
				<div class="name_input">
					ยืนยันรหัสผ่าน
				</div> 
				<input type="password" class="span3" name="account_confirm_password" value="" maxlength="255" id="account_confirm_password" />
			</div>			


			<hr>

			<div class="box_input">
				<div class="name_input">
					ชื่อ
				</div> 
				<input name="name" type="text" class="span3" value="<?php echo $retVal = ( ! empty( $show_data['name'] ) ) ? $show_data['name'] : '' ; ?>" > 
			</div>

			<div class="box_input">
				<div class="name_input">
					นามสกุล
				</div> 
				<input name="last_name" type="text" class="span3" value="<?php echo $retVal = ( ! empty( $show_data['last_name'] ) ) ? $show_data['last_name'] : '' ; ?>">
			</div>

			<div class="box_input">
				<div class="name_input">
					เลขประจำตัวประชาชน
				</div> 
				<input name="id_card" type="text" class="span3" value="<?php echo $retVal = ( ! empty( $show_data['id_card'] ) ) ? $show_data['id_card'] : '' ; ?>">
			</div>

			<div class="box_input">
				<div class="name_input">
					ที่อยู่
				</div> 	
				<textarea name="address" rows="3" name="" class="span6" style="margin-bottom: 0;"><?php echo $retVal = ( ! empty( $show_data['address'] ) ) ? $show_data['address'] : '' ; ?></textarea>
			</div>


			<?php if ( $this->input->get( 'type' ) == 2 ): ?>
			<div class="box_input">
				<div class="name_input">
					Google Map
				</div> 	
				<textarea name="google_code" rows="3" name="" class="span6" style="margin-bottom: 0;"><?php echo $retVal = ( ! empty( $show_data['google_code'] ) ) ? $show_data['google_code'] : '' ; ?></textarea>
			</div>	
			<?php endif ?>

			<div class="box_input">
				<div class="name_input">
					จังหวัด 	
				</div>
				<select name="province" id="" class="span2">
					<?php $select = ''; ?>
					<?php foreach ( $province as $key => $value ): ?>

						<?php 

						if ( ! empty( $show_data['province'] ) ) 
						{
							if ( $show_data['province'] == $value->id ) 
							{
								$select = 'selected';
							}
							else
							{
								$select = '';
							}
						}

						?>

						<option <?php echo $select ?> value="<?php echo $value->id ?>"><?php echo $value->name_province ?></option>
					<?php endforeach ?>
				</select>
			</div>

			<div class="box_input">
				<div class="name_input">
					เบอร์โทร
				</div> 
				<input name="phone" type="text" class="span3" value="<?php echo $retVal = ( ! empty( $show_data['phone'] ) ) ? $show_data['phone'] : '' ; ?>">
			</div>

			<?php if ( $this->input->get( 'type' ) == 1 ): ?>
				
			
			<div class="box_input">
				<div class="name_input">
					ความสามารถ
				</div> 
				<div style="display: inline-block;">
					<?php foreach ( $job as $key => $value ): ?>
						
						<label>
							<input type="checkbox" value="<?php echo $value->id ?>" name="name_job[]" > <?php echo $value->name_job ?>
						</label>

					<?php endforeach ?>
				</div>
			</div>

			<div class="box_input">
				<div class="name_input">
					ความสามารถอื่นๆ
				</div> 	
				<textarea rows="5" name="other_skill" class="span6" style="margin-bottom: 0;"><?php echo $retVal = ( ! empty( $show_data['other_skill'] ) ) ? $show_data['other_skill'] : '' ; ?></textarea>
			</div>

			<div class="box_input">
				<div class="name_input">
					ประสบการณ์
				</div> 	
				<textarea rows="5" name="experience" class="span6" style="margin-bottom: 0;"><?php echo $retVal = ( ! empty( $show_data['experience'] ) ) ? $show_data['experience'] : '' ; ?></textarea>
			</div>

			<?php endif ?>
			
			<div class="control-group">
				<?php if ($plugin_captcha != null) {
					echo $plugin_captcha;
				} else { ?> 
				<label style="width: auto;" class="control-label captcha-field" for="captcha">
					Captcha
				</label>
				<div class="controls">
					<img src="<?php echo $this->base_url; ?>public/images/securimage_show.php" alt="securimage" class="captcha" />
					<a href="#" onclick="$('.captcha').attr('src', '<?php echo $this->base_url; ?>public/images/securimage_show.php?' + Math.random()); return false" tabindex="-1"><img src="<?php echo $this->base_url; ?>public/images/reload.gif" alt="" /></a>
					<div>
						<input type="text" name="captcha" value="<?php if (isset($captcha)) {echo $captcha;} ?>" class="input-captcha" autocomplete="off" id="captcha" />
					</div>
				</div>
				<?php } ?> 
			</div>

			<?php echo $this->modules_plug->do_filter('account_register_form_bottom'); ?> 
			
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn btn-primary"><?php echo lang('account_register'); ?></button> 
					<?php //if ($this->config_model->loadSingle('member_verification') == '1') {echo anchor('account/resend-activate', lang('account_not_get_verify_email'));} ?>
				</div>
			</div>
			
		</div>
		<?php endif; ?> 
	<?php echo form_close(); ?> 
	
</article>




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