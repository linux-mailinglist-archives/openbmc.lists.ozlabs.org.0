Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A1352D6FB
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 17:07:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3tWn4Hfqz307F
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 01:07:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=KXnjH2lu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::62c;
 helo=mail-ej1-x62c.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=KXnjH2lu; dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3tWQ622vz2yyQ
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 01:07:28 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id ch13so10483767ejb.12
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QKE8+kZ8WAcpQ7POtReCXKZsAcUPlipiqVbYmV0+aVQ=;
 b=KXnjH2luqwCL7Zt0Uo+ob1m0nc1AUAjcekJjeLT+V454Fw2ipIF583SHnV8Jb1urfz
 KFy6rNxS3pdjzaNCnDDre6l17xowAblmEFZtD/XcAeBlZbd8iu2B0EmChKIrNpcQBVH1
 rZLjOggh1SMEofXEFscm+O36zojxA9dKo6YSrBfQF+yXsW6NK/D/Zroc206R342pV20Q
 4XMQrr7bBzozs3p77PAH0Zx2hcD4JzxpR0AaoS6RA14uTd8fNR51dT2ZKEpciZ7DFqzw
 ilTyrcaZucWI8wPntoB0pGiLoU1PAzucavdjqjRGfAcQMX/a6l6VWx70ao1ekyL003mf
 VSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QKE8+kZ8WAcpQ7POtReCXKZsAcUPlipiqVbYmV0+aVQ=;
 b=7ID3dwDOlf4WHcxeoDv5u/V+hVI4YT4qyvzutqHf8Up/n37i8913L7i/6DV63H4FiS
 zJ03LrhV2jOHBjHW7AikWfaKK44YKtp5AKFlO6e00nVjzLdpKRmx3dgzHLAD9xFWzFGI
 CpqIyoyIzkKMaVBA8SLKQJBVngEwxZBZnPtNmyGChc7zCrxq3V7ZN8fA0SjSzvh5cSY2
 IDCn2gf3sHv+sKOXoIdGktxcnF0jkYn/ZEbXaQvfkos9l09U3P/dUHFFFuTogvFnOFA7
 FL7g+60nvPUyK+HH23Iigz8rx6jbpM70fU49k7Gf7fH9cN28J5ILDszCPbW9ZkXBi4wd
 eMqA==
X-Gm-Message-State: AOAM532B636nkrPZenA+5D0FZBGRLiYybcK3ju2ybc24USuSule1Dfo0
 zZKVdO3P2LGYCxPYcQEEq80+SA==
X-Google-Smtp-Source: ABdhPJyLqyv6wI7nNnldooW2j1qru6i9TZG4eys4NbdXsb1huhxGf8WdAhQLLVuok5HBK0jnMhOS4w==
X-Received: by 2002:a17:907:1c82:b0:6f4:60e5:1ddd with SMTP id
 nb2-20020a1709071c8200b006f460e51dddmr4732713ejc.274.1652972842953; 
 Thu, 19 May 2022 08:07:22 -0700 (PDT)
Received: from fedora.sec.9e.network
 (ip-088-153-019-247.um27.pools.vodafone-ip.de. [88.153.19.247])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a056402124300b0042617ba63d5sm2962263edw.95.2022.05.19.08.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 08:07:22 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 1/3] arm/dts: Add Genesis3
 board
Date: Thu, 19 May 2022 17:07:17 +0200
Message-Id: <20220519150719.22338-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220519150719.22338-1-patrick.rudolph@9elements.com>
References: <20220519150719.22338-1-patrick.rudolph@9elements.com>
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
Cc: christian.walter@9elements.com, takken@us.ibm.com,
 Patrick Rudolph <patrick.rudolph@9elements.com>, zev@bewilderbeest.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add devicetree source file. It uses the evb-ast2500 board files.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 arch/arm/dts/Makefile                 |  1 +
 arch/arm/dts/ast2500-ibm-genesis3.dts | 28 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 arch/arm/dts/ast2500-ibm-genesis3.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index a79f885f54..4b026296f0 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -677,6 +677,7 @@ dtb-$(CONFIG_ARCH_BCM6858) += \
 dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2400-evb.dtb \
 	ast2500-evb.dtb \
+	ast2500-ibm-genesis3.dtb \
 	ast2600a0-evb.dtb \
 	ast2600a1-evb.dtb \
 	ast2600-bletchley.dtb \
diff --git a/arch/arm/dts/ast2500-ibm-genesis3.dts b/arch/arm/dts/ast2500-ibm-genesis3.dts
new file mode 100644
index 0000000000..932b598063
--- /dev/null
+++ b/arch/arm/dts/ast2500-ibm-genesis3.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * IBM Genesis3
+ *
+ * Copyright (C) 2022 9elements GmbH
+ */
+
+#include "ast2500-evb.dts"
+
+/ {
+	model = "IBM Genesis3";
+	compatible = "ibm,genesis3-bmc", "aspeed,ast2500";
+};
+
+&spi1 {
+	status = "disabled";
+};
+
+&fmc {
+	flash@0 {
+		compatible = "spi-flash", "spansion,s25fl256l";
+	};
+
+	flash@1 {
+		compatible = "spi-flash", "spansion,s25fl256l";
+	};
+};
+
-- 
2.35.3

