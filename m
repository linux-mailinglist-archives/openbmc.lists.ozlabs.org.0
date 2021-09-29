Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 184B941C3F2
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 13:56:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKFG90ClZz2yWG
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 21:56:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=PTRcCeCW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=PTRcCeCW; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKFCl0lj4z2yM4;
 Wed, 29 Sep 2021 21:54:25 +1000 (AEST)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id C2A4B228;
 Wed, 29 Sep 2021 04:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1632916463;
 bh=QIOhbXTW+4LTUMlGEWB6KTncQEdjxs82r47WlkWtpzM=;
 h=From:To:Cc:Subject:Date:From;
 b=PTRcCeCWPbaNeUFJGtSuQneB/EDyfvdN4ll8NFb8jeYFSNP2dv8+OpvPAEtAaOGD/
 ILxTuNdlM8KvWB2E9+S9lfk2UhzebJ+nOecoREqBVDC2Opjam2gd9JblinMDfPw406
 FC1thpKR8dYPcjQogufcLRZckybbLL8ukMrRuf28=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 0/6] Dynamic aspeed-smc flash chips via "reserved" DT status
Date: Wed, 29 Sep 2021 04:54:02 -0700
Message-Id: <20210929115409.21254-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.0
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Zev Weiss <zev@bewilderbeest.net>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org,
 Frank Rowand <frowand.list@gmail.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This patch series aims to improve a scenario that arises in OpenBMC
and which isn't handled very well at the moment.  Certain devices, the
example at hand being the flash chip used to store the host's firmware
(e.g. the BIOS), may be shared between the BMC and the host system but
only available to one or the other at any given time.  The device may
thus be effectively off-limits to the BMC when it boots, and only
usable after userspace performs the necessary steps to coordinate
appropriately with the host (tracking its power state, twiddling
GPIOs, sending IPMI commands, etc.).

Neither the "okay" nor the "disabled" device-tree status values works
nicely for the flash device this case -- an "okay" device gets probed
automatically as soon as the device and a driver for it are available,
and a "disabled" one gets forgotten about entirely, whereas we want
the BMC's kernel to be aware of the existence of the device, but not
try to actually do anything with it (i.e. probe it) until explicitly
requested to do so by userspace.

However, while there's no support for it currently in the kernel tree,
the device-tree spec [0] also lists "reserved" as a possible status
value, and its description seems like a fairly reasonable fit for this
situation:

  Indicates that the device is operational, but should not be used.
  Typically this is used for devices that are controlled by another
  software component, such as platform firmware.

These patches start making use of this status value in the aspeed-smc
driver.  The first patch adds a companion routine to
of_device_is_available() that checks for a "reserved" status instead
of "okay".  The second patch is a small MTD adjustment to allow an
unregistered device to be cleanly re-registered.  Patches 3 through 5
modify the aspeed-smc driver to allow individual chips to be attached
and detached at runtime, and to avoid automatically attaching any
marked as reserved.  Finally, patch 6 employs the newly-supported
status in adding support for the BIOS flash device to the ASRock Rack
e3c246d4i BMC.


Thanks,
Zev

[0] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf

Zev Weiss (6):
  of: base: Add function to check for status = "reserved"
  mtd: core: clear out unregistered devices a bit more
  mtd: spi-nor: aspeed: Refactor registration/unregistration
  mtd: spi-nor: aspeed: Allow attaching & detaching chips at runtime
  mtd: spi-nor: aspeed: Don't automatically attach reserved chips
  ARM: dts: aspeed: Add e3c246d4i BIOS flash device

 .../ABI/stable/sysfs-driver-aspeed-smc        |  17 ++
 .../boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  |  16 ++
 drivers/mtd/mtdcore.c                         |   7 +-
 drivers/mtd/spi-nor/controllers/aspeed-smc.c  | 177 +++++++++++++++---
 drivers/of/base.c                             |  53 +++++-
 include/linux/of.h                            |   6 +
 6 files changed, 238 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-aspeed-smc

-- 
2.33.0

