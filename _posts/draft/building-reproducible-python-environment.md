---
title: "Building a Reproducible Python Environment for Research and Teaching"
subtitle: "How to create clean, portable, and reproducible Python setups on macOS and Linux using pyenv, venv, and conda"
tags: [python, reproducibility, macos, linux, pyenv, conda, research, teaching]
date: 2025-10-04
layout: post
---

# 1. Introduction: Why Reproducibility Matters

One of the most underestimated aspects of scientific computing is the stability of the environment.  
A research project may run perfectly on one machine and fail completely on another due to a subtle mismatch in Python versions or dependencies.  
In teaching, this problem multiplies — every student’s setup becomes slightly different, and reproducibility quickly fades away.

In this article, we’ll build **clean and reproducible Python environments** for both research and education using three complementary tools:

- **pyenv**, for managing multiple Python versions cleanly  
- **venv**, the built-in virtual environment system included in Python  
- **conda**, for scientific projects and reproducibility at scale  

We’ll focus on **macOS and Linux**, but the principles apply universally.  
By the end, you’ll have a workflow that is robust, shareable, and fully version-controlled.

---

# 2. Managing Python Versions with pyenv

## 2.1 Why pyenv?

macOS and Linux both include a system Python tied to the operating system.  
Installing packages globally can break system tools or create unpredictable conflicts.  
`pyenv` solves this by letting you install and switch between multiple Python versions under your control, without touching the system interpreter.

## 2.2 Installation via Homebrew

```bash
brew update
brew install pyenv
```

Add this to your shell configuration file (for example, `~/.zshrc`):

```bash
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
```

Restart your terminal, then install and activate a version:

```bash
pyenv install 3.12.6
pyenv global 3.12.6
```

Check your setup:

```bash
python --version
```

---

# 3. Creating Isolated Environments with venv

## 3.1 Why use venv

Once you have a clean Python interpreter from `pyenv`, you can create isolated environments for each project using `venv`.  
This is the **simplest and most standard approach**: it avoids extra layers of abstraction and ensures compatibility across platforms.

```bash
python -m venv .venv
source .venv/bin/activate
```

Now any package you install will live inside `.venv`, isolated from the system and other projects.

Deactivate it anytime with:

```bash
deactivate
```

and remove it safely by deleting the `.venv` folder.

## 3.2 Keeping It Reproducible

```bash
pip freeze > requirements.txt
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

## 3.3 Managing venv with pyenv Plugins

`pyenv` supports plugins like [`pyenv-virtualenv`](https://github.com/pyenv/pyenv-virtualenv), which integrate environment creation directly into pyenv:

```bash
brew install pyenv-virtualenv
pyenv virtualenv 3.12.6 myproject
pyenv activate myproject
```

---

# 4. Using conda for Scientific and Reproducible Environments

## 4.1 Installing Miniforge

```bash
brew install miniforge
```

or manually:

```bash
curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh
bash Miniforge3-MacOSX-arm64.sh
```

## 4.2 Creating and Managing Environments

```bash
conda create -n research python=3.12
conda activate research
conda install numpy pandas matplotlib scikit-learn
```

## 4.3 Exporting and Recreating Environments

```bash
conda env export > environment.yml
```

Edit the YAML to make it portable:

```yaml
name: research
dependencies:
  - python=3.12
  - numpy=2.0
  - pandas=2.2
  - matplotlib
  - scikit-learn
```

Recreate it anywhere:

```bash
conda env create -f environment.yml
```

## 4.4 Keeping Environments Stable

```bash
conda config --add channels conda-forge
conda config --set channel_priority strict
```

Avoid `conda update --all` and always pin versions for reproducibility.

---

# 5. Managing Multiple Python Versions

## 5.1 With pyenv

```bash
pyenv install --list
pyenv install 3.10.14
pyenv install 3.12.6
pyenv global 3.12.6
pyenv local 3.10.14
```

## 5.2 With conda

```bash
conda create -n py310 python=3.10
conda create -n py312 python=3.12
conda activate py310
conda deactivate
conda activate py312
```

## 5.3 Choosing Between Them

- **pyenv** → for global interpreter control and lightweight `venv` usage.  
- **conda** → for complex dependencies and project-level environments.

---

# 6. Using Both pyenv and conda on the Same Mac

## 6.1 Interaction

- pyenv controls system-wide interpreters.  
- conda uses its own Python builds inside environments.

When conda is active, it takes priority in your PATH — which is expected and safe.

## 6.2 Best Practices

1. Install pyenv first, then conda.  
2. Keep them separate: pyenv for scripts, conda for science.  
3. Never activate both simultaneously.  
4. Verify active interpreter:

```bash
which python
```

Optional shell config:

```bash
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
fi
```

## 6.3 When to Use Both

For advanced users, having both makes sense:  
use **pyenv + venv** for teaching and scripting, and **conda** for research workflows requiring compiled packages.

---

# 7. Final Checklist for Reproducibility

- Save `requirements.txt` or `environment.yml`  
- Include `.python-version` if using pyenv  
- Document setup steps in `README.md`  
- Track changes with Git  

---

# 8. Conclusion

By combining **pyenv**, **venv**, and **conda**, you can maintain clean, isolated, and reproducible environments that work consistently across systems and collaborators.  
This layered approach — light where possible, robust where necessary — ensures that your code remains **portable, reliable, and reproducible**, both in research and teaching.

