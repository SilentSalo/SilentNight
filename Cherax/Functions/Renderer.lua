--#region Renderer

Renderer = {}

function Renderer.RenderHeistTool()
    if ImGui.BeginTabItem("Heist Tool") then
        if ImGui.BeginTabBar("Heist Tabs") then
            if ImGui.BeginTabItem("Agency") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(eFeature.Heist.Agency.Preps.Contract)
                        ClickGUI.RenderFeature(eFeature.Heist.Agency.Preps.Complete)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Launch Control") then
                        Helper.RenderLaunchSettings(1, eFeature.Heist.CayoPerico.Launch.Reset)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Launch.Reset)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ImGui.PushButtonStyle(eBtnStyle.PINK)
                        ClickGUI.RenderFeature(eFeature.Heist.Agency.Misc.Teleport.Entrance)
                        ClickGUI.RenderFeature(eFeature.Heist.Agency.Misc.Teleport.Computer)
                        ClickGUI.RenderFeature(eFeature.Heist.Agency.Misc.Teleport.Mission)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cutscene)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Skip)
                        ClickGUI.RenderFeature(eFeature.Heist.Agency.Misc.Finish)
                        ClickGUI.RenderFeature(eFeature.Heist.Agency.Misc.Cooldown)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Payout") then
                        ClickGUI.RenderFeature(eFeature.Heist.Agency.Payout.Select)
                        ClickGUI.RenderFeature(eFeature.Heist.Agency.Payout.Max)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.Agency.Payout.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Apartment") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Preps.Complete)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Preps.Reload)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Preps.Change)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Presets") then
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Presets.File)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Presets.Load)
                        ImGui.SameLine()
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Presets.Remove)
                        ImGui.ResetButtonStyle()
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Presets.Refresh)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Presets.Name)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Presets.Save)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Presets.Copy)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Launch Control") then
                        local reqPlayers = eLocal.Heist.Generic.Launch.Step2:Get()
                        local isFleeca   = eStat.HEIST_MISSION_RCONT_ID_1:Get() == eTable.Heist.Apartment.Heists.FleecaJob

                        Helper.RenderLaunchSettings((isFleeca) and 2 or 4, eFeature.Heist.Apartment.Launch.Reset)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Launch.Solo)

                        if reqPlayers ~= 0 and reqPlayers ~= ((isFleeca) and 2 or 4) then
                            ImGui.SameLine()
                        end

                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Launch.Reset)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ImGui.PushButtonStyle(eBtnStyle.PINK)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.Teleport.Entrance)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.Teleport.Board)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cutscene)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Skip)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.Force)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.Finish)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.FleecaHack)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.FleecaDrill)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.PacificHack)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.Cooldown)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.Play)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Misc.Unlock)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Cuts") then
                        ImGui.PushFrameBgStyle(eFrameBgStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Bonus)
                        ImGui.ResetFrameBgStyle()
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Double)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Presets)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Player1.Toggle)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Player1.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Player2.Toggle)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Player2.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Player3.Toggle)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Player3.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Player4.Toggle)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Player4.Cut)
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Heist.Apartment.Cuts.Apply)
                        ImGui.ResetButtonStyle()
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Auto Shop") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Preps.Contract)
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Preps.Complete)
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Preps.Reset)
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Preps.Reload)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Launch Control") then
                        Helper.RenderLaunchSettings(1, eFeature.Heist.CayoPerico.Launch.Reset)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Launch.Reset)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ImGui.PushButtonStyle(eBtnStyle.PINK)
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Misc.Teleport.Entrance)
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Misc.Teleport.Board)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cutscene)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Skip)
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Misc.Finish)
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Misc.Cooldown)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Payout") then
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Payout.Select)
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Payout.Max)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.AutoShop.Payout.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Cayo Perico") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Difficulty)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Approach)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Loadout)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Primary)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Secondary.Compound)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Compound)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Arts)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Secondary.Island)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Island)
                        ImGui.PushFrameBgStyle(eFrameBgStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Advanced)
                        ImGui.ResetFrameBgStyle()

                        if FeatureMgr.GetFeatureBool(eFeature.Heist.CayoPerico.Preps.Advanced) then
                            ImGui.SameLine()
                        end

                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Default)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Cash)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Weed)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Coke)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Gold)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Arts)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Complete)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Reset)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Preps.Reload)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Presets") then
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Presets.File)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Presets.Load)
                        ImGui.SameLine()
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Presets.Remove)
                        ImGui.ResetButtonStyle()
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Presets.Refresh)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Presets.Name)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Presets.Save)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Presets.Copy)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Launch Control") then
                        Helper.RenderLaunchSettings(1, eFeature.Heist.CayoPerico.Launch.Reset)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Launch.Reset)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ImGui.PushButtonStyle(eBtnStyle.PINK)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.Teleport)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cutscene)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Skip)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.Force)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.Finish)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.FingerprintHack)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.PlasmaCutterCut)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.DrainagePipeCut)
                        ImGui.PushFrameBgStyle(eFrameBgStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.Bag)
                        ImGui.ResetFrameBgStyle()
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Solo)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Team)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Offline)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Online)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Cuts") then
                        ImGui.PushFrameBgStyle(eFrameBgStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Crew)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Presets)
                        ImGui.ResetFrameBgStyle()
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Player1.Toggle)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Player1.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Player2.Toggle)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Player2.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Player3.Toggle)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Player3.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Player4.Toggle)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Player4.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.CayoPerico.Cuts.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Non-Host") then
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Diamond Casino") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Difficulty)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Approach)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Gunman)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Loadout)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Driver)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Vehicles)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Hacker)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Masks)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Keycards)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Guards)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Target)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Complete)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Reset)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Preps.Reload)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Presets") then
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Presets.File)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Presets.Load)
                        ImGui.SameLine()
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Presets.Remove)
                        ImGui.ResetButtonStyle()
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Presets.Refresh)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Presets.Name)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Presets.Save)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Presets.Copy)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Launch Control") then
                        local reqPlayers = eLocal.Heist.Generic.Launch.Step2:Get()

                        Helper.RenderLaunchSettings(2, eFeature.Heist.DiamondCasino.Launch.Reset)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Launch.Solo)

                        if reqPlayers ~= 0 and reqPlayers ~= 2 then
                            ImGui.SameLine()
                        end

                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Launch.Reset)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.Setup)
                        ImGui.PushButtonStyle(eBtnStyle.PINK)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.Teleport.Entrance)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.Teleport.Board)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cutscene)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Skip)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.Force)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.Finish)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.FingerprintHack)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.KeypadHack)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.VaultDoorDrill)
                        ImGui.PushFrameBgStyle(eFrameBgStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.Autograbber)
                        ImGui.ResetFrameBgStyle()
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Misc.Cooldown)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Cuts") then
                        ImGui.PushFrameBgStyle(eFrameBgStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Crew)
                        ImGui.ResetFrameBgStyle()
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Presets)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Player1.Toggle)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Player1.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Player2.Toggle)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Player2.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Player3.Toggle)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Player3.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Player4.Toggle)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Player4.Cut)
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Heist.DiamondCasino.Cuts.Apply)
                        ImGui.ResetButtonStyle()
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Non-Host") then
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Doomsday") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Preps.Act)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Preps.Complete)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Preps.Reset)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Preps.Reload)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Presets") then
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Presets.File)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Presets.Load)
                        ImGui.SameLine()
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Presets.Remove)
                        ImGui.ResetButtonStyle()
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Presets.Refresh)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Presets.Name)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Presets.Save)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Presets.Copy)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Launch Control") then
                        local reqPlayers = eLocal.Heist.Generic.Launch.Step2:Get()

                        Helper.RenderLaunchSettings(2, eFeature.Heist.Doomsday.Launch.Reset)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Launch.Solo)

                        if reqPlayers ~= 0 and reqPlayers ~= 2 then
                            ImGui.SameLine()
                        end

                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Launch.Reset)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ImGui.PushButtonStyle(eBtnStyle.PINK)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Misc.Teleport.Entrance)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Misc.Teleport.Screen)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cutscene)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Skip)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Misc.Force)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Misc.Finish)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Misc.DataHack)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Misc.DoomsdayHack)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Cuts") then
                        ImGui.PushFrameBgStyle(eFrameBgStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Cuts.Presets)
                        ImGui.ResetFrameBgStyle()
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Cuts.Player1.Toggle)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Cuts.Player1.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Cuts.Player2.Toggle)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Cuts.Player2.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Cuts.Player3.Toggle)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Cuts.Player3.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Cuts.Player4.Toggle)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Cuts.Player4.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.Doomsday.Cuts.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Non-Host") then
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cut)
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Salvage Yard") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Slot 1") then
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot1.Available)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot1.Robbery)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot1.Vehicle)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot1.Modification)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot1.Keep)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot1.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Preps") then
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Preps.Apply)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Preps.Complete)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Preps.Reset)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Preps.Reload)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Preps.Free.Setup)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Preps.Free.Claim)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Slot 2") then
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot2.Available)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot2.Robbery)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot2.Vehicle)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot2.Modification)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot2.Keep)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot2.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ImGui.PushButtonStyle(eBtnStyle.PINK)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Misc.Teleport.Entrance)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Misc.Teleport.Board)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Heist.Generic.Cutscene)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Misc.Finish)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Misc.Sell)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Misc.Force)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Misc.Cooldown)

                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Slot 3") then
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot3.Available)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot3.Robbery)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot3.Vehicle)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot3.Modification)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot3.Keep)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Slot3.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Payout") then
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ImGui.PushFrameBgStyle(eFrameBgStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Payout.Salvage)
                        ImGui.ResetButtonStyle()
                        ImGui.ResetFrameBgStyle()
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Payout.Slot1)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Payout.Slot2)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Payout.Slot3)
                        ClickGUI.RenderFeature(eFeature.Heist.SalvageYard.Payout.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            ImGui.EndTabBar()
        end
        ImGui.EndTabItem()
    end
end

function Renderer.RenderBusinessTool()
    if ImGui.BeginTabItem("Business Tool") then
        if ImGui.BeginTabBar("Business Tabs") then
            if ImGui.BeginTabItem("Bunker") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Sale") then
                        ImGui.PushFrameBgStyle(eFrameBgStyle.RED)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Sale.Price)
                        ImGui.ResetFrameBgStyle()
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Sale.NoXp)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Sale.Sell)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ImGui.PushButtonStyle(eBtnStyle.PINK)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Misc.Teleport.Entrance)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Misc.Teleport.Laptop)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Misc.Open)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Misc.Supply)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Misc.Trigger)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Misc.Supplier)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Stats") then
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Stats.SellMade)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Stats.SellUndertaken)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Stats.Earnings)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Stats.NoSell)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Stats.NoEarnings)
                        ClickGUI.RenderFeature(eFeature.Business.Bunker.Stats.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Hangar Cargo") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Sale") then
                        ImGui.PushFrameBgStyle(eFrameBgStyle.RED)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Sale.Price)
                        ImGui.ResetFrameBgStyle()
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Sale.NoXp)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Sale.Sell)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ImGui.PushButtonStyle(eBtnStyle.PINK)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Misc.Teleport.Entrance)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Misc.Teleport.Laptop)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Misc.Open)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Misc.Supply)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Misc.Supplier)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Misc.Cooldown)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Stats") then
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.BuyMade)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.BuyUndertaken)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.SellMade)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.SellUndertaken)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.Earnings)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.NoBuy)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.NoSell)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.NoEarnings)
                        ClickGUI.RenderFeature(eFeature.Business.Hangar.Stats.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Money Fronts") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Hands On Car Wash") then
                        ImGui.PushButtonStyle(eBtnStyle.PINK)
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Teleport.Entrance)
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Teleport.Laptop)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Heat.Lock)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Heat.Max)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Heat.Min)
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Heat.Select)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Overall Heat") then
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.OverallHeat.Lock)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.OverallHeat.Max)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.OverallHeat.Min)
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.OverallHeat.Select)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Smoke On The Water") then
                        ImGui.PushButtonStyle(eBtnStyle.PINK)
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Teleport.Entrance)
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Teleport.Laptop)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Heat.Lock)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Heat.Max)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Heat.Min)
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Heat.Select)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Higgins Helitours") then
                        ImGui.PushButtonStyle(eBtnStyle.PINK)
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Teleport.Entrance)
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Teleport.Laptop)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Heat.Lock)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Heat.Max)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Heat.Min)
                        ClickGUI.RenderFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Heat.Select)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Nightclub") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Sale") then
                        ImGui.PushFrameBgStyle(eFrameBgStyle.RED)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Sale.Price)
                        ImGui.ResetFrameBgStyle()
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Safe") then
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Safe.Fill)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Safe.Collect)
                        ImGui.ResetButtonStyle()
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Safe.Unbrick)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Misc.Setup)
                        ImGui.PushButtonStyle(eBtnStyle.PINK)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Misc.Teleport.Entrance)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Misc.Teleport.Computer)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Misc.Open)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Misc.Cooldown)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Popularity") then
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Popularity.Lock)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Popularity.Max)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Popularity.Min)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Popularity.Select)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Stats") then
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Stats.SellMade)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Stats.Earnings)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Stats.NoSell)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Stats.NoEarnings)
                        ClickGUI.RenderFeature(eFeature.Business.Nightclub.Stats.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Special Cargo") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Sale") then
                        ImGui.PushFrameBgStyle(eFrameBgStyle.RED)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Sale.Price)
                        ImGui.ResetFrameBgStyle()
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Sale.NoXp)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Sale.NoCrateback)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Sale.Sell)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ImGui.PushButtonStyle(eBtnStyle.PINK)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Misc.Teleport.Office)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Misc.Teleport.Computer)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Misc.Teleport.Warehouse)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Misc.Supply)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Misc.Select)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Misc.Max)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Misc.Buy)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Misc.Supplier)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Misc.Cooldown)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Stats") then
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.BuyMade)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.BuyUndertaken)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.SellMade)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.SellUndertaken)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.Earnings)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.NoBuy)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.NoSell)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.NoEarnings)
                        ClickGUI.RenderFeature(eFeature.Business.CrateWarehouse.Stats.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Misc") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Supplies") then
                        ClickGUI.RenderFeature(eFeature.Business.Misc.Supplies.Business)
                        ClickGUI.RenderFeature(eFeature.Business.Misc.Supplies.Resupply)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Business.Misc.Supplies.Refresh)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Garment Factory") then
                        ImGui.PushButtonStyle(eBtnStyle.PINK)
                        ClickGUI.RenderFeature(eFeature.Business.Misc.Garment.Teleport.Entrance)
                        ClickGUI.RenderFeature(eFeature.Business.Misc.Garment.Teleport.Computer)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Business.Misc.Garment.Unbrick)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            ImGui.EndTabBar()
        end
        ImGui.EndTabItem()
    end
