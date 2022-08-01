Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D00586D43
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 16:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxLdn5BPJz3blS
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 00:50:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxLcZ19MRz2yjC
	for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2022 00:49:32 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 271EnM0e024220
	for <openbmc@lists.ozlabs.org>; Mon, 1 Aug 2022 17:49:22 +0300
Received: from NTHCCAS03.nuvoton.com (10.1.20.28) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 1 Aug
 2022 17:49:22 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS03.nuvoton.com
 (10.1.20.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1847.3; Mon, 1 Aug 2022
 22:49:20 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 1 Aug 2022 22:49:20 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 9657863A22; Mon,  1 Aug 2022 17:49:18 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 6/7] dt-binding: spi: Add npcm845 compatible to npcm-fiu document
Date: Mon, 1 Aug 2022 17:49:13 +0300
Message-ID: <20220801144914.126075-7-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220801144914.126075-1-tmaimon77@gmail.com>
References: <20220801144914.126075-1-tmaimon77@gmail.com>
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
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a compatible string and description for Nuvoton BMC NPCM845 FIU.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/spi/nuvoton,npcm-fiu.txt    | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
index a388005842ad..c63ce4cc0a80 100644
--- a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
+++ b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
@@ -6,8 +6,13 @@ The NPCM7XX supports three FIU modules,
 FIU0 and FIUx supports two chip selects,
 FIU3 support four chip select.
 
+The NPCM8XX supports four FIU modules,
+FIU0 and FIUx supports two chip selects,
+FIU1 and FIU3 supports four chip selects.
+
 Required properties:
-  - compatible : "nuvoton,npcm750-fiu" for the NPCM7XX BMC
+  - compatible : "nuvoton,npcm750-fiu" for Poleg NPCM7XX BMC
+			     "nuvoton,npcm845-fiu" for Arbel NPCM8XX BMC
   - #address-cells : should be 1.
   - #size-cells : should be 0.
   - reg : the first contains the register location and length,
@@ -30,6 +35,12 @@ Aliases:
   		fiu1 represent fiu 3 controller
   		fiu2 represent fiu x controller
 
+  In the NPCM8XX BMC:
+  		fiu0 represent fiu 0 controller
+  		fiu1 represent fiu 1 controller
+  		fiu2 represent fiu 3 controller
+  		fiu3 represent fiu x controller
+
 Example:
 fiu3: spi@c00000000 {
 	compatible = "nuvoton,npcm750-fiu";
-- 
2.33.0

