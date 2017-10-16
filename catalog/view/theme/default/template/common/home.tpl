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
                                                <a class="filter-list__item-link" href="#"><?=$filter['name'] ?></a>
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

    </div>

    <!-- Block content end -->

<?php echo $footer; ?>