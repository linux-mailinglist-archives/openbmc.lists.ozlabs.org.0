Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE851531129
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:44:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6JTl5lydz3bkp
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 23:44:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=QEewCaq3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::62c;
 helo=mail-ej1-x62c.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=QEewCaq3; dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6JTK5KF8z305G
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 23:44:04 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id i27so28894674ejd.9
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 06:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iJxs/wZweCdn3ZQOU3UlMr1txLAfKSIw+r62UrtdkvE=;
 b=QEewCaq3z5dRhrKdKulMDumzuALMfc5zcmKxkf/UiFQq1A7wKemO97TPFZF1eELhw9
 y3mYKu7HeJLwP7L3AsXoqtcP+o30UiWCXGkhpKY+WGgxiTx9U0YjggqAsp7HuUddP7kl
 /WRXMVPd+2BehdfQC6+Nc/PCKwMLYsMsyCN06N/KRmv6qMskseC4p2hA/yg7s8GUhTSn
 H1DlnyoDRjFTbUhsmL59E3k/kBRYndDzm36M1WEgAbt0mffSvKIF2D6j7jAjbuUBhbKa
 LPecIh7/aUcy9k0egVSF68z977RlcRqLRFJOQPYyo/06Yn8/rBWo+blHyMeBaodhMIyo
 ipRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iJxs/wZweCdn3ZQOU3UlMr1txLAfKSIw+r62UrtdkvE=;
 b=HafEnwecaI6AelvblSC5S5mK7WtJsBVwjCivNkWeDz83hTsVwB4me0Hx+64H14sGh9
 jFeSRtWtF3Ol4vWK//vyHIULgRCTVN+X7vT8/oH4MhxBoJuhy39LQf4O8g4w3hGky/DY
 LMro8f8VczNODpNor8aul/YopoV1HJeWGOP5Z4TNsWtZLiml8Vvsjedhxmlbe6JFOvm4
 j0ODgas5iMd8WeNc3H5jcYrlNHKojW1lLq26Q4RXo9Wbuj9zpBpx3KDYPuopAyWlfWWZ
 Gka5X5SvVotr2j7Aq5kPa5mZn25HbYKzrjGEus0kfSEvcnPGMZAAmwtnhHicJRPR6Vih
 zbMA==
X-Gm-Message-State: AOAM532BNwrW0nN4iE+LrotWe3QEBWnrhhSIaIJ/I+9PjSxWkGFlrs1u
 qiR+UlgojePXM739jVgNLd/XMA==
X-Google-Smtp-Source: ABdhPJxqqX1ELnK2riwpo0+XWB6cuLOPSf9iORASFwhb+SNBYS2kwsf8UzT+MacyIoFqo6jmGrxXbA==
X-Received: by 2002:a17:907:7b9b:b0:6fe:dedf:6414 with SMTP id
 ne27-20020a1709077b9b00b006fededf6414mr4950521ejc.88.1653313439356; 
 Mon, 23 May 2022 06:43:59 -0700 (PDT)
Received: from fedora.sec.9e.network
 (ip-088-153-019-247.um27.pools.vodafone-ip.de. [88.153.19.247])
 by smtp.gmail.com with ESMTPSA id
 v1-20020aa7d641000000b0042acd78014esm8146587edr.11.2022.05.23.06.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 06:43:58 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v4 1/2] arm/dts: Add IBM
 Genesis3 board
Date: Mon, 23 May 2022 15:40:03 +0200
Message-Id: <20220523134004.469176-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220523134004.469176-1-patrick.rudolph@9elements.com>
References: <20220523134004.469176-1-patrick.rudolph@9elements.com>
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
 arch/arm/dts/Makefile             |  1 +
 arch/arm/dts/ast2500-genesis3.dts | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 arch/arm/dts/ast2500-genesis3.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 3515100c65..ed9714d832 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -678,6 +678,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2400-evb.dtb \
 	ast2400-ahe-50dc.dtb \
 	ast2500-evb.dtb \
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
2.35.3

