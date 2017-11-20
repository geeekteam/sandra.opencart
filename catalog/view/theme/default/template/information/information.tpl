<?php

$last_elem = end($breadcrumbs);

echo $header;

?>

<div class="static-page">
    <div class="container">
        <div class="content-with-sidebar">
            <div class="sidebar fw-mr-25">
                <?=$column_left; ?>
            </div>
            <div class="content">
                <ul class="breadcrumbs">
                    <?php $i = 0; foreach ($breadcrumbs as $breadcrumb): ?>
                        <?php if ($i == 0):?>
                            <li class="breadcrumbs__item"><a class="breadcrumbs__item-link" href="/">Главная</a></li>
                        <?php elseif ($last_elem !== $breadcrumb): ?>
                            <li class="breadcrumbs__item"><a class="breadcrumbs__item-link" href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                        <?php elseif ($last_elem == $breadcrumb): ?>
                            <li class="breadcrumbs__item"><a class="breadcrumbs__item-link active"><?php echo $breadcrumb['text']; ?></a></li>
                        <?php endif;?>
                    <?php $i++; endforeach;?>
                </ul>
                <h1><?=$heading_title;?></h1>
                <?=$description; ?>
                <?=$content_bottom; ?>
            </div>
        </div>
    </div>
</div>


<?php echo $footer; ?>