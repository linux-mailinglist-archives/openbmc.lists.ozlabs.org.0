Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E31520BC8
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 05:12:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky3431qSGz3bZy
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 13:12:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=REig6fit;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=REig6fit; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky3363GgBz3br1
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 13:11:14 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id i1so15591358plg.7
 for <openbmc@lists.ozlabs.org>; Mon, 09 May 2022 20:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gmirLNjLGfJzW6YYZUOR8avyTXMQpr4Eec+Omnxr9sI=;
 b=REig6fitfjXTh0cqkooI1v3yC30UH7PBdPRRw6NFXIU0li08K0cNjk+ASddNB9scXD
 g8UCiNrkhu3XA26A4sw0fZmFg6Pcz5fLpTdSDyEv3OU1UimbJYyMDaMzQr9WqKBiipal
 olzgntEpk9PF9nPCi0GqlekbWoNgTdRzcFgB/j7H97M6Jt6Y7LGQlqgI+xDadH9WwogT
 H+oIsy3aiwcxsQ5mW9I0hHvMY7OBjP6/Kfz5zLg9+6poUXzcp8Zf5bBUSMZruCSNrTSD
 nEKqiezCIYqxWUE4KjlGm7HZ9ZWssX4K4YF6fkNmOBl/9N83ete9XUZIaxKaI/jY11sr
 vupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gmirLNjLGfJzW6YYZUOR8avyTXMQpr4Eec+Omnxr9sI=;
 b=PaG87EZj1AI3/j9Fv/ALAmUNvpsJTv5Xy9pJ0e5CVd/UO6sLRKa5lIWRNhNrr6bBHQ
 XnJeUCDCvJqzD2UQO+mlJgzqS0cu7Q/LnA1dbyMQi1jskPn5Lmfh7SxWc/NhlX+cluXi
 qhRqYzjk2esK9b+uZRuYBD4rhMCa/zwf+cCsbaPxq0XR8SC+zIHl7SCnlRyi6koaRDx6
 tAXA8ihqMXXH2ghH5zQKFHJNFGXHg87dRn6mubfpMqLrCKEPuXeNH7SW6Zc8VczH7bYQ
 Kkt/WuDOKl8HX5A6mmRTIXoApxcH+QTGE0vBYiadGnbhI6FERwWafy5YcjkJxbICrxJa
 phSQ==
X-Gm-Message-State: AOAM531ARKhW4D1h8fJv0iTcxmjj+ZH+9LgP4cIu3F4zLdFfaCty9Ken
 OQDrX+rlltwcaby+WhUpFZc=
X-Google-Smtp-Source: ABdhPJxHUAmfKwggfoJfp8yKKsjPSB1f3TQBxNzeIMTYC4JyKDyvezQacSVijmA4bAAfra/6quqWPQ==
X-Received: by 2002:a17:90b:33d0:b0:1dc:e4a1:a809 with SMTP id
 lk16-20020a17090b33d000b001dce4a1a809mr17892271pjb.21.1652152271681; 
 Mon, 09 May 2022 20:11:11 -0700 (PDT)
Received: from cs20-buildserver.lan ([112.78.91.252])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a170902c38d00b0015e8d4eb248sm648824plg.146.2022.05.09.20.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 20:11:11 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v9 1/3] ARM: dts: nuvoton: Add memory controller node
Date: Tue, 10 May 2022 11:10:54 +0800
Message-Id: <20220510031056.1657-2-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510031056.1657-1-ctcchien@nuvoton.com>
References: <20220510031056.1657-1-ctcchien@nuvoton.com>
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

