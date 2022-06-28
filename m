Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB22577E36
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 11:02:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbZ35tQCz3bXn
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 19:02:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kupw/HG6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kupw/HG6;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX8r70lHjz30Qc
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 13:16:06 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id g20-20020a17090a579400b001ed52939d72so5847728pji.4
        for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2022 20:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=erc0cF0H69wNUT+Fr3YuZFhUNW2gCbs/AEVN/v4U6VE=;
        b=kupw/HG6lc1xepHG5yEonTxQMiDCJGkZIIdkqpAFeW/PaRpFvwO72w39IuiMsW+wvj
         KJcFcq+IDLrTiM1oHc9ZZOsp0aGCRofeLeN4hjS66jR5RYFuGc1JEnQceih31sAVhraR
         zygvIDBFmVXLOCKQqr5k8VsV+vopFK5ZSddgDQQo8KzpE7HeK6/8pM0owqNGo2HgK4Aa
         Z9LXIVtfPqwd1Wx5+p7Q2HaqS2/5OogkeDE8c0qJlkXzbu9hKpSLu+dWE6TAuEg2VjIc
         1nZ7dEVGvm2x527NRC3pJfzFRGdPwGlt67/f7J8ibADAl69YJQ3LhkQLYSvr16Hr/cJ6
         6gZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=erc0cF0H69wNUT+Fr3YuZFhUNW2gCbs/AEVN/v4U6VE=;
        b=6h9F/ONMA+5vp1DJLrmEindNxA/fe96bWaHGX5niONC5XrEU2XA8880GDls4YVkJ0a
         R0cT5NJQj6S6XhCYNOt/Dx9G41U88BZm/EY8pR7B58zLo45zW4CBywUE9w8yGzZiHIHh
         YR4EKL9FDhnjmbeD7vrEgeaJjV+RpjR73suEpsJ7V+j0+fToyFA+ir3UXU921YzvEpzz
         W8J0+XNIRabFyW1j+gP2EgrSipvNDUbRr9IYq0iCjA4tx2nmfqQ9eu9F1pLLT4+nzapV
         RHjpAlviaBcHkgBaGx4ldyi7kI6xnL7cNdnyRUqOji7ZZykgL64vLfQe+MiB2hYedV3s
         bMQg==
X-Gm-Message-State: AJIora943QuMZnlxS1tZLWqbjJRMvefF4k+9nn5l/DgnRKy7W1RrJoIq
	0K1kPYF2tL6Rddi3WZS5yAeimb7M4GbEjA==
X-Google-Smtp-Source: AGRyM1uwCtNLyWzgdal5DCm/eVW5/1GjvSlsHVuMiWhS7A8SgTbybVBu+tEWW2nOo51ArTSBTJ5bdw==
X-Received: by 2002:a17:903:22d0:b0:16a:3039:adc9 with SMTP id y16-20020a17090322d000b0016a3039adc9mr2687821plg.32.1656386164401;
        Mon, 27 Jun 2022 20:16:04 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090264d600b0016a0b31a8bdsm8046511pli.4.2022.06.27.20.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 20:16:03 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 4/4] ARM: dts: aspeed: bletchley: update fusb302 nodes
Date: Tue, 28 Jun 2022 11:13:43 +0800
Message-Id: <20220628031343.21097-5-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220628031343.21097-1-potin.lai.pt@gmail.com>
References: <20220628031343.21097-1-potin.lai.pt@gmail.com>
X-Mailman-Approved-At: Mon, 18 Jul 2022 18:59:27 +1000
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
Cc: Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

1. Add interrupt pin of fusb302 on each sled.
2. Add vbus-supply property in each fusb302 node.
3. Fix BMC power-role at source and data-role at host.
4. Disable PD to avoid "HARD Reset" due to incompatible PD ver.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../dts/aspeed-bmc-facebook-bletchley.dts     | 150 ++++++++++++------
 1 file changed, 102 insertions(+), 48 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 7b6de9b51547..9fdb3d17596b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -225,6 +225,60 @@
 			linux,code = <ASPEED_GPIO(H, 7)>;
 		};
 	};
+
+	vbus_sled1: vbus_sled1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_sled1";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&sled1_ioexp 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vbus_sled2: vbus_sled2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_sled2";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&sled2_ioexp 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vbus_sled3: vbus_sled3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_sled3";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&sled3_ioexp 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vbus_sled4: vbus_sled4 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_sled4";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&sled4_ioexp 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vbus_sled5: vbus_sled5 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_sled5";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&sled5_ioexp 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vbus_sled6: vbus_sled6 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_sled6";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&sled6_ioexp 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &mac2 {
@@ -336,17 +390,17 @@
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(B, 0) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled1>;
+
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "dual";
-			try-power-role = "sink";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-					PDO_VAR(3000, 12000, 3000)
-					PDO_PPS_APDO(3000, 11000, 3000)>;
-			op-sink-microwatt = <10000000>;
+			power-role = "source";
+			data-role = "host";
+			pd-disable;
+			typec-power-opmode = "default";
 		};
 	};
 
@@ -422,17 +476,17 @@
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(B, 1) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled2>;
+
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "dual";
-			try-power-role = "sink";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-					PDO_VAR(3000, 12000, 3000)
-					PDO_PPS_APDO(3000, 11000, 3000)>;
-			op-sink-microwatt = <10000000>;
+			power-role = "source";
+			data-role = "host";
+			pd-disable;
+			typec-power-opmode = "default";
 		};
 	};
 
@@ -508,17 +562,17 @@
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(B, 7) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled3>;
+
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "dual";
-			try-power-role = "sink";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-					PDO_VAR(3000, 12000, 3000)
-					PDO_PPS_APDO(3000, 11000, 3000)>;
-			op-sink-microwatt = <10000000>;
+			power-role = "source";
+			data-role = "host";
+			pd-disable;
+			typec-power-opmode = "default";
 		};
 	};
 
@@ -594,17 +648,17 @@
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(S, 7) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled4>;
+
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "dual";
-			try-power-role = "sink";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-					PDO_VAR(3000, 12000, 3000)
-					PDO_PPS_APDO(3000, 11000, 3000)>;
-			op-sink-microwatt = <10000000>;
+			power-role = "source";
+			data-role = "host";
+			pd-disable;
+			typec-power-opmode = "default";
 		};
 	};
 
@@ -680,17 +734,17 @@
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(Y, 3) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled5>;
+
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "dual";
-			try-power-role = "sink";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-					PDO_VAR(3000, 12000, 3000)
-					PDO_PPS_APDO(3000, 11000, 3000)>;
-			op-sink-microwatt = <10000000>;
+			power-role = "source";
+			data-role = "host";
+			pd-disable;
+			typec-power-opmode = "default";
 		};
 	};
 
@@ -766,17 +820,17 @@
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(I, 7) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled6>;
+
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			power-role = "dual";
-			try-power-role = "sink";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
-					PDO_VAR(3000, 12000, 3000)
-					PDO_PPS_APDO(3000, 11000, 3000)>;
-			op-sink-microwatt = <10000000>;
+			power-role = "source";
+			data-role = "host";
+			pd-disable;
+			typec-power-opmode = "default";
 		};
 	};
 
-- 
2.17.1

