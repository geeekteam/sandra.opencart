<?php

$last_elem = end($breadcrumbs);

echo $header;

?>
<div class="container">
    <div class="reviews-page">
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
<?php echo $footer; ?>