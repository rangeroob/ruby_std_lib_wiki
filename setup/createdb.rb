require 'fileutils'
require 'sequel'

unless Dir.exist?('db')
FileUtils.mkdir 'db'
end
DB = Sequel.connect('sqlite://db/ruby.db')

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

 posts.insert( :id => 2, :title => 'ARRAY', :body => "<div id='description' class='description'>
      
<p>Arrays are ordered, integer-indexed collections of any object.</p>

<p><a href='Array.html'>Array</a> indexing starts at 0, as in C or Java.  A
negative index is assumed to be relative to the end of the array---that is,
an index of -1 indicates the last element of the array, -2 is the next to
last element in the array, and so on.</p>

<h2 id='class-Array-label-Creating+Arrays'>Creating Arrays<span><a href='#class-Array-label-Creating+Arrays'>&para;</a> <a href='#top'>&uarr;</a></span></h2>

<p>A new array can be created by using the literal constructor
<code>[]</code>.  Arrays can contain different types of objects.  For
example, the array below contains an <a href='Integer.html'>Integer</a>, a
<a href='String.html'>String</a> and a Float:</p>

<pre class='ruby'><span class='ruby-identifier'>ary</span> = [<span class='ruby-value'>1</span>, <span class='ruby-string'>&quot;two&quot;</span>, <span class='ruby-value'>3.0</span>] <span class='ruby-comment'>#=&gt; [1, &quot;two&quot;, 3.0]</span>
</pre>

<p>An array can also be created by explicitly calling <a
href='Array.html#method-c-new'>::new</a> with zero, one (the initial size
of the <a href='Array.html'>Array</a>) or two arguments (the initial size
and a default object).</p>

<pre class='ruby'><span class='ruby-identifier'>ary</span> = <span class='ruby-constant'>Array</span>.<span class='ruby-identifier'>new</span>    <span class='ruby-comment'>#=&gt; []</span>
<span class='ruby-constant'>Array</span>.<span class='ruby-identifier'>new</span>(<span class='ruby-value'>3</span>)       <span class='ruby-comment'>#=&gt; [nil, nil, nil]</span>
<span class='ruby-constant'>Array</span>.<span class='ruby-identifier'>new</span>(<span class='ruby-value'>3</span>, <span class='ruby-keyword'>true</span>) <span class='ruby-comment'>#=&gt; [true, true, true]</span>
</pre>

<p>Note that the second argument populates the array with references to the
same object.  Therefore, it is only recommended in cases when you need to
instantiate arrays with natively immutable objects such as Symbols,
numbers, true or false.</p>

<p>To create an array with separate objects a block can be passed instead.
This method is safe to use with mutable objects such as hashes, strings or
other arrays:</p>

<pre class='ruby'><span class='ruby-constant'>Array</span>.<span class='ruby-identifier'>new</span>(<span class='ruby-value'>4</span>) { <span class='ruby-constant'>Hash</span>.<span class='ruby-identifier'>new</span> } <span class='ruby-comment'>#=&gt; [{}, {}, {}, {}]</span>
</pre>

<p>This is also a quick way to build up multi-dimensional arrays:</p>

<pre class='ruby'><span class='ruby-identifier'>empty_table</span> = <span class='ruby-constant'>Array</span>.<span class='ruby-identifier'>new</span>(<span class='ruby-value'>3</span>) { <span class='ruby-constant'>Array</span>.<span class='ruby-identifier'>new</span>(<span class='ruby-value'>3</span>) }
<span class='ruby-comment'>#=&gt; [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]</span>
</pre>

<p>An array can also be created by using the Array() method, provided by <a
href='Kernel.html'>Kernel</a>, which tries to call <a
href='Array.html#method-i-to_ary'>to_ary</a>, then <a
href='Array.html#method-i-to_a'>to_a</a> on its argument.</p>

<pre class='ruby'><span class='ruby-constant'>Array</span>({:<span class='ruby-identifier'>a</span> =<span class='ruby-operator'>&gt;</span> <span class='ruby-string'>&quot;a&quot;</span>, :<span class='ruby-identifier'>b</span> =<span class='ruby-operator'>&gt;</span> <span class='ruby-string'>&quot;b&quot;</span>}) <span class='ruby-comment'>#=&gt; [[:a, &quot;a&quot;], [:b, &quot;b&quot;]]</span>
</pre>

<h2 id='class-Array-label-Example+Usage'>Example Usage<span><a href='#class-Array-label-Example+Usage'>&para;</a> <a href='#top'>&uarr;</a></span></h2>

<p>In addition to the methods it mixes in through the <a
href='Enumerable.html'>Enumerable</a> module, the <a
href='Array.html'>Array</a> class has proprietary methods for accessing,
searching and otherwise manipulating arrays.</p>

<p>Some of the more common ones are illustrated below.</p>

<h2 id='class-Array-label-Accessing+Elements'>Accessing Elements<span><a href='#class-Array-label-Accessing+Elements'>&para;</a> <a href='#top'>&uarr;</a></span></h2>

<p>Elements in an array can be retrieved using the <a
href='Array.html#method-i-5B-5D'>#[]</a> method.  It can take a single
integer argument (a numeric index), a pair of arguments (start and length)
or a range. Negative indices start counting from the end, with -1 being the
last element.</p>

<pre class='ruby'><span class='ruby-identifier'>arr</span> = [<span class='ruby-value'>1</span>, <span class='ruby-value'>2</span>, <span class='ruby-value'>3</span>, <span class='ruby-value'>4</span>, <span class='ruby-value'>5</span>, <span class='ruby-value'>6</span>]
<span class='ruby-identifier'>arr</span>[<span class='ruby-value'>2</span>]    <span class='ruby-comment'>#=&gt; 3</span>
<span class='ruby-identifier'>arr</span>[<span class='ruby-value'>100</span>]  <span class='ruby-comment'>#=&gt; nil</span>
<span class='ruby-identifier'>arr</span>[<span class='ruby-value'>-3</span>]   <span class='ruby-comment'>#=&gt; 4</span>
<span class='ruby-identifier'>arr</span>[<span class='ruby-value'>2</span>, <span class='ruby-value'>3</span>] <span class='ruby-comment'>#=&gt; [3, 4, 5]</span>
<span class='ruby-identifier'>arr</span>[<span class='ruby-value'>1</span><span class='ruby-operator'>..</span><span class='ruby-value'>4</span>] <span class='ruby-comment'>#=&gt; [2, 3, 4, 5]</span>
<span class='ruby-identifier'>arr</span>[<span class='ruby-value'>1</span><span class='ruby-operator'>..</span><span class='ruby-value'>-3</span>] <span class='ruby-comment'>#=&gt; [2, 3, 4]</span>
</pre>

<p>Another way to access a particular array element is by using the <a
href='Array.html#method-i-at'>at</a> method</p>

<pre class='ruby'><span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>at</span>(<span class='ruby-value'>0</span>) <span class='ruby-comment'>#=&gt; 1</span>
</pre>

<p>The <a href='Array.html#method-i-slice'>slice</a> method works in an
identical manner to <a href='Array.html#method-i-5B-5D'>#[]</a>.</p>

<p>To raise an error for indices outside of the array bounds or else to
provide a default value when that happens, you can use <a
href='Array.html#method-i-fetch'>fetch</a>.</p>

<pre class='ruby'><span class='ruby-identifier'>arr</span> = [<span class='ruby-string'>'a'</span>, <span class='ruby-string'>'b'</span>, <span class='ruby-string'>'c'</span>, <span class='ruby-string'>'d'</span>, <span class='ruby-string'>'e'</span>, <span class='ruby-string'>'f'</span>]
<span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>fetch</span>(<span class='ruby-value'>100</span>) <span class='ruby-comment'>#=&gt; IndexError: index 100 outside of array bounds: -6...6</span>
<span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>fetch</span>(<span class='ruby-value'>100</span>, <span class='ruby-string'>&quot;oops&quot;</span>) <span class='ruby-comment'>#=&gt; &quot;oops&quot;</span>
</pre>

<p>The special methods <a href='Array.html#method-i-first'>first</a> and <a
href='Array.html#method-i-last'>last</a> will return the first and last
elements of an array, respectively.</p>

<pre class='ruby'><span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>first</span> <span class='ruby-comment'>#=&gt; 1</span>
<span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>last</span>  <span class='ruby-comment'>#=&gt; 6</span>
</pre>

<p>To return the first <code>n</code> elements of an array, use <a
href='Array.html#method-i-take'>take</a></p>

<pre class='ruby'><span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>take</span>(<span class='ruby-value'>3</span>) <span class='ruby-comment'>#=&gt; [1, 2, 3]</span>
</pre>

<p><a href='Array.html#method-i-drop'>drop</a> does the opposite of <a
href='Array.html#method-i-take'>take</a>, by returning the elements after
<code>n</code> elements have been dropped:</p>

<pre class='ruby'><span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>drop</span>(<span class='ruby-value'>3</span>) <span class='ruby-comment'>#=&gt; [4, 5, 6]</span>
</pre>

<h2 id='class-Array-label-Obtaining+Information+about+an+Array'>Obtaining Information about an <a href='Array.html'>Array</a><span><a href='#class-Array-label-Obtaining+Information+about+an+Array'>&para;</a> <a href='#top'>&uarr;</a></span></h2>

<p>Arrays keep track of their own length at all times.  To query an array
about the number of elements it contains, use <a
href='Array.html#method-i-length'>length</a>, <a
href='Array.html#method-i-count'>count</a> or <a
href='Array.html#method-i-size'>size</a>.</p>

<pre class='ruby'><span class='ruby-identifier'>browsers</span> = [<span class='ruby-string'>'Chrome'</span>, <span class='ruby-string'>'Firefox'</span>, <span class='ruby-string'>'Safari'</span>, <span class='ruby-string'>'Opera'</span>, <span class='ruby-string'>'IE'</span>]
<span class='ruby-identifier'>browsers</span>.<span class='ruby-identifier'>length</span> <span class='ruby-comment'>#=&gt; 5</span>
<span class='ruby-identifier'>browsers</span>.<span class='ruby-identifier'>count</span> <span class='ruby-comment'>#=&gt; 5</span>
</pre>

<p>To check whether an array contains any elements at all</p>

<pre class='ruby'><span class='ruby-identifier'>browsers</span>.<span class='ruby-identifier'>empty?</span> <span class='ruby-comment'>#=&gt; false</span>
</pre>

<p>To check whether a particular item is included in the array</p>

<pre class='ruby'><span class='ruby-identifier'>browsers</span>.<span class='ruby-identifier'>include?</span>(<span class='ruby-string'>'Konqueror'</span>) <span class='ruby-comment'>#=&gt; false</span>
</pre>

<h2 id='class-Array-label-Adding+Items+to+Arrays'>Adding Items to Arrays<span><a href='#class-Array-label-Adding+Items+to+Arrays'>&para;</a> <a href='#top'>&uarr;</a></span></h2>

<p>Items can be added to the end of an array by using either <a
href='Array.html#method-i-push'>push</a> or <a
href='Array.html#method-i-3C-3C'><<</a></p>

<pre class='ruby'><span class='ruby-identifier'>arr</span> = [<span class='ruby-value'>1</span>, <span class='ruby-value'>2</span>, <span class='ruby-value'>3</span>, <span class='ruby-value'>4</span>]
<span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>push</span>(<span class='ruby-value'>5</span>) <span class='ruby-comment'>#=&gt; [1, 2, 3, 4, 5]</span>
<span class='ruby-identifier'>arr</span> <span class='ruby-operator'>&lt;&lt;</span> <span class='ruby-value'>6</span>    <span class='ruby-comment'>#=&gt; [1, 2, 3, 4, 5, 6]</span>
</pre>

<p><a href='Array.html#method-i-unshift'>unshift</a> will add a new item to
the beginning of an array.</p>

<pre class='ruby'><span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>unshift</span>(<span class='ruby-value'>0</span>) <span class='ruby-comment'>#=&gt; [0, 1, 2, 3, 4, 5, 6]</span>
</pre>

<p>With <a href='Array.html#method-i-insert'>insert</a> you can add a new
element to an array at any position.</p>

<pre class='ruby'><span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>insert</span>(<span class='ruby-value'>3</span>, <span class='ruby-string'>'apple'</span>)  <span class='ruby-comment'>#=&gt; [0, 1, 2, 'apple', 3, 4, 5, 6]</span>
</pre>

<p>Using the <a href='Array.html#method-i-insert'>insert</a> method, you can
also insert multiple values at once:</p>

<pre class='ruby'><span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>insert</span>(<span class='ruby-value'>3</span>, <span class='ruby-string'>'orange'</span>, <span class='ruby-string'>'pear'</span>, <span class='ruby-string'>'grapefruit'</span>)
<span class='ruby-comment'>#=&gt; [0, 1, 2, &quot;orange&quot;, &quot;pear&quot;, &quot;grapefruit&quot;, &quot;apple&quot;, 3, 4, 5, 6]</span>
</pre>

<h2 id='class-Array-label-Removing+Items+from+an+Array'>Removing Items from an <a href='Array.html'>Array</a><span><a href='#class-Array-label-Removing+Items+from+an+Array'>&para;</a> <a href='#top'>&uarr;</a></span></h2>

<p>The method <a href='Array.html#method-i-pop'>pop</a> removes the last
element in an array and returns it:</p>

<pre class='ruby'><span class='ruby-identifier'>arr</span> =  [<span class='ruby-value'>1</span>, <span class='ruby-value'>2</span>, <span class='ruby-value'>3</span>, <span class='ruby-value'>4</span>, <span class='ruby-value'>5</span>, <span class='ruby-value'>6</span>]
<span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>pop</span> <span class='ruby-comment'>#=&gt; 6</span>
<span class='ruby-identifier'>arr</span> <span class='ruby-comment'>#=&gt; [1, 2, 3, 4, 5]</span>
</pre>

<p>To retrieve and at the same time remove the first item, use <a
href='Array.html#method-i-shift'>shift</a>:</p>

<pre class='ruby'><span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>shift</span> <span class='ruby-comment'>#=&gt; 1</span>
<span class='ruby-identifier'>arr</span> <span class='ruby-comment'>#=&gt; [2, 3, 4, 5]</span>
</pre>

<p>To delete an element at a particular index:</p>

<pre class='ruby'><span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>delete_at</span>(<span class='ruby-value'>2</span>) <span class='ruby-comment'>#=&gt; 4</span>
<span class='ruby-identifier'>arr</span> <span class='ruby-comment'>#=&gt; [2, 3, 5]</span>
</pre>

<p>To delete a particular element anywhere in an array, use <a
href='Array.html#method-i-delete'>delete</a>:</p>

<pre class='ruby'><span class='ruby-identifier'>arr</span> = [<span class='ruby-value'>1</span>, <span class='ruby-value'>2</span>, <span class='ruby-value'>2</span>, <span class='ruby-value'>3</span>]
<span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>delete</span>(<span class='ruby-value'>2</span>) <span class='ruby-comment'>#=&gt; 2</span>
<span class='ruby-identifier'>arr</span> <span class='ruby-comment'>#=&gt; [1,3]</span>
</pre>

<p>A useful method if you need to remove <code>nil</code> values from an array
is <a href='Array.html#method-i-compact'>compact</a>:</p>

<pre class='ruby'><span class='ruby-identifier'>arr</span> = [<span class='ruby-string'>'foo'</span>, <span class='ruby-value'>0</span>, <span class='ruby-keyword'>nil</span>, <span class='ruby-string'>'bar'</span>, <span class='ruby-value'>7</span>, <span class='ruby-string'>'baz'</span>, <span class='ruby-keyword'>nil</span>]
<span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>compact</span>  <span class='ruby-comment'>#=&gt; ['foo', 0, 'bar', 7, 'baz']</span>
<span class='ruby-identifier'>arr</span>          <span class='ruby-comment'>#=&gt; ['foo', 0, nil, 'bar', 7, 'baz', nil]</span>
<span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>compact!</span> <span class='ruby-comment'>#=&gt; ['foo', 0, 'bar', 7, 'baz']</span>
<span class='ruby-identifier'>arr</span>          <span class='ruby-comment'>#=&gt; ['foo', 0, 'bar', 7, 'baz']</span>
</pre>

<p>Another common need is to remove duplicate elements from an array.</p>

<p>It has the non-destructive <a href='Array.html#method-i-uniq'>uniq</a>, and
destructive method <a href='Array.html#method-i-uniq-21'>uniq!</a></p>

<pre class='ruby'><span class='ruby-identifier'>arr</span> = [<span class='ruby-value'>2</span>, <span class='ruby-value'>5</span>, <span class='ruby-value'>6</span>, <span class='ruby-value'>556</span>, <span class='ruby-value'>6</span>, <span class='ruby-value'>6</span>, <span class='ruby-value'>8</span>, <span class='ruby-value'>9</span>, <span class='ruby-value'>0</span>, <span class='ruby-value'>123</span>, <span class='ruby-value'>556</span>]
<span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>uniq</span> <span class='ruby-comment'>#=&gt; [2, 5, 6, 556, 8, 9, 0, 123]</span>
</pre>

<h2 id='class-Array-label-Iterating+over+Arrays'>Iterating over Arrays<span><a href='#class-Array-label-Iterating+over+Arrays'>&para;</a> <a href='#top'>&uarr;</a></span></h2>

<p>Like all classes that include the <a href='Enumerable.html'>Enumerable</a>
module, <a href='Array.html'>Array</a> has an each method, which defines
what elements should be iterated over and how.  In case of Array’s <a
href='Array.html#method-i-each'>each</a>, all elements in the <a
href='Array.html'>Array</a> instance are yielded to the supplied block in
sequence.</p>

<p>Note that this operation leaves the array unchanged.</p>

<pre class='ruby'><span class='ruby-identifier'>arr</span> = [<span class='ruby-value'>1</span>, <span class='ruby-value'>2</span>, <span class='ruby-value'>3</span>, <span class='ruby-value'>4</span>, <span class='ruby-value'>5</span>]
<span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>each</span> { <span class='ruby-operator'>|</span><span class='ruby-identifier'>a</span><span class='ruby-operator'>|</span> <span class='ruby-identifier'>print</span> <span class='ruby-identifier'>a</span> <span class='ruby-operator'>-=</span> <span class='ruby-value'>10</span>, <span class='ruby-string'>&quot; &quot;</span> }
<span class='ruby-comment'># prints: -9 -8 -7 -6 -5</span>
<span class='ruby-comment'>#=&gt; [1, 2, 3, 4, 5]</span>
</pre>

<p>Another sometimes useful iterator is <a
href='Array.html#method-i-reverse_each'>reverse_each</a> which will iterate
over the elements in the array in reverse order.</p>

<pre class='ruby'><span class='ruby-identifier'>words</span> = <span class='ruby-node'>%w[first second third fourth fifth sixth]</span>
<span class='ruby-identifier'>str</span> = <span class='ruby-string'>&quot;&quot;</span>
<span class='ruby-identifier'>words</span>.<span class='ruby-identifier'>reverse_each</span> { <span class='ruby-operator'>|</span><span class='ruby-identifier'>word</span><span class='ruby-operator'>|</span> <span class='ruby-identifier'>str</span> <span class='ruby-operator'>+=</span> <span class='ruby-node'>&quot;&quot;</span> }
<span class='ruby-identifier'>p</span> <span class='ruby-identifier'>str</span> <span class='ruby-comment'>#=&gt; &quot;sixth fifth fourth third second first &quot;</span>
</pre>

<p>The <a href='Array.html#method-i-map'>map</a> method can be used to create
a new array based on the original array, but with the values modified by
the supplied block:</p>

<pre class='ruby'><span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>map</span> { <span class='ruby-operator'>|</span><span class='ruby-identifier'>a</span><span class='ruby-operator'>|</span> <span class='ruby-value'>2</span><span class='ruby-operator'>'</span><span class='ruby-identifier'>a</span> }   <span class='ruby-comment'>#=&gt; [2, 4, 6, 8, 10]</span>
<span class='ruby-identifier'>arr</span>                   <span class='ruby-comment'>#=&gt; [1, 2, 3, 4, 5]</span>
<span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>map!</span> { <span class='ruby-operator'>|</span><span class='ruby-identifier'>a</span><span class='ruby-operator'>|</span> <span class='ruby-identifier'>a</span><span class='ruby-operator'>''</span><span class='ruby-value'>2</span> } <span class='ruby-comment'>#=&gt; [1, 4, 9, 16, 25]</span>
<span class='ruby-identifier'>arr</span>                   <span class='ruby-comment'>#=&gt; [1, 4, 9, 16, 25]</span>
</pre>

<h2 id='class-Array-label-Selecting+Items+from+an+Array'>Selecting Items from an <a href='Array.html'>Array</a><span><a href='#class-Array-label-Selecting+Items+from+an+Array'>&para;</a> <a href='#top'>&uarr;</a></span></h2>

<p>Elements can be selected from an array according to criteria defined in a
block.  The selection can happen in a destructive or a non-destructive
manner.  While the destructive operations will modify the array they were
called on, the non-destructive methods usually return a new array with the
selected elements, but leave the original array unchanged.</p>

<h3 id='class-Array-label-Non-destructive+Selection'>Non-destructive Selection<span><a href='#class-Array-label-Non-destructive+Selection'>&para;</a> <a href='#top'>&uarr;</a></span></h3>

<pre class='ruby'><span class='ruby-identifier'>arr</span> = [<span class='ruby-value'>1</span>, <span class='ruby-value'>2</span>, <span class='ruby-value'>3</span>, <span class='ruby-value'>4</span>, <span class='ruby-value'>5</span>, <span class='ruby-value'>6</span>]
<span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>select</span> { <span class='ruby-operator'>|</span><span class='ruby-identifier'>a</span><span class='ruby-operator'>|</span> <span class='ruby-identifier'>a</span> <span class='ruby-operator'>&gt;</span> <span class='ruby-value'>3</span> }     <span class='ruby-comment'>#=&gt; [4, 5, 6]</span>
<span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>reject</span> { <span class='ruby-operator'>|</span><span class='ruby-identifier'>a</span><span class='ruby-operator'>|</span> <span class='ruby-identifier'>a</span> <span class='ruby-operator'>&lt;</span> <span class='ruby-value'>3</span> }     <span class='ruby-comment'>#=&gt; [3, 4, 5, 6]</span>
<span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>drop_while</span> { <span class='ruby-operator'>|</span><span class='ruby-identifier'>a</span><span class='ruby-operator'>|</span> <span class='ruby-identifier'>a</span> <span class='ruby-operator'>&lt;</span> <span class='ruby-value'>4</span> } <span class='ruby-comment'>#=&gt; [4, 5, 6]</span>
<span class='ruby-identifier'>arr</span>                          <span class='ruby-comment'>#=&gt; [1, 2, 3, 4, 5, 6]</span>
</pre>

<h3 id='class-Array-label-Destructive+Selection'>Destructive Selection<span><a href='#class-Array-label-Destructive+Selection'>&para;</a> <a href='#top'>&uarr;</a></span></h3>

<p><a href='Array.html#method-i-select-21'>select!</a> and <a
href='Array.html#method-i-reject-21'>reject!</a> are the corresponding
destructive methods to <a href='Array.html#method-i-select'>select</a> and
<a href='Array.html#method-i-reject'>reject</a></p>

<p>Similar to <a href='Array.html#method-i-select'>select</a> vs. <a
href='Array.html#method-i-reject'>reject</a>, <a
href='Array.html#method-i-delete_if'>delete_if</a> and <a
href='Array.html#method-i-keep_if'>keep_if</a> have the exact opposite
result when supplied with the same block:</p>

<pre class='ruby'><span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>delete_if</span> { <span class='ruby-operator'>|</span><span class='ruby-identifier'>a</span><span class='ruby-operator'>|</span> <span class='ruby-identifier'>a</span> <span class='ruby-operator'>&lt;</span> <span class='ruby-value'>4</span> } <span class='ruby-comment'>#=&gt; [4, 5, 6]</span>
<span class='ruby-identifier'>arr</span>                         <span class='ruby-comment'>#=&gt; [4, 5, 6]</span>

<span class='ruby-identifier'>arr</span> = [<span class='ruby-value'>1</span>, <span class='ruby-value'>2</span>, <span class='ruby-value'>3</span>, <span class='ruby-value'>4</span>, <span class='ruby-value'>5</span>, <span class='ruby-value'>6</span>]
<span class='ruby-identifier'>arr</span>.<span class='ruby-identifier'>keep_if</span> { <span class='ruby-operator'>|</span><span class='ruby-identifier'>a</span><span class='ruby-operator'>|</span> <span class='ruby-identifier'>a</span> <span class='ruby-operator'>&lt;</span> <span class='ruby-value'>4</span> } <span class='ruby-comment'>#=&gt; [1, 2, 3]</span>
<span class='ruby-identifier'>arr</span>                       <span class='ruby-comment'>#=&gt; [1, 2, 3]</span>
</pre>

    </div>")

posts.insert( :id => 3, :title => 'BASICOBJECT', :body => "<div id='description' class='description'>
      
<p><a href='BasicObject.html'>BasicObject</a> is the parent class of all
classes in Ruby.  It's an explicit blank class.</p>

<p><a href='BasicObject.html'>BasicObject</a> can be used for creating object
hierarchies independent of Ruby's object hierarchy, proxy objects like the
Delegator class, or other uses where namespace pollution from Ruby's
methods and classes must be avoided.</p>

<p>To avoid polluting <a href='BasicObject.html'>BasicObject</a> for other
users an appropriately named subclass of <a
href='BasicObject.html'>BasicObject</a> should be created instead of
directly modifying BasicObject:</p>

<pre class='ruby'><span class='ruby-keyword'>class</span> <span class='ruby-constant'>MyObjectSystem</span> <span class='ruby-operator'>&lt;</span> <span class='ruby-constant'>BasicObject</span>
<span class='ruby-keyword'>end</span>
</pre>

<p><a href='BasicObject.html'>BasicObject</a> does not include <a
href='Kernel.html'>Kernel</a> (for methods like <code>puts</code>) and <a
href='BasicObject.html'>BasicObject</a> is outside of the namespace of the
standard library so common classes will not be found without using a full
class path.</p>

<p>A variety of strategies can be used to provide useful portions of the
standard library to subclasses of <a
href='BasicObject.html'>BasicObject</a>.  A subclass could <code>include
Kernel</code> to obtain <code>puts</code>, <code>exit</code>, etc.  A
custom Kernel-like module could be created and included or delegation can
be used via <a
href='BasicObject.html#method-i-method_missing'>method_missing</a>:</p>

<pre class='ruby'><span class='ruby-keyword'>class</span> <span class='ruby-constant'>MyObjectSystem</span> <span class='ruby-operator'>&lt;</span> <span class='ruby-constant'>BasicObject</span>
  <span class='ruby-constant'>DELEGATE</span> = [:<span class='ruby-identifier'>puts</span>, :<span class='ruby-identifier'>p</span>]

  <span class='ruby-keyword'>def</span> <span class='ruby-identifier'>method_missing</span>(<span class='ruby-identifier'>name</span>, <span class='ruby-operator'>*</span><span class='ruby-identifier'>args</span>, <span class='ruby-operator'>&amp;</span><span class='ruby-identifier'>block</span>)
    <span class='ruby-keyword'>super</span> <span class='ruby-keyword'>unless</span> <span class='ruby-constant'>DELEGATE</span>.<span class='ruby-identifier'>include?</span> <span class='ruby-identifier'>name</span>
    <span class='ruby-operator'>::</span><span class='ruby-constant'>Kernel</span>.<span class='ruby-identifier'>send</span>(<span class='ruby-identifier'>name</span>, <span class='ruby-operator'>*</span><span class='ruby-identifier'>args</span>, <span class='ruby-operator'>&amp;</span><span class='ruby-identifier'>block</span>)
  <span class='ruby-keyword'>end</span>

  <span class='ruby-keyword'>def</span> <span class='ruby-identifier'>respond_to_missing?</span>(<span class='ruby-identifier'>name</span>, <span class='ruby-identifier'>include_private</span> = <span class='ruby-keyword'>false</span>)
    <span class='ruby-constant'>DELEGATE</span>.<span class='ruby-identifier'>include?</span>(<span class='ruby-identifier'>name</span>) <span class='ruby-keyword'>or</span> <span class='ruby-keyword'>super</span>
  <span class='ruby-keyword'>end</span>
<span class='ruby-keyword'>end</span>
</pre>

<p>Access to classes and modules from the Ruby standard library can be
obtained in a <a href='BasicObject.html'>BasicObject</a> subclass by
referencing the desired constant from the root like <code>::File</code> or
<code>::Enumerator</code>. Like <a
href='BasicObject.html#method-i-method_missing'>method_missing</a>,
const_missing can be used to delegate constant lookup to
<code>Object</code>:</p>

<pre class='ruby'><span class='ruby-keyword'>class</span> <span class='ruby-constant'>MyObjectSystem</span> <span class='ruby-operator'>&lt;</span> <span class='ruby-constant'>BasicObject</span>
  <span class='ruby-keyword'>def</span> <span class='ruby-keyword'>self</span>.<span class='ruby-identifier'>const_missing</span>(<span class='ruby-identifier'>name</span>)
    <span class='ruby-operator'>::</span><span class='ruby-constant'>Object</span>.<span class='ruby-identifier'>const_get</span>(<span class='ruby-identifier'>name</span>)
  <span class='ruby-keyword'>end</span>
<span class='ruby-keyword'>end</span>
</pre>

    </div>")
posts.insert( :id => 4, :title => 'BIGNUM', :body => "
<p><a href='Bignum.html'>Bignum</a> objects hold integers outside the range of
<a href='Fixnum.html'>Fixnum</a>. <a href='Bignum.html'>Bignum</a> objects
are created automatically when integer calculations would otherwise
overflow a <a href='Fixnum.html'>Fixnum</a>. When a calculation involving
<a href='Bignum.html'>Bignum</a> objects returns a result that will fit in
a <a href='Fixnum.html'>Fixnum</a>, the result is automatically converted.</p>

<p>For the purposes of the bitwise operations and <code>[]</code>, a <a
href='Bignum.html'>Bignum</a> is treated as if it were an infinite-length
bitstring with 2’s complement representation.</p>

<p>While <a href='Fixnum.html'>Fixnum</a> values are immediate, <a
href='Bignum.html'>Bignum</a> objects are not—assignment and parameter
passing work with references to objects, not the objects themselves.</p>
    
     <div class='method-heading'>
            <span class='method-callseq'>big % other         &rarr; Numeric</span>
            
          </div>

<div class='method-heading'>
            <span class='method-callseq'>big & numeric   &rarr;  integer</span>
            
          </div>       
          
              <div class='method-heading'>
            <span class='method-callseq'>big * other  &rarr; Numeric</span>
            
          </div>
          
           <div class='method-heading'>
            <span class='method-callseq'>big ** exponent   &rarr; numeric</span>
            
          </div>
          
          <p>Raises <em>big</em> to the <em>exponent</em> power (which may be an
integer, float, or anything that will coerce to a number). The result may
be a <a href='Fixnum.html'>Fixnum</a>, <a href='Bignum.html'>Bignum</a>, or
<a href='Float.html'>Float</a></p>

<pre class='ruby'><span class='ruby-value'>123456789</span> <span class='ruby-operator'>**</span> <span class='ruby-value'>2</span>      <span class='ruby-comment'>#=&gt; 15241578750190521</span>
<span class='ruby-value'>123456789</span> <span class='ruby-operator'>**</span> <span class='ruby-value'>1.2</span>    <span class='ruby-comment'>#=&gt; 5126464716.09932</span>
<span class='ruby-value'>123456789</span> <span class='ruby-operator'>**</span> <span class='ruby-value'>-2</span>     <span class='ruby-comment'>#=&gt; 6.5610001194102e-17</span>
</pre>

<div class='method-heading'>
            <span class='method-callseq'>big + other  &rarr; Numeric</span>
            
          </div>
          
          <p>Adds big and other, returning the result.</p>
          
             <div class='method-heading'>
            <span class='method-callseq'>big - other  &rarr; Numeric</span>
            
          </div>
          
          <p>Subtracts other from big, returning the result.</p>
          
           <div class='method-heading'>
            <span class='method-callseq'>-big   &rarr;  integer</span>
            
          </div>
          
           <p>Unary minus (returns an integer whose value is 0-big)</p>
           
           <div class='method-heading'>
            <span class='method-callseq'>big / other     &rarr; Numeric</span>
            
          </div>
          
          
          <div>
  
            
            <p>Performs division: the class of the resulting object depends on the class
of <code>numeric</code> and on the magnitude of the result.</p>

 
          <div class='method-heading'>
            <span class='method-callseq'>big < real  &rarr;  true or false</span>
            
          </div>
          
          
          <div>
  
            
            <p>Returns <code>true</code> if the value of <code>big</code> is less than
that of <code>real</code>.</p>

  <div class='method-heading'>
            <span class='method-callseq'>big << numeric   &rarr;  integer</span>

          </div>
          
          
          <div>
  
            
            <p>Shifts big left <em>numeric</em> positions (right if <em>numeric</em> is
negative).</p>

<div class='method-heading'>
            <span class='method-callseq'>big <= real  &rarr;  true or false</span>
            </div>
            
            <p>Returns <code>true</code> if the value of <code>big</code> is less than or
equal to that of <code>real</code>.</p>

 <div class='method-heading'>
            <span class='method-callseq'>big <=> numeric   &rarr; -1, 0, +1 or nil</span>
            </div>
            
            <p>Comparison—Returns -1, 0, or +1 depending on whether <code>big</code> is
less than, equal to, or greater than <code>numeric</code>. This is the
basis for the tests in <a href='Comparable.html'>Comparable</a>.</p>

<p><code>nil</code> is returned if the two values are incomparable.</p>

<div class='method-heading'>
            <span class='method-callseq'>big == obj  &rarr; true or false</span>
            </div>

<p>Returns <code>true</code> only if <em>obj</em> has the same value as
<em>big</em>. Contrast this with <code>Bignum#eql?</code>, which requires
<em>obj</em> to be a <code>Bignum</code>.</p>

<pre class='ruby'><span class='ruby-value'>68719476736</span> <span class='ruby-operator'>==</span> <span class='ruby-value'>68719476736.0</span>   <span class='ruby-comment'>#=&gt; true</span>
</pre>

 <div class='method-heading'>
            <span class='method-callseq'>big > real  &rarr;  true or false</span>
            </div>
            
            <p>Returns <code>true</code> if the value of <code>big</code> is greater than
that of <code>real</code>.</p>

<div class='method-heading'>
            <span class='method-callseq'>big >= real  &rarr;  true or false</span>
            </div>
            
              <p>Returns <code>true</code> if the value of <code>big</code> is greater than
or equal to that of <code>real</code>.</p>

   
          <div class='method-heading'>
            <span class='method-callseq'>big >> numeric   &rarr;  integer</span>
            
            </div>
            
            <p>Shifts big right <em>numeric</em> positions (left if <em>numeric</em> is
negative).</p>

 <div class='method-heading'>
            <span class='method-callseq'>big[n] &rarr; 0, 1</span>
            </div>
            
            <p>Bit Reference—Returns the <em>n</em>th bit in the (assumed) binary
representation of <em>big</em>, where <em><a href='0'>big</a></em> is the
least significant bit.</p>



<pre class='ruby'><span class='ruby-identifier'>a</span> = <span class='ruby-value'>9</span><span class='ruby-operator'>**</span><span class='ruby-value'>15</span>
<span class='ruby-value'>50</span>.<span class='ruby-identifier'>downto</span>(<span class='ruby-value'>0</span>) <span class='ruby-keyword'>do</span> <span class='ruby-operator'>|</span><span class='ruby-identifier'>n</span><span class='ruby-operator'>|</span>
  <span class='ruby-identifier'>print</span> <span class='ruby-identifier'>a</span>[<span class='ruby-identifier'>n</span>]
<span class='ruby-keyword'>end</span>
</pre>

<p><em>produces:</em></p>

<pre class='ruby'><span class='ruby-value'>000101110110100000111000011110010100111100010111001</span>
</pre>

<div class='method-heading'>
            <span class='method-callseq'>big ^ numeric   &rarr;  integer</span>
            </div>
            
            <p>Performs bitwise +exclusive or+ between <em>big</em> and <em>numeric</em>.</p>
            
            <div class='method-heading'>
            <span class='method-callseq'>abs &rarr; aBignum</span>
            </div>
            
            <p>Returns the absolute value of <em>big</em>.</p>

<pre class='ruby'><span class='ruby-value'>-1234567890987654321</span>.<span class='ruby-identifier'>abs</span>   <span class='ruby-comment'>#=&gt; 1234567890987654321</span>
</pre>

 <div class='method-heading'>
            <span class='method-callseq'>bit_length &rarr; integer</span>
            </div>
            
            <p>Returns the number of bits of the value of <em>int</em>.</p>

<p>“the number of bits” means that the bit position of the highest bit which
is different to the sign bit. (The bit position of the bit 2**n is n+1.) If
there is no such bit (zero or minus one), zero is returned.</p>

<p>I.e. This method returns ceil(log2(int &lt; 0 ? -int : int+1)).</p>

<pre class='ruby'>(<span class='ruby-value'>-2</span><span class='ruby-operator'>**</span><span class='ruby-value'>10000</span><span class='ruby-operator'>-</span><span class='ruby-value'>1</span>).<span class='ruby-identifier'>bit_length</span>  <span class='ruby-comment'>#=&gt; 10001</span>
(<span class='ruby-value'>-2</span><span class='ruby-operator'>**</span><span class='ruby-value'>10000</span>).<span class='ruby-identifier'>bit_length</span>    <span class='ruby-comment'>#=&gt; 10000</span>
(<span class='ruby-value'>-2</span><span class='ruby-operator'>**</span><span class='ruby-value'>10000</span><span class='ruby-operator'>+</span><span class='ruby-value'>1</span>).<span class='ruby-identifier'>bit_length</span>  <span class='ruby-comment'>#=&gt; 10000</span>

(<span class='ruby-value'>-2</span><span class='ruby-operator'>**</span><span class='ruby-value'>1000</span><span class='ruby-operator'>-</span><span class='ruby-value'>1</span>).<span class='ruby-identifier'>bit_length</span>   <span class='ruby-comment'>#=&gt; 1001</span>
(<span class='ruby-value'>-2</span><span class='ruby-operator'>**</span><span class='ruby-value'>1000</span>).<span class='ruby-identifier'>bit_length</span>     <span class='ruby-comment'>#=&gt; 1000</span>
(<span class='ruby-value'>-2</span><span class='ruby-operator'>**</span><span class='ruby-value'>1000</span><span class='ruby-operator'>+</span><span class='ruby-value'>1</span>).<span class='ruby-identifier'>bit_length</span>   <span class='ruby-comment'>#=&gt; 1000</span>

(<span class='ruby-value'>2</span><span class='ruby-operator'>**</span><span class='ruby-value'>1000</span><span class='ruby-operator'>-</span><span class='ruby-value'>1</span>).<span class='ruby-identifier'>bit_length</span>    <span class='ruby-comment'>#=&gt; 1000</span>
(<span class='ruby-value'>2</span><span class='ruby-operator'>**</span><span class='ruby-value'>1000</span>).<span class='ruby-identifier'>bit_length</span>      <span class='ruby-comment'>#=&gt; 1001</span>
(<span class='ruby-value'>2</span><span class='ruby-operator'>**</span><span class='ruby-value'>1000</span><span class='ruby-operator'>+</span><span class='ruby-value'>1</span>).<span class='ruby-identifier'>bit_length</span>    <span class='ruby-comment'>#=&gt; 1001</span>

(<span class='ruby-value'>2</span><span class='ruby-operator'>**</span><span class='ruby-value'>10000</span><span class='ruby-operator'>-</span><span class='ruby-value'>1</span>).<span class='ruby-identifier'>bit_length</span>   <span class='ruby-comment'>#=&gt; 10000</span>
(<span class='ruby-value'>2</span><span class='ruby-operator'>**</span><span class='ruby-value'>10000</span>).<span class='ruby-identifier'>bit_length</span>     <span class='ruby-comment'>#=&gt; 10001</span>
(<span class='ruby-value'>2</span><span class='ruby-operator'>**</span><span class='ruby-value'>10000</span><span class='ruby-operator'>+</span><span class='ruby-value'>1</span>).<span class='ruby-identifier'>bit_length</span>   <span class='ruby-comment'>#=&gt; 10001</span>
</pre>

<p>This method can be used to detect overflow in <a
href='Array.html#method-i-pack'>Array#pack</a> as follows.</p>

<pre class='ruby'><span class='ruby-keyword'>if</span> <span class='ruby-identifier'>n</span>.<span class='ruby-identifier'>bit_length</span> <span class='ruby-operator'>&lt;</span> <span class='ruby-value'>32</span>
  [<span class='ruby-identifier'>n</span>].<span class='ruby-identifier'>pack</span>(<span class='ruby-string'>&quot;l&quot;</span>) <span class='ruby-comment'># no overflow</span>
<span class='ruby-keyword'>else</span>
  <span class='ruby-identifier'>raise</span> <span class='ruby-string'>&quot;overflow&quot;</span>
<span class='ruby-keyword'>end</span>
</pre>

<div class='method-heading'>
            <span class='method-callseq'>modulo(other)   &rarr; Numeric</span>
            </div>
            
              <p>Returns big modulo other. See <a
href='Numeric.html#method-i-divmod'>Numeric#divmod</a> for more
information.</p>

          <div class='method-heading'>
            <span class='method-callseq'>odd? &rarr; true or false</span>
            </div>
            
            <p>Returns <code>true</code> if <em>big</em> is an odd number.</p>
            
            <div class='method-heading'>
            <span class='method-callseq'>remainder(numeric)    &rarr; number</span>
            </div
            
            <p> Returns the remainder after dividing <em>big</em> by <em>numeric</em>.</p>

<pre class='ruby'><span class='ruby-value'>-1234567890987654321</span>.<span class='ruby-identifier'>remainder</span>(<span class='ruby-value'>13731</span>)      <span class='ruby-comment'>#=&gt; -6966</span>
<span class='ruby-value'>-1234567890987654321</span>.<span class='ruby-identifier'>remainder</span>(<span class='ruby-value'>13731.24</span>)   <span class='ruby-comment'>#=&gt; -9906.22531493148</span>
</pre>

<div class='method-heading'>
            <span class='method-callseq'>coerce(numeric)  &rarr;  array</span>
            </div>
            
                <p>Returns an array with both a <code>numeric</code> and a <code>big</code>
represented as <a href='Bignum.html'>Bignum</a> objects.</p>

<p>This is achieved by converting <code>numeric</code> to a <a
href='Bignum.html'>Bignum</a>.</p>

<p>A <a href='TypeError.html'>TypeError</a> is raised if the
<code>numeric</code> is not a <a href='Fixnum.html'>Fixnum</a> or <a
href='Bignum.html'>Bignum</a> type.</p>

<pre class='ruby'>(<span class='ruby-value'>0x3FFFFFFFFFFFFFFF</span><span class='ruby-operator'>+</span><span class='ruby-value'>1</span>).<span class='ruby-identifier'>coerce</span>(<span class='ruby-value'>42</span>)   <span class='ruby-comment'>#=&gt; [42, 4611686018427387904]</span>
</pre>


          <div class='method-heading'>
            <span class='method-callseq'>div(other)  &rarr; integer</span>
            </div>
            
            
            <p>Performs integer division: returns integer value.</p>
            
            <div class='method-heading'>
            <span class='method-callseq'>divmod(numeric)   &rarr; array</span>
            </div>
            
            <p>See <code>Numeric#divmod</code>.</p>
            
            <div class='method-heading'>
            <span class='method-callseq'>eql?(obj)   &rarr; true or false</span>
            </div>
            
              <p>Returns <code>true</code> only if <em>obj</em> is a <code>Bignum</code>
with the same value as <em>big</em>. Contrast this with
<code>Bignum#==</code>, which performs type conversions.</p>

<pre class='ruby'><span class='ruby-value'>68719476736</span>.<span class='ruby-identifier'>eql?</span>(<span class='ruby-value'>68719476736.0</span>)   <span class='ruby-comment'>#=&gt; false</span>
</pre>

<div class='method-heading'>
            <span class='method-callseq'>even? &rarr; true or false</span>
            </div>

 <p>Returns <code>true</code> if <em>big</em> is an even number.</p>
 
  
          <div class='method-heading'>
            <span class='method-callseq'>fdiv(numeric) &rarr; float</span>
            </div>
            
             <p>Returns the floating point result of dividing <em>big</em> by
<em>numeric</em>.</p>

<pre class='ruby'><span class='ruby-value'>-1234567890987654321</span>.<span class='ruby-identifier'>fdiv</span>(<span class='ruby-value'>13731</span>)      <span class='ruby-comment'>#=&gt; -89910996357705.5</span>
<span class='ruby-value'>-1234567890987654321</span>.<span class='ruby-identifier'>fdiv</span>(<span class='ruby-value'>13731.24</span>)   <span class='ruby-comment'>#=&gt; -89909424858035.7</span>
</pre>

<div class='method-heading'>
            <span class='method-callseq'>hash   &rarr; fixnum</span>
            </div>
            
            <p>Compute a hash based on the value of <em>big</em>.</p>

<p>See also <a href='Object.html#method-i-hash'>Object#hash</a>.</p>

 <div class='method-heading'>
            <span class='method-callseq'>magnitude &rarr; aBignum</span>
            </div>
            
              <p>Returns the absolute value of <em>big</em>.</p>

<pre class='ruby'><span class='ruby-value'>-1234567890987654321</span>.<span class='ruby-identifier'>abs</span>   <span class='ruby-comment'>#=&gt; 1234567890987654321</span>
</pre>

 <div class='method-heading'>
            <span class='method-callseq'>modulo(other)   &rarr; Numeric</span>
            </div>
            
             <p>Returns big modulo other. See <a
href='Numeric.html#method-i-divmod'>Numeric#divmod</a> for more
information.</p>
            
            <div class='method-heading'>
            <span class='method-callseq'>odd? &rarr; true or false</span>
            </div>
            
            <p>Returns <code>true</code> if <em>big</em> is an odd number.</p>
            
            <div class='method-heading'>
            <span class='method-callseq'>remainder(numeric)    &rarr; number</span>
            </div>
            
            p>Returns the remainder after dividing <em>big</em> by <em>numeric</em>.</p>

<pre class='ruby'><span class='ruby-value'>-1234567890987654321</span>.<span class='ruby-identifier'>remainder</span>(<span class='ruby-value'>13731</span>)      <span class='ruby-comment'>#=&gt; -6966</span>
<span class='ruby-value'>-1234567890987654321</span>.<span class='ruby-identifier'>remainder</span>(<span class='ruby-value'>13731.24</span>)   <span class='ruby-comment'>#=&gt; -9906.22531493148</span>
</pre>

 <div class='method-heading'>
            <span class='method-callseq'>size &rarr; integer</span>
            </div>
            
             <p> Returns the number of bytes in the machine representation of <em>big</em>.</p>

<pre class='ruby'>(<span class='ruby-value'>256</span><span class='ruby-operator'>**</span><span class='ruby-value'>10</span> <span class='ruby-operator'>-</span> <span class='ruby-value'>1</span>).<span class='ruby-identifier'>size</span>   <span class='ruby-comment'>#=&gt; 12</span>
(<span class='ruby-value'>256</span><span class='ruby-operator'>**</span><span class='ruby-value'>20</span> <span class='ruby-operator'>-</span> <span class='ruby-value'>1</span>).<span class='ruby-identifier'>size</span>   <span class='ruby-comment'>#=&gt; 20</span>
(<span class='ruby-value'>256</span><span class='ruby-operator'>**</span><span class='ruby-value'>40</span> <span class='ruby-operator'>-</span> <span class='ruby-value'>1</span>).<span class='ruby-identifier'>size</span>   <span class='ruby-comment'>#=&gt; 40</span>
</pre>

<div class='method-heading'>
            <span class='method-callseq'>to_f &rarr; float</span>
            </div>
            
            <p>Converts <em>big</em> to a <code>Float</code>. If <em>big</em> doesn’t fit
in a <code>Float</code>, the result is infinity.</p>

<div class='method-heading'>
            <span class='method-callseq'>to_s(base=10)   &rarr;  string</span>
            </div>
            
            <p>Returns a string containing the representation of <em>big</em> radix
<em>base</em> (2 through 36).</p>

<pre class='ruby'><span class='ruby-value'>12345654321</span>.<span class='ruby-identifier'>to_s</span>         <span class='ruby-comment'>#=&gt; &quot;12345654321&quot;</span>
<span class='ruby-value'>12345654321</span>.<span class='ruby-identifier'>to_s</span>(<span class='ruby-value'>2</span>)      <span class='ruby-comment'>#=&gt; &quot;1011011111110110111011110000110001&quot;</span>
<span class='ruby-value'>12345654321</span>.<span class='ruby-identifier'>to_s</span>(<span class='ruby-value'>8</span>)      <span class='ruby-comment'>#=&gt; &quot;133766736061&quot;</span>
<span class='ruby-value'>12345654321</span>.<span class='ruby-identifier'>to_s</span>(<span class='ruby-value'>16</span>)     <span class='ruby-comment'>#=&gt; &quot;2dfdbbc31&quot;</span>
<span class='ruby-value'>78546939656932</span>.<span class='ruby-identifier'>to_s</span>(<span class='ruby-value'>36</span>)  <span class='ruby-comment'>#=&gt; &quot;rubyrules&quot;</span>
</pre>

 <div class='method-heading'>
            <span class='method-callseq'>big | numeric   &rarr;  integer</span>
            </div>
            <p>Performs bitwise <code>or</code> between <em>big</em> and <em>numeric</em>.</p>
            
             <div class='method-heading'>
            <span class='method-callseq'>~big  &rarr;  integer</span>
            </div>
            
              
            <p>Inverts the bits in big. As Bignums are conceptually infinite length, the
result acts as if it had an infinite number of one bits to the left. In hex
representations, this is displayed as two periods to the left of the
digits.</p>

<pre class='ruby'><span class='ruby-identifier'>sprintf</span>(<span class='ruby-string'>&quot;%X&quot;</span>, <span class='ruby-operator'>~</span><span class='ruby-value'>0x1122334455</span>)    <span class='ruby-comment'>#=&gt; &quot;..FEEDDCCBBAA&quot;</span>
</pre>


            
            
              </div><!-- description -->
 ")
