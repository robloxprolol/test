------------------------------------------------------------------------
						-- Made by Cronizete --
------------------------------------------------------------------------

------------------------------------------------------------------------
							-- Things --
------------------------------------------------------------------------

plr = game.Players.LocalPlayer
char = plr.Character
lleg,rleg,larm,rarm,hed = char["Left Leg"],char["Right Leg"],char["Left Arm"],char["Right Arm"],char["Head"]
rutprt,torso = char.HumanoidRootPart,char.Torso
otheranims,swimming,hum,stopanim,cooldown = false,false,char:FindFirstChildOfClass'Humanoid',false,false
TweenService = game:GetService("TweenService")
stopanim2 = false -- larm
stopanim3 = false -- head

hammer = Instance.new('Part', char)
hammer.Name = "Hammer"
hammer.CanCollide = true
hammer.Position = char.Head.Position
hammer.Size = Vector3.new(1.71, 1.31, 3.2)
hammer.Locked = true
mesh = Instance.new('SpecialMesh', hammer)
mesh.MeshId = "rbxassetid://12592754"
mesh.TextureId = "rbxassetid://12592745"
mesh.Scale = Vector3.new(1.05, 1.05, 1.05)

fx = Instance.new('Part', char)
fx.Anchored = false
fx.CanCollide = false
fx.Transparency = 1
fx.Size = Vector3.new(1.77, 0.85, 1.05)
weld = Instance.new('Weld', fx)
weld.Part0 = fx
weld.Part1 = hammer
weld.C0 = CFrame.new(0, 0, -1.2)

func = hammer.Touched:connect(function(hit)
	if not hit.Parent:FindFirstChildOfClass'Humanoid' then
		wait(1)
		hammer.Anchored = true
		func:disconnect()
	end
end)

function gettorso(a)
	return a:FindFirstChild'Torso' or a:FindFirstChild'UpperTorso' or a:FindFirstChild'LowerTorso' or a:FindFirstChild'HumanoidRootPart'
end

------------------------------------------------------------------------
						-- Animate Stuff --
------------------------------------------------------------------------
char.Animate.Disabled=true
local fldb={['w']=false,['a']=false,['s']=false,['d']=false}
local RunSpeed=30

local WlkSpeed=16
local SwimSpeed=14
local SwimDashSpeed=28
local anim = "Idling"
local lastanim = "Idling"
local val = 0
local syne = 0
local num = 0
local runtime = 0
local pseudohead=hed:Clone()
for i,x in pairs(pseudohead:GetChildren()) do if not x.ClassName:find('Mesh') then x:Destroy() end end
pseudohead.Name='PseudoHead'
pseudohead.Parent=char.Head
local pseudoweld=Instance.new('Weld',torso)
pseudoweld.Part0=hed
pseudoweld.Name='PseudoHedWld'
pseudoweld.Part1=pseudohead
hed.Transparency=1

coroutine.wrap(function() for i,x in pairs(hed:GetChildren()) do if x:IsA('Sound') then x:Destroy() end end end)()

function Lerp(a, b, i)
	local com1 = {a.X, a.Y, a.Z, a:toEulerAnglesXYZ()}
	local com2 = {b.X, b.Y, b.Z, b:toEulerAnglesXYZ()}
	local calx = com1[1] + (com2[1] - com1[1]) * i
	local caly = com1[2] + (com2[2] - com1[2]) * i
	local calz = com1[3] + (com2[3] - com1[3]) * i
	local cala = com1[4] + (com2[4] - com1[4]) * i
	local calb = com1[5] + (com2[5] - com1[5]) * i
	local calc = com1[6] + (com2[6] - com1[6]) * i
	return CFrame.new(calx, caly, calz) * CFrame.Angles(cala, calb, calc)
end

function TwnSingleNumber(s,f,m)
	local wot=s+(f-s)*m
	return wot
end

function TwnVector3(q,w,e)
	local begin={q.x,q.y,q.z}
	local ending={w.x,w.y,w.z}
	local bgx=begin[1]+(ending[1]-begin[1])*e
	local bgy=begin[2]+(ending[2]-begin[2])*e
	local bgz=begin[3]+(ending[3]-begin[3])*e
	return Vector3.new(bgx,bgy,bgz)
end

newWeld = function(wld, wp0, wp1, wc0x, wc0y, wc0z)
	wld = Instance.new("Weld", wp1)
	wld.Part0 = wp0
	wld.Part1 = wp1
	wld.C0 = CFrame.new(wc0x, wc0y, wc0z)
end

local angles = CFrame.Angles
function clerp(a, b, t)
    return a:lerp(b, t)
end

