Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CCD58DA16
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 16:07:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2FJl4RcFz3bY8
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 00:07:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2FJT3dj4z2ywN
	for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2022 00:07:35 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 279E7THZ006495
	for <openbmc@lists.ozlabs.org>; Tue, 9 Aug 2022 17:07:29 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Tue, 9 Aug
 2022 17:07:29 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 9 Aug
 2022 22:07:26 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Tue, 9 Aug 2022 22:07:26 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 3355362EFF; Tue,  9 Aug 2022 17:07:25 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 1/2] dt-binding: bmc: npcm7xx-pci-mbox: Add npcm845 compatible
Date: Tue, 9 Aug 2022 17:07:20 +0300
Message-ID: <20220809140721.28958-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220809140721.28958-1-tmaimon77@gmail.com>
References: <20220809140721.28958-1-tmaimon77@gmail.com>
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

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 Documentation/devicetree/bindings/bmc/npcm7xx-pci-mbox.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/bmc/npcm7xx-pci-mbox.txt b/Documentation/devicetree/bindings/bmc/npcm7xx-pci-mbox.txt
index e5585f38041b..9847112abd72 100644
--- a/Documentation/devicetree/bindings/bmc/npcm7xx-pci-mbox.txt
+++ b/Documentation/devicetree/bindings/bmc/npcm7xx-pci-mbox.txt
@@ -1,10 +1,11 @@
-Nuvoton NPCM7xx PCI mail box interface
+Nuvoton NPCM PCI mail box interface
 
-Nuvoton BMC NPCM7xx PCI mail box, The mailbox is a high-bandwidth
+Nuvoton BMC NPCM PCI mail box, The mailbox is a high-bandwidth
 communication module between the BMC CPU and host CPU.
 
 Required properties for lpc_bpc node
 - compatible	: "nuvoton,npcm750-pci-mbox" for Poleg NPCM7XX.
+		  "nuvoton,npcm845-pci-mbox", "nuvoton,npcm750-pci-mbox" for Arbel NPCM8XX.
 - reg 			: specifies two address space
 					1. physical base address and size of the registers.
 					2. physical base address and size of the dual-ported RAM.
-- 
2.33.0

