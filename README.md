# sshhub [![Code Climate](https://codeclimate.com/github/mwerner/sshhub.png)](https://codeclimate.com/github/mwerner/sshhub)

sshhub is an easy way to authorize the keys of a github user on your machine.

````
$ sshhub authorize mwerner
Requesting keys for mwerner...
2 keys found:
 1)  ssh-rsa AAAAB3Nz ... 0QkUi8N3GtW8bWt
 2)  ssh-dss AAAAB3Nz ... voG4UfVujCJdkh=
 A)  Authorize all keys

Select a key to authorize: 2
Added ssh-rsa AAAAB3Nz ... voG4UfVujCJdkh= to authorized_keys
````

````
$ sshhub status mwerner
Requesting keys for mwerner...
2 keys found:
 ssh-rsa AAAAB3Nz ... 0QkUi8N3GtW8bWt
 ssh-dss AAAAB3Nz ... voG4UfVujCJdkh=

mwerner is authorized on this machine
````

````
$ sshhub revoke mwerner
Revoking all authorization for mwerner...
````

## Installation

    $ gem install sshhub

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sshhub/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