end

function Renderer.RenderMoneyTool()
    if ImGui.BeginTabItem("Money Tool") then
        if ImGui.BeginTabBar("Money Tabs") then
            if ImGui.BeginTabItem("Casino") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Lucky Wheel") then
                        ClickGUI.RenderFeature(eFeature.Money.Casino.LuckyWheel.Select)
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.LuckyWheel.Give)
                        ImGui.ResetButtonStyle()
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Blackjack") then
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Blackjack.Card)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Blackjack.Reveal)
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Blackjack.Trick)
                        ImGui.ResetButtonStyle()
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Slot Machines") then
                        ImGui.PushButtonStyle(eBtnStyle.RED)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Slots.Win)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Slots.Lose)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Poker") then
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Poker.MyCards)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Poker.Cards)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Poker.Reveal)
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Poker.Give)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Poker.Trick)
                        ImGui.ResetButtonStyle()
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Roulette") then
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Roulette.Land13)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Roulette.Land16)
                        ImGui.ResetButtonStyle()
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Misc") then
                        ImGui.PushFrameBgStyle(eFrameBgStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Misc.Bypass)
                        ImGui.ResetFrameBgStyle()
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Misc.Limit.Select)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Misc.Limit.Acquire)
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Money.Casino.Misc.Limit.Trade)
                        ImGui.ResetButtonStyle()
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Easy Money") then
                if ImGui.BeginColumns(1) then
                    if ClickGUI.BeginCustomChildWindow("Acknowledgment") then
                        local r, g, b, a = U(eBtnStyle.RED.Hovered)
                        ImGui.TextColored(1, 1, 1, 1, "Please, make sure to read all feature descriptions carefully before using them!")
                        ImGui.TextColored(1, 1, 1, 1, "Remember, any form of feature misuse or abuse can lead to a ban!")
                        ImGui.TextColored(r, g, b, a, "Use these features responsibly and at your own risk!")
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Acknowledge)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end

                if ImGui.BeginColumns(2) then
                    if ClickGUI.BeginCustomChildWindow("Freeroam") then
                        ImGui.PushFrameBgStyle(eFrameBgStyle.RED)
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Freeroam._5k)
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Freeroam._50k)
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Freeroam._100k)
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Freeroam._180k)
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Freeroam._680k)
                        ImGui.ResetFrameBgStyle()
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Property") then
                        ImGui.PushFrameBgStyle(eFrameBgStyle.RED)
                        ClickGUI.RenderFeature(eFeature.Money.EasyMoney.Property._300k)
                        ImGui.ResetFrameBgStyle()
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("Misc") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Edit") then
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Edit.DepositAll)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Edit.WithdrawAll)
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Edit.Select)
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Edit.Deposit)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Edit.Withdraw)
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Edit.Remove)
                        ImGui.ResetButtonStyle()
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Story") then
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Story.Select)
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Story.Character)
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Story.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Stats") then
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Stats.Select)
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Stats.Earned)
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Stats.Spent)
                        ClickGUI.RenderFeature(eFeature.Money.Misc.Stats.Apply)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            ImGui.EndTabBar()
        end
        ImGui.EndTabItem()
    end
