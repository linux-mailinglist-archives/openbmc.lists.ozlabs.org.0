Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 148497CE634
	for <lists+openbmc@lfdr.de>; Wed, 18 Oct 2023 20:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9fKd24Jyz3cN3
	for <lists+openbmc@lfdr.de>; Thu, 19 Oct 2023 05:20:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9fJd0wRXz3cG5
	for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2023 05:19:40 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 39IIJW0l014667
	for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2023 21:19:32 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 18 Oct
 2023 21:19:31 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 19 Oct
 2023 02:19:28 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 19 Oct 2023 02:19:28 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id B90DF68E72;
	Wed, 18 Oct 2023 21:19:27 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id AF8C421CFCF4; Wed, 18 Oct 2023 21:19:27 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linux@roeck-us.net>, <jdelvare@suse.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <andrew@codeconstruct.com.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>, <j.neuschaefer@gmx.net>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: npcm: Add npcm845 compatible string
Date: Wed, 18 Oct 2023 21:19:24 +0300
Message-ID: <20231018181925.1826042-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20231018181925.1826042-1-tmaimon77@gmail.com>
References: <20231018181925.1826042-1-tmaimon77@gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, Rob Herring <robh@kernel.org>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a compatible string for Nuvoton BMC NPCM845 Pulse Width Modulation (PWM)
and Fan tach controller.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
index 8523777f560c..18095ba87a5a 100644
--- a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
+++ b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
@@ -1,12 +1,16 @@
-Nuvoton NPCM7xx PWM and Fan Tacho controller device
+Nuvoton NPCM PWM and Fan Tacho controller device
 
 The Nuvoton BMC NPCM7XX supports 8 Pulse-width modulation (PWM)
 controller outputs and 16 Fan tachometer controller inputs.
 
+The Nuvoton BMC NPCM8XX supports 12 Pulse-width modulation (PWM)
+controller outputs and 16 Fan tachometer controller inputs.
+
 Required properties for pwm-fan node
 - #address-cells : should be 1.
 - #size-cells	: should be 0.
 - compatible	: "nuvoton,npcm750-pwm-fan" for Poleg NPCM7XX.
+				: "nuvoton,npcm845-pwm-fan" for Arbel NPCM8XX.
 - reg			: specifies physical base address and size of the registers.
 - reg-names	: must contain:
 					* "pwm" for the PWM registers.
-- 
2.33.0

