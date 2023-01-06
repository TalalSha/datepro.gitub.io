<html lang="en">
<head>
<title>(404) The page you were looking for doesn't exist.</title>
<link rel="stylesheet" href="<?=base_url()?>assets/css/bootstrap.min.css?v-<?=$site_settings->site_version?>">
<link rel="stylesheet" href="<?=base_url()?>assets/css/app.min.css?v-<?=$site_settings->site_version?>">
<link rel="stylesheet" href="<?=base_url()?>assets/css/main.css?v-<?=$site_settings->site_version?>">
</head>
    <body class="page-body login-page login-form-fall">
    <main common 404>
    <section id="oops">
        <div class="logoDv">
            <a href="<?= site_url() ?>"><img src="<?=base_url('assets/images/logo.svg')?>" alt=""></a>
        </div>
        <div class="contain text-center">
            <div class="icon">404</div>
            <div class="inner">
                <h4>Page Not Found</h4>
                <p>Let's pretend ..... !! You never saw that. Go back to the Homepage to find out more.</p>
                <div class="bTn"><a href="<?= site_url() ?>" class="site_btn">Back to the website</a></div>
            </div>
        </div>
    </section>
    <!-- oops -->


</main>
       
    </body>
</html>