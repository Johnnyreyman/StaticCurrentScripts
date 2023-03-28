local printer = peripheral.find("printer")

if printer then
  local file = fs.open("ele_log.txt", "r")
  
  if file then
    local text = file.readAll()
    file.close()
    
    local strings = require "cc.strings"
    local width, height = printer.getPageSize()
    local wrappedLines = strings.wrap(text, width)
    
    -- print each page
    for i = 1, #wrappedLines, height do
      printer.newPage()
      
      for lineIndex = 1, height do
        local currentLine = wrappedLines[i + lineIndex - 1]
        printer.setCursorPos(1, lineIndex)
        printer.write(currentLine)
      end
      
      printer.endPage()
    end
    
    print("Printed previous log to printer")
  else
    print("Unable to open file 'ele_log.txt'")
  end
else
  print("Printer not found")
end

fs.delete("ele_log.txt")
print("Log file deleted successfully.")
