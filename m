Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6562E4C39C4
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 00:40:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4TtZ4WKLz3bPS
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 10:40:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qPW+/TKN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2c;
 helo=mail-oo1-xc2c.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qPW+/TKN; dkim-atps=neutral
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K45LK3M9Vz3cHN
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 19:15:05 +1100 (AEDT)
Received: by mail-oo1-xc2c.google.com with SMTP id
 r15-20020a4ae5cf000000b002edba1d3349so2412726oov.3
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 00:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lhYNg8GMF1N+MEP55KAG4b8yDkrDo7A6Roxvv5yYMtU=;
 b=qPW+/TKNMdfryYrGLo7YrU0iyxsHA3bhaCEyUYtXnkIpG7Y6hfcFJpGnNZsqTqE+GR
 99+a9JsBmYjkxxOswSvZ0MQinBYdvJ0ZFAKTpStLCBnubRsSVWJ8dhs/gWc1qL08x591
 8ATbcaqZ7J3ECMMH3oFDMI18IvTLpVCkpCKIqSWCki0D5QvxZ+cR6DX2aF876bJQ6XoV
 0o9G7YAz7cXhuqiE/PsL0WKy1KMZBdIGB+P59Z0+yDtmipD/6pIhTSe72nJ6wCIB/BgK
 RU5vhuKFp5yuFxW55L9RL7r3p+F7GumpBpi8RoqQEjEgNTJJPHlru8Qm9UewpukOv+nh
 yz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lhYNg8GMF1N+MEP55KAG4b8yDkrDo7A6Roxvv5yYMtU=;
 b=HuwNuB2AnNTsoSs1Mn0f59o1uD+Xmb33tjJZ3stHS5TYnXjMRik6EvoQT8uKhoOiyv
 KHV0f4BULjDt3jeLtuwUAxVzlrmKvxJ73aobRe6bWW0moTB0QH63+5R9qWyk6MWAs50t
 cUDWKKMeA9oM94Fzhxn1MlhrrUdg9/xj89/tOjT0Gm625Hn8wfkD2wO1dLRNNOl7i4ls
 w0w8Lo2r+ktQ7psY7hUOOWQU66E6hjIe39jCZ2QPiUlX+cMCOUtNT6GyixwJgTd3ovIb
 O211L4FXVl7I1B8s7+7u1wOV+WSQt4gO4LfeZZPQxfINhxGHi2Hwl328RunatsiZ67NV
 0B8w==
X-Gm-Message-State: AOAM533HaKtQJ7rYMKnUa/QDwcyFBsrfaT2SkPvwQBH+Tn8wgNxJBwMA
 Qnd4hW1yrU7bshXcaiFyWnqBpbFsdB+gug==
X-Google-Smtp-Source: ABdhPJxevCQqyyqcbABclH2PnGFNzAoleD3glcYbnfTgWkmGXR/VuOt5kI9H4WEZ/pfQ/fIFpdFqHw==
X-Received: by 2002:a17:90b:fc7:b0:1bc:4fc0:6fbd with SMTP id
 gd7-20020a17090b0fc700b001bc4fc06fbdmr1546709pjb.198.1645688870713; 
 Wed, 23 Feb 2022 23:47:50 -0800 (PST)
Received: from localhost.localdomain ([112.78.94.140])
 by smtp.gmail.com with ESMTPSA id z21sm1616839pgv.21.2022.02.23.23.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 23:47:50 -0800 (PST)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com
Subject: [PATCH v1 1/3]  ARM: dts: nuvoton: Add new device node
Date: Thu, 24 Feb 2022 15:47:27 +0800
Message-Id: <20220224074729.5206-2-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220224074729.5206-1-ctcchien@nuvoton.com>
References: <20220224074729.5206-1-ctcchien@nuvoton.com>
X-Mailman-Approved-At: Fri, 25 Feb 2022 10:40:00 +1100
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Medad CChien <ctcchien@nuvoton.com>, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

 Add NPCM7xx EDAC device node

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index 3696980a3da1..0fb2465c218e 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -106,6 +106,13 @@
 		interrupt-parent = <&gic>;
 		ranges;
 
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm7xx-edac";
+			reg = <0x0 0xf0824000 0x0 0x1000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		rstc: rstc@f0801000 {
 			compatible = "nuvoton,npcm750-reset";
 			reg = <0xf0801000 0x70>;
-- 
2.17.1

