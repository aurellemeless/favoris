{meta_html css 'http://fonts.googleapis.com/css?family=Dosis:400,300,200,500,600,700,800'}
{meta_html css '/packages/bootstrap/dist/css/bootstrap.css'}
{meta_html css '/packages/fontawesome/css/font-awesome.min.css'}
{meta_html css '/asset/js/tools/angular/toastr/toastr.min.css'}
{meta_html css '/asset/css/styles.css'}
{meta_html css '/packages/flexslider/flexslider.css'}
{meta_html css '/packages/owl-carousel/owl.carousel.css'}
{meta_html css '/packages/owl-carousel/owl.theme.css'}

{zone 'shop~header'}


	<div class="container">

		<div class="top-link">
			<!-- breadcrumb -->
			{*<ol class="breadcrumb">
			  <li><a href="{{ URL::route('accueil') }}">Accueil</a></li>
			  <li><a href="{{ URL::route('rayon.show', $product->Rayon->id) }}">{{ ucfirst($product->Rayon->libelle) }}</a></li>
			  <li><a href="{{ URL::route('categorie.show', $product->Categorie->id) }}">{{ ucfirst($product->Categorie->libelle) }}</a></li>
			  <li><a href="{{ URL::route('sous-categorie.show', $product->Souscategorie->id) }}">{{ ucfirst($product->Souscategorie->libelle) }}</a></li>
			  <li class="active">{{ ucfirst($product->nom) }}</li>
			</ol>*}
			<!-- end breadcrumb -->
		</div>

		<!-- page content -->
		<section id="page-content">
                        
			<div class="row" >
				
				
						
                            <div class="col-md-12" >
                                    <h1 style="margin: 15px;">{$post->title}</h1>
                                </div>
                                <div class="col-md-12" >
                                    <div style="margin: 15px;">
                                         {$post->content}
                                    </div>
                                </div>
					
			</div>

		</section>
		<!-- end.page content -->


		<!-- FOOTER -->

		{include 'shop~footer'}

		<!-- END.FOOTER -->
	</div>



{include 'shop~footerjs'}
<!-- app -->
<script src="/packages/flexslider/jquery.flexslider.js"></script>
<script src="/packages/owl-carousel/owl.carousel.js"></script>


<script src="/asset/js/app.js"></script>