Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 418AF58DA02
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 16:00:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2F822K3zz3blw
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 00:00:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2F7g0BPsz2ywJ
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 23:59:54 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 279DxgZ8006268
	for <openbmc@lists.ozlabs.org>; Tue, 9 Aug 2022 16:59:42 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 9 Aug
 2022 16:59:41 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Tue, 9 Aug 2022
 21:59:40 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 9 Aug 2022 21:59:39 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id F02EA62EFD; Tue,  9 Aug 2022 16:59:38 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1] reset: npcm: fix NPCM8XX USB PHY reset sequance
Date: Tue, 9 Aug 2022 16:59:35 +0300
Message-ID: <20220809135935.26452-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Fix NPCM8XX reset USB PHY reset sequence by setting the IPRST2 and
IPRST4 registers correct reset values.

Fixes: d4bee4457df4 ("reset: npcm: Add NPCM8XX support")
Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/reset/reset-npcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
index 24c55efa98e5..f2333506b0a6 100644
--- a/drivers/reset/reset-npcm.c
+++ b/drivers/reset/reset-npcm.c
@@ -291,7 +291,7 @@ static void npcm_usb_reset_npcm8xx(struct npcm_rc_data *rc)
 	iprst2 |= ipsrst2_bits;
 	iprst3 |= (ipsrst3_bits | NPCM_IPSRST3_USBPHY1 |
 		   NPCM_IPSRST3_USBPHY2);
-	iprst2 |= ipsrst4_bits;
+	iprst4 |= ipsrst4_bits;
 
 	writel(iprst1, rc->base + NPCM_IPSRST1);
 	writel(iprst2, rc->base + NPCM_IPSRST2);
-- 
2.33.0

