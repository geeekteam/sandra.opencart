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