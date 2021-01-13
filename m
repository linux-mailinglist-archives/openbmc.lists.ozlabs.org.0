Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5102F53D3
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 21:07:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGJQZ051LzDrcV
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 07:07:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGJGH1RhJzDrT0
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 07:00:34 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 10DK0E4E007559;
 Wed, 13 Jan 2021 22:00:14 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id CC77463A17; Wed, 13 Jan 2021 22:00:14 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v3 00/12] Add NPCM7xx patches to dev-5.8
Date: Wed, 13 Jan 2021 21:59:58 +0200
Message-Id: <20210113200010.71845-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Tomer Maimon <tmaimon77@gmail.com>,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In this patch set we will like to align with relevant modifications
in Nuvoton OpenBMC Linux kernel 5.4.

Linux upstream current status:
	1. npcm7xx clock driver - adding read only 
		flag to divider clocks, Will be sent to Linux community.
	2. Adding NPCM ADC calibration - Will be sent to Linux vanilla,
		but I am not sure it will be approved.
	3. Add DT restart priority and reset type support - sent to Linux 
		community la but havent approved yet.
	4. persist configuration to the pin control driver - asked by a costumer,
		didnt sent to Linux community.
	5. Add HGPIO pin support to NPCM7xx pinctrl driver - will be sent
		to Linux community
	6. JTAG master driver - will be sent to Linux community once we will 
		have BMC folder.

Changes since version 2:
- Address comments from Joel Stanley

Changes since version 1:
- Address comments from Jonathan Neuschäfer: removing trailing whitespace
	in NPCM watchdog documentation.
- Adding Stanley Chu to NPCM JTAG master driver


Tomer Maimon (12):
  clk: npcm7xx: add read only flag to divider clocks
  dt-binding: iio: add syscon property to NPCM ADC
  iio: adc: add calibration support to npcm ADC
  dts: npcm750: add fuse regmap support node
  dt-binding: watchdog: Add DT restart priority and reset type
  watchdog: npcm: Add DT restart priority and reset type support
  pinctrl: npcm7xx: Add HGPIO pin support to NPCM7xx pinctrl driver
  pinctrl: pinconf: add pin persist configuration
  pinctrl: npcm7xx: Add pin persist configuration support
  spi: npcm-pspi: Add full duplex support
  dt-binding: bmc: add NPCM7XX JTAG master documentation
  misc: npcm7xx-jtag-master: add NPCM7xx JTAG master driver

 .../bindings/bmc/npcm7xx-jtag-master.txt      |  38 +
 .../bindings/iio/adc/nuvoton,npcm-adc.txt     |   2 +
 .../bindings/watchdog/nuvoton,npcm-wdt.txt    |  34 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   6 +
 drivers/clk/clk-npcm7xx.c                     |  70 +-
 drivers/iio/adc/npcm_adc.c                    | 178 ++++
 drivers/misc/Kconfig                          |   6 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/npcm7xx-jtag-master.c            | 840 ++++++++++++++++++
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c     | 130 ++-
 drivers/pinctrl/pinconf-generic.c             |   3 +
 drivers/spi/spi-npcm-pspi.c                   |  75 +-
 drivers/watchdog/npcm_wdt.c                   | 117 ++-
 13 files changed, 1404 insertions(+), 96 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bmc/npcm7xx-jtag-master.txt
 create mode 100644 drivers/misc/npcm7xx-jtag-master.c

-- 
2.22.0

