<?php
$special_product = null;
$volume_array = [];

foreach ($products as $key=>$product):
    foreach ($product['options'] as $option):
        if (($option['option_id'] == 17)):
            $special_product = $product;
            $special_product['options'] = $product['options'];
            $product_name = $product['name'];
            $special_product['product_price'] = str_replace(' ', ' ',(str_replace('.00 р.', '', $product['price'])));
            if ($product['special']):
                $special_product['product_special_price'] = str_replace(' ', ' ' ,(str_replace('.00 р.', '', $product['special'])));
            endif;
            break;
        endif;

        if ($option['option_id'] == 14) :
            asort($option['product_option_value']);
            $product_option_id = $option['product_option_id'];
            foreach($option['product_option_value'] as $key => $optionValue) :
                $volume_array[$key] = [
                    'volume_value' => $optionValue['product_option_value_id'],
                    'volume_name' => $optionValue['name'],
                    'volume_price' => intval(str_replace(' ', '',(str_replace('.0000', '', $optionValue['price']))))
                ];
            endforeach;
        endif;
    endforeach;
    if ($special_product != null) break;
endforeach;

?>

<div class="main-banner" style="background-image: url('../images/main-banner.jpg');">
    <div class="container">
        <form class="top-product">
            <input type="hidden" name="product_id" value="<?=$special_product['product_id']; ?>">
            <div class="top-product__image-wrapper">
                <img class="top-product__image" src="<?=($special_product['thumb']); ?>" alt="<?=($product['name']); ?>">
            </div>
                <?php if (count($volume_array) > 0) : ?>
                    <div class="top-product__buying product-buying">
                        <div class="product-buying__name"><?=$special_product['name'];?></div>
                        <?php foreach ($volume_array as $volume) : ?>
                            <div class="product-buying__option js-product-buying-option">
                                <div class="product-buying__option-name">
                                    <span class="fw-font-bold"><?=round($volume['volume_price']); ?> тг.</span>
                                    <span class="fw-fz-14">Объём: <?=$volume['volume_name']; ?></span>
                                </div>
                                <div class="product-buying__option-count">
                                    <div class="fw-flex jqs-product-count">
                                        <span class="product-buying__count-minus jqs-product-count-minus">-</span>
                                        <input class="product-buying__count js-item-count" value="1" type="text" placeholder="1">
                                        <span class="product-buying__count-plus jqs-product-count-plus">+</span>
                                    </div>
                                    <span class="fw-color-white fw-fz-14">В наличии</span>
                                </div>
                                <label class="btn btn__in-cart js-open-popup js-btn-buy js-btn-loading" data-popup-target="cart">
                                    <input type="radio"
                                           class="js-select-volume display-none"
                                           name="<?=$product_option_id;?>"
                                           data-volume-price="<?php echo $volume['volume_price'] ?>"
                                           value="<?=$volume['volume_value']?>">
                                    <div class="fw-mr-7"><i class="icon-cart-white"></i></div>
                                    <span>В корзину</span>
                                </label>
                            </div>
                        <?php endforeach; ?>
                    </div>
                <?php else: ?>
                    <div class="top-product__buying product-buying top-product__buying_without-volume">
                        <div class="product-buying__name"><?=$special_product['name'];?></div>
                        <div class="product-buying__option">
                            <div class="product-buying__option-name">
                                <span class="fw-font-bold"><?=$special_product['product_price']; ?> <span class="fw-fz-24">тг.</span></span>
                            </div>
                            <div class="product-buying__option-count">
                                <div class="fw-flex jqs-product-count">
                                    <span class="product-buying__count-minus jqs-product-count-minus">-</span>
                                    <input class="product-buying__count js-item-count" value="1" type="text" placeholder="1">
                                    <span class="product-buying__count-plus jqs-product-count-plus">+</span>
                                </div>
                            </div>
                            <div class="btn btn__in-cart js-open-popup js-btn-buy js-btn-loading" data-popup-target="cart">
                                <div class="main-banner-icon-cart"><img class="icon-cart svg svg_white" src="../images/icon-cart.svg" alt=""></div>
                                <span>В корзину</span>
                            </div>
                        </div>
                    </div>
                <?php endif; ?>
            <div class="main-banner__slogan">
                <h1 class="main-banner__slogan-title"><b>Лучшие духи 2017</b></h1>
                <div class="main-banner-icon">
                    <img class="main-banner-icon__parfume svg svg_white" src="images/icon-parfume.svg" alt="">
                </div>
            </div>
        </form>
    </div>
</div>