#!/usr/bin/env bash
#
# Copyright (c) 2014 Richard Mortier <mort@cantab.net>
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without fee is hereby granted, provided that the above copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#

# Clone my rc-files repo and install. Most people probably don't want this.

set -ex

git clone git://github.com/mor1/rc-files src/rc-files || true
chown -R vagrant:vagrant src

cd src/rc-files
rm -f ~vagrant/.bashrc ~vagrant/.profile ~vagrant/.ocamlinit
mv ~vagrant/.ssh/authorized_keys ./ssh && rm -rf ~vagrant/.ssh
sudo -u vagrant ./install.sh
