Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D092EAC80
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 15:00:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9DfJ6c5LzDqfF
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 01:00:24 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9DKR1s6RzDqb1
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 00:45:46 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 105DjFZn005908;
 Tue, 5 Jan 2021 15:45:15 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 9A54163A19; Tue,  5 Jan 2021 15:45:15 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v2 01/11] clk: npcm7xx: add read only flag to
 divider clocks
Date: Tue,  5 Jan 2021 15:44:58 +0200
Message-Id: <20210105134508.225702-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210105134508.225702-1-tmaimon77@gmail.com>
References: <20210105134508.225702-1-tmaimon77@gmail.com>
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

Add read only flag to all divider clocks except
SPI3 clock.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/clk/clk-npcm7xx.c | 70 +++++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
index 27a86b7a34db..bf721ec2bbc6 100644
--- a/drivers/clk/clk-npcm7xx.c
+++ b/drivers/clk/clk-npcm7xx.c
@@ -370,67 +370,73 @@ static const struct npcm7xx_clk_div_fixed_data npcm7xx_divs_fx[] __initconst = {
 
 /* configurable dividers: */
 static const struct npcm7xx_clk_div_data npcm7xx_divs[] __initconst = {
-	{NPCM7XX_CLKDIV1, 28, 3, NPCM7XX_CLK_S_ADC,
-	NPCM7XX_CLK_S_TIMER, CLK_DIVIDER_POWER_OF_TWO, 0, NPCM7XX_CLK_ADC},
+	{NPCM7XX_CLKDIV1, 28, 3, NPCM7XX_CLK_S_ADC, NPCM7XX_CLK_S_TIMER,
+		CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0,
+		NPCM7XX_CLK_ADC},
 	/*30-28 ADCCKDIV*/
-	{NPCM7XX_CLKDIV1, 26, 2, NPCM7XX_CLK_S_AHB,
-	NPCM7XX_CLK_S_AXI, 0, CLK_IS_CRITICAL, NPCM7XX_CLK_AHB},
+	{NPCM7XX_CLKDIV1, 26, 2, NPCM7XX_CLK_S_AHB, NPCM7XX_CLK_S_AXI,
+		CLK_DIVIDER_READ_ONLY, CLK_IS_CRITICAL, NPCM7XX_CLK_AHB},
 	/*27-26 CLK4DIV*/
 	{NPCM7XX_CLKDIV1, 21, 5, NPCM7XX_CLK_S_TIMER,
-	NPCM7XX_CLK_S_TIM_MUX, 0, 0, NPCM7XX_CLK_TIMER},
+	NPCM7XX_CLK_S_TIM_MUX, CLK_DIVIDER_READ_ONLY, 0, NPCM7XX_CLK_TIMER},
 	/*25-21 TIMCKDIV*/
 	{NPCM7XX_CLKDIV1, 16, 5, NPCM7XX_CLK_S_UART,
-	NPCM7XX_CLK_S_UART_MUX, 0, 0, NPCM7XX_CLK_UART},
+	NPCM7XX_CLK_S_UART_MUX, CLK_DIVIDER_READ_ONLY, 0, NPCM7XX_CLK_UART},
 	/*20-16 UARTDIV*/
 	{NPCM7XX_CLKDIV1, 11, 5, NPCM7XX_CLK_S_MMC,
-	NPCM7XX_CLK_S_SD_MUX, 0, 0, NPCM7XX_CLK_MMC},
+	NPCM7XX_CLK_S_SD_MUX, CLK_DIVIDER_READ_ONLY, 0, NPCM7XX_CLK_MMC},
 	/*15-11 MMCCKDIV*/
 	{NPCM7XX_CLKDIV1, 6, 5, NPCM7XX_CLK_S_SPI3,
 	NPCM7XX_CLK_S_AHB, 0, 0, NPCM7XX_CLK_SPI3},
 	/*10-6 AHB3CKDIV*/
 	{NPCM7XX_CLKDIV1, 2, 4, NPCM7XX_CLK_S_PCI,
-	NPCM7XX_CLK_S_GFX_MUX, 0, 0, NPCM7XX_CLK_PCI},
+	NPCM7XX_CLK_S_GFX_MUX, CLK_DIVIDER_READ_ONLY, 0, NPCM7XX_CLK_PCI},
 	/*5-2 PCICKDIV*/
-	{NPCM7XX_CLKDIV1, 0, 1, NPCM7XX_CLK_S_AXI,
-	NPCM7XX_CLK_S_CPU_MUX, CLK_DIVIDER_POWER_OF_TWO, CLK_IS_CRITICAL,
-	NPCM7XX_CLK_AXI},/*0 CLK2DIV*/
+	{NPCM7XX_CLKDIV1, 0, 1, NPCM7XX_CLK_S_AXI, NPCM7XX_CLK_S_CPU_MUX,
+		CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO,
+		CLK_IS_CRITICAL, NPCM7XX_CLK_AXI},/*0 CLK2DIV*/
 
-	{NPCM7XX_CLKDIV2, 30, 2, NPCM7XX_CLK_S_APB4,
-	NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, 0, NPCM7XX_CLK_APB4},
+	{NPCM7XX_CLKDIV2, 30, 2, NPCM7XX_CLK_S_APB4, NPCM7XX_CLK_S_AHB,
+		CLK_DIVIDER_READ_ONLY| CLK_DIVIDER_POWER_OF_TWO, 0,
+		NPCM7XX_CLK_APB4},
 	/*31-30 APB4CKDIV*/
