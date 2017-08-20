
<!-- ========================================================================= -->
<!-- მოდული popularic დასაწყისი -->


<?php  foreach($categories as $category) { ?>  <!-- ეს არის მთავარი ციკლი, გაივლის ყველა კატეგორიას -->
  <?php if( $category['category_name'] ) { ?> <!-- ვამოწმებთ კატეგორიის სახელს -->

    <div id="Tab_Category_Slider" class="categorytab box">
      <div class="container">
        <div class="row">
          <div class="categorytab-heading box-heading"><?php echo  $category['category_name']; ?></div>

          <div class="tabs">
        		<div class="tab-content">
              <div class="tab-pane active" id="<?php echo $category['category_name']; ?>" >
              <div class="owl-carousel owl-demo-tabcate">
                <?php foreach ($products as $product) { ?> <!-- პროდუქტების ციკლი -->
                  <?php	if($category['category_id'] == $product['category_id']) { ?> <!-- ირჩევა პროდუქტი კონკრეტული კატეგორიის -->
                    <!-- ?php echo "<pre>"; print_r($product['category_id']); echo "</pre>;"  ? -->

                    <div class="item">
                       <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                          <div class="product-block product-thumb transition">
                             <div class="product-block-inner">

                                <?php if ($product['thumb_swap']) { ?>
                                   <div class="image">
                                      <a href="<?php echo $product['href']; ?>">
              </div                        <div class="button-group">
                                        <button type="button" class="addtocart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                                        <button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                                        <button class="compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                                      </div>
                                   </div>
                                <?php } else {?>
                                     <div class="image">
                                        <a href="<?php echo $product['href']; ?>">
                                            <img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive"/>
                                        </a>
                                     <?php if (!$product['special']) { ?>
                                     <?php } else { ?>
                                               <span class="saleicon sale">Sale</span>
                                     <?php } ?>
                                        <div class="button-group prod_hover">
                                            <button type="button" class="addtocart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                                            <button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                                            <button class="compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                                        </div>
                                      </div>
                                      <?php } ?>
                                <div class="product-details">
                                  <div class="caption">
                                    <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                    <?php /*?><p class="desc"><?php echo $product['description']; ?></p><?php */?>

                                    <?php if ($product['price']) { ?>
                                      <p class="price">
                                        <?php if (!$product['special']) { ?>
                                            <?php echo $product['price']; ?>
                                        <?php } else { ?>
                                            <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                                        <?php } ?>
                                        <?php if ($product['tax']) { ?>
                                            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                        <?php } ?>
                                      </p>
                                      <?php } ?>

                                      <div class="rating">
                                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                                        <?php if ($product['rating'] < $i) { ?>
                                        <span class="fa fa-stack"><i class="fa fa-star off fa-stack-2x"></i></span>
                                        <?php } else { ?>
                                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                        <?php } ?>
                                        <?php } ?>
                                      </div>

                                      <div class="button-group">
                                          <button type="button" class="addtocart" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                                          <button class="wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                                          <button class="compare"  type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                                      </div>

                                  </div>
                                </div>
                            </div>
                          </div>
                      </div>
                    </div>

                  <?php } ?> <!-- ირჩევა პროდუქტი კონკრეტული კატეგორიის -->

                <?php } ?> <!-- პროდუქტების ციკლი -->
            </div> <!-- owl-carousel owl-demo-tabcate -->
          </div>
            </div> <!-- tab-content -->
          </div>   <!-- tabs -->
        </div> <!-- row -->
      </div> <!-- container -->
    </div>  <!-- id="Tab_Category_Slider" -->
  <?php } ?> <!-- დასასრული კატეგორიის სახელის შემოწმების -->

<?php } ?> <!-- დასასრული მთავარი ციკლის -->

<script type="text/javascript"><!--
$(document).ready(function() {
$('#Tab_Category_Slider .owl-demo-tabcate').owlCarousel({
	items: 5,
	navigation: true,
	navigationText: ['<span class="left"></span>', '<span class="right"></span>'],
	pagination: false,
	transitionStyle : "fade",
	itemsCustom : [
		[0, 1],
        [379, 2],
        [549, 3],
        [767, 3],
        [979, 3],
        [1201, 5]
      ]
});
});
function <?php echo $rand_str; ?>loadAjaxData(category_id) {
	var unavailabledates = <?php echo json_encode($setting); ?>;
	var dataToSend = {'category_id' : category_id, 'setting' : unavailabledates };
	$.ajax({
		type: 'POST',
		data: dataToSend,
		url: '<?php echo HTTP_SERVER;?>index.php?route=module/popularic/ajaxloaddata',
		beforeSend: function() {
		  $("#<?php echo $rand_str;?>").html('<div style="text-align:center;"></div>');
		  //http://www.bigtravelsghana.com/img/images/ajax-loader.gif
	   },
		success: function (data) {
			$('#Tab_Category_Slider').replaceWith(data);
			$('#Tab_Category_Slider .owl-demo-tabcate').owlCarousel({
				items: 5,
				navigation: true,
				navigationText: ['<span class="left"></span>', '<span class="right"></span>'],
				pagination: false,
				transitionStyle : "fade",
				itemsCustom : [
					[0, 1],
					[379, 2],
					[549, 3],
					[767, 3],
					[979, 3],
					[1201, 5]
				 ]
			});
		}
	});
}
--></script>



<!-- მოდული popularic დასასრული -->
<!-- ========================================================================= -->
