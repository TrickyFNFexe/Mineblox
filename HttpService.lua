local http = {}
print("Module HTTP has been loaded!")
print("MBHV ON TOP")
function http.request(params)
	local url = params.url
	local method = params.method or "GET"
	local headers = params.headers or {}
	local body = params.body or ""

	local response = game:GetService("HttpService"):RequestAsync({
		Url = url,
		Method = method,
		Headers = headers,
		Body = body
	})
	return response
end

return http
