## Configuration Drift Prevention
To prevent configuration drift on Linux servers, consider implementing the following strategies:
1. **Version Control**: Use version control systems (e.g., Git) to manage configuration files. This allows you to track changes and revert to previous versions if necessary.
2. **Configuration Management Tools**: Utilize configuration management tools like Ansible, Puppet, or Chef to automate the deployment and management of configurations across multiple servers.
3. **Regular Audits**: Schedule regular audits of server configurations to ensure they match the
desired state. Tools like OpenSCAP or Lynis can help automate this process.
4. **Immutable Infrastructure**: Adopt an immutable infrastructure approach where servers are not modified after deployment
. Instead, new configurations are applied by redeploying servers with the updated settings.
5. **Monitoring and Alerts**: Implement monitoring solutions that can detect configuration changes and send alerts

# Updated Provision LAMP stack provision script to be idempotent
- To avoid re-installation if the software is already present
- Ensure services are only installed if missing
- Run Vagrant provison
- Reload VM if any changes has occured within the Vagrant file

## Vagrant Provisioning Commands and when to use
---------------------------------------------------------------------------
| Change type                              | Command                      |
| ---------------------------------------- | ---------------------------- |
| Provisioning logic only                  | `vagrant provision`          |
| VM settings (network, CPU, RAM, folders) | `vagrant reload --provision` |
| VM is off                                | `vagrant up --provision`     |
