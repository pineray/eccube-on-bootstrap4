<!--{*
 * EC-CUBE on Bootstrap4. This file is part of EC-CUBE
 *
 * Copyright(c) PineRay. All Rights Reserved.
*
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *}-->

<!--{strip}-->
    <!--{if count($arrBestProducts) > 0}-->
        <div class="block_outer clearfix">
            <div id="recommend_area">
                <h2><i class="far fa-thumbs-up"></i> おすすめ商品情報</h2>
                <div class="block_body clearfix row row-cols-1 row-cols-lg-2">
                    <!--{foreach from=$arrBestProducts item=arrProduct name="recommend_products"}-->
                        <div class="product_item clearfix col">
                            <div class="media">
                                <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrProduct.product_id|u}-->">
                                    <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.main_list_image|sfNoImageMainList|h}-->" class="img-fluid rounded mr-3" alt="<!--{$arrProduct.name|h}-->" />
                                </a>
                                <div class="productContents media-body">
                                    <h3>
                                        <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrProduct.product_id|u}-->"><!--{$arrProduct.name|h}--></a>
                                    </h3>
                                    <p class="sale_price">
                                        <span class="price"><!--{$arrProduct.price02_min_inctax|n2s}--> 円</span>
                                    </p>
                                    <p class="mini comment"><!--{$arrProduct.comment|h|nl2br}--></p>
                                </div>
                            </div>
                        </div>
                    <!--{/foreach}-->
                </div>
            </div>
        </div>
    <!--{/if}-->
<!--{/strip}-->
