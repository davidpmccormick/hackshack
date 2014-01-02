App = Ember.Application.create();

App.Router.map(function() {
	this.resource('course', {path: 'course/:course_name'});
	this.resource('view', {path: 'course/view/:recipe'});
});

App.CourseRoute = Em.Route.extend({
	model: function(params) {
		return App.Recipe.course(params.course_name);
	},
	setupController: function(controller, model) {
		controller.set('model', model);
		controller.set('recipeArray', model);
	}
});

App.CourseController = Em.ArrayController.extend({
	searchValue: '',
	filterRecipes: function() {
		var regex = new RegExp(this.get('searchValue'), 'i');
		var filteredItems = this.get('recipeArray').filter(function(item, idx) {
			return regex.test(item.title);
		});
		this.set('content', filteredItems);
	}.observes('searchValue'),
	sortProperties: ['title'],
  sortAscending: true,
  actions: {
		toggleSort: function(sortBy) {
			this.set('sortProperties', [sortBy]);
			this.toggleProperty('sortAscending');
		}
	}
});

App.ViewRoute = Em.Route.extend({
	model: function(params) {
		return App.Recipe.one(params.recipe);
	}
});



// Recipe object data
App.Recipe = Em.Object.extend();

App.Recipe.reopenClass({
	all: function() {
		return $.getJSON('/hackshack/json-recipes')
		.then(function(data) {
			var items = [];
			data.forEach(function(item) {
				items.push(App.Recipe.create(item));
			});
			return items;
		});
	},
	course: function(course) {
		return $.getJSON('/hackshack/json-recipes')
		.then(function(data) {
			var items = [];
			data.forEach(function(item) {
				if(item.course.toLowerCase() == course) {
					items.push(App.Recipe.create(item));
				}
			});
			return items;
		});
	},
	one: function(recipe) {
		return $.getJSON('/hackshack/json-recipes')
		.then(function(data) {
			return data.findBy('urltitle', recipe);
		});
	}

});