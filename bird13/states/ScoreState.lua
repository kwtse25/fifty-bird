--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    --love.graphics.setFont(flappyFont)
    -- love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)

    local move_down = 95
    if self.score >= 7 then
        love.graphics.printf('You are awarded', 0, 54, VIRTUAL_WIDTH, 'center')
        love.graphics.setFont(flappyFont)
        love.graphics.printf('PhD in Flappying', 0, 70, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(certificate_3,  (VIRTUAL_WIDTH / 2) - 50, 100)
    elseif self.score >= 5 then
        love.graphics.printf('You are awarded', 0, 54, VIRTUAL_WIDTH, 'center')
        love.graphics.setFont(flappyFont)
        love.graphics.printf('MA in Flappying', 0, 70, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(certificate_2,  (VIRTUAL_WIDTH / 2) - 50, 100)
    elseif self.score >= 2 then
        love.graphics.printf('You are awarded', 0, 54, VIRTUAL_WIDTH, 'center')
        love.graphics.setFont(flappyFont)
        love.graphics.printf('BSc in Flappying', 0, 70, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(certificate_1,  (VIRTUAL_WIDTH / 2) - 50, 100)
    else
        love.graphics.setFont(flappyFont)
        love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')
        move_down = 0
    end

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100+move_down, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 120+move_down, VIRTUAL_WIDTH, 'center')
end