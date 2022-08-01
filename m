Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B7F5869F3
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 14:09:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxH4159t0z3c1p
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 22:09:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxH2x1p9gz2yJQ
	for <openbmc@lists.ozlabs.org>; Mon,  1 Aug 2022 22:08:40 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 271C8RNv020964
	for <openbmc@lists.ozlabs.org>; Mon, 1 Aug 2022 15:08:27 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 1 Aug
 2022 15:08:27 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Mon, 1 Aug 2022
 20:08:25 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 1 Aug 2022 20:08:25 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 1983D63A26; Mon,  1 Aug 2022 15:08:23 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 09/16] dt-bindings: reset: npcm: Add support for NPCM8XX
Date: Mon, 1 Aug 2022 15:08:12 +0300
Message-ID: <20220801120819.113533-10-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220801120819.113533-1-tmaimon77@gmail.com>
References: <20220801120819.113533-1-tmaimon77@gmail.com>
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

Add binding document and device tree binding constants for Nuvoton BMC
NPCM8XX reset controller.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/reset/nuvoton,npcm-reset.txt         | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
index f10c93811915..be560f8ec5cc 100644
--- a/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
+++ b/Documentation/devicetree/bindings/reset/nuvoton,npcm-reset.txt
@@ -1,14 +1,15 @@
 Nuvoton NPCM Reset controller
 
 Required properties:
-- compatible : "nuvoton,npcm750-reset" for NPCM7XX BMC
+- compatible : "nuvoton,npcm750-reset" for Poleg NPCM7XX BMC.
+			   "nuvoton,npcm845-reset" for Arbel NPCM8XX BMC.
 - reg : specifies physical base address and size of the register.
 - #reset-cells: must be set to 2
 - nuvoton,sysgcr - Contains a phandle to access GCR registers.
 
 Optional property:
 - nuvoton,sw-reset-number - Contains the software reset number to restart the SoC.
-  NPCM7xx contain four software reset that represent numbers 1 to 4.
+  NPCM contain four software reset that represent numbers 1 to 4.
 
   If 'nuvoton,sw-reset-number' is not specified software reset is disabled.
 
-- 
2.33.0

