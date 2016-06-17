local function run(msg)
local text = [[`pong` *:D*]]
 send_api_msg(msg, get_receiver_api(msg), text, true, 'md')
end
return { 
patterns = {
"^!ping$",
}, 
run = run
 }
