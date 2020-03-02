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
        <div id="guide_area" class="block_body list-group">
            <a href="<!--{$smarty.const.ROOT_URLPATH}-->abouts/<!--{$smarty.const.DIR_INDEX_PATH}-->"
                class="list-group-item list-group-item-action<!--{if $tpl_page_class_name == "LC_Page_Abouts"}--> active<!--{/if}-->">
                当サイトについて</a>
            <a href="<!--{$smarty.const.HTTPS_URL}-->contact/<!--{$smarty.const.DIR_INDEX_PATH}-->"
                class="list-group-item list-group-item-action<!--{if $tpl_page_class_name == "LC_Page_Contact" || $tpl_page_class_name == "LC_Page_Contact_Complete"}--> active<!--{/if}-->">
                お問い合わせ</a>
            <a href="<!--{$smarty.const.ROOT_URLPATH}-->order/<!--{$smarty.const.DIR_INDEX_PATH}-->"
                class="list-group-item list-group-item-action<!--{if $tpl_page_class_name == "LC_Page_Order"}--> active<!--{/if}-->">
                特定商取引法に基づく表記</a>
            <a href="<!--{$smarty.const.ROOT_URLPATH}-->guide/privacy.php"
                class="list-group-item list-group-item-action<!--{if $tpl_page_class_name == "LC_Page_Guide_Privacy"}--> active<!--{/if}-->">
                プライバシーポリシー</a>
        </div>
    </div>
<!--{/strip}-->
