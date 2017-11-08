function validatePhone(phoneNumber) {
    var phoneNumberPattern = /((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{8,10}/;
    return phoneNumberPattern.test(phoneNumber);
}

var $sendForm = $('.js-send-form'),
    $thanks = $('.js-thanks'),
    $thanksModal = $('.thanks-modal'),
    $closeThanksBtn = $('.js-close-thanks');

$closeThanksBtn.click(function () {
    $thanks.removeClass('active');
    $sendForm.removeClass('hidden');
});

var getCartAddedNewProduct = function ($product_id, callback) {
    $.post('/?route=checkout/checkout/single', {product_id: $product_id}, function (response) {
        callback(response);
    });
};

var $basketCountProducts = $('.js-basket-count-products'),
    productsCountInCart = $('#cartModal').find('.js-prod-cart-item').length;

$basketCountProducts.html(productsCountInCart);

$(document).on('click', '.js-btn-buy', function (e) {
    var time = performance.now();
    var preload = true;
    e.preventDefault();
    var $buyBtn = $(this),
        $form = $buyBtn.closest('form'),
        data = {
            option: {}
        };
    $(this).closest('form').find('.js-btn-loading span').html('загрузка...');
    $('#input-phone').css('border', 'none');

    if ($(this).find('.js-select-volume').length > 0) {
        var volumeValue = parseInt($(this).find('.js-select-volume').val());
        $(this).find('.js-select-volume').attr('checked', true);
    }
    if ($(this).closest('form').find('.js-item-count').length > 0) {
        var productCount = parseInt($(this).closest('.js-product-buying-option').find('.js-item-count').val());
    }

    $.each($form.serializeArray(), function (key, input) {
        if (input.name === 'product_id') data[input.name] = input.value;
        else data['option'][input.name] = input.value;
    });
    $.post('/?route=checkout/cart/add', data, function (response) {
        // Error
        if (response.error !== undefined) {
            console.log('error');
        }
        // Success
        if (response.success !== undefined) {
            $('#cart').load('?route=common/header/info .js-prod-cart-table');
            getCartAddedNewProduct(data.product_id, function (productIncart) {
                jcf.replaceAll();
                time = performance.now() - time;
                preload = false;
                totalPrice();
                if (preload === false) {
                    $('.js-btn-loading').find('span').html('В корзину');
                }
                var itemsCount = $('#cartModal').find('.js-prod-cart-item').length;
                var $productsCountInCart = $('.jqs-send-form').find('.js-prod-cart-item');
                $productsCountInCart.each(function () {
                    var volumeValueInCart = parseInt($(this).find('.js-select-volume option:selected').val());
                    if (volumeValueInCart === volumeValue)
                        $(this).find('.jqs-product-count-input').val(productCount);
                });
                $basketCountProducts.html(itemsCount);
            });
        }
    });
    $(this).find('.js-select-volume').attr('checked', false);
});

$(document).on('submit', '.jq-send-form', function (e) {
    e.preventDefault();

    var $form = $(this),
        tempData = {},
        data = [],
        $phone = $form.find('#input-phone');

    if (validatePhone($phone.val()) === true) {
        $phone.css('border', 'none');
        $.each($form.serializeArray(), function (key, input) {
            tempData[input.name] = input.value;
        });

        data.push(tempData);
        addOrder(data, function (response) {
            console.log(response);
        });

    } else {
        $phone.css('border', '1px solid red');
    }
});

$(document).on('submit', '.jqs-send-form', function (e) {
    e.preventDefault();
    var $form = $(this),
        data = {products: {}},
        $phone = $form.find('#input-phone');

    if (validatePhone($phone.val()) === true) {
        $phone.css('border', 'none');
        $.each($form.serializeArray(), function (index, input) {
            if (input.name.indexOf('products[') > -1) {
                var slitedInput = input.name.split(']['),
                    productId = slitedInput[0].replace('products[', ''),
                    fieldName = slitedInput[1].replace(']', '');

                if (data.products[productId] === undefined)
                    data.products[productId] = {};

                data.products[productId][fieldName] = input.value;
            } else {
                data[input.name] = input.value;
            }
        });

        addOrder(data, function (response) {
            console.log(response);
        });

        console.log(data);

        quantityPerStock();

        var $cartForm = $(this),
            $thanks = $('.js-thanks');

        $cartForm.closest('.js-popup').removeClass('opened');
        clearForm();
        $thanks.closest('.js-popup').addClass('opened');
    } else {
        $phone.css('border', '1px solid red');
    }
});

function addOrder(data, callback) {
    $.ajax({
        url: 'index.php?route=checkout/confirm/addFromMain',
        type: 'post',
        data: data,
        dataType: 'json',
        success: function (response) {
            callback(response);
        }
    });
}

$(document).on('submit', '.jqs-feedback-form', function (e) {
    e.preventDefault();
    var $form = $(this),
        data = {},
        $name = $form.find('#input-name'),
        $phone = $form.find('#input-phone');

    if (validatePhone($phone.val()) === true) {
        $phone.css('border', 'none');

        data['firstname'] = $name.val();
        data['telephone'] = $phone.val();

        sendFeedback(data, function (response) {
            // console.log(response);
        });

        $.magnificPopup.close({
            items: {
                src: '#feedback'
            }
        });
        $.magnificPopup.open({
            items: {
                src: '#thanks'
            }
        });

        clearFeedbackForm();
    } else {
        $phone.css('border', '1px solid red');
    }
});

function sendFeedback(data, callback) {
    var $form = $('.jqs-feeback-form');
    $.ajax({
        url: 'index.php?route=checkout/confirm/sendFeedback',
        type: 'post',
        data: data,
        dataType: 'json',
        success: function (response) {
            callback(response);
        }
    });
}

// Очистка формы корзины
function clearForm() {
    var $form = $('#cartModal');

    $form.find('.js-prod-cart-item').each(function () {
        var cart_id = $(this).attr('data-cart-id');
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + cart_id,
            dataType: 'json',
            success: function () {
                $basketCountProducts.html(0);
            }
        });
        $form.find('input').val('');
        $(this).remove();
        if (!$('.link-basket').hasClass('hidden'))
            $('.link-basket').addClass('hidden');
    });
}

