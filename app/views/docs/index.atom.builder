atom_feed(
  :language => 'ja-JP',
  'xmlns:app' => 'http://www.w3.org/2007/app',
  'xmlns:openSearch' => 'http://a9.com/-/spec/opensearch/1.1/'
) do |feed|
  feed.title("p0t")
  feed.updated(@docs.first.updated_at)

  @docs.each do |d|
    feed.entry(d) do |entry|
      entry.title(d.title)
      entry.content(d.body.to_s, :type => "html")
      entry.author do |a|
        a.name("komagata")
      end
    end
  end
end