end

function Renderer.RenderDevTool()
    if ImGui.BeginTabItem("Dev Tool") then
        if ImGui.BeginTabBar("Dev Tabs") then
            if ImGui.BeginTabItem("Editor") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Globals") then
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Globals.Type)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Globals.Global)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Globals.Value)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Globals.Read)
                        ImGui.SameLine()
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Globals.Write)
                        ImGui.ResetButtonStyle()
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Globals.Revert)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Packed Stats") then
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.PackedStats.Range)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.PackedStats.Type)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.PackedStats.PackedStat)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.PackedStats.Value)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.PackedStats.Read)

                        if FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Read):IsVisible() then
                            ImGui.SameLine()
                        end

                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.PackedStats.Write)
                        ImGui.ResetButtonStyle()

                        if FeatureMgr.GetFeature(eFeature.Dev.Editor.PackedStats.Write):GetName() == "Write" then
                            ImGui.SameLine()
                        end

                        ClickGUI.RenderFeature(eFeature.Dev.Editor.PackedStats.Revert)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Locals") then
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Locals.Type)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Locals.Script)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Locals.Local)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Locals.Value)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Locals.Read)
                        ImGui.SameLine()
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Locals.Write)
                        ImGui.ResetButtonStyle()
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Locals.Revert)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Stats") then
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.From)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Type)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Stat)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Value)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Read)

                        if FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Read):IsVisible() then
                            ImGui.SameLine()
                        end

                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Write)
                        ImGui.ResetButtonStyle()

                        if FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Write):IsVisible() then
                            ImGui.SameLine()
                        end

                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Revert)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.File)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.WriteAll)

                        if FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.WriteAll):IsVisible() then
                            ImGui.SameLine()
                        end

                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Remove)
                        ImGui.ResetButtonStyle()

                        if FeatureMgr.GetFeature(eFeature.Dev.Editor.Stats.Remove):IsVisible() then
                            ImGui.SameLine()
                        end

                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Refresh)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Copy)
                        ClickGUI.RenderFeature(eFeature.Dev.Editor.Stats.Generate)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            ImGui.EndTabBar()
        end
        ImGui.EndTabItem()
    end
end

function Renderer.RenderSettings()
    if ImGui.BeginTabItem("Settings") then
        if ImGui.BeginTabBar("Settings Tabs") then
            if ImGui.BeginTabItem("Configuration") then
                if ImGui.BeginColumns(3) then
                    if ClickGUI.BeginCustomChildWindow("Config & Discord") then
                        ClickGUI.RenderFeature(eFeature.Settings.Config.Open)
                        ClickGUI.RenderFeature(eFeature.Settings.Config.Logging)
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Settings.Config.Reset)
                        ImGui.ResetButtonStyle()
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Settings.Config.Copy)
                        ImGui.PushButtonStyle(eBtnStyle.DISCORD)
                        ClickGUI.RenderFeature(eFeature.Settings.Config.Discord)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Settings.Config.Unload)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Translation") then
                        ClickGUI.RenderFeature(eFeature.Settings.Translation.File)
                        ClickGUI.RenderFeature(eFeature.Settings.Translation.Load)
                        ImGui.SameLine()
                        ImGui.PushButtonStyle(eBtnStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Settings.Translation.Remove)
                        ImGui.ResetButtonStyle()
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Settings.Translation.Refresh)
                        ClickGUI.RenderFeature(eFeature.Settings.Translation.Export)
                        ImGui.SameLine()
                        ClickGUI.RenderFeature(eFeature.Settings.Translation.Copy)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Collabs") then
                        ClickGUI.RenderFeature(eFeature.Settings.Collab.JinxScript.Toggle)
                        ImGui.SameLine()
                        ImGui.PushButtonStyle(eBtnStyle.DISCORD)
                        ClickGUI.RenderFeature(eFeature.Settings.Collab.JinxScript.Discord)
                        ImGui.ResetButtonStyle()
                        ClickGUI.RenderFeature(eFeature.Settings.Collab.JinxScript.Stop)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Instant Finish") then
                        ClickGUI.RenderFeature(eFeature.Settings.InstantFinish.Agency)
                        ClickGUI.RenderFeature(eFeature.Settings.InstantFinish.Apartment)
                        ClickGUI.RenderFeature(eFeature.Settings.InstantFinish.AutoShop)
                        ClickGUI.RenderFeature(eFeature.Settings.InstantFinish.CayoPerico)
                        ClickGUI.RenderFeature(eFeature.Settings.InstantFinish.DiamondCasino)
                        ClickGUI.RenderFeature(eFeature.Settings.InstantFinish.Doomsday)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Unlock All POI") then
                        ClickGUI.RenderFeature(eFeature.Settings.UnlockAllPoi.CayoPerico)
                        ClickGUI.RenderFeature(eFeature.Settings.UnlockAllPoi.DiamondCasino)
                        ClickGUI.EndCustomChildWindow()
                    end

                    if ClickGUI.BeginCustomChildWindow("Register As Boss") then
                        ImGui.PushFrameBgStyle(eFrameBgStyle.ORANGE)
                        ClickGUI.RenderFeature(eFeature.Settings.RegisterAsBoss.AutoRegister)
                        ImGui.ResetFrameBgStyle()
                        ClickGUI.RenderFeature(eFeature.Settings.RegisterAsBoss.Type)
                        ClickGUI.EndCustomChildWindow()
                    end

                    ImGui.TableNextColumn()

                    if ClickGUI.BeginCustomChildWindow("Easy Money") then
                        ClickGUI.RenderFeature(eFeature.Settings.EasyMoney.AutoDeposit)
                        ClickGUI.RenderFeature(eFeature.Settings.EasyMoney.Allow300k)
                        ImGui.PushFrameBgStyle(eFrameBgStyle.GREEN)
                        ClickGUI.RenderFeature(eFeature.Settings.EasyMoney.Prevention)
                        ImGui.ResetFrameBgStyle()
                        ClickGUI.RenderFeature(eFeature.Settings.EasyMoney.Delay._5k)
                        ClickGUI.RenderFeature(eFeature.Settings.EasyMoney.Delay._50k)
                        ClickGUI.RenderFeature(eFeature.Settings.EasyMoney.Delay._100k)
                        ClickGUI.RenderFeature(eFeature.Settings.EasyMoney.Delay._180k)
                        ClickGUI.RenderFeature(eFeature.Settings.EasyMoney.Delay._300k)
                        ClickGUI.RenderFeature(eFeature.Settings.EasyMoney.Delay._680k)
                        ClickGUI.EndCustomChildWindow()
                    end
                    ImGui.EndColumns()
                end
                ImGui.EndTabItem()
            end
            ImGui.EndTabBar()
        end
        ImGui.EndTabItem()
    end
end

function Renderer.RenderClickGUI()
    if ImGui.BeginTabBar(SCRIPT_NAME) then
        Renderer.RenderHeistTool()
        Renderer.RenderBusinessTool()
        Renderer.RenderMoneyTool()
        Renderer.RenderDevTool()
        Renderer.RenderSettings()
        ImGui.EndTabBar()
    end
end

ClickGUI.AddTab(F("%s v%s %s", SCRIPT_NAME, SCRIPT_VER, GTA_EDITION), Renderer.RenderClickGUI)

