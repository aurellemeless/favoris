{literal}


    <div class="row">
            <div class="col-md-12" style="min-height: 500px;">
                <div>
                    {{message.content}}
                </div>
                <div>
                    <br>
                    <strong>  Envoye par : </strong> {{message.lastname+ ' ' +message.lastname}} 
                    <strong>  le  </strong>{{message.createdate|shopDatetime}}
                </div>
            </div>

    </div>



{/literal}
