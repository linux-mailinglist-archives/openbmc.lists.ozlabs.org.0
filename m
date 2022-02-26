Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7494C5626
	for <lists+openbmc@lfdr.de>; Sat, 26 Feb 2022 14:32:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K5SH11YwNz3bcX
	for <lists+openbmc@lfdr.de>; Sun, 27 Feb 2022 00:31:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=V6j6ZnaF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=V6j6ZnaF; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K5SFz0mLTz30L1
 for <openbmc@lists.ozlabs.org>; Sun, 27 Feb 2022 00:31:02 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 1338A3BA;
 Sat, 26 Feb 2022 05:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1645882259;
 bh=C+88ICGJ2CM+8gAdRSkBM1aU4I+DeyuU0rJ/rCPlNqc=;
 h=From:To:Cc:Subject:Date:From;
 b=V6j6ZnaFOcJ1CDozfbaYJuIP3pOk3KpXKvAWZcBj16w+zNxWxR4vuRzlFWl+q1FPY
 3W+8pXrCWGHz2MsfEfgDKxnZ0RsKu37V9nv2ebcrOOVdHjyaP0eOeSw+63Zd7G9dVG
 PRlvnqAslV6hMBkwfbpJGm/EwJaZtIDdfdBh0plI=
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>
Subject: [PATCH 0/5] hwmon: (nct6775) Add i2c support
Date: Sat, 26 Feb 2022 05:30:42 -0800
Message-Id: <20220226133047.6226-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Renze Nicolai <renze@rnplus.nl>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This patch series augments the existing nct6775 driver with support
for the hardware's i2c interface.

Thus far the nct6775 driver has only supported the LPC interface,
which is the main interface by which the Super-I/O chip is typically
connected to the host (x86) processor.

However, these chips also provide an i2c interface, which can provide
a way for a BMC to also monitor sensor readings from them.  On some
systems (such as the ASRock Rack ROMED8HM3 and X570-D4U) this may be
the only way for the BMC to monitor host CPU temperatures (e.g. to
indirectly access a TSI interface); this functionality is thus an
important component of enabling OpenBMC to support such systems.

In such an arrangement the Super-I/O chip is simultaneously controlled
by two independent processors (the host and the BMC) which typically
do not coordinate their accesses with each other.  In order to avoid
conflicts between the two, the i2c driver avoids all writes to the
device, since the BMC's needs with the hardware are merely that it be
able to retrieve sensor readings.  This allows the host processor to
remain ultimately in control of the chip and unaware of the BMC's use
of it at all.

The sole exception to the "no writes" rule for the i2c driver is for
the bank-select register -- while I haven't been able to find any
explicit statement in the Nuvoton datasheets guaranteeing this, all
experiments I've done have indicated that, as one might hope, the i2c
interface has its own bank-select register independent of the one used
by the LPC interface.

In terms of code structure, the approach taken in this series is to
split the LPC-specific parts of the driver out into a separate module
(called nct6775-platform), leaving the interface-independent parts in
a generic driver (called nct6775-core).  The nct6775-i2c driver is
then added as an additional consumer of the nct6775-core module's
functionality.

The first two patches make some relatively small infrastructural
changes to the nct6775 driver; the bulk of the core/platform driver
split is in the third patch.  The final two patches add DT bindings
and the i2c driver itself.

I've tested the nct6775-platform and nct6775-i2c drivers with the
NCT6779D in an ASRock ROMED8HM3 system (the latter driver on its
AST2500 BMC); both seem to work as expected.  Broader testing would of
course be welcome though, as is review feedback.


Thanks,
Zev


Zev Weiss (5):
  hwmon: (nct6775) Rearrange attr-group initialization
  hwmon: (nct6775) Add read-only mode
  hwmon: (nct6775) Split core and platform driver
  dt-bindings: hwmon: Add nuvoton,nct6775
  hwmon: (nct6775) Add i2c driver

 .../bindings/hwmon/nuvoton,nct6775.yaml       |   48 +
 MAINTAINERS                                   |   12 +-
 drivers/hwmon/Kconfig                         |   32 +-
 drivers/hwmon/Makefile                        |    4 +-
 drivers/hwmon/{nct6775.c => nct6775-core.c}   | 1464 +----------------
 drivers/hwmon/nct6775-i2c.c                   |  191 +++
 drivers/hwmon/nct6775-platform.c              | 1185 +++++++++++++
 drivers/hwmon/nct6775.h                       |  233 +++
 8 files changed, 1763 insertions(+), 1406 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
 rename drivers/hwmon/{nct6775.c => nct6775-core.c} (75%)
 create mode 100644 drivers/hwmon/nct6775-i2c.c
 create mode 100644 drivers/hwmon/nct6775-platform.c
 create mode 100644 drivers/hwmon/nct6775.h

-- 
2.35.1

