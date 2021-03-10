require 'sinatra'
require 'sinatra/activerecord'
set :bind, '0.0.0.0'

ActiveRecord::Base.establish_connection(
    :adapter=>'sqlite3',
    :database=>'wiki.db'
    )

class User<ActiveRecord::Base
    validates :username, presence:true, uniqueness:true
    validates :password, presence:true
end

$myinfo = "Alina Kvaratskheliia" # replace Firstname and Lastname with your name
@info = ""

def readFile(filename)
    info = ""
    file = File.open(filename)
    file.each do |line|
        info = info+line
    end
    file.close
    $myinfo=info
end

get '/'do
    info = "“Oh, hello there! I bet you’re wondering, why the red suit? 
                Well, that’s so bad guys can’t see me bleed!”"
    len=info.length
    len1 = len
    readFile("wiki.txt")
    @info = info + "" + $myinfo
    len = @info.length
    len2 = len - 1
    len3 = len2 - len1
    #@info = info + len3.to_s
    @words=len3.to_s
    erb :home
end

get '/about' do
    erb :about
end

get '/create' do
 erb :create
end

get'/edit'do
    info=""
    file = File.open("wiki.txt")
    file.each do |line|
        info = info+line
    end
    file.close
    @info = info
    '<h2>Edit article</h2><br>'+
    '<form action="/edit"method="post"id="edit">
        <input type="hidden" name="_method" value="put">
            <textarea rows="20" cols="90" name="message">'+@info+'</textarea>
            <input type="submit" value= "Update">
     </form>'+
     '<p><a href="..reset">Reset</a></p>'
end

put '/edit' do
    info = "#{params[:message]}"
    @info = info
    file = File.open("wiki.txt","w")
    file.puts @info
    file.close
    redirect '/'
end

get '/login' do
    erb :login
end

post '/login' do
    $credentials=[params[:username], params[:password]]
        @Users=User.where(:username=>$credentials[0]).to_a.first
    if @Users
        if @Users.password==$credentials[1]
            redirect'/'
        else
            $credentials=[","]
            redirect '/wrongaccount'
        end
    else
        $credentials=[","]
        redirect '/wrongaccount'
    end
end

get '/wrongaccount' do
    erb:wrongaccount
end
        
not_found do
    status 404
    redirect '/'
end
        