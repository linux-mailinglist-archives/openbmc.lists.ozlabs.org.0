Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B1846DDB4
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 22:38:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8Vs60f0Gz2yNw
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 08:38:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=DUihA1g+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=DUihA1g+; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8Vr06wWCz2yN3
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 08:37:20 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-184-96.tukw.qwest.net
 [174.21.184.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id E6BC1500;
 Wed,  8 Dec 2021 13:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1638999436;
 bh=DFS4xFVoWu3eIZ8C+hKS8xqrLjmyqO7+PD3wjn4s/TA=;
 h=From:To:Cc:Subject:Date:From;
 b=DUihA1g+gL8KLIYS6nxLj3FiJTBi4UTbuhhU7fEGCmzbQV22O9zo24E9H0rryuQeH
 CmFZAIu30o3/oZtgAq9gEyfGbks4mKmXaXo+kY9WHBqhlNRUSYROOpqhdfPePOHyvD
 jP5YzfldCXJzmOrK5UPiN1tVmtLR5pOPGbzb6OZg=
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-hwmon@vger.kernel.org
Subject: [PATCH v4 0/2] hwmon: (pmbus) Add Delta AHE-50DC fan control module
 driver
Date: Wed,  8 Dec 2021 13:37:01 -0800
Message-Id: <20211208213703.2577-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

These patches add a hwmon pmbus driver for the integrated fan control
module in the Delta AHE-50DC Open19 power shelf.  I don't know of a
datasheet or any proper documentation for it.  It's a PMBus device,
but supports a fairly limited set of commands.  The ones it does
support have deen deduced from a combination of an existing GPL driver
in a code release from LinkedIn [0] and some manual experimentation
with i2c-tools commands.  In addition to some standard PMBus sensors
(three temperature readings, four fan speeds, and a vin voltage), it
also has a manufacturer-specific fourth temperature reading available,
which is supported via a virtual second page (the device itself is not
paged, but the driver remaps PMBUS_READ_TEMPERATURE_1 in page 1 to the
manufacturer-specific TEMPERATURE_4).


Thanks,
Zev Weiss

Changes since v3 [3]:
 - fixed header inclusion order
 - removed spurious select/depends Kconfig lines
 - added comment explaining PMBUS_NO_CAPABILITY
 - added command-filtering to read_word_data callback to avoid
   producing bogus sensor limits
 - updated commit message

Changes since v2 [2]:
 - converted to pmbus driver

Changes since v1 [1]:
 - fixed invalid name warning from __hwmon_device_register()

[0] https://github.com/linkedin/o19-bmc-firmware/blob/master/meta-openbmc/meta-linkedin/meta-deltapower/recipes-kernel/fancontrol-mod/files/fancontrol.c
[1] https://lore.kernel.org/linux-hwmon/20211206224419.15736-1-zev@bewilderbeest.net/
[2] https://lore.kernel.org/linux-hwmon/20211206230153.16891-1-zev@bewilderbeest.net/
[3] https://lore.kernel.org/linux-hwmon/20211207071521.543-1-zev@bewilderbeest.net/


Zev Weiss (2):
  hwmon: (pmbus) Add Delta AHE-50DC fan control module driver
  dt-bindings: add Delta AHE-50DC fan control module

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/hwmon/pmbus/Kconfig                   |  10 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/delta-ahe50dc-fan.c       | 114 ++++++++++++++++++
 5 files changed, 133 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/delta-ahe50dc-fan.c

-- 
2.34.1

