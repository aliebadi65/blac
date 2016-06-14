local function run(msg, matches)
    if is_momod(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['media'] then
                lock_media = data[tostring(msg.to.id)]['settings']['media']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_media == "yes" then
       delete_msg(msg.id, ok_cb, true)
    end
end
 
return {
patterns = {
"[Hh]ttps://(.*)",
"[Hh][Tt][Tt][Pp][Ss]://[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/(.*)",
"[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/(.*)/",
"[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/(.*",
"[Hh][Tt][Tt][Pp]://(.*)",
"[Ww][Ww][Ww]:(.*)",
  },
  run = run
}
