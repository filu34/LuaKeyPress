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
            if thirdKey == "A" then
                print("Up arrow key pressed\n\r")
            elseif thirdKey == "B" then
                print("Down arrow key pressed\n\r")
            elseif thirdKey == "C" then
                print("Right arrow key pressed\n\r")
            elseif thirdKey == "D" then
                print("Left arrow key pressed\n\r")
            elseif thirdKey == "H" or thirdKey == "1" or thirdKey == "7" then
                print("Home key pressed\n\r")
            elseif thirdKey == "F" or thirdKey == "4" or thirdKey == "8" then
                print("End key pressed\n\r")
            end
        end
    elseif key == "a" then
        -- Press 'a' to perform a specific action
        io.write("Performing action A\n\r")
    elseif key == "b" then
        -- Press 'b' to perform another action
        io.write("Performing action B\n\r")
    else
        -- Print the key code for other keys
        io.write("Key pressed: ", key, "\n\r")
        return key
    end
end

-- Enable CTRL+C handling
os.execute("stty intr ^C")

-- Main loop to continuously read key presses
while true do
    local key = io.read(1)
    -- Pass the key to the handler function
    handleKeyPress(key)
end

