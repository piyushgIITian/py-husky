from setuptools import setup
from setuptools.command.install import install
from setuptools.command.develop import develop
import subprocess
from pathlib import Path


class PostInstallCommand(install):
    """Post-installation for installation mode."""
    def run(self):
        install.run(self)
        self._post_install()

    def _post_install(self):
        """Run py-husky install if .py-husky directory exists"""
        try:
            cwd = Path.cwd()
            husky_dir = cwd / ".py-husky"
            git_dir = cwd / ".git"

            if husky_dir.exists() and git_dir.exists():
                print("\n" + "="*50)
                print("🐶 py-husky: Auto-installing Git hooks...")
                print("="*50)

                result = subprocess.run(
                    ["python", "-m", "py_husky.cli", "install"],
                    capture_output=True,
                    text=True
                )

                if result.returncode == 0:
                    print("✅ Git hooks installed automatically!")
                    print("   Your hooks are ready to use.")
                else:
                    print("ℹ️  Run 'py-husky install' to set up hooks")

                print("="*50 + "\n")
        except Exception:
            pass


class PostDevelopCommand(develop):
    """Post-installation for development mode."""
    def run(self):
        develop.run(self)
        self._post_install()

    def _post_install(self):
        """Run py-husky install if .py-husky directory exists"""
        try:
            cwd = Path.cwd()
            husky_dir = cwd / ".py-husky"
            git_dir = cwd / ".git"

            if husky_dir.exists() and git_dir.exists():
                print("\n" + "="*50)
                print("🐶 py-husky: Auto-installing Git hooks...")
                print("="*50)

                result = subprocess.run(
                    ["python", "-m", "py_husky.cli", "install"],
                    capture_output=True,
                    text=True
                )

                if result.returncode == 0:
                    print("✅ Git hooks installed automatically!")
                    print("   Your hooks are ready to use.")
                else:
                    print("ℹ️  Run 'py-husky install' to set up hooks")

                print("="*50 + "\n")
        except Exception:
            pass


setup(
    cmdclass={
        'install': PostInstallCommand,
        'develop': PostDevelopCommand,
    },
)
