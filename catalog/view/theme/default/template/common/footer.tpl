<!-- Footer block -->
<?php
$protocol = strtolower(substr($_SERVER["SERVER_PROTOCOL"],0,strpos( $_SERVER["SERVER_PROTOCOL"],'/'))).'://';
$actual_link = "$protocol$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
?>
<footer class="footer">
    <div class="container">
        <div class="footer-grid">
            <div class="fw-width-250 footer-grid__item footer-grid-item">
                <a href="/" class="fw-mb-35">
                    <i class="icon-logo"></i>
                </a>
                <p class="fw-mt-0 fw-mb-0 fw-color-white fw-fz-16">2017 — Все права защищены</p>
            </div>
            <div class="footer-grid__item fw-width-220 footer-grid-item fw-tablet-hidden">
                <p class="fw-mt-0 fw-mb-7 fw-fz-18 fw-color-white fw-text-uppercase fw-font-bold">Категории</p>
                <ul class="footer-list">
                    <?php foreach ($all_categories as $i => $category): ?>
                        <?php if ($actual_link == $category['category_href']): ?>
                            <li class="footer-list__item">
                                <a class="footer-list__item-link active">
                                    <?=$category['category_name']; ?>
                                </a>
                            </li>
                        <?php else : ?>
                            <li class="footer-list__item">
                                <a class="footer-list__item-link" href="<?=$category['category_href'];?>">
                                    <?=$category['category_name']; ?>
                                </a>
                            </li>
                        <?php endif; ?>
                    <?php endforeach; ?>
                </ul>
            </div>
            <div class="footer-grid__item fw-width-210 footer-grid-item fw-tablet-hidden">
                <p class="fw-mt-0 fw-mb-7 fw-fz-18 fw-color-white fw-text-uppercase fw-font-bold">Специальное предложение</p>
                <ul class="footer-list">
                    <?php foreach($filter_groups[2]['filter'] as $filter): ?>
                        <li class="footer-list__item"><a class="footer-list__item-link" href="/all&filter=<?php echo $filter['filter_id'];?>"><?php echo $filter['name']; ?></a></li>
                    <?php endforeach; ?>
                </ul>
            </div>
            <div class="footer-grid__item fw-width-210 footer-grid-item fw-tablet-hidden">
                <p class="fw-mt-0 fw-mb-7 fw-fz-18 fw-color-white fw-text-uppercase fw-font-bold">Бренд</p>
                <ul class="footer-list">
                    <?php foreach($filter_groups[4]['filter'] as $filter): ?>
                        <li class="footer-list__item"><a class="footer-list__item-link" href="/all&filter=<?php echo $filter['filter_id'];?>"><?php echo $filter['name']; ?></a></li>
                    <?php endforeach; ?>
                </ul>
            </div>
            <div class="footer-grid__item fw-flex-grow-1 footer-grid-item fw-mobile-hidden">
                <p class="fw-mt-0 fw-mb-7 fw-color-white fw-fz-14">Ежедневно 10:00 – 21:00</p>
                <p class="fw-mt-0 fw-mb-35 fw-color-white fw-fz-24">+7 (7232) 12 34 56</p>
                <div class="btn btn__call">
                    Заказать звонок
                </div>
            </div>
        </div>
    </div>
</footer>

<div class="popup-wrapper popup-wrapper_mobile-menu js-popup" data-popup="mobile-menu">
    <div class="mobile-menu">
        <span class="close-mobile-menu js-close-popup"></span>
        <ul class="mobile-menu__list">
            <?php foreach ($all_categories as $i => $category): ?>
                <li class="mobile-menu__item">
                    <a class="mobile-menu__item-link" href="<?=$category['category_href'];?>">
                        <?=$category['category_name']; ?>
                    </a>
                </li>
            <?php endforeach; ?>
        </ul>
    </div>
</div>

<div class="popup-wrapper js-popup" data-popup="thanks">
    <div class="thanks-popup js-thanks">
        <span class="popup-close js-close-popup"></span>
        <p class="fw-fz-32 fw-text-center">Спасибо!</p>
        <p class="fw-fz-24 fw-text-center">Наш менеджер свяжется с вами в ближайшее время</p>
    </div>
</div>

<script src="/catalog/view/javascript/common.js" type="text/javascript"></script>
<script src="/catalog/view/javascript/vendor.js" type="text/javascript"></script>
<script src="/catalog/view/javascript/custom.js" type="text/javascript"></script>