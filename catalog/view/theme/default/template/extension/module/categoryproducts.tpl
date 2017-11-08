<div class="main-content__products product-list">
    <div class="fw-mb-40 fw-flex fw-flex-bottom@m fw-flex-column@xs fw-flex-row@m fw-flex-top@xs">
        <h2 class="fw-fz-30@m fw-fz18@xs fw-text-uppercase fw-mt-0 fw-mb-0 fw-line-height-1"><?=$heading_title;?></h2>
        <a class="fw-ml-25@m fw-ml-0@xs fw-mt-0@m fw-mt-15@xs fw-color-orange fw-text-lowercase fw-fz-18@m fw-fz-14@xs fw-link-without-underline" href="<?=$category_href;?>">Смотреть все</a>
    </div>
    <div class="product-list-wrapper">
        <?php foreach ($products as $product): ?>
            <?php
                $options = $product['options'];
                $product_name = $product['name'];
                $product_price = intval(str_replace(' ', '',(str_replace('.00 р.', '', $product['price']))));
                if ($product['special']) {
                    $product_special_price = intval(str_replace(' ', '' ,(str_replace('.00 р.', '', $product['special']))));
                };
                $discount = intval(100-($product_special_price * 100 / $product_price));
                $i=0;
                foreach ($product['options'] as $options) :
                    if($options['name'] == 'Объём'):
                        foreach ($options['product_option_value'] as $option):
                            $volumes[$i] = $option;
                            $i++;
                        endforeach;
                        asort($volumes);
                    endif;
                endforeach;
            ?>
            <div class="product__wrapper">
                <form action="#" class="product js-product">
                    <input type="hidden" name="product_id" value="<?=$product['product_id']; ?>">
                    <a class="product__link" href="<?=$product['href'];?>">
                        <?php if ($product['special']) : ?>
                            <div class="product__discount"><?php echo $discount; ?>%</div>
                        <?php endif; ?>
                        <div class="product__image-wrapper">
                            <img class="product__image" src="<?=$product['thumb'];?>" alt="">
                        </div>
                        <div class="fw-fz-16 fw-text-center"><?=$product['name'];?></div>
                        <div class="product__price">
                            <div class="fw-fz-14">
                                <?php if (count($volumes) > 0) : ?>
                                    <?php foreach($product['options'] as $option): ?>
                                        <?php if ($option['option_id'] == 14): ?>
                                            <?php asort($option['product_option_value']); ?>
                                            <?php $i = 1; ?>
                                            <?php foreach($option['product_option_value'] as $volumes): ?>
                                                <?php if ($i == 1) : ?>
                                                    <?php $volume_price = intval(str_replace(' ', '',(str_replace('.0000', '', $volumes['price'])))); ?>
                                                    <span class="fw-fz-24 fw-color-orange fw-font-bold js-volume-price"><?php echo $volume_price ?></span> тг.
                                                    <?php $i++; ?>
                                                <?php endif; ?>
                                            <?php endforeach; ?>
                                        <?php endif; ?>
                                    <?php endforeach; ?>
                                <?php else: ?>
                                    <?php if ($product['special']) : ?>
                                        <span class="fw-fz-24 fw-color-orange fw-font-bold"><?php echo $product_price ?></span> тг. /
                                        <span class="fw-fz-18 fw-font-bold fw-text-line-through"><?php echo $product_special_price ?></span>
                                    <?php else : ?>
                                        <span class="fw-fz-24 fw-color-orange fw-font-bold"><?php echo $product_price ?></span> тг.
                                    <?php endif; ?>
                                <?php endif; ?>
                            </div>
                        </div>
                    </a>

                    <?php foreach($product['options'] as $option): ?>
                        <?php if ($option['option_id'] == 14): ?>
                            <ul class="product__options">
                                <?php asort($option['product_option_value']); $i = 1; foreach($option['product_option_value'] as $volumes): ?>
                                    <?php $volume_price = intval(str_replace(' ', '',(str_replace('.0000', '', $volumes['price'])))); ?>
                                    <li class="product__options-item">
                                        <label class="product__options-item-radio">
                                            <input
                                                <?php if ($i == 1) : ?>
                                                    checked
                                                <?php $i++; endif; ?>
                                                id="volume-<?=$i;?>"
                                                class="js-select-volume"
                                                type="radio"
                                                name="<?=$option['product_option_id']?>"
                                                value="<?=$volumes['product_option_value_id']?>"
                                                data-volume="<?php echo $volumes['name']; ?>"
                                                data-volume-price="<?=$volume_price;?>"
                                            >
                                            <span><?=($volumes['name']);?></span>
                                        </label>
                                    </li>
                                <?php $i++; endforeach;?>
                            </ul>
                        <?php endif;?>
                    <?php endforeach;?>

                    <div class="product__button btn btn__in-cart js-open-popup js-btn-buy js-btn-loading" data-popup-target="cart">
                        <div class="main-banner-icon-cart"><img class="icon-cart svg svg_white" src="../images/icon-cart.svg" alt="В корзину"></div>
                        <span>В корзину</span>
                    </div>
                </form>
            </div>
        <?php endforeach; ?>
    </div>
</div>