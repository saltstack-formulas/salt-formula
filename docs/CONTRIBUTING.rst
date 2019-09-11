.. _contributing:

How to contribute
=================

This document will eventually outline all aspects of guidance to make your contributing experience a fruitful and enjoyable one.
What it already contains is information about *commit message formatting* and how that directly affects the numerous automated processes that are used for this repo.
It also covers how to contribute to this *formula's documentation*.

.. contents:: **Table of Contents**

Overview
--------

Submitting a pull request is more than just code!
To achieve a quality product, the *tests* and *documentation* need to be updated as well.
An excellent pull request will include these in the changes, wherever relevant.

Commit message formatting
-------------------------

Since every type of change requires making Git commits,
we will start by covering the importance of ensuring that all of your commit
messages are in the correct format.

Automation of multiple processes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This formula uses `semantic-release <https://github.com/semantic-release/semantic-release>`_ for automating numerous processes such as bumping the version number appropriately, creating new tags/releases and updating the changelog.
The entire process relies on the structure of commit messages to determine the version bump, which is then used for the rest of the automation.

Full details are available in the upstream docs regarding the `Angular Commit Message Conventions <https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#-git-commit-guidelines>`_.
The key factor is that the first line of the commit message must follow this format:

.. code-block::

   type(scope): subject


* E.g. ``docs(contributing): add commit message formatting instructions``.

Besides the version bump, the changelog and release notes are formatted accordingly.
So based on the example above:

..

   .. raw:: html

      <h3>Documentation</h3>

   * **contributing:** add commit message formatting instructions


* The ``type`` translates into a ``Documentation`` sub-heading.
* The ``(scope):`` will be shown in bold text without the brackets.
* The ``subject`` follows the ``scope`` as standard text.

Linting commit messages in Travis CI
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This formula uses `commitlint <https://github.com/conventional-changelog/commitlint>`_ for checking commit messages during CI testing.
This ensures that they are in accordance with the ``semantic-release`` settings.

For more details about the default settings, refer back to the ``commitlint`` `reference rules <https://conventional-changelog.github.io/commitlint/#/reference-rules>`_.

Relationship between commit type and version bump
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This formula applies some customisations to the defaults, as outlined in the table below,
based upon the `type <https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#type>`_ of the commit:

.. list-table::
   :name: commit-type-vs-version-bump
   :header-rows: 1
   :stub-columns: 0
   :widths: 1,2,3,1,1

   * - Type
     - Heading
     - Description
     - Bump (default)
     - Bump (custom)
   * - ``build``
     - Build System
     - Changes related to the build system
     - –
     -
   * - ``chore``
     - –
     - Changes to the build process or auxiliary tools and libraries such as
       documentation generation
     - –
     -
   * - ``ci``
     - Continuous Integration
     - Changes to the continuous integration configuration
     - –
     -
   * - ``docs``
     - Documentation
     - Documentation only changes
     - –
     - 0.0.1
   * - ``feat``
     - Features
     - A new feature
     - 0.1.0
     -
   * - ``fix``
     - Bug Fixes
     - A bug fix
     - 0.0.1
     -
   * - ``perf``
     - Performance Improvements
     - A code change that improves performance
     - 0.0.1
     -
   * - ``refactor``
     - Code Refactoring
     - A code change that neither fixes a bug nor adds a feature
     - –
     - 0.0.1
   * - ``revert``
     - Reverts
     - A commit used to revert a previous commit
     - –
     - 0.0.1
   * - ``style``
     - Styles
     - Changes that do not affect the meaning of the code (white-space,
       formatting, missing semi-colons, etc.)
     - –
     - 0.0.1
   * - ``test``
     - Tests
     - Adding missing or correcting existing tests
     - –
     - 0.0.1

Use ``BREAKING CHANGE`` to trigger a ``major`` version change
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Adding ``BREAKING CHANGE`` to the footer of the extended description of the commit message will **always** trigger a ``major`` version change, no matter which type has been used.
This will be appended to the changelog and release notes as well.
To preserve good formatting of these notes, the following format is prescribed:

* ``BREAKING CHANGE: <explanation in paragraph format>.``

An example of that:

.. code-block:: git

   ...

   BREAKING CHANGE: With the removal of all of the `.sls` files under
   `template package`, this formula no longer supports the installation of
   packages.