// Очистка формы обратного звонка
function clearFeedbackForm() {
    var $form = $('.jqs-feedback-form');
    $form.find('input').val('').css('border', 'none');
}

//Сохранение выбранных опций (размер, привезите несколько, тип доставки)
function productVolume() {
    var $form = $('#cartModal'),
        $items = $form.find('.js-prod-cart-item');
    $items.each(function () {
        var currentVolume = $(this).find('.js-select-volume .jcf-select-text span').html(),
            inputVolume = $(this).find('.js-hidden-input-product-volume');
        inputVolume.val(currentVolume);
    });
}

// Расчёт полной стоимости заказа и стоимости отдельных товаров в зависимости от их количества
function totalPrice() {
    var $form = $('#cartModal'),
        $items = $form.find('.js-prod-cart-item'),
        $totalPriceSpan = $form.find('.js-total-price'),
        $totalPriceInput = $form.find('.js-total-price-input'),
        totalPrice = 0;

    $items.each(function () {
        var price = parseInt($(this).find('.js-item-price').html()),
            count = parseInt($(this).find('.js-item-count').val());
        totalPrice += price;
    });
    $totalPriceSpan.html(totalPrice + ' <span class="rubl"> </span>');
    $totalPriceInput.val(totalPrice);
}

function itemPrice(item) {
    var count = item.find('.js-item-count').val(),
        priceSpan = item.find('.js-item-price'),
        price = item.find('.js-hidden-input-item-price').val(),
        totalPrice = 0;
    totalPrice += count * price;
    priceSpan.html(totalPrice + ' <span class="rubl"> </span>')
}