newWeld(law, torso, larm, -1.5, 0.5, 0)
newWeld(raw, torso, rarm, 1.5, 0.5, 0)
newWeld(llw, torso, lleg, -.5, -2, 0)
newWeld(rlw, torso, rleg, .5, -2, 0)
newWeld(hw, torso, hed, 0, 1.5, 0)
local rutwald=Instance.new('Weld',rutprt)
rutwald.Part0=rutprt
rutwald.Part1=torso
rutprt.Weld.C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),0)
larm.Weld.C1 = CFrame.new(0, 0.5, 0)*CFrame.Angles(math.rad(0),0,0)
rarm.Weld.C1 = CFrame.new(0, 0.5, 0)*CFrame.Angles(math.rad(0),0,0)
rleg.Weld.C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),0,0)
lleg.Weld.C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),0,0)

------------------------------------------------------------------------
							 -- idk --
------------------------------------------------------------------------

wind = Instance.new('Sound', hammer)
wind.SoundId = "rbxassetid://866649671"
wind.PlaybackSpeed = 1.5
wind.Volume = 1
wind.Looped = true

grab = Instance.new('Sound', rarm)
grab.SoundId = "rbxassetid://1296135936"
grab.Volume = 1
grab.Looped = false

drop = Instance.new('Sound', hammer)
drop.SoundId = "rbxassetid://873196972"
drop.Volume = 1
drop.Looped = false

ghit = Instance.new('Sound', hammer)
ghit.SoundId = "rbxassetid://873196789"
ghit.Volume = 5
ghit.Looped = false

gyro = Instance.new('BodyGyro', hammer)
gyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
gyro.CFrame = CFrame.Angles(math.rad(90), 0, 0)

holding = false

fakearm = rarm:Clone()
fakearm.Name = "fakearm"
fakearm:ClearAllChildren''
fakearm.Parent = char
fakearm.Transparency = 1
fakearm.CanCollide = false
weld = Instance.new('Weld', fakearm)
weld.Part0 = fakearm
weld.Part1 = rarm
weld.C0 = CFrame.new(0, 0, 1)

------------------------------------------------------------------------
							-- Lightning --
------------------------------------------------------------------------

