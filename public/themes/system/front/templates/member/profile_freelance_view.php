<h2 class="set-header-profile" >Profile Joney Loyas <?php echo $id = ( ! empty( $id ) ) ? $id : '' ; ?></h2>
<blockquote class="profile-freelance">

	<span>
		<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="http://fpoimg.com/150x150?text=Logo" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp" /></div>
	</span>	

	<br>

	<div class="box_input">
		<div class="name_input">
			Name
		</div> 
		: Joney
	</div>

	<div class="box_input">
		<div class="name_input">
			Last Name
		</div> 
		: Loyas
	</div>

	<div class="box_input">
		<div class="name_input">
			Address
		</div> 	
		:  38 Petkasem Road; Phasicharoen; Bangkae Bangkok 10160; Thailand 
	</div>

	<div class="box_input">
		<div class="name_input">
			Province 	
		</div>
		: กรุงเทพ
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



	<div class="box_input">
		<div class="name_input">
			Type Job
		</div> 
		<div style="display: inline-block;">
			: Web Programmer
		</div>
	</div>

	<div class="box_input">
		<div class="name_input">
			Other Skill
		</div> 	
		: php , javascript , mysql , Jquery
	</div>

	<div class="box_input">
		<div class="name_input">
			Other Detail
		</div> 	
		: -not-
	</div>


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