//Удаление товара
function removeItem(item) {
    var $count = item.find('.js-item-count'),
        cart_id = item.attr('data-cart-id'),
        itemsCount = $('#cartModal').find('.js-prod-cart-item').length;
    if (itemsCount > 1) {
        if (($count.val() < 1)) {
            item.remove();
            $.ajax({
                url: 'index.php?route=checkout/cart/remove',
                type: 'post',
                data: 'key=' + cart_id,
                dataType: 'json',
                success: function () {
                    $basketCountProducts.html(itemsCount - 1);
                }
            });
        }
        // Удалить товар из списка и закрыть корзину, если товар единственный
    } else if (itemsCount === 1) {
        if (($count.val() < 1)) {
            if ($('.js-popup').hasClass('opened')) {
                $('.js-popup').removeClass('opened');
                $('html').removeClass('popup-opened');
                $('body').removeAttr('style');
        }
            $.ajax({
                url: 'index.php?route=checkout/cart/remove',
                type: 'post',
                data: 'key=' + cart_id,
                dataType: 'json',
                success: function () {
                    $basketCountProducts.html(itemsCount - 1);
                    item.remove();
                    if (!$('.link-basket').hasClass('hidden'))
                        $('.link-basket').addClass('hidden');
                }
            });

        }
    }
}

//Пересчёт общей суммы и стомости товара при увеличении количества товаров
$(document).on('click', '.jqs-product-count-plus', function () {
    var $count = $(this).siblings('.js-item-count'),
        $item = $(this).closest('.js-prod-cart-item');
    $count.val(parseInt($count.val()) + 1);
    $count.change();
    itemPrice($item);
    totalPrice();
});

// Уменьшение количества товаров по клику на минус
$(document).on('click', '.jqs-product-count-minus', function () {
    var $count = $(this).siblings('.js-item-count'),
        $item = $(this).closest('.js-prod-cart-item');

    if (parseInt($count.val()) - 1 >= 0)
        $count.val(parseInt($count.val()) - 1);
    $count.change();
    itemPrice($item);
    removeItem($item);
    totalPrice();
});

// Пересчёт стоимости при ручном вводе количества товаров
$(document).on('keypress', '.js-item-count', function (e) {
    var $item = $(this).closest('.js-prod-cart-item');

    var charCode = e.which ? e.which : e.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    } else {
        itemPrice($item);
        removeItem($item);
        totalPrice();
    }
});

$(document).on('focusout', '.js-item-count', function () {
    var $item = $(this).closest('.js-prod-cart-item');

    itemPrice($item);
    removeItem($item);
    totalPrice();
});

// Расчёт итоговой суммы при клике на кнпоку, вызывающую корзину
$(document).on('click', '.js-basket', function () {
    totalPrice();
    $('#input-phone').css('border', 'none');
    jcf.replaceAll();
});


//Изменение итоговой стоимости, если выбрана доставка по России
$(document).on('click', '.js-delivery-russian', function () {
    var $form = $('#cartModal'),
        $totalPriceSpan = $form.find('.js-total-price'),
        $totalPriceInput = $form.find('.js-total-price-input');
    $totalPriceSpan.html(parseInt($totalPriceInput.val()) + 390 + ' <span class="rubl"> </span>');
});

// Сохранение прежней стоимости, если доставка по России не выбрана
$(document).on('click', '.js-delivery-default', function () {
    var $form = $('#cartModal'),
        $totalPriceSpan = $form.find('.js-total-price'),
        $totalPriceInput = $form.find('.js-total-price-input').val();
    $totalPriceSpan.html($totalPriceInput + ' <span class="rubl"> </span>');
});

//Cкрытие всех фильтров, кроме активного, появление кнопки "Все"
function filterCheckedItems() {
    var $filters = $('.filter-aside-cont');
    $filters.each(function () {
        var $allButton = $(this).find('.js-all-filters'),
            $inputs = $(this).find('.filter-item input');
        if ($inputs.filter(":checked").length > 0) {
            $inputs.not(":checked").closest('.filter-item').addClass('hidden');
            $allButton.removeClass('hidden');
        }
    });
}

