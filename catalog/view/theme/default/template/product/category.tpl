<?php

$last_elem = end($breadcrumbs);

echo $header;

?>

    <div class="catalog-page">

        <div class="container">
            <div class="catalog">
                <div class="sidebar">
                    <div class="catalog__image-wrapper">
                        <img src="images/catalog.jpg" alt="Парфюмированные наборы" class="catalog__image">
                    </div>
                    <div class="catalog__categories">
                        <ul class="catalog-categories">
                            <li class="catalog-categories__item">
                                <a href="#" class="catalog-categories__item-link">Парфюмированные наборы</a>
                            </li>
                            <li class="catalog-categories__item">
                                <a href="#" class="catalog-categories__item-link">Парфюм</a>
                            </li>
                            <li class="catalog-categories__item">
                                <a href="#" class="catalog-categories__item-link">Миниатюрный парфюм</a>
                            </li>
                            <li class="catalog-categories__item">
                                <a href="#" class="catalog-categories__item-link">Нишевый парфюм</a>
                            </li>
                        </ul>
                    </div>
                    <div class="filters">

                        <div class="filter filter_bg-gray">
                            <div class="filters__title">Фильтры</div>
                        </div>

                        <div class="filter">
                            <div class="filter__name jqs-show-filter">Объём</div>
                            <ul class="filter-list jqs-filter">
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">10 мл</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">20 мл</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">30 мл</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">40 мл</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">50 мл</a>
                                </li>
                            </ul>
                        </div>

                        <div class="filter">
                            <div class="filter__name jqs-show-filter">Концентрация</div>
                            <ul class="filter-list jqs-filter">
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">15%</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">25%</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">30%</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">35%</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">40%</a>
                                </li>
                            </ul>
                        </div>

                        <div class="filter">
                            <div class="filter__name jqs-show-filter">Спецпредложения</div>
                            <ul class="filter-list jqs-filter">
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">Скидки</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">Товар недели</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">Акции</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">Горячие предложения</a>
                                </li>
                            </ul>
                        </div>

                        <div class="filter">
                            <div class="filter__name jqs-show-filter">Пол</div>
                            <ul class="filter-list jqs-filter">
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">Мужской</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">Женский</a>
                                </li>
                            </ul>
                        </div>

                        <div class="filter">
                            <div class="filter__name jqs-show-filter">Бренд</div>
                            <ul class="filter-list jqs-filter">
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">Abercrombie & Fitch</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">E. Coudray</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">Florich</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">Guess</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">Jean Patou</a>
                                </li>
                            </ul>
                        </div>

                        <div class="filter">
                            <div class="filter__name jqs-show-filter">Страна</div>
                            <ul class="filter-list jqs-filter">
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">Америка</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">Великобритания</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">Франция</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">Испания</a>
                                </li>
                                <li class="filter-list__item">
                                    <a class="filter-list__item-link" href="#">Италия</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="catalog__main-content">
                    <ul class="breadcrumbs">
                        <li class="breadcrumbs__item">
                            <a href="#" class="breadcrumbs__item-link">Главная</a>
                        </li>
                        <li class="breadcrumbs__item">
                            <a href="#" class="breadcrumbs__item-link">Парфюмированные наборы</a>
                        </li>
                    </ul>
                    <h1 class="catalog__name">Парфюмированные наборы</h1>
                    <div class="catalog__descr fw-mb-35">
                        <p>
                            В последнее время большой популярностью пользуются наборы парфюмерии. Они находятся в красивой
                            подарочный упаковке, поэтому могут послужить в качестве приятного презента для коллег, подруг или родных.
                            Набор парфюмерии подойдет как молодой девушке, так и женщине постарше, достаточно лишь правильно
                            подобрать подходящий запах. Разнообразие ароматов позволит приобрести подарок на любой возраст и вкус,
                            главное – знать предпочтения человека, которому хотите преподнести сюрприз.
                        </p>
                    </div>
                    <div class="catalog__info">
                        <span class="catalog__info-count">16 товаров</span>
                        <span class="catalog__info-sort">Сортировка:</span>
                        <div class="catalog__info-sort-select">

                            <select>
                                <option value="default" selected>По умолчанию</option>
                                <option value="a-z">По имени (от А до Я)</option>
                                <option value="z-a">По имени (от Я до А)</option>
                                <option value="0-9">По цене (возрастание)</option>
                                <option value="9-0">По цене (убывание)</option>
                            </select>

                        </div>
                    </div>
                    <div class="catalog__products product-list">
                        <div class="product-list-wrapper fw-pb-35">
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
                        <div class="main-content__main-banner">
                            <div class="main-content__main-banner-text-wrapper">
                                При покупке на сумму <b>от 30 000 тенге</b> - скидочная карта <b>в подарок!</b>
                            </div>
                        </div>
                        <div class="product-list-wrapper fw-pb-35">
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
                    <div class="catalog__descr">
                        <p>
                            В последнее время большой популярностью пользуются наборы парфюмерии. Они находятся в красивой
                            подарочный упаковке, поэтому могут послужить в качестве приятного презента для коллег, подруг или родных.
                            Набор парфюмерии подойдет как молодой девушке, так и женщине постарше, достаточно лишь правильно
                            подобрать подходящий запах. Разнообразие ароматов позволит приобрести подарок на любой возраст и вкус,
                            главное – знать предпочтения человека, которому хотите преподнести сюрприз.
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </div>

<?php echo $footer; ?>