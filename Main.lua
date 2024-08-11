local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local localplr = game:GetService("Players").LocalPlayer

local Window = Rayfield:CreateWindow({
    Name = "Nate - BA Destroyer",
    LoadingTitle = "Nate - BA Destroyer",
    LoadingSubtitle = "by Nate",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil,
       FileName = "NateHub"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = true
    },
    KeySystem = false, 
       KeySettings = {
       Title = "Key System",
       Subtitle = "Key System",
       Note = "",
       FileName = "Key",
       SaveKey = true, 
       GrabKeyFromSite = false,
       Key = {""}
    }
 })

 local function getplrnames()
    local rtable = {}

    for i,plr in pairs(game.Players:GetPlayers()) do
      table.insert(rtable,plr.Name)
    end
    return rtable
end
 
local function notify(title,content)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = 3,
        Image = 4483362458,
        Actions = {
           Ignore = {
              Name = "Okay",
              Callback = function()
           end
        },
     },
     })
end

local function checkremote()
   local find = false
   local remote = nil
    for i,v in pairs(workspace:GetDescendants()) do
        if v.Name == "ChangeTransparency" then find = true remote = v end
    end
    for i,v in pairs(game.Players:GetDescendants()) do
      if v.Name == "ChangeTransparency" then find = true remote = v end
  end
    return find,remote
