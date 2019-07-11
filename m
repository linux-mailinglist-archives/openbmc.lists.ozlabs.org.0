Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7687C66672
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 07:41:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lMGq0D7GzDqrn
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 15:41:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.32; helo=huawei.com; envelope-from=yuehaibing@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
X-Greylist: delayed 931 seconds by postgrey-1.36 at bilbo;
 Fri, 12 Jul 2019 00:41:10 AEST
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kzJQ5585zDqjJ
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2019 00:41:08 +1000 (AEST)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C5510EC944DB3A989B11;
 Thu, 11 Jul 2019 22:25:32 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Thu, 11 Jul 2019
 22:25:26 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <andrew@aj.id.au>, <linus.walleij@linaro.org>, <joel@jms.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH -next] pinctrl: aspeed: Make aspeed_pinmux_ips static
Date: Thu, 11 Jul 2019 22:24:57 +0800
Message-ID: <20190711142457.37028-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 12 Jul 2019 15:40:39 +1000
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
Cc: linux-gpio@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Fix sparse warning:

drivers/pinctrl/aspeed/pinmux-aspeed.c:8:12: warning:
 symbol 'aspeed_pinmux_ips' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/aspeed/pinmux-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.c b/drivers/pinctrl/aspeed/pinmux-aspeed.c
index 5b0fe17..839c01b 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.c
@@ -5,7 +5,7 @@
 
 #include "pinmux-aspeed.h"
 
-const char *const aspeed_pinmux_ips[] = {
+static const char *const aspeed_pinmux_ips[] = {
 	[ASPEED_IP_SCU] = "SCU",
 	[ASPEED_IP_GFX] = "GFX",
 	[ASPEED_IP_LPC] = "LPC",
-- 
2.7.4


