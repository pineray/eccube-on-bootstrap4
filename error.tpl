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
    <div id="undercolumn">
        <div id="undercolumn_error">
            <div class="message_area alert alert-danger">
                <!--★エラーメッセージ-->
                <!--{$tpl_error}-->
            </div>

            <div class="btn_area py-4">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-6">
                        <!--{if $return_top}-->
                            <a href="<!--{$smarty.const.TOP_URL}-->" class="btn btn-primary btn-block">トップページへ</a>
                        <!--{else}-->
                            <a href="javascript:history.back()" class="btn btn-primary btn-block">戻る</a>
                        <!--{/if}-->
                    </div>
                </div>
            </div>
        </div>
    </div>
<!--{/strip}-->
