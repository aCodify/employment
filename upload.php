<?php 

	$info = !empty( $_GET['info'] ) ? $_GET['info'] : 'img_cover';

	//upload images
	require_once( 'application/libraries/phpthumb/ThumbLib.inc.php' );			
	//--- change name -------------------
	$file_name = explode('.',$_FILES['uploadfile']['name']);
	$md = md5( $_FILES['uploadfile']['name'] . uniqid( time() ) );  
	$filename = $md.'.'.$file_name[1];  
	
	$uploaddir = 'public/upload/'.$info.'/';   //path name save
	$file = $uploaddir . $filename;	
			 
	if (move_uploaded_file($_FILES['uploadfile']['tmp_name'], $file)) 
	{ 
	
		$thumb = PhpThumbFactory::create( $uploaddir.$filename );
		
		if ($info == 'img_cover') {
			$thumb->adaptiveResize( 150,150 );
		} else {
			$thumb->adaptiveResize( 100,100 );
		}

		$thumb->save( $uploaddir.'mid-'.$filename );
		if (file_exists($file)) {
			unlink($file);
		}
		
		$name_filemid = 'mid-'.$filename;			
	}  


	$object = new stdClass();
	$object->name_img = $filename;
	$object->name_filemid = $name_filemid ;


	echo json_encode( $object );


?>


