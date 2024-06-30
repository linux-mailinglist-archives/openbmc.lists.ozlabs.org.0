Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ED191D106
	for <lists+openbmc@lfdr.de>; Sun, 30 Jun 2024 12:03:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WBlBL6NKdz3bc2
	for <lists+openbmc@lfdr.de>; Sun, 30 Jun 2024 20:03:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WBl9s6DXkz30T8
	for <openbmc@lists.ozlabs.org>; Sun, 30 Jun 2024 20:02:34 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 45U91CFY009836
	for <openbmc@lists.ozlabs.org>; Sun, 30 Jun 2024 12:01:12 +0300
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Jun
 2024 12:01:11 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Jun
 2024 17:01:07 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 30 Jun 2024 17:01:07 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 5E0005F5B9;
	Sun, 30 Jun 2024 12:01:06 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 51637DC0913; Sun, 30 Jun 2024 12:01:06 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <tali.perry1@gmail.com>,
        <joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>
Subject: [PATCH v2] dt-bindings: pinctrl: npcm8xx: add missing pin group and mux function
Date: Sun, 30 Jun 2024 12:01:04 +0300
Message-ID: <20240630090104.565779-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the following missing pin group and mux function:
smb6b, smb6c, smb6d, smb7b, smb7c, smb7d, bu4, bu4b, bu5, bu5b, bu6,
gpo187.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
V1 -> V2: clean tabs.

 .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 22 ++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
index b55d9c316659..814b9598edd1 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
@@ -85,11 +85,12 @@ patternProperties:
                   smb2c, smb2b, smb1c, smb1b, smb8, smb9, smb10, smb11, sd1,
                   sd1pwr, pwm4, pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11,
                   mmc8, mmc, mmcwp, mmccd, mmcrst, clkout, serirq, lpcclk,
-                  scipme, smi, smb6, smb7, spi1, faninx, r1, spi3, spi3cs1,
-                  spi3quad, spi3cs2, spi3cs3, nprd_smi, smb0b, smb0c, smb0den,
-                  smb0d, ddc, rg2mdio, wdog1, wdog2, smb12, smb13, spix,
-                  spixcs1, clkreq, hgpio0, hgpio1, hgpio2, hgpio3, hgpio4,
-                  hgpio5, hgpio6, hgpio7 ]
+                  scipme, smi, smb6, smb6b, smb6c, smb6d, smb7, smb7b, smb7c,
+                  smb7d, spi1, faninx, r1, spi3, spi3cs1, spi3quad, spi3cs2,
+                  spi3cs3, nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio,
+                  wdog1, wdog2, smb12, smb13, spix, spixcs1, clkreq, hgpio0,
+                  hgpio1, hgpio2, hgpio3, hgpio4, hgpio5, hgpio6, hgpio7, bu4,
+                  bu4b, bu5, bu5b, bu6, gpo187 ]
 
       function:
         description:
@@ -109,11 +110,12 @@ patternProperties:
                 smb2c, smb2b, smb1c, smb1b, smb8, smb9, smb10, smb11, sd1,
                 sd1pwr, pwm4, pwm5, pwm6, pwm7, pwm8, pwm9, pwm10, pwm11,
                 mmc8, mmc, mmcwp, mmccd, mmcrst, clkout, serirq, lpcclk,
-                scipme, smi, smb6, smb7, spi1, faninx, r1, spi3, spi3cs1,
-                spi3quad, spi3cs2, spi3cs3, nprd_smi, smb0b, smb0c, smb0den,
-                smb0d, ddc, rg2mdio, wdog1, wdog2, smb12, smb13, spix,
-                spixcs1, clkreq, hgpio0, hgpio1, hgpio2, hgpio3, hgpio4,
-                hgpio5, hgpio6, hgpio7 ]
+                scipme, smi, smb6, smb6b, smb6c, smb6d, smb7, smb7b, smb7c,
+                smb7d, spi1, faninx, r1, spi3, spi3cs1, spi3quad, spi3cs2,
+                spi3cs3, nprd_smi, smb0b, smb0c, smb0den, smb0d, ddc, rg2mdio,
+                wdog1, wdog2, smb12, smb13, spix, spixcs1, clkreq, hgpio0,
+                hgpio1, hgpio2, hgpio3, hgpio4, hgpio5, hgpio6, hgpio7, bu4,
+                bu4b, bu5, bu5b, bu6, gpo187 ]
 
     dependencies:
       groups: [ function ]
-- 
2.34.1

