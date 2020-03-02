<!--{*
/*
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
 */
*}-->

<div id="mynavi_area">
    <!--{strip}-->
        <nav class="mynavi_list navbar navbar-expand-lg navbar-light bg-light rounded mb-3">
            <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#mypageNav" aria-controls="mypageNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse justify-content-md-center collapse" id="mypageNav" style="">
                <ul class="navbar-nav">
                    <li class="nav-item<!--{if $tpl_mypageno == 'index'}--> active<!--{/if}-->">
                      <a class="nav-link" href="<!--{if $tpl_login}-->./<!--{$smarty.const.DIR_INDEX_PATH}--><!--{else}--><!--{$smarty.const.TOP_URL}--><!--{/if}-->"><i class="fas fa-history"></i> 購入履歴</a>
                    </li>
                    <!--{if $smarty.const.OPTION_FAVORITE_PRODUCT == 1}-->
                    <li class="nav-item<!--{if $tpl_mypageno == 'favorite'}--> active<!--{/if}-->">
                      <a class="nav-link" href="<!--{if $tpl_login}-->favorite.php<!--{else}--><!--{$smarty.const.TOP_URL}--><!--{/if}-->"><i class="far fa-heart"></i> お気に入り</a>
                    </li>
                    <!--{/if}-->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle<!--{if $tpl_mypageno == 'change' || $tpl_mypageno == 'delivery' || $tpl_mypageno == 'refusal'}--> active<!--{/if}-->" href="#" id="mypageNavDrop" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-cog"></i> 設定</a>
                        <div class="dropdown-menu" aria-labelledby="mypageNavDrop">
                            <a href="<!--{if $tpl_login}-->change.php<!--{else}--><!--{$smarty.const.TOP_URL}--><!--{/if}-->" class="dropdown-item<!--{if $tpl_mypageno == 'change'}--> active<!--{/if}-->"><i class="fa fa-wrench"></i> 会員登録内容変更</a>
                            <a href="<!--{if $tpl_login}-->delivery.php<!--{else}--><!--{$smarty.const.TOP_URL}--><!--{/if}-->" class="dropdown-item<!--{if $tpl_mypageno == 'delivery'}--> active<!--{/if}-->"><i class="fa fa-truck"></i> お届け先追加・変更</a>
                            <a href="<!--{if $tpl_login}-->refusal.php<!--{else}--><!--{$smarty.const.TOP_URL}--><!--{/if}-->" class="dropdown-item<!--{if $tpl_mypageno == 'refusal'}--> active<!--{/if}-->"><i class="fa fa-ban"></i> 退会手続き</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <!--▼現在のポイント-->
        <!--{if $point_disp !== false}-->
            <div class="point_announce alert alert-info" role="alert">
                ようこそ <span class="user_name"><!--{$CustomerName1|h}--> <!--{$CustomerName2|h}--> 様</span>
                <!--{if $smarty.const.USE_POINT !== false}-->&nbsp;
                    &nbsp;／&nbsp;現在の所持ポイントは&nbsp;<span class="point st"><!--{$CustomerPoint|n2s|default:"0"|h}-->pt</span>&nbsp;です。
                <!--{/if}-->
            </div>
        <!--{/if}-->
        <!--▲現在のポイント-->
    <!--{/strip}-->

</div>
<!--▲NAVI-->
