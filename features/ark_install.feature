Feature: Ark Resource - Install

  Scenario:
    When I converge the recipe "ark_spec::install"

    Then I expect the ark resource, "test_install", to install

    And the directory resource, "/usr/local/test_install-2", to be created
    And for that resource to notify the execute resource, "unpack /var/chef/cache/test_install-2.tar.gz" to run

    And the remote file resource, "/var/chef/cache/test_install-2.tar.gz", to be created
    And for that resource to notify the execute resource, "unpack /var/chef/cache/test_install-2.tar.gz" to run

    And the execute resource, "unpack /var/chef/cache/test_install-2.tar.gz", to not run
    But for that resource to notify the execute resource, "set owner on /usr/local/test_install-2" to run

    And the execute resource, "set owner on /usr/local/test_install-2", to not run

    And the template resource, "/etc/profile.d/test_install.sh", to not create
    And the ruby block resource, "adding '/usr/local/test_install-2/bin' to chef-client ENV['PATH']", to not run