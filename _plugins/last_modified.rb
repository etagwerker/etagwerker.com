# Adds last_modified_at to pages and posts based on git history
Jekyll::Hooks.register :site, :post_read do |site|
  site.pages.each do |page|
    relative_path = page.relative_path
    next unless relative_path

    Dir.chdir(site.source) do
      git_date = `git log -1 --format="%ci" -- "#{relative_path}" 2>/dev/null`.strip

      if git_date && !git_date.empty?
        page.data['last_modified_at'] = Time.parse(git_date)
      end
    end
  end
end
