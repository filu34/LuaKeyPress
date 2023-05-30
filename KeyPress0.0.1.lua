-- Disable buffering and enable raw mode for key press handling
os.execute("stty -echo raw")

-- Function to handle key presses
function handleKeyPress(key)
	-- Handle specific keys
	if key == "\27" then
        -- Possibly an escape key pressed, read the next two characters
        local secondKey = io.read(1)
        local thirdKey = io.read(1)
        
        if secondKey == nil and thirdKey == nil then
            -- Escape key pressed
            print("Escape key pressed. Exiting...\n\r")
            os.execute("stty echo -raw")
            os.exit()
        else
            -- An arrow key was pressed, handle it here
            print("Arrow key pressed: \27", secondKey, thirdKey, "\n\r")
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

