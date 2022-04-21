Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4AC50EE77
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 04:05:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQFv4pYvz3bb0
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 12:05:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=dKIR/IRL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=patrick.rudolph@9elements.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256
 header.s=google header.b=dKIR/IRL; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkW473hxZz2xnM
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 18:32:05 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id q3so5582909wrj.7
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 01:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=9elements.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tAAekpOW/gpXl6v4RZx/RM7xHjISLaMmy0oEXMKhuI0=;
 b=dKIR/IRLaV3rkYRMUcXllhOfcUphtGZEnKHpHbz6ULxLQFND47nn11G7qyTqqiw4/S
 p/0hxN+yDz0F0x/vz4BdDJOlGT0jhknOxU2bdxn3LRfdiCJz/tfNox26Z1tVeuRN4Jwx
 IXTDZKqMwtjYWJJmB/ChbkUgWM7ySYlMrRzTHqC9sbKXCSR6yRWWSWMU5wkfb0fg7c+6
 6GKt/gyhnk4mFElLBqWU/eCqia+20F05HTtBL6gQyjFw3sDZ2Ep5GO9xAnVtojFeyMMa
 Rs4qo+xyjiONCAxJr6RhQPYiJQzPe8/0e7FaIM6DkmNh6/uJAOx3dxirpQ7NEqLrr1Oc
 c6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tAAekpOW/gpXl6v4RZx/RM7xHjISLaMmy0oEXMKhuI0=;
 b=Wja0GjpvHG5Wzq8XbogQwITK3vFBV8cHP+vbuU4TY2nKQToPaW4kKTApP7xxxkudw1
 l8+IA8okvxk4Coz6GOCnZXGk0Gh/CWyxhQ5Ao/vkGn04IKPl3oeedsiBebN++c28R5fg
 OEXySktair5Gglw1Q8DxN+YPmXXdovBjDwYl4n0pLsZDK7U1ILNbR6PIL3+pXRrwsq9o
 HmWS5PYysb556Rx9NSvyiOYOdQv/GGHOwgBoJ+Gl2M+wURewUniXu2FrrG+hARN0Iy+Q
 A57I9vLm0nIyndZI8EiGGzNha/qRjSYMhRZq6MH2MWxN0KQo2doNJuxt+Uo6AxGxAeAK
 4/Rw==
X-Gm-Message-State: AOAM533OKTiG9rJnN781KiRQ6PiviMKfdcrcnjyZBCo0vCYAcxRqAIgB
 zMYqf30ID2m90f8NUpntJEN2uA==
X-Google-Smtp-Source: ABdhPJwFhKWWjw50ratQzxhzCMIDzQcZxbZKVkxM9X/V+kZmQMlK9nPQR+Rt0Tn5nubcOsk7mVfnJw==
X-Received: by 2002:a05:6000:799:b0:207:a326:8e with SMTP id
 bu25-20020a056000079900b00207a326008emr18572607wrb.516.1650529919490; 
 Thu, 21 Apr 2022 01:31:59 -0700 (PDT)
Received: from fedora.lab.9e.network
 (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm1537238wmb.48.2022.04.21.01.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 01:31:59 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	zweiss@equinix.com
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 1/4] arm/dts: Add Genesis3
 board
Date: Thu, 21 Apr 2022 10:31:48 +0200
Message-Id: <20220421083151.1887871-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421083151.1887871-1-patrick.rudolph@9elements.com>
References: <20220421083151.1887871-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Apr 2022 12:05:01 +1000
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
 Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add devicetree source file. It uses the evb-ast2500 board files.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 arch/arm/dts/Makefile         |  1 +
 arch/arm/dts/ibm-genesis3.dts | 83 +++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 arch/arm/dts/ibm-genesis3.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index a79f885f54..fae23e6bc1 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -677,6 +677,7 @@ dtb-$(CONFIG_ARCH_BCM6858) += \
 dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2400-evb.dtb \
 	ast2500-evb.dtb \
+	ibm-genesis3.dtb \
 	ast2600a0-evb.dtb \
 	ast2600a1-evb.dtb \
 	ast2600-bletchley.dtb \
diff --git a/arch/arm/dts/ibm-genesis3.dts b/arch/arm/dts/ibm-genesis3.dts
new file mode 100644
index 0000000000..c808fd27c4
--- /dev/null
+++ b/arch/arm/dts/ibm-genesis3.dts
@@ -0,0 +1,83 @@
+/dts-v1/;
+
+#include "ast2500-u-boot.dtsi"
+
+/ {
+	model = "IBM Genesis3";
+	compatible = "ibm,genesis3-bmc", "aspeed,ast2500";
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	aliases {
+		spi0 = &fmc;
+		ethernet0 = &mac0;
+		ethernet1 = &mac1;
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
+&wdt1 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&wdt2 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&wdt3 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+	phy-mode = "rgmii";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mac1link_default &pinctrl_mdio1_default>;
+};
+
+&mac1 {
+	status = "okay";
+	phy-mode = "rgmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mac2link_default &pinctrl_mdio2_default>;
+};
+
+&fmc {
+	status = "okay";
+	timing-calibration-disabled;
+	flash@0 {
+		compatible = "spi-flash", "spansion,s25fl256l";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+
+	flash@1 {
+		compatible = "spi-flash", "spansion,s25fl256l";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
-- 
2.35.1

