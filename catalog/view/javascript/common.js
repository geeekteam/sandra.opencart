'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var YOURAPPNAME = function () {
    function YOURAPPNAME(doc) {
        _classCallCheck(this, YOURAPPNAME);

        this.doc = doc;
        this.window = window;
        this.html = this.doc.querySelector('html');
        this.body = this.doc.body;
        this.location = location;
        this.hash = location.hash;
        this.Object = Object;
        this.scrollWidth = 0;

        this.scrollWidth = this.scrollBarWidth();
    }

    // Window load types (loading, dom, full)


    _createClass(YOURAPPNAME, [{
        key: 'appLoad',
        value: function appLoad(type, callback) {
            var _self = this;

            switch (type) {
                case 'loading':
                    if (_self.doc.readyState === 'loading') callback();

                    break;
                case 'dom':
                    _self.doc.onreadystatechange = function () {
                        if (_self.doc.readyState === 'complete') callback();
                    };

                    break;
                case 'full':
                    _self.window.onload = function (e) {
                        callback(e);
                    };

                    break;
                default:
                    callback();
            }
        }
    }, {
        key: 'scrollBarWidth',


        // Detect scroll default scrollBar width (return a number)
        value: function scrollBarWidth() {
            var _self = this;
            var outer = _self.doc.createElement("div");

            outer.style.visibility = "hidden";
            outer.style.width = "100px";
            outer.style.msOverflowStyle = "scrollbar";

            _self.body.appendChild(outer);

            var widthNoScroll = outer.offsetWidth;

            outer.style.overflow = "scroll";

            var inner = _self.doc.createElement("div");

            inner.style.width = "100%";
            outer.appendChild(inner);

            var widthWithScroll = inner.offsetWidth;

            outer.parentNode.removeChild(outer);

            return widthNoScroll - widthWithScroll;
        }
    }, {
        key: 'initSwitcher',
        value: function initSwitcher() {
            var _self = this;

            var switchers = _self.doc.querySelectorAll('[data-switcher]');

            if (switchers && switchers.length > 0) {
                for (var i = 0; i < switchers.length; i++) {
                    var switcher = switchers[i],
                        switcherOptions = _self.options(switcher.dataset["switcher"]),
                        switcherElems = switcher.children,
                        switcherTargets = _self.doc.querySelector('[data-switcher-target="' + switcherOptions.target + '"]').children,
                        switchersActive = [];

                    for (var y = 0; y < switcherElems.length; y++) {
                        var switcherElem = switcherElems[y],
                            parentNode = switcher.children,
                            switcherTrigger = switcherElem.children.length ? switcherElem.children[0] : switcherElem,
                            switcherTarget = switcherTargets[y];

                        if (switcherElem.classList.contains('active')) {
                            for (var z = 0; z < parentNode.length; z++) {
                                parentNode[z].classList.remove('active');
                                switcherTargets[z].classList.remove('active');
                            }
                            switcherElem.classList.add('active');
                            switcherTarget.classList.add('active');
                        } else switchersActive.push(0);

                        switcherTrigger.addEventListener('click', function (elem, target, parent, targets) {
                            return function (e) {
                                e.preventDefault();

                                if (!elem.classList.contains('active')) {
                                    for (var _z = 0; _z < elem.parentNode.children.length; _z++) {
                                        elem.parentNode.children[_z].classList.remove('active');
                                        targets[_z].classList.remove('active');
                                    }
                                    elem.classList.add('active');
                                    target.classList.add('active');
                                }
                            };
                        }(switcherElem, switcherTarget, parentNode, switcherTargets));
                    }

                    if (switchersActive.length === switcherElems.length) {
                        switcherElems[0].classList.add('active');
                        switcherTargets[0].classList.add('active');
                    }
                }
            }
        }
    }, {
        key: 'str2json',
        value: function str2json(str, notevil) {
            try {
                if (notevil) {
                    return JSON.parse(str.replace(/([\$\w]+)\s*:/g, function (_, $1) {
                        return '"' + $1 + '":';
                    }).replace(/'([^']+)'/g, function (_, $1) {
                        return '"' + $1 + '"';
                    }));
                } else {
                    return new Function("", "const json = " + str + "; return JSON.parse(JSON.stringify(json));")();
                }
            } catch (e) {
                return false;
            }
        }
    }, {
        key: 'options',
        value: function options(string) {
            var _self = this;

            if (typeof string !== 'string') return string;

            if (string.indexOf(':') !== -1 && string.trim().substr(-1) !== '}') {
                string = '{' + string + '}';
            }

            var start = string ? string.indexOf("{") : -1;
            var options = {};

            if (start !== -1) {
                try {
                    options = _self.str2json(string.substr(start));
                } catch (e) {}
            }

            return options;
        }
    }, {
        key: 'popups',
        value: function popups(options) {
            var _self = this;

            var defaults = {
                reachElementClass: '.js-popup',
                closePopupClass: '.js-close-popup',
                currentElementClass: '.js-open-popup',
                changePopupClass: '.js-change-popup'
            };

            options = $.extend({}, options, defaults);

            var plugin = {
                reachPopups: $(options.reachElementClass),
                bodyEl: $('body'),
                topPanelEl: $('.top-panel-wrapper'),
                htmlEl: $('html'),
                closePopupEl: $(options.closePopupClass),
                openPopupEl: $(options.currentElementClass),
                changePopupEl: $(options.changePopupClass),
                bodyPos: 0
            };

            plugin.openPopup = function (popupName) {
                plugin.reachPopups.filter('[data-popup="' + popupName + '"]').addClass('opened');
                plugin.bodyEl.css('overflow-y', 'scroll');
                // plugin.topPanelEl.css('padding-right', scrollSettings.width);
                plugin.htmlEl.addClass('popup-opened');
            };

            plugin.closePopup = function (popupName) {
                plugin.reachPopups.filter('[data-popup="' + popupName + '"]').removeClass('opened');
                setTimeout(function () {
                    plugin.bodyEl.removeAttr('style');
                    plugin.htmlEl.removeClass('popup-opened');
                    plugin.topPanelEl.removeAttr('style');
                }, 300);
            };

            plugin.changePopup = function (closingPopup, openingPopup) {
                plugin.reachPopups.filter('[data-popup="' + closingPopup + '"]').removeClass('opened');
                plugin.reachPopups.filter('[data-popup="' + openingPopup + '"]').addClass('opened');
            };

            plugin.init = function () {
                plugin.bindings();
            };

            plugin.bindings = function () {
                plugin.openPopupEl.on('click', function (e) {
                    e.preventDefault();
                    var pop = $(this).attr('data-popup-target');
                    plugin.openPopup(pop);
                });

                plugin.closePopupEl.on('click', function (e) {
                    var pop = void 0;
                    if (this.hasAttribute('data-popup-target')) {
                        pop = $(this).attr('data-popup-target');
                    } else {
                        pop = $(this).closest(options.reachElementClass).attr('data-popup');
                    }

                    plugin.closePopup(pop);
                });

                plugin.changePopupEl.on('click', function (e) {
                    var closingPop = $(this).attr('data-closing-popup');
                    var openingPop = $(this).attr('data-opening-popup');

                    plugin.changePopup(closingPop, openingPop);
                });

                plugin.reachPopups.on('click', function (e) {
                    var target = $(e.target);
                    var className = options.reachElementClass.replace('.', '');
                    if (target.hasClass(className)) {
                        plugin.closePopup($(e.target).attr('data-popup'));
                    }
                });
            };

            if (options) plugin.init();

            return plugin;
        }
    }, {
        key: 'svg',
        value: function svg() {
            jQuery('img.svg').each(function () {
                var $img = jQuery(this);
                var imgID = $img.attr('id');
                var imgClass = $img.attr('class');
                var imgURL = $img.attr('src');

                jQuery.get(imgURL, function (data) {
                    // Get the SVG tag, ignore the rest
                    var $svg = jQuery(data).find('svg');

                    // Add replaced image's ID to the new SVG
                    if (typeof imgID !== 'undefined') {
                        $svg = $svg.attr('id', imgID);
                    }
                    // Add replaced image's classes to the new SVG
                    if (typeof imgClass !== 'undefined') {
                        $svg = $svg.attr('class', imgClass + ' replaced-svg');
                    }

                    // Remove any invalid XML tags as per http://validator.w3.org
                    $svg = $svg.removeAttr('xmlns:a');

                    // Replace image with new SVG
                    $img.replaceWith($svg);
                }, 'xml');
            });
        }
    }, {
        key: 'sliders',
        value: function sliders() {
            var $owl = $('.owl-reviews-slider');

            $owl.owlCarousel({
                loop: true,
                nav: true,
                dots: true,
                margin: 40,
                mouseDrag: false,
                navText: '',
                responsive: {
                    0: {
                        items: 1,
                        slideBy: 1,
                        nav: false,
                        mouseDrag: true
                    },
                    767: {
                        items: 2,
                        slideBy: 2,
                        mouseDrag: false
                    }
                }
            });

            var slidesCount = $('.owl-thumbs').find('.thumb-item').length;
            var sync1 = $(".owl-product-images-main");
            var sync2 = $(".owl-product-images-thumbs");
            var slidesPerPage = slidesCount;
            var syncedSecondary = true;

            sync1.owlCarousel({
                items: 1,
                slideSpeed: 2000,
                nav: false,
                autoplay: false,
                dots: false,
                loop: true,
                mouseDrag: false,
                responsiveRefreshRate: 200,
                navText: ['<svg width="100%" height="100%" viewBox="0 0 11 20"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M9.554,1.001l-8.607,8.607l8.607,8.606"/></svg>', '<svg width="100%" height="100%" viewBox="0 0 11 20" version="1.1"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M1.054,18.214l8.606,-8.606l-8.606,-8.607"/></svg>']
            }).on('changed.owl.carousel', syncPosition);

            sync2.on('initialized.owl.carousel', function () {
                sync2.find(".owl-item").eq(0).addClass("current");
            }).owlCarousel({
                items: slidesPerPage,
                dots: false,
                nav: false,
                mouseDrag: false,
                smartSpeed: 200,
                slideSpeed: 500,
                slideBy: slidesPerPage,
                responsiveRefreshRate: 100
            }).on('changed.owl.carousel', syncPosition2);

            function syncPosition(el) {
                var count = el.item.count - 1;
                var current = Math.round(el.item.index - el.item.count / 2 - .5);

                if (current < 0) {
                    current = count;
                }
                if (current > count) {
                    current = 0;
                }

                sync2.find(".owl-item").removeClass("current").eq(current).addClass("current");
                var onscreen = sync2.find('.owl-item.active').length - 1;
                var start = sync2.find('.owl-item.active').first().index();
                var end = sync2.find('.owl-item.active').last().index();

                if (current > end) {
                    sync2.data('owl.carousel').to(current, 100, true);
                }
                if (current < start) {
                    sync2.data('owl.carousel').to(current - onscreen, 100, true);
                }
            }

            function syncPosition2(el) {
                if (syncedSecondary) {
                    var number = el.item.index;
                    sync1.data('owl.carousel').to(number, 100, true);
                }
            }

            sync2.on("click", ".owl-item", function (e) {
                e.preventDefault();
                var number = $(this).index();
                sync1.data('owl.carousel').to(number, 300, true);
            });
        }
    }, {
        key: 'productCount',
        value: function productCount() {
            var $productCountWrapper = $('.jqs-product-count'),
                $input = $productCountWrapper.find('.jqs-product-count-input'),
                $plus = $productCountWrapper.find('.jqs-product-count-plus'),
                $minus = $productCountWrapper.find('.jqs-product-count-minus');

            $input.keypress(function (e) {
                var charCode = e.which ? e.which : e.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
            });

            $input.change(function () {
                if ($input.val() < 0) return false;
            });

            $minus.each(function () {
                $(this).click(function () {
                    var $input = $(this).siblings('.jqs-product-count-input');
                    if (parseInt($input.val()) === 0) return false;else $input.val(parseInt($input.val()) - 1);
                });
            });

            $plus.each(function () {
                $(this).click(function () {
                    var $input = $(this).siblings('.jqs-product-count-input');
                    $input.val(parseInt($input.val()) + 1);
                });
            });
        }
    }, {
        key: 'filterHideShow',
        value: function filterHideShow() {
            var $filterHideShowButton = $('.jqs-show-filter');

            $filterHideShowButton.each(function () {
                var $filterList = $(this).siblings('.jqs-filter');

                $(this).click(function () {
                    if ($filterList.css('display') == 'none') {
                        $filterList.css('display', 'block');
                        $(this).addClass('closed');
                        $(this).removeClass('opened');
                    } else {
                        $filterList.css('display', 'none');
                        $(this).removeClass('closed');
                        $(this).addClass('opened');
                    }
                });
            });
        }
    }, {
        key: 'jcfInit',
        value: function jcfInit() {

            jcf.setOptions('Select', {
                wrapNative: false,
                multipleCompactStyle: false,
                maxVisibleItems: 10,
                useCustomScroll: false
            });

            jcf.replaceAll();
        }
    }]);

    return YOURAPPNAME;
}();

(function () {

    var app = new YOURAPPNAME(document);

    app.appLoad('loading', function () {
        // App is loading... Paste your app code here. 4example u can run preloader event here and stop it in action appLoad dom or full
    });

    app.appLoad('dom', function () {
        // DOM is loaded! Paste your app code here (Pure JS code).
        // Do not use jQuery here cause external libs do not loads here...

    });

    app.appLoad('full', function (e) {
        // App was fully load! Paste external app source code here... 4example if your use jQuery and something else
        // Please do not use jQuery ready state function to avoid mass calling document event trigger!
        app.initSwitcher();
        app.jcfInit();
        app.popups();
        app.svg();
        app.sliders();
        app.productCount();
        app.filterHideShow();
    });
})();