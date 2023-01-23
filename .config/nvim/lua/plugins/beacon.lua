local setup, beacon = pcall(require, "beacon")
if not setup then
  return
end

-- enable comment
beacon.setup()
