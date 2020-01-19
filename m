Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EE1141D72
	for <lists+openbmc@lfdr.de>; Sun, 19 Jan 2020 12:01:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 480sLp3rg1zDqgl
	for <lists+openbmc@lfdr.de>; Sun, 19 Jan 2020 22:01:54 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 480sLH5TDrzDqgM
 for <openbmc@lists.ozlabs.org>; Sun, 19 Jan 2020 22:01:21 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 00JB0bem001025;
 Sun, 19 Jan 2020 13:00:37 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 7546260328; Sun, 19 Jan 2020 13:00:37 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net,
 robh+dt@kernel.org, mark.rutland@arm.com, avifishman70@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, joel@jms.id.au
Subject: [PATCH v1 1/2] dt-binding: iio: add NPCM ADC reset support
Date: Sun, 19 Jan 2020 13:00:31 +0200
Message-Id: <20200119110032.124745-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
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
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add NPCM ADC reset binding documentation.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
index eb939fe77836..ef8eeec1a997 100644
--- a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
@@ -6,6 +6,7 @@ Required properties:
 - compatible: "nuvoton,npcm750-adc" for the NPCM7XX BMC.
 - reg: specifies physical base address and size of the registers.
 - interrupts: Contain the ADC interrupt with flags for falling edge.
+- resets : phandle to the reset control for this device.
 
 Optional properties:
 - clocks: phandle of ADC reference clock, in case the clock is not
@@ -21,4 +22,5 @@ adc: adc@f000c000 {
 	reg = <0xf000c000 0x8>;
 	interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 	clocks = <&clk NPCM7XX_CLK_ADC>;
+	resets = <&rstc NPCM7XX_RESET_IPSRST1 NPCM7XX_RESET_ADC>;
 };
-- 
2.22.0

