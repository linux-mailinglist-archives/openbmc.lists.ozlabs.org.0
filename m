Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ABD933260
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 21:44:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNqJw4Yhnz3gB7
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2024 05:44:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNqDY21TVz3fRp
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2024 05:40:44 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 46GJeExu022543
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 22:40:15 +0300
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 16 Jul
 2024 22:40:14 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Jul
 2024 03:40:12 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 17 Jul 2024 03:40:12 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 5A5D05F635;
	Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 4C912DC0D47; Tue, 16 Jul 2024 22:40:11 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>
Subject: [PATCH v2 1/7] dt-bindings: pinctrl: npcm8xx: remove non-existent groups and functions
Date: Tue, 16 Jul 2024 22:40:02 +0300
Message-ID: <20240716194008.3502068-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716194008.3502068-1-tmaimon77@gmail.com>
References: <20240716194008.3502068-1-tmaimon77@gmail.com>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Remove non-existent smb4den and lpcclk groups and functions from Nuvoton
NPCM8XX Pin controller binding documentation.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 70 +++++++++----------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
index 814b9598edd1..8cd1f442240e 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
@@ -71,51 +71,49 @@ patternProperties:
           One or more groups of pins to mux to a certain function
         items:
           enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi,
-                  smb5b, smb5c, lkgpo0, pspi, jm1, jm2, smb4den, smb4b,
-                  smb4c, smb15, smb16, smb17, smb18, smb19, smb20, smb21,
-                  smb22, smb23, smb23b, smb4d, smb14, smb5, smb4, smb3,
-                  spi0cs1, spi0cs2, spi0cs3, spi1cs0, spi1cs1, spi1cs2,
-                  spi1cs3, spi1cs23, smb3c, smb3b, bmcuart0a, uart1, jtag2,
-                  bmcuart1, uart2, sg1mdio, bmcuart0b, r1err, r1md, r1oen,
-                  r2oen, rmii3, r3oen, smb3d, fanin0, fanin1, fanin2, fanin3,
-                  fanin4, fanin5, fanin6, fanin7, fanin8, fanin9, fanin10,
-                  fanin11, fanin12, fanin13, fanin14, fanin15, pwm0, pwm1, pwm2,
-                  pwm3, r2, r2err, r2md, r3rxer, ga20kbc, smb5d, lpc, espi, rg2,
-                  ddr, i3c0, i3c1, i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2,
-                  smb2c, smb2b, smb1c, smb1b, smb8, smb9, smb10, smb11, sd1,
-                  sd1pwr, pwm4, pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11,
-                  mmc8, mmc, mmcwp, mmccd, mmcrst, clkout, serirq, lpcclk,
-                  scipme, smi, smb6, smb6b, smb6c, smb6d, smb7, smb7b, smb7c,
-                  smb7d, spi1, faninx, r1, spi3, spi3cs1, spi3quad, spi3cs2,
-                  spi3cs3, nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio,
-                  wdog1, wdog2, smb12, smb13, spix, spixcs1, clkreq, hgpio0,
-                  hgpio1, hgpio2, hgpio3, hgpio4, hgpio5, hgpio6, hgpio7, bu4,
-                  bu4b, bu5, bu5b, bu6, gpo187 ]
+                  smb5b, smb5c, lkgpo0, pspi, jm1, jm2, smb4b, smb4c, smb15,
+                  smb16, smb17, smb18, smb19, smb20, smb21, smb22, smb23,
+                  smb23b, smb4d, smb14, smb5, smb4, smb3, spi0cs1, spi0cs2,
+                  spi0cs3, spi1cs0, spi1cs1, spi1cs2, spi1cs3, spi1cs23, smb3c,
+                  smb3b, bmcuart0a, uart1, jtag2, bmcuart1, uart2, sg1mdio,
+                  bmcuart0b, r1err, r1md, r1oen, r2oen, rmii3, r3oen, smb3d,
+                  fanin0, fanin1, fanin2, fanin3, fanin4, fanin5, fanin6,
+                  fanin7, fanin8, fanin9, fanin10, fanin11, fanin12, fanin13,
+                  fanin14, fanin15, pwm0, pwm1, pwm2, pwm3, r2, r2err, r2md,
+                  r3rxer, ga20kbc, smb5d, lpc, espi, rg2, ddr, i3c0, i3c1,
+                  i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2, smb2c, smb2b, smb1c,
+                  smb1b, smb8, smb9, smb10, smb11, sd1, sd1pwr, pwm4, pwm5,
+                  pwm6, pwm7, pwm8, pwm9, pwm10, pwm11, mmc8, mmc, mmcwp, mmccd,
+                  mmcrst, clkout, serirq, scipme, smi, smb6, smb6b, smb6c,
+                  smb6d, smb7, smb7b, smb7c, smb7d, spi1, faninx, r1, spi3, 
+                  spi3cs1, spi3quad, spi3cs2, spi3cs3, nprd_smi, smb0b, smb0c,
+                  smb0den, smb0d, ddc, rg2mdio, wdog1, wdog2, smb12, smb13,
+                  spix, spixcs1, clkreq, hgpio0, hgpio1, hgpio2, hgpio3, hgpio4,
+                  hgpio5, hgpio6, hgpio7, bu4, bu4b, bu5, bu5b, bu6, gpo187 ]
 
       function:
         description:
           The function that a group of pins is muxed to
