Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3571538A594
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 12:16:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm5Hz0rMMz2yR7
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 20:16:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=steven_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm5Hm1DRnz2xfT;
 Thu, 20 May 2021 20:16:35 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 14KA18f0077450;
 Thu, 20 May 2021 18:01:08 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from slee-VirtualBox.localdomain (192.168.100.253) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 May 2021 18:13:47 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@aj.id.au>, Adrian Hunter <adrian.hunter@intel.com>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, "moderated list:ASPEED SD/MMC
 DRIVER" <openbmc@lists.ozlabs.org>, "open list:ASPEED SD/MMC DRIVER"
 <linux-mmc@vger.kernel.org>
Subject: [PATCH v4 0/3] mmc: sdhci-of-aspeed: Support toggling SD bus signal
Date: Thu, 20 May 2021 18:13:42 +0800
Message-ID: <20210520101346.16772-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14KA18f0077450
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
Cc: ryan_chen@aspeedtech.com, chin-ting_kuo@aspeedtech.com,
 steven_lee@aspeedtech.com, Hongweiz@ami.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


AST2600-A2 EVB has the reference design for enabling SD bus
power and toggling SD bus signal voltage between 3.3v and 1.8v by
GPIO regulators.
This patch series adds sdhci node and gpio regulators in a new dts file
for AST2600-A2 EVB.
The description of the reference design of AST2600-A2 EVB is added
in the new dts file.

This patch also include a helper for updating AST2600 sdhci capability
registers.

Changes from v3:
* Remove the example of gpio regulator from dt-bindings.
* Add sdhci node and gpio regulators to a new dts file.
* Move the comment of the reference design to the new
  dts file.
* Modify commit message of sdhci-of-aspeed.c.
* Fix coding style issues of sdhci-of-aspeed.c.
* Remove the implementation of eMMC resetc since it has no relevance to
  the goal that this patch series want to achieve and it may needs further
  discussion about the design of reset behavior.

Changes from v2:
* Move the comment of the reference design from dt-bindings to device tree.
* Add clk-phase binding for eMMC controller.
* Reimplement aspeed_sdc_set_slot_capability().
* Separate the implementation of eMMC reset to another patch file.
* Fix yaml document error per the report of dt_binding_check and
  dtbs_check.

Changes from v1:
* Add the device tree example for AST2600 A2 EVB in dt-bindings
  document
* Add timing-phase for eMMC controller.
* Remove power-gpio and power-switch-gpio from sdhci driver, they should
  be handled by regulator.
* Add a helper to update capability registers in the driver.
* Sync sdhci settings from device tree to SoC capability registers.
* Sync timing-phase from device tree to SoC Clock Phase Control
  register

Please help to review.

Regards,
Steven

Steven Lee (3):
  ARM: dts: aspeed: ast2600evb: Add sdhci node and gpio regulator for A2
    evb.
  ARM: dts: aspeed: ast2600evb: Add phase correction for emmc
    controller.
  mmc: sdhci-of-aspeed: Configure the SDHCIs as specified by the
    devicetree.

 arch/arm/boot/dts/aspeed-ast2600-evb-a2.dts | 98 +++++++++++++++++++++
 arch/arm/boot/dts/aspeed-ast2600-evb.dts    |  3 +-
 drivers/mmc/host/sdhci-of-aspeed.c          | 48 ++++++++++
 3 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/aspeed-ast2600-evb-a2.dts

-- 
2.17.1

