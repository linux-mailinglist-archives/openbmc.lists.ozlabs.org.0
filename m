Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9F52F53DD
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 21:09:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGJS15GbQzDrVM
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 07:09:05 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGJGH5LpvzDrSg
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 07:00:39 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 10DK0GrI007565;
 Wed, 13 Jan 2021 22:00:16 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id B941263A17; Wed, 13 Jan 2021 22:00:16 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v3 02/12] dt-binding: iio: add syscon property
 to NPCM ADC
Date: Wed, 13 Jan 2021 22:00:00 +0200
Message-Id: <20210113200010.71845-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210113200010.71845-1-tmaimon77@gmail.com>
References: <20210113200010.71845-1-tmaimon77@gmail.com>
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

Add syscon property to NPCM ADC to handle FUSE
registers.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
index ef8eeec1a997..faf9f9b54f5b 100644
--- a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
@@ -14,6 +14,7 @@ Optional properties:
 - vref-supply: The regulator supply ADC reference voltage, in case the
 			   vref-supply is not added the ADC will use internal voltage
 			   reference.
+- syscon: a phandle to access FUSE registers
 
 Example:
 
@@ -23,4 +24,5 @@ adc: adc@f000c000 {
 	interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 	clocks = <&clk NPCM7XX_CLK_ADC>;
 	resets = <&rstc NPCM7XX_RESET_IPSRST1 NPCM7XX_RESET_ADC>;
+	syscon = <&fuse>;
 };
-- 
2.22.0

