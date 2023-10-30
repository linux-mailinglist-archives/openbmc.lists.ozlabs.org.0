Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8E07DB235
	for <lists+openbmc@lfdr.de>; Mon, 30 Oct 2023 04:14:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QBuR9eDv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SJdfd6k7Mz3c40
	for <lists+openbmc@lfdr.de>; Mon, 30 Oct 2023 14:14:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QBuR9eDv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SJdf10Y9Dz2ygX
	for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2023 14:13:58 +1100 (AEDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1dd71c0a41fso2517291fac.2
        for <openbmc@lists.ozlabs.org>; Sun, 29 Oct 2023 20:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698635631; x=1699240431; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nX+D+tZSx1xFt9WPoQnxOWqK8RwDKRszIYRl9ZcJW8g=;
        b=QBuR9eDvnzBsPfYENdZbTMcvAz4fcTTQE+08E04Tc0wj2U1dszrvVFjsL084rc9tB9
         yalPTCnVziLL/AbmlEiu6YB9p/AcSq76goVOEEtWjl68iJkw8o95j/AqsoAZlwJmhYLS
         Sg6QmTSOpRy5oROIVM5cxJaLjtMAV0DuEXAccy51Skc59roZ+qdmrSf3SawtQFyhRs3B
         Dlza889ksypmkc4wmF0xIpa8EEohoupJXtFGnE3UUvu9tRMxnn19DBEN+v/unlJJrhY9
         7jOYJhKzIiWb/HItVdBrBsSpv8c/mfLM22DXws3LPoHCdu5VXuK+NN8/Bdw3SWEzwOLz
         o/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698635631; x=1699240431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nX+D+tZSx1xFt9WPoQnxOWqK8RwDKRszIYRl9ZcJW8g=;
        b=Wa1En0jBHRBwOPl7xK6MNAmmmviYGX+db9PMdjnk/IXp0oO6HzyZAUjFtyEr30cSV2
         jcsxpd2dxCZ6Fm+vFGGxPz3WXjdFcSMvJWPh/z7JqyiebbXaQch+q6YqNAfzxKafTZr/
         WL8GSs1u47/OgYiFz9jlkvGKqKtEH67xQUSIc9fQYWIpjKjjWNruYtpwQM3p4VdL86+i
         3wagJuPnwU5eLHIAFEIns4s9Oftt311EJj/kwp0GV2pRlBVtuJWNqv04ZfS2q81Zhp3e
         BhG3uyw7MPVn2I1Y/seSc2rKpWDmUoxGWNqRjX8W/NgUoeDDN2IpIzcftvzPxmVHMYRu
         A5Qg==
X-Gm-Message-State: AOJu0YxMtHX4qX4N3MrnoZgkGyGAnskg8XzkF7ANzz98RnUZ2laICvwL
	wPDFa6NF0N9Z+182QRkhtALtqaIIKMc=
X-Google-Smtp-Source: AGHT+IH7w+4bcxbGKnUlu69YuvQAgdCmzzT1OJtdynLoD9q+6TrQnlTuJOZZn4j5qWBabH9Uyguufw==
X-Received: by 2002:a05:6870:238e:b0:1ea:7c8a:c9dc with SMTP id e14-20020a056870238e00b001ea7c8ac9dcmr10245728oap.26.1698635630886;
        Sun, 29 Oct 2023 20:13:50 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id a26-20020a63bd1a000000b005b8e1b0090asm3821205pgf.67.2023.10.29.20.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 20:13:50 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	patrick@stwcx.xyz
Subject: [PATCH v1] ARM: dts: Aspeed: Add Facebook common dts
Date: Mon, 30 Oct 2023 11:11:45 +0800
Message-Id: <20231030031145.81032-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: peter.yin@quantatw.com, Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Initial introduction of Facebook common
equipped with Aspeed 2600 BMC SoC.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
Change Log:

  v1: Add Facebook common equipped with Aspeed 2600 BMC SoC.
---
 arch/arm/dts/Makefile       |  1 +
 arch/arm/dts/ast2600-fb.dts | 66 +++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-fb.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 37675a3277..d1eabaa675 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -687,6 +687,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-evb.dtb \
 	ast2600-evb-ecc.dtb \
 	ast2600-dcscm.dtb \
+	ast2600-fb.dtb \
 	ast2600-fpga.dtb \
 	ast2600-greatlakes.dtb \
 	ast2600-intel.dtb \
diff --git a/arch/arm/dts/ast2600-fb.dts b/arch/arm/dts/ast2600-fb.dts
new file mode 100644
index 0000000000..69ff575419
--- /dev/null
+++ b/arch/arm/dts/ast2600-fb.dts
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2023 Meta Platforms Inc.
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "Facebook Common BMC";
+	compatible = "facebook,common-bmc", "aspeed,ast2600";
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	aliases {
+		spi0 = &fmc;
+	};
+
+	cpus {
+		cpu@0 {
+			clock-frequency = <800000000>;
+		};
+		cpu@1 {
+			clock-frequency = <800000000>;
+		};
+	};
+};
+
+&uart5 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&sdrammc {
+	clock-frequency = <400000000>;
+};
+
+&fmc {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+
+	flash@1 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
+&hace {
+	status = "okay";
+};
-- 
2.25.1

