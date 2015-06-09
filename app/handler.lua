-- Check request method
if ngx.req.get_method() ~= "POST" then
    ngx.status = ngx.HTTP_NOT_ALLOWED
    ngx.say("Method not allowed")
    return
end

-- Get form data
local args, err = ngx.req.get_post_args()
if not args or (args.email == nil) then
    ngx.status = ngx.HTTP_BAD_REQUEST
    ngx.say("Bad request")
    return
end

-- Prepare mail body
local body = string.format("New message from: %s\nCompany: %s\nEmail: %s\n\nMessage:\n%s",
                           args.name, args.company, args.email, args.message)

-- Send mail
local smtp = require("resty.smtp")

from = ngx.var.mail_from
to = {ngx.var.mail_to}

mesgt = {
    headers = {
        to = to[1],
        from = from,
        subject = ngx.var.mail_subject
    },
    body = body
}

source = smtp.message(mesgt)
res, error = smtp.send{
    from = from,
    rcpt = to,
    source = source,
    user = ngx.var.smtp_user,
    password = ngx.var.smtp_password,
    server = ngx.var.smtp_server,
    port = ngx.var.smtp_port
}
ngx.header["Content-Type"] = "text/plain;charset=utf-8"
if res then
    ngx.say("Success!")
else
    ngx.status = ngx.HTTP_INTERNAL_SERVER_ERROR
    ngx.say("Error while send mail")
    ngx.say(error)
end