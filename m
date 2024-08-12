Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E0A94F113
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2024 17:01:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjHlS3X6Tz301B
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 01:01:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjHhW5s3Jz2yFC
	for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2024 00:58:34 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 47CEwN47032091
	for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2024 17:58:24 +0300
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 17:58:23 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 22:58:21 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 22:58:21 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 55AA75F5DD;
	Mon, 12 Aug 2024 17:58:20 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 53914DC113B; Mon, 12 Aug 2024 17:58:20 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
        <joel@jms.id.au>
Subject: [linux dev-6.6 v3 4/7] pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
Date: Mon, 12 Aug 2024 17:58:13 +0300
Message-ID: <20240812145816.3301570-5-tmaimon77@gmail.com>
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

This patch adds support for GPIO pins GPI35 and GPI36 on the Nuvoton
NPCM8xx BMC SoC.

The pins are configured for only for input.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index ea36b044240a..fe9d18b10dd1 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -321,8 +321,8 @@ static struct irq_chip npcmgpio_irqchip = {
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
-static const int gpi36_pins[] = { 58 };
-static const int gpi35_pins[] = { 58 };
+static const int gpi36_pins[] = { 36 };
+static const int gpi35_pins[] = { 35 };
 
 static const int tp_jtag3_pins[] = { 44, 62, 45, 46 };
 static const int tp_uart_pins[] = { 50, 51 };
@@ -1363,6 +1363,8 @@ static const struct npcm8xx_pincfg pincfg[] = {
 	NPCM8XX_PINCFG(32,	spi0cs1, MFSEL1, 3,	smb14b, MFSEL7, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(33,	i3c4, MFSEL6, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(34,	i3c4, MFSEL6, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
+	NPCM8XX_PINCFG(35,	gpi35, MFSEL5, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
+	NPCM8XX_PINCFG(36,	gpi36, MFSEL5, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
 	NPCM8XX_PINCFG(37,	smb3c, I2CSEGSEL, 12,	smb23, MFSEL5, 31,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(38,	smb3c, I2CSEGSEL, 12,	smb23, MFSEL5, 31,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
 	NPCM8XX_PINCFG(39,	smb3b, I2CSEGSEL, 11,	smb22, MFSEL5, 30,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
@@ -1608,6 +1610,8 @@ static const struct pinctrl_pin_desc npcm8xx_pins[] = {
 	PINCTRL_PIN(32, "GPIO32/SMB14B_SCL/SPI0_nCS1"),
 	PINCTRL_PIN(33, "GPIO33/I3C4_SCL"),
 	PINCTRL_PIN(34, "GPIO34/I3C4_SDA"),
+	PINCTRL_PIN(35, "MCBPCK/GPI35_AHB2PCI_DIS"),
+	PINCTRL_PIN(36, "SYSBPCK/GPI36"),
 	PINCTRL_PIN(37, "GPIO37/SMB3C_SDA/SMB23_SDA"),
 	PINCTRL_PIN(38, "GPIO38/SMB3C_SCL/SMB23_SCL"),
 	PINCTRL_PIN(39, "GPIO39/SMB3B_SDA/SMB22_SDA"),
@@ -2042,7 +2046,7 @@ static int npcm8xx_gpio_request_enable(struct pinctrl_dev *pctldev,
 	const unsigned int *pin = &offset;
 	int mode = fn_gpio;
 
-	if (pin[0] >= 183 && pin[0] <= 189)
+	if ((pin[0] >= 183 && pin[0] <= 189) || pin[0] == 35 || pin[0] == 36)
 		mode = pincfg[pin[0]].fn0;
 
 	npcm8xx_setfunc(npcm->gcr_regmap, &offset, 1, mode);
-- 
2.34.1

