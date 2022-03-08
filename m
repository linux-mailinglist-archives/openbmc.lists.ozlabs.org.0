Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F39C4D0D6F
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 02:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCHYz01D0z3bT3
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 12:20:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=SZNk3TyQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=SZNk3TyQ; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCHXB0Lxrz2xDD
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2022 12:18:33 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 88DB04C8;
 Mon,  7 Mar 2022 17:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1646702310;
 bh=WA0g01ylI3uRFuxsoi3Sd/kmAWCJhNXmCT+GLDXKrng=;
 h=From:To:Cc:Subject:Date:From;
 b=SZNk3TyQOZhh0La1+PbuuAmh0QkAcMusjnejTEgP1Jtip5aWdNrM7TvXDaleiYAXK
 4JfZiX5YIKSxw8wiHovUOS/eKTh9eXOjA57LYz/8irtXvFiiJ4WXyuJKSujRPfhW5R
 f09morTBdSS0o3gNVvohpJuseqFlC/PmNXZjwzRM=
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 0/2] misc: Add power-efuse driver
Date: Mon,  7 Mar 2022 17:18:08 -0800
Message-Id: <20220308011811.10353-1-zev@bewilderbeest.net>
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
 openbmc@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This is a second revision of the v1 patch series posted previously
[2].

Changes since v1:
 - dropped pmbus/lm25066 patches, submitted separately via hwmon tree [Guenter]
 - fixed indentation in power-efuse.yaml [Rob's bot]
 - added more detailed description in power-efuse.yaml [Rob]
 - added sysfs ABI documentation [Greg]
 - replaced manual struct attribute_group and sysfs_create_group()
   with ATTRIBUTE_GROUPS() and driver.dev_groups [Greg]

A lightly edited version of the previous cover letter follows.


This patch series is another incarnation of some previous efforts [0]
at enabling userspace access to the OPERATION state (and now status
flags) of PMBus devices, specifically with respect to efuses
protecting general-purpose power outputs.  This functionality is an
important component enabling a port of OpenBMC to the Delta AHE-50DC
Open19 power shelf [1].

The first patch adds dt-bindings, and the second adds the
implementation of the power-efuse driver.  The driver is fairly
simple; it merely provides a sysfs interface to enable, disable, and
retrieve error flags from an underlying regulator (which in the
expected usage will most likely be a PMBus device).

There is one aspect of its usage of the regulator API I'm a bit
uncertain about, however: this driver seems like a case where an
exclusive 'get' of the regulator (i.e. devm_regulator_get_exclusive()
instead of devm_regulator_get() in efuse_probe()) would be
appropriate, since in the intended usage no other device should be
using an efuse's regulator.  With an exclusive get though, the
regulator's use_count and the consumer's enable_count don't balance
out properly to allow the enable/disable operations to work properly
(the former ending up one more than the latter, leading to
enable_count underflows on attempts to disable the regulator).  So at
least for now it's using a non-exclusive get -- I'd be happy to hear
any pointers on a way to allow an exclusive get to work here, though.


Thanks,
Zev

[0] https://lore.kernel.org/openbmc/YGLepYLvtlO6Ikzs@hatter.bewilderbeest.net/
[1] https://www.open19.org/marketplace/delta-16kw-power-shelf/
[2] https://lore.kernel.org/openbmc/20220217104444.7695-1-zev@bewilderbeest.net/

Zev Weiss (2):
  dt-bindings: Add power-efuse binding
  misc: Add power-efuse driver

 .../ABI/testing/sysfs-driver-power-efuse      |  32 +++
 .../devicetree/bindings/misc/power-efuse.yaml |  49 ++++
 MAINTAINERS                                   |   5 +
 drivers/misc/Kconfig                          |  15 ++
 drivers/misc/Makefile                         |   1 +
 drivers/misc/power-efuse.c                    | 212 ++++++++++++++++++
 6 files changed, 314 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-power-efuse
 create mode 100644 Documentation/devicetree/bindings/misc/power-efuse.yaml
 create mode 100644 drivers/misc/power-efuse.c

-- 
2.35.1

