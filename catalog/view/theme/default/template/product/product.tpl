<?php

$last_elem = end($breadcrumbs);
$special_price = str_replace(' ', ',', str_replace(('.00 р.'), '', $special));
$default_price = str_replace(' ', '', str_replace(('.00 р.'), '', $price));
$economy_sum = $default_price - $special_price;

$discount_price = intval(str_replace(',', '', $special_price));
$old_price = intval($default_price);

$i=0;
foreach($options as $option):
    if($option['name'] == 'Объём'):
        foreach ($option['product_option_value'] as $options):
            $volumes[$i] = $options;
            $i++;
        endforeach;
    endif;
endforeach;

echo $header;
?>

<div class="product-page">

    <div class="product-page__triggers">
        <div class="container">
            <div class="product-page-triggers">
                <div class="product-page__trigger">
                    <div class="product-page__trigger-icon">
                        <img src="images/icon-tick.svg">
                    </div>
                    <p class="product-page__trigger-text">Только оригинальная продукция</p>
                </div>
                <div class="product-page__trigger">
                    <div class="product-page__trigger-icon">
                        <img src="images/icon-box.svg">
                    </div>
                    <p class="product-page__trigger-text">Прямые поставки от производителей</p>
                </div>
                <div class="product-page__trigger">
                    <div class="product-page__trigger-icon">
                        <img src="images/icon-money.svg">
                    </div>
                    <p class="product-page__trigger-text">Оплата при получении или самовывоз</p>
                </div>
                <div class="product-page__trigger">
                    <div class="product-page__trigger-icon">
                        <img src="images/icon-return.svg">
                    </div>
                    <p class="product-page__trigger-text">Возврат в течение 2 недель</p>
                </div>
            </div>
        </div>
    </div>


    <div class="product-content">
        <div class="container">
            <ul class="breadcrumbs">
                <li class="breadcrumbs__item">
                    <a href="#" class="breadcrumbs__item-link">Главная</a>
                </li>
                <li class="breadcrumbs__item">
                    <a href="#" class="breadcrumbs__item-link">Парфюмированные наборы</a>
                </li>
            </ul>
            <h1 class="product-content__name"><?=$heading_title; ?></h1>
            <form class="product-form">
                <input type="hidden" name="product_id" value="<?=$product_id; ?>">
                <div class="product-images">
                    <div class="product-images__main owl-product-images-main owl-carousel">
                        <div class="product-images__image-wrapper">
                            <img class="product-images__image" src="<?php echo $thumb; ?>" alt="<?=$heading_title; ?>">
                            <?php if ($discount_price > 0) : ?>
                                <span class="product-item-sale"><?=intval(100-($discount_price*100)/$old_price);?>%</span>
                            <?php endif; ?>
                        </div>
                        <?php foreach ($images as $image) : ?>
                            <div class="product-images__image-wrapper">
                                <img class="product-images__image" src="<?=$image['thumb']; ?>" alt="<?=$heading_title; ?>">
                                <?php if ($discount_price > 0) : ?>
                                    <span class="product-item-sale"><?=intval(100-($discount_price*100)/$old_price);?>%</span>
                                <?php endif; ?>
                            </div>
                        <?php endforeach; ?>
                    </div>
                    <div class="product-images__thumbs owl-product-images-thumbs owl-carousel">
                        <?php foreach ($images as $image) : ?>
                            <div class="product-images__thumb-wrapper">
                                <img class="product-images__thumb" src="<?=$image['thumb']; ?>" alt="">
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
                <div class="product-buying-wrapper">
                    <p class="product__stock-date">Акция действует до 01.12</p>
                    <div class="product__stock-count">
                        <div class="icon-check">
                            <img class="icon-check__icon svg svg_green" src="../images/icon-check.svg" alt="">
                        </div>
                        <span>Осталось 13 штук по акции</span>
                    </div>
                    <?php if (count($volumes)>0) : ?>
                    <div class="product__buying product-buying">
                        <div class="product-buying__name"><?=$heading_title; ?></div>

                        <?php foreach($volumes as $volume): ?>
                            <?php $volume_price = str_replace(' ', '', str_replace(('.00 р.'), '', $volume['price'])); ?>
                            <div class="product-buying__option">
                                <div class="product-buying__option-name">
                                    <span class="fw-font-bold fw-color-orange"><?=($volume_price); ?> тг.</span>
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
                    </div>
                    <?php else: ?>
                        <div class="product__buying product-buying top-product__buying_without-volume">
                            <div class="product-buying__name"><?=$heading_title; ?></div>
                            <div class="product-buying__option">
                                <div class="product-buying__option-name">
                                    <span class="fw-font-bold fw-color-orange"><?=$default_price; ?> <span class="fw-fz-24">тг.</span></span>
                                </div>
                                <div class="product-buying__option-count">
                                    <div class="fw-flex jqs-product-count">
                                        <span class="product-buying__count-minus jqs-product-count-minus">-</span>
                                        <input class="product-buying__count jqs-product-count-input" value="0" type="text" placeholder="0">
                                        <span class="product-buying__count-plus jqs-product-count-plus">+</span>
                                    </div>
                                </div>
                                <div class="btn btn__in-cart">
                                    <div class="main-banner-icon-cart"><img class="icon-cart svg svg_white" src="../images/icon-cart.svg" alt=""></div>
                                    <span>В корзину</span>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>

                </div>
            </form>

            <div class="product__info">
                <div class="product__info-banner">
                    <div class="vertical-banner">
                        <div class="vertical-banner__text">
                            При покупке на сумму от <span class="fw-font-bold">30 000 тенге</span> - скидочная карта <span class="fw-font-bold">в подарок</span>!
                        </div>
                    </div>
                </div>
                <div class="product-info-switcher-wrapper">

                    <ul class="product-info-switcher jqs-switcher" data-switcher="{target: 'product-info'}">
                        <li class="product-info-switcher__item">Описание</li>
                        <li class="product-info-switcher__item">Доставка и оплата</li>
                        <li class="product-info-switcher__item">Возврат</li>
                    </ul>

                    <ul class="product-info-switcher-descr" data-switcher-target="product-info">
                        <li class="product-info-switcher-descr__text">
                            <?=$description;?>
                        </li>
                        <li class="product-info-switcher-descr__text">
                            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>
                        </li>
                        <li class="product-info-switcher-descr__text">
                            <p>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="reviews fw-mb-40">
            <div class="container">
                <div class="fw-mb-40 fw-flex fw-flex-bottom@m fw-flex-column@xs fw-flex-row@m fw-flex-top@xs fw-flex-center">
                    <h2 class="fw-fz-30@m fw-fz18@xs fw-text-uppercase fw-mt-0 fw-mb-0 fw-line-height-1 fw-color-white">Отзывы</h2>
                    <a class="fw-ml-25@m fw-ml-0@xs fw-mt-0@m fw-mt-15@xs fw-color-orange fw-text-lowercase fw-fz-18@m fw-fz-14@xs fw-link-without-underline" href="#">смотреть все</a>
                </div>
                <div class="owl-reviews-slider owl-carousel">

                    <div class="owl-reviews-slider__item reviews-item">
                        <div class="reviews-item__text-wrapper">
                            <div class="reviews-item__text">
                                <p class="fw-mt-0 fw-mb-20 fw-font-bold fw-fz-18">Лучший интернет-магазин парфюма!</p>
                                <p class="fw-mt-0 fw-mb-0 fw-fz-16">Интернет магазин парфюмерии Sandra.kz предлагает вам широчайший ассортимент высококачественной продукции ведущих мировых брендов по самым приемлемым ценам!</p>
                            </div>
                        </div>
                        <div class="reviews-item__user-info">
                            <div class="reviews-item__image-wrapper">
                                <img src="images/review-user.jpg" alt="" class="reviews-item__image">
                            </div>
                            <p class="reviews-item__user-name">Виктория, 25 лет, Алматы</p>
                        </div>
                    </div>

                    <div class="owl-reviews-slider__item reviews-item">
                        <div class="reviews-item__text-wrapper">
                            <div class="reviews-item__text">
                                <p class="fw-mt-0 fw-mb-20 fw-font-bold fw-fz-18">Спасибо за консультацию</p>
                                <p class="fw-mt-0 fw-mb-0 fw-fz-16">Осуществляя продажу парфюмерии, наши сотрудники прикладывают максимум усилий для того, чтобы обслуживание было максимально удобным для клиентов. После продажи женской парфюмерии в Алматы или мужского парфюма, мы доставляем Ваш заказ точно в оговоренные сроки по адресу, указанному Вами. Мы высоко ценим доверие каждого своего клиента.</p>
                            </div>
                        </div>
                        <div class="reviews-item__user-info">
                            <div class="reviews-item__image-wrapper">
                                <img src="images/review-user.jpg" alt="" class="reviews-item__image">
                            </div>
                            <p class="reviews-item__user-name">Виктория, 25 лет, Алматы</p>
                        </div>
                    </div>

                    <div class="owl-reviews-slider__item reviews-item">
                        <div class="reviews-item__text-wrapper">
                            <div class="reviews-item__text">
                                <p class="fw-mt-0 fw-mb-20 fw-font-bold fw-fz-18">Лучший интернет-магазин парфюма!</p>
                                <p class="fw-mt-0 fw-mb-0 fw-fz-16">Интернет магазин парфюмерии Sandra.kz предлагает вам широчайший ассортимент высококачественной продукции ведущих мировых брендов по самым приемлемым ценам!</p>
                            </div>
                        </div>
                        <div class="reviews-item__user-info">
                            <div class="reviews-item__image-wrapper">
                                <img src="images/review-user.jpg" alt="" class="reviews-item__image">
                            </div>
                            <p class="reviews-item__user-name">Виктория, 25 лет, Алматы</p>
                        </div>
                    </div>

                    <div class="owl-reviews-slider__item reviews-item">
                        <div class="reviews-item__text-wrapper">
                            <div class="reviews-item__text">
                                <p class="fw-mt-0 fw-mb-20 fw-font-bold fw-fz-18">Спасибо за консультацию</p>
                                <p class="fw-mt-0 fw-mb-0 fw-fz-16">Осуществляя продажу парфюмерии, наши сотрудники прикладывают максимум усилий для того, чтобы обслуживание было максимально удобным для клиентов. После продажи женской парфюмерии в Алматы или мужского парфюма, мы доставляем Ваш заказ точно в оговоренные сроки по адресу, указанному Вами. Мы высоко ценим доверие каждого своего клиента.</p>
                            </div>
                        </div>
                        <div class="reviews-item__user-info">
                            <div class="reviews-item__image-wrapper">
                                <img src="images/review-user.jpg" alt="" class="reviews-item__image">
                            </div>
                            <p class="reviews-item__user-name">Виктория, 25 лет, Алматы</p>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="main-content__products product-list">
            <div class="container">
                <div class="fw-mb-40 fw-flex fw-flex-bottom@m fw-flex-column@xs fw-flex-row@m fw-flex-top@xs">
                    <h2 class="fw-fz-30@m fw-fz18@xs fw-text-uppercase fw-mt-0 fw-mb-0 fw-line-height-1">Вы смотрели</h2>
                </div>
                <div class="product-list-wrapper">
                    <div class="product__wrapper">
                        <div class="product">
                            <a class="product__link" href="#">
                                <div class="product__discount">10%</div>
                                <div class="product__image-wrapper">
                                    <img class="product__image" src="images/product-1.png" alt="">
                                </div>
                                <div class="fw-fz-16 fw-text-center">Amaltea</div>
                                <div class="product__price">
                                    <div class="fw-fz-14">
                                        <span class="fw-fz-24 fw-color-orange fw-font-bold">3500</span> руб. /
                                        <span class="fw-fz-18 fw-font-bold fw-text-line-through">3850</span>
                                    </div>
                                </div>
                            </a>
                            <div class="product__button btn btn__in-cart">
                                <div class="fw-mr-7"><i class="icon-cart-white"></i></div>
                                <span>В корзину</span>
                            </div>
                        </div>
                    </div>
                    <div class="product__wrapper">
                        <div class="product">
                            <a class="product__link" href="#">
                                <div class="product__discount">10%</div>
                                <div class="product__image-wrapper">
                                    <img class="product__image" src="images/product-2.png" alt="">
                                </div>
                                <div class="fw-fz-16 fw-text-center">Perfumed Set With Balsam</div>
                                <div class="product__price">
                                    <div class="fw-fz-14">
                                        <span class="fw-fz-24 fw-color-orange fw-font-bold">3500</span> руб. /
                                        <span class="fw-fz-18 fw-font-bold fw-text-line-through">3850</span>
                                    </div>
                                </div>
                            </a>
                            <div class="product__button btn btn__in-cart">
                                <div class="fw-mr-7"><i class="icon-cart-white"></i></div>
                                <span>В корзину</span>
                            </div>
                        </div>
                    </div>
                    <div class="product__wrapper">
                        <div class="product">
                            <a class="product__link" href="#">
                                <div class="product__discount">10%</div>
                                <div class="product__image-wrapper">
                                    <img class="product__image" src="images/product-1.png" alt="">
                                </div>
                                <div class="fw-fz-16 fw-text-center">Amaltea</div>
                                <div class="product__price">
                                    <div class="fw-fz-14">
                                        <span class="fw-fz-24 fw-color-orange fw-font-bold">3500</span> руб. /
                                        <span class="fw-fz-18 fw-font-bold fw-text-line-through">3850</span>
                                    </div>
                                </div>
                            </a>
                            <div class="product__button btn btn__in-cart">
                                <div class="fw-mr-7"><i class="icon-cart-white"></i></div>
                                <span>В корзину</span>
                            </div>
                        </div>
                    </div>
                    <div class="product__wrapper">
                        <div class="product">
                            <a class="product__link" href="#">
                                <div class="product__discount">10%</div>
                                <div class="product__image-wrapper">
                                    <img class="product__image" src="images/product-2.png" alt="">
                                </div>
                                <div class="fw-fz-16 fw-text-center">Perfumed Set With Balsam</div>
                                <div class="product__price">
                                    <div class="fw-fz-14">
                                        <span class="fw-fz-24 fw-color-orange fw-font-bold">3500</span> руб. /
                                        <span class="fw-fz-18 fw-font-bold fw-text-line-through">3850</span>
                                    </div>
                                </div>
                            </a>
                            <div class="product__button btn btn__in-cart">
                                <div class="fw-mr-7"><i class="icon-cart-white"></i></div>
                                <span>В корзину</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="fw-mb-40 fw-flex fw-flex-bottom@m fw-flex-column@xs fw-flex-row@m fw-flex-top@xs">
                    <h2 class="fw-fz-30@m fw-fz18@xs fw-text-uppercase fw-mt-0 fw-mb-0 fw-line-height-1">Похожие товары</h2>
                </div>
                <div class="product-list-wrapper">
                    <div class="product__wrapper">
                        <div class="product">
                            <a class="product__link" href="#">
                                <div class="product__discount">10%</div>
                                <div class="product__image-wrapper">
                                    <img class="product__image" src="images/product-1.png" alt="">
                                </div>
                                <div class="fw-fz-16 fw-text-center">Amaltea</div>
                                <div class="product__price">
                                    <div class="fw-fz-14">
                                        <span class="fw-fz-24 fw-color-orange fw-font-bold">3500</span> руб. /
                                        <span class="fw-fz-18 fw-font-bold fw-text-line-through">3850</span>
                                    </div>
                                </div>
                            </a>
                            <div class="product__button btn btn__in-cart">
                                <div class="fw-mr-7"><i class="icon-cart-white"></i></div>
                                <span>В корзину</span>
                            </div>
                        </div>
                    </div>
                    <div class="product__wrapper">
                        <div class="product">
                            <a class="product__link" href="#">
                                <div class="product__discount">10%</div>
                                <div class="product__image-wrapper">
                                    <img class="product__image" src="images/product-2.png" alt="">
                                </div>
                                <div class="fw-fz-16 fw-text-center">Perfumed Set With Balsam</div>
                                <div class="product__price">
                                    <div class="fw-fz-14">
                                        <span class="fw-fz-24 fw-color-orange fw-font-bold">3500</span> руб. /
                                        <span class="fw-fz-18 fw-font-bold fw-text-line-through">3850</span>
                                    </div>
                                </div>
                            </a>
                            <div class="product__button btn btn__in-cart">
                                <div class="fw-mr-7"><i class="icon-cart-white"></i></div>
                                <span>В корзину</span>
                            </div>
                        </div>
                    </div>
                    <div class="product__wrapper">
                        <div class="product">
                            <a class="product__link" href="#">
                                <div class="product__discount">10%</div>
                                <div class="product__image-wrapper">
                                    <img class="product__image" src="images/product-1.png" alt="">
                                </div>
                                <div class="fw-fz-16 fw-text-center">Amaltea</div>
                                <div class="product__price">
                                    <div class="fw-fz-14">
                                        <span class="fw-fz-24 fw-color-orange fw-font-bold">3500</span> руб. /
                                        <span class="fw-fz-18 fw-font-bold fw-text-line-through">3850</span>
                                    </div>
                                </div>
                            </a>
                            <div class="product__button btn btn__in-cart">
                                <div class="fw-mr-7"><i class="icon-cart-white"></i></div>
                                <span>В корзину</span>
                            </div>
                        </div>
                    </div>
                    <div class="product__wrapper">
                        <div class="product">
                            <a class="product__link" href="#">
                                <div class="product__discount">10%</div>
                                <div class="product__image-wrapper">
                                    <img class="product__image" src="images/product-2.png" alt="">
                                </div>
                                <div class="fw-fz-16 fw-text-center">Perfumed Set With Balsam</div>
                                <div class="product__price">
                                    <div class="fw-fz-14">
                                        <span class="fw-fz-24 fw-color-orange fw-font-bold">3500</span> руб. /
                                        <span class="fw-fz-18 fw-font-bold fw-text-line-through">3850</span>
                                    </div>
                                </div>
                            </a>
                            <div class="product__button btn btn__in-cart">
                                <div class="fw-mr-7"><i class="icon-cart-white"></i></div>
                                <span>В корзину</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="main-content-descr fw-mb-25">
            <div class="container">
                <h3 class="fw-fz-18 fw-font-bold fw-mt-0 fw-mb-25">Добро пожаловать в интернет-магазин Sandra!</h3>
                <p>Уважаемые клиенты, современный рынок продажи парфюмерной продукции динамично развивается в Казахстане, постоянно предлагая новые и хорошо известные изделия парфюмеров со всего мира.</p>
                <p>У каждого имеется возможность приобрести именно тот единственный и неповторимый аромат духов. Мы рады предложить Казахстанцам свою помощь в приобретении желаемого парфюма. Наш Интернет-магазин осуществляет продажу парфюмерной(perfume) продукции в Алматы, однако, по вашему желанию мужской парфюм, женские духи или туалетная вода могут быть высланы почтой в любой город Казахстана.</p>
                <p>Парфюмерия Алматы при заказе на сумму 7000 тенге и больше доставляется бесплатно. У нас Вы сможете купить парфюмерную воду, туалетную воду или духи (parfum), хорошо при этом сэкономив. Являясь крупнейшим интернет-магазином парфюмерии Алматы и благодаря тесным партнерским отношениям с ведущими поставщиками парфюмерии, мы имеем возможность предлагать нашим клиентам особенно привлекательные цены. Многим в Казахстане было бы приятно получить в качестве благодарности за покупку в магазине хороший парфюм.</p>
                <p>Мы любим своих клиентов и делаем им подарки. Приобретая мужскую или женскую парфюмерию в parfum-shop.kz, Вы сразу же становитесь постоянным покупателем и участником дисконтной программы. Дисконтная программа действует только для зарегистри рованных покупателей и даёт право приобретать как мужские, так и женские ароматы со скидками, которые растут вместе с числом покупок.</p>
                <p>Осуществляя продажу парфюмерии, наши сотрудники прикладывают максимум усилий для того, чтобы обслуживание было максимально удобным для клиентов. После продажи женской парфюмерии в Алматы или мужского парфюма, мы доставляем Ваш заказ точно в оговоренные сроки по адресу, указанному Вами. Мы высоко ценим доверие каждого своего клиента, стремясь сделать все для того, что бы покупка туалетной воды или д ухов в Казахстане приносила ему только положительные эмоции.</p>
                <p>Компания Parfum-shop.kz, один из крупнейших поставщиков парфюмерии(perfume) в Алматы (республика Казахстан), рада приветствовать Вас на своем ресурсе, посвященном парфюмерной продукции. У нас вы сможете приобрести любой известный аромат, т.е. купить парфюм любой марки. Вашему вниманию представлены духи, туалетная вода и парфюмерная вода от Chanel, Clinique, Dior, Hugo boss, Lancome, Ив Роше.</p>
                <p>Интернет магазин парфюмерии Parfum-shop.kz предлагает вам широчайший ассортимент высококачественной продукции ведущих мировых брендов по самым приемлемым ценам. Достопочтимым клиентам мы дарим гибкую систему скидок и спецпредложений, богатый выбор парфюмерии на любой, даже самый взыскательный, вкус. У нас вы сможете купить парфюм любой марки. Любой бренд.</p>
                <p>Мужчины подчеркнут достоинства своего характера с помощью бескрайнего моря продукции нашего магазина. Сильные и проворные, изысканные и деловые, мы подберем для каждого из вас наиболее подходящие, дополняющие ваши преимущества ароматы.</p>
                <p>Девушки тоже не останутся обделенными. Вы можете приобрести в нашем Интернет-магазине все, что душе  угодно: самые последние новинки парфюмерного рынка, новейшие эксклюзивные ароматы от лучших домов моды, дизайнерские духи и т.д. Наши поставщики - надежны и проверены временем.</p>
                <p>Распространение оригинальной и качественной parfum парфюмерии (естественно, сертифицированной) – работа, которую они делают с удовольствием и полной отдачей. Иметь дело с Parfum-shop.kz выгодно, просто и удобно.</p>
            </div>
        </div>

    </div>

</div>

<?php echo $footer; ?>
