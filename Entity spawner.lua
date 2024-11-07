local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Doors entity spawner",
   LoadingTitle = "hey",
   LoadingSubtitle = "by Fake, alt account. Credit to RegularVynixu",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Main Entities", 4483362458) -- Title, Image
local MainSection = MainTab:CreateSection("Spawn entities")

local Button = MainTab:CreateButton({
   Name = "Spawn Rush",
   Callback = function()
 ---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Rush",
		Asset = "https://github.com/RegularVynixu/Utilities/raw/main/Doors/Entity%20Spawner/Assets/Entities/Rush.rbxm",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 100,
		Delay = 2,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 1,
		Max = 1,
		Delay = 2
	},
	Damage = {
		Enabled = true,
		Range = 40,
		Amount = 125
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died to who you call Rush.", "When the lights flicker, hide!", "Try again, I believe in you!"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Blitz",
   Callback = function()
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Blitz",
		Asset = "https://github.com/RegularVynixu/Utilities/raw/main/Doors/Entity%20Spawner/Assets/Entities/BackdoorRush.rbxm",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1}
	},
	Movement = {
		Speed = 100,
		Delay = 2,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Blitz",
		Min = 1,
		Max = math.random(1, 2),
		Delay = math.random(10, 30) / 10
	},
	Damage = {
		Enabled = true,
		Range = 40,
		Amount = 125
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Curious",
		Hints = {"Oh... Hello.", "I didn't expect to see you here.", "Let's see what you died to.", "Oh, one of my favorites.", "She said we should call that one Blitz.", "Well... I'll see you later, right? You'll come back?", "Haha... of course you will."},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnRebounding", function(startOfRebound)
	-- Variables for the entity
	local entityModel = entity.Model
	local main = entityModel:WaitForChild("Main")
	local attachment = main:WaitForChild("Attachment")
	local AttachmentSwitch = main:WaitForChild("AttachmentSwitch")
	local sounds = {
		footsteps = main:WaitForChild("Footsteps"),
		playSound = main:WaitForChild("PlaySound"),
		switch = main:WaitForChild("Switch"),
		switchBack = main:WaitForChild("SwitchBack")
	}

	-- Toggle particle emitters and lights within the entityModel
	-- To switch between green & red state
	for _, c in attachment:GetChildren() do
		c.Enabled = (not startOfRebound)
	end
	for _, c in AttachmentSwitch:GetChildren() do
		c.Enabled = startOfRebound
	end

	-- Play sounds
	if startOfRebound == true then
		sounds.footsteps.PlaybackSpeed = 0.35
		sounds.playSound.PlaybackSpeed = 0.25
		sounds.switch:Play()
	else
		sounds.footsteps.PlaybackSpeed = 0.25
		sounds.playSound.PlaybackSpeed = 0.16
		sounds.switchBack:Play()
	end
end)

---====== Run entity ======---

