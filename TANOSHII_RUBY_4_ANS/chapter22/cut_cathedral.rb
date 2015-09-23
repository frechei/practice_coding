require 'cgi/util'
htmlfile = "cathedral.html"
textfile = "cathedral.txt"

html = File.read(htmlfile)

File.open(textfile, "w") do |f|
  in_header = true
  html.each_line do |line|
    if in_header && /<a name="1">/ !~ line
      next
    else
      in_header = false
    end
    line.gsub!(/<[^>]+>/, '')                 #去掉html标签
    esc_line = CGI.unescapeHTML(line)         #此方法可将HTML的&amp;、&lt;等转义字符转为普通字符&、<。
    f.write esc_line
    break if /<a name="version">/ =~ line
  end
end
