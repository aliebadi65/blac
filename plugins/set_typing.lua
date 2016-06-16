local function run(msg, matches)
send_typing(get_receiver(msg), ok_cb, false)
end
return {
patterns = {
"^(.*)$",
},
run = run
}
