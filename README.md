In this repository, I've added all interview-related demo code along with detailed descriptions. So far, I've covered LWC, Apex controllers, Apex triggers, and batch Apex. If you need help starting from scratch, feel free to check out my GitHub repository for guidance.


# Push Code
  1) first need to create a scratch org: sf org create scratch -d -f config/project-scratch-def.json -a dreamhouse-org
  2) push the code in local org: sfdx force:source:push -f
  3) if you want to delete the existing org: sfdx force:org:delete
  4) if you want to take a pull from your local scratch org: sfdx force:org:pull

# ChartJS Salesforce Project LWC

![image](https://github.com/user-attachments/assets/984d51d1-812c-4078-a967-e3dc2030a579)


# Salesforce DX Project: Next Steps

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
