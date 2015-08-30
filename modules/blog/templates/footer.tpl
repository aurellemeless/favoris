{foreach $records as $row}
    <li><a href="{jurl 'blog~default:detail',array('id'=>$row->id)}">{$row->title}</a></li>
{/foreach}