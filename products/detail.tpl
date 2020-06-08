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

<script type="text/javascript">//<![CDATA[
    // 規格2に選択肢を割り当てる。
    function fnSetClassCategories(form, classcat_id2_selected) {
        var $form = $(form);
        var product_id = $form.find('input[name=product_id]').val();
        var $sele1 = $form.find('select[name=classcategory_id1]');
        var $sele2 = $form.find('select[name=classcategory_id2]');
        eccube.setClassCategories($form, product_id, $sele1, $sele2, classcat_id2_selected);
    }
//]]></script>

<div id="undercolumn">
    <form name="form1" id="form1" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <div id="detailarea" class="clearfix row mb-4">
            <div id="detailphotobloc" class="col-12 col-md-5 text-center mb-3">
                <div class="photo">
                    <!--{assign var=key value="main_image"}-->
                    <!--★画像★-->
                    <!--{if $arrProduct.main_large_image|strlen >= 1}-->
                        <a
                            href="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.main_large_image|h}-->"
                            class="expansion"
                            target="_blank"
                        >
                    <!--{/if}-->
                        <img src="<!--{$arrFile[$key].filepath|h}-->" alt="<!--{$arrProduct.name|h}-->" class="picture img-fluid" />
                    <!--{if $arrProduct.main_large_image|strlen >= 1}-->
                        </a>
                    <!--{/if}-->
                </div>
                <!--{if $arrProduct.main_large_image|strlen >= 1}-->
                    <span class="mini">
                            <!--★拡大する★-->
                            <a
                                href="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.main_large_image|h}-->"
                                class="expansion"
                                target="_blank"
                            >
                                <i class="fas fa-search-plus"></i> 画像を拡大する</a>
                    </span>
                <!--{/if}-->
            </div>

            <div id="detailrightbloc" class="col-12 col-md-7">
                <div class="card">
                    <!--▼商品ステータス-->
                    <!--{assign var=ps value=$productStatus[$tpl_product_id]}-->
                    <!--{if !empty($ps)}-->
                    <div class="card-header">
                        <div class="status_icon clearfix">
                            <!--{foreach from=$ps item=status}-->
                            <span class="badge
                                <!--{if $status == 1}-->
                                badge-primary
                                <!--{elseif $status == 2}-->
                                badge-success
                                <!--{elseif $status == 3}-->
                                badge-warning
                                <!--{elseif $status == 4}-->
                                badge-danger
                                <!--{elseif $status == 5}-->
                                badge-info
                                <!--{else}-->
                                badge-secondary
                                <!--{/if}-->"><!--{$arrSTATUS[$status]}--></span>
                            <!--{/foreach}-->
                        </div>
                    </div>
                    <!--{/if}-->
                    <!--▲商品ステータス-->

                    <div class="card-body">
                        <!--★商品名★-->
                        <h2 class="mb-3"><!--{$arrProduct.name|h}--></h2>

                        <!--★商品コード★-->
                        <dl class="product_code row no-gutters mb-0">
                            <dt class="col-6 col-sm-5">商品コード：</dt>
                            <dd class="col">
                                <span id="product_code_default">
                                    <!--{if $arrProduct.product_code_min == $arrProduct.product_code_max}-->
                                        <!--{$arrProduct.product_code_min|h}-->
                                    <!--{else}-->
                                        <!--{$arrProduct.product_code_min|h}-->～<!--{$arrProduct.product_code_max|h}-->
                                    <!--{/if}-->
                                </span><span id="product_code_dynamic"></span>
                            </dd>
                        </dl>

                        <!--★通常価格★-->
                        <!--{if $arrProduct.price01_min_inctax > 0}-->
                            <dl class="normal_price row no-gutters mb-0">
                                <dt class="col-6 col-sm-5"><!--{$smarty.const.NORMAL_PRICE_TITLE}-->(税込)：</dt>
                                <dd class="price col">
                                    <span id="price01_default"><!--{strip}-->
                                        <!--{if $arrProduct.price01_min_inctax == $arrProduct.price01_max_inctax}-->
                                            <!--{$arrProduct.price01_min_inctax|n2s}-->
                                        <!--{else}-->
                                            <!--{$arrProduct.price01_min_inctax|n2s}-->～<!--{$arrProduct.price01_max_inctax|n2s}-->
                                        <!--{/if}-->
                                    <!--{/strip}--></span><span id="price01_dynamic"></span>
                                    円
                                </dd>
                            </dl>
                        <!--{/if}-->

                        <!--★販売価格★-->
                        <dl class="sale_price row no-gutters mb-0">
                            <dt class="col-6 col-sm-5"><!--{$smarty.const.SALE_PRICE_TITLE}-->(税込)：</dt>
                            <dd class="price col">
                                <span id="price02_default"><!--{strip}-->
                                    <!--{if $arrProduct.price02_min_inctax == $arrProduct.price02_max_inctax}-->
                                        <!--{$arrProduct.price02_min_inctax|n2s}-->
                                    <!--{else}-->
                                        <!--{$arrProduct.price02_min_inctax|n2s}-->～<!--{$arrProduct.price02_max_inctax|n2s}-->
                                    <!--{/if}-->
                                <!--{/strip}--></span><span id="price02_dynamic"></span>
                                円
                            </dd>
                        </dl>

                        <!--★ポイント★-->
                        <!--{if $smarty.const.USE_POINT !== false}-->
                            <dl class="point row no-gutters mb-0">
                                <dt class="col-6 col-sm-5">ポイント：</dt>
                                <dd class="col">
                                    <span id="point_default"><!--{strip}-->
                                        <!--{if $arrProduct.price02_min == $arrProduct.price02_max}-->
                                            <!--{$arrProduct.price02_min|sfPrePoint:$arrProduct.point_rate|n2s}-->
                                        <!--{else}-->
                                            <!--{if $arrProduct.price02_min|sfPrePoint:$arrProduct.point_rate == $arrProduct.price02_max|sfPrePoint:$arrProduct.point_rate}-->
                                                <!--{$arrProduct.price02_min|sfPrePoint:$arrProduct.point_rate|n2s}-->
                                            <!--{else}-->
                                                <!--{$arrProduct.price02_min|sfPrePoint:$arrProduct.point_rate|n2s}-->～<!--{$arrProduct.price02_max|sfPrePoint:$arrProduct.point_rate|n2s}-->
                                            <!--{/if}-->
                                        <!--{/if}-->
                                    <!--{/strip}--></span><span id="point_dynamic"></span>
                                    Pt
                                </dd>
                            </dl>
                        <!--{/if}-->

                        <!--{* ▼メーカー *}-->
                        <!--{if $arrProduct.maker_name|strlen >= 1}-->
                            <dl class="maker row no-gutters mb-0">
                                <dt class="col-6 col-sm-5">メーカー：</dt>
                                <dd class="col"><!--{$arrProduct.maker_name|h}--></dd>
                            </dl>
                        <!--{/if}-->
                        <!--{* ▲メーカー *}-->

                        <!--▼メーカーURL-->
                        <!--{if $arrProduct.comment1|strlen >= 1}-->
                            <dl class="comment1 row no-gutters mb-0">
                                <dt class="col-6 col-sm-5">メーカーURL：</dt>
                                <dd class="col"><a href="<!--{$arrProduct.comment1|h}-->"><!--{$arrProduct.comment1|h}--></a></dd>
                            </dl>
                        <!--{/if}-->
                        <!--▼メーカーURL-->

                        <!--★関連カテゴリ★-->
                        <dl class="relative_cat mb-0">
                            <dt>関連カテゴリ：</dt>
                            <!--{section name=r loop=$arrRelativeCat}-->
                                <dd>
                                    <!--{section name=s loop=$arrRelativeCat[r]}-->
                                        <a href="<!--{$smarty.const.ROOT_URLPATH}-->products/list.php?category_id=<!--{$arrRelativeCat[r][s].category_id}-->"><!--{$arrRelativeCat[r][s].category_name|h}--></a>
                                        <!--{if !$smarty.section.s.last}--><!--{$smarty.const.SEPA_CATNAVI}--><!--{/if}-->
                                    <!--{/section}-->
                                </dd>
                            <!--{/section}-->
                        </dl>

                        <!--★詳細メインコメント★-->
                        <div class="main_comment"><!--{$arrProduct.main_comment|nl2br_html}--></div>
                    </div>

                    <!--▼買い物カゴ-->
                    <div class="cart_area clearfix card-footer">
                        <input type="hidden" name="mode" value="cart" />
                        <input type="hidden" name="product_id" value="<!--{$tpl_product_id}-->" />
                        <input type="hidden" name="product_class_id" value="<!--{$tpl_product_class_id}-->" id="product_class_id" />
                        <input type="hidden" name="favorite_product_id" value="" />

                        <!--{if $tpl_stock_find}-->
                            <!--{if $tpl_classcat_find1}-->
                                <div class="classlist">
                                    <!--▼規格1-->
                                    <div class="form-group row no-gutters">
                                        <label for="classcategory_id1" class="col-12 col-sm-5 col-form-label"><!--{$tpl_class_name1|h}--></label>
                                        <div class="col">
                                            <select id="classcategory_id1" name="classcategory_id1" class="form-control<!--{if $arrErr.classcategory_id1 != ""}--> is-invalid<!--{/if}-->">
                                                <!--{html_options options=$arrClassCat1 selected=$arrForm.classcategory_id1.value}-->
                                            </select>
                                            <!--{if $arrErr.classcategory_id1 != ""}-->
                                            <div class="invalid-feedback">※ <!--{$tpl_class_name1}-->を入力して下さい。</div>
                                            <!--{/if}-->
                                        </div>
                                    </div>
                                    <!--▲規格1-->
                                    <!--{if $tpl_classcat_find2}-->
                                    <!--▼規格2-->
                                    <div class="form-group row no-gutters">
                                        <label for="classcategory_id2" class="col-12 col-sm-5 col-form-label"><!--{$tpl_class_name2|h}--></label>
                                        <div class="col">
                                            <select id="classcategory_id2" name="classcategory_id2" class="form-control<!--{if $arrErr.classcategory_id2 != ""}--> is-invalid<!--{/if}-->">
                                            </select>
                                            <!--{if $arrErr.classcategory_id2 != ""}-->
                                            <div class="invalid-feedback">※ <!--{$tpl_class_name2}-->を入力して下さい。</div>
                                            <!--{/if}-->
                                        </div>
                                    </div>
                                    <!--▲規格2-->
                                    <!--{/if}-->
                                </div>
                            <!--{/if}-->

                            <div class="row no-gutters">
                                <!--★数量★-->
                                <div class="quantity col-6 col-sm-5 pr-2">
                                    <div class="input-group<!--{if $arrErr.quantity != ""}--> is-invalid<!--{/if}-->">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="quantity-addon">数量</span>
                                        </div>
                                        <input type="number" class="box60 form-control<!--{if $arrErr.quantity != ""}--> is-invalid<!--{/if}-->" name="quantity" value="<!--{$arrForm.quantity.value|default:1|h}-->" min="1" maxlength="<!--{$smarty.const.INT_LEN}-->" aria-describedby="quantity-addon" />
                                    </div>
                                    <!--{if $arrErr.quantity != ""}-->
                                        <div class="invalid-feedback"><!--{$arrErr.quantity}--></div>
                                    <!--{/if}-->
                                </div>

                                <div class="cartin col">
                                    <div class="cartin_btn">
                                        <div id="cartbtn_default">
                                            <!--★カゴに入れる★-->
                                            <a href="javascript:void(document.form1.submit())" class="btn btn-danger btn-block">
                                                <i class="fas fa-cart-arrow-down"></i> カゴに入れる
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="attention" id="cartbtn_dynamic"></div>
                        <!--{else}-->
                            <div class="attention">申し訳ございませんが、只今品切れ中です。</div>
                        <!--{/if}-->

                        <!--★お気に入り登録★-->
                        <!--{if $smarty.const.OPTION_FAVORITE_PRODUCT == 1 && $tpl_login === true}-->
                            <hr>
                            <div class="favorite_btn">
                                <!--{assign var=add_favorite value="add_favorite`$product_id`"}-->
                                <!--{if $arrErr[$add_favorite]}-->
                                    <div class="attention"><!--{$arrErr[$add_favorite]}--></div>
                                <!--{/if}-->
                                <!--{if !$is_favorite}-->
                                    <a href="javascript:eccube.changeAction('?product_id=<!--{$arrProduct.product_id|h}-->'); eccube.setModeAndSubmit('add_favorite','favorite_product_id','<!--{$arrProduct.product_id|h}-->');" class="btn btn-secondary btn-sm btn-block"><i class="far fa-heart"></i> お気に入りに追加</a>
                                <!--{else}-->
                                    <button class="btn btn-secondary btn-sm btn-block" disabled="disabled"><i class="far fa-heart"></i> お気に入りに登録済み</button>
                                <!--{/if}-->
                            </div>
                        <!--{/if}-->
                    </div>
                    <!--▲買い物カゴ-->
                </div>
            </div>
        </div>
    </form>

    <!--詳細ここまで-->

    <!--▼サブコメント-->
    <!--{section name=cnt loop=$smarty.const.PRODUCTSUB_MAX}-->
        <!--{assign var=key value="sub_title`$smarty.section.cnt.index+1`"}-->
        <!--{assign var=ikey value="sub_image`$smarty.section.cnt.index+1`"}-->
        <!--{if $arrProduct[$key] != "" or $arrProduct[$ikey]|strlen >= 1}-->
            <div class="sub_area clearfix card mb-3">
                <h3 class="card-header"><!--★サブタイトル★--><!--{$arrProduct[$key]|h}--></h3>
                <div class="card-body">
                <!--{assign var=ckey value="sub_comment`$smarty.section.cnt.index+1`"}-->
                <!--▼サブ画像-->
                <!--{assign var=lkey value="sub_large_image`$smarty.section.cnt.index+1`"}-->
                <!--{if $arrProduct[$ikey]|strlen >= 1}-->
                    <div class="row">
                        <div class="subtext col-12 col-md-8"><!--★サブテキスト★--><!--{$arrProduct[$ckey]|nl2br_html}--></div>
                        <div class="subphotoimg col text-center">
                            <!--{if $arrProduct[$lkey]|strlen >= 1}-->
                                <a href="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct[$lkey]|h}-->" class="expansion" target="_blank" >
                            <!--{/if}-->
                            <img src="<!--{$arrFile[$ikey].filepath}-->" alt="<!--{$arrProduct.name|h}-->" class="img-fluid" />
                            <!--{if $arrProduct[$lkey]|strlen >= 1}-->
                                </a><br>
                                <span class="mini">
                                    <a href="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct[$lkey]|h}-->" class="expansion" target="_blank">
                                        <i class="fas fa-search-plus"></i> 画像を拡大する</a>
                                </span>
                            <!--{/if}-->
                        </div>
                    </div>
                <!--{else}-->
                    <div class="subtext"><!--★サブテキスト★--><!--{$arrProduct[$ckey]|nl2br_html}--></div>
                <!--{/if}-->
                <!--▲サブ画像-->
                </div>
            </div>
        <!--{/if}-->
    <!--{/section}-->
    <!--▲サブコメント-->

    <!--この商品に対するお客様の声-->
    <div id="customervoice_area" class="mb-4">
        <h3><i class="fas fa-comment"></i> この商品に対するお客様の声</h3>

        <div class="review_bloc clearfix alert alert-warning">
            <p>この商品に対するご感想をぜひお寄せください。</p>
            <div class="review_btn">
                <!--{if count($arrReview) < $smarty.const.REVIEW_REGIST_MAX}-->
                    <!--★新規コメントを書き込む★-->
                    <a href="./review.php"
                        onclick="eccube.openWindow('./review.php?product_id=<!--{$arrProduct.product_id}-->','review','600','640'); return false;"
                        target="_blank" class="btn btn-secondary btn-sm">
                        <i class="fas fa-edit"></i> 新規コメントを書き込む
                    </a>
                <!--{/if}-->
            </div>
        </div>

        <!--{if count($arrReview) > 0}-->
            <!--{section name=cnt loop=$arrReview}-->
                <div class="card mt-2">
                    <div class="card-body">
                        <h4 class="voicetitle card-title"><!--{$arrReview[cnt].title|h}--></h4>
                        <p class="voicedate card-text"><!--{$arrReview[cnt].create_date|sfDispDBDate:false}-->　投稿者：<!--{if $arrReview[cnt].reviewer_url}--><a href="<!--{$arrReview[cnt].reviewer_url}-->" target="_blank"><!--{$arrReview[cnt].reviewer_name|h}--></a><!--{else}--><!--{$arrReview[cnt].reviewer_name|h}--><!--{/if}-->　おすすめレベル：<span class="recommend_level"><!--{assign var=level value=$arrReview[cnt].recommend_level}--><!--{$arrRECOMMEND[$level]|h}--></span></p>
                        <p class="voicecomment card-text"><!--{$arrReview[cnt].comment|h|nl2br}--></p>
                    </div>
                </div>
            <!--{/section}-->
        <!--{/if}-->
    </div>
    <!--お客様の声ここまで-->

    <!--▼関連商品-->
    <!--{if $arrRecommend}-->
        <div id="whobought_area">
            <h3><i class="far fa-thumbs-up"></i> その他のオススメ商品</h3>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4">
            <!--{foreach from=$arrRecommend item=arrItem name="arrRecommend"}-->
                <div class="product_item col mb-2">
                    <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrItem.product_id|u}-->" class="text-reset text-decoration-none row">
                        <div class="productImage col-5 col-sm-12 mb-0 mb-sm-2 text-center">
                            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrItem.main_list_image|sfNoImageMainList|h}-->" alt="<!--{$arrItem.name|h}-->" class="img-fluid" />
                        </div>
                        <!--{assign var=price02_min value="`$arrItem.price02_min_inctax`"}-->
                        <!--{assign var=price02_max value="`$arrItem.price02_max_inctax`"}-->
                        <div class="productContents col-7 col-sm-12">
                            <h4><!--{$arrItem.name|h}--></h4>
                            <p class="sale_price"><span class="price">
                                <!--{if $price02_min == $price02_max}-->
                                    <!--{$price02_min|n2s}-->
                                <!--{else}-->
                                    <!--{$price02_min|n2s}-->～<!--{$price02_max|n2s}-->
                                <!--{/if}-->円</span></p>
                            <p class="mini"><!--{$arrItem.comment|h|nl2br}--></p>
                        </div>
                    </a>
                </div><!--{* /.item *}-->
            <!--{/foreach}-->
            </div>
        </div>
    <!--{/if}-->
    <!--▲関連商品-->

</div>
