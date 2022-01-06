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

<div id="undercolumn">
    <div id="undercolumn_cart">
        <h2 class="title"><!--{$tpl_title|h}--></h2>

        <!--{if $smarty.const.USE_POINT !== false && !empty($arrProductsClass)}-->
            <!--★ポイント案内★-->
            <div class="point_announce alert alert-info">
                <!--{if $tpl_login}-->
                    <span class="user_name"><!--{$tpl_name|h}--> 様</span>の、現在の所持ポイントは「<span class="point"><!--{$tpl_user_point|n2s|default:0|h}--> pt</span>」です。<br />
                <!--{else}-->
                    ポイント制度をご利用になられる場合は、会員登録後ログインしてくださいますようお願い致します。<br />
                <!--{/if}-->
                ポイントは商品購入時に<span class="price">1pt＝<!--{$smarty.const.POINT_VALUE|h}-->円</span>として使用することができます。<br />
            </div>
        <!--{/if}-->

        <div class="totalmoney_area">
            <!--{* カゴの中に商品がある場合にのみ表示 *}-->
            <!--{if count($cartKeys) > 1}-->
                <div class="alert alert-danger">
                    <!--{foreach from=$cartKeys item=key name=cartKey}--><!--{$arrProductType[$key]|h}--><!--{if !$smarty.foreach.cartKey.last}-->、<!--{/if}--><!--{/foreach}-->は同時購入できません。<br />
                    お手数ですが、個別に購入手続きをお願い致します。
                </span>
            <!--{/if}-->

            <!--{if strlen($tpl_error) != 0}-->
                <div class="alert alert-danger"><!--{$tpl_error|h}--></div>
            <!--{/if}-->

            <!--{if strlen($tpl_message) != 0}-->
                <div class="alert alert-danger"><!--{$tpl_message|h|nl2br}--></div>
            <!--{/if}-->
        </div>

        <!--{if !empty($cartItems)}-->
            <!--{foreach from=$cartKeys item=key}-->
                <form name="form<!--{$key|h}-->" id="form<!--{$key|h}-->" method="post" action="?">
                    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|h}-->" value="<!--{$transactionid|h}-->" />
                    <input type="hidden" name="mode" value="confirm" />
                    <input type="hidden" name="cart_no" value="" />
                    <input type="hidden" name="cartKey" value="<!--{$key|h}-->" />
                    <input type="hidden" name="category_id" value="<!--{$tpl_category_id|h}-->" />
                    <input type="hidden" name="product_id" value="<!--{$tpl_product_id|h}-->" />
                    <div class="form_area card">
                        <!--{if count($cartKeys) > 1}-->
                            <h3 class="card-header"><!--{$arrProductType[$key]|h}--></h3>
                            <!--{assign var=purchasing_goods_name value=$arrProductType[$key]}-->
                        <!--{else}-->
                            <!--{assign var=purchasing_goods_name value="カゴの中の商品"}-->
                        <!--{/if}-->
                        <div class="list-group list-group-flush">
                            <div class="list-group-item">
                                <!--{$purchasing_goods_name|h}-->の合計金額は「<span class="price"><!--{$tpl_total_inctax[$key]|n2s|h}-->円</span>」です。
                                <!--{if $key != $smarty.const.PRODUCT_TYPE_DOWNLOAD}-->
                                    <!--{if $arrInfo.free_rule > 0}-->
                                        <!--{if !$arrData[$key].is_deliv_free}-->
                                            あと「<span class="price"><!--{$tpl_deliv_free[$key]|n2s|h}-->円</span>」で送料無料です！！
                                        <!--{else}-->
                                            現在、「<span class="attention">送料無料</span>」です！！
                                        <!--{/if}-->
                                    <!--{/if}-->
                                <!--{/if}-->
                            </div>

                            <!--{foreach from=$cartItems[$key] item=item}-->
                                <div class="list-group-item<!--{if $item.error}--> item-danger<!--{/if}-->">
                                    <div class="row">
                                        <div class="col-3 col-md-2 text-center">
                                        <!--{if $item.productsClass.main_image|strlen >= 1}-->
                                            <a class="expansion" target="_blank" href="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$item.productsClass.main_image|sfNoImageMainList|h}-->">
                                        <!--{/if}-->
                                                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$item.productsClass.main_list_image|sfNoImageMainList|h}-->" alt="<!--{$item.productsClass.name|h}-->" class="img-fluid" />
                                        <!--{if $item.productsClass.main_image|strlen >= 1}-->
                                            </a>
                                        <!--{/if}-->
                                        </div>
                                        <div class="col">
                                            <a href="?" onclick="eccube.fnFormModeSubmit('form<!--{$key|h}-->', 'cartDelete', 'cart_no', '<!--{$item.cart_no|h}-->'); return false;" class="btn btn-sm btn-link float-right">
                                                <i class="bi bi-trash"></i> <span class="d-none d-sm-inline">削除</span>
                                            </a>
                                            <div class="cart-item-title">
                                                <!--{* 商品名 *}--><strong><!--{$item.productsClass.name|h}--></strong>
                                                <!--{if $item.productsClass.classcategory_name1 != ""}-->
                                                    <div><small><!--{$item.productsClass.class_name1|h}-->：<!--{$item.productsClass.classcategory_name1|h}--></small></div>
                                                <!--{/if}-->
                                                <!--{if $item.productsClass.classcategory_name2 != ""}-->
                                                    <div><small><!--{$item.productsClass.class_name2|h}-->：<!--{$item.productsClass.classcategory_name2|h}--></small></div>
                                                <!--{/if}-->
                                            </div>
                                            <div class="cart-item-price">
                                                価格: <!--{$item.price_inctax|n2s|h}-->円
                                            </div>
                                            <hr class="d-none d-md-block">
                                            <div class="justify-content-between d-none d-md-flex">
                                                <div>
                                                    数量: <!--{$item.quantity|h}-->
                                                    <div class="btn-group btn-group-sm" role="group">
                                                        <a href="?" onclick="eccube.fnFormModeSubmit('form<!--{$key|h}-->','up','cart_no','<!--{$item.cart_no|h}-->'); return false" class="btn btn-secondary"><i class="bi bi-plus-lg"></i></a>
                                                        <!--{if $item.quantity > 1}-->
                                                            <a href="?" onclick="eccube.fnFormModeSubmit('form<!--{$key|h}-->','down','cart_no','<!--{$item.cart_no|h}-->'); return false" class="btn btn-secondary"><i class="bi bi-dash-lg"></i></a>
                                                        <!--{/if}-->
                                                    </div>
                                                </div>
                                                <div>小計: <!--{$item.total_inctax|n2s|h}-->円</div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="d-block d-md-none">
                                    <div class="justify-content-between d-flex d-md-none">
                                        <div>
                                            数量: <!--{$item.quantity|h}-->
                                            <div class="btn-group btn-group-sm" role="group">
                                                <a href="?" onclick="eccube.fnFormModeSubmit('form<!--{$key|h}-->','up','cart_no','<!--{$item.cart_no|h}-->'); return false" class="btn btn-secondary"><i class="bi bi-plus-lg"></i></a>
                                                <!--{if $item.quantity > 1}-->
                                                    <a href="?" onclick="eccube.fnFormModeSubmit('form<!--{$key|h}-->','down','cart_no','<!--{$item.cart_no|h}-->'); return false" class="btn btn-secondary"><i class="bi bi-dash-lg"></i></a>
                                                <!--{/if}-->
                                            </div>
                                        </div>
                                        <div>小計: <!--{$item.total_inctax|n2s|h}-->円</div>
                                    </div>
                                </div>
                            <!--{/foreach}-->
                            <div class="list-group-item d-flex justify-content-between align-items-center">
                                <div>合計</div>
                                <div><span class="price"><!--{$arrData[$key].total-$arrData[$key].deliv_fee|n2s|h}-->円</span></div>
                            </div>
                            <!--{if $smarty.const.USE_POINT !== false}-->
                                <!--{if $arrData[$key].birth_point > 0}-->
                                    <div class="list-group-item d-flex justify-content-between align-items-center">
                                        <div>お誕生月ポイント</div>
                                        <div><!--{$arrData[$key].birth_point|n2s|h}-->pt</div>
                                    </div>
                                <!--{/if}-->
                                <div class="list-group-item d-flex justify-content-between align-items-center">
                                    <div>今回加算ポイント</div>
                                    <div><!--{$arrData[$key].add_point|n2s|h}-->pt</div>
                                </div>
                            <!--{/if}-->
                        </div>

                        <!--{if strlen($tpl_error) == 0}-->
                        <div class="btn_area card-footer">
                            <div class="row justify-content-center">
                                <div class="col-12 col-md-6">
                                    <input type="submit" class="btn btn-primary w-100" value="購入手続きへ" name="confirm" />
                                </div>
                                <!--{if $tpl_prev_url != ""}-->
                                    <div class="col-12 col-md-4 order-md-first mt-2 mt-md-0">
                                        <a href="<!--{$tpl_prev_url|h}-->" class="btn btn-secondary w-100">戻る</a>
                                    </div>
                                <!--{/if}-->
                            </div>
                        </div>
                        <!--{/if}-->
                    </div>
                </form>
            <!--{/foreach}-->
        <!--{else}-->
            <div class="empty alert alert-warning">※ 現在カート内に商品はございません。</div>
        <!--{/if}-->
    </div>
</div>
