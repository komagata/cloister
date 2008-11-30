atom_feed(:language => "ja-JP") do |feed|
  feed.title(@title)
  feed.updated(@docs.first.updated_at)

  @docs.each do |d|
    feed.entry(d) do |entry|
      entry.title(d.title)
      entry.content(textilize(d.body), :type => "html")
      entry.author do |a|
        a.name(d.author)
      end
    end
  end
end
