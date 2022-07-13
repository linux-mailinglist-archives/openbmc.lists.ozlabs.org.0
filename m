Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7C357375D
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 15:27:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ljdhk65TRz3c4k
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 23:27:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjdhM6pDhz3c2T
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 23:27:12 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 26DDR5bZ029392
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 16:27:05 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 13 Jul
 2022 16:27:04 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Wed, 13 Jul
 2022 21:27:02 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 13 Jul 2022 21:27:02 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id D097B63A23; Wed, 13 Jul 2022 16:27:01 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <avifishman70@gmail.com>, <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
        <jic23@kernel.org>, <lars@metafoo.de>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <j.neuschaefer@gmx.net>,
        <zhengbin13@huawei.com>
Subject: [PATCH v3 1/2] dt-bindings: iio: adc: npcm: Add npcm845 compatible string
Date: Wed, 13 Jul 2022 16:26:39 +0300
Message-ID: <20220713132640.215916-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220713132640.215916-1-tmaimon77@gmail.com>
References: <20220713132640.215916-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, linux-iio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a compatible string for Nuvoton BMC NPCM845 ADC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/iio/adc/nuvoton,npcm750-adc.yaml   | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm750-adc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm750-adc.yaml
index 001cf263b7d5..fede2aa64092 100644
--- a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm750-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm750-adc.yaml
@@ -10,11 +10,14 @@ maintainers:
   - Tomer Maimon <tmaimon77@gmail.com>
 
 description:
-  The NPCM ADC is a 10-bit converter for eight channel inputs.
+  The NPCM7XX ADC is a 10-bit converter and NPCM8XX ADC is a 12-bit converter,
+  both have eight channel inputs.
 
 properties:
   compatible:
-    const: nuvoton,npcm750-adc
+    enum:
+      - nuvoton,npcm750-adc
+      - nuvoton,npcm845-adc
 
   reg:
     maxItems: 1
-- 
2.33.0

