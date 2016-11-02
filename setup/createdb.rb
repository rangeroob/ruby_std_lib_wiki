require 'fileutils'
require 'sequel'

unless Dir.exist?('db')
FileUtils.mkdir 'db'
end
DB = Sequel.connect('sqlite://db/blog.db')

# create an items table
begin
DB.create_table :posts do
  primary_key :id
  String :title
  String :body
end
end
# create a dataset from the items table
   posts = DB[:posts]

# populate the table

posts.insert( :id => 1, :title => 'ARGUMENTERROR' , :body => "<p>Raised when the arguments are wrong and there isn't a more specific Exception class.</p>

<p>Ex: passing the wrong number of arguments</p>

<pre class='ruby'>[<span class='ruby-value'>1</span>, <span class='ruby-value'>2</span>, <span class='ruby-value'>3</span>].<span class='ruby-identifier'>first</span>(<span class='ruby-value'>4</span>, <span class='ruby-value'>5</span>)
</pre>

<p><em>raises the exception:</em></p>

<pre>ArgumentError: wrong number of arguments (given 2, expected 1)</pre>

<p>Ex: passing an argument that is not acceptable:</p>

<pre class='ruby'>[<span class='ruby-value'>1</span>, <span class='ruby-value'>2</span>, <span class='ruby-value'>3</span>].<span class='ruby-identifier'>first</span>(<span class='ruby-value'>-4</span>)
</pre>

<p><em>raises the exception:</em></p>

<pre>ArgumentError: negative array size</pre>

    </div>"

) 

 posts.insert( :id => 2, :title => 'ARRAY', :body => "")


