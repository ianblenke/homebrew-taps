# ianblenke/taps

My customized Homebrew taps. Mostly for the latest versions of docker things, at the moment.

You will want either the `virtualbox`, `vmware-fusion`, or one of the other `docker-machine` driver dependencies installed first:

For that, try brew cask:

    brew install caskroom/cask/brew-cask

Now you can either:

    brew cask install virtualbox

Alternatively if you opt for paying for a license you can:

    brew cask install vmware-fusion

To use my homebrew taps, you can either:

    brew install ianblenke/taps/docker
    brew install ianblenke/taps/docker-compose
    brew install ianblenke/taps/docker-machine

or you can `brew tap` and install them as normal formulas:

    brew tap ianblenke/taps
    brew install docker docker-compose docker-machine

More information on `brew tap` can be found here:

- https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/brew-tap.md

Also, check the docker repos for more information on those packages:

- https://github.com/docker/docker
- https://github.com/docker/compose
- https://github.com/docker/machine

Enjoy!
