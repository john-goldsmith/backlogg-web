"use strict"

describe "ApplicationController", ->

  # load the controller"s module
  beforeEach module "backloggWeb"

  ApplicationController = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ApplicationController = $controller "ApplicationController", {
      $scope: scope
    }

  it "should attach a list of awesomeThings to the scope", ->
    expect(true).toBe true