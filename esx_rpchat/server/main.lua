--[[

  ESX RP Chat

--]]

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
			
		}
	else
		return nil
	end
end

AddEventHandler('chatMessage', function(source, name, message)
    if string.sub(message, 1, string.len("/")) ~= "/" then
        local name = getIdentity(source)
      TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, message)
    end
    CancelEvent()
end)


--  AddEventHandler('chatMessage', function(source, name, message)
--       if string.sub(message, 1, string.len("/")) ~= "/" then
--           local name = getIdentity(source)
-- 		TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, message)
--       end
--       CancelEvent()
--   end)
  
  -- TriggerEvent('es:addCommand', 'me', function(source, args, user)
  --    local name = getIdentity(source)
  --    TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, table.concat(args, " "))
  -- end) 



  --- TriggerEvent('es:addCommand', 'me', function(source, args, user)
  ---    local name = getIdentity(source)
  ---    TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, table.concat(args, " "))
  -- end) 
  TriggerEvent('es:addCommand', 'me', function(source, args, user)
    local name = getIdentity(source)
    table.remove(args, 2)
    TriggerClientEvent('esx-qalle-chat:me', -1, source, name.firstname, table.concat(args, " "))
end)

Citizen.CreateThread(function()
    while true do
        ExecuteCommand('dis')
        Citizen.Wait(600000)
    end
end)
--[[RegisterCommand('tweet', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(6)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> @{0}:<br> {1}</div>',
        args = { fal, msg }
    })
end, false)]]

--  RegisterCommand('anontweet', function(source, args, rawCommand)
--     local playerName = GetPlayerName(source)
--     local msg = rawCommand:sub(11)
--     local name = getIdentity(source)
--     fal = name.firstname .. " " .. name.lastname
--     TriggerClientEvent('chat:addMessage', -1, {
--         template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> @Ukendt:<br> {1}</div>',
--         args = { fal, msg }
--     })
-- end, false)

RegisterCommand('ad', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(214, 168, 0, 1); border-radius: 3px;"><i class="fas fa-ad"></i> Reklame:<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)

RegisterCommand('pa', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(9, 41, 69, 1); border-radius: 3px;"><i class="fas fa-star"></i> Politi:<br> {1}<br></div>',
        args = { fal, msg }
    })
end, false)




RegisterCommand('aaa', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(5)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(141, 41, 41, 0.6); border-radius: 3px;"><i class="fas fa-bullhorn"></i> 𝗦𝗬𝗦𝗧𝗘𝗠 {0}: <br> {1}</div>',
        args = { fal, msg }
    })
end, false)

RegisterCommand('dis', function(source, args, rawCommand)
    local msg = "har er discord  [https://discord.gg/UecUt2AA9f]"
    fal = ""
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(210,50,150, 0.6); border-radius: 3px;"><i class="fab fa-discord"></i> discord {0}: <br> {1}</div>',
        args = { fal, msg }
    })
end, false)


RegisterServerEvent('gcPhone:twitter_postTweets')
AddEventHandler('gcPhone:twitter_postTweets', function(username, password, message)
  local _source = source
  local sourcePlayer = tonumber(_source)
  local srcIdentifier = ESX.GetPlayerFromId(_source).identifier
  fal = name.firstname .. " " .. name.lastname
  TwitterPostTweet(username, password, message, sourcePlayer, srcIdentifier)
  TriggerClientEvent('chat:addMessage', -1, {
    template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> @{0}:<br> {1}</div>',
    args = { username, message }
})
end)


function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end
