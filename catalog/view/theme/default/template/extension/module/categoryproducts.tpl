<div class="main-content__products product-list">
    <div class="fw-mb-40 fw-flex fw-flex-bottom@m fw-flex-column@xs fw-flex-row@m fw-flex-top@xs">
        <h2 class="fw-fz-30@m fw-fz18@xs fw-text-uppercase fw-mt-0 fw-mb-0 fw-line-height-1"><?=$heading_title;?></h2>
        <a class="fw-ml-25@m fw-ml-0@xs fw-mt-0@m fw-mt-15@xs fw-color-orange fw-text-lowercase fw-fz-18@m fw-fz-14@xs fw-link-without-underline" href="<?=$category_href;?>">Смотреть все</a>
    </div>
    <div class="product-list-wrapper">
        <?php foreach ($products as $product):
        $options = $product['options'];
        $product_name = $product['name'];
        $product_price = str_replace(' ', ',',(str_replace('.00 р.', '', $product['price'])));
        if ($product['special']) {
            $product_special_price = str_replace(' ', ',' ,(str_replace('.00 р.', '', $product['special'])));
        };?>
            <div class="product__wrapper">
                <div class="product">
                    <a class="product__link" href="<?=$product['href'];?>">
                        <div class="product__discount">10%</div>
                        <div class="product__image-wrapper">
                            <img class="product__image" src="<?=$product['thumb'];?>" alt="">
                        </div>
                        <div class="fw-fz-16 fw-text-center"><?=$product['name'];?></div>
                        <div class="product__price">
                            <div class="fw-fz-14">
                                <span class="fw-fz-24 fw-color-orange fw-font-bold">3500</span> руб. /
                                <span class="fw-fz-18 fw-font-bold fw-text-line-through">3850</span>
                            </div>
                        </div>
                    </a>
                    <div class="product__button btn btn__in-cart js-open-popup" data-popup-target="cart">
                        <div class="main-banner-icon-cart"><img class="icon-cart svg svg_white" src="../images/icon-cart.svg" alt=""></div>
                        <span>В корзину</span>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>