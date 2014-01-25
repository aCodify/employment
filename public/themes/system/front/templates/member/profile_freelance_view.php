<h2 class="set-header-profile" >Profile <?php echo $show_data->name . ' ' .$show_data->last_name ?></h2>
<blockquote class="profile-freelance">

	<span>
		<div class="account-avatar-wrap border-shop-img2"><img style="max-width: 10em;" src="<?php echo base_url( 'public/upload/img_cover/'.$show_data->account_avatar ) ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit cover-img-tmp" /></div>
	</span>	
	<br>

	<div class="box_input">
		<div class="name_input">
			ชื่อ
		</div> 
		: <?php echo $show_data->name ?>
	</div>

	<div class="box_input">
		<div class="name_input">
			นามสกุล
		</div> 
		: <?php echo $show_data->last_name ?>
	</div>

	<div class="box_input">
		<div class="name_input">
			ที่อยู่
		</div> 	
		:  <?php echo $show_data->address ?>
	</div>

	<div class="box_input">
		<div class="name_input">
			Province 	
		</div>
		<?php  

		$this->db->where( 'id', $show_data->province );
		$query = $this->db->get( 'province' );
		$data_province = $query->row();


		?>
	

		: <?php echo $data_province->name_province ?>
	</div>

	<div class="box_input">
		<div class="name_input">
			เบอร์โทร
		</div> 
		: <?php echo $show_data->phone ?>
	</div>

	<div class="box_input">
		<div class="name_input">
			อีเมล์
		</div> 
		: <?php echo $show_data->account_email ?>
	</div>



	<div class="box_input">
		<div class="name_input">
			ความสามารถ
		</div> 
		<div style="display: inline-block;">
			: <?php echo $job ?>
		</div>
	</div>

	<div class="box_input">
		<div class="name_input">
			ความสามารถอื่นๆ
		</div> 	
		: <?php echo $show_data->other_skill ?>
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