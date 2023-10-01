Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D94EA7B473F
	for <lists+openbmc@lfdr.de>; Sun,  1 Oct 2023 13:56:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rz2cn0fWYz3vXT
	for <lists+openbmc@lfdr.de>; Sun,  1 Oct 2023 22:56:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rz2cL3BfFz3bX1
	for <openbmc@lists.ozlabs.org>; Sun,  1 Oct 2023 22:56:32 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 391BuOuJ016041
	for <openbmc@lists.ozlabs.org>; Sun, 1 Oct 2023 14:56:24 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Sun, 1 Oct
 2023 14:56:24 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Sun, 1
 Oct 2023 19:56:22 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Sun, 1 Oct 2023 19:56:22 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 9C12F64741; Sun,  1 Oct 2023 14:56:21 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-6.5 v1 1/2] dt-bindings: hwmon: npcm: Add npcm845 compatible string
Date: Sun, 1 Oct 2023 14:56:18 +0300
Message-ID: <20231001115619.94491-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20231001115619.94491-1-tmaimon77@gmail.com>
References: <20231001115619.94491-1-tmaimon77@gmail.com>
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
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a compatible string for Nuvoton BMC NPCM845 Pulse Width Modulation (PWM)
and Fan tach controller.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
index 28f43e929f6d..1e41ec1fb926 100644
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

