--#region ImGui

function ImGui.BeginColumns(columns)
    if ImGui.BeginTable("main", columns, ImGuiTableFlags.SizingStretchSame) then
        ImGui.TableNextRow()
        ImGui.TableSetColumnIndex(0)

        return true
    end

    return false
end

function ImGui.EndColumns()
    ImGui.EndTable()
end

function ImGui.DiscordButtonStyle()
    local btnColors        = { (114 / 255), (137 / 255), (218 / 255), (150 / 255) }
    local btnHoveredColors = { (114 / 255), (137 / 255), (218 / 255), (255 / 255) }
    local btnActiveColors  = { (114 / 255), (137 / 255), (218 / 255), (105 / 255) }

    ImGui.PushStyleColor(ImGuiCol.Button, U(btnColors))
    ImGui.PushStyleColor(ImGuiCol.ButtonHovered, U(btnHoveredColors))
    ImGui.PushStyleColor(ImGuiCol.ButtonActive, U(btnActiveColors))
end

function ImGui.RedButtonStyle()
    local btnColors        = { (183 / 255), (0 / 255), (0 / 255), (150 / 255) }
    local btnHoveredColors = { (183 / 255), (0 / 255), (0 / 255), (255 / 255) }
    local btnActiveColors  = { (183 / 255), (0 / 255), (0 / 255), (105 / 255) }

    ImGui.PushStyleColor(ImGuiCol.Button, U(btnColors))
    ImGui.PushStyleColor(ImGuiCol.ButtonHovered, U(btnHoveredColors))
    ImGui.PushStyleColor(ImGuiCol.ButtonActive, U(btnActiveColors))
end

function ImGui.ResetButtonStyle()
    ImGui.PopStyleColor(3)
end

function ImGui.RedFrameBgStyle()
    local frmBgColors        = { (70 / 255),  (0 / 255), (0 / 255), (255 / 255) }
    local frmBgHoveredColors = { (180 / 255), (0 / 255), (0 / 255), (50 / 255)  }
    local frmBgActiveColors  = { (180 / 255), (0 / 255), (0 / 255), (25 / 255)  }
    local checkMarkColors    = { (183 / 255), (0 / 255), (0 / 255), (255 / 255) }

    ImGui.PushStyleColor(ImGuiCol.FrameBg, U(frmBgColors))
    ImGui.PushStyleColor(ImGuiCol.FrameBgHovered, U(frmBgHoveredColors))
    ImGui.PushStyleColor(ImGuiCol.FrameBgActive, U(frmBgActiveColors))
    ImGui.PushStyleColor(ImGuiCol.CheckMark, U(checkMarkColors))
end

function ImGui.ResetFrameBgStyle()
    ImGui.PopStyleColor(4)
end

--#endregion