//Изменение тайтла категории при применении фильтров
function categoryTitle() {
    var $categoryTitleSpan = $('.js-category-title'),
        categoryTitle = $categoryTitleSpan.html(),
        $filters = $('.filter-aside-cont'),
        $inputsChecked = $filters.find('input:checked'),
        arr = [];
    $inputsChecked.each(function () {
        var filterName = $(this).closest('.filter-item').find('.js-filter-name').attr('data-filter-name');
        filterName = filterName.replace(/\s/g, '');
        arr.push(filterName);

    });
    if (arr.length > 0) {
        $categoryTitleSpan.html(categoryTitle + ', ' + arr.join(', '));
        document.title = categoryTitle + ', ' + arr.join(', ');
    }
}

Object.extend = function (destination, source) {
    for (var property in source) {
        if (source.hasOwnProperty(property)) {
            destination[property] = source[property];
        }
    }
    return destination;
};

function quantityPerStock() {
    var $form = $('.jqs-send-form'),
        $items = $form.find('.js-prod-cart-item');
    var data = [];

    if (localStorage.getItem('product_info') !== null) {
        var oldStorage = JSON.parse(localStorage.getItem('product_info'));
    }

    //Помещаем отправленные в корзину продукты и их количество в массив
    $items.each(function () {
        var products_id = $(this).find('.js-product-id').val(),
            products_quantity = $(this).find('.js-hidden-input-product-quantity').val(),
            product_quantity_in_cart = $(this).find('.js-item-count').val(),

            quantityDifference = parseInt(products_quantity) - parseInt(product_quantity_in_cart);
        if (parseInt(quantityDifference) <= 0)
            quantityDifference = 0;
        data.push({
            product_id: parseInt(products_id),
            quantity: parseInt(quantityDifference)
        });
    });
    // массив помещаем в localStorage

    if (localStorage.getItem('product_info') !== null) {
        var currentStorage = oldStorage.concat(data);
        localStorage.setItem('product_info', JSON.stringify(currentStorage));
    } else {
        localStorage.setItem('product_info', JSON.stringify(data));
    }
}

// присваиваем данные из localStorage переменной
var productInStorage = JSON.parse(localStorage.getItem('product_info'));


// сравниваем ID купленных пользователем товаров с товаром, на страницу которого пользователь зашёл
function checkProductQuantity() {
    var $quantity = $('.js-quantity-in-product');
    var product_id_in_form = $('form').find('input[name=product_id]').val();
    // перебираем массив в localStorage, пытаясь найти среди купленных товар, на странице которого находимся
    $.each(productInStorage, function (index, value) {

        // если такой товар найден и разница между остатком и количеством купленных пользователем товаров меньше или равна нуля, то показываем 0
        if (parseInt(value.product_id) === parseInt(product_id_in_form) && (parseInt(value.quantity) === 0)) {
            $quantity.html(0);
            return false;
        } else {
            $quantity.html(quantityInProductReal);
        }
    });
}

//Выполняем функцию, если в массиве что-то есть
var $quantityInProductSpan = $('.js-quantity-in-product'),
    quantityInProductReal = $('.js-quantity-in-product-real').val();
if (productInStorage && productInStorage.length > 0) {
    checkProductQuantity();
} else {
    $quantityInProductSpan.html(quantityInProductReal);
}

//Поиск

$('.search-inp input').on('keydown', function () {

    if (!$(this).val()) {
        $('.search-result').hide();
        return;
    }

    var data = {
        search: $(this).val()
    };
    $.ajax({
        url: 'index.php?route=common/ajax_search',
        data: data,
        type: 'post',
        dataType: 'json',
        success: function (json) {
            if (!json.products) {
                return;
            }

            var inner = $('.search-result .search-result-inner');
            var template = $('.search-result .search-result-inner .template').clone();
            inner.html('');

            inner.append(template);

            json.products.forEach(function (product) {
                var t = template.clone().removeClass('template');
                t.find('a').attr('href', product.href);
                t.find('img').attr('src', product.thumb);
                t.find('span').html(product.name);
                inner.append(t);
            });

            $('.search-result').show();

        }
    });
});

