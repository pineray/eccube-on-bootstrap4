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

<div id="mypagecolumn">
    <h2 class="title"><!--{$tpl_title|h}--></h2>
    <!--{include file=$tpl_navi}-->
    <div id="mycontents_area">
        <h3><!--{$tpl_subtitle|h}--></h3>
        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="confirm" />
            <div id="complete_area">
                <div class="message alert alert-warning">
                    会員を退会された場合には、現在保存されている購入履歴や、<br />
                    お届け先などの情報は、全て削除されますがよろしいでしょうか？
                </div>
                <div class="message_area">
                    <p>退会手続きが完了した時点で、現在保存されている購入履歴や、<br />
                    お届け先等の情報は全てなくなりますのでご注意ください。</p>
                    <div class="btn_area py-4">
                        <div class="row justify-content-center">
                            <div class="col-12 col-md-6">
                                <input type="submit" class="btn btn-secondary w-100" value="会員退会手続きへ" name="confirm" id="confirm" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