entity:Run()
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Ambush",
   Callback = function()
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Ambush",
		Asset = "https://github.com/RegularVynixu/Utilities/raw/main/Doors/Entity%20Spawner/Assets/Entities/Ambush.rbxm",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 100,
		Delay = 2,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 1,
		Max = 6,
		Delay = 2
	},
	Damage = {
		Enabled = true,
		Range = 40,
		Amount = 125
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Ambush.", "When the lights flicker, hide!", "But, Ambush rebounds. They can rebound a few times.", "Keep trying. You go this!"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn A-60",
   Callback = function()
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "A-60",
		Asset = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/A-60.rbxm?raw=",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 100,
		Delay = 2,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 1,
		Max = 1,
		Delay = 2
	},
	Damage = {
		Enabled = true,
		Range = 40,
		Amount = 125
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Curious", -- "Curious"
		Hints = {"You died to that weird, red one.", "Pretty sure it's called A-60, it's supposed to be in the rooms.", "How am I even here?", "Anyway, you'll hear a static noise when they spawn.", "When this happens, hide in a locke- I mean closet."},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Firebrand",
   Callback = function()
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Firebrand",
		Asset = "https://github.com/fnaclol/sussy-bois/raw/main/FireBrand3.rbxm?raw=true",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 300,
		Delay = 2,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 2,
		Max = 2,
		Delay = 2
	},
	Damage = {
		Enabled = true,
		Range = 60,
		Amount = 125
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Curious", -- "Curious"
		Hints = {"You died to Firebrand", "Lemme take a look here...", "Oh my...", "This thing... is fast", "you only have 2 seconds of delay, so better hope!"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Matcher",
   Callback = function()
game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(212, 255, 0)
game.Lighting.MainColorCorrection.Contrast = 0.3
local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(0.5), {Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(0.5),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
    local roast = Instance.new("Sound")
    roast.Parent = workspace
    roast.Name = "roast"
    roast.SoundId = "rbxassetid://9125936117"
    roast.Volume = 0.5
    roast.Pitch = 3
    roast:Play()
    wait(0.6)
    roast:Destroy()

local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/DripCapybara/Doors-Mode-Remakes/refs/heads/main/ModifiedSpawner.lua"))()

-- Create entity

local entity = Creator.createEntity({
    CustomName = "Matcher", -- Custom name of your entity
    Model = "rbxassetid://12459977063", -- Can be GitHub file or rbxassetid
    Speed = 150, -- Percentage, 100 = default Rush speed
    DelayTime = 0.8, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    BreakLights = true,
    KillRange = 40,
    BackwardsMovement = false,
    FlickerLights = {
        Enabled, -- Enabled
        2.5, -- Time (seconds)
    },
    Cycles = {
        Min = 0,
        Max = 1
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "https://www.roblox.com/library/11862656491", -- Image1 url
            Image2 = "https://www.roblox.com/library/11862656491", -- Image2 url
            Shake = false,
            Sound1 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                5567523008, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(6, 38, 135), -- Color
            },
            Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"You died to Rebound...", "It appears at the next door and has a chance to stay there or run back to the latest door.", "He will come back many times after his initial spawn", "so hide every next door until it is safe.."}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----
entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", entityModel)
    workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:WaitForChild("Door").ClientOpen:FireServer()
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
    wait(15)
    workspace.Matcher:Destroy()
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("Entity:", "has entered room:", room)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/Jumpscares/main/MatcherJumpscare.txt"))()
wait(1.8)
loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/GuidingLight/main/MatchDie.txt"))()
end

------------------------

-- Run the created entity
Creator.runEntity(entity)
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Rebound",
   Callback = function()
local part = Instance.new("Part")
part.Name = "Bound"
part.Parent = workspace
game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(61, 171, 98)
game.Lighting.MainColorCorrection.Contrast = 0.2
game.Lighting.MainColorCorrection.Saturation = -0.7
local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5), {Contrast = 0}):Play()
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5), {Saturation = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
local cue1 = Instance.new("Sound")
cue1.Parent = game.Workspace
cue1.Name = "Scream"
cue1.SoundId = "rbxassetid://9114397505"
local distort = Instance.new("DistortionSoundEffect")
distort.Parent = cue1
distort.Level = 1
local distort2 = Instance.new("DistortionSoundEffect")
distort2.Parent = cue1
distort2.Level = 1
local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = cue1
pitch.Octave = 0.5
local pitch2 = Instance.new("PitchShiftSoundEffect")
pitch2.Parent = cue1
pitch2.Octave = 0.5
local pitch3 = Instance.new("PitchShiftSoundEffect")
pitch3.Parent = cue1
pitch3.Octave = 0.5
cue1.Volume = 0.1
cue1:Play()
local cue2 = Instance.new("Sound")
cue2.Parent = game.Workspace
cue2.Name = "Spawn"
cue2.SoundId = "rbxassetid://9114221327"
cue2.Volume = 3
cue2:Play()
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
	camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(10,3,0.1,6,2,0.5)
local speed = math.random(350,1050)
local delay = {"2", "2.5", "1.5", "1", "2.1"}
local fuck = delay[math.random(1, #delay)]
wait(2.8)

local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/DripCapybara/Doors-Mode-Remakes/refs/heads/main/ReboundSpawner.lua"))()

-- Create entity

local entity = Creator.createEntity({
    CustomName = "Rebound", -- Custom name of your entity
    Model = "rbxassetid://12847597717", -- Can be GitHub file or rbxassetid
    Speed = speed, -- Percentage, 100 = default Rush speed
    DelayTime = fuck, -- Time before starting cycles (seconds)
    HeightOffset = 0.3,
    CanKill = true,
    BreakLights = false,
    KillRange = 20,
    BackwardsMovement = true,
    FlickerLights = {
        false, -- Enabled
        2.5, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 1
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "https://www.roblox.com/library/11862656491", -- Image1 url
            Image2 = "https://www.roblox.com/library/11862656491", -- Image2 url
            Shake = false,
            Sound1 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                5567523008, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(6, 38, 135), -- Color
            },
            Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"w"}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity:", entity, "has entered room:", room)
end

entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
    wait(15)
    workspace.Rebound:Destroy()
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", entityModel)
    cue1:Destroy()
    cue2:Destroy()
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
    game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
    
local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/DripCapybara/Doors-Mode-Remakes/refs/heads/main/ReboundSpawner.lua"))()

-- Create entity

local entity = Creator.createEntity({
    CustomName = "Rebound2", -- Custom name of your entity
    Model = "rbxassetid://12847597717", -- Can be GitHub file or rbxassetid
    Speed = speed, -- Percentage, 100 = default Rush speed
    DelayTime = fuck, -- Time before starting cycles (seconds)
    HeightOffset = 0.3,
    CanKill = true,
    BreakLights = false,
    KillRange = 20,
    BackwardsMovement = true,
    FlickerLights = {
        false, -- Enabled
        2.5, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 1
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "https://www.roblox.com/library/11862656491", -- Image1 url
            Image2 = "https://www.roblox.com/library/11862656491", -- Image2 url
            Shake = false,
            Sound1 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                5567523008, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(6, 38, 135), -- Color
            },
            Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"w"}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity:", entity, "has entered room:", room)
end

entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
    wait(15)
    workspace.Rebound2:Destroy()
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", entityModel)
    cue1:Destroy()
    cue2:Destroy()
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
    game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
    
local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/DripCapybara/Doors-Mode-Remakes/refs/heads/main/ReboundSpawner.lua"))()

-- Create entity

local entity = Creator.createEntity({
    CustomName = "Rebound3", -- Custom name of your entity
    Model = "rbxassetid://12847597717", -- Can be GitHub file or rbxassetid
    Speed = speed, -- Percentage, 100 = default Rush speed
    DelayTime = fuck, -- Time before starting cycles (seconds)
    HeightOffset = 0.3,
    CanKill = true,
    BreakLights = false,
    KillRange = 20,
    BackwardsMovement = true,
    FlickerLights = {
        false, -- Enabled
        2.5, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 1
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "https://www.roblox.com/library/11862656491", -- Image1 url
            Image2 = "https://www.roblox.com/library/11862656491", -- Image2 url
            Shake = false,
            Sound1 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                5567523008, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(6, 38, 135), -- Color
            },
            Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"w"}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity:", entity, "has entered room:", room)
end

entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
    wait(15)
    workspace.Rebound3:Destroy()
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", entityModel)
    cue1:Destroy()
    cue2:Destroy()
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
    game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
    
local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/DripCapybara/Doors-Mode-Remakes/refs/heads/main/ReboundSpawner.lua"))()

-- Create entity

local entity = Creator.createEntity({
    CustomName = "Rebound4", -- Custom name of your entity
    Model = "rbxassetid://12847597717", -- Can be GitHub file or rbxassetid
    Speed = speed, -- Percentage, 100 = default Rush speed
    DelayTime = fuck, -- Time before starting cycles (seconds)
    HeightOffset = 0.3,
    CanKill = true,
    BreakLights = false,
    KillRange = 20,
    BackwardsMovement = true,
    FlickerLights = {
        false, -- Enabled
        2.5, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 1
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "https://www.roblox.com/library/11862656491", -- Image1 url
            Image2 = "https://www.roblox.com/library/11862656491", -- Image2 url
            Shake = false,
            Sound1 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                5567523008, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(6, 38, 135), -- Color
            },
            Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"w"}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity:", entity, "has entered room:", room)
end

entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
    wait(15)
    workspace.Rebound4:Destroy()
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", entityModel)
    cue1:Destroy()
    cue2:Destroy()
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
    game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
    
local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/DripCapybara/Doors-Mode-Remakes/refs/heads/main/ReboundSpawner.lua"))()

-- Create entity

local entity = Creator.createEntity({
    CustomName = "Rebound5", -- Custom name of your entity
    Model = "rbxassetid://12847597717", -- Can be GitHub file or rbxassetid
    Speed = speed, -- Percentage, 100 = default Rush speed
    DelayTime = fuck, -- Time before starting cycles (seconds)
    HeightOffset = 0.3,
    CanKill = true,
    BreakLights = false,
    KillRange = 20,
    BackwardsMovement = true,
    FlickerLights = {
        false, -- Enabled
        2.5, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 1
    },
    CamShake = {
        true, -- Enabled
        {5, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled ('false' if you don't want jumpscare)
        {
            Image1 = "https://www.roblox.com/library/11862656491", -- Image1 url
            Image2 = "https://www.roblox.com/library/11862656491", -- Image2 url
            Shake = false,
            Sound1 = {
                0, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                5567523008, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled
                Color3.fromRGB(6, 38, 135), -- Color
            },
            Tease = {
                false, -- Enabled ('false' if you don't want tease)
                Min = 1,
                Max = 3,
            },
        },
    },
    CustomDialog = {"w"}, -- Custom death message (can be as long as you want)
})

-----[[ Advanced ]]-----

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity:", entity, "has entered room:", room)
end

entity.Debug.OnEntitySpawned = function(entityModel)
    print("Entity has spawned:", entityModel)
    wait(15)
    workspace.Rebound5:Destroy()
end

entity.Debug.OnEntityDespawned = function(entityModel)
    print("Entity has despawned:", entityModel)
    cue1:Destroy()
    cue2:Destroy()
    part:Destroy()
end

entity.Debug.OnEntityStartMoving = function(entityModel)
    print("Entity has started moving:", entityModel)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
    print("fuck.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/Jumpscares/main/ReboundJumpscare.txt"))()
wait(1.8)
loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/GuidingLight/main/BoundDie.txt"))()
end

------------------------

-- Run the created entity
Creator.runEntity(entity)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
    print("fuck.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/Jumpscares/main/ReboundJumpscare.txt"))()
wait(1.8)
loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/GuidingLight/main/BoundDie.txt"))()
end

------------------------

-- Run the created entity
Creator.runEntity(entity)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
    print("fuck.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/Jumpscares/main/ReboundJumpscare.txt"))()
wait(1.8)
loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/GuidingLight/main/BoundDie.txt"))()
end

------------------------

-- Run the created entity
Creator.runEntity(entity)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
    print("fuck.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/Jumpscares/main/ReboundJumpscare.txt"))()
wait(1.8)
loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/GuidingLight/main/BoundDie.txt"))()
end

------------------------

-- Run the created entity
Creator.runEntity(entity)
end

entity.Debug.OnEntityFinishedRebound = function(entityModel)
    print("Entity finished rebound:", entityModel)
end

entity.Debug.OnDeath = function()
    warn("You died.")
    print("fuck.")
loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/Jumpscares/main/ReboundJumpscare.txt"))()
wait(1.8)
loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/GuidingLight/main/BoundDie.txt"))()
end

------------------------

-- Run the created entity
Creator.runEntity(entity)
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Overseer eyes",
   Callback = function()
local Overseer = Instance.new("Model")
Overseer.Parent = workspace
Overseer.Name = "Overseer"
local v = game.Players.LocalPlayer
local enableDamage = true
local no = false
local damage1 = Instance.new("Sound")
damage1.SoundId = "rbxassetid://5507830449"
damage1.Pitch = 1.2
damage1.Volume = 0.7
local damage2 = Instance.new("Sound")
damage2.SoundId = "rbxassetid://5507830815"
damage2.Pitch = 1.2
damage2.Volume = 0.7
local damage3 = Instance.new("Sound")
damage3.SoundId = "rbxassetid://5507829691"
damage3.Pitch = 1.2
damage3.Volume = 0.7

local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
	camara.CFrame = camara.CFrame * shakeCf
end)
 
local currentLoadedRoom=workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
local eyes=game:GetObjects("rbxassetid://12285389022")[1]
 
if eyes then end
game.Workspace.CurrentRooms.ChildAdded:Connect(function()
    Overseer:Destroy()
    enableDamage = false
end)
local num=0

if currentLoadedRoom:FindFirstChild("Nodes") then
   num = math.floor(#currentLoadedRoom.Nodes:GetChildren()/2)
end

eyes.CFrame=(
	num==0 and currentLoadedRoom[currentLoadedRoom.Name] or currentLoadedRoom.Nodes[num]
).CFrame+Vector3.new(0,5,0)
 
eyes.Parent=Overseer
damage1.Parent=Overseer
damage2.Parent=Overseer
damage3.Parent=Overseer
local mom = {damage1, damage2, damage3}

if game.Players.LocalPlayer.Character.Humanoid.Health<=0 then
   no = true
end
 
local hum=game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
while true and enableDamage do
if not Overseer then break end
	local _,found=workspace.CurrentCamera:WorldToScreenPoint(eyes.Position)
	if not found then
	if v.Character ~= nil and not v.Character:GetAttribute("Hiding") then
if workspace.CurrentRooms:FindFirstChild("51") or workspace:FindFirstChild("SeekMoving")  then
return
end

camShake:Start()
camShake:ShakeOnce(5, 15, 0.1, 1)
		hum.Health-=3
          if no == false then
		mom[math.random(1, #mom)]:Play()
          end
		if hum.Health<=0 then
		if no == false then
			game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Overseer Eyes"
			no = true
			wait(1.8)
			loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/GuidingLight/main/SeerDie.txt"))()
		end
		end
	end
	end
	task.wait(0.5)
end
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Claim",
   Callback = function()

local currentLoadedRoom=workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
local eyes=game:GetObjects("rbxassetid://11411321855")[1]
 
local num=0

if currentLoadedRoom:FindFirstChild("Nodes") then
   num = math.floor(#currentLoadedRoom.Nodes:GetChildren()/2)
end

eyes.RushNew.CFrame=(
	num==0 and currentLoadedRoom[currentLoadedRoom.Name] or currentLoadedRoom.Nodes[num]
).CFrame+Vector3.new(0,5,0)

eyes.Parent=workspace
				--------------
				local function canSeeTarget(target,size)
					if killed == true then
						return
					end
					local origin = eyes.RushNew.Position
					local direction = (target.HumanoidRootPart.Position - eyes.RushNew.Position).unit * size
					local ray = Ray.new(origin, direction)

					local hit, pos = workspace:FindPartOnRay(ray, eyes.RushNew)


					if hit then
						if hit:IsDescendantOf(target) then
							killed = true
							return true
						end
					else
						return false
					end
				end
local particle = eyes.RushNew.Attachment
particle.ParticleEmitter.Enabled = false
particle.Spark.Enabled = false
    local death = Instance.new("Sound")
    death.Parent = workspace
    death.Name = "die"
    death.SoundId = "rbxassetid://5867708670"
    death.Volume = 0.7
    death.Pitch = 1
    local distort = Instance.new("DistortionSoundEffect")
    distort.Level = 0.9
    distort.Parent = death
    local cue = Instance.new("Sound")
    cue.Parent = workspace
    cue.Name = "Bubbles"
    cue.SoundId = "rbxassetid://9113601215"
    cue.Volume = 1
    cue.Pitch = 0.6
    local distort = Instance.new("DistortionSoundEffect")
    distort.Level = 0.7
    distort.Parent = cue
    cue.TimePosition = 1.25
wait(0.5)
particle.Spark.Enabled = true
cue:Play()
    wait(2)
				-------------------------
				--_SHAKER DO NOT MOD IFY
				spawn(function()
					while eyes ~= nil do wait(0.2)
						local v = game.Players.LocalPlayer
						local parent = script.Parent
						if v.Character ~= nil and not v.Character:GetAttribute("Hiding") then
							if canSeeTarget(v.Character,50) then
								v.Character:FindFirstChildWhichIsA("Humanoid"):TakeDamage(100)
				game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Claim"
				death:Play()
				local speaker = game.Players.LocalPlayer.Character
		for i,v in pairs(speaker:GetChildren()) do
			if v:IsA("BasePart") and
				v.Name == "Head" or
				v.Name == "RightUpperLeg" or
				v.Name == "LeftUpperLeg" or
				v.Name == "RightUpperArm" or
				v.Name == "LeftUpperArm" or
				v.Name == "RightLowerLeg" or
				v.Name == "LeftLowerLeg" or
				v.Name == "RightLowerArm" or
				v.Name == "LeftLowerArm" or
				v.Name == "RightFoot" or
				v.Name == "LeftFoot" or
				v.Name == "RightHand" or
				v.Name == "LeftHand" or
				v.Name == "UpperTorso" or
				v.Name == "LowerTorso" then
				v:Destroy()
			end
		end
		        wait(1.8)
		        loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/GuidingLight/main/ClaimDie.txt"))()
							end
						end
					end
				end)
				----------------------
    particle.ParticleEmitter.Enabled = true
    local TweenService = game:GetService("TweenService")
    local cue2 = Instance.new("Sound")
    cue2.Parent = eyes.RushNew
    cue2.Name = "Idle"
    cue2.SoundId = "rbxassetid://8256091246"
    cue2.Volume = 1
    cue2.Pitch = 4
    local distort = Instance.new("DistortionSoundEffect")
    distort.Level = 0.9
    distort.Parent = cue2
local fl = Instance.new("FlangeSoundEffect")
fl.Depth = 0.06
fl.Mix = 0.85
fl.Rate = 5
fl.Parent = cue2
	cue2.RollOffMaxDistance = 90
	cue2.RollOffMinDistance = 5
	cue2.RollOffMode = Enum.RollOffMode.LinearSquare
    local TW = TweenService:Create(cue2, TweenInfo.new(1.5),{Pitch = 0})
    local TW2 = TweenService:Create(cue2, TweenInfo.new(1.5),{Volume = 0})
    local TW3 = TweenService:Create(cue2, TweenInfo.new(1.5),{Volume = 1})
    cue2:Play()
    TW3:Play()
    wait(11)
	eyes.RushNew.Anchored = false
	eyes.RushNew.CanCollide = false
    TW:Play()
    TW2:Play()
    wait(2)
    eyes:Destroy()
    death:Destroy()
    cue:Destroy()
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Ripper",
   Callback = function()
game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(190, 0, 0)
game.Lighting.MainColorCorrection.Contrast = 0.3
local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(10), {Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(12),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
	camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4)
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Ripper",
		Asset = "https://github.com/FranciscoNeto5123/Entities/blob/main/RipperV3.rbxm?raw=true",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 200,
		Delay = 2,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 1,
		Max = 1,
		Delay = 8
	},
	Damage = {
		Enabled = true,
		Range = 50,
		Amount = 125
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Greed", "Greed attacks when you take too much gold", "Hence, the name, greed", "This thing... is fast", "Keep going, you're doing great!"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Depth",
   Callback = function()
local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "Depth",
    Model = "https://github.com/Nicolaspenteado/Depth/blob/main/depth2.rbxm?raw=true",
    Speed = 300,
    MoveDelay = 3,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 65,
    SpawnInFront = false,
    ShatterLights = true,
    FlickerLights = {
        Enabled = true,
        Duration = 1
    },
    Cycles = {
        Min = 1,
        Max = 4,
        Delay = 0.25
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 100
    },
    ResistCrucifix = false,
    BreakCrucifix = true,
    DeathMessage = {"You died to Depth", "The lights will flicker when it spawns.", "Don't NOT hide.", "You're doing good so far.", "Good luck"},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("",true)
end

entity.Debug.OnEntityDespawned = function()
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("",true)
end

entity.Debug.OnEntityStartMoving = function()
    print("Entity started moving")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity finished rebound")
end

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity entered room:", room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player looking at entity")
end

entity.Debug.OnDeath = function()
    print("Player has died")
end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Custom crucifixion script here")
    end
]]--

---====== Run entity ======---

Spawner.runEntity(entity)
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Greed",
   Callback = function()
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Greed",
		Asset = "https://github.com/plamen6789/CustomDoorsMonsters/blob/main/Greed.rbxm?raw=true",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 150,
		Delay = 0,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 3,
		Max = 7,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 50,
		Amount = 125
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died to who you call greed.", "Greed spawns when you take too much gold.", "Hence the name, greed.", "Better luck next time!", "See ya!"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Trauma",
   Callback = function()
local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---


local entity = Spawner.createEntity({
    CustomName = "Trauma",
    Model = "https://github.com/munciseek/DOORS-entity-models/blob/main/Nightmare/Trauma.rbxm?raw=true", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 100,
    MoveDelay = 0,
    HeightOffset = 4,
    CanKill = true,
    KillRange = 30,
    SpawnInFront = false,
    ShatterLights = false,
    FlickerLights = {
        Enabled = false,
        Duration = 3
    },
    Cycles = {
        Min = 1,
        Max = 1,
        Delay = 0
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 100
    },
    ResistCrucifix = true,
    BreakCrucifix = true,
    DeathMessage = {"you die to A-10", "yee."},
    IsCuriousLight = true
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
wait(30)
game.workspace.Trauma:Destroy()
end

entity.Debug.OnEntityDespawned = function()
    local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()
 
---====== Display achievement ======---
achievementGiver({
    Title = "Ser Verty Has Deted",
    Desc = "Ave Sira Cant Detdesa",
    Reason = "Encounter Trauma",
    Image = "rbxassetid://0"
})
end
entity.Debug.OnEntityStartMoving = function()
    print("Entity started moving")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity finished rebound")
end

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity entered room:", room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player looking at entity")
end

entity.Debug.OnDeath = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/huyhoangphuc/ytu/main/A-200Jumpscare'))()
end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Custom crucifixion script here")
    end
]]--

---====== Run entity ======---

Spawner.runEntity(entity)
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn G-95",
   Callback = function()
local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---


local entity = Spawner.createEntity({
    CustomName = "G95",
    Model = "https://github.com/munciseek/DOORS-entity-models/blob/main/Nightmare/G-95.rbxm?raw=true", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 100,
    MoveDelay = 0,
    HeightOffset = 4,
    CanKill = true,
    KillRange = 30,
    SpawnInFront = true,
    ShatterLights = false,
    FlickerLights = {
        Enabled = false,
        Duration = 3
    },
    Cycles = {
        Min = 4,
        Max = 5.5,
        Delay = 0
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 100
    },
    ResistCrucifix = true,
    BreakCrucifix = true,
    DeathMessage = {"you die to A-10", "yee."},
    IsCuriousLight = true
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
wait(30)
game.workspace.G95:Destroy()
end

entity.Debug.OnEntityDespawned = function()
    local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()
 
---====== Display achievement ======---
achievementGiver({
    Title = "The Will A Sea",
    Desc = "Are You Will Do",
    Reason = "Encounter G-95",
    Image = "rbxassetid://537141778"
})
end
entity.Debug.OnEntityStartMoving = function()
    print("Entity started moving")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity finished rebound")
end

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity entered room:", room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player looking at entity")
end

entity.Debug.OnDeath = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/huyhoangphuc/ytu/main/A-200Jumpscare'))()
end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Custom crucifixion script here")
    end
]]--

---====== Run entity ======---

Spawner.runEntity(entity)
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn A-15",
   Callback = function()
local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "A-15",
    Model = "https://github.com/Franciscolovedoorshardcoremode/EntitiesScraryMode/blob/main/a10.rbxm?raw=true", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 100,
    MoveDelay = 1.8,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 40,
    SpawnInFront = false,
    ShatterLights = false,
    FlickerLights = {
        Enabled = false,
        Duration = 8
    },
    Cycles = {
        Min = 0.5,
        Max = 0.5,
        Delay = 0
    },
    CamShake = {
        Enabled = true,
        Values = {5.15, 20, 0.1, 1},
        Range = 100
    },
    ResistCrucifix = false,
    BreakCrucifix = false,
    DeathMessage = {"you die to A-10", "yee."},
    IsCuriousLight = true
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
end

entity.Debug.OnEntityDespawned = function()
    workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:WaitForChild("Door").ClientOpen:FireServer()
end

entity.Debug.OnEntityStartMoving = function()
    print("Entity started moving")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity finished rebound")
end

entity.Debug.OnEntityEnteredRoom = function(room)
end

entity.Debug.OnLookAtEntity = function()
end

entity.Debug.OnDeath = function()
    warn("You died.")
end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Custom crucifixion script here")
    end
]]--

---====== Run entity ======---

Spawner.runEntity(entity)
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn A-35",
   Callback = function()
local Spawner = loadstring(game:HttpGet('https://raw.githubusercontent.com/MuhXd/DoorSuff/main/OtherSuff/DoorEntitySpawn%2BSource'))()


-- Create entity
local entity = Spawner.createEntity({
    CustomName = "A-35", -- Custom name of your entity
    Model = "rbxassetid://13486970543", -- Can be GitHub file or rbxassetid
    Speed = 100, -- Percentage, 100 = default Rush speed
    DelayTime = 3, -- Time before starting cycles (seconds)
    HeightOffset = 0.5,
    CanKill = true,
    NoDieOnCrouching = false,
    NoHiding = false,
    AntiCrucifix = false,
    KillRange = 60,
    OneRoom = false,
    DieOnLook = false,
    BreakLights = false,
    BackwardsMovement = false,
     MovementDeath = {
        false, -- Turned On?
        '1',  --- '1'= 'Instant Without Being Looked out' | '2' = 'With Being Looked At'
    },
    FlickerLights = {
        false, -- Enabled/Disabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 1.5,
        Max = 1.5,
        WaitTime = 1,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {30, 30, 0.1, 1}, -- Shake values (don't ch--ge if you don't know)
        50, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Type = "3", -- "Normal" or 1 | "Pop" or 2 | "endlessdoorsrebound" or "Rebound" or 3 | More coming Soon
            Image1 = "rbxassetid://18384688860", -- Image1 url
            Image2 = "rbxassetid://18384701999", -- Image2 url
            Shake = true,
            Sound1 = {
                "18103906189", -- SoundId Link or Roblox ID
                { Volume = 3 }, -- Sound properties
            },
            Sound2 = {
                "18103906189", -- SoundId Link or Roblox ID
                { Volume = 3 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    Color = 'GuidingLight', -- CuriousLight ( Yellow ) | GuidingLight ( Blue )
    DiffrentMessages = false,
    CustomDialog = {  
        {"A-60 has seen you.", "It will consume anyone on sight.", "It takes a bit to fully spawn in", "so you can use that to your advantage."}, -- Death Messages
        {"Stop Dieing"},
        {"Bruh", "Use what you have learned from Rush!"},
        {"It seems like Template is causing quite the ruckus...", "Hide in a closet or bed as quickly as possible!"},
         {"I have told You What to do", "YOU JUST HAVE A SKILL ISSUE"}
    }
})

-----[[ Advanced Sctipting ]]-----

entity.Debug.OnEntityMoving = function(Invincible,Hiding,plrCollisionPoint)
print("Invincible: "..tostring(Invincible))
print("Player to Entity Collision (None hiding Point): "..tostring(plrCollisionPoint))
print("Hiding: "..tostring(Hiding))
end
       
entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned:")   
end

entity.Debug.OnEntityDespawned = function()
    print("Nostalgic frikig")
end

entity.Debug.OnEntityStartMoving = function()
    print("Entity has started moving:")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity has finished rebound:")
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("Entity:", "has entered room:",room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player has looked at entity:")
end

entity.Debug.OnDeath = function()
    warn("Player has died.")
end

------------------------

-- Run the created entity
Spawner.runEntity(entity)
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Frostbite",
   Callback = function()
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Frostbite",
		Asset = "rbxassetid://12272255258",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 0.000000000000000000000001,
		Delay = 0,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 3,
		Max = 7,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 30,
		Amount = 10
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died to who you call frostbite.", "Frostbite can spawn randomly.", "It will be freezing in that room.", "Get out as fast as you can!", "Try again, please."},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Cease",
   Callback = function()
game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(0, 0, 100)
game.Lighting.MainColorCorrection.Contrast = 0.3
local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(10), {Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(12),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Cease",
		Asset = "rbxassetid://16167836521",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 0.00000000001,
		Delay = 0,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 3,
		Max = 7,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 30,
		Amount = 10
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Cease.", "Cease spawner in at random.", "When they spawn in, a blue light will appear", "After, a noise would play.", "See ya!"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Surge",
   Callback = function()
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Surge",
		Asset = "rbxassetid://15114507528",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 1000,
		Delay = 5,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 3,
		Max = 7,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 30,
		Amount = 10
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died to who you call Surge.", "When they spawn in, it's the ngl.", "Have no idea what this does.", "Better luck next time!", "See ya!"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Silence",
   Callback = function()
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Silence",
		Asset = "rbxassetid://11792913759",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 0.000000000000001,
		Delay = 5,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 3,
		Max = 7,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 30,
		Amount = 10
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"Crouch..", "Shh", "Shhh", "SHHHHH", "SHUT UP!"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Gloom",
   Callback = function()
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Gloom",
		Asset = "rbxassetid://14065612251",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 78,
		Delay = 0,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 3,
		Max = 7,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 30,
		Amount = 10
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died to who you call gloom.", "just hide lol", "idot.", "Better luck next time!", "See ya!"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Sandstorm",
   Callback = function()
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Sandstorm",
		Asset = "rbxassetid://13036748750",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 90,
		Delay = 0,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 3,
		Max = 7,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 30,
		Amount = 50
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died to who you call Sandstorm.", "They said to just read the paper..", "but the page is sandy..", "welp", "Just hide, it does 50 damage only."},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Blaze",
   Callback = function()
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Blaze",
		Asset = "rbxassetid://11957203186",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 250,
		Delay = 0,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 3,
		Max = 7,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 30,
		Amount = 50
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"Mine craft, the next lines are placeholders. too lazy", "Greed spawns when you take too much gold.", "Hence the name, greed.", "Better luck next time!", "See ya!"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Shocker",
   Callback = function()
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function spawnShocker()
    local shockerModel = game:GetObjects("rbxassetid://12777079952")[1]
    shockerModel.PrimaryPart = shockerModel:FindFirstChild("HumanoidRootPart") or shockerModel:FindFirstChildWhichIsA("Part")
    
    local camera = Workspace.CurrentCamera
    shockerModel:SetPrimaryPartCFrame(camera.CFrame * CFrame.new(0, 0, -7))
    shockerModel.Parent = Workspace

    local oogaBoogaaPart = shockerModel:WaitForChild("OOGA BOOGAAAA")
    local horrorScream = shockerModel:WaitForChild("OOGA BOOGAAAA"):WaitForChild("HORROR SCREAM 15")

    local lookDuration = 5
    local startTime = tick()
    local playerLookingAtShocker = true

    while playerLookingAtShocker do
        wait(4)

        local angle = (oogaBoogaaPart.Position - character.PrimaryPart.Position).unit
        local direction = camera.CFrame.LookVector

        if (angle:Dot(direction) > 0.9) then
            if tick() - startTime >= lookDuration then
                horrorScream:Play()
                humanoid:TakeDamage(20)
                local function GetGitSound(GithubSnd,SoundName)
				local url=GithubSnd
				if not isfile(SoundName..".mp3") then
					writefile(SoundName..".mp3", game:HttpGet(url))
				end
				local sound=Instance.new("Sound")
				sound.SoundId=(getcustomasset or getsynasset)(SoundName..".mp3")
				return sound
			end
			game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
	game.Lighting.MainColorCorrection.Contrast = 1
	local tween = game:GetService("TweenService")
	tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(2.5), {Contrast = 0}):Play()
	local TweenService = game:GetService("TweenService")
	local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(80),{TintColor = Color3.fromRGB(255, 255, 255)})
	TW:Play()
        local Jc = GetGitSound("https://github.com/Nowhywhat/Entity-sound/blob/main/shocker%20Jumpscares.mp3?raw=true","Attack")
				Jc.Parent = workspace
				Jc.Volume = 5
				Jc:Play()
                playerLookingAtShocker = false

                local speed = 20
                local targetPosition = character.PrimaryPart.Position

                while oogaBoogaaPart.Position.Y > targetPosition.Y do
                    local directionToPlayer = (targetPosition - oogaBoogaaPart.Position).unit
                    oogaBoogaaPart.Position = oogaBoogaaPart.Position + directionToPlayer * speed * 0.1
                    wait(0.1)
                end

                oogaBoogaaPart.CanCollide = false
                oogaBoogaaPart.Anchored = false
                wait(2)
                shockerModel:Destroy()
game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Shocker"
local func, setupval, getinfo, typeof, getgc, next = nil, debug.setupvalue or setupvalue, debug.getinfo or getinfo, typeof, getgc, next

for i,v in next, getgc(false) do
    if typeof(v) == "function" then
        local info = getinfo(v)
        if info.currentline == 54 and info.nups == 2 and info.is_vararg == 0 then
            func = v
            break
        end
    end
end

local function DeathHint(hints, type: string)
    setupval(func, 1, hints)
    if type ~= nil then
        setupval(func, 2, type)
    end
end

DeathHint({
    "You died to who you call Shocker...",
    "Dont look at it or it stuns you!"
}, "Blue") -- "Blue" or "Yellow"
                break
            end
        else
            
            oogaBoogaaPart.CanCollide = false
            oogaBoogaaPart.Anchored = false
            break
        end
    end
oogaBoogaaPart.CanCollide = false
oogaBoogaaPart.Anchored = false
wait(3)
    shockerModel:Destroy()
end

spawnShocker()
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn Crumble",
   Callback = function()
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Crumble",
		Asset = "rbxassetid://15145616275",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 325,
		Delay = 0,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 3,
		Max = 7,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 30,
		Amount = 9999
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died to who you call greed.", "Greed spawns when you take too much gold.", "Hence the name, greed.", "Better luck next time!", "See ya!"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
 end,
})

local Button = MainTab:CreateButton({
   Name = "Spawn A-10 (wiki version)",
   Callback = function()
---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "A-10",
		Asset = "rbxassetid://12835725676",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 2
		},
		Shatter = true,
		Repair = false
	},
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 90,
		Delay = 0,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 3,
		Max = 7,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 30,
		Amount = 50
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died to who you call greed.", "Greed spawns when you take too much gold.", "Hence the name, greed.", "Better luck next time!", "See ya!"},
		Cause = ""
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()
 end,
})
