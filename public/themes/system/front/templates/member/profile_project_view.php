<?php $account_data = $this->account_model->get_account_cookie( 'member' ) ?>

<?php 
if ( ! empty( $account_data ) ) 
{
	$this->db->where( 'account_id', $account_data['id'] );
	$query = $this->db->get( 'accounts' );
	$account_data = $query->row();

	$this->db->where( 'id_account', $account_data->account_id );
	$query = $this->db->get( 'job_ref_account' );
	$account_job = $query->result();

}
?>

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
		<ul style="padding-left: 10em;">

			<?php  $ok_job = false;  ?>

			<?php foreach ( $data_job as $key => $value ): ?>

				<li><?php echo $value->name_job ?></li>


				<?php if ( ! empty( $account_data ) ): ?>
						
					<?php if ( ! empty( $account_job ) ): ?>
						
							<?php foreach ( $account_job as $key_job => $value_job ): ?>
								
								<?php if ( $value_job->id_job == $value->id ): ?>

									 <?php  $ok_job = true;  ?>

								<?php endif ?>
								

							<?php endforeach ?>
	

					<?php endif ?>

				<?php endif ?>


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
	
	<?php if ( ! empty( $account_data ) AND $ok_job ): ?>

	<?php echo form_open('', ''); ?>

	<div class="box_input">
		<div class="name_input">
			ลงทะเบียนเข้าร่วมการทำงาน
		</div> 
		<textarea placeholder="รายละเอียด" name="detail" rows="4"></textarea>
		<br>
		<div class="name_input">
			เสนอราคา
		</div> 
		<input class="span3" type="text" name="price" placeholder="เสนอราคา">
		<br>
		<br>
		<div class="name_input">
			&nbsp;
		</div> 

		<button class="btn" >ลงชื่อ</button>
	</div>

	<?php echo form_close(); ?>
		
	<?php else: ?>
		
		<span> Job ของคุณไม่อนุญาติให้เข้ารวม project นี้ </span>

	<?php endif ?>


	<hr style="border-color: rgb(149, 183, 201); border-width: 3px;">	

	<?php foreach ( $project_log_price as $key => $value ): ?>
		
	<div class="box_input">
		<div class="name_input"  style="width: 3em;" >
			คุณ
		</div> 
		: <?php echo $value->name_account ?> ได้ลงชื่อขอทำงาน

		<?php if ( $this_project ): ?>
			<br>
			รายละเอียด : <?php echo $value->detail ?> ( เสนอราคา <?php echo $value->price ?> )

		<?php endif ?>



	</div>

	<?php endforeach ?>

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