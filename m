Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3945046AD03
	for <lists+openbmc@lfdr.de>; Mon,  6 Dec 2021 23:47:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7JTv0rJDz3cVt
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 09:47:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=XJqEpZJy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=XJqEpZJy; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7JSp4kcNz2xYL
 for <openbmc@lists.ozlabs.org>; Tue,  7 Dec 2021 09:46:34 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-184-96.tukw.qwest.net
 [174.21.184.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id C8FBD5B1;
 Mon,  6 Dec 2021 14:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1638830789;
 bh=amRvBLsiULS9hr5YoeVDU7p2guRPjNiBr1vyo6KyC2g=;
 h=From:To:Cc:Subject:Date:From;
 b=XJqEpZJy3uGxzF6XDUgLqYquKO6sJtw9CWKoo7p2e6dYXBDxlvdTcKsVgleVfq4N/
 UPRPIaRoaK+hh9BgOc44om6qci3vgEWfTXEiXRLoGaB2CcloGSD8cOwA2Z48IiW816
 +bbt6BxOx9nN9wEVGHgG7a8DysmAuLS3PqCLgR2I=
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-hwmon@vger.kernel.org
Subject: [PATCH 0/2] hwmon: Add driver for Delta AHE-50DC fan control module
Date: Mon,  6 Dec 2021 14:44:16 -0800
Message-Id: <20211206224419.15736-1-zev@bewilderbeest.net>
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
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

These patches add a hwmon driver for the integrated fan control module
in the Delta AHE-50DC Open19 power shelf.  I don't know of a datasheet
any proper documentation for it; the register layout information came
from an existing GPL driver [0] in a code release from LinkedIn.


Thanks,
Zev Weiss

[0] https://github.com/linkedin/o19-bmc-firmware/blob/master/meta-openbmc/meta-linkedin/meta-deltapower/recipes-kernel/fancontrol-mod/files/fancontrol.c

Zev Weiss (2):
  hwmon: add Delta AHE-50DC fan control module driver
  dt-bindings: add Delta AHE-50DC fan control module

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/hwmon/Kconfig                         |  11 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/delta-ahe50dc-fan.c             | 265 ++++++++++++++++++
 5 files changed, 285 insertions(+)
 create mode 100644 drivers/hwmon/delta-ahe50dc-fan.c

-- 
2.34.1

