function run(msg, matches)
if msg.to.type == 'user' and not is_sudo(msg) then
return [[
اخطا، وارد پیوی ربات شده اید درصورت کار داشتن:
@Smartgp

https://telegram.me/joinchat/C2AZVz9e1oI_Dcw34YYSsQ
]]
end
end
return {
patterns = { "[\216-\219]",
  "[\128-\191]",
  "(.*)"
},
run = run
}
