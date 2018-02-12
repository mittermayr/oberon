# Why?

The aim of this repo is to provide myself (and possibly others) with a super basic and straight-forward starting template for quick'n'dirty Telegram bots. Hopefully, the basics get improved over the coming weeks, and this may serve as a clone-and-go type of starting point.

# Installation

Simply download or clone, then run `bundle update` and that's it.

# Configuration

You will need to get a Telegram API token first. You can find more information about this here: [https://core.telegram.org/bots](https://core.telegram.org/bots). Once you have the token, place it in `oberon.rb` and you're good to go.

# Database Support

I've also some MYSQL support to get started quickly. It utilises a connection pool, which isn't necessary in the basic code you'll start with, but may be useful later, or when using threads, a server, or anything of that kind.
