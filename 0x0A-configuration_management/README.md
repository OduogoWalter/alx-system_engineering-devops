# 0x0A. Configuration Management

## Background Context

When I was working for SlideShare, I developed an auto-remediation tool called Skynet that monitored, scaled, and fixed Cloud infrastructure. I used a parallel job-execution system called MCollective, which allowed me to execute commands on one or multiple servers simultaneously. Actions could be applied to a selected set of servers by filtering based on the server’s hostname or other metadata (such as server type, server environment, etc.). However, a bug in my code sent `nil` to the filter method.

There were two pieces of bad news:
1. When MCollective receives `nil` as an argument for its filter method, it interprets this as ‘all servers’.
2. The action I sent was to terminate the selected servers.

I started the parallel job-execution and soon realized it was taking longer than expected. Upon checking the logs, I discovered that I had inadvertently shut down SlideShare’s entire document conversion environment. Approximately 75% of our conversion infrastructure servers were terminated, resulting in users being unable to convert their PDFs, PowerPoints, and videos. This was a significant issue!

Fortunately, with Puppet, we were able to restore our infrastructure to normal operation within an hour, which was quite impressive. Imagine if we had to manually launch the servers, configure and link them, import application code, start every process, and fix all the bugs—given the complexity of our infrastructure, it would have been a nightmare.

Although writing Puppet code for your infrastructure requires a significant investment of time and energy, it is undoubtedly a must-have in the long term.

[DevOps React Tweet](https://twitter.com/devopsreact/status/836971570136375296)

## Resources

1. [An Introduction to Configuration Management - DigitalOcean](https://www.digitalocean.com/community/tutorials/an-introduction-to-configuration-management)
2. [Puppet File Type Documentation](https://www.puppet.com/docs/puppet/5.5/types/file.html)
3. [Puppet Blog](https://www.puppet.com/blog)
4. [Puppet Lint](http://puppet-lint.com/)
5. [Puppet Mode GitHub Repository](https://github.com/voxpupuli/puppet-mode)


### Note on Versioning
Your Ubuntu 20.04 VM should have Puppet 5.5 preinstalled.

## Installation

### Install Puppet
To install Puppet, run the following commands:

```bash
$ apt-get install -y ruby=1:2.7+1 --allow-downgrades
$ apt-get install -y ruby-augeas
$ apt-get install -y ruby-shadow
$ apt-get install -y puppet
