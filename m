Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3FC46B38B
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 08:17:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7Wnl0sZkz2yxW
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 18:16:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=gEpQOjki;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=gEpQOjki; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7WnK4fzyz2yNw
 for <openbmc@lists.ozlabs.org>; Tue,  7 Dec 2021 18:16:37 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-184-96.tukw.qwest.net
 [174.21.184.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id A364B5DB;
 Mon,  6 Dec 2021 23:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1638861394;
 bh=n3lf8ZX9wB4UGjOjg6Z1qVUELnvM7wCuORiIvbZScM0=;
 h=From:To:Cc:Subject:Date:From;
 b=gEpQOjkiYPY1zW0THtvVtOx+ldpQepIBZDsKMtqLdS2+pNyuOx+m1ZRdzXPETdN9y
 cYlgDSVVDBNXjh5S/2vwCxFy1MR4lydKqKFe1y6d1ClpRB9iZXkdLKRhdQOGXIOV4U
 D8mqKtN19uH3u/yWuYxs7zW4GBoaD3+8n692glZ8=
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-hwmon@vger.kernel.org
Subject: [PATCH v3 0/2] hwmon: (pmbus) Add Delta AHE-50DC fan control module
 driver
Date: Mon,  6 Dec 2021 23:15:19 -0800
Message-Id: <20211207071521.543-1-zev@bewilderbeest.net>
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
Cc: openbmc@lists.ozlabs.org, Jean Delvare <jdelvare@suse.com>,
 Zev Weiss <zev@bewilderbeest.net>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

These patches add a hwmon pmbus driver for the integrated fan control
module in the Delta AHE-50DC Open19 power shelf.  I don't know of a
datasheet or any proper documentation for it; the registers it has
available have deen deduced from a combination of an existing GPL
driver in a code release from LinkedIn [0] and some manual
experimentation with i2cdump.  In addition to some standard PMBus
sensors (three temperature readings, four fan speeds, and one
voltage), it also has a manufacturer-specific fourth temperature
reading available, which is supported via a virtual second page (the
device itself is not paged, but the driver remaps
PMBUS_READ_TEMPERATURE_1 in page 1 to the manufacturer-specific
TEMPERATURE_4).


Thanks,
Zev Weiss

Changes since v2 [2]:
 - converted to pmbus driver

Changes since v1 [1]:
 - fixed invalid name warning from __hwmon_device_register()

[0] https://github.com/linkedin/o19-bmc-firmware/blob/master/meta-openbmc/meta-linkedin/meta-deltapower/recipes-kernel/fancontrol-mod/files/fancontrol.c
[1] https://lore.kernel.org/linux-hwmon/20211206224419.15736-1-zev@bewilderbeest.net/
[2] https://lore.kernel.org/linux-hwmon/20211206230153.16891-1-zev@bewilderbeest.net/

Zev Weiss (2):
  hwmon: (pmbus) Add Delta AHE-50DC fan control module driver
  dt-bindings: add Delta AHE-50DC fan control module

 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 MAINTAINERS                                   |  6 ++
 drivers/hwmon/pmbus/Kconfig                   | 12 +++
 drivers/hwmon/pmbus/Makefile                  |  1 +
 drivers/hwmon/pmbus/delta-ahe50dc-fan.c       | 84 +++++++++++++++++++
 5 files changed, 105 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/delta-ahe50dc-fan.c

-- 
2.34.1

