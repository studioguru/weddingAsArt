window.WeddingAsArt = {
	Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  App: {},
  initialize: function() {
  	this.App.Routes = this.Routers.Index.initialize();
  }
};

var initialize = function() {
	$(document).on('click', "a[href^='/']", function(event) {
		var href = $(event.currentTarget).attr('href');
		var passThrough = (href.indexOf('sign_out') >= 0)

		if (!passThrough && !event.altKey && !event.ctrlKey && !event.metaKey && !event.shiftKey) {
			event.preventDefault();

			url = href.replace(/^\//,'');
		console.log(url);
			Backbone.history.navigate(url, { trigger: true });
			return false;
		}
	});
}

$(document).ready(function() {
  initialize();
  WeddingAsArt.initialize();
  Backbone.history.start({pushState: true});
});