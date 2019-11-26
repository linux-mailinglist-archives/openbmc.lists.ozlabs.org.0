Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B6E1099A7
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 08:42:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MbTZ3d3szDqjZ
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 18:42:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=prodrive-technologies.com (client-ip=212.61.153.67;
 helo=mail.prodrive-technologies.com;
 envelope-from=roy.van.doormaal@prodrive-technologies.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=prodrive-technologies.com
Received: from mail.prodrive-technologies.com (mail.prodrive-technologies.com
 [212.61.153.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MbSn45v3zDq7g;
 Tue, 26 Nov 2019 18:41:43 +1100 (AEDT)
Received: from mail.prodrive-technologies.com (localhost.localdomain
 [127.0.0.1])
 by localhost (Email Security Appliance) with SMTP id 06A3C32FE2_DDCD732B;
 Tue, 26 Nov 2019 07:41:38 +0000 (GMT)
Received: from mail.prodrive-technologies.com (mdb-dag.prodrive.nl
 [10.1.1.212])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.prodrive-technologies.com",
 Issuer "Prodrive Technologies B.V. OV SSL Issuing CA" (verified OK))
 by mail.prodrive-technologies.com (Sophos Email Appliance) with ESMTPS id
 A51DD30B70_DDCD731F; Tue, 26 Nov 2019 07:41:37 +0000 (GMT)
Received: from lnxclnt2222.Prodrive.nl (10.13.62.32) by EXC03.bk.prodrive.nl
 (10.1.1.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Tue, 26
 Nov 2019 08:41:37 +0100
From: Roy van Doormaal <roy.van.doormaal@prodrive-technologies.com>
To: Brendan Higgins <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Thomas Gleixner
 <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier
 <maz@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 <linux-i2c@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v2] irqchip/aspeed-i2c-ic: Fix irq domain name memory leak
Date: Tue, 26 Nov 2019 08:40:25 +0100
Message-ID: <20191126074025.5112-1-roy.van.doormaal@prodrive-technologies.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191125202937.23133-1-roy.van.doormaal@prodrive-technologies.com>
References: <20191125202937.23133-1-roy.van.doormaal@prodrive-technologies.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EXC03.bk.prodrive.nl (10.1.1.212) To EXC03.bk.prodrive.nl
 (10.1.1.212)
X-SASI-RCODE: 200
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
Cc: Roy van Doormaal <roy.van.doormaal@prodrive-technologies.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The aspeed irqchip driver overwrites the default irq domain name,
but doesn't free the existing domain name.
This patch frees the irq domain name before overwriting it.

kmemleak trace:

unreferenced object 0xb8004c40 (size 64):
comm "swapper", pid 0, jiffies 4294937303 (age 747.660s)
hex dump (first 32 bytes):
3a 61 68 62 3a 61 70 62 3a 62 75 73 40 31 65 37 :ahb:apb:bus@1e7
38 61 30 30 30 3a 69 6e 74 65 72 72 75 70 74 2d 8a000:interrupt-
backtrace:
[<086b59b8>] kmemleak_alloc+0xa8/0xc0
[<b5a3490c>] __kmalloc_track_caller+0x118/0x1a0
[<f59c7ced>] kvasprintf+0x5c/0xc0
[<49275eec>] kasprintf+0x30/0x50
[<5713064b>] __irq_domain_add+0x184/0x25c
[<53c594d0>] aspeed_i2c_ic_of_init+0x9c/0x128
[<d8d7017e>] of_irq_init+0x1ec/0x314
[<f8405bf1>] irqchip_init+0x1c/0x24
[<7ef974b3>] init_IRQ+0x30/0x90
[<87a1438f>] start_kernel+0x28c/0x458
[< (null)>] (null)
[<f0763fdf>] 0xffffffff

Signed-off-by: Roy van Doormaal <roy.van.doormaal@prodrive-technologies.com>
---
Changes in v2:
- drop irq domain name assignment by the aspeed irqchip driver
---
 drivers/irqchip/irq-aspeed-i2c-ic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c b/drivers/irqchip/irq-aspeed-i2c-ic.c
index 8d591c179f81..0bd46f63a3c3 100644
--- a/drivers/irqchip/irq-aspeed-i2c-ic.c
+++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
@@ -92,8 +92,6 @@ static int __init aspeed_i2c_ic_of_init(struct device_node *node,
 		goto err_iounmap;
 	}
 
-	i2c_ic->irq_domain->name = "aspeed-i2c-domain";
-
 	irq_set_chained_handler_and_data(i2c_ic->parent_irq,
 					 aspeed_i2c_ic_irq_handler, i2c_ic);
 
-- 
2.20.1

