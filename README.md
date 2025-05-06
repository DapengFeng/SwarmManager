# SwarmManager

> [!TIP]
> This repository provides a collection of Bash scripts designed to streamline swarm management for distributed services or containerized applications.

## Setup

### Prerequisites
- **ssh**: Ensure SSH is installed and running on both local and remote machines.
  ``` bash
  sudo apt install openssh-server
  ```
- **wakeonlan**: A tool to wake up remote machines using Wake-on-LAN (WoL) technology. Install it on your local machine using:
  ``` bash
  sudo apt install wakeonlan
  ```
- **git**: Ensure Git is installed on your local machine.
  ``` bash
  sudo apt install git
  ```
- **yq**: A lightweight and portable command-line YAML processor. Install it on your local machine using:
  ``` bash
  sudo snap install yq
  ```

1. Local Machine:
  - Generate a SSH Key Pair 
    ``` bash
    ssh-keygen
    ```
  - Copy the public key to the remote machine
    ``` bash
    ssh-copy-id user@remote_machine
    ```
   

2. Remote Machine:
  - Enable automatic login (optional)
    - Open the terminal and run:
      ``` bash
      sudo nano /etc/gdm3/custom.conf
      ```
    - Add or modify the following lines under the [daemon] section: 
      ``` ini
      [daemon]
      AutomaticLoginEnable=True
      AutomaticLogin=user1
      ```
      Replace `user1` with your actual username. 
    - Restart GDM
      ``` bash
      sudo systemctl restart gdm3
      ```

## Usage

1. Clone the repository:
  ``` bash
  git clone https://github.com/DapengFeng/SwarmManager.git
  cd SwarmManager
  ```

2. Modify the config file:
  - Open the `config/config.yaml` file in a text editor.
  - Update the `ip`, `mac`, and `username` fields with the appropriate values for your setup.

3. Boost up the remote machines:
  ``` bash
  ./script/power_on.sh
  ```

4. Run a command on the remote machines:
  ``` bash
  ./script/terminal.sh cmd
  ```
  Replace `cmd` with the command you want to execute on the remote machines. For example, to check the system information, you can use:
  ``` bash
  ./script/terminal.sh "uname -a"
  ```
  This will execute the command on all remote machines listed in the `config/config.yaml` file.
  The output will be displayed in the remote terminal.

5. Power off the remote machines:
  ``` bash
  ./script/power_off.sh password
  ```
