# 0x0F. Load Balancer

## DevOps SysAdmin

### Background Context

In this project, you'll work with load balancers, specifically focusing on configuring HAProxy. Load balancers distribute incoming network traffic across multiple servers to ensure high availability and reliability by avoiding overloading any single server.

### Resources

To help you with this project, here are some useful resources:

1. [An Introduction to HAProxy and Load Balancing Concepts - DigitalOcean](https://www.digitalocean.com/community/tutorials/an-introduction-to-haproxy-and-load-balancing-concepts)
2. [HTTP Header - Techopedia](https://www.techopedia.com/definition/27178/http-header)
3. [HAProxy Documentation - Debian](https://haproxy.debian.net/#distribution=Ubuntu&release=bionic&version=2.7)
4. [Redundancy (Engineering) - Wikipedia](https://en.wikipedia.org/wiki/Redundancy_%28engineering%29)
5. [ShellCheck Wiki: SC2154](https://github.com/koalaman/shellcheck/wiki/SC2154)
6. [Set Hostname - AWS EC2 User Guide](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/set-hostname.html)

### Requirements

- Ensure HAProxy is correctly installed and configured on your system.
- Review and modify configuration files as needed to set up HAProxy for load balancing.
- Validate the configuration to avoid service failures.
- Check ports and other potential conflicts that may affect HAProxy.

### Installation and Configuration

1. **Install HAProxy:**
   ```bash
   sudo apt-get update
   sudo apt-get install haproxy 
