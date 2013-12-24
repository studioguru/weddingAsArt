WeddingAsArt.Views.ProductIndex = Backbone.View.extend({

	template: JST['products/index'],

	render: function() {
		this.$el.html(this.template({hello: 'world'}));
		// this.$el.html(this.template(this.model.attributes));
	}
});
