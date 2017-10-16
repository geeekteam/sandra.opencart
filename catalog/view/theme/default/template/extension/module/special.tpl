<?php
$special_product = null;
?>

<?php foreach ($products as $key=>$product): ?>
    <?php
    foreach ($product['options'] as $option):
        if (($option['option_id'] == 17)):

            $special_product = $product;

            $special_product['options'] = $product['options'];
            $product_name = $product['name'];
            $special_product['product_price'] = str_replace(' ', ',',(str_replace('.00 р.', '', $product['price'])));
            if ($product['special']):
                $special_product['product_special_price'] = str_replace(' ', ',' ,(str_replace('.00 р.', '', $product['special'])));
            endif;
            break;
        endif;
    endforeach;
    if ($special_product != null) break;
endforeach; ?>

<div class="main-banner" style="background-image: url('../images/main-banner.jpg');">
    <div class="container">
        <div class="top-product">
            <div class="top-product__image-wrapper">
                <img class="top-product__image" src="<?=($special_product['thumb']); ?>" alt="<?=($product['name']); ?>">
            </div>
            <div class="top-product__buying product-buying">
                <div class="product-buying__name"><?=$special_product['name'];?></div>
                <?php foreach($special_product['options'] as $options): ?>
                    <?php if ($options['name'] == 'Объём') : ?>
                        <?php foreach ($options['product_option_value'] as $volume) : ?>
                            <div class="product-buying__option">
                                <div class="product-buying__option-name">
                                    <span class="fw-font-bold"><?=round($volume['price']); ?> тг.</span>
                                    <span class="fw-fz-14">Объём: <?=$volume['name']; ?></span>
                                </div>
                                <div class="product-buying__option-count">
                                    <div class="fw-flex jqs-product-count">
                                        <span class="product-buying__count-minus jqs-product-count-minus">-</span>
                                        <input class="product-buying__count jqs-product-count-input" value="0" type="text" placeholder="0">
                                        <span class="product-buying__count-plus jqs-product-count-plus">+</span>
                                    </div>
                                    <span class="fw-color-white fw-fz-14">В наличии</span>
                                </div>
                                <div class="btn btn__in-cart">
                                    <div class="fw-mr-7"><i class="icon-cart-white"></i></div>
                                    <span>В корзину</span>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    <?php endif; ?>
                <?php endforeach; ?>
            </div>
            <div class="main-banner__slogan">
                <h1 class="main-banner__slogan-title"><b>Лучшие духи 2017</b></h1>
                <div class="main-banner-icon">
                    <img class="main-banner-icon__parfume svg svg_white" src="images/icon-parfume.svg" alt="">
                </div>
            </div>
        </div>
    </div>
</div>