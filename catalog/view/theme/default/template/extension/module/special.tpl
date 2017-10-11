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

<section class="main-screen">
    <div class="main-screen-cont">
        <div class="container group">
            <div class="main-screen-tt-cont">
                <span class="main-screen-tt">лучшие ugg в москве</span>
                <span class="main-screen-ic"><i class="icon icon-uggy"></i></span>
                <div class="main-screen-sale"><span>Скидка <span>более 50%</span></span> ТОЛЬКО ДО <span
                        class="js-future-date">...</span></div>
            </div>
            <form class="main-screen-product">
                <input type="hidden" name="product_id" value="<?=$special_product['product_id']; ?>">
                <span class="img-main-screen-product">
                            <img src="<?=($special_product['thumb']); ?>" alt="<?=($product['name']); ?>">
                    <?php
                    $discount_price = intval(str_replace(',', '', $special_product['product_special_price']));
                    $old_price = intval(str_replace(',', '', $special_product['product_price']))
                    ?>
                    <span><?=intval(100-($discount_price*100)/$old_price);?>%</span>
                        </span>
                <div class="main-screen-product-cont">
                    <span class="tt-main-screen-product-cont"><?=$special_product['name'];?></span>
                    <?php if($product['special']): ?>
                        <span class="price-main-screen-product"><span><?=$special_product['product_special_price'];?></span> руб.</span>
                    <?php else: ?>
                        <span class="price-main-screen-product"><span><?=$special_product['product_price'];?></span> руб.</span>
                    <?php endif; ?>
                    <div class="size-main-screen-product">
                        <span>Размер (RUS)</span>
                        <?php foreach($special_product['options'] as $option): ?>
                            <?php if ($option['option_id'] == 14): ?>
                                <div>
                                    <?php $i = 1; foreach($option['product_option_value'] as $sizes): ?>
                                        <label class="js-size-label size-label js-btn-buy">
                                            <input class="js-size" type="radio" name="<?=$option['product_option_id']?>" value="<?=$sizes['product_option_value_id']?>" data-size="<?php echo $sizes['name']; ?>" id="mSize<?=$i;?>">
                                            <a><?=($sizes['name']);?></a>
                                        </label>
                                        <?php $i++; endforeach;?>
                                </div>
                            <?php endif;?>
                        <?php endforeach;?>
                    </div>
                    <a href="#" class="btn btn-lg btn-icon js-btn-buy js-btn-loading">
                        <span>купить сейчас</span>
                        <i class="icon"> › </i>
                    </a>
                </div>
            </form>
        </div>
    </div>
</section>