class Heroku::Command::Base
  alias :original_git_remotes :git_remotes

  def git_remotes(base_dir=Dir.pwd)
    remotes = original_git_remotes(base_dir)
    Dir.chdir(base_dir) do
      return unless File.exists?('.git')

      git('remote -v').split(/\n/).each do |line|
        name, url, method = line.split
        if url =~ /^(?:git@)?he(?:roku\.com|-\w+)?:([\w\d-]+)(?:\.git)?$/
          remotes[name] = $1
        end
      end
    end
    remotes
  end
end