-	{NPCM7XX_CLKDIV2, 28, 2, NPCM7XX_CLK_S_APB3,
-	NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, 0, NPCM7XX_CLK_APB3},
+	{NPCM7XX_CLKDIV2, 28, 2, NPCM7XX_CLK_S_APB3, NPCM7XX_CLK_S_AHB,
+		CLK_DIVIDER_READ_ONLY| CLK_DIVIDER_POWER_OF_TWO, 0,
+		NPCM7XX_CLK_APB3},
 	/*29-28 APB3CKDIV*/
-	{NPCM7XX_CLKDIV2, 26, 2, NPCM7XX_CLK_S_APB2,
-	NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, 0, NPCM7XX_CLK_APB2},
+	{NPCM7XX_CLKDIV2, 26, 2, NPCM7XX_CLK_S_APB2, NPCM7XX_CLK_S_AHB,
+		CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0,
+		NPCM7XX_CLK_APB2},
 	/*27-26 APB2CKDIV*/
-	{NPCM7XX_CLKDIV2, 24, 2, NPCM7XX_CLK_S_APB1,
-	NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, 0, NPCM7XX_CLK_APB1},
+	{NPCM7XX_CLKDIV2, 24, 2, NPCM7XX_CLK_S_APB1, NPCM7XX_CLK_S_AHB,
+		CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0,
+		NPCM7XX_CLK_APB1},
 	/*25-24 APB1CKDIV*/
-	{NPCM7XX_CLKDIV2, 22, 2, NPCM7XX_CLK_S_APB5,
-	NPCM7XX_CLK_S_AHB, CLK_DIVIDER_POWER_OF_TWO, 0, NPCM7XX_CLK_APB5},
+	{NPCM7XX_CLKDIV2, 22, 2, NPCM7XX_CLK_S_APB5, NPCM7XX_CLK_S_AHB,
+		CLK_DIVIDER_READ_ONLY | CLK_DIVIDER_POWER_OF_TWO, 0,
+		NPCM7XX_CLK_APB5},
 	/*23-22 APB5CKDIV*/
-	{NPCM7XX_CLKDIV2, 16, 5, NPCM7XX_CLK_S_CLKOUT,
-	NPCM7XX_CLK_S_CLKOUT_MUX, 0, 0, NPCM7XX_CLK_CLKOUT},
+	{NPCM7XX_CLKDIV2, 16, 5, NPCM7XX_CLK_S_CLKOUT, NPCM7XX_CLK_S_CLKOUT_MUX,
+		 CLK_DIVIDER_READ_ONLY, 0, NPCM7XX_CLK_CLKOUT},
 	/*20-16 CLKOUTDIV*/
-	{NPCM7XX_CLKDIV2, 13, 3, NPCM7XX_CLK_S_GFX,
-	NPCM7XX_CLK_S_GFX_MUX, 0, 0, NPCM7XX_CLK_GFX},
+	{NPCM7XX_CLKDIV2, 13, 3, NPCM7XX_CLK_S_GFX, NPCM7XX_CLK_S_GFX_MUX,
+		CLK_DIVIDER_READ_ONLY, 0, NPCM7XX_CLK_GFX},
 	/*15-13 GFXCKDIV*/
-	{NPCM7XX_CLKDIV2, 8, 5, NPCM7XX_CLK_S_USB_BRIDGE,
-	NPCM7XX_CLK_S_SU_MUX, 0, 0, NPCM7XX_CLK_SU},
+	{NPCM7XX_CLKDIV2, 8, 5, NPCM7XX_CLK_S_USB_BRIDGE, NPCM7XX_CLK_S_SU_MUX,
+		CLK_DIVIDER_READ_ONLY, 0, NPCM7XX_CLK_SU},
 	/*12-8 SUCKDIV*/
-	{NPCM7XX_CLKDIV2, 4, 4, NPCM7XX_CLK_S_USB_HOST,
-	NPCM7XX_CLK_S_SU_MUX, 0, 0, NPCM7XX_CLK_SU48},
+	{NPCM7XX_CLKDIV2, 4, 4, NPCM7XX_CLK_S_USB_HOST, NPCM7XX_CLK_S_SU_MUX,
+		CLK_DIVIDER_READ_ONLY, 0, NPCM7XX_CLK_SU48},
 	/*7-4 SU48CKDIV*/
 	{NPCM7XX_CLKDIV2, 0, 4, NPCM7XX_CLK_S_SDHC,
-	NPCM7XX_CLK_S_SD_MUX, 0, 0, NPCM7XX_CLK_SDHC}
+	NPCM7XX_CLK_S_SD_MUX, CLK_DIVIDER_READ_ONLY, 0, NPCM7XX_CLK_SDHC}
 	,/*3-0 SD1CKDIV*/
 
 	{NPCM7XX_CLKDIV3, 6, 5, NPCM7XX_CLK_S_SPI0,
-	NPCM7XX_CLK_S_AHB, 0, 0, NPCM7XX_CLK_SPI0},
+	NPCM7XX_CLK_S_AHB, CLK_DIVIDER_READ_ONLY, 0, NPCM7XX_CLK_SPI0},
 	/*10-6 SPI0CKDV*/
 	{NPCM7XX_CLKDIV3, 1, 5, NPCM7XX_CLK_S_SPIX,
-	NPCM7XX_CLK_S_AHB, 0, 0, NPCM7XX_CLK_SPIX},
+	NPCM7XX_CLK_S_AHB, CLK_DIVIDER_READ_ONLY, 0, NPCM7XX_CLK_SPIX},
 	/*5-1 SPIXCKDV*/
 
 };
-- 
2.22.0

