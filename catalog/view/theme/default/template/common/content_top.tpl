<?=$modules[0];?>
<?=$modules[1];?>

<!--Фильтр-->
    <div class="container">
        <div class="filter">
            <div class="filter-cont">
                <div class="filter-bl">
                    <span class="tt-filter">категории</span>
                    <ul class="list-link-filter">
                        <?php foreach ($all_categories as $category): ?>
                            <?php if (intval($category['sort_order']) > 999 && intval($category['sort_order']) < 1999): ?>
                                <li><a href="<?php echo $category['category_href']; ?>"><?php echo $category['category_name'] ?></a></li>
                            <?php endif; ?>
                        <?php endforeach; ?>
                    </ul>
                </div>
                <div class="filter-bl">
                    <span class="tt-filter">МОДЕЛИ</span>
                    <ul class="list-link-filter">
                        <?php foreach ($all_categories as $category): ?>
                            <?php if (intval($category['sort_order']) > 1999 && intval($category['sort_order']) < 2999): ?>
                                <li><a href="<?php echo $category['category_href']; ?>"><?php echo $category['category_name'] ?></a></li>
                            <?php endif; ?>
                        <?php endforeach; ?>
                    </ul>
                </div>
                <div class="filter-bl">
                    <span class="tt-filter">МАТЕРИАЛ</span>
                    <ul class="list-link-filter">
                    <?php foreach($filter_groups[1]['filter'] as $filter): ?>
                        <li><a href="/all&filter=<?php echo $filter['filter_id'];?>"><?php echo $filter['name']; ?></a></li>
                    <?php endforeach; ?>
                    </ul>
                </div>
                <div class="filter-bl">
                    <span class="tt-filter">Цвета</span>
                    <ul class="list-color">
                        <?php foreach($filter_groups[0]['filter'] as $filter): ?>
                            <?php
                                $color_info = explode('|', $filter['name']);
                                $color_name = $color_info[0];
                                $color_code = explode('(', $color_info[1]);
                            ?>
                            <li>
                                <a href="/all&filter=<?php echo $filter['filter_id'];?>" style="background-color:<?php echo $color_code[0] ?>"></a>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                    <span class="tt-filter">Размер</span>
                    <ul class="list-size-filter">
                        <?php foreach($filter_groups[2]['filter'] as $filter): ?>
                            <li><a href="/all&filter=<?php echo $filter['filter_id'];?>"><?php echo $filter['name']; ?></a></li>
                        <?php endforeach; ?>
                    </ul>
                </div>
            </div>
            <span class="filter-btn"><span></span></span>
        </div>
    </div>
<!--Конец фильтра-->

<?=$modules[2];?>

<!--Товары на главной-->
<?=$modules[3];?>
<?=$modules[4];?>
<?=$modules[5];?>
<?=$modules[6];?>
<?=$modules[7];?>
<?=$modules[8];?>
<?=$modules[9];?>
<?=$modules[10];?>
<?=$modules[11];?>
<?=$modules[12];?>
<!--Конец товаров на главной-->

<!--ПОЧЕМУ КЛИЕНТЫ ВЫБИРАЮТ НАС-->
<?=$modules[13];?>

<div class="reviews">
    <div class="container">
        <h2 class="col-wt">ОТЗЫВЫ <a href="/otzyvy">СМОТРЕТЬ ВСЕ</a></h2>
        <div class="owl-carousel reviews-slider">
            <?php $i = 0; shuffle($custom_reviews['text']); foreach ($custom_reviews['text'] as $review): ?>
                <div class="reviews-slider-item">
                    <div class="txt-reviews-slider">
                        <span class="ic-q"><img src="/image/q-icon.png" alt=""></span>
                        <p><?=htmlspecialchars_decode($review['description']);?></p>
                    </div>
                    <div class="img-reviews">
                        <span><img src="/image/<?=$review['image'];?>" alt=""></span>
                        <p><?=$review['name'];?></p>
                    </div>
                </div>
            <?php $i++; if($i == 4) break; endforeach; ?>
        </div>
    </div>
</div>
<!--SEO-текст-->
<?=$modules[14];?>