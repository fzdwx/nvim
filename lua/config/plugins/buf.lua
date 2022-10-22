local tok,buf = pcall(require,"bufferline")

if not tok then
    return
end

buf.setup()
