#
# Copyright (C) 2013 Cyril Bouthors <cyril@boutho.rs>
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <http://www.gnu.org/licenses/>.
#

DESTDIR=/usr/local

HOOKS= \
	instance-failover-pre.d \
	instance-migrate-pre.d \
	instance-move-pre.d \
	instance-failover-post.d \
	instance-migrate-post.d \
	instance-remove-post.d \
	instance-stop-post.d \
	instance-start-pre.d

all:;

include autobuild.mk

install: $(HOOKS:%=$(DESTDIR)/etc/ganeti/hooks/%/ganeti-ebtables)
	mkdir -p $(DESTDIR)/usr/bin
	cp -p bin/ganeti-ebtables $(DESTDIR)/usr/bin

$(DESTDIR)/etc/ganeti/hooks/%/ganeti-ebtables:
	mkdir -p $(@D)
	ln -s /usr/bin/ganeti-ebtables $@