//Очистка поиска
$('.search-close').on("click", function (e) {
    $(this).siblings('input').val('');
    $(this).closest('.search-form').removeClass('search-open');
    $('.search-result').hide();
});

var page = 1;
var loadPage = false;

$(function () {
    var currentState = history.state;
    for (const key in currentState) {
        if (currentState[key] && currentState[key].contentProducts) {
            $('.jqs-lazy-list-product[data-category="' + key + '"]').html('');
            $('.jqs-lazy-list-product[data-category="' + key + '"]').append(currentState[key].contentProducts);
            page = currentState[key].page;
        }
    }
    var $showMore = $('.js-show-more');

    if ($showMore.length) {

        $showMore.each(function () {
            var $newShowMore = $(this);
            var maxPage = $newShowMore.data('max-page');
            var url = $newShowMore.data('max-url');
            var category = $newShowMore.data('category');


            $(document).on('scroll', function () {
                if (maxPage > page && $(this).scrollTop() >= $newShowMore.position().top - 700 && !loadPage) {
                    loadPage = true;
                    $('#fountainG').show();
                    page++;

                    $.ajax({
                        url: url,
                        data: {page: page},
                        success: function (data) {
                            $(data).find('.jqs-lazy-list-product[data-category="' + category + '"] .prod-item-wrapper[data-category="' + category + '"]').each(function () {
                                $('.jqs-lazy-list-product[data-category="' + category + '"]').append(this);

                            });

                            var state = {};

                            state[category] = {
                                contentProducts: $('.jqs-lazy-list-product[data-category="' + category + '"]').html(),
                                page: page
                            };

                            history.replaceState(state, location.href, location.href);

                            loadPage = false;
                            $('#fountainG').hide();
                            console.log($(data).find('.jqs-lazy-list-product[data-category="' + category + '"] .prod-item-wrapper[data-category="' + category + '"]').each(function () {
                                $('.jqs-lazy-list-product[data-category="' + category + '"]')}));
                        }
                    });

                }
            });
        })
    }

    $('.goBack').on('click', function () {
        if (history.length > 2) {
            window.history.go(-1);
            return false;
        }
    });

});

function selectVolume() {
    var $volumeInput = $('.js-select-volume');

    $volumeInput.on('click', function () {
        $volumeInput.each(function () {
            $volumeInput.attr('checked', false)
        });
        $(this).attr('checked', true);
        var $currentProduct = $(this).closest('.js-product'),
            $volumePrice = $currentProduct.find('.js-volume-price');

        $volumePrice.html($(this).attr('data-volume-price'));

    });
}

function selectVolumeInCart() {
    var $volumeSelect = $('.js-select-volume');

    $volumeSelect.on('change', function () {
        var $itemPrice = $(this).closest('.js-prod-cart-item').find('.js-item-price'),
            $hiddenItemPrice = $(this).closest('.js-prod-cart-item').find('.js-hidden-input-item-price'),
            volumePrice = parseInt($(this).find('option:selected').attr('data-volume-price')),
            productCount = parseInt($(this).closest('.js-prod-cart-item').find('.js-item-count').val());
        $itemPrice.html(productCount*volumePrice);
        console.log($hiddenItemPrice);
        $hiddenItemPrice.val(volumePrice);
        totalPrice();
    })
}

//Изменение тайтла категории при применении фильтров
categoryTitle();

//Кнопка скролла наверх

//Расчёт даты до окончания акции (+n дней к текущей)

//Скрытие фильтров, кроме активного
filterCheckedItems();

selectVolume();

selectVolumeInCart();