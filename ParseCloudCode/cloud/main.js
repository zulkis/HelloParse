
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world!");
});

Parse.Cloud.define("getAllRestaurants", function(request, response) {
	var query = new Parse.Query("FNRestaurant");
	query.find({
  			success: function(results) {
  				response.success(results);
  			},

  			error: function(error) {
  				response.error(error);
  			}
		})
});

Parse.Cloud.define("getMeals", function(request, response) {
	var restaurantId = request.params.restaurantId;
	var query = new Parse.Query("FNMeal");
	query.equalTo("restaurantId", restaurantId)
	query.find({
  			success: function(results) {
  				response.success(results);
  			},

  			error: function(error) {
  				response.error(error);
  			}
		})
});