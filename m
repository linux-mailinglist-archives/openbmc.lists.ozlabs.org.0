Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1948A105D55
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 00:44:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Jx3d3nZVzDr81
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 10:44:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tali.perry@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HVCz5j2gzDqPy
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 02:31:27 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id xAJEoAiI005890;
 Tue, 19 Nov 2019 16:50:10 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
 id F0B8D60328; Tue, 19 Nov 2019 16:50:09 +0200 (IST)
From: Tali Perry <tali.perry1@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
 mark.rutland@arm.com, tali.perry1@gmail.com, robh@kernel.org,
 wsa@the-dreams.de, jdelvare@suse.de, jarkko.nikula@linux.intel.com,
 geert@linux-m68k.org, arnd@arndb.de, max@enpas.org,
 krzysztof.adamski@nokia.com, syniurge@gmail.com, puwen@hygon.cn,
 jfi@ssv-embedded.de, sr@denx.de, mchehab+samsung@kernel.org,
 kdasu.kdev@gmail.com, enric.balletbo@collabora.com,
 baolin.wang@linaro.org, ludovic.desroches@microchip.com
Subject: [PATCH v5 0/2] i2c: npcm7xx: new driver for I2C controller
Date: Tue, 19 Nov 2019 16:49:28 +0200
Message-Id: <20191119144930.227241-1-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Nov 2019 10:41:10 +1100
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
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Nuvoton NPCM7XX I2C Controller
NPCM7xx includes 16 I2C controllers. This driver operates the controller.
This module also includes a slave mode.

---
v5 -> v4:
	- support recovery
	- master-slave switch support needed for IPMB

v4 -> v3:
	- typo on cover letter.

v3 -> v2:
	- fix dt binding: compatible name: omit "bus"

v2 -> v1:
	- run check patch in strict mode.
	- use linux crc.
	- define regs in constant offset without base.
	- remove debug prints.
	- no declarations for local functions.
	
v1: initial version

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>

---
Tali Perry (2):
  dt-bindings: i2c: npcm7xx: * add binding for i2c controller
  i2c: npcm7xx:

 .../devicetree/bindings/i2c/i2c-npcm7xx.txt   |   29 +
 drivers/i2c/busses/Kconfig                    |   11 +
 drivers/i2c/busses/Makefile                   |    1 +
 drivers/i2c/busses/i2c-npcm7xx.c              | 2486 +++++++++++++++++
 4 files changed, 2527 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
 create mode 100644 drivers/i2c/busses/i2c-npcm7xx.c

-- 
2.22.0

