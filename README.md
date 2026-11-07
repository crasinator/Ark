# Ark Tracker

A terminal view of the ARK Invest trading desk. On startup it prints today's ARKK quote and the share totals from the bundled trade file, then waits for a menu choice.

[![Ark Tracker demo](arkExtra/arkScreen.gif)](https://youtu.be/e8SXu_aP5wY)

Live quotes and company names come from Yahoo Finance. Market cap comes from that ticker's Robinhood page. The buy and sell lists are not a live feed. They are read from `fixtures/arktrade5.xlsx`. That path is resolved from the app, so you can start it from any directory.

## Requirements

- Ruby 3.3 or newer. `roo` does not install on older Rubies. macOS system Ruby is 2.6 (`/usr/bin/ruby`) and cannot run this app.
- Bundler, which ships with Ruby 3.3.
- A network connection for the quote and Robinhood lookups.

Check which Ruby your shell will use:

```bash
ruby -v
```

If that is older than 3.3, install a current Ruby. With Homebrew on an Apple Silicon Mac:

```bash
brew install ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
```

On an Intel Mac, Homebrew's Ruby lives at `/usr/local/opt/ruby/bin`. Put the matching `export` line in your shell profile if you want it in every new terminal. `ruby -v` should then report 3.3 or newer before you install gems.

## Install

```bash
git clone https://github.com/crasinator/Ark.git
cd Ark
bundle install
```

## Run

```bash
bundle exec ruby bin/ArkTrack
```

If Yahoo Finance rejects a quote, the app prints the reason instead of crashing. `bundle exec` matters. Plain `ruby bin/ArkTrack` uses whatever `ruby` is first on your `PATH`, and system Ruby does not have these gems.

| Input | Action |
| --- | --- |
| 1 | Buys and sells in the trade file |
| 2 | ARKK price, change, 52-week range, and market cap |
| 3 | The same quote view for TSLA |
| 4 | A sell picked from the trade file |
| 5 | A buy picked from the trade file |
| anything else | Exit. The exit screen also shows one pick from the buy list. |

![Ark Tracker in the terminal](arkExtra/Ark%20Workspace.png)
