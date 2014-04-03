# heroku-alternative-urls

Tries harder to recognize git remotes as heroku apps.

## Explanation

I tend to make lots of SSH config entries so I can type URLs faster.  E.g. I
use `he` to mean `git@heroku.com`.  But, the heroku gem can't parse
`he:purple-rain-618` to mean `git@heroku.com:purple-rain-618.git`.  This plugin
adds that ability.

## Installation

    heroku plugins:install https://github.com/benizi/heroku-alternative-urls

## Examples

Anything that looks like the following will be recognized as a heroku app when
you install this plugin:

    git@heroku.com:(name).git
    git@he-accountname:(name).git    # for use with heroku-accounts
    git@heroku-accountname:(name).git    # for use with heroku-accounts
    git@he:(name).git

The leading `git@` is optional.  Concrete example:

    remote url:  heroku.benizi:purple-rain-618.git
    app name:                  purple-rain-618
