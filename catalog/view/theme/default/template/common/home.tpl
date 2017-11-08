<?php echo $header; ?>

    <!-- Block content -->

    <div class="home-page">

        <?php echo $column_left; ?>

        <div class="main-content">
            <div class="container">
                <div class="main-content-with-sidebar">
                    <div class="main-content__main">
                        <?php echo $content_top; ?>
                    </div>
                    <div class="sidebar">
                        <div class="filters">

                            <div class="filter filter_bg-gray">
                                <div class="filters__title">Фильтры</div>
                            </div>

                            <?php foreach ($filter_groups as $filters): ?>
                                <div class="filter">
                                    <div class="filter__name jqs-show-filter"><?=$filters['name']; ?></div>
                                    <ul class="filter-list jqs-filter">
                                        <?php foreach ($filters['filter'] as $filter) : ?>
                                            <li class="filter-list__item">
                                                <a class="filter-list__item-link" href="/all&filter=<?php echo $filter['filter_id'];?>"><?=$filter['name'] ?></a>
                                            </li>
                                        <?php endforeach; ?>
                                    </ul>
                                </div>
                            <?php endforeach; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <?php echo $content_bottom; ?>
        <div class="reviews">
            <div class="container">
                <div class="fw-mb-40 fw-flex fw-flex-bottom@m fw-flex-column@xs fw-flex-row@m fw-flex-top@xs fw-flex-center">
                    <h2 class="fw-fz-30@m fw-fz18@xs fw-text-uppercase fw-mt-0 fw-mb-0 fw-line-height-1 fw-color-white">Отзывы</h2>
                    <a class="fw-ml-25@m fw-ml-0@xs fw-mt-0@m fw-mt-15@xs fw-color-orange fw-text-lowercase fw-fz-18@m fw-fz-14@xs fw-link-without-underline" href="#">смотреть все</a>
                </div>
                <div class="owl-reviews-slider owl-carousel">
                    <?php $i = 0; shuffle($custom_reviews['text']); foreach ($custom_reviews['text'] as $review): ?>
                        <div class="owl-reviews-slider__item reviews-item">
                            <div class="reviews-item__text-wrapper">
                                <div class="reviews-item__text">
                                    <p class="fw-mt-0 fw-mb-20 fw-font-bold fw-fz-18">Лучший интернет-магазин парфюма!</p>
                                    <p class="fw-mt-0 fw-mb-0 fw-fz-16"><?=htmlspecialchars_decode($review['description']);?></p>
                                </div>
                            </div>
                            <div class="reviews-item__user-info">
                                <div class="reviews-item__image-wrapper">
                                    <img src="/image/<?=$review['image'];?>" alt="" class="reviews-item__image">
                                </div>
                                <p class="reviews-item__user-name"><?=$review['name'];?></p>
                            </div>
                        </div>
                    <?php $i++;  endforeach; ?>
                </div>
            </div>
        </div>
    </div>

    <!-- Block content end -->

<?php echo $footer; ?>