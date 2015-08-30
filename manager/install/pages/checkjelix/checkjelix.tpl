<table class="table table-bordered">
    {foreach $messages as $msg}
    <tr class="{$msg[0]}"> 
        <td> {$msg[1]|eschtml} </td>
    </tr>
    {/foreach}
</table>

<div class="alert alert-warning">
  {if $nbError} {$nbError} {if $nbError > 1}{@number.errors@}{else}{@number.error@}{/if}{/if}
  {if $nbWarning} {$nbWarning} {if $nbWarning > 1}{@number.warnings@}{else}{@number.warning@}{/if}{/if}
  {if $nbNotice} {$nbNotice} {if $nbNotice > 1}{@number.notices@}{else}{@number.notice@}{/if}{/if}
  <p>
  {if $nbError} {if $nbError > 1}{@conclusion.errors@}{else}{@conclusion.error@}{/if}
  {elseif $nbWarning} {if $nbWarning > 1}{@conclusion.warnings@}{else}{@conclusion.warning@}{/if}
  {elseif $nbNotice} {if $nbNotice > 1}{@conclusion.notices@}{else}{@conclusion.notice@}{/if}
  {else}{@conclusion.ok@}
  {/if}
  </p>
</div>