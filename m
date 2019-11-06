Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E08D7F193C
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 15:59:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477V6v4yJtzF3NK
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 01:59:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477V0w1XplzF1d9
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 01:54:03 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id xA6ErXXG026781;
 Wed, 6 Nov 2019 16:53:33 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 65DCC60275; Wed,  6 Nov 2019 16:53:33 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com,
 yuenn@google.com, venture@google.com, benjaminfair@google.com,
 avifishman70@gmail.com, joel@jms.id.au
Subject: [PATCH v5 0/3] reset: npcm: add NPCM reset driver support
Date: Wed,  6 Nov 2019 16:53:28 +0200
Message-Id: <20191106145331.25740-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set adds reset controller support 
for the Nuvoton NPCM Baseboard Management Controller (BMC).

Apart of controlling all NPCM BMC reset module lines the NPCM reset driver
support NPCM BMC software reset to restarting the NPCM BMC.

Supporting NPCM USB-PHY reset as follow:

NPCM BMC USB-PHY connected to two modules USB device (UDC) and USB host.

If we will restart the USB-PHY at the UDC probe and later the 
USB host probe will restart USB-PHY again it will disable the UDC
and vice versa.

The solution is to reset the USB-PHY at the reset probe stage before 
the UDC and the USB host are initializing.

NPCM reset driver tested on NPCM750 evaluation board.

Addressed comments from:.
 - Philipp Zabel

Changes since version 4:
 - Check for stored GCR string in the of_device_id->data to gain
   GCR regmap access. 
 - Adding check if the user used undefined reset pins
   in the of_xlate function.
 - Remove nr_resets initialization since it of_xlate replaced 
   with the custom version.

Changes since version 3:
 - Modify to dt-bindings in the commit subject.
 - Remove footer from all the sent patches.
 
Changes since version 2:
 - Remove unnecessary details in the dt-binding documentation.
 - Modify device tree binding constants.
 - initialize gcr_regmap parameter to NULL.
 - Add of_xlate support.
 - Enable NPCM reset driver by default.
 - Remove unused header include.
 - Using devm_platform_ioremap_resource instead of_address_to_resource 
	and devm_ioremap_resource.
 - Modify number of resets.
 - Using devm_reset_controller_register instead reset_controller_register.
 - Remove unnecessary probe print.
  
Changes since version 1:
 - Check if gcr_regmap parameter initialized before using it.

Tomer Maimon (3):
  dt-bindings: reset: add NPCM reset controller documentation
  dt-bindings: reset: Add binding constants for NPCM7xx reset controller
  reset: npcm: add NPCM reset controller driver

 .../bindings/reset/nuvoton,npcm-reset.txt     |  32 ++
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-npcm.c                    | 291 ++++++++++++++++++
 .../dt-bindings/reset/nuvoton,npcm7xx-reset.h |  91 ++++++
 5 files changed, 422 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
 create mode 100644 drivers/reset/reset-npcm.c
 create mode 100644 include/dt-bindings/reset/nuvoton,npcm7xx-reset.h

-- 
2.22.0