function Renderer.RenderListGUI()
    local root = ListGUI.GetRootTab()
    if not root then return end

    local SilentNightTab = root:AddSubTab(F("%s v%s %s", SCRIPT_NAME, SCRIPT_VER, GTA_EDITION), SCRIPT_NAME)

    local HeistToolTab = SilentNightTab:AddSubTab("Heist Tool", "Heist Tool")
    if HeistToolTab then
        local AgencyTab = HeistToolTab:AddSubTab("Agency", "Agency")
        if AgencyTab then
            local prepsTab = AgencyTab:AddSubTab("Preps", "Preps")

            prepsTab:AddFeature(eFeature.Heist.Agency.Preps.Contract)
            prepsTab:AddFeature(eFeature.Heist.Agency.Preps.Complete)

            local MiscTab = AgencyTab:AddSubTab("Misc", "Misc")
            MiscTab:AddFeature(eFeature.Heist.Agency.Misc.Teleport.Entrance)
            MiscTab:AddFeature(eFeature.Heist.Agency.Misc.Teleport.Computer)
            MiscTab:AddFeature(eFeature.Heist.Agency.Misc.Teleport.Mission)
            MiscTab:AddFeature(eFeature.Heist.Generic.Cutscene)
            MiscTab:AddFeature(eFeature.Heist.Generic.Skip)
            MiscTab:AddFeature(eFeature.Heist.Agency.Misc.Finish)
            MiscTab:AddFeature(eFeature.Heist.Agency.Misc.Cooldown)

            local payoutTab = AgencyTab:AddSubTab("Payouts", "Payouts")
            payoutTab:AddFeature(eFeature.Heist.Agency.Payout.Select)
            payoutTab:AddFeature(eFeature.Heist.Agency.Payout.Max)
            payoutTab:AddFeature(eFeature.Heist.Agency.Payout.Apply)
        end

        local ApartmentTab = HeistToolTab:AddSubTab("Apartment", "Apartment")
        if ApartmentTab then
            local PrepsSubTab = ApartmentTab:AddSubTab("Preps", "Preps")
            PrepsSubTab:AddFeature(eFeature.Heist.Apartment.Preps.Complete)
            PrepsSubTab:AddFeature(eFeature.Heist.Apartment.Preps.Reload)
            PrepsSubTab:AddFeature(eFeature.Heist.Apartment.Preps.Change)

            local PresetsSubTab = ApartmentTab:AddSubTab("Presets", "Presets")
            PresetsSubTab:AddFeature(eFeature.Heist.Apartment.Presets.File)
            PresetsSubTab:AddFeature(eFeature.Heist.Apartment.Presets.Load)
            PresetsSubTab:AddFeature(eFeature.Heist.Apartment.Presets.Remove)
            PresetsSubTab:AddFeature(eFeature.Heist.Apartment.Presets.Refresh)
            PresetsSubTab:AddFeature(eFeature.Heist.Apartment.Presets.Name)
            PresetsSubTab:AddFeature(eFeature.Heist.Apartment.Presets.Save)
            PresetsSubTab:AddFeature(eFeature.Heist.Apartment.Presets.Copy)

            local LaunchSubTab = ApartmentTab:AddSubTab("Launch Control", "Launch Control")
            LaunchSubTab:AddFeature(eFeature.Heist.Apartment.Launch.Solo)
            LaunchSubTab:AddFeature(eFeature.Heist.Apartment.Launch.Reset)

            local MiscSubTab = ApartmentTab:AddSubTab("Misc", "Misc")
            MiscSubTab:AddFeature(eFeature.Heist.Apartment.Misc.Teleport.Entrance)
            MiscSubTab:AddFeature(eFeature.Heist.Apartment.Misc.Teleport.Board)
            MiscSubTab:AddFeature(eFeature.Heist.Generic.Cutscene)
            MiscSubTab:AddFeature(eFeature.Heist.Generic.Skip)
            MiscSubTab:AddFeature(eFeature.Heist.Apartment.Misc.Force)
            MiscSubTab:AddFeature(eFeature.Heist.Apartment.Misc.Finish)
            MiscSubTab:AddFeature(eFeature.Heist.Apartment.Misc.FleecaHack)
            MiscSubTab:AddFeature(eFeature.Heist.Apartment.Misc.FleecaDrill)
            MiscSubTab:AddFeature(eFeature.Heist.Apartment.Misc.PacificHack)
            MiscSubTab:AddFeature(eFeature.Heist.Apartment.Misc.Cooldown)
            MiscSubTab:AddFeature(eFeature.Heist.Apartment.Misc.Play)
            MiscSubTab:AddFeature(eFeature.Heist.Apartment.Misc.Unlock)

            local CutsSubTab = ApartmentTab:AddSubTab("Cuts", "Cuts")
            CutsSubTab:AddFeature(eFeature.Heist.Apartment.Cuts.Bonus)
            CutsSubTab:AddFeature(eFeature.Heist.Apartment.Cuts.Double)
            CutsSubTab:AddFeature(eFeature.Heist.Apartment.Cuts.Presets)
            CutsSubTab:AddFeature(eFeature.Heist.Apartment.Cuts.Player1.Toggle)
            CutsSubTab:AddFeature(eFeature.Heist.Apartment.Cuts.Player1.Cut)
            CutsSubTab:AddFeature(eFeature.Heist.Apartment.Cuts.Player2.Toggle)
            CutsSubTab:AddFeature(eFeature.Heist.Apartment.Cuts.Player2.Cut)
            CutsSubTab:AddFeature(eFeature.Heist.Apartment.Cuts.Player3.Toggle)
            CutsSubTab:AddFeature(eFeature.Heist.Apartment.Cuts.Player3.Cut)
            CutsSubTab:AddFeature(eFeature.Heist.Apartment.Cuts.Player4.Toggle)
            CutsSubTab:AddFeature(eFeature.Heist.Apartment.Cuts.Player4.Cut)
            CutsSubTab:AddFeature(eFeature.Heist.Apartment.Cuts.Apply)
        end

        local AutoShopTab = HeistToolTab:AddSubTab("Auto Shop", "Auto Shop")
        if AutoShopTab then
            local PrepsSubTab = AutoShopTab:AddSubTab("Preps", "Preps")
            PrepsSubTab:AddFeature(eFeature.Heist.AutoShop.Preps.Contract)
            PrepsSubTab:AddFeature(eFeature.Heist.AutoShop.Preps.Complete)
            PrepsSubTab:AddFeature(eFeature.Heist.AutoShop.Preps.Reset)
            PrepsSubTab:AddFeature(eFeature.Heist.AutoShop.Preps.Reload)

            local MiscSubTab = AutoShopTab:AddSubTab("Misc", "Misc")
            MiscSubTab:AddFeature(eFeature.Heist.AutoShop.Misc.Teleport.Entrance)
            MiscSubTab:AddFeature(eFeature.Heist.AutoShop.Misc.Teleport.Board)
            MiscSubTab:AddFeature(eFeature.Heist.Generic.Cutscene)
            MiscSubTab:AddFeature(eFeature.Heist.Generic.Skip)
            MiscSubTab:AddFeature(eFeature.Heist.AutoShop.Misc.Finish)
            MiscSubTab:AddFeature(eFeature.Heist.AutoShop.Misc.Cooldown)

            local PayoutSubTab = AutoShopTab:AddSubTab("Payout", "Payout")
            PayoutSubTab:AddFeature(eFeature.Heist.AutoShop.Payout.Select)
            PayoutSubTab:AddFeature(eFeature.Heist.AutoShop.Payout.Max)
            PayoutSubTab:AddFeature(eFeature.Heist.AutoShop.Payout.Apply)
        end

        local CayoPericoTab = HeistToolTab:AddSubTab("Cayo Perico", "Cayo Perico")
        if CayoPericoTab then
            local PrepsSubTab = CayoPericoTab:AddSubTab("Preps", "Preps")
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Difficulty)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Approach)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Loadout)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Primary)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Secondary.Compound)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Compound)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Arts)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Secondary.Island)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Amount.Island)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Advanced)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Default)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Cash)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Weed)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Coke)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Gold)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Target.Value.Arts)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Complete)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Reset)
            PrepsSubTab:AddFeature(eFeature.Heist.CayoPerico.Preps.Reload)

            local PresetsSubTab = CayoPericoTab:AddSubTab("Presets", "Presets")
            PresetsSubTab:AddFeature(eFeature.Heist.CayoPerico.Presets.File)
            PresetsSubTab:AddFeature(eFeature.Heist.CayoPerico.Presets.Load)
            PresetsSubTab:AddFeature(eFeature.Heist.CayoPerico.Presets.Remove)
            PresetsSubTab:AddFeature(eFeature.Heist.CayoPerico.Presets.Refresh)
            PresetsSubTab:AddFeature(eFeature.Heist.CayoPerico.Presets.Name)
            PresetsSubTab:AddFeature(eFeature.Heist.CayoPerico.Presets.Save)
            PresetsSubTab:AddFeature(eFeature.Heist.CayoPerico.Presets.Copy)

            local LaunchSubTab = ApartmentTab:AddSubTab("Launch Control", "Launch Control")
            LaunchSubTab:AddFeature(eFeature.Heist.CayoPerico.Launch.Reset)

            local MiscSubTab = CayoPericoTab:AddSubTab("Misc", "Misc")
            MiscSubTab:AddFeature(eFeature.Heist.CayoPerico.Misc.Teleport)
            MiscSubTab:AddFeature(eFeature.Heist.Generic.Cutscene)
            MiscSubTab:AddFeature(eFeature.Heist.Generic.Skip)
            MiscSubTab:AddFeature(eFeature.Heist.CayoPerico.Misc.Force)
            MiscSubTab:AddFeature(eFeature.Heist.CayoPerico.Misc.Finish)
            MiscSubTab:AddFeature(eFeature.Heist.CayoPerico.Misc.FingerprintHack)
            MiscSubTab:AddFeature(eFeature.Heist.CayoPerico.Misc.PlasmaCutterCut)
            MiscSubTab:AddFeature(eFeature.Heist.CayoPerico.Misc.DrainagePipeCut)
            MiscSubTab:AddFeature(eFeature.Heist.CayoPerico.Misc.Bag)
            MiscSubTab:AddFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Solo)
            MiscSubTab:AddFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Team)
            MiscSubTab:AddFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Offline)
            MiscSubTab:AddFeature(eFeature.Heist.CayoPerico.Misc.Cooldown.Online)

            local CutsSubTab = CayoPericoTab:AddSubTab("Cuts", "Cuts")
            CutsSubTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Crew)
            CutsSubTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Presets)
            CutsSubTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Player1.Toggle)
            CutsSubTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Player1.Cut)
            CutsSubTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Player2.Toggle)
            CutsSubTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Player2.Cut)
            CutsSubTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Player3.Toggle)
            CutsSubTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Player3.Cut)
            CutsSubTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Player4.Toggle)
            CutsSubTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Player4.Cut)
            CutsSubTab:AddFeature(eFeature.Heist.CayoPerico.Cuts.Apply)

            local NonHostTab = CayoPericoTab:AddSubTab("Non-Host", "Non-Host")
            NonHostTab:AddFeature(eFeature.Heist.Generic.Cut)
            NonHostTab:AddFeature(eFeature.Heist.Generic.Apply)
        end

        local CasinoHeistTab = HeistToolTab:AddSubTab("Diamond Casino", "Diamond Casino")
        if CasinoHeistTab then
            local PrepsSubTab = CasinoHeistTab:AddSubTab("Preps", "Preps")
            PrepsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Difficulty)
            PrepsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Approach)
            PrepsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Gunman)
            PrepsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Loadout)
            PrepsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Driver)
            PrepsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Vehicles)
            PrepsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Hacker)
            PrepsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Masks)
            PrepsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Target)
            PrepsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Complete)
            PrepsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Reset)
            PrepsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Preps.Reload)

            local PresetsSubTab = CasinoHeistTab:AddSubTab("Presets", "Presets")
            PresetsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Presets.File)
            PresetsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Presets.Load)
            PresetsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Presets.Remove)
            PresetsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Presets.Refresh)
            PresetsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Presets.Name)
            PresetsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Presets.Save)
            PresetsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Presets.Copy)

            local LaunchSubTab = ApartmentTab:AddSubTab("Launch Control", "Launch Control")
            LaunchSubTab:AddFeature(eFeature.Heist.DiamondCasino.Launch.Solo)
            LaunchSubTab:AddFeature(eFeature.Heist.DiamondCasino.Launch.Reset)

            local MiscSubTab = CasinoHeistTab:AddSubTab("Misc", "Misc")
            MiscSubTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.Setup)
            MiscSubTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.Teleport.Entrance)
            MiscSubTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.Teleport.Board)
            MiscSubTab:AddFeature(eFeature.Heist.Generic.Cutscene)
            MiscSubTab:AddFeature(eFeature.Heist.Generic.Skip)
            MiscSubTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.Force)
            MiscSubTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.Finish)
            MiscSubTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.FingerprintHack)
            MiscSubTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.KeypadHack)
            MiscSubTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.VaultDoorDrill)
            MiscSubTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.Autograbber)
            MiscSubTab:AddFeature(eFeature.Heist.DiamondCasino.Misc.Cooldown)

            local CutsSubTab = CasinoHeistTab:AddSubTab("Cuts", "Cuts")
            CutsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Crew)
            CutsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Presets)
            CutsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Player1.Toggle)
            CutsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Player1.Cut)
            CutsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Player2.Toggle)
            CutsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Player2.Cut)
            CutsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Player3.Toggle)
            CutsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Player3.Cut)
            CutsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Player4.Toggle)
            CutsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Player4.Cut)
            CutsSubTab:AddFeature(eFeature.Heist.DiamondCasino.Cuts.Apply)

            local NonHostTab = CasinoHeistTab:AddSubTab("Non-Host", "Non-Host")
            NonHostTab:AddFeature(eFeature.Heist.Generic.Cut)
            NonHostTab:AddFeature(eFeature.Heist.Generic.Apply)
        end

        local DoomsdayTab = HeistToolTab:AddSubTab("Doomsday", "Doomsday")
        if DoomsdayTab then
            local PrepsSubTab = DoomsdayTab:AddSubTab("Preps", "Preps")
            PrepsSubTab:AddFeature(eFeature.Heist.Doomsday.Preps.Act)
            PrepsSubTab:AddFeature(eFeature.Heist.Doomsday.Preps.Complete)
            PrepsSubTab:AddFeature(eFeature.Heist.Doomsday.Preps.Reset)
            PrepsSubTab:AddFeature(eFeature.Heist.Doomsday.Preps.Reload)

            local PresetsSubTab = DoomsdayTab:AddSubTab("Presets", "Presets")
            PresetsSubTab:AddFeature(eFeature.Heist.Doomsday.Presets.File)
            PresetsSubTab:AddFeature(eFeature.Heist.Doomsday.Presets.Load)
            PresetsSubTab:AddFeature(eFeature.Heist.Doomsday.Presets.Remove)
            PresetsSubTab:AddFeature(eFeature.Heist.Doomsday.Presets.Refresh)
            PresetsSubTab:AddFeature(eFeature.Heist.Doomsday.Presets.Name)
            PresetsSubTab:AddFeature(eFeature.Heist.Doomsday.Presets.Save)
            PresetsSubTab:AddFeature(eFeature.Heist.Doomsday.Presets.Copy)

            local LaunchSubTab = ApartmentTab:AddSubTab("Launch Control", "Launch Control")
            LaunchSubTab:AddFeature(eFeature.Heist.Doomsday.Launch.Solo)
            LaunchSubTab:AddFeature(eFeature.Heist.Doomsday.Launch.Reset)

            local MiscSubTab = DoomsdayTab:AddSubTab("Misc", "Misc")
            MiscSubTab:AddFeature(eFeature.Heist.Doomsday.Misc.Teleport.Entrance)
            MiscSubTab:AddFeature(eFeature.Heist.Doomsday.Misc.Teleport.Screen)
            MiscSubTab:AddFeature(eFeature.Heist.Generic.Cutscene)
            MiscSubTab:AddFeature(eFeature.Heist.Generic.Skip)
            MiscSubTab:AddFeature(eFeature.Heist.Doomsday.Misc.Force)
            MiscSubTab:AddFeature(eFeature.Heist.Doomsday.Misc.Finish)
            MiscSubTab:AddFeature(eFeature.Heist.Doomsday.Misc.DataHack)
            MiscSubTab:AddFeature(eFeature.Heist.Doomsday.Misc.DoomsdayHack)

            local CutsSubTab = DoomsdayTab:AddSubTab("Cuts", "Cuts")
            CutsSubTab:AddFeature(eFeature.Heist.Doomsday.Cuts.Presets)
            CutsSubTab:AddFeature(eFeature.Heist.Doomsday.Cuts.Player1.Toggle)
            CutsSubTab:AddFeature(eFeature.Heist.Doomsday.Cuts.Player1.Cut)
            CutsSubTab:AddFeature(eFeature.Heist.Doomsday.Cuts.Player2.Toggle)
            CutsSubTab:AddFeature(eFeature.Heist.Doomsday.Cuts.Player2.Cut)
            CutsSubTab:AddFeature(eFeature.Heist.Doomsday.Cuts.Player3.Toggle)
            CutsSubTab:AddFeature(eFeature.Heist.Doomsday.Cuts.Player3.Cut)
            CutsSubTab:AddFeature(eFeature.Heist.Doomsday.Cuts.Player4.Toggle)
            CutsSubTab:AddFeature(eFeature.Heist.Doomsday.Cuts.Player4.Cut)
            CutsSubTab:AddFeature(eFeature.Heist.Doomsday.Cuts.Apply)

            local NonHostTab = DoomsdayTab:AddSubTab("Non-Host", "Non-Host")
            NonHostTab:AddFeature(eFeature.Heist.Generic.Cut)
            NonHostTab:AddFeature(eFeature.Heist.Generic.Apply)
        end

        local SalvageYardTab = HeistToolTab:AddSubTab("Salvage Yard", "Salvage Yard")
        if SalvageYardTab then
            local Slot1SubTab = SalvageYardTab:AddSubTab("Slot 1", "Slot 1")
            Slot1SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot1.Available)
            Slot1SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot1.Robbery)
            Slot1SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot1.Vehicle)
            Slot1SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot1.Modification)
            Slot1SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot1.Keep)
            Slot1SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot1.Apply)

            local Slot2SubTab = SalvageYardTab:AddSubTab("Slot 2", "Slot 2")
            Slot2SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot2.Available)
            Slot2SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot2.Robbery)
            Slot2SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot2.Vehicle)
            Slot2SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot2.Modification)
            Slot2SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot2.Keep)
            Slot2SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot2.Apply)

            local Slot3SubTab = SalvageYardTab:AddSubTab("Slot 3", "Slot 3")
            Slot3SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot3.Available)
            Slot3SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot3.Robbery)
            Slot3SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot3.Vehicle)
            Slot3SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot3.Modification)
            Slot3SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot3.Keep)
            Slot3SubTab:AddFeature(eFeature.Heist.SalvageYard.Slot3.Apply)

            local PrepsSubTab = SalvageYardTab:AddSubTab("Preps", "Preps")
            PrepsSubTab:AddFeature(eFeature.Heist.SalvageYard.Preps.Apply)
            PrepsSubTab:AddFeature(eFeature.Heist.SalvageYard.Preps.Complete)
            PrepsSubTab:AddFeature(eFeature.Heist.SalvageYard.Preps.Reset)
            PrepsSubTab:AddFeature(eFeature.Heist.SalvageYard.Preps.Reload)
            PrepsSubTab:AddFeature(eFeature.Heist.SalvageYard.Preps.Free.Setup)
            PrepsSubTab:AddFeature(eFeature.Heist.SalvageYard.Preps.Free.Claim)

            local MiscSubTab = SalvageYardTab:AddSubTab("Misc", "Misc")
            MiscSubTab:AddFeature(eFeature.Heist.SalvageYard.Misc.Teleport.Entrance)
            MiscSubTab:AddFeature(eFeature.Heist.SalvageYard.Misc.Teleport.Board)
            MiscSubTab:AddFeature(eFeature.Heist.Generic.Cutscene)
            MiscSubTab:AddFeature(eFeature.Heist.SalvageYard.Misc.Finish)
            MiscSubTab:AddFeature(eFeature.Heist.SalvageYard.Misc.Sell)
            MiscSubTab:AddFeature(eFeature.Heist.SalvageYard.Misc.Force)
            MiscSubTab:AddFeature(eFeature.Heist.SalvageYard.Misc.Cooldown)

            local PayoutSubTab = SalvageYardTab:AddSubTab("Payout", "Payout")
            PayoutSubTab:AddFeature(eFeature.Heist.SalvageYard.Payout.Salvage)
            PayoutSubTab:AddFeature(eFeature.Heist.SalvageYard.Payout.Slot1)
            PayoutSubTab:AddFeature(eFeature.Heist.SalvageYard.Payout.Slot2)
            PayoutSubTab:AddFeature(eFeature.Heist.SalvageYard.Payout.Slot3)
            PayoutSubTab:AddFeature(eFeature.Heist.SalvageYard.Payout.Apply)
        end
    end

    local BusinessToolTab = SilentNightTab:AddSubTab("Business Tool", "Business Tool")
    if BusinessToolTab then
        local BunkerTab = BusinessToolTab:AddSubTab("Bunker", "Bunker")
        if BunkerTab then
            local SaleSubTab = BunkerTab:AddSubTab("Sale", "Sale")
            SaleSubTab:AddFeature(eFeature.Business.Bunker.Sale.Price)
            SaleSubTab:AddFeature(eFeature.Business.Bunker.Sale.NoXp)
            SaleSubTab:AddFeature(eFeature.Business.Bunker.Sale.Sell)

            local MiscSubTab = BunkerTab:AddSubTab("Misc", "Misc")
            MiscSubTab:AddFeature(eFeature.Business.Bunker.Misc.Teleport.Entrance)
            MiscSubTab:AddFeature(eFeature.Business.Bunker.Misc.Teleport.Laptop)
            MiscSubTab:AddFeature(eFeature.Business.Bunker.Misc.Open)
            MiscSubTab:AddFeature(eFeature.Business.Bunker.Misc.Supply)
            MiscSubTab:AddFeature(eFeature.Business.Bunker.Misc.Trigger)
            MiscSubTab:AddFeature(eFeature.Business.Bunker.Misc.Supplier)

            local StatsSubTab = BunkerTab:AddSubTab("Stats", "Stats")
            StatsSubTab:AddFeature(eFeature.Business.Bunker.Stats.SellMade)
            StatsSubTab:AddFeature(eFeature.Business.Bunker.Stats.SellUndertaken)
            StatsSubTab:AddFeature(eFeature.Business.Bunker.Stats.Earnings)
            StatsSubTab:AddFeature(eFeature.Business.Bunker.Stats.NoSell)
            StatsSubTab:AddFeature(eFeature.Business.Bunker.Stats.NoEarnings)
            StatsSubTab:AddFeature(eFeature.Business.Bunker.Stats.Apply)
        end

        local HangarCargoTab = BusinessToolTab:AddSubTab("Hangar Cargo", "Hangar Cargo")
        if HangarCargoTab then
            local SaleSubTab = HangarCargoTab:AddSubTab("Sale", "Sale")
            SaleSubTab:AddFeature(eFeature.Business.Hangar.Sale.Price)
            SaleSubTab:AddFeature(eFeature.Business.Hangar.Sale.NoXp)
            SaleSubTab:AddFeature(eFeature.Business.Hangar.Sale.Sell)

            local MiscSubTab = HangarCargoTab:AddSubTab("Misc", "Misc")
            MiscSubTab:AddFeature(eFeature.Business.Hangar.Misc.Teleport.Entrance)
            MiscSubTab:AddFeature(eFeature.Business.Hangar.Misc.Teleport.Laptop)
            MiscSubTab:AddFeature(eFeature.Business.Hangar.Misc.Open)
            MiscSubTab:AddFeature(eFeature.Business.Hangar.Misc.Supply)
            MiscSubTab:AddFeature(eFeature.Business.Hangar.Misc.Supplier)
            MiscSubTab:AddFeature(eFeature.Business.Hangar.Misc.Cooldown)

            local StatsSubTab = HangarCargoTab:AddSubTab("Stats", "Stats")
            StatsSubTab:AddFeature(eFeature.Business.Hangar.Stats.BuyMade)
            StatsSubTab:AddFeature(eFeature.Business.Hangar.Stats.BuyUndertaken)
            StatsSubTab:AddFeature(eFeature.Business.Hangar.Stats.SellMade)
            StatsSubTab:AddFeature(eFeature.Business.Hangar.Stats.SellUndertaken)
            StatsSubTab:AddFeature(eFeature.Business.Hangar.Stats.Earnings)
            StatsSubTab:AddFeature(eFeature.Business.Hangar.Stats.NoBuy)
            StatsSubTab:AddFeature(eFeature.Business.Hangar.Stats.NoSell)
            StatsSubTab:AddFeature(eFeature.Business.Hangar.Stats.NoEarnings)
            StatsSubTab:AddFeature(eFeature.Business.Hangar.Stats.Apply)
        end

        local MoneyFrontsTab = BusinessToolTab:AddSubTab("Money Fronts", "Money Fronts")
        if MoneyFrontsTab then
            local CarWashTab = MoneyFrontsTab:AddSubTab("Hands On Car Wash")
            CarWashTab:AddFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Teleport.Entrance)
            CarWashTab:AddFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Teleport.Laptop)
            CarWashTab:AddFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Heat.Lock)
            CarWashTab:AddFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Heat.Max)
            CarWashTab:AddFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Heat.Min)
            CarWashTab:AddFeature(eFeature.Business.MoneyFronts.HandsOnCarWash.Heat.Select)

            local WeedShopTab = MoneyFrontsTab:AddSubTab("Smoke On The Water")
            WeedShopTab:AddFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Teleport.Entrance)
            WeedShopTab:AddFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Teleport.Laptop)
            WeedShopTab:AddFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Heat.Lock)
            WeedShopTab:AddFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Heat.Max)
            WeedShopTab:AddFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Heat.Min)
            WeedShopTab:AddFeature(eFeature.Business.MoneyFronts.SmokeOnTheWater.Heat.Select)

            local TourCompanyTab = MoneyFrontsTab:AddSubTab("Higgins Helitours")
            TourCompanyTab:AddFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Teleport.Entrance)
            TourCompanyTab:AddFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Teleport.Laptop)
            TourCompanyTab:AddFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Heat.Lock)
            TourCompanyTab:AddFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Heat.Max)
            TourCompanyTab:AddFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Heat.Min)
            TourCompanyTab:AddFeature(eFeature.Business.MoneyFronts.HigginsHelitours.Heat.Select)

            local OverallHeatTab = MoneyFrontsTab:AddSubTab("Overall Heat")
            OverallHeatTab:AddFeature(eFeature.Business.MoneyFronts.OverallHeat.Lock)
            OverallHeatTab:AddFeature(eFeature.Business.MoneyFronts.OverallHeat.Max)
            OverallHeatTab:AddFeature(eFeature.Business.MoneyFronts.OverallHeat.Min)
            OverallHeatTab:AddFeature(eFeature.Business.MoneyFronts.OverallHeat.Select)
        end

        local NightclubTab = BusinessToolTab:AddSubTab("Nightclub", "Nightclub")
        if NightclubTab then
            local SaleSubTab = NightclubTab:AddSubTab("Sale", "Sale")
            SaleSubTab:AddFeature(eFeature.Business.Nightclub.Sale.Price)

            local SafeSubTab = NightclubTab:AddSubTab("Safe", "Safe")
            SafeSubTab:AddFeature(eFeature.Business.Nightclub.Safe.Fill)
            SafeSubTab:AddFeature(eFeature.Business.Nightclub.Safe.Collect)
            SafeSubTab:AddFeature(eFeature.Business.Nightclub.Safe.Unbrick)

            local MiscSubTab = NightclubTab:AddSubTab("Misc", "Misc")
            MiscSubTab:AddFeature(eFeature.Business.Nightclub.Misc.Setup)
            MiscSubTab:AddFeature(eFeature.Business.Nightclub.Misc.Teleport.Entrance)
            MiscSubTab:AddFeature(eFeature.Business.Nightclub.Misc.Teleport.Computer)
            MiscSubTab:AddFeature(eFeature.Business.Nightclub.Misc.Open)
            MiscSubTab:AddFeature(eFeature.Business.Nightclub.Misc.Cooldown)

            local PopularitySubTab = NightclubTab:AddSubTab("Popularity", "Popularity")
            PopularitySubTab:AddFeature(eFeature.Business.Nightclub.Popularity.Lock)
            PopularitySubTab:AddFeature(eFeature.Business.Nightclub.Popularity.Max)
            PopularitySubTab:AddFeature(eFeature.Business.Nightclub.Popularity.Min)
            PopularitySubTab:AddFeature(eFeature.Business.Nightclub.Popularity.Select)

            local StatsSubTab = NightclubTab:AddSubTab("Stats", "Stats")
            StatsSubTab:AddFeature(eFeature.Business.Nightclub.Stats.SellMade)
            StatsSubTab:AddFeature(eFeature.Business.Nightclub.Stats.Earnings)
            StatsSubTab:AddFeature(eFeature.Business.Nightclub.Stats.NoSell)
            StatsSubTab:AddFeature(eFeature.Business.Nightclub.Stats.NoEarnings)
            StatsSubTab:AddFeature(eFeature.Business.Nightclub.Stats.Apply)
        end

        local SpecialCargoTab = BusinessToolTab:AddSubTab("Special Cargo", "Special Cargo")
        if SpecialCargoTab then
            local SaleSubTab = SpecialCargoTab:AddSubTab("Sale", "Sale")
            SaleSubTab:AddFeature(eFeature.Business.CrateWarehouse.Sale.Price)
            SaleSubTab:AddFeature(eFeature.Business.CrateWarehouse.Sale.NoXp)
            SaleSubTab:AddFeature(eFeature.Business.CrateWarehouse.Sale.NoCrateback)
            SaleSubTab:AddFeature(eFeature.Business.CrateWarehouse.Sale.Sell)

            local MiscSubTab = SpecialCargoTab:AddSubTab("Misc", "Misc")
            MiscSubTab:AddFeature(eFeature.Business.CrateWarehouse.Misc.Teleport.Office)
            MiscSubTab:AddFeature(eFeature.Business.CrateWarehouse.Misc.Teleport.Computer)
            MiscSubTab:AddFeature(eFeature.Business.CrateWarehouse.Misc.Teleport.Warehouse)
            MiscSubTab:AddFeature(eFeature.Business.CrateWarehouse.Misc.Supply)
            MiscSubTab:AddFeature(eFeature.Business.CrateWarehouse.Misc.Select)
            MiscSubTab:AddFeature(eFeature.Business.CrateWarehouse.Misc.Max)
            MiscSubTab:AddFeature(eFeature.Business.CrateWarehouse.Misc.Buy)
            MiscSubTab:AddFeature(eFeature.Business.CrateWarehouse.Misc.Supplier)
            MiscSubTab:AddFeature(eFeature.Business.CrateWarehouse.Misc.Cooldown)

            local StatsSubTab = SpecialCargoTab:AddSubTab("Stats", "Stats")
            StatsSubTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.BuyMade)
            StatsSubTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.BuyUndertaken)
            StatsSubTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.SellMade)
            StatsSubTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.SellUndertaken)
            StatsSubTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.Earnings)
            StatsSubTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.NoBuy)
            StatsSubTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.NoSell)
            StatsSubTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.NoEarnings)
            StatsSubTab:AddFeature(eFeature.Business.CrateWarehouse.Stats.Apply)
        end

        local MiscTab = BusinessToolTab:AddSubTab("Misc", "Misc")
        if MiscTab then
            local SuppliesSubTab = MiscTab:AddSubTab("Supplies", "Supplies")
            SuppliesSubTab:AddFeature(eFeature.Business.Misc.Supplies.Business)
            SuppliesSubTab:AddFeature(eFeature.Business.Misc.Supplies.Resupply)
            SuppliesSubTab:AddFeature(eFeature.Business.Misc.Supplies.Refresh)

            local GarmentSubTab = MiscTab:AddSubTab("Garment Factory", "Garment Factory")
            GarmentSubTab:AddFeature(eFeature.Business.Misc.Garment.Teleport.Entrance)
            GarmentSubTab:AddFeature(eFeature.Business.Misc.Garment.Teleport.Computer)
            GarmentSubTab:AddFeature(eFeature.Business.Misc.Garment.Unbrick)
        end
    end

    local MoneyToolTab = SilentNightTab:AddSubTab("Money Tool", "Money Tool")
    if MoneyToolTab then
        local CasinoTab = MoneyToolTab:AddSubTab("Casino", "Casino")
        if CasinoTab then
            local LuckyWheelSubTab = CasinoTab:AddSubTab("Lucky Wheel", "Lucky Wheel")
            LuckyWheelSubTab:AddFeature(eFeature.Money.Casino.LuckyWheel.Select)
            LuckyWheelSubTab:AddFeature(eFeature.Money.Casino.LuckyWheel.Give)

            local BlackjackSubTab = CasinoTab:AddSubTab("Blackjack", "Blackjack")
            BlackjackSubTab:AddFeature(eFeature.Money.Casino.Blackjack.Card)
            BlackjackSubTab:AddFeature(eFeature.Money.Casino.Blackjack.Reveal)
            BlackjackSubTab:AddFeature(eFeature.Money.Casino.Blackjack.Trick)

            local SlotMachinesSubTab = CasinoTab:AddSubTab("Slot Machines", "Slot Machines")
            SlotMachinesSubTab:AddFeature(eFeature.Money.Casino.Slots.Win)
            SlotMachinesSubTab:AddFeature(eFeature.Money.Casino.Slots.Lose)

            local PokerSubTab = CasinoTab:AddSubTab("Poker", "Poker")
            PokerSubTab:AddFeature(eFeature.Money.Casino.Poker.MyCards)
            PokerSubTab:AddFeature(eFeature.Money.Casino.Poker.Cards)
            PokerSubTab:AddFeature(eFeature.Money.Casino.Poker.Reveal)
            PokerSubTab:AddFeature(eFeature.Money.Casino.Poker.Give)
            PokerSubTab:AddFeature(eFeature.Money.Casino.Poker.Trick)

            local RouletteSubTab = CasinoTab:AddSubTab("Roulette", "Roulette")
            RouletteSubTab:AddFeature(eFeature.Money.Casino.Roulette.Land13)
            RouletteSubTab:AddFeature(eFeature.Money.Casino.Roulette.Land16)

            local MiscSubTab = CasinoTab:AddSubTab("Misc", "Misc")
            MiscSubTab:AddFeature(eFeature.Money.Casino.Misc.Bypass)
            MiscSubTab:AddFeature(eFeature.Money.Casino.Misc.Limit.Select)
            MiscSubTab:AddFeature(eFeature.Money.Casino.Misc.Limit.Acquire)
            MiscSubTab:AddFeature(eFeature.Money.Casino.Misc.Limit.Trade)
        end

        local EasyMoneyTab = MoneyToolTab:AddSubTab("Easy Money", "Easy Money")
        if EasyMoneyTab then
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Acknowledge)
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Freeroam._5k)
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Freeroam._50k)
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Freeroam._100k)
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Freeroam._180k)
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Freeroam._680k)
            EasyMoneyTab:AddFeature(eFeature.Money.EasyMoney.Property._300k)
        end

        local MiscTab = MoneyToolTab:AddSubTab("Misc", "Misc")
        if MiscTab then
            local EditSubTab = MiscTab:AddSubTab("Edit", "Edit")
            EditSubTab:AddFeature(eFeature.Money.Misc.Edit.Select)
            EditSubTab:AddFeature(eFeature.Money.Misc.Edit.Deposit)
            EditSubTab:AddFeature(eFeature.Money.Misc.Edit.Withdraw)
            EditSubTab:AddFeature(eFeature.Money.Misc.Edit.Remove)
            EditSubTab:AddFeature(eFeature.Money.Misc.Edit.DepositAll)
            EditSubTab:AddFeature(eFeature.Money.Misc.Edit.WithdrawAll)

            local StorySubTab = MiscTab:AddSubTab("Story", "Story")
            StorySubTab:AddFeature(eFeature.Money.Misc.Story.Select)
            StorySubTab:AddFeature(eFeature.Money.Misc.Story.Character)
            StorySubTab:AddFeature(eFeature.Money.Misc.Story.Apply)

            local StatsSubTab = MiscTab:AddSubTab("Stats", "Stats")
            StatsSubTab:AddFeature(eFeature.Money.Misc.Stats.Select)
            StatsSubTab:AddFeature(eFeature.Money.Misc.Stats.Earned)
            StatsSubTab:AddFeature(eFeature.Money.Misc.Stats.Spent)
            StatsSubTab:AddFeature(eFeature.Money.Misc.Stats.Apply)
        end
    end

    local DevToolTab = SilentNightTab:AddSubTab("Dev Tool", "Dev Tool")
    if DevToolTab then
        local EditorTab = DevToolTab:AddSubTab("Editor", "Editor")
        if EditorTab then
            local GlobalsSubTab = EditorTab:AddSubTab("Globals", "Globals")
            GlobalsSubTab:AddFeature(eFeature.Dev.Editor.Globals.Type)
            GlobalsSubTab:AddFeature(eFeature.Dev.Editor.Globals.Global)
            GlobalsSubTab:AddFeature(eFeature.Dev.Editor.Globals.Value)
            GlobalsSubTab:AddFeature(eFeature.Dev.Editor.Globals.Read)
            GlobalsSubTab:AddFeature(eFeature.Dev.Editor.Globals.Write)
            GlobalsSubTab:AddFeature(eFeature.Dev.Editor.Globals.Revert)

            local LocalsSubTab = EditorTab:AddSubTab("Locals", "Locals")
            LocalsSubTab:AddFeature(eFeature.Dev.Editor.Locals.Type)
            LocalsSubTab:AddFeature(eFeature.Dev.Editor.Locals.Script)
            LocalsSubTab:AddFeature(eFeature.Dev.Editor.Locals.Local)
            LocalsSubTab:AddFeature(eFeature.Dev.Editor.Locals.Value)
            LocalsSubTab:AddFeature(eFeature.Dev.Editor.Locals.Read)
            LocalsSubTab:AddFeature(eFeature.Dev.Editor.Locals.Write)
            LocalsSubTab:AddFeature(eFeature.Dev.Editor.Locals.Revert)

            local StatsSubTab = EditorTab:AddSubTab("Stats", "Stats")
            StatsSubTab:AddFeature(eFeature.Dev.Editor.Stats.From)
            StatsSubTab:AddFeature(eFeature.Dev.Editor.Stats.Type)
            StatsSubTab:AddFeature(eFeature.Dev.Editor.Stats.Stat)
            StatsSubTab:AddFeature(eFeature.Dev.Editor.Stats.Value)
            StatsSubTab:AddFeature(eFeature.Dev.Editor.Stats.Read)
            StatsSubTab:AddFeature(eFeature.Dev.Editor.Stats.Write)
            StatsSubTab:AddFeature(eFeature.Dev.Editor.Stats.Revert)
            StatsSubTab:AddFeature(eFeature.Dev.Editor.Stats.File)
            StatsSubTab:AddFeature(eFeature.Dev.Editor.Stats.WriteAll)
            StatsSubTab:AddFeature(eFeature.Dev.Editor.Stats.Remove)
            StatsSubTab:AddFeature(eFeature.Dev.Editor.Stats.Refresh)
            StatsSubTab:AddFeature(eFeature.Dev.Editor.Stats.Copy)
            StatsSubTab:AddFeature(eFeature.Dev.Editor.Stats.Generate)

            local PackedStatsSubTab = EditorTab:AddSubTab("Packed Stats", "Packed Stats")
            PackedStatsSubTab:AddFeature(eFeature.Dev.Editor.PackedStats.Range)
            PackedStatsSubTab:AddFeature(eFeature.Dev.Editor.PackedStats.Type)
            PackedStatsSubTab:AddFeature(eFeature.Dev.Editor.PackedStats.PackedStat)
            PackedStatsSubTab:AddFeature(eFeature.Dev.Editor.PackedStats.Value)
            PackedStatsSubTab:AddFeature(eFeature.Dev.Editor.PackedStats.Read)
            PackedStatsSubTab:AddFeature(eFeature.Dev.Editor.PackedStats.Write)
            PackedStatsSubTab:AddFeature(eFeature.Dev.Editor.PackedStats.Revert)
        end
    end

    local SettingsTab = SilentNightTab:AddSubTab("Settings", "Settings")
    if SettingsTab then
        local ConfigSubTab = SettingsTab:AddSubTab("Config & Discord", "Config & Discord")
        ConfigSubTab:AddFeature(eFeature.Settings.Config.Open)
        ConfigSubTab:AddFeature(eFeature.Settings.Config.Logging)
        ConfigSubTab:AddFeature(eFeature.Settings.Config.Reset)
        ConfigSubTab:AddFeature(eFeature.Settings.Config.Copy)
        ConfigSubTab:AddFeature(eFeature.Settings.Config.Discord)
        ConfigSubTab:AddFeature(eFeature.Settings.Config.Unload)

        local TranslationSubTab = SettingsTab:AddSubTab("Translation", "Translation")
        TranslationSubTab:AddFeature(eFeature.Settings.Translation.File)
        TranslationSubTab:AddFeature(eFeature.Settings.Translation.Load)
        TranslationSubTab:AddFeature(eFeature.Settings.Translation.Remove)
        TranslationSubTab:AddFeature(eFeature.Settings.Translation.Refresh)
        TranslationSubTab:AddFeature(eFeature.Settings.Translation.Export)
        TranslationSubTab:AddFeature(eFeature.Settings.Translation.Copy)

        local CollabsSubTab = SettingsTab:AddSubTab("Collabs", "Collabs")
        CollabsSubTab:AddFeature(eFeature.Settings.Collab.JinxScript.Toggle)
        CollabsSubTab:AddFeature(eFeature.Settings.Collab.JinxScript.Discord)
        CollabsSubTab:AddFeature(eFeature.Settings.Collab.JinxScript.Stop)

        local UnlockAllPOISubTab = SettingsTab:AddSubTab("Unlock All POI", "Unlock All POI")
        UnlockAllPOISubTab:AddFeature(eFeature.Settings.UnlockAllPoi.CayoPerico)
        UnlockAllPOISubTab:AddFeature(eFeature.Settings.UnlockAllPoi.DiamondCasino)

        local InstantFinishSubTab = SettingsTab:AddSubTab("Instant Finish", "Instant Finish")
        InstantFinishSubTab:AddFeature(eFeature.Settings.InstantFinish.Agency)
        InstantFinishSubTab:AddFeature(eFeature.Settings.InstantFinish.Apartment)
        InstantFinishSubTab:AddFeature(eFeature.Settings.InstantFinish.AutoShop)
        InstantFinishSubTab:AddFeature(eFeature.Settings.InstantFinish.CayoPerico)
        InstantFinishSubTab:AddFeature(eFeature.Settings.InstantFinish.DiamondCasino)
        InstantFinishSubTab:AddFeature(eFeature.Settings.InstantFinish.Doomsday)

        local RegisterAsBossSubTab = SettingsTab:AddSubTab("Register As Boss", "Register As Boss")
        RegisterAsBossSubTab:AddFeature(eFeature.Settings.RegisterAsBoss.AutoRegister)
        RegisterAsBossSubTab:AddFeature(eFeature.Settings.RegisterAsBoss.Type)

        local EasyMoneySubTab = SettingsTab:AddSubTab("Easy Money", "Easy Money")
        EasyMoneySubTab:AddFeature(eFeature.Settings.EasyMoney.AutoDeposit)
        EasyMoneySubTab:AddFeature(eFeature.Settings.EasyMoney.Allow300k)
        EasyMoneySubTab:AddFeature(eFeature.Settings.EasyMoney.Prevention)
        EasyMoneySubTab:AddFeature(eFeature.Settings.EasyMoney.Delay._5k)
        EasyMoneySubTab:AddFeature(eFeature.Settings.EasyMoney.Delay._50k)
        EasyMoneySubTab:AddFeature(eFeature.Settings.EasyMoney.Delay._100k)
        EasyMoneySubTab:AddFeature(eFeature.Settings.EasyMoney.Delay._180k)
        EasyMoneySubTab:AddFeature(eFeature.Settings.EasyMoney.Delay._680k)
        EasyMoneySubTab:AddFeature(eFeature.Settings.EasyMoney.Delay._300k)
    end
end

Renderer.RenderListGUI()

--#endregion
