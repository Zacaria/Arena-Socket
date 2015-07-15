'use strict'

angular.module 'arenaApp'
.controller 'GameCtrl', ($scope) ->
  $scope.message = 'Hello'

  preload = ->
    game.load.spritesheet('guy', 'assets/sprites/player.png', 32, 32, 12);

  player = ''
  upKey = '';
  downKey = '';
  leftKey = '';
  rightKey = '';

  create = ->
    player = game.add.sprite(150, game.world.height - 150, 'guy');

    animationSpeed = 15;

    player.animations.add('up', [0, 1, 2], animationSpeed, true);
    player.animations.add('down', [3, 4, 5], animationSpeed, true);
    player.animations.add('left', [6, 7, 8], animationSpeed, true);
    player.animations.add('right', [9, 10, 11], animationSpeed, true);

    player.frame = 5

    upKey = game.input.keyboard.addKey(Phaser.Keyboard.UP);
    downKey = game.input.keyboard.addKey(Phaser.Keyboard.DOWN);
    leftKey = game.input.keyboard.addKey(Phaser.Keyboard.LEFT);
    rightKey = game.input.keyboard.addKey(Phaser.Keyboard.RIGHT);

  update = ->
    if leftKey.isDown
      player.x -= 4
      player.animations.play 'left'
    else if rightKey.isDown
      player.x += 4
      player.animations.play 'right'

    else if upKey.isDown
      player.y -= 4
      player.animations.play 'up'

    else if downKey.isDown
      player.y += 4
      player.animations.play 'down'

    if !upKey.isDown and !downKey.isDown and !leftKey.isDown and !rightKey.isDown
      player.animations.stop true
#      player.frame = 5

  render = ->
    game.debug.spriteInfo(player, 20, 32)

  game = new Phaser.Game(800, 600, Phaser.AUTO, 'game', {preload: preload, create: create, update: update, render: render})




