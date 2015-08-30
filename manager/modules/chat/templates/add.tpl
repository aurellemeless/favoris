{literal}


    <div class="row">
       <!-- <h3 ng-if="operation.success" class="alert alert-success">{{operation.msg}}</h3>
        <h4 ng-if="operation.success==false" class="alert alert-danger">{{operation.msg}}</h4>
            --> <div class="col-md-7">
                <div class="">
                    <form novalidate  enctype="multipart/form-data"   name="form_message"  method="post" role="form" id="form_message">
                  <br/><br/>
                    <fieldset><legend> <span class="glyphicon glyphicon-label"> </span>Message </legend>

                        <div class="row">
                           <div class="col-xs-8 form-group" ng-class="{'has-error' : isInvalid('receiver_id')}">
                               <label for="receiver_id_message">Destinataire </label>
                               <select ng-model="message.receiver_id" name="receiver_id" class="form-control" id="receiver_id_message" >
                                    <option ng-repeat="r in users" value="{{r.user_id}}"> {{r.lastname+' '+r.firstname}} </option>
                               </select>

                               <p ng-show="isInvalid('receiver_id')" class="error">
                                  Destinataire obligatoire
                               </p>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <label for="content_message">Message</label>
                               <textarea type="text" ng-model="message.content" name="content"  class="form-control" id="content_message" placeholder="contenu de votre message ici ...">
                               </textarea>
                           </div>
                       </div>

                       <div class="row">
                           <div class="col-xs-8 form-group">
                               <button type="button" ng-disabled="form_message.$invalid" ng-click="save(form_message,true);" name="ok" class="btn btn-primary">Envoyer</button>

                               <a href="#/chat-list" type="button" class="btn btn-default">Quitter</a>
                               <br/><br/>
                           </div>
                       </div>
                     </fieldset>
                   </form>

                </div>

            </div>

        </div>



{/literal}
