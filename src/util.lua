local util = {}

function util.update(target, source)
  for k,v in pairs(source) do
    target[k] = v
  end
end

function util.map(func, array)
  local new_array = {}
  for i,v in ipairs(array) do
    new_array[i] = func(v)
  end
  return new_array
end

function util.range(from, to, step)
  local t = {}
  step = step or 1

	for value = from, to, step do
		t[#t + 1] = value
	end

	return t
end

function util.concat(t1, t2)
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end


return util
