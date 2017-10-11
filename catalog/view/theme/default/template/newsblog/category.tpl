<?php

$last_elem = end($breadcrumbs);

echo $header;

?>
<div id="middle">
    <section class="section-inner">
        <div class="container">
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
            <div class="reviews-page">
                <h1 class="reviews-page__title"><?=$heading_title; ?></h1>
                <div class="reviews-page-items">
                    <?php foreach($articles as $article): ?>
                        <div class="reviews-page__item">
                            <div class="reviews-page__left-column">
                                <img class="reviews-page__author-image" src="<?=$article['thumb']; ?>">
                            </div>
                            <div class="reviews-page__right-column">
                                <div class="reviews-page__author-name"><?=$article['name']; ?></div>
                                <div class="reviews-page__text">
                                    <?=$article['preview']; ?>
                                </div>
                            </div>
                        </div>
                    <?php endforeach;?>
                </div>
            </div>
        </div>
    </section>
</div>
<?php echo $footer; ?>