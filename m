Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8250B61EA1F
	for <lists+openbmc@lfdr.de>; Mon,  7 Nov 2022 05:14:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5Hv32sJ3z3cNj
	for <lists+openbmc@lfdr.de>; Mon,  7 Nov 2022 15:14:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zte.com.cn (client-ip=63.216.63.35; helo=mxhk.zte.com.cn; envelope-from=zhang.songyi@zte.com.cn; receiver=<UNKNOWN>)
X-Greylist: delayed 1210 seconds by postgrey-1.36 at boromir; Thu, 03 Nov 2022 19:28:15 AEDT
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2xjC0T8pz3bqt
	for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2022 19:28:13 +1100 (AEDT)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4N2xj73PC0z4xVnd;
	Thu,  3 Nov 2022 16:28:11 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
	by mse-fl1.zte.com.cn with SMTP id 2A38S1gO039712;
	Thu, 3 Nov 2022 16:28:01 +0800 (+08)
	(envelope-from zhang.songyi@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Thu, 3 Nov 2022 16:28:03 +0800 (CST)
Date: Thu, 3 Nov 2022 16:28:03 +0800 (CST)
X-Zmail-TransId: 2af963637b9327ebcee2
X-Mailer: Zmail v1.0
Message-ID: <202211031628039654230@zte.com.cn>
Mime-Version: 1.0
From: <zhang.songyi@zte.com.cn>
To: <avifishman70@gmail.com>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIGkyYzogbnBjbTd4eDogcmVtb3ZlIHJlZHVuZGFudCByZXQgdmFyaWFibGU=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 2A38S1gO039712
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID 63637B9B.000 by FangMail milter!
X-FangMail-Envelope: 1667464091/4N2xj73PC0z4xVnd/63637B9B.000/10.5.228.132/[10.5.228.132]/mse-fl1.zte.com.cn/<zhang.songyi@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63637B9B.000/4N2xj73PC0z4xVnd
X-Mailman-Approved-At: Mon, 07 Nov 2022 15:14:38 +1100
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
Cc: benjaminfair@google.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, linux-i2c@vger.kernel.org, zhang.songyi@zte.com.cn, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: zhang songyi <zhang.songyi@zte.com.cn>

Return value from npcm_i2c_get_slave_addr() directly instead of taking
this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: zhang songyi <zhang.songyi@zte.com.cn>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index bbc7359e67f7..772967862003 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -858,14 +858,10 @@ static void npcm_i2c_master_abort(struct npcm_i2c *bus)
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 static u8 npcm_i2c_get_slave_addr(struct npcm_i2c *bus, enum i2c_addr addr_type)
 {
-   u8 slave_add;
-
    if (addr_type > I2C_SLAVE_ADDR2 && addr_type <= I2C_SLAVE_ADDR10)
        dev_err(bus->dev, "get slave: try to use more than 2 SA not supported\n");

-   slave_add = ioread8(bus->reg + npcm_i2caddr[(int)addr_type]);
-
-   return slave_add;
+   return ioread8(bus->reg + npcm_i2caddr[(int)addr_type]);
 }

 static int npcm_i2c_remove_slave_addr(struct npcm_i2c *bus, u8 slave_add)
--
2.15.2
