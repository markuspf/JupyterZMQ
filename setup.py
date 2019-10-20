#!/usr/bin/env python

# Based on https://jupyter-notebook.readthedocs.io/en/stable/examples/Notebook/Distributing%20Jupyter%20Extensions%20as%20Python%20Packages.html#Automatically-enabling-a-server-extension-and-nbextension

import setuptools, sys
from setuptools.command.bdist_egg import bdist_egg

class bdist_egg_disabled(bdist_egg):
    """Disabled version of bdist_egg
    Prevents setup.py install performing setuptools' default easy_install,
    which it should never ever do.
    """
    def run(self):
        sys.exit("Aborting implicit building of eggs. Use `pip install .` to install from source.")

setuptools.setup(
    name="gap-jupyter",
    include_package_data=True,
    cmdclass={
        "bdist_egg": bdist_egg_disabled,
    },
    data_files=[
        # like `jupyter nbextension install --sys-prefix`
        ("share/jupyter/nbextensions/gap-mode", [
            "etc/gap-mode/gap.js",
            "etc/gap-mode/main.js",
        ]),
        # like `jupyter nbextension enable --sys-prefix`
        ("etc/jupyter/nbconfig/notebook.d", [
            "etc/gap-mode.json"
        ]),
        # install kernel spec
        ("share/jupyter/kernels/gap-4", [
            "etc/jupyter/kernel.json",
            "etc/jupyter/logo-32x32.png",
            "etc/jupyter/logo-64x64.png",
        ]),
    ],
    # install the script
    scripts=['bin/jupyter-kernel-gap'],
    zip_safe=False,
    # Require notebook>=5.3 for automatically enabling the nbextension
    install_requires=['notebook>=5.3'],
)
