<?php

$last_elem = end($breadcrumbs);

$protocol = strtolower(substr($_SERVER["SERVER_PROTOCOL"],0,strpos( $_SERVER["SERVER_PROTOCOL"],'/'))).'://';
$actual_link = "$protocol$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";

echo $header;

?>

    <div class="catalog-page">
        <div class="container">
            <div class="catalog">
                <div class="sidebar">
                    <div class="catalog__image-wrapper">
                        <img src="<?=$thumb;?>" alt="<?=$heading_title;?>" class="catalog__image">
                    </div>
                    <div class="catalog__categories">
						<ul class="catalog-categories">
                            <?php foreach ($all_categories as $i => $category): ?>
                                <?php if ($actual_link == $category['category_href']): ?>
                                    <li class="catalog-categories__item">
                                        <a class="catalog-categories__item-link active">
                                            <?=$category['category_name']; ?>
                                        </a>
                                    </li>
                                <?php else : ?>
                                    <li class="catalog-categories__item">
                                        <a class="catalog-categories__item-link" href="<?=$category['category_href'];?>">
                                            <?=$category['category_name']; ?>
                                        </a>
                                    </li>
                                <?php endif; ?>
                            <?php endforeach; ?>
                        </ul>
                    </div>
                    <?php echo $column_left; ?>
                </div>
                <div class="catalog__main-content">
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
                    <h1 class="catalog__name"><?=$heading_title;?></h1>
                    <div class="catalog__descr fw-mb-35">
                        <?=$description;?>
                    </div>
                    <div class="catalog__info">
                        <span class="catalog__info-count"><?=count($products);?> товаров</span>
                        <span class="catalog__info-sort">Сортировка:</span>
                        <div class="catalog__info-sort-select">
                            <select onchange="location = this.value;">
                                <?php foreach ($sorts as $sorts) { ?>
                                    <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                                        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                                    <?php } else { ?>
                                        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                                    <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="catalog__products product-list">
                        <div class="product-list-wrapper fw-pb-35">
                            <?php foreach ($products as $k => $product):
                                $options = $product['options'];
                                $product_name = $product['name'];
                                $product_price = str_replace(' ', ',',(str_replace('.00 р.', '', $product['price'])));
                                if ($product['special']) {
                                    $product_special_price = str_replace(' ', ',' ,(str_replace('.00 р.', '', $product['special'])));
                                };
                                $discount = intval(($product_special_price * 100 / $product_price));
                            ?>
                                <?php if($product['special']): ?>
                                    <div class="product__wrapper" data-price="<?=$product['special'];?>">
                                <?php else: ?>
                                    <div class="product__wrapper" data-price="<?=$product['price'];?>">
                                <?php endif; ?>
                                    <form action="#" class="product">
                                        <a class="product__link" href="<?=$product['href'];?>">
                                            <?php if ($discount > 0): ?>
                                                <div class="product__discount"><?=100-$discount;?>%</div>
                                            <?php endif; ?>
                                            <div class="product__image-wrapper">
                                                <img class="product__image" src="<?=$product['thumb'];?>" alt="<?=$product['name'];?>">
                                            </div>
                                            <div class="fw-fz-16 fw-text-center"><?=$product['name'];?></div>
                                            <div class="product__price">
                                                <div class="fw-fz-14">
                                                    <?php if($product['special']): ?>
                                                        <span class="fw-fz-24 fw-color-orange fw-font-bold">3500</span> руб. /
                                                        <span class="fw-fz-18 fw-font-bold fw-text-line-through">3850</span>
                                                    <?php else: ?>
                                                        <span class="fw-fz-24 fw-color-orange fw-font-bold">3500</span>
                                                    <?php endif;?>
                                                </div>
                                            </div>
                                        </a>
                                        <div class="product__button btn btn__in-cart">
                                            <div class="fw-mr-7"><i class="icon-cart-white"></i></div>
                                            <span>В корзину</span>
                                        </div>
                                    </form>
                                </div>
                            <?php endforeach; ?>
                        </div>
                    </div>
                    <div class="catalog__descr">
                        <?=$description_bottom; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>

<?php echo $footer; ?>