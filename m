Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D35C522A14
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 04:53:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyfcT23V6z3bxY
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 12:53:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=MY5YmxSM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=MY5YmxSM; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kyfc50GgKz2xvF
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 12:53:24 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 8F86A1B8;
 Tue, 10 May 2022 19:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1652237599;
 bh=nj7fmcTLOBO3JDxB0Aa+4vAQvh4a4MDy+Q5o0HpOoI4=;
 h=From:To:Cc:Subject:Date:From;
 b=MY5YmxSMQUiSSMzTnvtIL+CuRuZMeSHaGFamglYBPWmg2+5BBmm8oDIvjLDU4a2l4
 3UzsC8mjipiw6R7NAlonqDnNi7a9uf1Zr2ZnFkJc7h6nE37QbFvwU1PaCjHg2bgFOp
 keoqITqfPn3a3MHcy7HGWjbHlCdKdOX91hQiyq6M=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] aspeed: Fix typos in
 platform.h comments
Date: Tue, 10 May 2022 19:53:09 -0700
Message-Id: <20220511025309.27224-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.35.3
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

"function" had been missing an "n" in a few places.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---

As pointed out by Joel during review of the recent backdoor-disabling
patch.

 arch/arm/include/asm/arch-aspeed/platform.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/arch-aspeed/platform.h b/arch/arm/include/asm/arch-aspeed/platform.h
index f05747642f38..ca270d4be118 100644
--- a/arch/arm/include/asm/arch-aspeed/platform.h
+++ b/arch/arm/include/asm/arch-aspeed/platform.h
@@ -19,7 +19,7 @@
 #define ASPEED_HW_STRAP1	0x1e6e2070
 #define ASPEED_REVISION_ID	0x1e6e207C
 #define ASPEED_SYS_RESET_CTRL	0x1e6e203C
-#define ASPEED_VGA_HANDSHAKE0	0x1e6e2040	/*	VGA fuction handshake register */
+#define ASPEED_VGA_HANDSHAKE0	0x1e6e2040	/*	VGA function handshake register */
 #define ASPEED_PCIE_CONFIG_SET	0x1e6e2180
 #define ASPEED_DRAM_BASE	0x40000000
 #define ASPEED_SRAM_BASE	0x1E720000
@@ -34,7 +34,7 @@
 #define ASPEED_HW_STRAP2	0x1e6e20D0
 #define ASPEED_REVISION_ID	0x1e6e207C
 #define ASPEED_SYS_RESET_CTRL	0x1e6e203C
-#define ASPEED_VGA_HANDSHAKE0	0x1e6e2040	/*	VGA fuction handshake register */
+#define ASPEED_VGA_HANDSHAKE0	0x1e6e2040	/*	VGA function handshake register */
 #define ASPEED_PCIE_CONFIG_SET	0x1e6e2180
 #define ASPEED_MAC_COUNT	2
 #define ASPEED_DRAM_BASE	0x80000000
@@ -54,7 +54,7 @@
 #define ASPEED_SYS_RESET_CTRL	0x1e6e2064
 #define ASPEED_SYS_RESET_CTRL3	0x1e6e206c
 #define ASPEED_GPIO_YZ_DATA	0x1e7801e0
-#define ASPEED_VGA_HANDSHAKE0	0x1e6e2100	/*	VGA fuction handshake register */
+#define ASPEED_VGA_HANDSHAKE0	0x1e6e2100	/*	VGA function handshake register */
 #define ASPEED_SB_STS		0x1e6f2014
 #define ASPEED_OTP_QSR		0x1e6f2040
 #define ASPEED_MAC_COUNT	4
-- 
2.35.3

