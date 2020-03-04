Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA7017987C
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 19:58:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Xjp62b27zDqVK
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 05:58:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com;
 envelope-from=3nppfxgukb6elvozjhpphmf.dpnpqfocndmjtut.pambct.psh@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=gNLgmHyH; dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XjnS2D7ZzDqRB
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 05:58:00 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id w4so1438865pjt.5
 for <openbmc@lists.ozlabs.org>; Wed, 04 Mar 2020 10:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=EYY7QcoD8uEp0W1lhSXQypUbn9MiviJ7eZ8mbcLQwJE=;
 b=gNLgmHyHKCrmuX+yEBJFFhFezuQkNuD+ouTIhFvoz3QqLy7y2iPsz4V+aZAQMCKcL5
 LFNf0E1+7I4rArbUU6nypu13ktKTYsUvwPXyBnQ7MW24MmZAiwFcu14pZkx/xHjqU6sE
 uOJeKcESaSe/ZzBAfQxUXGwXnsE3jVjFCrKflXCJ+05rn3nghjIV3HaMTgSZF6FgiNES
 GuglbSgDK96iTUVAzntUhLoHPdT7Spw26LtiOMynZCpz7/MwuuYysp38E48ZIV2pHsBI
 zgecctUPPefWdoIMCgK0ht9Us9NQE895+YWTk3QbXRYJDagCrHROSDhVcBBhMpCj74nl
 Zh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=EYY7QcoD8uEp0W1lhSXQypUbn9MiviJ7eZ8mbcLQwJE=;
 b=ZydqA2yj5pIumS1jTP74i14gAGsawTtLWvLQT+7++kC/OJ8eXKFjbEZYR9uQVTlzEy
 /ea+zJZyCUV+7rktZm2hE3WtqpwWI8QOEqqnjJtZMW4T2xg/AU9+VBHDTyxok5oR+GiU
 3xIBiaKZMBP2UGxg8O1Ao2mUgcbfYQnTXu1ZOf8Q+6xXxYATAv5J+oaUviIOOjwrYW9W
 rlF5TqO23KJlu75q5DRxC0qfqibe/M2ZEWu2Lomg69M+Xq+D4O27dF6mT3RTN6MRbZcr
 LM+kivVla1b9oJQ5snzcLpwQxXY/I/LlvZ/6yRK5h97d+AMep6PzwtwPEhEybfBcitTk
 zltw==
X-Gm-Message-State: ANhLgQ0oQ5K+NHJAlGnQu+SX/7I9QrvmdqdiCD8TE2w+fFAIZ0h9Te+9
 kpcAX6m30AK/YZpOEK2DyH4iwvj4NT7r714bBE3dpPj0wIye9i8/nMNXlUrRfMfbC+rVZDMe930
 DOLlfZqoDCi2PMZqHTWU2N+LLzrrMpw1wr0ky/tvb8XrWpLXQTcj5kd3fdh0ydQ==
X-Google-Smtp-Source: ADFU+vsohC/uY0b68eC/ig54dIDjR+H6nHxXnj4o+3GRNK/IPwfZ55r7aSUX7IW98PQGMoinT2THhUvXYw==
X-Received: by 2002:a63:7f09:: with SMTP id a9mr3698738pgd.375.1583348276727; 
 Wed, 04 Mar 2020 10:57:56 -0800 (PST)
Date: Wed,  4 Mar 2020 10:57:39 -0800
Message-Id: <20200304185739.248770-1-kunyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH] ARM: dts: npcm7xx: Move memory controller node into common
 devicetree
From: Kun Yi <kunyi@google.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au, tmaimon77@gmail.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: benjaminfair@google.com, tali.perry1@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Include the EDAC node in the common devicetree piece so that downstream
boards don't have to repeat the definitions to enable EDAC.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 7 +++++++
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts     | 4 +---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index 72841f54deb4..f17e60280200 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -137,6 +137,13 @@
 			status = "disabled";
 		};
 
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm7xx-sdram-edac";
+			reg = <0xf0824000 0x1000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		emc0: eth@f0825000 {
 			device_type = "network";
 			compatible = "nuvoton,npcm750-emc";
diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
index 801ed73d962c..b587df73b4cb 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
@@ -41,9 +41,7 @@
 		};
 
 		mc: memory-controller@f0824000 {
-			compatible = "nuvoton,npcm7xx-sdram-edac";
-			reg = <0xf0824000 0x1000>;
-			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "okay";
 		};
 
 		emc0: eth@f0825000 {
-- 
2.25.1.481.gfbce0eb801-goog

