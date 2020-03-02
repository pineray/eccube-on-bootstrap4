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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.    See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA    02111-1307, USA.
 *}-->

<!--▼HEADER-->
<!--{strip}-->
    <div id="header" class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="<!--{$smarty.const.TOP_URL}-->"><!--{$arrSiteInfo.shop_name|h}--></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#header-navbar-contents" aria-controls="header-navbar-contents" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="header-navbar-contents">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="mypage nav-item">
                    <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/login.php" class="nav-link">MYページ</a>
                </li>
                <li class="entry nav-item">
                    <a href="<!--{$smarty.const.ROOT_URLPATH}-->entry/kiyaku.php" class="nav-link">会員登録</a>
                </li>
                <li class="nav-item">
                    <a href="<!--{$smarty.const.CART_URL}-->" class="nav-link">カゴの中を見る</a>
                </li>
            </ul>
            <!--{* ▼HeaderInternal COLUMN *}-->
            <!--{if !empty($arrPageLayout.HeaderInternalNavi)}-->
                <!--{* ▼上ナビ *}-->
                <!--{foreach key=HeaderInternalNaviKey item=HeaderInternalNaviItem from=$arrPageLayout.HeaderInternalNavi}-->
                    <!-- ▼<!--{$HeaderInternalNaviItem.bloc_name}--> -->
                    <!--{if $HeaderInternalNaviItem.php_path != ""}-->
                        <!--{include_php_ex file=$HeaderInternalNaviItem.php_path items=$HeaderInternalNaviItem}-->
                    <!--{else}-->
                        <!--{include file=$HeaderInternalNaviItem.tpl_path items=$HeaderInternalNaviItem}-->
                    <!--{/if}-->
                    <!-- ▲<!--{$HeaderInternalNaviItem.bloc_name}--> -->
                <!--{/foreach}-->
                <!--{* ▲上ナビ *}-->
            <!--{/if}-->
            <!--{* ▲HeaderInternal COLUMN *}-->
        </div>
    </div>
<!--{/strip}-->
<!--▲HEADER-->
