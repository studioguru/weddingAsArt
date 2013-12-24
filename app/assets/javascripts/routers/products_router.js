WeddingAsArt.Routers.Product = Backbone.Router.extend({
	routes: {
		'path/1':			'a_method',
		'products':		'index'
	},
	a_method: function(id){

	},
	index: function() {
		var productIndex = new WeddingAsArt.Views.ProductIndex();
		productIndex.render();
	}
});
