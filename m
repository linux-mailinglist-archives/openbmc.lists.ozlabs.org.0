Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B770463CFE8
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 08:53:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMWf44XNXz3bWj
	for <lists+openbmc@lfdr.de>; Wed, 30 Nov 2022 18:53:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=eqLRsqnd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=patrick.rudolph@9elements.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=eqLRsqnd;
	dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMWdW6lLRz2xVr
	for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2022 18:52:30 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id n20so39400930ejh.0
        for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2022 23:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oS2XC6fdTXuWOLrVDXR1a2AzA8BB4cDv+VOxEeSMDbQ=;
        b=eqLRsqnd9gc0JWglPojwZhZ4WX19/ubXq/NOS8xCIJnMRcNBEJyvz0sn+NbGqICFUe
         eVxOKw68lbucLuKCsNE/L/P4hRR9v/lO+uk7OHLnoojgvlF5UkHhpvJzdswHwUud9Vul
         147Gxger9F2VUT1VzeU3xO0Lh47yY/JPRbZFyTtQ9x+Ov3fFclIaBUxnTMPfMUWUXQyJ
         2OLUDT1YWl5EkD7cBWifiBEkc27qL5ydx3ll3UAmgGAuDo4fyhjeQkHbYSJtBzim8iu6
         1ku3UiNwGt0aOPaVWGh6Rv2Hh8FSnDFuzENiT8f1pduzDx5RHWZ4ZwTngPCZflGoCw+J
         7TaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oS2XC6fdTXuWOLrVDXR1a2AzA8BB4cDv+VOxEeSMDbQ=;
        b=EsnQtCfhluEHx6J5CcO1YVwMSssGV0Y7/uolTC9MgQOMEtIJ2dwEujEEeJ21CaLYpn
         RO9VECJiqWOtd7RwcWkzhekpzEa5O8OefDtzACfEmb9A4B37cswazaSijEEy7feI3z25
         fZyX69CDpr+onbL/P9MGlZrtB+Nma9AQqo6bppElWnVdpSkuPP7bTLPSqA5czJlhEgmw
         eZUqHGIADN8n6c/CBOU6PNWupoKaTBEEXgoxk7EzC2eGGy4r1g5rK77yXF5x7mbUf5R+
         T9ZHIMeQ6Nh6fIuV8xeiFmNazbSYDJsBJrjvzu1csF8nqxZ0lj4fAmyC0Ec5rII4JbS7
         k8jw==
X-Gm-Message-State: ANoB5pkn9821PRtsbmW8tEvA/Y8egpQcAo7N+ga5stlr8pnOezrtqVCC
	T2prZKYl5ujamdpQ1Y1HTl1HAg==
X-Google-Smtp-Source: AA0mqf7Xk1DXgRXQhxapNKvDlOZQ0wbRuft2nW7U3pdviRpnQLgbq6BNOv6pC8RoYdK+pxhba9qUiw==
X-Received: by 2002:a17:906:8156:b0:7c0:8fe9:cd0a with SMTP id z22-20020a170906815600b007c08fe9cd0amr4206751ejw.348.1669794747088;
        Tue, 29 Nov 2022 23:52:27 -0800 (PST)
Received: from fedora.. (ip-094-114-233-057.um31.pools.vodafone-ip.de. [94.114.233.57])
        by smtp.gmail.com with ESMTPSA id s17-20020a05640217d100b004585eba4baesm313236edy.80.2022.11.29.23.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 23:52:26 -0800 (PST)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [RESEND][PATCH u-boot v2019.04-aspeed-openbmc v6 1/2] arm/dts: Add IBM Genesis3 board
Date: Wed, 30 Nov 2022 08:52:21 +0100
Message-Id: <20221130075222.1238196-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130075222.1238196-1-patrick.rudolph@9elements.com>
References: <20221130075222.1238196-1-patrick.rudolph@9elements.com>
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
Cc: takken@us.ibm.com, andrew@aj.id.au, naresh.solanki@9elements.com, christian.walter@9elements.com, Patrick Rudolph <patrick.rudolph@9elements.com>, zweiss@equinix.com
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

