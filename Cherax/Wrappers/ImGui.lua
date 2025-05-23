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

function ImGui.RedButtonStyle()
    ImGui.PushStyleColor(ImGuiCol.ButtonHovered, 130, 0, 0, 255)
end

function ImGui.ResetButtonStyle()
    ImGui.PopStyleColor()
end

--#endregion
