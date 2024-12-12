print("Day 2")

do
    print(" > Safe Reports")
        -- A report is safe when it meets the following contiditions 
        -- 1. All numbers in the report are with ascending or descending
        -- 2. The difference between each sibling number is 0 > 4
    local lines = {}
    local ascending_reports = {}
    local descending_reports = {}
    local unsafe_reports = {}
    local safe_reports = {}
    local unsafe_count = 0
    local safe_count = 0
    local file = io.open("reports.txt", "r")
    assert(file ~= nil, "file was nil")

    for l in file:lines() do
        local reports = {}
        for s in string.gmatch(l, "%S+") do
            table.insert(reports, tonumber(s))
        end
        table.insert(lines, reports)
    end
    io.close(file)

    -- check for single element lines
    for index, value in ipairs(lines) do
        if #value < 2 then
            print("only one elements found")
            safe_reports["line_"..tostring(value)] = value
        end
    end

    -- check for lines with only two elements
    for index, value in ipairs(lines) do
        if #value == 2 and math.abs(value[1] - value[2]) >= 1  and math.abs(value[1] - value[2]) <= 3 then
            print("only two elements found")
            safe_reports["line_"..tostring(value)] = value
        end
    end

    -- ascending_reports
    for line, report in ipairs(lines) do
        for index, value in ipairs(report) do
            if index == #report then
                table.insert(ascending_reports, report)
                unsafe_reports["line_"..tostring(report)] = ""
                break
            end
            if value > report[index + 1] then
                unsafe_reports["line_"..tostring(report)] = report
                break
            end
        end
    end
    -- descending_reports
    for line, report in ipairs(lines) do
        for index, value in ipairs(report) do
            if index == #report then
                table.insert(descending_reports, report)
                unsafe_reports["line_"..tostring(report)] = ""
                break
            end
            if value < report[index + 1] then
                unsafe_reports["line_"..tostring(report)] = report
                break
            end
        end
    end

    -- safe ascending_reports
    for index, value in ipairs(ascending_reports) do
        for i, report in ipairs(value) do
            if i == #value then
                safe_reports["line_"..tostring(value)] = value
                unsafe_reports["line_"..tostring(value)] = ""
                break
            end
            local differnce = value[i + 1] - report
            if differnce == 0 then
                unsafe_reports["line_"..tostring(value)] = value
                break
            end
            if differnce > 4 then
                unsafe_reports["line_"..tostring(value)] = value
                break
            end
        end
    end

    -- safe descending_reports
    for index, value in ipairs(ascending_reports) do
        for i, report in ipairs(value) do
            if i == #value then
                safe_reports["line_"..tostring(value)] = value
                unsafe_reports["line_"..tostring(value)] = ""
                break
            end
            local differnce =  report - value[i + 1]
            if differnce == 0 then
                unsafe_reports["line_"..tostring(value)] = value
                break
            end
            if differnce > 4 then
                unsafe_reports["line_"..tostring(value)] = value
                break
            end
        end
    end

    for key, value in pairs(unsafe_reports) do
        if value ~= "" then
            -- print("unsfe for line: ".. key)
            unsafe_count = unsafe_count + 1
        end
    end
    for key, value in pairs(safe_reports) do
        if value ~= "" then
            -- print("unsfe for line: ".. key)
            safe_count = safe_count + 1
        end
    end

    print("Total reports found: " .. #lines)
    print("Total asceding reports found: " .. #ascending_reports)
    print("Total desceding reports found: " .. #descending_reports)
    print("Total unsafe reports found: " .. unsafe_count)
    print("Total safe reports found: " .. safe_count)
end
