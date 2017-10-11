<div class="filter-aside">
    <div class="filter-aside-tt">
        <span>Фильтры</span>
        <?php
        $filter_pos = strpos($_SERVER['REQUEST_URI'], 'filter');
        $uri = $_SERVER['REQUEST_URI'];
        ?>
        <?php if (strpbrk((substr($uri, $filter_pos)), '1234567890')!==false): ?>
        <button type="reset" class="js-reset-filter">
        <?php else: ?>
        <button type="reset" class="js-reset-filter hidden">
        <?php endif; ?>
            <i class="icon"><img src="/image/delete-icon.png" alt=""></i>
            <span>Сбросить все</span>
        </button>
    </div>
    <?php $i = 0; foreach($filter_groups as $filter_group):?>
        <?php if($filter_group['filter_group_id'] == 2 && (count($filter_group['filter']) > 1)):?>
            <div class="filter-aside-cont">
                <span class="tt-filter-aside-cont">Основной цвет</span>
                <ul class="list-filter-aside-color">
                    <?php foreach($filter_group['filter'] as $filter): ?>
                        <?php
                            $color_info = explode('|', $filter['name']);
                            $color_name = $color_info[0];
                            $color_code = explode('(', $color_info[1]);
                            $color_count = str_replace(')', '', $color_code[1]);
                            $checked = '';
                            (isset($_GET['filter']) && in_array($filter['filter_id'], explode(',', $_GET['filter']))) && $checked = 'checked';

                        ?>
                        <?php foreach ($filter['filter_product_id'] as $filter_id): ?>
                            <?php if((isset($filter['products'][$filter_id]['product_id']) == isset($filter_id))):?>
                                <?php $i += count($color_count);?>
                                    <?php if($i==1):?>
                                    <li class="filter-item">
                                        <label>
                                            <input class="hidden-checkbox" type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" <?=$checked; ?>>
                                            <a><span class="col-aside" style="background-color:<?=$color_code[0]?>;"></span><span class="js-filter-name" data-filter-name="<?=$color_name;?>"><?=$color_name;?> (<?=$color_count;?>)</span></a>
                                        </label>
                                    </li>
                                <?php endif;?>
                            <?php endif;?>
                        <?php endforeach;?>
                        <?php $i=0;?>
                    <?php endforeach;?>
                </ul>
                <span class="js-all-filters all-filters hidden">Все</span>
            </div>
        <?php elseif($filter_group['filter_group_id'] == 3 && (count($filter_group['filter']) > 1)): ?>
            <div class="filter-aside-cont">
                <span class="tt-filter-aside-cont">Материал</span>
                <ul class="list-filter-material">
                    <?php foreach($filter_group['filter'] as $filter): ?>
                        <?php
                            $material = explode('(', $filter['name']);
                            $material_name = $material[0];
                            $material_count = str_replace(')', '', $material[1]);
                            $checked = '';
                            (isset($_GET['filter']) && in_array($filter['filter_id'], explode(',', $_GET['filter']))) && $checked = 'checked';
                        ?>
                        <?php foreach ($filter['filter_product_id'] as $filter_id): ?>
                            <?php if((isset($filter['products'][$filter_id]['product_id']) == isset($filter_id))):?>
                            <?php $i += count($color_count);?>
                                <?php if($i==1):?>
                                    <li class="filter-item">
                                        <label>
                                            <input class="hidden-checkbox" type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" <?=$checked; ?>>
                                            <a><span class="js-filter-name" data-filter-name="<?=$material_name;?>"><?=$material_name;?> (<?=$material_count?>)</span></a>
                                        </label>
                                    </li>
                                <?php endif;?>
                            <?php endif;?>
                        <?php endforeach;?>
                        <?php $i=0;?>
                    <?php endforeach;?>
                </ul>
                <span class="js-all-filters all-filters hidden">Все</span>
            </div>
        <?php elseif($filter_group['filter_group_id'] == 1 && (count($filter_group['filter']) > 1)): ?>
            <div class="filter-aside-cont">
                <span class="tt-filter-aside-cont">Размер</span>
                <ul class="list-size-filter">
                    <?php foreach($filter_group['filter'] as $filter): ?>
                    <?php
                        $size = explode('(', $filter['name']);
                        $size_name = $size[0];
                        $size_count = str_replace(')', '', $size[1]);
                        $checked = '';
                        (isset($_GET['filter']) && in_array($filter['filter_id'], explode(',', $_GET['filter']))) && $checked = 'checked';
                    ?>
                        <?php foreach ($filter['filter_product_id'] as $filter_id): ?>
                            <?php if((isset($filter['products'][$filter_id]['product_id']) == isset($filter_id))):?>
                                <?php $i += count($color_count);?>
                                <?php if($i==1):?>
                                    <li class="filter-item">
                                        <label>
                                            <input class="hidden-checkbox" type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" <?=$checked; ?>>
                                            <a><span class="js-filter-name" data-filter-name="<?=$size_name;?>"><?=$size_name;?></span></a>
                                        </label>
                                    </li>
                                <?php endif;?>
                            <?php endif;?>
                        <?php endforeach;?>
                        <?php $i=0;?>
                    <?php endforeach;?>
                </ul>
                <span class="js-all-filters all-filters hidden">Все</span>
            </div>
        <?php elseif($filter_group['filter_group_id'] == 4 && (count($filter_group['filter']) > 1)): ?>
            <div class="filter-aside-cont">
                <span class="tt-filter-aside-cont">Высота обуви</span>
                <ul class="list-shoe-height">
                    <?php foreach($filter_group['filter'] as $filter): ?>
                    <?php
                        $height = explode('(', $filter['name']);
                        $height_name = $height[0];
                        $height_count = str_replace(')', '', $height[1]);
                        $checked = '';
                        (isset($_GET['filter']) && in_array($filter['filter_id'], explode(',', $_GET['filter']))) && $checked = 'checked';
                    ?>
                        <?php foreach ($filter['filter_product_id'] as $filter_id): ?>
                            <?php if((isset($filter['products'][$filter_id]['product_id']) == isset($filter_id))):?>
                                <?php $i += count($color_count);?>
                                <?php if($i==1):?>
                                    <li class="filter-item">
                                        <label>
                                            <input class="hidden-checkbox" type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" <?=$checked; ?>>
                                            <a><span class="js-filter-name" data-filter-name="<?=$height_name;?>"><?=$height_name;?></span></a>
                                        </label>
                                    </li>
                                <?php endif;?>
                            <?php endif;?>
                        <?php endforeach;?>
                    <?php $i=0;?>
                    <?php endforeach;?>
                </ul>
                <span class="js-all-filters all-filters hidden">Все</span>
            </div>
        <?php endif;?>
    <?php endforeach;?>
</div>

<script>
    //Очистка фильтра по нажатию на кнопку "Все", показ всех элементов фильтра
    $('.js-all-filters').on('click', function () {
        var newLocation = location.href,
            filter = [];
        newLocation = newLocation.split('filter=').pop();
        newLocation = newLocation.split(',');
        $(this).closest('.filter-aside-cont').find('input[name^=\'filter\']:checked').each(function (element) {
            var index = newLocation.indexOf(this.value);
            newLocation.splice(index, 1);
            filter.push(newLocation);
        });
        location = '<?php echo $action; ?>&filter=' + filter.join(',');
    });

    //Фильтрация по клику на элемент фильтра
    $('.filter-item').on('click', function () {
        var filter = [];
        $('input[name^=\'filter\']:checked').each(function (element) {
            filter.push(this.value);
        });
        location = '<?php echo $action; ?>&filter=' + filter.join(',');
    });

    //Сброс всех фильтров
    $('.js-reset-filter').on('click', function () {
        location = '<?php echo $action; ?>';
    });
</script>