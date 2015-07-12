class Heroku::Command::Base
  alias :original_git_remotes :git_remotes

  def git_remotes(base_dir=Dir.pwd)
    remotes = original_git_remotes(base_dir) || {}
    Dir.chdir(base_dir) do
      return unless File.exists?('.git')

      git('remote -v').split(/\n/).each do |line|
        remote, url = line.split
        without_git = url.gsub(/\Agit@/, '').gsub(/\.git\Z/, '')

        next unless match_data = without_git.match(/\A(.+):([^:]+)\Z/)
        host, app = match_data[1..2]

        if host =~ /\Ahe(?:roku)?(?:[-.]\w+)?\Z/
          remotes[remote] = app
        end
      end
    end
    remotes
  end
end
