---
title: "Using iPad as a Python Development Client with Mac, Tailscale, and VS Code"
date: 2025-09-27
tags: [iPad, macOS, Tailscale, VSCode, Blink, RemoteDevelopment]
permalink: /blog/ipad-remote-workflow/
---

## Introduction
With **iPadOS 26**, Apple has pushed the iPad closer to being a true productivity device. The new multitasking capabilities, better keyboard support, and a more powerful Safari engine (with extended PWA and WebAssembly features) have unlocked possibilities that were not feasible before.  


Yet, when it comes to **software development**, the iPad still falls short. You cannot freely install Python packages, run full IDEs, or access a native terminal environment. The solution is to treat the iPad as a **lightweight client** and delegate the heavy lifting to a proper development machine — in my case, my **Mac at home**.  
<!--more-->

In this post I’ll describe the workflow I implemented to make this possible: the Mac acts as a full-featured development server, while the iPad connects securely through **Tailscale**. On top of that connection, I can choose between two main approaches: a lightweight **Blink/Blink Code** setup for quick edits, or a **VS Code Remote Tunnel** session for a complete IDE experience. Addictionaly you can enable screen sharing on your manc ed use a fullVNC client from iPad to connect.



## Workflow Architecture

The architecture is straightforward:  

- The **Mac stays on at home**, running Python, Conda, and VS Code.  
- The **iPad connects via Tailscale**, which places both devices in the same private VPN.  
- On the iPad, I can:  
  - Use **Blink / Blink Code** for terminal and quick file edits.  
  - Launch **VS Code Tunnel** and connect via [vscode.dev](https://vscode.dev) for a full IDE.
  - Optionally use a VNC Client if you need your full mac enviromental on the go


## Preparing the Mac

### Enabling SSH access

The first step is enabling SSH access. From **System Settings > General > Sharing**, I enabled *Remote Login*. Then I configured the `~/.ssh/authorized_keys` file to include the public key generated directly in Blink on the iPad, so I can log in without typing my macOS password each time. Create the SSH folder and authorized keys file if they don’t exist:

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
nano ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

Paste here the public key generated from Blink (iPad).

### Install tools

Next, I installed **Tailscale** with [Homebrew](https://brew.sh), tht it is the easiest way to install and manage development tools on macOS. and logged in with my account. The Mac was automatically assigned a private IP address (`100.x.y.z`) reachable only inside the Tailscale network. To prevent the machine from sleeping, I installed **Caffeine**, though Amphetamine or even the built-in `caffeinate -dimsu` command would work just as well.  

Finally, I added **Mosh** and **tmux**. Mosh allows stable connections even if the network changes (for instance, switching from Wi-Fi to 5G), while tmux lets me detach and resume sessions without losing state.

```bash
brew update

# --- Network & Remote Access ---
brew install --cask tailscale    # Secure VPN with WireGuard
brew install mosh                # Stable SSH replacement
brew install tmux                # Persistent terminal sessions

# --- Development Tools ---
brew install git                 # Version control
brew install --cask visual-studio-code  # VS Code app

# --- Utilities ---
brew install --cask caffeine     # Prevents Mac from sleeping
```

You can check everything is working by running:

```bash
tailscale version
mosh --version
tmux -V
code --version
```

### Setting up Tailscale

Once Tailscale is installed, start it and login with your Google account or Github account, you can find Tailscale app in your application folder and once opened in the mac menubar. If everything is set up fine then

```bash
tailscale ip
```

it will show you up the ip address assigned by Tailscale. It should look like 100.x.y.z. This is the address you’ll use to connect from the iPad.

### Optional stuff:

You can prevent macOS from sleeping using Caffeine (a menubar app).
Once launched, click the coffee cup icon — the Mac stays awake indefinitely.

Alternatively, from Terminal:

```bash
caffeinate -dimsu
```
This keeps the machine awake as long as the process is running.

Mosh replaces SSH for more reliable terminal connections.
tmux allows you to detach and reattach to sessions easily.


## Configuring the iPad

On the iPad, I installed the **Tailscale app** and logged in with the same account. Now the iPad and Mac are on the same virtual LAN.  

For terminal access, I rely on **Blink**. For quick edits I use **Blink Code**, which provides an editor with SFTP integration plus an embedded terminal. My `~/.ssh/config` is set up like this:

```bash
Host macbook
    HostName 100.x.y.z
    User myuser
    IdentityFile ~/.ssh/id_ed25519
    ServerAliveInterval 60
```

Connect with:

```bash
ssh macbook
```

or use mosh:
```bash
mosh --server=/opt/homebrew/bin/mosh-server macbook
```

Once connected, you can open tmux sessions or launch your Python projects directly or to whatever you want!

## VS Code Tunnel and vscode.dev

This is the core of our configuration. When I need a full IDE, I rely on VS Code Tunnel on mac and Vs Code server via web

On the mac start the tunnel service:

```bash
code tunnel --accept-server-license-terms
```

This opens a secure tunnel accessible through vscode.dev and allow you to access to your code on Mac using only a browser and an internet connection.

On the iPad, open Safari, log in with your GitHub account, and select your active tunnel.
You’ll have a complete **VS Code IDE running** in your browser — including extensions, IntelliSense, debugging, and Jupyter notebooks.

## Remote Desktop Access

Sometimes, a graphical interface is helpful.
macOS includes **Screen Sharing (VNC)** by default. You can enable it under System Settings → General → Sharing → Screen Sharing, then set a VNC password.

On the iPad, I use Screens (by Edovia) to connect to my Mac’s Tailscale IP.
It’s smoother than plain VNC, supports shortcuts and gestures, and feels almost native.

Other good options include Jump Desktop (with the “Fluid” protocol) and RealVNC Viewer for a free alternative.

## Conclusion

With this setup, the iPad becomes a **professional-grade remote development client**.
Tailscale ensures a private and secure network, SSH and Mosh provide low-latency and reliable sessions, and Blink or VS Code Tunnel let you choose between a minimalist or full-featured workflow.

The result is flexibility: you can travel with only an iPad and still enjoy the power of your Mac at home. This configuration combines the portability of iPadOS with the completeness of a desktop environment — the perfect hybrid for modern Python development.

