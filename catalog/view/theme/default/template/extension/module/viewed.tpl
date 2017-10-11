<?php if (count($products) >= 4) :?>
    <div class="product-cont-catalog">
        <h2>ВЫ СМОТРЕЛИ</h2>
        <ul class="list-product prod-items-carousel owl-carousel">
            <?php foreach ($products as $product): ?>
                <li class="product-item">
                    <form action="#">
                        <input type="hidden" name="product_id" value="<?=$product['product_id']; ?>">
                        <a href="<?php echo $product['href']; ?>" class="img-product-item"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a>
                        <span class="name-product-item"><span><?php echo $product['name']; ?></span>
                        <div class="price-product-item">
                            <?php if ($product['special']): ?>
                                <?php
                                    $special_price = str_replace(' ', ',', str_replace(('.00 р.'), '', $product['special']));
                                    $default_price = str_replace(' ', '', str_replace(('.0000'), '', $product['price']));
                                ?>
                                <span class="new-price-item"><span><?=$special_price?></span> руб</span>
                                <span class="old-price-item">/ <span><?=$default_price?></span></span>
                            <?php else: ?>
                                <span class="new-price-item"><span><?=$default_price?></span> руб</span>
                            <?php endif; ?>
                        </div>
                        <a href="#" class="btn btn-icon js-btn-buy js-btn-loading">
                            <span>купить сейчас</span>
                            <i class="icon"> › </i>
                        </a>
                        <?php foreach($options as $option):?>
                            <?php if($option['option_id'] == 13):?>
                                <?php if (!empty(($option['value']))):?>
                                    <span class="product-item-sale"><?=$option['value'];?></span>
                                <?php endif;?>
                            <?php endif;?>
                        <?php endforeach;?>
                    </form>
                </li>
            <?php endforeach; ?>
        </ul>
    </div>
<?php endif;?>