<?php

$last_elem = end($breadcrumbs);

echo $header;

?>

<div id="middle">

    <section class="section-inner">
        <div class="container group">
            <div class="aside hidden-devices">
                <?=$column_left; ?>
            </div>
            <div class="content">
                <ul class="bread-crumbs hidden-devices">
                    <?php $i = 0; foreach ($breadcrumbs as $breadcrumb): ?>
                        <?php if ($i == 0):?>
                            <li><a href="/">Главная</a></li>
                        <?php elseif ($last_elem !== $breadcrumb): ?>
                            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                        <?php elseif ($last_elem == $breadcrumb): ?>
                            <li><?php echo $breadcrumb['text']; ?></li>
                        <?php endif;?>
                    <?php $i++; endforeach;?>
                </ul>
                <h1><?=$heading_title;?></h1>
                <div class="mb30">
                    <?php echo $description; ?>
                </div>
                <?=$content_bottom; ?>
            </div>
        </div>
    </section>

</div>


<?php echo $footer; ?>