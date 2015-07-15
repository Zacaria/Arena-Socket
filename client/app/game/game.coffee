'use strict'

angular.module 'arenaApp'
.config ($stateProvider) ->
  $stateProvider.state 'game',
    url: '/game'
    templateUrl: 'app/game/game.html'
    controller: 'GameCtrl'
