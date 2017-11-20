<?php $filter_is_true = false; ?>

<div class="filters">
    <div class="filter filter_bg-gray">
        <div class="filters__title">Фильтры</div>
        <?php if (strpbrk((substr($uri, $filter_pos)), '1234567890')!==false): ?>
            <button type="reset" class="js-reset-filter">
        <?php else: ?>
        <button type="reset" class="js-reset-filter hidden">
            <?php endif; ?>
            <i class="icon"><img src="/image/delete-icon.png" alt=""></i>
            <span>Сбросить все</span>
        </button>
    </div>
    <?php $i = 0; foreach ($filter_groups as $filters): ?>

        <?php foreach ($filters['filter'] as $filter) : ?>
            <?php if ($filter['products_count'] > 0) : ?>
                <?php foreach ($filter['filter_product_id'] as $filter_id) : ?>
                    <?php if ($filter['products'][$filter_id]['product_id'] == $filter_id) : ?>
                        <?php $i += count($filter['products_count']);?>
                        <?php if($i==1):?>
                            <?php $filter_is_true = true; ?>
                        <?php endif; ?>
                    <?php endif; ?>
                <?php endforeach; $i = 0; ?>
            <?php endif; ?>
        <?php endforeach; ?>

        <?php if ($filter_is_true == true) : ?>
            <div class="filter">
                <div class="filter__name jqs-show-filter"><?=$filters['name']; ?></div>
                <ul class="filter-list jqs-filter">
                    <?php foreach ($filters['filter'] as $filter) : ?>
                        <?php
                            $checked = '';
                            (isset($_GET['filter']) && in_array($filter['filter_id'], explode(',', $_GET['filter']))) && $checked = 'checked';
                        ?>
                        <?php if ($filter['products_count'] > 0) : ?>
                            <?php foreach ($filter['filter_product_id'] as $filter_id) : ?>
                                <?php if ($filter['products'][$filter_id]['product_id'] == $filter_id) : ?>
                                    <?php $i += count($filter['products_count']);?>
                                    <?php if($i==1):?>
                                        <li class="filter-list__item">
                                            <label>
                                                <input class="display-none" type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" <?=$checked; ?>>
                                                <a class="filter-list__item-link"><?=$filter['name']; ?> (<?=$filter['products_count']; ?>)</a>
                                            </label>
                                        </li>
                                    <?php endif; ?>
                                <?php endif; ?>
                            <?php endforeach; $i = 0; ?>
                        <?php endif; ?>
                    <?php endforeach; ?>
                </ul>
                <p class="js-all-filters filter__all hidden">Все</p>
            </div>
        <?php endif; ?>
        <?php $filter_is_true = false; ?>
    <?php endforeach; ?>
</div>



<script>

    //Фильтрация по клику на элемент фильтра
    $('.filter-list__item').on('click', function () {
        var filter = [];
        $('input[name^=\'filter\']:checked').each(function (element) {
            filter.push(this.value);

        });
        location = '<?php echo $action; ?>&filter=' + filter.join(',');
    });

    $('.js-all-filters').on('click', function () {
        var newLocation = location.href,
            filter = [];
        newLocation = newLocation.split('filter=').pop();
        newLocation = newLocation.split(',');
        $(this).closest('.jqs-filter').find('input[name^=\'filter\']:checked').each(function (element) {
            var index = newLocation.indexOf(this.value);
            newLocation.splice(index, 1);
            filter.push(newLocation);
        });
        location = '<?php echo $action; ?>&filter=' + filter.join(',');
    });

    $('.js-reset-filter').on('click', function () {
        location = '<?php echo $action; ?>';
    });

</script>