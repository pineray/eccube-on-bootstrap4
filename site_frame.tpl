<!--{printXMLDeclaration}--><!DOCTYPE html>
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

<html lang="ja">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title><!--{$arrSiteInfo.shop_name|h}--><!--{if $tpl_subtitle|strlen >= 1}--> / <!--{$tpl_subtitle|h}--><!--{elseif $tpl_title|strlen >= 1}--> / <!--{$tpl_title|h}--><!--{/if}--></title>
        <!--{if $arrPageLayout.author|strlen >= 1}-->
            <meta name="author" content="<!--{$arrPageLayout.author|h}-->" />
        <!--{/if}-->
        <!--{if $arrPageLayout.description|strlen >= 1}-->
            <meta name="description" content="<!--{$arrPageLayout.description|h}-->" />
        <!--{/if}-->
        <!--{if $arrPageLayout.keyword|strlen >= 1}-->
            <meta name="keywords" content="<!--{$arrPageLayout.keyword|h}-->" />
        <!--{/if}-->
        <!--{if $arrPageLayout.meta_robots|strlen >= 1}-->
            <meta name="robots" content="<!--{$arrPageLayout.meta_robots|h}-->" />
        <!--{/if}-->
        <link rel="stylesheet" href="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.colorbox/colorbox.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous" />
        <link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/styles.css" />
        <link rel="shortcut icon" href="<!--{$TPL_URLPATH}-->img/common/favicon.ico" />
        <link rel="icon" type="image/vnd.microsoft.icon" href="<!--{$TPL_URLPATH}-->img/common/favicon.ico" />
        <link rel="alternate" type="application/rss+xml" title="RSS" href="<!--{$smarty.const.HTTP_URL}-->rss/<!--{$smarty.const.DIR_INDEX_PATH}-->" />
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="<!--{$smarty.const.ROOT_URLPATH}-->js/eccube.js"></script>
        <!-- #2342 次期メジャーバージョン(2.14)にてeccube.legacy.jsは削除予定.モジュール、プラグインの互換性を考慮して2.13では残します. -->
        <script src="<!--{$smarty.const.ROOT_URLPATH}-->js/eccube.legacy.js"></script>
        <script src="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.colorbox/jquery.colorbox-min.js"></script>
        <!--{if $tpl_page_class_name === "LC_Page_Abouts"}-->
            <!--{if ($smarty.server.HTTPS != "") && ($smarty.server.HTTPS != "off")}-->
                <script src="https://maps-api-ssl.google.com/maps/api/js?sensor=false"></script>
            <!--{else}-->
                <script src="http://maps.google.com/maps/api/js?sensor=false"></script>
            <!--{/if}-->
        <!--{/if}-->

        <script>//<![CDATA[
            <!--{$tpl_javascript}-->
            $(function(){
                <!--{$tpl_onload}-->
            });
        //]]></script>

        <!--{strip}-->
            <!--{* ▼Head COLUMN*}-->
            <!--{if !empty($arrPageLayout.HeadNavi)}-->
                <!--{* ▼上ナビ *}-->
                <!--{foreach key=HeadNaviKey item=HeadNaviItem from=$arrPageLayout.HeadNavi}-->
                    <!--{* ▼<!--{$HeadNaviItem.bloc_name}--> *}-->
                    <!--{if $HeadNaviItem.php_path != ""}-->
                        <!--{include_php_ex file=$HeadNaviItem.php_path items=$HeadNaviItem}-->
                    <!--{else}-->
                        <!--{include file=$HeadNaviItem.tpl_path}-->
                    <!--{/if}-->
                    <!--{* ▲<!--{$HeadNaviItem.bloc_name}--> *}-->
                <!--{/foreach}-->
                <!--{* ▲上ナビ *}-->
            <!--{/if}-->
            <!--{* ▲Head COLUMN*}-->
        <!--{/strip}-->
    </head>

    <!-- ▼BODY部 スタート -->
    <!--{include file='./site_main.tpl'}-->
    <!-- ▲BODY部 エンド -->

</html>
