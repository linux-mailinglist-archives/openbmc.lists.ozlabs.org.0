Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A938492EFD0
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2024 21:38:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKlQn3WvMz3fQg
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2024 05:38:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKlPy4tmRz3cZr
	for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2024 05:38:13 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 46BJc21p028616
	for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2024 22:38:02 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 22:38:01 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 03:37:58 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 12 Jul 2024 03:37:57 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 8F6785F66E;
	Thu, 11 Jul 2024 22:37:56 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 8F4C6DC0F7F; Thu, 11 Jul 2024 22:37:56 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>
Subject: [PATCH v1 4/7] pinctrl: nuvoton: npcm8xx: remove unused smb4den pin, group, function
Date: Thu, 11 Jul 2024 22:37:46 +0300
Message-ID: <20240711193749.2397471-5-tmaimon77@gmail.com>
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

Remove unused smb4den pin, group and function on the Nuvoton NPCM8XX BMC
SoC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index f342aec3f6ca..396bd07e7c74 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -438,7 +438,6 @@ static const int smb4_pins[]  = { 28, 29 };
 static const int smb4b_pins[] = { 18, 19 };
 static const int smb4c_pins[] = { 20, 21 };
 static const int smb4d_pins[] = { 22, 23 };
-static const int smb4den_pins[] = { 17 };
 static const int smb5_pins[]  = { 26, 27 };
 static const int smb5b_pins[] = { 13, 12 };
 static const int smb5c_pins[] = { 15, 14 };
@@ -700,7 +699,6 @@ struct npcm8xx_pingroup {
 	NPCM8XX_GRP(smb4b), \
 	NPCM8XX_GRP(smb4c), \
 	NPCM8XX_GRP(smb4d), \
-	NPCM8XX_GRP(smb4den), \
 	NPCM8XX_GRP(smb5), \
 	NPCM8XX_GRP(smb5b), \
 	NPCM8XX_GRP(smb5c), \
@@ -949,7 +947,6 @@ NPCM8XX_SFUNC(smb4);
 NPCM8XX_SFUNC(smb4b);
 NPCM8XX_SFUNC(smb4c);
 NPCM8XX_SFUNC(smb4d);
-NPCM8XX_SFUNC(smb4den);
 NPCM8XX_SFUNC(smb5);
 NPCM8XX_SFUNC(smb5b);
 NPCM8XX_SFUNC(smb5c);
@@ -1173,7 +1170,6 @@ static struct npcm8xx_func npcm8xx_funcs[] = {
 	NPCM8XX_MKFUNC(smb4b),
 	NPCM8XX_MKFUNC(smb4c),
 	NPCM8XX_MKFUNC(smb4d),
-	NPCM8XX_MKFUNC(smb4den),
 	NPCM8XX_MKFUNC(smb5),
 	NPCM8XX_MKFUNC(smb5b),
 	NPCM8XX_MKFUNC(smb5c),
@@ -1348,7 +1344,7 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(14,	gspi, MFSEL1, 24,	smb5c, I2CSEGSEL, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(15,	gspi, MFSEL1, 24,	smb5c, I2CSEGSEL, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(16,	lkgpo0, FLOCKR1, 0,	smb7b, I2CSEGSEL, 27,	tp_gpio2b, MFSEL7, 10,	none, NONE, 0,		none, NONE, 0,		SLEW),
-	NPCM8XX_PINCFG(17,	pspi, MFSEL3, 13,	cp1gpio5, MFSEL6, 7,	smb4den, I2CSEGSEL, 23,	none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(17,	pspi, MFSEL3, 13,	cp1gpio5, MFSEL6, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(18,	pspi, MFSEL3, 13,	smb4b, I2CSEGSEL, 14,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(19,	pspi, MFSEL3, 13,	smb4b, I2CSEGSEL, 14,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(20,	hgpio0,	MFSEL2, 24,	smb15, MFSEL3, 8,	smb4c, I2CSEGSEL, 15,	none, NONE, 0,		none, NONE, 0,		SLEW),
-- 
2.34.1

