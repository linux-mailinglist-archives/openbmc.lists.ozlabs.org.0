Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D70A97B0B38
	for <lists+openbmc@lfdr.de>; Wed, 27 Sep 2023 19:40:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwkQX54N3z3cPS
	for <lists+openbmc@lfdr.de>; Thu, 28 Sep 2023 03:40:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwkPT4j6lz3c60
	for <openbmc@lists.ozlabs.org>; Thu, 28 Sep 2023 03:39:06 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 38RHd23c026209
	for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2023 20:39:02 +0300
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 27 Sep
 2023 20:39:01 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 28 Sep
 2023 01:38:59 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 28 Sep 2023 01:38:59 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id DB4C664741; Wed, 27 Sep 2023 20:38:53 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linux@roeck-us.net>, <jdelvare@suse.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <andrew@codeconstruct.com.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>, <j.neuschaefer@gmx.net>
Subject: [PATCH v1 1/2] dt-bindings: hwmon: npcm: Add npcm845 compatible string
Date: Wed, 27 Sep 2023 20:38:49 +0300
Message-ID: <20230927173850.103435-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230927173850.103435-1-tmaimon77@gmail.com>
References: <20230927173850.103435-1-tmaimon77@gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a compatible string for Nuvoton BMC NPCM845 Pulse Width Modulation (PWM)
and Fan tach controller.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
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

