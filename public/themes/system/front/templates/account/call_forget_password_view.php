<h3>Forget Password</h3>
<blockquote>
	<?php if ( ! empty( $success ) ): ?>
		<span style="padding: 5px; display: block; text-align: center; background-color: rgb(236, 255, 234); margin: 13px 0px;" ><?php echo $success ?></span>
	<?php endif ?>
	<?php echo form_open('', ''); ?>
	<div class="box_input">
		<div class="name_input">
			E-Mail 
		</div> 
		<input name="email" type="text" class="span4" placeholder='example@me.com'> 
	</div>
	<button type="submit"> Sent </button>
	<?php echo form_close(); ?>

</blockquote>