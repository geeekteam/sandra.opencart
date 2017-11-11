<?php foreach ($filter_groups as $filters): ?>
    <div class="filter">
        <div class="filter__name jqs-show-filter"><?=$filters['name']; ?></div>
        <ul class="filter-list jqs-filter">
            <?php foreach ($filters['filter'] as $filter) : ?>
                <?php
                $checked = '';
                (isset($_GET['filter']) && in_array($filter['filter_id'], explode(',', $_GET['filter']))) && $checked = 'checked';
                ?>
                <?php if ($filter['products_count'] > 0): ?>
                    <li class="filter-list__item">
                        <label>
                            <input class="display-none" type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" <?=$checked; ?>>
                            <a class="filter-list__item-link" href="/all&filter=<?php echo $filter['filter_id'];?>"><?=$filter['name'] ?></a>
                        </label>
                    </li>
                <?php endif; ?>
            <?php endforeach; ?>
        </ul>
    </div>
<?php endforeach; ?>

<script>

    //Фильтрация по клику на элемент фильтра
    $('.filter-list__item').on('click', function () {
        var filter = [];
        $('input[name^=\'filter\']:checked').each(function (element) {
            filter.push(this.value);
        });
        location = '<?php echo $action; ?>&filter=' + filter.join(',');
    });

</script>