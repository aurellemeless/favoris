{*
<ul class="checkresults">
  {foreach $messages as $msg}
  <li class="{$msg[0]}">{$msg[1]}</li>
  {/foreach}
</ul>*}

<table class="table table-bordered">
    {foreach $messages as $msg}
    <tr class="{$msg[0]}"> 
        <td> {$msg[1]} </td>
    </tr>
    {/foreach}
</table>

{if $installok}
<p class="alert alert-success">{@installation.ok@}</p>
{else}
<p class="alert alert-error">{@installation.cancelled@}</p>
{/if}