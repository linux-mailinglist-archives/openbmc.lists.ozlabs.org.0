Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A567DDAE0D
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 15:17:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46v8p45Sh6zDqRR
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 00:17:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46v8nJ05q5zDqRR
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 00:16:18 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 2D5A55C08B;
 Thu, 17 Oct 2019 09:16:14 -0400 (EDT)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: phosphor-hwmon refactoring proposal
Message-Id: <170FEA13-6C0D-4D08-9118-1831E85DD5A8@fuzziesquirrel.com>
Date: Thu, 17 Oct 2019 09:16:13 -0400
To: Matt Spinler <mspinler@linux.ibm.com>,
 Patrick Venture <venture@google.com>, jolie.ku@ibm.com,
 Joel Stanley <joel@jms.id.au>, Jeremy Kerr <jk@ozlabs.org>
X-Mailer: Apple Mail (2.3445.104.11)
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi everyone

I have a quick phosphor-hwmon change proposal I=E2=80=99d like to get fee=
dback on.

One issue with phosphor-hwmon that has been brought up a couple times now=
 =20
is that it gets its configuration settings from a file with a path in the=
 =20
filesystem that mirrors the path to the hwmon device in the device tree. =
 =20
This is problematic because the device tree path is not required to be =20
stable, so whenever things move around there, the config files all have t=
o =20
be moved.

Unfortunately there are > 200 config files like this scattered throughout=
 =20
the openbmc source tree.  So my proposal addresses the limitation in a wa=
y =20
that allows users to move over to the new config file locations on their =
=20
own schedule.

Presently phosphor-hwmon gets its configuration from the environment, =20
provided by systemd=E2=80=99s EnvironmentFile option:

EnvironmentFile=3D/etc/default/obmc/hwmon/%I.conf
ExecStart=3D/usr/bin/phosphor-hwmon-readd -o %I

The proposal is simply to quit passing the configuration via the =20
environment and instead look for a config file, the location specified vi=
a =20
logic in the application, with a path like:

/usr/share/phosphor-hwmon/i2c/2-004c.conf

This is the path to the hwmon parent device relative to /sys/bus e.g. =20
/sys/bus/i2c/devices/2-004c/.  All the logic to do this would be added to=
 =20
the application itself, the sole input being the /sys/devices/... path =20
provided by udev.  libsystemd has an sd-device subsystem that could be us=
ed =20
to do the /sys/devices/=E2=80=A6 -> /sys/bus/=E2=80=A6 traversal if that =
makes things any =20
easier.

The new config file could keep the same format as today, or we could move=
 =20
it to json and parse it with nlohmann?  If json we could preserve the =20
current flat configuration or have dictionaries?

While we are poking around in here, I=E2=80=99d also recommend swapping o=
ut the =20
current helper script with a SYSTEMD_WANTS as systemd has been updated to=
 =20
handle templates in udev rules since this was all originally implemented.

Finally, to enabled a staged migration, the new unit file and udev rules =
=20
would be installed with a new feature flag (e.g. meson option) in place o=
f =20
the old.

Please poke holes.  thanks!

-brad
