# APIcurious - GitHub Dashboard Reconstruction

## Overview

This project uses the GitHub API to implement a 3rd party app that uses OAuth 2.0 to log users in via GitHub and to consume their data to display a similar looking dashboard.

## Dependencies

The gems used for this project can be found in the Gemfile. Additionally, this application assumes that the user has access to their personal GitHub account.

## Testing

The test suite can be run from the main project directory by running the `rspec` command. It uses the [VCR gem](https://github.com/vcr/vcr) to record the API responses that load the main dashboard.
