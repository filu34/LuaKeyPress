-- Disable buffering and enable raw mode for key press handling
os.execute("stty -echo raw")

-- Function to handle key presses
function handleKeyPress(key)
    -- Handle specific keys
    if key == "\27" then
        -- Possible escape sequence, read the next two characters
        local secondKey = io.read(1)
        local thirdKey = io.read(1)

        if secondKey == "q" then
            -- Escape key pressed
            print("Escape key pressed. Exiting...\n\r")
            os.execute("stty echo -raw")
            os.exit()
        elseif secondKey == "[" then
            -- Check third key for arrow keys
            -- Up Arrow
            if thirdKey == "A" then
            		key = "UP"
            -- Down Arrow
            elseif thirdKey == "B" then
            		key = "DOWN"
            -- Right Arrow
            elseif thirdKey == "C" then
            		key = "RIGHT"
            -- Left Arrow
            elseif thirdKey == "D" then
            		key = "LEFT"
            -- Home Key
            elseif thirdKey == "H" or thirdKey == "1" or thirdKey == "7" then
                key = "HOME"
            -- End Key
            elseif thirdKey == "F" or thirdKey == "4" or thirdKey == "8" then
                key = "END"
            end
            -- Return which key was pressed
            return key
        end
    else
        return key
    end
end

-- Enable CTRL+C handling
os.execute("stty intr ^C")

-- Main loop to continuously read key presses
while true do
    local key = io.read(1)
    -- Pass the key to the handler function
    io.write( "Key pressed: " .. handleKeyPress(key) .."\n\r" )
end

