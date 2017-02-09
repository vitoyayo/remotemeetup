# Remote Meetup

This is the rails web application for RemoteMeetup community activities.

The roadmap and specifications for this project are still under consideration.

## Development

- clone
- `bundle install`
- `rake db:setup`
- `spring server`
- `rails s`
- open in browser
- code
- reload browser

Notes:

- the default `.env` specify a local sqlite3 db. Staging and production environments will use Postgresql 9.3
- the `SLACK_TOKEN` is only useful in capistrano if you have deployment privileges, to announce deployments on our slack `#announces` channel

## Contribute

- fork, branch, send a PR for contributions
- open issues for bug reports, feature requests, ideas suggestions
- join [remotemeetup slack group](http://remotemeetup.herokuapp.com/) for interactive contact with the people

## License

[MIT](LICENSE)

## Copyright

(c) Copyright 2016-... the-committers-of-the-remote-meetup-repository, see [AUTHORS](AUTHORS) for an exhaustive list
