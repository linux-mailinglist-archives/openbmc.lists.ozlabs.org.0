Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 048C54DE16
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 02:35:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VKTR0733zDrMs
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 10:35:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VKSg684XzDrGx
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 10:34:26 +1000 (AEST)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x5L0NaWH026879;
 Fri, 21 Jun 2019 08:23:36 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.23) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Fri, 21 Jun
 2019 08:33:20 +0800
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.23) with Microsoft SMTP Server (TLS) id 15.0.620.29; Fri, 21 Jun
 2019 08:33:20 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Fri, 21 Jun 2019 08:33:19 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, C?ric Le Goater <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: RE: [RFC PATCH dev-5.1 3/6] irqchip/aspeed-i2c-ic: add I2C SRAM
 enabling control
Thread-Topic: [RFC PATCH dev-5.1 3/6] irqchip/aspeed-i2c-ic: add I2C SRAM
 enabling control
Thread-Index: AQHVJ6HvLShnZ8JPmk6GW8AjxYiUw6alQa9w
Date: Fri, 21 Jun 2019 00:33:18 +0000
Message-ID: <c64ab19a31d1495f8e137d5ac58645b2@TWMBX02.aspeed.com>
References: <20190620194922.15093-1-jae.hyun.yoo@linux.intel.com>
 <20190620194922.15093-4-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190620194922.15093-4-jae.hyun.yoo@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.81]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x5L0NaWH026879
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Jae,
	The i2c register setting must after scu reset. - APEED_I2C_SRAM_BUFFER_EN
	My recommend aspeed-i2c-ic.c need be probe after scu reset. And all others=
 i2c bus is no needed for scu reset.=20

Ryan=20

-----Original Message-----
From: openbmc [mailto:openbmc-bounces+ryan_chen=3Daspeedtech.com@lists.ozla=
bs.org] On Behalf Of Jae Hyun Yoo
Sent: Friday, June 21, 2019 3:49 AM
To: Brendan Higgins <brendanhiggins@google.com>; Benjamin Herrenschmidt <be=
nh@kernel.crashing.org>; C?ric Le Goater <clg@kaod.org>; Joel Stanley <joel=
@jms.id.au>; Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org; Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [RFC PATCH dev-5.1 3/6] irqchip/aspeed-i2c-ic: add I2C SRAM enabli=
ng control

This commit adds I2C SRAM enabling control for AST2500 SoC to support buffe=
r mode and DMA mode transfer. The SRAM is enabled by default in AST2400 SoC=
.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/irqchip/irq-aspeed-i2c-ic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c b/drivers/irqchip/irq-aspe=
ed-i2c-ic.c
index f20200af0992..99985b22a9fa 100644
--- a/drivers/irqchip/irq-aspeed-i2c-ic.c
+++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
@@ -18,6 +18,9 @@
 #include <linux/of_irq.h>
 #include <linux/io.h>
=20
+/* I2C Global Control Register (AST2500) */
+#define ASPEED_I2C_GLOBAL_CTRL_REG	0xc
+#define  ASPEED_I2C_SRAM_BUFFER_EN	BIT(0)
=20
 #define ASPEED_I2C_IC_NUM_BUS 14
=20
@@ -100,6 +103,11 @@ static int __init aspeed_i2c_ic_of_init(struct device_=
node *node,
 	irq_set_chained_handler_and_data(i2c_ic->parent_irq,
 					 aspeed_i2c_ic_irq_handler, i2c_ic);
=20
+	/* Enable I2C SRAM buffer in case of AST2500 */
+	if (of_device_is_compatible(node, "aspeed,ast2500-i2c-ic"))
+		writel(ASPEED_I2C_SRAM_BUFFER_EN,
+		       i2c_ic->base + ASPEED_I2C_GLOBAL_CTRL_REG);
+
 	pr_info("i2c controller registered, irq %d\n", i2c_ic->parent_irq);
=20
 	return 0;
--
2.22.0

