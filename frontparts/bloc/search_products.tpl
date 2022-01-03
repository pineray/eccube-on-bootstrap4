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
    <div class="block_outer">
        <div id="search_area" class="card">
            <h3 class="card-header"><span class="title"><i class="bi bi-search"></i> 検索条件</span></h3>
            <div class="block_body card-body">
                <!--検索フォーム-->
                <form name="search_form" id="search_form" method="get" action="<!--{$smarty.const.ROOT_URLPATH}-->products/list.php">
                    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                    <div class="formlist mb-3">
                        <label for="search-form-category-id">商品カテゴリから選ぶ</label>
                        <input type="hidden" name="mode" value="search" />
                        <select id="search-form-category-id" name="category_id" class="box145 form-control">
                            <option label="全ての商品" value="">全ての商品</option>
                            <!--{html_options options=$arrCatList selected=$category_id}-->
                        </select>
                    </div>
                    <!--{if $arrMakerList}-->
                    <div class="formlist mb-3">
                        <label for="search-form-maker-id">メーカーから選ぶ</label>
                        <select id="search-form-maker-id" name="maker_id" class="box145 form-control">
                            <option label="全てのメーカー" value="">全てのメーカー</option>
                            <!--{html_options options=$arrMakerList selected=$maker_id}-->
                        </select>
                    </div>
                    <!--{/if}-->
                    <div class="formlist mb-3">
                        <label for="search-form-name">商品名を入力</label>
                        <input type="text" id="search-form-name" name="name" class="box140 form-control" maxlength="50" value="<!--{$smarty.get.name|h}-->" />
                    </div>
                    <input type="submit" class="btn w-100 btn-secondary" value="検索" name="search" />
                </form>
            </div>
        </div>
    </div>
<!--{/strip}-->