Part0 = Instance.new("Part")
ParticleEmitter1 = Instance.new("ParticleEmitter")
Part0.Name = "lightning"
Part0.Parent = nil
Part0.Transparency = 1
Part0.FormFactor = Enum.FormFactor.Symmetric
Part0.Size = Vector3.new(0.820000052, 1.76999962, 2)
Part0.CFrame = CFrame.new(26.3400002, 0.884999812, 44.9500122, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part0.Position = Vector3.new(26.3400002, 0.884999812, 44.9500122)
ParticleEmitter1.Name = "Lightning"
ParticleEmitter1.Parent = Part0
ParticleEmitter1.Rotation = NumberRange.new(0, 360)
ParticleEmitter1.Size = NumberSequence.new(1.0429447889328,3.3742332458496,0,3.3435583114624,0,3.3742332458496,0,3.6503071784973,0.030674934387207,3.7730062007904,0,3.8036811351776,0,3.8343560695648,0,3)
ParticleEmitter1.Color = ColorSequence.new(Color3.new(0.27451, 0.607843, 1),Color3.new(1, 1, 1))
ParticleEmitter1.LightEmission = 1
ParticleEmitter1.Texture = "http://www.roblox.com/asset/?id=243098098"
ParticleEmitter1.Lifetime = NumberRange.new(1, 1)
ParticleEmitter1.Rate = 12312311808
ParticleEmitter1.Speed = NumberRange.new(0, 0)
ParticleEmitter1.Enabled = true
ParticleEmitter1.Color = ColorSequence.new(Color3.new(0.27451, 0.607843, 1),Color3.new(1, 1, 1))

function Lightning(Part0,Part1,Times,Offset,Color,Thickness,Trans)
    local magz = (Part0 - Part1).magnitude
    local curpos = Part0
    local trz = {-Offset,Offset}
    for i=1,Times do
        local li = Instance.new("Part", torso)
		li.Name = "Lightning"
		li.TopSurface =0
		li.Material = "Neon"
		li.BottomSurface = 0
		li.Anchored = true
		li.Locked = true
		li.Transparency = Trans or 0.4
		li.BrickColor = BrickColor.new(Color)
		li.formFactor = "Custom"
		li.CanCollide = false
		li.Size = Vector3.new(Thickness,Thickness,magz/Times)
        local Offzet = Vector3.new(trz[math.random(1,2)],trz[math.random(1,2)],trz[math.random(1,2)])
        local trolpos = CFrame.new(curpos,Part1)*CFrame.new(0,0,magz/Times).p+Offzet
        
		if Times == i then
        	local magz2 = (curpos - Part1).magnitude
       	 	li.Size = Vector3.new(Thickness,Thickness,magz2)
        	li.CFrame = CFrame.new(curpos,Part1)*CFrame.new(0,0,-magz2/2)
        else
        	li.CFrame = CFrame.new(curpos,trolpos)*CFrame.new(0,0,magz/Times/2)
        end

        curpos = li.CFrame*CFrame.new(0,0,magz/Times/2).p
        game.Debris:AddItem(li,.1)
    end
end

BodyParts = {} 
Bounding = {}
--table.insert(BodyParts, fx)

for _, v in pairs(BodyParts) do
	local temp = {X=nil, Y=nil, Z=nil}
	temp.X = v.Size.X/2 * 10
	temp.Y = v.Size.Y/2 * 10
	temp.Z = v.Size.Z/2 * 10
	Bounding[v.Name] = temp
end

spawn(function()
	while wait(math.random(1,7)/10) do
		if #BodyParts ~= 0 and #Bounding ~= 0 then
			local Body1 = BodyParts[math.random(#BodyParts)]
			local Body2 = BodyParts[math.random(#BodyParts)]
			local Pos1 = Vector3.new(
				math.random(-Bounding[Body1.Name].X, Bounding[Body1.Name].X)/10,
				math.random(-Bounding[Body1.Name].Y, Bounding[Body1.Name].Y)/10,
				math.random(-Bounding[Body1.Name].Z, Bounding[Body1.Name].Z)/10
		)
			local Pos2 = Vector3.new(
				math.random(-Bounding[Body2.Name].X, Bounding[Body2.Name].X)/10,
				math.random(-Bounding[Body2.Name].Y, Bounding[Body2.Name].Y)/10,
				math.random(-Bounding[Body2.Name].Z, Bounding[Body2.Name].Z)/10
		)
			local SPos1 = Body1.Position + Pos1
			local SPos2 = Body2.Position + Pos2
			Lightning(SPos1, SPos2, 4, 3, "Cyan", .3, .56)
		end
	end
end)

------------------------------------------------------------------------
							-- Keys --
------------------------------------------------------------------------

using = false

function weldhammer()
	hammer.Anchored = false
	hammer.CanCollide = false
	grab:Play()
	weld = Instance.new('Weld', hammer)
	weld.Part0 = rarm
	weld.Part1 = hammer
	weld.C0 = CFrame.new(0, -0.6, -0.7) * CFrame.Angles(math.rad(0), math.rad(180), math.rad(90))
end

function gethammer()
	if (fakearm.Position - hammer.Position).magnitude >= 15 then
		stopanim = true
		using = true
		hammer.CanCollide = false
		hammer.Anchored = true
		wind:Play()
		
--		a = hammer.Touched:connect(function(hit)
--			if hit.Parent:FindFirstChildOfClass'Humanoid' and hit.Parent.Name ~= plr.Name then
--				ghit:Play()
--				if hit.Parent:FindFirstChildOfClass'Humanoid'.MaxHealth <= 100 and hit.Parent:FindFirstChild'HumanoidRootPart' then
--					hit.Parent:FindFirstChildOfClass'Humanoid':TakeDamage(hit.Parent:FindFirstChildOfClass'Humanoid'.MaxHealth/2/2/2)
--				elseif not hit.Parent:FindFirstChildOfClass'Humanoid'.MaxHealth <= 100 then
--					hit.Parent:BreakJoints''
--				elseif hit:IsA'Part' or hit:IsA'MeshPart' or hit:IsA'BasePart' or hit:IsA'UnionOperation' then
--					hit.Anchored = false
--					bv = Instance.new('BodyVelocity', hit)
--					bv.MaxForce = Vector3.new(2e9, 2e9, 2e9)
--					bv.Velocity = -hit.CFrame.lookVector * 50
--					game:service'Debris':AddItem(bv, 0.2)
--				end
--			end
--		end)
		
		for i = 0,4 do
			wait()
			rarm.Weld.C0 = clerp(rarm.Weld.C0, rarm.Weld.C0 * CFrame.new(0,0,0)*CFrame.Angles(math.rad(0), math.rad(0), math.rad(140)), .1)
		end
		repeat wait()
		hammer.CFrame = clerp(hammer.CFrame, fakearm.CFrame * CFrame.new(0, -0.6, 0) * CFrame.Angles(0, math.rad(180), math.rad(90)), .1) 
		if (fakearm.Position - hammer.Position).magnitude >= 3 then
			wind.Volume = 3
		else
			wind.Volume = (fakearm.Position - hammer.Position).magnitude
		end
		until (fakearm.Position - hammer.Position).magnitude <= .7
		
		a:disconnect()
		hammer.Anchored = false
		hammer.CanCollide = false
		weldhammer()
		wind:Stop()
		wait(.3)
		stopanim = false
		using = false
	end
end

function drophammer()
	a = hammer.Touched:connect(function(hit)
		if not hit.Parent:FindFirstChildOfClass'Humanoid' then
			drop:Play()
			wait(1)
			hammer.Anchored = true
			a:disconnect()
		end
	end)
	
	hammer.Anchored = false
	for _, a in pairs(hammer:children'') do
		if a:IsA'Weld' then
			a:Destroy''
		end
	end
	hammer.CanCollide = true
end

function attacktargets()
	if #targets >= 1 and holding then
		using = true
		hum.WalkSpeed = 0
		hum.JumpPower = 0
		
		for i = 1,75 do
			swait()
			larm.Weld.C0 = clerp(larm.Weld.C0, larm.Weld.C0 * CFrame.new(0,0,0)*CFrame.Angles(math.rad(91), math.rad(-6), math.rad(-19)), 0.1)
			rarm.Weld.C0 = clerp(rarm.Weld.C0, rarm.Weld.C0 * CFrame.new(0,0,0)*CFrame.Angles(-math.rad(-165), math.rad(0), math.rad(0)), 0.1)
		end
		hum.WalkSpeed = 16
		hum.JumpPower = 50
		hammer.Anchored = true
		for _, a in pairs(hammer:children'') do
			if a:IsA'Weld' then
				a:Destroy''
			end
		end
		hammer.CanCollide = false
		holding = false
		for _, a in pairs(targets) do
			ttorso = gettorso(a)
			if a ~= nil and gettorso(a) and a:FindFirstChildOfClass'Humanoid' then
				repeat wait() a:FindFirstChildOfClass'Humanoid'.WalkSpeed = 5 hammer.CFrame = clerp(hammer.CFrame, ttorso.CFrame * CFrame.Angles(0, math.rad(ttorso.CFrame.lookVector.Y), 0), 0.1) until (hammer.Position - ttorso.Position).magnitude <= 6 
				a:BreakJoints''
				ghit:Play()
			end
		end
		for _, a in pairs(rotate) do
			if a ~= nil then
				a:Destroy''
			end
		end
		targets = {}
		rotate = {}
		hammer.CanCollide = false
		
		
		
		stopanim = true
		hammer.CanCollide = false
		hammer.Anchored = true
		wind:Play()
		
		for i = 0,4 do
			wait()
			rarm.Weld.C0 = clerp(rarm.Weld.C0, rarm.Weld.C0 * CFrame.new(0,0,0)*CFrame.Angles(math.rad(0), math.rad(0), math.rad(140)), .1)
		end
		repeat wait()
		hammer.CFrame = clerp(hammer.CFrame, fakearm.CFrame * CFrame.new(0, -0.6, 0) * CFrame.Angles(0, math.rad(180), math.rad(90)), .13) 
		if (fakearm.Position - hammer.Position).magnitude >= 3 then
			wind.Volume = 3
		else
			wind.Volume = (fakearm.Position - hammer.Position).magnitude
		end
		until (fakearm.Position - hammer.Position).magnitude <= .7
		
		hammer.Anchored = false
		hammer.CanCollide = false
		weldhammer()
		wind:Stop()
		holding = true
		wait(.3)
		stopanim = false
		using = false
	end
end

function bgrab()
	for _, a in pairs(workspace:children'') do
		if a:FindFirstChildOfClass'Humanoid' and gettorso(a) and a.Name ~= plr.Name then
			ttorso = gettorso(a)
			if (ttorso.Position - rutprt.Position).magnitude <= 3 then
				using = true
				target2 = a
				stopanim2 = true
				target:FindFirstChildOfClass'Humanoid'.WalkSpeed = 0
				target:FindFirstChildOfClass'Humanoid'.JumpPower = 0
				hum.WalkSpeed = 0
				hum.JumpPower = 0
				for i = 0,25 do
					swait()
					larm.Weld.C0 = clerp(larm.Weld.C0, CFrame.new(-1.5,.525,0) * CFrame.Angles(math.rad(100), math.rad(20), math.rad(20)), 0.1)
				end
				weld = Instance.new('Weld', rutprt)
				weld.Part0 = rutprt
				weld.Part1 = ttorso
				weld.C0 = CFrame.new(-0.5, 0, -1.2)
				
				wait(.1)
				
				
				ttorso.Anchored = true
				b = Instance.new('Part', char)
				b.Anchored = true
				b.CanCollide = false
				b.Transparency = 1
				b.CFrame = hed.CFrame
				b.Position = hed.Position + Vector3.new(0, 50, 0) + hed.CFrame.lookVector * 500
				
				d = Instance.new('Part', char)
				d.Anchored = true
				d.CanCollide = false
				d.Transparency = 1
				d.CFrame = hed.CFrame
				d.Position = hed.Position - Vector3.new(0, 5.6, 0) + hed.CFrame.lookVector * -45
				
				wait(.5)
				for i = 1,75 do
					swait()
					rarm.Weld.C0 = clerp(rarm.Weld.C0, rarm.Weld.C0 * CFrame.new(0,0,0)*CFrame.Angles(-math.rad(-165), math.rad(0), math.rad(0)), 0.1)
				end
				drophammer()
				wind:Play()
				
				repeat wait() 
					hammer.Anchored = true
					hammer.CFrame = clerp(hammer.CFrame, b.CFrame, 0.1) 
					wind.Volume = (hammer.Position - d.Position).magnitude
				until (hammer.Position - b.Position).magnitude <= 5
				
				repeat wait()
					hammer.Anchored = true 
					hammer.CFrame = clerp(hammer.CFrame, d.CFrame, 0.1) 
					wind.Volume = (hammer.Position - d.Position).magnitude
				until (hammer.Position - d.Position).magnitude <= 45
				
				target2:BreakJoints''
				ghit:Play()
				wind:Stop()
				wait(.1)
				stopanim2 = false
				hum.WalkSpeed = 16
				hum.JumpPower = 50
				b:Destroy''
				d:Destroy''
				hammer.Anchored = false
				weldhammer()
				grab:Play()
				using = false
			end
		end
	end
end

function shield()
	using = true
	hum.WalkSpeed = 0
	hum.JumpPower = 0
	for i = 1,75 do
		swait()
		larm.Weld.C0 = clerp(larm.Weld.C0, larm.Weld.C0 * CFrame.new(0,0,0)*CFrame.Angles(math.rad(91), math.rad(-6), math.rad(-19)), 0.1)
		rarm.Weld.C0 = clerp(rarm.Weld.C0, rarm.Weld.C0 * CFrame.new(0,0,0)*CFrame.Angles(-math.rad(-165), math.rad(0), math.rad(0)), 0.1)
	end
	hum.WalkSpeed = 16
	hum.JumpPower = 50
	drophammer()
	hammer.Anchored = true
	hammer.CanCollide = true
	using = false
end

function stopshield()
	gethammer()
end

--function transform()
--	stopanim = true
--	stopanim3 = true
--	hum.WalkSpeed = 0
--	hum.JumpPower = 0
--	for i = 0,7 do
--		wait()
--		hammer.Weld.C0 = clerp(hammer.Weld.C0, CFrame.new(0, -2.5, -0.7) * CFrame.Angles(math.rad(-85), math.rad(180), math.rad(90)), 0.1)
--		rarm.Weld.C0 = clerp(rarm.Weld.C0, rarm.Weld.C0 * CFrame.new(0,0,0)*CFrame.Angles(-math.rad(-179), math.rad(0), math.rad(15)), 0.1)
--		hed.Weld.C0 = clerp(hed.Weld.C0, hed.Weld.C0 * CFrame.new(0,0,0.2)*CFrame.Angles(math.rad(40), math.rad(0), math.rad(0)), 0.1)
--	end	
--	a = Instance.new('Part', char)
--	a.Name = "hello"
--	a.Size = Vector3.new(0.2, 0.2, 0.2)
--	a.Anchored = true
--	a.CanCollide = false
--	a.Position = hammer.Position + Vector3.new(0, 75, 0)	
--	
--	wait(3)
--	table.insert(BodyParts, fx)
--	wait(4)
--	
--	spawn(function()
--		for i = 0,45 do
--			swait()
--			hammer.Weld.C0 = clerp(hammer.Weld.C0, CFrame.new(0, -0.6, -0.7) * CFrame.Angles(math.rad(0), math.rad(180), math.rad(90)), 0.07)
--		end
--	end)
--	
--	hum.WalkSpeed = 16
--	hum.JumpPower = 50
--	stopanim = false
--	stopanim3 = false
--end

------------------------------------------------------------------------
						   	-- Target --
------------------------------------------------------------------------	

bg = Instance.new('BillboardGui', plr.PlayerGui)
bg.Size = UDim2.new(15, 0, 15, 0)
bg.AlwaysOnTop = true
il = Instance.new('ImageLabel', bg)
il.Image = "rbxassetid://142406345"
il.BackgroundTransparency = 1
il.Size = UDim2.new(1, 0, 1, 0)
il.ImageColor3 = Color3.new(0,0,0)

home = false
down = false
barrier = false
targets = {}
rotate = {}

mouse.KeyDown:connect(function(k)
	key = k:lower()
	if key == "g" and not barrier and not using then
		attacktargets()
	end
	
	if key == "e" and not cooldown and not barrier and not using then
		cooldown = true
		if not holding and (fakearm.Position - hammer.Position).magnitude >= 15 then
			holding = true
			gethammer()
		elseif holding then
			holding = false
			drophammer()
		end
		wait(.3)
		cooldown = false
	end
		
	if key == "q" and not cooldown and holding and not barrier and not using then
		cooldown = true
		using = true
		hum.WalkSpeed = 0
		hum.JumpPower = 0
		for i = 1,75 do
			swait()
			larm.Weld.C0 = clerp(larm.Weld.C0, larm.Weld.C0 * CFrame.new(0,0,0)*CFrame.Angles(math.rad(91), math.rad(-6), math.rad(-19)), 0.1)
			rarm.Weld.C0 = clerp(rarm.Weld.C0, rarm.Weld.C0 * CFrame.new(0,0,0)*CFrame.Angles(-math.rad(-165), math.rad(0), math.rad(0)), 0.1)
		end
		hum.WalkSpeed = 16
		hum.JumpPower = 50
		holding = false
		drophammer()
		for i = 1,25 do
			wait()
			hammer.CFrame = clerp(hammer.CFrame, CFrame.new(9999,0,9999), 0.1)
		end
		wait(.5)
		cooldown = false
		using = false
	end
	
	if key == "f" and holding and not cooldown and not barrier and not using then
		cooldown = true
		bgrab()
		wait(.2)
		cooldown = false
	end
	
	if key == "v" and holding and not using then
		if not barrier then
			shield()
			barrier = true
		else
			barrier = false
			stopshield()
		end
	end
end)

mouse.Button1Down:connect(function()
	if home and holding then
		clone = bg:clone()
		clone.Parent = plr.PlayerGui
		clone.ImageLabel.ImageColor3 = Color3.new(255,255,255)
		clone.Name = "hi"
		if gettorso(mouse.Target.Parent) then
			clone.Adornee = gettorso(mouse.Target.Parent)
			table.insert(targets, mouse.Target.Parent)
			table.insert(rotate, clone)
		elseif not gettorso(mouse.Target.Parent) then
			clone:Destroy''
		end
	end
end)

spawn(function()
	while wait() do
		
		il.Rotation = il.Rotation + 5
		if holding and mouse.Target and mouse.Target.Parent and gettorso(mouse.Target.Parent) and mouse.Target.Parent:FindFirstChildOfClass'Humanoid' and mouse.Target.Parent:FindFirstChildOfClass'Humanoid'.Health ~= 0 then
			target = mouse.Target.Parent
			
			home = true
			il.ImageTransparency = 0
			bg.Adornee = gettorso(target)
		elseif not mouse.Target then
			il.ImageTransparency = 1
			home = false
		elseif not mouse.Target.Parent then
			il.ImageTransparency = 1
			home = false
		elseif not mouse.Target.Parent:FindFirstChildOfClass'Humanoid' then
			il.ImageTransparency = 1
			home = false
		end
		
	end
end)

spawn(function()
	while wait() do
		for _, a in pairs(rotate) do
			if a ~= nil then
				a.ImageLabel.Rotation = a.ImageLabel.Rotation + 5
			elseif targets <= 0 then
				a:Destroy''
			end
		end
	end
end)

------------------------------------------------------------------------
						  -- Manual Pickup --
------------------------------------------------------------------------	

hammer.Touched:connect(function(hit)
	if not holding and not using and hammer.Anchored and hit.Parent.Name == plr.Name then
		holding = true
		hammer.Anchored = false
		hammer.CanCollide = false
		weldhammer()
	end
end)

------------------------------------------------------------------------
				     -- Important functions --
------------------------------------------------------------------------

died = false

function swait(num)
	if num == 0 or num == nil then
		game:service("RunService").Stepped:wait(0)
	else
		for i = 0, num do
			game:service("RunService").Stepped:wait(0)
		end
	end
end

spawn(function()
	while wait() do
		if holding and hammer:FindFirstChildOfClass'Weld' then
			hammer.Anchored = false
		end
	end
end)

x = 0
spawn(function()
	while wait() do
		if barrier then
			x = x + 0.6
			hammer.CFrame = rutprt.CFrame * CFrame.Angles(0,0.1-x,0) * CFrame.new(25,0,0)
			
			for _, a in pairs(workspace:children'') do
				ttorso = gettorso(a)
				if a:FindFirstChildOfClass'Humanoid' and a:FindFirstChildOfClass'Humanoid'.Health ~= 0 and a.Name ~= plr.Name and gettorso(a) and (ttorso.Position - hammer.Position).magnitude <= 15 then
					a:BreakJoints''
					ghit:Play()
				elseif a:FindFirstChildOfClass'Humanoid' and not gettorso(a) then
					a:BreakJoints''
				end
			end
			
			for _, a in pairs(workspace:children'') do
				ttorso = gettorso(a)
				if a:FindFirstChildOfClass'Humanoid' and a:FindFirstChildOfClass'Humanoid'.Health ~= 0 and a.Name ~= plr.Name and gettorso(a) and (ttorso.Position - rutprt.Position).magnitude <= 10 then
					a:BreakJoints''
					ghit:Play()
				elseif a:FindFirstChildOfClass'Humanoid' and not a:FindFirstChild'HumanoidRootPart' then
					a:BreakJoints''
				end
			end
			
			if x == 1 then
				x = 0.1
			end
		end
	end
end)

------------------------------------------------------------------------
						   -- Animations --
------------------------------------------------------------------------

while true do
	swait()
	
	if holding then
		gyro.Parent = nil
	elseif not holding then
		gyro.Parent = hammer
		gyro.Name = "hamma"
	end
	
	ypcall(function()
		if anim~=lastanim then
			runtime=0
		end
		lastanim=anim
		hum.CameraOffset=(rutprt.CFrame:toObjectSpace(hed.CFrame)).p+Vector3.new(0,-1.25,0)
		syne=syne+.95
		if not otheranims and not swimming then
			if (torso.Velocity*Vector3.new(1, 0, 1)).magnitude < 1 and not hum.Jump then-- and torso.Velocity.y<5 and torso.Velocity.y>-5
				anim="Idling"
			elseif hum.FloorMaterial ~= Enum.Material.Air and (rutprt.Velocity*Vector3.new(1, 0, 1)).magnitude > 1 and (rutprt.Velocity*Vector3.new(1, 0, 1)).magnitude < RunSpeed-10 and not hum.Jump then-- and torso.Velocity.y<5 and torso.Velocity.y>-5
				anim="Walking"
			elseif (torso.Velocity*Vector3.new(1, 0, 1)).magnitude > RunSpeed-10 and not hum.Jump then-- and torso.Velocity.y<5 and torso.Velocity.y>-5
				anim="Sprinting"
			elseif torso.Velocity.y < -1 then
				anim='Falling'
			end
		end
	
		if anim=="Idling" and hum.WalkSpeed ~= 0 then
			idlesineinc=35
			
			if not stopanim then
				rarm.Weld.C0=clerp(rarm.Weld.C0,CFrame.new(1.5,.55+math.cos(syne/idlesineinc)/25,0)*CFrame.Angles(math.rad(1),math.rad(0),math.rad(6)),.1)
			end
			
			if not stopanim2 then
				larm.Weld.C0=clerp(larm.Weld.C0,CFrame.new(-1.5,.55+math.cos(syne/idlesineinc)/25,0)*CFrame.Angles(math.rad(0),0,math.rad(-6)),.1)
			end
			
			if not stopanim3 then
				hed.Weld.C0=clerp(hed.Weld.C0,CFrame.new(0,1.5+math.cos(syne/idlesineinc)/50,0)*CFrame.Angles(math.cos(syne/idlesineinc)/40,0,0),.1)
			end
			
			lleg.Weld.C0=clerp(lleg.Weld.C0,CFrame.new(-.55,-1.9-math.cos(syne/idlesineinc)/20,(math.cos(syne/idlesineinc)/35))*CFrame.Angles(-(math.cos(syne/idlesineinc)/35),0,math.rad(-2.5)),.1)
			rleg.Weld.C0=clerp(rleg.Weld.C0,CFrame.new(.55,-1.9-math.cos(syne/idlesineinc)/20,(math.cos(syne/idlesineinc)/35))*CFrame.Angles(-(math.cos(syne/idlesineinc)/35),0,math.rad(2.5)),.1)
			rutprt.Weld.C0=clerp(rutprt.Weld.C0,CFrame.new(0,-.1+math.cos(syne/idlesineinc)/20,0)*CFrame.Angles(math.cos(syne/idlesineinc)/35+math.rad(0),math.rad(0),math.rad(0)),.1)
		end
		
		if anim=="Walking" and hum.WalkSpeed ~= 0 then
			if not stopanim then
				rarm.Weld.C0=clerp(rarm.Weld.C0,CFrame.new(1.5,.525+math.cos(syne/15)/25,0)*CFrame.Angles(math.cos(syne/6)/1.25,math.rad(5),-(math.cos(syne/6.75)/15)+math.rad(3)),.1)
			end
			
			if not stopanim2 then
				larm.Weld.C0=clerp(larm.Weld.C0,CFrame.new(-1.5,.525+math.cos(syne/15)/25,0)*CFrame.Angles(-(math.cos(syne/6)/1.25),0,-(math.cos(syne/6.75)/15)-math.rad(3)),.1)
			end
			
			if not stopanim3 then
				hed.Weld.C0=clerp(hed.Weld.C0,CFrame.new(0,1.5+math.cos(syne/20)/50,0)*CFrame.Angles(-math.cos(syne/3)/20,0,0),.1)
			end
			
			lleg.Weld.C0=clerp(lleg.Weld.C0,CFrame.new(-.55,-1.9-math.cos(syne/6)/10,-(math.cos(syne/6)/1.125))*CFrame.Angles(math.cos(syne/6)/1.125,0,math.rad(-2.5)),.1)
			rleg.Weld.C0=clerp(rleg.Weld.C0,CFrame.new(.55,-1.9-math.cos(syne/6)/10,math.cos(syne/6)/1.125)*CFrame.Angles(-(math.cos(syne/6)/1.125),0,math.rad(2.5)),.1)
			rutprt.Weld.C0=clerp(rutprt.Weld.C0,CFrame.new(0,-.1+math.cos(syne/3.375)/20,math.cos(syne/3)/5)*CFrame.Angles(math.cos(syne/3)/20+math.rad(-3.5),math.cos(syne/6)/10,-math.cos(syne/6)/30+math.sin(rutprt.RotVelocity.y/2)/7.5),.1)
		end
		
		if hum.WalkSpeed == 0 then
			if not stopanim then
				rarm.Weld.C0=clerp(rarm.Weld.C0,CFrame.new(1.5,.55+math.cos(syne/idlesineinc)/25,0)*CFrame.Angles(math.rad(1),math.rad(0),math.rad(6)),.1)
			end
			
			if not stopanim2 then
				larm.Weld.C0=clerp(larm.Weld.C0,CFrame.new(-1.5,.55+math.cos(syne/idlesineinc)/25,0)*CFrame.Angles(math.rad(0),0,math.rad(-6)),.1)
			end
			
			if not stopanim3 then
				hed.Weld.C0=clerp(hed.Weld.C0,CFrame.new(0,1.5+math.cos(syne/idlesineinc)/50,0)*CFrame.Angles(math.cos(syne/idlesineinc)/40,0,0),.1)
			end
			
			lleg.Weld.C0=clerp(lleg.Weld.C0,CFrame.new(-.55,-1.9-math.cos(syne/idlesineinc)/20,(math.cos(syne/idlesineinc)/35))*CFrame.Angles(-(math.cos(syne/idlesineinc)/35),0,math.rad(-2.5)),.1)
			rleg.Weld.C0=clerp(rleg.Weld.C0,CFrame.new(.55,-1.9-math.cos(syne/idlesineinc)/20,(math.cos(syne/idlesineinc)/35))*CFrame.Angles(-(math.cos(syne/idlesineinc)/35),0,math.rad(2.5)),.1)
			rutprt.Weld.C0=clerp(rutprt.Weld.C0,CFrame.new(0,-.1+math.cos(syne/idlesineinc)/20,0)*CFrame.Angles(math.cos(syne/idlesineinc)/35+math.rad(0),math.rad(0),math.rad(0)),.1)
		end
		
		if 1 < rutprt.Velocity.y and hum.FloorMaterial == Enum.Material.Air and hum.JumpPower ~= 0 then
			hed.Weld.C0=clerp(hed.Weld.C0,CFrame.new(0,1.5,-.3)*CFrame.Angles(math.rad(-40),0,0),.065)
			rarm.Weld.C0=clerp(rarm.Weld.C0,CFrame.new(1.5,.525,0)*CFrame.Angles(math.rad(10),0,math.rad(70)),.1)
			larm.Weld.C0=clerp(larm.Weld.C0,CFrame.new(-1.5,.525,0)*CFrame.Angles(math.rad(10),0,math.rad(-70)),.1)
			lleg.Weld.C0=clerp(lleg.Weld.C0,CFrame.new(-.55,-1.2,0)*CFrame.Angles(math.rad(-14),0,math.rad(-2.5)),.1)
			rleg.Weld.C0=clerp(rleg.Weld.C0,CFrame.new(.55,-1.9,0)*CFrame.Angles(math.rad(0),0,math.rad(2.5)),.1)
			rutprt.Weld.C0=clerp(rutprt.Weld.C0,CFrame.new(0,-.1+math.cos(syne/20)/20,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)),.1)
		elseif -1 > rutprt.Velocity.y and hum.FloorMaterial == Enum.Material.Air then
			hed.Weld.C0=clerp(hed.Weld.C0,CFrame.new(0,1.5,-.3)*CFrame.Angles(math.rad(-40),0,0),.065)	
			rarm.Weld.C0=clerp(rarm.Weld.C0,CFrame.new(1.5,.525,0)*CFrame.Angles(math.rad(10),0,math.rad(70)),.06)
			larm.Weld.C0=clerp(larm.Weld.C0,CFrame.new(-1.5,.525,0)*CFrame.Angles(math.rad(10),0,math.rad(-70)),.06)
			lleg.Weld.C0=clerp(lleg.Weld.C0,CFrame.new(-.55,-1.2,0)*CFrame.Angles(math.rad(-14),0,math.rad(-2.5)),.06)
			rleg.Weld.C0=clerp(rleg.Weld.C0,CFrame.new(.55,-1.9,0)*CFrame.Angles(math.rad(0),0,math.rad(2.5)),.06)
			rutprt.Weld.C0=clerp(rutprt.Weld.C0,CFrame.new(0,-.1+math.cos(syne/20)/20,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)),.06)
		end
	end)
end
