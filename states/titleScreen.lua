local colours = require 'colours'
local setState = require('state').setState
local to_array = require('underscore').to_array

local timeElapsed

local getMessage = function()
  if timeElapsed < 1.5 then
    return 'a game by\nJared Norman'
  else
    return 'HATER'
  end
end

local getMessageHeight = function()
  local lineHeight = love.graphics.getFont():getHeight()
  local lines = 1 + #to_array(getMessage():gmatch('\n'))
  return lines * lineHeight
end

return function(dt, initial)
  if DEBUG then
    setState(require 'states.game')
  end

  if initial then
    timeElapsed = 0
  end

  timeElapsed = timeElapsed + dt

  if timeElapsed >= 3 then
    setState(require 'states.mainMenu')
  end

  return { function()
    if initial then
      love.graphics.setBackgroundColor(colours.black())
    end

    love.graphics.setColor(colours.white())
    love.graphics.printf(
      getMessage(),
      0, love.graphics.getHeight() / 4,
      love.graphics.getWidth() / 2,
      'center',
      0,
      1, 1,
      0, getMessageHeight() / 4
    )
  end }
end
