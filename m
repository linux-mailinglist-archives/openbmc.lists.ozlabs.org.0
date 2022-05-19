Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 846B452CCDF
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 09:26:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3hHp30nWz30Fw
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 17:26:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oUoSk7Cn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oUoSk7Cn; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3hG45V5gz2ypD
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 17:25:16 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 t11-20020a17090a6a0b00b001df6f318a8bso7984848pjj.4
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 00:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gmirLNjLGfJzW6YYZUOR8avyTXMQpr4Eec+Omnxr9sI=;
 b=oUoSk7CnlRMCqq9hO54muVaLUmgCKKOAwoVTP2rtdSuWxwgURKiQUolQjUJBW7b8j5
 mT9CWiPpZ2qoBfpSZN8MhHSPhRycuj8A+2bBTqjuVaSQe4yFlZHmxz3PcmYpOVEirtKq
 VXuauTL45uJHKfrWF153GF4SkjsQj/mz3lUynt0uKi0FQKO+TLNGRjuM/qFFAzQlUX4V
 eoruy5T+nX4NDK7TDZ3oRFukBxNjgoKqm7p8kFn8Q+Plc9+5Sh243x+FiqLvE1o9cJMZ
 T2nUNAUXG5EbzX0V273RxUrvHhOFYXfDbbF7tfBenG0PcHsHggoUFhAfWejEqxKz7s9s
 Bcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gmirLNjLGfJzW6YYZUOR8avyTXMQpr4Eec+Omnxr9sI=;
 b=HYWkESH3jRG77XI+lUXxRRt82UnGC7kC56nXGAPB3hhe9MUgUx7pROLf22OI/RI2Mk
 0CT0YTFwgKYXWNWScYT3FpEgx+ToWffuFReQ2VC35dl0RSqjxbyO1/3oFFTk9wyiuphd
 Jdk8JTT6Cs+S1iiaGqxOxmJt8kJVXYgOODA132EHPc1aq0q0SkJ8QdTyijH4+k44zc1s
 0q/wImQ+ulmNoOYPN+kI/6DyQZAtVA031bH7yRWx0QmC+U9v8hNyCiwZkTNRtTN+9/st
 S2uypr/TZRhBZbyi5kj4pT/UM6rtj0q0dReo1A3ifv+G95uD6Cn4Mwdv8aMn7SYmk7Qa
 ANlA==
X-Gm-Message-State: AOAM531ASD/t5CLNo7uxA8NAlKKDG9B4BFu3X17j5Oo6WNF57ItQScGM
 BkBQ8GwArr+24lbng94DqhA=
X-Google-Smtp-Source: ABdhPJyaTGnm7nnQEQih6sRYmOiv45VMCDxaIAPaajssWkrJpJTlAmxvNDLzAAVtX/cFc8r0f3AwXQ==
X-Received: by 2002:a17:90a:f08c:b0:1df:6f35:361d with SMTP id
 cn12-20020a17090af08c00b001df6f35361dmr4331336pjb.161.1652945114466; 
 Thu, 19 May 2022 00:25:14 -0700 (PDT)
Received: from localhost.localdomain ([116.89.141.50])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a170902650c00b00161ac982b9esm2974159plk.185.2022.05.19.00.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 00:25:13 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v10 2/3] ARM: dts: nuvoton: Add memory controller node
Date: Thu, 19 May 2022 15:24:53 +0800
Message-Id: <20220519072454.24063-3-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220519072454.24063-1-ctcchien@nuvoton.com>
References: <20220519072454.24063-1-ctcchien@nuvoton.com>
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
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

ECC must be configured in the BootBlock header.
Then, you can read error counts via the EDAC kernel framework.

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index 3696980a3da1..ba542b26941e 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -106,6 +106,13 @@
 		interrupt-parent = <&gic>;
 		ranges;
 
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm750-memory-controller";
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