end

 getgenv().SelectedPlr = nil
 getgenv().LoopkillPlr = false
 getgenv().ExploType = "6 lber. Cannon"
 
 local Server = Window:CreateTab("Server", 4483362458)
 local servSection1 = Server:CreateSection("Server Controls")

 local KillAll = Server:CreateButton({
   Name = "Kill All",
   Callback = function()
    for i,plr in pairs(game.Players:GetPlayers()) do
      local args = {
         [1] = "fffffffff",
         [2] = "\22t\253\193\146\184\135@\245mg\195\164p\17\193\\\143B>{\20\152\193\0\0\200BH\202\22B\0\0\128?",
         [3] = plr.Character.Humanoid,
         [4] = 0
        }
        game:GetService("ReplicatedStorage").ReplicatedEvents.ProjectileDamage:FireServer(unpack(args))
    end
   end,
})
local SilentKillAll = Server:CreateButton({
   Name = "Silent Kill All",
   Callback = function()
    for i,plr in pairs(game.Players:GetPlayers()) do
      if plr and plr.Character then
      local args = {
         [1] = plr.Character,
         [2] = "Finish",
         [3] = CFrame.new(Vector3.new(0,math.huge,0))
         }
       game:GetService("ReplicatedStorage").ArtilleryReplicated.ArtilleryEvents.MoveArcade:FireServer(unpack(args))
      end
    end
   end,
})
local ExpAll = Server:CreateButton({
   Name = "Explode All",
   Callback = function()
    for i,plr in pairs(game.Players:GetPlayers()) do
      if plr and plr.Character then
      local args = {
         [1] = "ffff",
         [2] = string.pack("ffff",plr.Character.HumanoidRootPart.Position.X,plr.Character.HumanoidRootPart.Position.Y,plr.Character.HumanoidRootPart.Position.Z,10,17),
         [3] = 3,
         [4] = workspace[getgenv().ExploType]
     }
     game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedEvents"):WaitForChild("ProjectileHit"):FireServer(unpack(args))
     end
    end
   end,
})
local VoidAll = Server:CreateButton({
   Name = "Void All",
   Callback = function()
    for i,plr in pairs(game.Players:GetPlayers()) do
      if plr and plr.Character then
      local args = {
         [1] = plr.Character,
         [2] = "Finish",
         [3] = CFrame.new(Vector3.new(0,99999999999999999,0))
         }
       game:GetService("ReplicatedStorage").ArtilleryReplicated.ArtilleryEvents.MoveArcade:FireServer(unpack(args))
      end
    end
   end,
})
local BringAll = Server:CreateButton({
   Name = "Bring All",
   Callback = function()
    for i,plr in pairs(game.Players:GetPlayers()) do
         if plr and plr.Character then
         local args = {
            [1] = plr.Character,
            [2] = "Finish",
            [3] = CFrame.new(localplr.Character.HumanoidRootPart.Position)
            }
          game:GetService("ReplicatedStorage").ArtilleryReplicated.ArtilleryEvents.MoveArcade:FireServer(unpack(args))
         end
       end
   end,
})
local InvisAll = Server:CreateButton({
   Name = "Invisible All",
   Callback = function()
       for i,plr in pairs(game.Players:GetPlayers()) do
         local bool,inst = checkremote()
        if bool == false and not inst then
            notify("Error.","Exploited Remote Not Found! [No weapon instances exists]")
        else
         for i,part in pairs(plr.Character:GetDescendants()) do
            coroutine.resume(coroutine.create(function()
                if part:IsA("Part") or part:IsA("MeshPart") or part:IsA("SpecialMesh") or part:IsA("UnionOperation") or part:IsA("WedgePart") or part:IsA("CornerWedgePart") and part.Transparency ~= 1 then
                    local args = {
                     [1] = part,
                      [2] = 1
                 }
                inst:FireServer(unpack(args))
                end
            end))
            end
        end
       end
   end,
})
local VisAll = Server:CreateButton({
   Name = "Visible All",
   Callback = function()
       for i,plr in pairs(game.Players:GetPlayers()) do
         local bool,inst = checkremote()
        if bool == false then
            notify("Error.","Exploited Remote Not Found! [No weapon instances exists]")
        else
         for i,part in pairs(plr.Character:GetDescendants()) do
            coroutine.resume(coroutine.create(function()
                if part:IsA("Part") or part:IsA("MeshPart") or part:IsA("SpecialMesh") or part:IsA("UnionOperation") or part:IsA("WedgePart") or part:IsA("CornerWedgePart") and part.Transparency ~= 1 then
                    local args = {
                     [1] = part,
                      [2] = 0
                 }
                inst:FireServer(unpack(args))
                end
            end))
            end
        end
       end
   end,
})

 local Player = Window:CreateTab("Player", 4483362458)
 local pSection1 = Player:CreateSection("Player Select")

 local PlrSelectionDD = Player:CreateDropdown({
    Name = "Select Player",
    Options = getplrnames(),
    CurrentOption = {"None"},
    MultipleOptions = false,
    Flag = "PlayerControlFlag",
    Callback = function(Option)
        getgenv().SelectedPlr = Option[1]
    end,
 })
 local RefreshPlrDD = Player:CreateButton({
    Name = "Refresh Player List",
    Callback = function()
        PlrSelectionDD:Set(getplrnames())
    end,
 })

 local pSection2 = Player:CreateSection("Player Controls")

 local KillPlr = Player:CreateButton({
    Name = "Kill Player",
    Callback = function()
      if game.Players:FindFirstChild(getgenv().SelectedPlr) then
         local args = {
       [1] = "fffffffff",
       [2] = "\22t\253\193\146\184\135@\245mg\195\164p\17\193\\\143B>{\20\152\193\0\0\200BH\202\22B\0\0\128?",
       [3] = game.Players:FindFirstChild(getgenv().SelectedPlr).Character.Humanoid,
       [4] = 0
      }
      game:GetService("ReplicatedStorage").ReplicatedEvents.ProjectileDamage:FireServer(unpack(args))
      end
    end,
 })
 local LoopkillPlr = Player:CreateToggle({
   Name = "Loopkill Player",
   CurrentValue = false,
   Flag = "LoopkillFlag", 
   Callback = function(Value)
    getgenv().LoopkillPlr = Value
   end,
})
 local ExploPlr = Player:CreateButton({
   Name = "Explode Player",
   Callback = function()
      if game.Players:FindFirstChild(getgenv().SelectedPlr) then
      local args = {
         [1] = "ffff",
         [2] = string.pack("ffff",game.Players:FindFirstChild(getgenv().SelectedPlr).Character.HumanoidRootPart.Position.X,game.Players:FindFirstChild(getgenv().SelectedPlr).Character.HumanoidRootPart.Position.Y,game.Players:FindFirstChild(getgenv().SelectedPlr).Character.HumanoidRootPart.Position.Z,10,17),
         [3] = 3,
         [4] = workspace[getgenv().ExploType]
     }
     
     game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedEvents"):WaitForChild("ProjectileHit"):FireServer(unpack(args))
     end
   end,
})
local StrikePlr = Player:CreateButton({
   Name = "Airstrike Player",
   Callback = function()
   if game.Players:FindFirstChild(getgenv().SelectedPlr) then
      local randplr = game.Players:GetPlayers()[math.random(1,#game.Players:GetPlayers())]
      if #game.Players:GetPlayers() > 1 then
         repeat randplr = game.Players:GetPlayers()[math.random(1,#game.Players:GetPlayers())] wait() until randplr ~= game.Players:FindFirstChild(getgenv().SelectedPlr)
      end
      local args = {
         [1] = randplr.Character,
         [2] = "Finish",
         [3] = CFrame.new(Vector3.new(game.Players:FindFirstChild(getgenv().SelectedPlr).Character.HumanoidRootPart.Position.X,game.Players:FindFirstChild(getgenv().SelectedPlr).Character.HumanoidRootPart.Position.Y+1500,game.Players:FindFirstChild(getgenv().SelectedPlr).Character.HumanoidRootPart.Position.Z))
         }
      game:GetService("ReplicatedStorage").ArtilleryReplicated.ArtilleryEvents.MoveArcade:FireServer(unpack(args))
      task.wait(1)
      repeat wait() until randplr.Character.Humanoid.FloorMaterial ~= Enum.Material.Air

   for i = 1,50 do
      local args = {
         [1] = "ffff",
         [2] = string.pack("ffff",game.Players:FindFirstChild(getgenv().SelectedPlr).Character.HumanoidRootPart.Position.X+(math.random(-25,25)),game.Players:FindFirstChild(getgenv().SelectedPlr).Character.HumanoidRootPart.Position.Y,game.Players:FindFirstChild(getgenv().SelectedPlr).Character.HumanoidRootPart.Position.Z+(math.random(-25,25)),15,17),
         [3] = 3,
         [4] = workspace["6 lber. Cannon"]
         }
         game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedEvents"):WaitForChild("ProjectileHit"):FireServer(unpack(args))
   end
   for i = 1,20 do
      local args = {
         [1] = "ffff",
         [2] = string.pack("ffff",game.Players:FindFirstChild(getgenv().SelectedPlr).Character.HumanoidRootPart.Position.X+(math.random(-15,15)),game.Players:FindFirstChild(getgenv().SelectedPlr).Character.HumanoidRootPart.Position.Y+i*3,game.Players:FindFirstChild(getgenv().SelectedPlr).Character.HumanoidRootPart.Position.Z+(math.random(-15,15)),10,17),
         [3] = 3,
         [4] = workspace["6 lber. Cannon"]
         }
         game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedEvents"):WaitForChild("ProjectileHit"):FireServer(unpack(args))
end
   end
end,
})
local SuicPlr = Player:CreateButton({
   Name = "Suicide Bomb Player",
   Callback = function()
   if game.Players:FindFirstChild(getgenv().SelectedPlr) then
      local randplr = game.Players:GetPlayers()[math.random(1,#game.Players:GetPlayers())]
      if #game.Players:GetPlayers() > 1 then
         repeat randplr = game.Players:GetPlayers()[math.random(1,#game.Players:GetPlayers())] wait() until randplr ~= game.Players:FindFirstChild(getgenv().SelectedPlr)
      end
      local args = {
         [1] = randplr.Character,
         [2] = "Finish",
         [3] = CFrame.new(Vector3.new(game.Players:FindFirstChild(getgenv().SelectedPlr).Character.HumanoidRootPart.Position.X+5,game.Players:FindFirstChild(getgenv().SelectedPlr).Character.HumanoidRootPart.Position.Y,game.Players:FindFirstChild(getgenv().SelectedPlr).Character.HumanoidRootPart.Position.Z+5))
         }
      game:GetService("ReplicatedStorage").ArtilleryReplicated.ArtilleryEvents.MoveArcade:FireServer(unpack(args))
      
   task.wait(3)

   for i = 1,50 do
      local args = {
         [1] = "ffff",
         [2] = string.pack("ffff",randplr.Character.HumanoidRootPart.Position.X+math.random(-20,20),randplr.Character.HumanoidRootPart.Position.Y,randplr.Character.HumanoidRootPart.Position.Z+math.random(-20,20),25,27),
         [3] = 3,
         [4] = workspace["6 lber. Cannon"]
         }
         game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedEvents"):WaitForChild("ProjectileHit"):FireServer(unpack(args))
      end
   end
end,
})
local CnPlr = Player:CreateButton({
   Name = "Cannon Player",
   Callback = function()
    --wip
   end,
})
 local InvisPlr = Player:CreateButton({
    Name = "Invisible Player",
    Callback = function()
      if game.Players:FindFirstChild(getgenv().SelectedPlr) then

      local bool,inst = checkremote()
        if bool == false and not inst then
            notify("Error.","Exploited Remote Not Found! [No weapon instances exists]")
        else
         for i,part in pairs(game.Players:FindFirstChild(getgenv().SelectedPlr).Character:GetDescendants()) do
            coroutine.resume(coroutine.create(function()
                if part:IsA("Part") or part:IsA("MeshPart") or part:IsA("SpecialMesh") or part:IsA("UnionOperation") or part:IsA("WedgePart") or part:IsA("CornerWedgePart") and part.Transparency ~= 1 then
                    local args = {
                     [1] = part,
                      [2] = 1
                 }
                inst:FireServer(unpack(args))
                end
            end))
            end
        end
      end
    end,
 })
 local VisPlr = Player:CreateButton({
   Name = "Visible Player",
   Callback = function()
     if game.Players:FindFirstChild(getgenv().SelectedPlr) then

      local bool,inst = checkremote()
       if bool == false and not inst then
           notify("Error.","Exploited Remote Not Found! [No weapon instances exists]")
       else
        for i,part in pairs(game.Players:FindFirstChild(getgenv().SelectedPlr).Character:GetDescendants()) do
           coroutine.resume(coroutine.create(function()
               if part:IsA("Part") or part:IsA("MeshPart") or part:IsA("SpecialMesh") or part:IsA("UnionOperation") or part:IsA("WedgePart") or part:IsA("CornerWedgePart") and part.Name ~= "HumanoidRootPart" and part.Transparency ~= 0 then
                   local args = {
                    [1] = part,
                     [2] = 0
                }
                inst:FireServer(unpack(args))
               end
           end))
           end
       end
     end
   end,
})
local VoidPlr = Player:CreateButton({
   Name = "Void Player",
   Callback = function()
      if game.Players:FindFirstChild(getgenv().SelectedPlr) then
         local args = {
            [1] = game.Players:FindFirstChild(getgenv().SelectedPlr).Character,
            [2] = "Finish",
            [3] = CFrame.new(Vector3.new(0,99999999999999999,0))
            }
          game:GetService("ReplicatedStorage").ArtilleryReplicated.ArtilleryEvents.MoveArcade:FireServer(unpack(args))
      end
   end,
})
 local TpPlr = Player:CreateButton({
   Name = "Teleport To Player",
   Callback = function()
      if game.Players:FindFirstChild(getgenv().SelectedPlr) then
         localplr.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(getgenv().SelectedPlr).Character.HumanoidRootPart.CFrame
      end
   end,
})
local BringPlr = Player:CreateButton({
   Name = "Bring Player",
   Callback = function()
      if game.Players:FindFirstChild(getgenv().SelectedPlr) then
         local args = {
            [1] = game.Players:FindFirstChild(getgenv().SelectedPlr).Character,
            [2] = "Finish",
            [3] = CFrame.new(localplr.Character.HumanoidRootPart.CFrame.Position)
            }
          game:GetService("ReplicatedStorage").ArtilleryReplicated.ArtilleryEvents.MoveArcade:FireServer(unpack(args))
      end
   end,
})

 local Weapon = Window:CreateTab("Weapon", 4483362458)
 local wSection1 = Weapon:CreateSection("Weapon Options")

 getgenv().InfAmmo = false
 getgenv().NoRecoil = false
 getgenv().AccShot = false
 getgenv().QuickReload = false
 getgenv().NoMisfires = false
 getgenv().CustomBulletSpeed = false
 getgenv().CustomSpeedVal = 21

 local InfAmmo = Weapon:CreateToggle({
   Name = "Infinite Ammo",
   CurrentValue = false,
   Flag = "iaFlag",
   Callback = function(Value)
      getgenv().InfAmmo = Value
   end,
 })
 local nRecoil = Weapon:CreateToggle({
   Name = "No Recoil",
   CurrentValue = false,
   Flag = "nrFlag",
   Callback = function(Value)
      getgenv().NoRecoil = Value
   end,
 })
 local nRecoil = Weapon:CreateToggle({
   Name = "Accurate Shot",
   CurrentValue = false,
   Flag = "asFlag",
   Callback = function(Value)
      getgenv().AccShot = Value
   end,
 })
 local qReload = Weapon:CreateToggle({
   Name = "Quick Reload",
   CurrentValue = false,
   Flag = "qrFlag",
   Callback = function(Value)
      getgenv().QuickReload = Value
   end,
 })
 local qReload = Weapon:CreateToggle({
   Name = "Disable Misfires",
   CurrentValue = false,
   Flag = "qrFlag",
   Callback = function(Value)
      getgenv().NoMisfires = Value
   end,
 })
 local CusBS = Weapon:CreateToggle({
   Name = "Custom Bullet Speed",
   CurrentValue = false,
   Flag = "cbsFlag",
   Callback = function(Value)
      getgenv().CustomBulletSpeed = Value
   end,
 })
 local BulletSpeed = Weapon:CreateSlider({
   Name = "Bullet Speed",
   Range = {1, 250},
   Increment = 1,
   Suffix = "SPS",
   CurrentValue = 21,
   Flag = "bSpeedFlag",
   Callback = function(Value)
      getgenv().CustomSpeedVal = Value
   end,
})

 local Destroyer = Window:CreateTab("Destroyer", 4483362458)
 local dSection1 = Destroyer:CreateSection("Main Options")

 local KillAll = Destroyer:CreateButton({
   Name = "Kill All",
   Callback = function()
    for i,plr in pairs(game.Players:GetPlayers()) do
      local args = {
         [1] = "fffffffff",
         [2] = "\22t\253\193\146\184\135@\245mg\195\164p\17\193\\\143B>{\20\152\193\0\0\200BH\202\22B\0\0\128?",
         [3] = plr.Character.Humanoid,
         [4] = 0
        }
        game:GetService("ReplicatedStorage").ReplicatedEvents.ProjectileDamage:FireServer(unpack(args))
    end
   end,
})
 local InvMap = Destroyer:CreateButton({
   Name = "Invisible Map",
   Callback = function()
      local bool,inst = checkremote()
      if bool == false and not inst then
          notify("Error.","Exploited Remote Not Found! [No weapon instances exists]")
      else
         for i,part in workspace:GetDescendants() do
            coroutine.resume(coroutine.create(function()
                if part:IsA("Part") or part:IsA("MeshPart") or part:IsA("SpecialMesh") or part:IsA("UnionOperation") or part:IsA("WedgePart") or part:IsA("CornerWedgePart") and part.Transparency ~= 1 then
                    local args = {
                     [1] = part,
                      [2] = 1
                 }
                 if inst then
                     inst:FireServer(unpack(args))
                 else
                  local bool2,inst2 = checkremote()
                  if bool == false and not inst then
                     notify("Error.","Exploited Remote Deleted, No Replacements! [No weapon instances exists]")
                  else
                     inst2:FireServer(unpack(args))
                  end
                 end
                end
            end))
            end
      end
   end,
})
local DelCan = Destroyer:CreateButton({
   Name = "Delete Cannons",
   Callback = function()
      for i,inst in pairs(game.Workspace:GetDescendants()) do
         if inst.Name == "12 lber. Cannon" then
           local args = {
         [1] = inst,
         [2] = "Finish",
         [3] = CFrame.new(Vector3.new(0, -math.huge, 0), Vector3.new(0, -10000, 0))
         }
       game:GetService("ReplicatedStorage").ArtilleryReplicated.ArtilleryEvents.MoveArcade:FireServer(unpack(args))
         end
     end
   end,
})
local FireCan = Destroyer:CreateButton({
   Name = "Fire Cannons",
   Callback = function()
    --wip
   end,
})
local NukeMap = Destroyer:CreateButton({
   Name = "Nuke Map",
   Callback = function()
    --wip
   end,
})
local cServer = Destroyer:CreateButton({
   Name = "Crash Server",
   Callback = function()
      for i,part in workspace:GetDescendants() do
         coroutine.resume(coroutine.create(function()
             if part:IsA("Model") and part.PrimaryPart ~= nil and part ~= game.Players.LocalPlayer.Character then
                local args = {
                  [1] = part,
                  [2] = "Finish",
                  [3] = CFrame.new(workspace.Spawns["BritishSpawn 2"].Position, workspace.Spawns["BritishSpawn 2"].Position)
                  }
                game:GetService("ReplicatedStorage").ArtilleryReplicated.ArtilleryEvents.MoveArcade:FireServer(unpack(args))
             end
         end))
         end
         while wait() do
         for i,plr in pairs(game.Players:GetPlayers()) do
         if (plr==game.Players.LocalPlayer) == false then
             local args = {
             [1] = plr.Character,
             [2] = "Finish",
             [3] = CFrame.new(workspace.Spawns["BritishSpawn 2"].Position, workspace.Spawns["BritishSpawn 2"].Position)
             }
           game:GetService("ReplicatedStorage").ArtilleryReplicated.ArtilleryEvents.MoveArcade:FireServer(unpack(args))
             end
             end
         end
   end,
})

 local Misc = Window:CreateTab("Misc", 4483362458)
 local mSection1 = Misc:CreateSection("Hitbox Options")

 getgenv().HitboxExpand = false
 getgenv().HitboxSize = 5
 local HitboxExpander = Misc:CreateToggle({
   Name = "Hitbox Expander",
   CurrentValue = false,
   Flag = "hbeFlag",
   Callback = function(Value)
      getgenv().HitboxExpand = Value
   end,
 })
 local HitboxSize = Misc:CreateSlider({
   Name = "Hitbox Size",
   Range = {5, 80},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 5,
   Flag = "hbSzizeFlag",
   Callback = function(Value)
      getgenv().HitboxSize = Value
   end,
})
local mSection2 = Misc:CreateSection("ESP Options")

getgenv().ESPtoggle = false
getgenv().ESPfill = Color3.fromRGB(255,255,255)
getgenv().ESPfillT = 0.5
getgenv().ESPoutline = Color3.fromRGB(255,255,255)
getgenv().ESPoutlineT = 0.5
local ESPtoggle = Misc:CreateToggle({
   Name = "Player ESP",
   CurrentValue = false,
   Flag = "espFlag",
   Callback = function(Value)
      getgenv().ESPtoggle = Value
   end,
 })
 local EspFill = Misc:CreateColorPicker({
   Name = "ESP Fill Color",
   Color = Color3.fromRGB(255,255,255),
   Flag = "EspFillFlag1", 
   Callback = function(Value)
      getgenv().ESPfill = Value
   end
})
local EspFT = Misc:CreateSlider({
   Name = "Fill Transparency",
   Range = {0, 1},
   Increment = 0.01,
   Suffix = "",
   CurrentValue = 0.5,
   Flag = "EspFillFlag2",
   Callback = function(Value)
      getgenv().ESPfillT = Value
   end,
})
local EspOutline = Misc:CreateColorPicker({
   Name = "ESP Outline Color",
   Color = Color3.fromRGB(255,255,255),
   Flag = "EspOutlineFlag1", 
   Callback = function(Value)
      getgenv().ESPoutline = Value
   end
})
local EspOT = Misc:CreateSlider({
   Name = "Outline Transparency",
   Range = {0, 1},
   Increment = 0.01,
   Suffix = "",
   CurrentValue = 0.5,
   Flag = "EspOutlineFlag2",
   Callback = function(Value)
      getgenv().ESPoutlineT = Value
   end,
})

local mSection3 = Misc:CreateSection("Misc Scripts")

local InfYield = Misc:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

 local Settings = Window:CreateTab("Settings", 4483362458)
 local sSection1 = Settings:CreateSection("Settings")

 getgenv().KickGroupJoin = false
 local KickOGJ = Settings:CreateToggle({
   Name = "Kick on Group Join",
   CurrentValue = false,
   Flag = "cgjFlag",
   Callback = function(Value)
      getgenv().KickGroupJoin = Value
   end,
 })
 local ExitScript = Settings:CreateButton({
   Name = "Exit Script",
   Callback = function()
      getgenv().SelectedPlr = nil
      getgenv().LoopkillPlr = false
      getgenv().ExploType = "6 lber. Cannon"
      getgenv().InfAmmo = false
      getgenv().NoRecoil = false
      getgenv().AccShot = false
      getgenv().QuickReload = false
      getgenv().NoMisfires = false
      getgenv().CustomBulletSpeed = false
      getgenv().CustomSpeedVal = 21
      getgenv().ESPtoggle = false
      getgenv().ESPfill = Color3.fromRGB(255,255,255)
      getgenv().ESPfillT = 0.5
      getgenv().ESPoutline = Color3.fromRGB(255,255,255)
      getgenv().ESPoutlineT = 0.5
      getgenv().HitboxExpand = false
      getgenv().HitboxSize = 5
      getgenv().KickGroupJoin = false
      task.wait(0.1)
      exitlast()
      Rayfield:Destroy()
   end,
})

endfunc = coroutine.create(function()

 game.Players.PlayerAdded:Connect(function()
   if plr:IsInGroup(4545766) and getgenv().KickGroupJoin == true then
      game.Players.LocalPlayer:Kick("Group member: "..plr.DisplayName.." | @"..plr.Name.." joined")
  end
 end)

while task.wait() do

      for i,plr in pairs(game.Players:GetPlayers()) do
         if plr ~= localplr then
            if getgenv().HitboxExpand == true then
               plr.Character.HumanoidRootPart.Size = Vector3.new(getgenv().HitboxSize,getgenv().HitboxSize,getgenv().HitboxSize)
               plr.Character.HumanoidRootPart.Transparency = 0.99
            elseif plr.Character.HumanoidRootPart.Size ~= Vector3.new(2,2,1) then
               plr.Character.HumanoidRootPart.Size = Vector3.new(2,2,1)
               plr.Character.HumanoidRootPart.Transparency = 1
            end
            if not plr.Character:FindFirstChild("ESPINSTANCE") then local nx = Instance.new("Highlight",plr.Character) nx.Name = "ESPINSTANCE" nx.Enabled = false end
               if plr.Character:FindFirstChild("ESPINSTANCE") then
                  local esp_inst = plr.Character:FindFirstChild("ESPINSTANCE")
                  if getgenv().ESPtoggle == true then
                  esp_inst.Enabled = true
                  esp_inst.FillColor = getgenv().ESPfill
                  esp_inst.FillTransparency = getgenv().ESPfillT
                  esp_inst.OutlineColor = getgenv().ESPoutline
                  esp_inst.OutlineTransparency = getgenv().ESPoutlineT
               else
                  esp_inst.Enabled = false
               end
            else
               local nx = Instance.new("Highlight",plr.Character) nx.Name = "ESPINSTANCE" nx.Enabled = false
            end
         end
      end

   if localplr.Character:FindFirstChildOfClass("Tool") and localplr.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Settings") and localplr.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Settings"):FindFirstChild("Miscellaneous"):FindFirstChild("FireRecoil") then
      local wepSettings = localplr.Character:FindFirstChildOfClass("Tool"):WaitForChild("Settings"):WaitForChild("Miscellaneous")
      if getgenv().InfAmmo == true then wepSettings.MaxAmmo.Value = math.huge else wepSettings.MaxAmmo.Value = 20 end
      if getgenv().NoRecoil == true then wepSettings.FireRecoil.Value = 0 else wepSettings.FireRecoil.Value = 3 end
      if getgenv().AccShot == true then wepSettings.BulletDropPerFrame.Value = 0 wepSettings.AccuracyAt200.Value = 0 else wepSettings.BulletDropPerFrame.Value = 0.05 wepSettings.AccuracyAt200.Value = 1 end
      if getgenv().QuickReload == true then wepSettings.ReloadSpeed.Value = 2.5 wepSettings.ReloadSpeedWhileMoving.Value = 2.5 else wepSettings.ReloadSpeed.Value = 15 wepSettings.ReloadSpeedWhileMoving.Value = 19 end
      if getgenv().NoMisfires == true then wepSettings.MisfireRate.Value = 0 else wepSettings.MisfireRate.Value = 0.1 end
      if getgenv().CustomBulletSpeed == true then wepSettings.BulletSpeedPerFrame.Value = getgenv().CustomSpeedVal else wepSettings.BulletSpeedPerFrame.Value = 21 end
   end

   if getgenv().LoopkillPlr == true then
      if game.Players:FindFirstChild(getgenv().SelectedPlr) then
         local args = {
       [1] = "fffffffff",
       [2] = "\22t\253\193\146\184\135@\245mg\195\164p\17\193\\\143B>{\20\152\193\0\0\200BH\202\22B\0\0\128?",
       [3] = game.Players:FindFirstChild(getgenv().SelectedPlr).Character:WaitForChild("Humanoid"),
       [4] = 0
      }
      game:GetService("ReplicatedStorage").ReplicatedEvents.ProjectileDamage:FireServer(unpack(args))
      end
   end
end

end)
coroutine.resume(endfunc)

function exitlast()
   coroutine.close(endfunc)
end
