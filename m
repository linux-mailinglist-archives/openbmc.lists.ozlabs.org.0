Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A36AC2F624B
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 14:46:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGlwP53l0zDsck
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 00:46:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGlMW4GQWzDsFZ;
 Fri, 15 Jan 2021 00:21:43 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 10EDB0vQ082196;
 Thu, 14 Jan 2021 21:11:00 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 14 Jan 2021 21:16:02 +0800
From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
To: <robh+dt@kernel.org>, <lee.jones@linaro.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <linus.walleij@linaro.org>, <minyard@acm.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Subject: [PATCH v5 0/5] Remove LPC register partitioning
Date: Thu, 14 Jan 2021 21:16:17 +0800
Message-ID: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 10EDB0vQ082196
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
Cc: BMC-SW@aspeedtech.com, cyrilbur@gmail.com, haiyue.wang@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The LPC controller has no concept of the BMC and the Host partitions.
The incorrect partitioning can impose unnecessary range restrictions
on register access through the syscon regmap interface.

For instance, HICRB contains the I/O port address configuration
of KCS channel 1/2. However, the KCS#1/#2 drivers cannot access
HICRB as it is located at the other LPC partition.

In addition, to be backward compatible, the newly added HW control
bits could be located at any reserved bits over the LPC addressing
space.

Thereby, this patch series aims to remove the LPC partitioning for
better driver development and maintenance. This requires the change
to both the device tree and the driver implementation. To ensure
both sides are synchronously updated, a v2 binding check is added.

Chagnes since v4:
	- Add child node example in dt-bindings.

Chagnes since v3:
	- Revise binding check as suggested by Haiyue Wang.

Changes since v2:
	- Add v2 binding check to ensure the synchronization between the
	  device tree change and the driver register offset fix.

Changes since v1:
	- Add the fix to the aspeed-lpc binding documentation.

Chia-Wei, Wang (5):
  dt-bindings: aspeed-lpc: Remove LPC partitioning
  ARM: dts: Remove LPC BMC and Host partitions
  ipmi: kcs: aspeed: Adapt to new LPC DTS layout
  pinctrl: aspeed-g5: Adapt to new LPC device tree layout
  soc: aspeed: Adapt to new LPC device tree layout

 .../devicetree/bindings/mfd/aspeed-lpc.txt    | 100 ++++---------
 arch/arm/boot/dts/aspeed-g4.dtsi              |  74 ++++------
 arch/arm/boot/dts/aspeed-g5.dtsi              | 135 ++++++++----------
 arch/arm/boot/dts/aspeed-g6.dtsi              | 135 ++++++++----------
 drivers/char/ipmi/kcs_bmc_aspeed.c            |  27 ++--
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c    |  17 ++-
 drivers/soc/aspeed/aspeed-lpc-ctrl.c          |  20 ++-
 drivers/soc/aspeed/aspeed-lpc-snoop.c         |  23 +--
 8 files changed, 229 insertions(+), 302 deletions(-)

-- 
2.17.1

