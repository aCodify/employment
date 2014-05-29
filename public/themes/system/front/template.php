<!DOCTYPE html>
<html lang="en" class="">
    <head>
        <title>Freelance World</title>
        <meta charset="utf-8" />
        <meta name="keywords" content="Employment" />
        <meta name="description" content="Employment" />

        <!--[if IE]>
        <style type="text/css">
        .group {
        display: block;
        zoom: 1;
        }
        </style>
        <![endif]-->
        <!--[if lt IE 9]>
        <script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

        <!--  main js -->
        <script type="text/javascript" src="<?php echo $this->theme_path; ?>share-js/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo $this->theme_path; ?>share-js/jquery-ui/jquery-ui.min.js"></script>

        <!-- main style -->
        <link rel="stylesheet" type="text/css" href="<?php echo $this->theme_path; ?>share-js/jquery-ui/css/smoothness/jquery-ui.css" />        
        <link rel="stylesheet" type="text/css" href="<?php echo $this->theme_path; ?>share-css/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo $this->theme_path; ?>share-css/bootstrap/css/bootstrap-responsive.min.css" />
        <script type="text/javascript" src="<?php echo $this->theme_path; ?>share-css/bootstrap/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="<?php echo $this->theme_path; ?>share-css/style_snipt.css" /> 
        <link rel="stylesheet" type="text/css" href="<?php echo $this->theme_path; ?>share-css/style_less.css" /> 


        <script type="text/javascript" src="<?php echo $this->theme_path; ?>share-js/ajaxupload.js"></script>

        <script type="text/javascript" src="<?php echo $this->theme_path; ?>share-css/pace/pace.js"></script>
        <link rel="stylesheet" href="<?php echo $this->theme_path; ?>share-css/pace/pace.css" >
        
        <!-- snipt.com js -->
        <script type="text/javascript" src="<?php echo $this->theme_path; ?>share-js/snipt.js"></script>

        <!--[Start Scroll to top]  -->

        <script src="<?php echo $this->theme_path; ?>share-js/totop.js"></script>  


        <script type="text/javascript" src="<?php echo $this->theme_path; ?>share-js/dataTable.js"></script>

        <script type = "text/javascript">
            $(document).ready(function(){

                $("#totop").Totop(
                                    options =   {
                                                    scrolltime:500,
                                                    image:"<?php echo base_url(); ?>public/images/up4.png"
                                                }
                );

            });
        </script>

        <!--[End Scroll to top]    -->

        <!-- script run in page -->
        <script type="text/javascript" charset="utf-8">

            jQuery(document).ready(function($) 
            {
                $('a,span,p,.bar,input').tooltip();
            });

        </script>
    </head>
    <body class="detail" id='body-employment'>
        <div id = "totop"></div>
        <div class="frame">
            <div class="left-y ruler"></div>
            <div class="right-y ruler"></div>
            
            <header class="main">
                <a href="/" class="logo">
                    <span data-placement="bottom" title='' class="avatar" style="background-image: url('<?php echo base_url("public/images/bird01.jpg"); ?>');"></span>
                </a>
                <div class="bio">
                    <a class="name" href="<?php echo site_url() ?>" >
                    
                     เว็บไซต์จัดหางานอิสระ
                    
                    </a>
                </div>
            </header>
            
            <section class="main group">
                <section class="content group">
                    <article class="group detail">
                        <div class="gutter">
                            <a data-placement="left" title='To day..'  class="detail cursor_pointer">
                                <time pubdate datetime="2013-06-26T14:04:00-04:00">
                                    <span class="id">
                                        Welcome
                                    </span>
                                    <span class="mon-day">
                                        <?php echo date( 'M d' ) ?>                                  
                                    </span>
                                    <span class="year"><?php echo date( 'Y' ) ?></span>
                                </time>
                            </a>
                        </div>
                        
                        <div class="content-inner">
                            <h1><a title='Hello World' data-placement="right"  href="#">WELCOME TO FREELANCE WORLD</a></h1>
                            <div class="post-content autumn">
                 
                                <div class="markdown">

                                    

                                    <?php echo $page_content; ?> 
                                  
    
        
                                    <!-- FOOTER -->
                                    <div class="end_footer"></div>
                                    <br>
                                    <p class="rights_reserved">
                                        <a href="<?php echo site_url() ?>">HOME </a> |
                                        <a href="<?php echo site_url( 'index/freelance' ) ?>"> FREELANCE LIST </a> |
                                        <a href="<?php echo site_url( 'index/principal' ) ?>">PROJECT LIST </a> 
                                        | © 2012-2013, All Rights Reserved.
                                    </p>


                                </div>
                                <div id="disqus_thread"></div>
                            </div>
                        </div>
                    </article>
                </section>
                <aside class="main">

                    <?php $info = $this->account_model->get_account_cookie( 'member' ) ?>

                    <?php if ( ! empty( $info ) ): ?>
                        <?php $data_account = $this->account_model->get_account_data( $info['id'] ) ?>
                        <section class="module snipts">
                            <h1><span class="icon-user"></span> Data Account</h1>
                            <p style="margin-bottom: 12px;" >
                                <span class="icon-circle-arrow-right"></span>
                                <span class='set_name' >&nbsp;Name  : </span>
                                <a href="<?php echo site_url( 'index/edit_account' ) ?>">
                                    <span><?php echo $data_account->name . ' ' .$data_account->last_name ?></span>
                                </a> 

                                <?php if ( $data_account->type == 2 ): ?>
                                <br>
                                <span class="icon-circle-arrow-right"></span>   
                                <span class='set_name' >&nbsp;จัดการ  : </span>
                                <a href="<?php echo site_url( 'index/project' ) ?>">
                                    <span>Project </span>
                                </a>    
                                <?php endif ?>
                                    
                            </p>
            
                            <p style="margin-bottom: 4px;" >
                                <span class="icon-circle-arrow-right"></span>
                                &nbsp;<a href="<?php echo site_url( 'account/logout' ) ?>">Logout</a>
                            </p>
                        </section>
                    <?php else: ?>
                        <?php echo form_open( site_url( 'account/login' ) , array('class' => 'form-horizontal')); ?> 
                        <section class="module snipts">
                            <h1><span class="icon-user"></span> Login</h1>
                            <p style="margin-bottom: 12px;" >
                                <span class="icon-circle-arrow-right"></span>
                                <span class='set_name' >&nbsp;USER : </span>
                                <input name="account_username" data-placement="right" title='Please enter username' placeholder='username' type="text" class="span2 login">
                            </p>
                            <p style="margin-bottom: 12px;" >
                                <span class="icon-circle-arrow-right"></span>
                                <span class='set_name' >&nbsp;PASS : </span>
                                <input name="account_password" data-placement="right" title='Please enter password' placeholder='password' type="password" class="span2 login">
                            </p>

                            <p style="margin-bottom: 12px;" >
                                <!-- <span class="icon-circle-arrow-right"></span> -->
                                <span class='set_name' >&nbsp;</span>
                                <button class="over_login">Login</button>
                            </p>
                            

                            <p style="margin-bottom: 4px;" >
                                <span class="icon-circle-arrow-right"></span>
                                &nbsp;<a href="<?php echo site_url( 'index/forget_password' ) ?>">Forget Password </a> , <a href="<?php echo site_url( 'index/register' ) ?>">Register</a>
                            </p>

                        </section>
                        <?php echo form_close(); ?> 
                    <?php endif ?>
                    <hr>
                    <section class="module snipts">
                        <h1><span class="icon-bookmark"></span> Menu</h1>
                        <ul>
                            <li><a href="<?php echo site_url() ?>">Home</a></li>
                            <li><a href="<?php echo site_url( 'index/freelance' ) ?>">Freelance List</a></li>
                            <li><a href="<?php echo site_url( 'index/principal' ) ?>">Project List</a></li>
                        </ul>
                       <!--  <h1><span class="icon-bookmark"></span> เมนูสำหรับ ผู้จ้างงาน ( แสดงก็ต่อเมื่อ login แบบผู้จ้างงาน )</h1>
                        <ul>
                            <li><a href="<?php echo site_url( 'index/member/view_project' ) ?>">View Project For member ผู้จ้างงาน</a></li>
                        </ul> -->
                    </section>
                </aside>
            </section>
        </div>

        
    
    </body>
</html>
