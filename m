Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D4792EFE7
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2024 21:41:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKlTk455vz3g8F
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2024 05:41:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKlQ12f2kz3cZ1
	for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2024 05:38:16 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 46BJc37j028621
	for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2024 22:38:04 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 22:38:02 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 03:37:59 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 12 Jul 2024 03:37:59 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id EEA3F5F675;
	Thu, 11 Jul 2024 22:37:57 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id EE3C9DC0F7F; Thu, 11 Jul 2024 22:37:57 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>
Subject: [PATCH v1 6/7] pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configuration
Date: Thu, 11 Jul 2024 22:37:48 +0300
Message-ID: <20240711193749.2397471-7-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240711193749.2397471-1-tmaimon77@gmail.com>
References: <20240711193749.2397471-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Modify clkrun and serirq pin configuration on the Nuvoton NPCM8XX BMC
SoC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index bc947d0d6ede..2cc433a74ad2 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -1485,13 +1485,13 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(159,	mmc, MFSEL3, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(160,	clkout, MFSEL1, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
 	NPCM8XX_PINCFG(161,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(162,	serirq, MFSEL1, 31,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
+	NPCM8XX_PINCFG(162,	clkrun, MFSEL3, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
 	NPCM8XX_PINCFG(163,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(164,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(165,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(166,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(167,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(168,	none, NONE, 0,		espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
+	NPCM8XX_PINCFG(168,	serirq, MFSEL1, 31,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(169,	scipme, MFSEL3, 0,	smb21, MFSEL5, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(170,	smi, MFSEL1, 22,	smb21, MFSEL5, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(171,	smb6, MFSEL3, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-- 
2.34.1

