<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="theme-color" content="#ffffff">

    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $title; ?></title>
</head>

<link href="/catalog/view/theme/default/stylesheet/vendor.css" rel="stylesheet">
<link href="/catalog/view/theme/default/stylesheet/common.css" rel="stylesheet">

<script src="/catalog/view/javascript/jquery.min.js" type="text/javascript"></script>
<script src="/catalog/view/javascript/owl.carousel/js/owl.carousel.min.js" type="text/javascript"></script>
<script src="/catalog/view/javascript/jcf/js/jcf.js" type="text/javascript"></script>
<script src="/catalog/view/javascript/jcf/js/jcf.select.js" type="text/javascript"></script>

<body>

<div class="site-wrapper">

    <div class="popup-wrapper js-popup" data-popup="cart">
        <form class="cart jqs-send-form" id="cartModal">
            <span class="popup-close js-close-popup"></span>
            <div class="cart-triggers-wrapper">
                <div class="cart-triggers">
                    <div class="cart-trigger">
                        <div class="cart-trigger__icon">
                            <img src="images/icon-tick.svg">
                        </div>
                        <p class="cart-trigger__text">Только оригинальная продукция</p>
                    </div>

                    <div class="cart-trigger">
                        <div class="cart-trigger__icon">
                            <img src="images/icon-box.svg">
                        </div>
                        <p class="cart-trigger__text">Прямые поставки от производителей</p>
                    </div>
                    <div class="cart-trigger">
                        <div class="cart-trigger__icon">
                            <img src="images/icon-money.svg">
                        </div>
                        <p class="cart-trigger__text">Оплата при получении или самовывоз</p>
                    </div>
                    <div class="cart-trigger">
                        <div class="cart-trigger__icon">
                            <img src="images/icon-return.svg">
                        </div>
                        <p class="cart-trigger__text">Возврат в течение 2 недель</p>
                    </div>
                </div>
            </div>

            <h2 class="cart__title">Ваш заказ</h2>
            <div class="cart__table">
                <div class="cart-table-header">
                    <div class="cart-table-header__cell">
                        <p class="fw-fz-14 fw-mt-0 fw-mb-0">Фото</p>
                    </div>
                    <div class="cart-table-header__cell">
                        <p class="fw-fz-14 fw-mt-0 fw-mb-0">Название</p>
                    </div>
                    <div class="cart-table-header__cell">
                        <p class="fw-fz-14 fw-mt-0 fw-mb-0">Объём</p>
                    </div>
                    <div class="cart-table-header__cell">
                        <p class="fw-fz-14 fw-mt-0 fw-mb-0">Количество</p>
                    </div>
                    <div class="cart-table-header__cell">
                        <p class="fw-fz-14 fw-mt-0 fw-mb-0">Цена</p>
                    </div>
                </div>
                <div id="cart">
                    <div class="js-prod-cart-table">
                        <?php foreach($cart as $cartItem) : ?>
                            <?php
                                $volume_array = [];
                                foreach($cartItem['options'] as $option) :
                                    if($option['option_id'] == 14) :
                                        asort($option['product_option_value']);
                                        foreach($option['product_option_value'] as $key => $optionValue) :
                                            $product_option_value_id = $cartItem['option'][0]['product_option_value_id'];
                                            $volume_array[$key] = [
                                                'volume_value' => $optionValue['product_option_value_id'],
                                                'volume_name' => $optionValue['name'],
                                                'volume_price' => intval(str_replace(' ', '',(str_replace('.0000', '', $optionValue['price']))))
                                            ];
                                        endforeach;
                                    endif;
                                endforeach;
                            ?>

                            <div class="cart-table-body js-prod-cart-item" data-cart-id="<?=$cartItem['cart_id']?>">
                                <div class="cart-table-body__cell">
                                    <div class="cart-table-body__image-wrapper">
                                        <img src="/image/<?=$cartItem['image']; ?>" alt="" class="cart-table-body__image">
                                    </div>
                                </div>
                                <div class="cart-table-body__cell">
                                    <p class="fw-fz-14 fw-text-uppercase fw-mt-0 fw-mb-0"><?=$cartItem['name']; ?></p>
                                </div>
                                <div class="cart-table-body__cell">
                                    <div class="volume-select">
                                        <?php if (count($volume_array) > 0) : ?>
                                            <select class="js-select-volume">
                                                <?php $i=0; foreach ($volume_array as $volume) : ?>
                                                    <?php if (isset($product_option_value_id)) : ?>
                                                        <?php $selectedOption = ($volume['volume_value'] == $product_option_value_id) ? 'selected' : '';?>
                                                        <option id="<?php echo $i; ?>" value="<?=$volume['volume_value']; ?>"<?=$selectedOption;?> data-volume-price="<?php echo $volume['volume_price']?>">
                                                            <?=$volume['volume_name']; ?>
                                                        </option>
                                                    <?php else : ?>
                                                        <?php $selectedOption = ''; ?>
                                                        <option id="<?php echo $i; $i++; ?>" value="<?=$volume['volume_value']; ?>">
                                                            <?=$volume['volume_name']; ?>
                                                        </option>
                                                    <?php endif; ?>
                                                <?php endforeach; ?>
                                            </select>
                                        <?php else : ?>
                                            <span class="fw-fz-14 fw-mt-0 fw-mb-0">Не задан</span>
                                        <?php endif; ?>
                                    </div>
                                </div>
                                <div class="cart-table-body__cell">
                                    <div class="fw-flex jqs-product-count">
                                        <span class="product-buying__count-minus jqs-product-count-minus">-</span>
                                        <input class="js-item-count product-buying__count jqs-product-count-input" name="products[<?=$cartItem['product_id']; ?>][product_quantity]" value="<?=$cartItem['quantity'];?>">
                                        <span class="product-buying__count-plus jqs-product-count-plus">+</span>
                                    </div>
                                </div>
                                <div class="cart-table-body__cell">
                                    <div class="fw-fz-14">
                                        <?php if (count($volume_array) > 0) : ?>
                                            <span class="fw-fz-24 fw-color-orange fw-font-bold js-item-price"><?=$volume_array[$i]['volume_price'];?></span> тг.
                                        <?php else : ?>
                                            <span class="fw-fz-24 fw-color-orange fw-font-bold js-item-price"><?=$cartItem['total'];?></span> тг.
                                        <?php endif; ?>
                                    </div>
                                </div>
                                <input type="hidden" class="js-product-id" name="products[<?=$cartItem['product_id']; ?>][product_id]" value="<?=$cartItem['product_id']; ?>">
                                <input type="hidden" name="products[<?=$cartItem['product_id']; ?>][product_name]" value="<?=$cartItem['name']; ?>">
                                <?php if (count($volume_array) > 0) : ?>
                                    <input type="hidden" class="js-hidden-input-item-price" name="products[<?=$cartItem['product_id']; ?>][product_price]" value="<?=$volume_array[$i]['volume_price']; ?>">
                                <?php else : ?>
                                    <input type="hidden" class="js-hidden-input-item-price" name="products[<?=$cartItem['product_id']; ?>][product_price]" value="<?=$cartItem['price']; ?>">
                                <?php endif; ?>
                                <input type="hidden" class="js-hidden-input-product-volume" name="products[<?=$cartItem['product_id']; ?>][product_volume]">
                                <input type="hidden" class="js-hidden-input-product-quantity" value="<?=$product_quantity;?>">
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
                <div class="cart__delivery">
                    <div class="cart__delivery-text">Доставка:</div>
                    <label class="cart-delivery__radio">
                        <input type="radio" name="cart-delivery">
                        <span class="radio"></span>
                        <span class="fw-fz-14">Самовывоз</span>
                    </label>
                    <label class="cart-delivery__radio">
                        <input type="radio" name="cart-delivery">
                        <span class="radio"></span>
                        <span class="fw-fz-14">Доставка</span>
                    </label>
                </div>

                <div class="cart__total">
                    <span class="fw-fz-14 fw-mr-15">Итого:</span>
                    <span class="fw-color-orange fw-fz-24 fw-font-bold js-total-price"></span>
                    <span class="fw-fz-14">тг</span>
                </div>
                <div class="cart__contacts">
                    <div class="cart__contacts-item"><input id="input-name" class="cart__contacts-item-input" type="text" placeholder="Ваше имя"></div>
                    <div class="cart__contacts-item"><input id="input-phone" class="mask-phone cart__contacts-item-input" type="text" placeholder="Ваш телефон"></div>
                    <div class="cart__contacts-item"><button type="submit" class="cart__btn btn">Оформить заказ</button></div>
                </div>
            </div>
        </form>
    </div>

    <div class="popup-wrapper js-popup" data-popup="feedback">
        <form class="feedback jqs-feedback-form">
            <span class="popup-close js-close-popup"></span>
            <p class="fw-mt-0 fw-mb-20 fw-fz-24">Обратный звонок</p>
            <div class="feedback__row"><input id="input-name" class="feedback__input" type="text" placeholder="Ваше имя"></div>
            <div class="feedback__row"><input id="input-phone" class="feedback__input" type="text" placeholder="Ваш телефон"></div>
            <div class="feedback__row"><button class="feedback__btn btn">Оформить заказ</button></div>
        </form>
    </div>

    <!-- Header block -->
    <header class="header fw-flex fw-flex-column">
        <div class="fw-flex fw-flex-middle fw-bg-color-smoky-white">
            <div class="container">
                <div class="header-top">
                    <div class="header__main-menu">
                        <div class="button-hamburger js-open-popup" data-popup-target="mobile-menu">
                            <span class="button-hamburger__line"></span>
                            <span class="button-hamburger__line"></span>
                            <span class="button-hamburger__line"></span>
                        </div>
                    </div>
                    <div class="header__shop-title">Интернет-магазин парфюма и косметики</div>
                    <ul class="fw-flex fw-flex-middle header-top-menu">
                        <?php if (strpos($_SERVER['REQUEST_URI'], 'o-nas')): ?>
                            <li class="header-top-menu__item"><a class="header-top-menu__item-link active">О нас</a></li>
                        <?php else: ?>
                            <li class="header-top-menu__item"><a class="header-top-menu__item-link" href="/o-nas">О нас</a></li>
                        <?php endif; ?>
                        <?php if (strpos($_SERVER['REQUEST_URI'], 'dostavka-i-oplata')): ?>
                            <li class="header-top-menu__item"><a class="header-top-menu__item-link active">Доставка и оплата</a></li>
                        <?php else: ?>
                            <li class="header-top-menu__item"><a class="header-top-menu__item-link" href="/dostavka-i-oplata">Доставка и оплата</a></li>
                        <?php endif; ?>
                        <?php if (strpos($_SERVER['REQUEST_URI'], 'otzyvy')): ?>
                            <li class="header-top-menu__item"><a class="header-top-menu__item-link active">Отзывы</a></li>
                        <?php else: ?>
                            <li class="header-top-menu__item"><a class="header-top-menu__item-link" href="/otzyvy">Отзывы</a></li>
                        <?php endif; ?>
                        <?php if (strpos($_SERVER['REQUEST_URI'], 'vozvrat')): ?>
                            <li class="header-top-menu__item"><a class="header-top-menu__item-link active">Возврат</a></li>
                        <?php else: ?>
                            <li class="header-top-menu__item"><a class="header-top-menu__item-link" href="/vozvrat">Возврат</a></li>
                        <?php endif; ?>
                        <?php if (strpos($_SERVER['REQUEST_URI'], 'contacts')): ?>
                            <li class="header-top-menu__item"><a class="header-top-menu__item-link active">Контакты</a></li>
                        <?php else: ?>
                            <li class="header-top-menu__item"><a class="header-top-menu__item-link" href="/contacts">Контакты</a></li>
                        <?php endif; ?>
                    </ul>
                    <div class="header-btn-wrapper">
                        <span class="header-btn js-open-popup" data-popup-target="feedback">Заказать звонок</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="fw-pt-10 fw-pb-10">
            <div class="container">
                <div class="header-middle">
                    <a href="/" class="header-middle__logo">
                        <i class="icon-logo"></i>
                    </a>
                    <div class="header-middle__trigger">
                        <div class="trigger-icon">
                            <img class="trigger-icon__parfume svg svg_black" src="images/icon-parfume.svg" alt="">
                        </div>
                        <div class="fw-fz-14">Лучшие предложения по наборам и парфюму</div>
                    </div>
                    <div class="header-middle__trigger">
                        <div class="trigger-icon">
                            <img class="trigger-icon__delivery svg svg_black" src="images/icon-delivery.svg" alt="">
                        </div>
                        <div class="fw-fz-14">Доставка по всему Казахстану</div>
                    </div>
                    <div class="header-middle__schedule">
                        <div class="fw-fz-14">Ежедневно 10:00 - 21:00</div>
                        <div class="fw-fz-24">+7 (7232) 12 34 56</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="header-main-menu">
            <div class="container">
                <ul class="main-menu">
                    <li class="main-menu__item"><a class="main-menu__item-link" href="#">Парфюмированные наборы</a></li>
                    <li class="main-menu__item"><a class="main-menu__item-link" href="#">Парфюм</a></li>
                    <li class="main-menu__item"><a class="main-menu__item-link" href="#">Миниатюрный парфюм</a></li>
                    <li class="main-menu__item"><a class="main-menu__item-link" href="#">Нишевый парфюм</a></li>
                </ul>
            </div>
            <div class="basket js-open-popup js-basket hidden" data-popup-target="cart">
                <img src="images/icon-cart.svg" alt="" class="basket__icon svg svg_white">
                <span class="fw-fz-14 fw-color-white">(<span class="js-basket-count-products">1</span>)</span>
            </div>
        </div>

    </header>