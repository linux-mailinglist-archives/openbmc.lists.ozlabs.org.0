Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E872E83A1
	for <lists+openbmc@lfdr.de>; Fri,  1 Jan 2021 13:35:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D6kyX1KXZzDqC0
	for <lists+openbmc@lfdr.de>; Fri,  1 Jan 2021 23:35:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
X-Greylist: delayed 631 seconds by postgrey-1.36 at bilbo;
 Fri, 01 Jan 2021 23:34:32 AEDT
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D6kx40GTzzDqK1
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jan 2021 23:34:29 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 101CNbkb027180;
 Fri, 1 Jan 2021 14:23:37 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id E1D4F63A17; Fri,  1 Jan 2021 14:23:37 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v1 03/11] dts: npcm750: add fuse regmap support
 node
Date: Fri,  1 Jan 2021 14:23:20 +0200
Message-Id: <20210101122328.43510-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210101122328.43510-1-tmaimon77@gmail.com>
References: <20210101122328.43510-1-tmaimon77@gmail.com>
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

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index 7eee4145127f..455a96b23b85 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -82,6 +82,12 @@
 			"simple-mfd";
 			reg = <0x801000 0x6C>;
 		};
+		
+		fuse:fuse@18a000 {
+			compatible = "nuvoton,npcm750-fuse", "syscon",
+				"simple-mfd";
+			reg = <0x18a000 0x1000>;
+		};
 
 		scu: scu@3fe000 {
 			compatible = "arm,cortex-a9-scu";
-- 
2.22.0