-        enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi,
-                smb5b, smb5c, lkgpo0, pspi, jm1, jm2, smb4den, smb4b,
-                smb4c, smb15, smb16, smb17, smb18, smb19, smb20, smb21,
-                smb22, smb23, smb23b, smb4d, smb14, smb5, smb4, smb3,
-                spi0cs1, spi0cs2, spi0cs3, spi1cs0, spi1cs1, spi1cs2,
-                spi1cs3, spi1cs23, smb3c, smb3b, bmcuart0a, uart1, jtag2,
-                bmcuart1, uart2, sg1mdio, bmcuart0b, r1err, r1md, r1oen,
-                r2oen, rmii3, r3oen, smb3d, fanin0, fanin1, fanin2, fanin3,
-                fanin4, fanin5, fanin6, fanin7, fanin8, fanin9, fanin10,
+        enum: [ iox1, iox2, smb1d, smb2d, lkgpo1, lkgpo2, ioxh, gspi, smb5b,
+                smb5c, lkgpo0, pspi, jm1, jm2, smb4b, smb4c, smb15, smb16,
+                smb17, smb18, smb19, smb20, smb21, smb22, smb23, smb23b, smb4d,
+                smb14, smb5, smb4, smb3, spi0cs1, spi0cs2, spi0cs3, spi1cs0,
+                spi1cs1, spi1cs2, spi1cs3, spi1cs23, smb3c, smb3b, bmcuart0a,
+                uart1, jtag2, bmcuart1, uart2, sg1mdio, bmcuart0b, r1err, r1md,
+                r1oen, r2oen, rmii3, r3oen, smb3d, fanin0, fanin1, fanin2,
+                fanin3, fanin4, fanin5, fanin6, fanin7, fanin8, fanin9, fanin10,
                 fanin11, fanin12, fanin13, fanin14, fanin15, pwm0, pwm1, pwm2,
                 pwm3, r2, r2err, r2md, r3rxer, ga20kbc, smb5d, lpc, espi, rg2,
                 ddr, i3c0, i3c1, i3c2, i3c3, i3c4, i3c5, smb0, smb1, smb2,
                 smb2c, smb2b, smb1c, smb1b, smb8, smb9, smb10, smb11, sd1,
                 sd1pwr, pwm4, pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11,
-                mmc8, mmc, mmcwp, mmccd, mmcrst, clkout, serirq, lpcclk,
-                scipme, smi, smb6, smb6b, smb6c, smb6d, smb7, smb7b, smb7c,
-                smb7d, spi1, faninx, r1, spi3, spi3cs1, spi3quad, spi3cs2,
-                spi3cs3, nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio,
-                wdog1, wdog2, smb12, smb13, spix, spixcs1, clkreq, hgpio0,
-                hgpio1, hgpio2, hgpio3, hgpio4, hgpio5, hgpio6, hgpio7, bu4,
-                bu4b, bu5, bu5b, bu6, gpo187 ]
+                mmc8, mmc, mmcwp, mmccd, mmcrst, clkout, serirq, scipme, smi,
+                smb6, smb6b, smb6c, smb6d, smb7, smb7b, smb7c, smb7d, spi1,
+                faninx, r1, spi3, spi3cs1, spi3quad, spi3cs2, spi3cs3, nprd_smi,
+                smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio, wdog1, wdog2,
+                smb12, smb13, spix, spixcs1, clkreq, hgpio0, hgpio1, hgpio2,
+                hgpio3, hgpio4, hgpio5, hgpio6, hgpio7, bu4, bu4b, bu5, bu5b,
+                bu6, gpo187 ]
 
     dependencies:
       groups: [ function ]
-- 
2.34.1

