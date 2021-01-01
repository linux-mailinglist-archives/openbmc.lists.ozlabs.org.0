Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8E72E83BE
	for <lists+openbmc@lfdr.de>; Fri,  1 Jan 2021 13:54:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D6lNZ5mJZzDqPW
	for <lists+openbmc@lfdr.de>; Fri,  1 Jan 2021 23:54:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D6kxl1LH0zDq8v
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jan 2021 23:35:06 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 101CNfSU027189;
 Fri, 1 Jan 2021 14:23:41 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 133D263A17; Fri,  1 Jan 2021 14:23:41 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v1 06/11] pinctrl: npcm7xx: Add HGPIO pin
 support to NPCM7xx pinctrl driver
Date: Fri,  1 Jan 2021 14:23:23 +0200
Message-Id: <20210101122328.43510-7-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210101122328.43510-1-tmaimon77@gmail.com>
References: <20210101122328.43510-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Tomer Maimon <tmaimon77@gmail.com>,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 65 +++++++++++++++++------
 1 file changed, 49 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index a935065cdac4..e5f58ea89917 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -504,6 +504,15 @@ static const int lkgpo2_pins[] = { 9 };
 
 static const int nprd_smi_pins[] = { 190 };
 
+static const int hgpio0_pins[] = { 20 };
+static const int hgpio1_pins[] = { 21 };
+static const int hgpio2_pins[] = { 22 };
+static const int hgpio3_pins[] = { 23 };
+static const int hgpio4_pins[] = { 24 };
+static const int hgpio5_pins[] = { 25 };
+static const int hgpio6_pins[] = { 59 };
+static const int hgpio7_pins[] = { 60 };
+
 /*
  * pin:	     name, number
  * group:    name, npins,   pins
@@ -631,6 +640,14 @@ struct npcm7xx_group {
 	NPCM7XX_GRP(lkgpo1), \
 	NPCM7XX_GRP(lkgpo2), \
 	NPCM7XX_GRP(nprd_smi), \
+	NPCM7XX_GRP(hgpio0), \
+	NPCM7XX_GRP(hgpio1), \
+	NPCM7XX_GRP(hgpio2), \
+	NPCM7XX_GRP(hgpio3), \
+	NPCM7XX_GRP(hgpio4), \
+	NPCM7XX_GRP(hgpio5), \
+	NPCM7XX_GRP(hgpio6), \
+	NPCM7XX_GRP(hgpio7), \
 	\
 
 enum {
@@ -774,6 +791,14 @@ NPCM7XX_SFUNC(lkgpo0);
 NPCM7XX_SFUNC(lkgpo1);
 NPCM7XX_SFUNC(lkgpo2);
 NPCM7XX_SFUNC(nprd_smi);
+NPCM7XX_SFUNC(hgpio0);
+NPCM7XX_SFUNC(hgpio1);
+NPCM7XX_SFUNC(hgpio2);
+NPCM7XX_SFUNC(hgpio3);
+NPCM7XX_SFUNC(hgpio4);
+NPCM7XX_SFUNC(hgpio5);
+NPCM7XX_SFUNC(hgpio6);
+NPCM7XX_SFUNC(hgpio7);
 
 /* Function names */
 static struct npcm7xx_func npcm7xx_funcs[] = {
@@ -892,6 +917,14 @@ static struct npcm7xx_func npcm7xx_funcs[] = {
 	NPCM7XX_MKFUNC(lkgpo1),
 	NPCM7XX_MKFUNC(lkgpo2),
 	NPCM7XX_MKFUNC(nprd_smi),
+	NPCM7XX_MKFUNC(hgpio0),
+	NPCM7XX_MKFUNC(hgpio1),
+	NPCM7XX_MKFUNC(hgpio2),
+	NPCM7XX_MKFUNC(hgpio3),
+	NPCM7XX_MKFUNC(hgpio4),
+	NPCM7XX_MKFUNC(hgpio5),
+	NPCM7XX_MKFUNC(hgpio6),
+	NPCM7XX_MKFUNC(hgpio7),
 };
 
 #define NPCM7XX_PINCFG(a, b, c, d, e, f, g, h, i, j, k) \
@@ -944,12 +977,12 @@ static const struct npcm7xx_pincfg pincfg[] = {
 	NPCM7XX_PINCFG(17,      pspi2, MFSEL3, 13,     smb4den, I2CSEGSEL, 23,  none, NONE, 0,       DS(8, 12)),
 	NPCM7XX_PINCFG(18,      pspi2, MFSEL3, 13,	 smb4b, I2CSEGSEL, 14,  none, NONE, 0,	     DS(8, 12)),
 	NPCM7XX_PINCFG(19,      pspi2, MFSEL3, 13,	 smb4b, I2CSEGSEL, 14,  none, NONE, 0,	     DS(8, 12)),
-	NPCM7XX_PINCFG(20,	smb4c, I2CSEGSEL, 15,    smb15, MFSEL3, 8,      none, NONE, 0,	     0),
-	NPCM7XX_PINCFG(21,	smb4c, I2CSEGSEL, 15,    smb15, MFSEL3, 8,      none, NONE, 0,	     0),
-	NPCM7XX_PINCFG(22,      smb4d, I2CSEGSEL, 16,	 smb14, MFSEL3, 7,      none, NONE, 0,	     0),
-	NPCM7XX_PINCFG(23,      smb4d, I2CSEGSEL, 16,	 smb14, MFSEL3, 7,      none, NONE, 0,	     0),
-	NPCM7XX_PINCFG(24,	 ioxh, MFSEL3, 18,	  none, NONE, 0,	none, NONE, 0,	     DS(8, 12)),
-	NPCM7XX_PINCFG(25,	 ioxh, MFSEL3, 18,	  none, NONE, 0,	none, NONE, 0,	     DS(8, 12)),
+	NPCM7XX_PINCFG(20,	hgpio0, MFSEL2, 24,      smb15, MFSEL3, 8,      smb4c, I2CSEGSEL, 15,	     0),
+	NPCM7XX_PINCFG(21,	hgpio1, MFSEL2, 25,      smb15, MFSEL3, 8,      smb4c, I2CSEGSEL, 15,	     0),
+	NPCM7XX_PINCFG(22,      hgpio2, MFSEL2, 26,	 smb14, MFSEL3, 7,      smb4d, I2CSEGSEL, 16,	     0),
+	NPCM7XX_PINCFG(23,      hgpio3, MFSEL2, 27,	 smb14, MFSEL3, 7,      smb4d, I2CSEGSEL, 16,	     0),
+	NPCM7XX_PINCFG(24,	 hgpio4, MFSEL2, 28,	ioxh, MFSEL3, 18,	none, NONE, 0,	     DS(8, 12)),
+	NPCM7XX_PINCFG(25,	 hgpio5, MFSEL2, 29,	ioxh, MFSEL3, 18,	none, NONE, 0,	     DS(8, 12)),
 	NPCM7XX_PINCFG(26,	 smb5, MFSEL1, 2,	  none, NONE, 0,	none, NONE, 0,	     0),
 	NPCM7XX_PINCFG(27,	 smb5, MFSEL1, 2,	  none, NONE, 0,	none, NONE, 0,	     0),
 	NPCM7XX_PINCFG(28,	 smb4, MFSEL1, 1,	  none, NONE, 0,	none, NONE, 0,	     0),
@@ -982,8 +1015,8 @@ static const struct npcm7xx_pincfg pincfg[] = {
 	NPCM7XX_PINCFG(56,	r1err, MFSEL1, 12,	  none, NONE, 0,	none, NONE, 0,	     0),
 	NPCM7XX_PINCFG(57,       r1md, MFSEL1, 13,        none, NONE, 0,        none, NONE, 0,       DS(2, 4)),
 	NPCM7XX_PINCFG(58,       r1md, MFSEL1, 13,        none, NONE, 0,	none, NONE, 0,	     DS(2, 4)),
-	NPCM7XX_PINCFG(59,	smb3d, I2CSEGSEL, 13,	  none, NONE, 0,	none, NONE, 0,	     0),
-	NPCM7XX_PINCFG(60,	smb3d, I2CSEGSEL, 13,	  none, NONE, 0,	none, NONE, 0,	     0),
+	NPCM7XX_PINCFG(59,	hgpio6, MFSEL2, 30,	  smb3d, I2CSEGSEL, 13,	none, NONE, 0,	     0),
+	NPCM7XX_PINCFG(60,	hgpio7, MFSEL2, 31,	  smb3d, I2CSEGSEL, 13,	none, NONE, 0,	     0),
 	NPCM7XX_PINCFG(61,      uart1, MFSEL1, 10,	  none, NONE, 0,	none, NONE, 0,     GPO),
 	NPCM7XX_PINCFG(62,      uart1, MFSEL1, 10,    bmcuart1, MFSEL3, 24,	none, NONE, 0,     GPO),
 	NPCM7XX_PINCFG(63,      uart1, MFSEL1, 10,    bmcuart1, MFSEL3, 24,	none, NONE, 0,     GPO),
@@ -1188,12 +1221,12 @@ static const struct pinctrl_pin_desc npcm7xx_pins[] = {
 	PINCTRL_PIN(17, "GPIO17/PSPI2DI/SMB4DEN"),
 	PINCTRL_PIN(18, "GPIO18/PSPI2D0/SMB4BSDA"),
 	PINCTRL_PIN(19, "GPIO19/PSPI2CK/SMB4BSCL"),
-	PINCTRL_PIN(20, "GPIO20/SMB4CSDA/SMB15SDA"),
-	PINCTRL_PIN(21, "GPIO21/SMB4CSCL/SMB15SCL"),
-	PINCTRL_PIN(22, "GPIO22/SMB4DSDA/SMB14SDA"),
-	PINCTRL_PIN(23, "GPIO23/SMB4DSCL/SMB14SCL"),
-	PINCTRL_PIN(24, "GPIO24/IOXHDO"),
-	PINCTRL_PIN(25, "GPIO25/IOXHDI"),
+	PINCTRL_PIN(20, "GPIO20/HGPIO0/SMB4CSDA/SMB15SDA"),
+	PINCTRL_PIN(21, "GPIO21/HGPIO1/SMB4CSCL/SMB15SCL"),
+	PINCTRL_PIN(22, "GPIO22/HGPIO2/SMB4DSDA/SMB14SDA"),
+	PINCTRL_PIN(23, "GPIO23/HGPIO3/SMB4DSCL/SMB14SCL"),
+	PINCTRL_PIN(24, "GPIO24/HGPIO4/IOXHDO"),
+	PINCTRL_PIN(25, "GPIO25/HGPIO5/IOXHDI"),
 	PINCTRL_PIN(26, "GPIO26/SMB5SDA"),
 	PINCTRL_PIN(27, "GPIO27/SMB5SCL"),
 	PINCTRL_PIN(28, "GPIO28/SMB4SDA"),
@@ -1226,8 +1259,8 @@ static const struct pinctrl_pin_desc npcm7xx_pins[] = {
 	PINCTRL_PIN(56, "GPIO56/R1RXERR"),
 	PINCTRL_PIN(57, "GPIO57/R1MDC"),
 	PINCTRL_PIN(58, "GPIO58/R1MDIO"),
-	PINCTRL_PIN(59, "GPIO59/SMB3DSDA"),
-	PINCTRL_PIN(60, "GPIO60/SMB3DSCL"),
+	PINCTRL_PIN(59, "GPIO59/HGPIO6/SMB3DSDA"),
+	PINCTRL_PIN(60, "GPIO60/HGPIO7/SMB3DSCL"),
 	PINCTRL_PIN(61, "GPO61/nDTR1_BOUT1/STRAP6"),
 	PINCTRL_PIN(62, "GPO62/nRTST1/STRAP5"),
 	PINCTRL_PIN(63, "GPO63/TXD1/STRAP4"),
-- 
2.22.0

