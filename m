Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1045E94F106
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2024 17:00:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjHkP0K5pz2yYy
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 01:00:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjHhW439cz2yF6
	for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2024 00:58:31 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 47CEwNFU032088
	for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2024 17:58:23 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 17:58:22 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 22:58:20 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 22:58:20 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 97BD15F5FD;
	Mon, 12 Aug 2024 17:58:19 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 96137DC113B; Mon, 12 Aug 2024 17:58:19 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
        <joel@jms.id.au>
Subject: [linux dev-6.6 v3 2/7] pinctrl: nuvoton: npcm8xx: remove non-existent pins, groups, functions
Date: Mon, 12 Aug 2024 17:58:11 +0300
Message-ID: <20240812145816.3301570-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812145816.3301570-1-tmaimon77@gmail.com>
References: <20240812145816.3301570-1-tmaimon77@gmail.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Remove non-existent smb4den abd lpcclk pins, groups and functions on
the Nuvoton NPCM8XX BMC SoC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index da21f6a45888..e146c161076c 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -442,7 +442,6 @@ static const int smb4_pins[]  = { 28, 29 };
 static const int smb4b_pins[] = { 18, 19 };
 static const int smb4c_pins[] = { 20, 21 };
 static const int smb4d_pins[] = { 22, 23 };
-static const int smb4den_pins[] = { 17 };
 static const int smb5_pins[]  = { 26, 27 };
 static const int smb5b_pins[] = { 13, 12 };
 static const int smb5c_pins[] = { 15, 14 };
@@ -575,7 +574,6 @@ static const int spi3cs3_pins[] = { 189 };
 static const int ddc_pins[] = { 204, 205, 206, 207 };
 
 static const int lpc_pins[] = { 95, 161, 163, 164, 165, 166, 167 };
-static const int lpcclk_pins[] = { 168 };
 static const int espi_pins[] = { 95, 161, 163, 164, 165, 166, 167, 168 };
 
 static const int lkgpo0_pins[] = { 16 };
@@ -704,7 +702,6 @@ struct npcm8xx_pingroup {
 	NPCM8XX_GRP(smb4b), \
 	NPCM8XX_GRP(smb4c), \
 	NPCM8XX_GRP(smb4d), \
-	NPCM8XX_GRP(smb4den), \
 	NPCM8XX_GRP(smb5), \
 	NPCM8XX_GRP(smb5b), \
 	NPCM8XX_GRP(smb5c), \
@@ -813,7 +810,6 @@ struct npcm8xx_pingroup {
 	NPCM8XX_GRP(spi3cs3), \
 	NPCM8XX_GRP(spi0cs1), \
 	NPCM8XX_GRP(lpc), \
-	NPCM8XX_GRP(lpcclk), \
 	NPCM8XX_GRP(espi), \
 	NPCM8XX_GRP(lkgpo0), \
 	NPCM8XX_GRP(lkgpo1), \
@@ -953,7 +949,6 @@ NPCM8XX_SFUNC(smb4);
 NPCM8XX_SFUNC(smb4b);
 NPCM8XX_SFUNC(smb4c);
 NPCM8XX_SFUNC(smb4d);
-NPCM8XX_SFUNC(smb4den);
 NPCM8XX_SFUNC(smb5);
 NPCM8XX_SFUNC(smb5b);
 NPCM8XX_SFUNC(smb5c);
@@ -1061,7 +1056,6 @@ NPCM8XX_SFUNC(spi3cs2);
 NPCM8XX_SFUNC(spi3cs3);
 NPCM8XX_SFUNC(spi0cs1);
 NPCM8XX_SFUNC(lpc);
-NPCM8XX_SFUNC(lpcclk);
 NPCM8XX_SFUNC(espi);
 NPCM8XX_SFUNC(lkgpo0);
 NPCM8XX_SFUNC(lkgpo1);
@@ -1177,7 +1171,6 @@ static struct npcm8xx_func npcm8xx_funcs[] = {
 	NPCM8XX_MKFUNC(smb4b),
 	NPCM8XX_MKFUNC(smb4c),
 	NPCM8XX_MKFUNC(smb4d),
-	NPCM8XX_MKFUNC(smb4den),
 	NPCM8XX_MKFUNC(smb5),
 	NPCM8XX_MKFUNC(smb5b),
 	NPCM8XX_MKFUNC(smb5c),
@@ -1285,7 +1278,6 @@ static struct npcm8xx_func npcm8xx_funcs[] = {
 	NPCM8XX_MKFUNC(spi3cs3),
 	NPCM8XX_MKFUNC(spi0cs1),
 	NPCM8XX_MKFUNC(lpc),
-	NPCM8XX_MKFUNC(lpcclk),
 	NPCM8XX_MKFUNC(espi),
 	NPCM8XX_MKFUNC(lkgpo0),
 	NPCM8XX_MKFUNC(lkgpo1),
@@ -1352,7 +1344,7 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(14,	gspi, MFSEL1, 24,	smb5c, I2CSEGSEL, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(15,	gspi, MFSEL1, 24,	smb5c, I2CSEGSEL, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(16,	lkgpo0, FLOCKR1, 0,	smb7b, I2CSEGSEL, 27,	tp_gpio2b, MFSEL7, 10,	none, NONE, 0,		none, NONE, 0,		SLEW),
-	NPCM8XX_PINCFG(17,	pspi, MFSEL3, 13,	cp1gpio5, MFSEL6, 7,	smb4den, I2CSEGSEL, 23,	none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(17,	pspi, MFSEL3, 13,	cp1gpio5, MFSEL6, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(18,	pspi, MFSEL3, 13,	smb4b, I2CSEGSEL, 14,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(19,	pspi, MFSEL3, 13,	smb4b, I2CSEGSEL, 14,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(20,	hgpio0,	MFSEL2, 24,	smb15, MFSEL3, 8,	smb4c, I2CSEGSEL, 15,	none, NONE, 0,		none, NONE, 0,		SLEW),
@@ -1501,7 +1493,7 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(165,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(166,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(167,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-	NPCM8XX_PINCFG(168,	lpcclk, MFSEL1, 31,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
+	NPCM8XX_PINCFG(168,	none, NONE, 0,		espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(169,	scipme, MFSEL3, 0,	smb21, MFSEL5, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(170,	smi, MFSEL1, 22,	smb21, MFSEL5, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(171,	smb6, MFSEL3, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
-- 
2.34.1

