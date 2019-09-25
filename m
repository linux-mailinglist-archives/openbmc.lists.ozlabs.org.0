Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2E1BDF98
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 16:01:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dfqG49spzDqfD
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 00:01:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.75.26; helo=8.mo179.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 2399 seconds by postgrey-1.36 at bilbo;
 Thu, 26 Sep 2019 00:00:11 AEST
Received: from 8.mo179.mail-out.ovh.net (8.mo179.mail-out.ovh.net
 [46.105.75.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dfp33lHrzDqWb
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 00:00:08 +1000 (AEST)
Received: from player698.ha.ovh.net (unknown [10.108.54.203])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id B4280143465
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 14:42:57 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id 1397BA33DD02;
 Wed, 25 Sep 2019 12:42:52 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 00/13] mtd: spi-nor: aspeed: add support for
 ast2600
Date: Wed, 25 Sep 2019 14:42:26 +0200
Message-Id: <20190925124239.27897-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6976357297923721986
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

It is based on Brad Bishop series adding the Rainier system system.
The training is still experimental and optimistic. The algorithm might
need some more tuning when systems become available. Quad I/O support
is not implemented.

The Segment Register have a different layout on the AST2600 and the
AHB window of CS other than the first are closed. We will need support
from the firmware or the DT to activate multiple chips on the same
bus.

These driver extensions will not be pushed to mainline.

Thanks,

C.

Cédric Le Goater (13):
  ARM: dts: aspeed-g6: Add FMC and SPI devices
  ARM: dts: aspeed: rainier: Enable FMC and SPI devices
  ARM: dts: aspeed: rainier: Enable MAC0
  ARM: dts: ast2600-evb: Enable FMC and SPI devices
  mtd: spi-nor: Add support for w25q512jv
  mtd: spi-nor: aspeed: Introduce a field for the AHB physical address
  mtd: spi-nor: aspeed: Introduce segment operations
  mtd: spi-nor: aspeed: add initial support for ast2600
  mtd: spi-nor: aspeed: Check for disabled segments on the AST2600
  mtd: spi-nor: aspeed: Introduce training operations per platform
  mtd: spi-nor: aspeed: Introduce a HCLK mask for training
  mtd: spi-nor: aspeed: check upper freq limit when doing training
  mtd: spi-nor: aspeed: add support for AST2600 training

 drivers/mtd/spi-nor/aspeed-smc.c             | 283 ++++++++++++++++---
 drivers/mtd/spi-nor/spi-nor.c                |   2 +
 arch/arm/boot/dts/aspeed-ast2600-evb.dts     |  24 ++
 arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts |  38 +++
 arch/arm/boot/dts/aspeed-g6.dtsi             |  79 ++++++
 5 files changed, 385 insertions(+), 41 deletions(-)

-- 
2.21.0

