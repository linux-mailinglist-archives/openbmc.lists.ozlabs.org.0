Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9352AFBAA
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 00:27:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWgr44mG8zDqw8
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 10:27:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=reLJJMyP; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWglt6QTgzDqsX;
 Thu, 12 Nov 2020 10:23:51 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id g11so1768118pll.13;
 Wed, 11 Nov 2020 15:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DmCrvjpAUpHnNbD1lkcgSKsP0QAPloTIQfmWpnOPB6c=;
 b=reLJJMyPdImrWK05zeLDBEyEa+lRFqCxJL2fiD3yq3ecHIyBqW4XFTT8XcjleNy9m3
 wg0L/IhbV2ukdebXrv9JnMC9XYmn8IAoS/XtVsFrIOygkMGKYDfGho4GtQ2j4RPzMH/a
 UdZQqvA9O2MVjrFxUII1JEl24x88Lnxv4sOSWmc0jmf5cpYT3M0+VybSYXe3beGScVzW
 +YBS8wBYPvBCUXFQJ77x7zxheM8ZNjflJ/cn1GVfLXxtAh7oUZuunYj3hK8aESlD7ts4
 OJozDB2QvkxSJbO2h0LKK0HNo8UBDq/RFggxG6O2iuP/7109ccMkE8fbkecRXrkc5Qgu
 W4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DmCrvjpAUpHnNbD1lkcgSKsP0QAPloTIQfmWpnOPB6c=;
 b=iayfG/XTYY0oHRqZWjHhWneu0vtYhTFYEggzVujDzBhXG3+srDHlGPJsftH/+QuV/L
 GFT4v69KQk58s46v4KxK20LAvTF+TFLBKO4sTxmrxhGKuUhPbsFfoXZqmxPhiackm1By
 RLnm3Wc8rorFSgejg7/b4PNfiMNrWFV3pZjEMeRgs15/rMOnQsOHufZvBRznBdfKBq9W
 xLXEmijd8x6mHyymZKt7Y/anuQNgJYkbN5F8R4zgCSbefwNAfzF+MYh2oIYfkmMZkGfB
 tQBOnp//VWdlvpAIEiIDT8KIHwbrDD/9yuKR6NuERd1uFSaf0ZOnKsB+nSh3PLfLb2u/
 Rzyg==
X-Gm-Message-State: AOAM530asW3aTGxr4gF2w8+QwyWOnoVKxNNb+CIlOvbnUVsLK+V18DrH
 LWYMMMsQj/m1PMQezQAT510=
X-Google-Smtp-Source: ABdhPJx7DNOCqgSH2RzbcEL3w1fsullIxZN84n7XV8wUg6NQo+acSWRmrtrjziKiamGQXEM/LOxiUA==
X-Received: by 2002:a17:902:328:b029:d7:eba5:83ce with SMTP id
 37-20020a1709020328b02900d7eba583cemr10218120pld.57.1605137028251; 
 Wed, 11 Nov 2020 15:23:48 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id a128sm3901431pfb.195.2020.11.11.15.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 15:23:47 -0800 (PST)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 1/4] ARM: dts: aspeed: Common dtsi for Facebook AST2400
 Network BMCs
Date: Wed, 11 Nov 2020 15:23:27 -0800
Message-Id: <20201111232330.30843-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111232330.30843-1-rentao.bupt@gmail.com>
References: <20201111232330.30843-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

This common descirption is included by all Facebook AST2400 Network BMC
platforms to minimize duplicated device entries across Facebook Network
BMC device trees.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 .../dts/ast2400-facebook-netbmc-common.dtsi   | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 arch/arm/boot/dts/ast2400-facebook-netbmc-common.dtsi

diff --git a/arch/arm/boot/dts/ast2400-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/ast2400-facebook-netbmc-common.dtsi
new file mode 100644
index 000000000000..73a5503be78c
--- /dev/null
+++ b/arch/arm/boot/dts/ast2400-facebook-netbmc-common.dtsi
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2020 Facebook Inc.
+/dts-v1/;
+
+#include "aspeed-g4.dtsi"
+
+/ {
+	aliases {
+		/*
+		 * Override the default uart aliases to avoid breaking
+		 * the legacy applications.
+		 */
+		serial0 = &uart5;
+		serial1 = &uart1;
+		serial2 = &uart3;
+		serial3 = &uart4;
+	};
+
+	memory@40000000 {
+		reg = <0x40000000 0x20000000>;
+	};
+};
+
+&wdt1 {
+	status = "okay";
+	aspeed,reset-type = "system";
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "spi0.0";
+#include "facebook-bmc-flash-layout.dtsi"
+	};
+};
+
+&uart1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd1_default
+		     &pinctrl_rxd1_default>;
+};
+
+&uart3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd3_default
+		     &pinctrl_rxd3_default>;
+};
+
+&uart4 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_txd4_default
+		     &pinctrl_rxd4_default
+		     &pinctrl_ndts4_default>;
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&mac1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+};
+
+&i2c12 {
+	status = "okay";
+};
+
+&vhub {
+	status = "okay";
+};
-- 
2.17.1

