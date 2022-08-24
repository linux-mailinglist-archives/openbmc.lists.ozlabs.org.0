Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B379D59F3CA
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 08:55:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCH0Q46ZZz3bly
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 16:55:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=FUJN9Sqk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=patrick.rudolph@9elements.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=FUJN9Sqk;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCGzL5gfkz2xGj
	for <openbmc@lists.ozlabs.org>; Wed, 24 Aug 2022 16:54:05 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id r4so20795924edi.8
        for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2022 23:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=oS2XC6fdTXuWOLrVDXR1a2AzA8BB4cDv+VOxEeSMDbQ=;
        b=FUJN9SqkY2b2mpNJPWquLsfyaT2FAu1XSH0aFckq3dM9tS0/1jFDzPItcFsfHMzVAn
         GQkfjASHctPfiXl8vr5P5Oeq9PhhSHxil1tSuRs/uHAw3wkeSR0EFlmpsTRSev3uQpHh
         iPTIJpMP5rU/9xnvRI5x11apbHHrO3hIIzane/E55t3dKuIsGOXsg7CRO3rhxjITjQpg
         IZ6POu7Mj+Fj/yw8/idqarks6mgE7fWQYK1NGXAxpPzrZVTn9ExA5tpIlP1oSH1tXGOG
         gkEZ1Y6cbB/BfBOjHoJfn3XRhh6HDoE5gKxCl1lh7JP/hgvESJWBENMygAYrZ9WbvKZ4
         JPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=oS2XC6fdTXuWOLrVDXR1a2AzA8BB4cDv+VOxEeSMDbQ=;
        b=55d+4fFCd0W0cSt/zuDwhomcnt6femfCm1jppH5VP9GEkJURR/RBcX5gZQ4OwBMcrk
         ToBYoa++pXpdo2G0TdSHS6eWzNmf95DW4p+kOjPv9bRRN3GWF7r2ULzYBUx+hBtmGPvj
         GxpbTwbo8uz4ttx+L6Hs47QGY2j672Hr7GFjlRka6gRIVSibwroX6icjFHVQHF6X7e/T
         xS+hedirklc8NccHkXPX4OBuM2Cb6FZu0YA4fllotm/Y5jXUK9ZI/fjoEDS6XGvGlS/o
         0Q77x5sNoRqgKPo/4SgEwSZxEwBa68O7sAbnCGVRoqXRNyie/IN0G8L1FcN64rTxBGRR
         So4g==
X-Gm-Message-State: ACgBeo2OGwj8JXu5o0jRwQi9c2n8u6Hx/98w/o2zI93AMmXUus+XRj+M
	yvutaHnAOkO3OvDuXF4+Ic5oxEE/EIPUZ71d
X-Google-Smtp-Source: AA6agR4O3uV1LRAgdjxhY7eeBOyVEX3iO5aOPbqa1CW1rIaSzK39v4HsKYllAha9CsPkUGrZJeE8IA==
X-Received: by 2002:a05:6402:496:b0:443:a5f5:d3b with SMTP id k22-20020a056402049600b00443a5f50d3bmr6614807edv.331.1661324039584;
        Tue, 23 Aug 2022 23:53:59 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-088-153-019-247.um27.pools.vodafone-ip.de. [88.153.19.247])
        by smtp.gmail.com with ESMTPSA id n26-20020a5099da000000b0043bbf79b3ebsm2644475edb.54.2022.08.23.23.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 23:53:59 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v6 1/2] arm/dts: Add IBM Genesis3 board
Date: Wed, 24 Aug 2022 08:53:12 +0200
Message-Id: <20220824065313.1636548-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220824065313.1636548-1-patrick.rudolph@9elements.com>
References: <20220824065313.1636548-1-patrick.rudolph@9elements.com>
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
Cc: andrew@aj.id.au, christian.walter@9elements.com, takken@us.ibm.com, Patrick Rudolph <patrick.rudolph@9elements.com>, zweiss@equinix.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add devicetree source file. It uses the evb-ast2500 board files.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Reviewed-by: Zev Weiss <zweiss@equinix.com>
---
 arch/arm/dts/Makefile             |  1 +
 arch/arm/dts/ast2500-genesis3.dts | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 arch/arm/dts/ast2500-genesis3.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 6c34b83336..db479c059b 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -680,6 +680,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2400-palmetto.dtb \
 	ast2500-evb.dtb \
 	ast2500-romulus.dtb \
+	ast2500-genesis3.dtb \
 	ast2600a0-evb.dtb \
 	ast2600a1-evb.dtb \
 	ast2600-bletchley.dtb \
diff --git a/arch/arm/dts/ast2500-genesis3.dts b/arch/arm/dts/ast2500-genesis3.dts
new file mode 100644
index 0000000000..544758c5b8
--- /dev/null
+++ b/arch/arm/dts/ast2500-genesis3.dts
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
+		compatible = "spansion,s25fl256l", "spi-flash";
+	};
+
+	flash@1 {
+		compatible = "spansion,s25fl256l", "spi-flash";
+	};
+};
+
-- 
2.37.1

