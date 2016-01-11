local dequeue = require('input').dequeue

return function(dt, initial)
  for event in dequeue do
    if event.type == 'KEY_RELEASE' and
       event.payload.key == 'escape' then
      love.event.quit()
    end
  end

  return {}
end
