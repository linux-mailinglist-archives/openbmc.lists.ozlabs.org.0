Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F734D943A
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 06:56:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHjMM2LhTz30KV
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 16:56:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fqStOFE1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fqStOFE1; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHjLM4qxBz300L
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2022 16:55:23 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id r12so15384323pla.1
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 22:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=s3REtX15upPnaASwcpch/4bkCB1kjQjGAtbk3icoBvk=;
 b=fqStOFE1vmgjthxI4YsIA8/39Jf9+YX0GVkFXQfKJRJ6LNFACFyV7zI5XfD5e0MR1+
 oW+honQ7ip47qs3lPC63by32LSh9Q4ILyX/MNdqvKICnFu3InLcS7KBRJ8iJMfs3i8nq
 K6nBstw/YlnUwDnY6aNKyj3+H4Z/VmzDk8DOafs/VoU5v2MKdrTD8eheLAna78CeP6oy
 RBQyJtnMquDxg3dFEM4OLteUY4CS1GM3lNLN9zTmcKC3pvNVgTUikThbTt/cycK2K2yx
 mdx5c/jm9Xa6k+9I2c66l2Em89JzKfNIMHafpXp1jR0adX9xsPyEC9DXM4I+lg83hv97
 Fe1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=s3REtX15upPnaASwcpch/4bkCB1kjQjGAtbk3icoBvk=;
 b=kE9PY9V9exvBtXpYytbreUJE5yUs3daF8ohX+bKyAwxdfmK1GdkG5auWsrcEicpfSh
 1vTsS5ey8iyPjgQI+lXKRznY74+Rzy6f81FmianUFS5jJkWEbPK2cXoomOKRRR1JUa3H
 0a8M7oSQDFWATsWS/pKxoRnYXOSzsY69G4VBn4wJv7BR/GAXL/BOJ52ITQR02JajX/rP
 HnA0YhpCO2NlcPn40fvK7HXdF8T0J/LxvuxLLmxRUw/yF3Xbfb6bxucTnqfMSqkmHAbo
 7/rtB8xKU6GbyGHs66CUMX4ycWnd3NK33xz3PTY+sqzS+i2py2Mw+SDAHGwBdeHCJkRh
 XNUw==
X-Gm-Message-State: AOAM530nUN9T3TyVfgawRRQILLuIi6xc9qYq5h5AOGc7K4gffyusjzfM
 pVlVn+4Ax2he/cxhNt4G1gg=
X-Google-Smtp-Source: ABdhPJxJtul1cYpBHB8+Y1xnB+gHX1DlHpjgdiiw0swhCA4/vELU4Be2hfbIa+a6HcYjCJpemq8uFg==
X-Received: by 2002:a17:90b:4f8f:b0:1bf:84ad:1fe6 with SMTP id
 qe15-20020a17090b4f8f00b001bf84ad1fe6mr2747965pjb.189.1647323721509; 
 Mon, 14 Mar 2022 22:55:21 -0700 (PDT)
Received: from localhost.localdomain ([116.89.135.255])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a634755000000b00368f3ba336dsm18679369pgk.88.2022.03.14.22.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 22:55:21 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v4 1/3] ARM: dts: nuvoton: Add memory controller node
Date: Tue, 15 Mar 2022 13:55:02 +0800
Message-Id: <20220315055504.27671-2-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220315055504.27671-1-ctcchien@nuvoton.com>
References: <20220315055504.27671-1-ctcchien@nuvoton.com>
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
Then, you can read error counts via
the EDAC kernel framework.

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

