Return-Path: <openbmc+bounces-692-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B036EBA14D5
	for <lists+openbmc@lfdr.de>; Thu, 25 Sep 2025 22:07:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXl9D5zWzz3cYL;
	Fri, 26 Sep 2025 06:06:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758830800;
	cv=none; b=PJJjaPkGG3Ub/Xj1bcOfQQNvxMJrvGXdhuULul9iOdaNZt5FtuLE28NfszYmve0aDiSkIZqBPJM2KVtofIj+UszVQiZ6pcKU5zx3G0IYUhwenO8ldyeB3qlx5daSH75xgsYOVjvbM1rD4z7amGiZgLIj2pqx7ZhYDKUJIlB+9UU3KZ6+iHrQ/9vUBfPvjtXpr0TC/tHKEjsZl0hqxhA49Ic+gvo736ValBTCd9Gh2atD3iB2i8LS/YXeVaCLmTUeKFDKTXHgpolq4fxIsiMVIpLOTx+3G9qenkJDSrU7sKJcgDC22N6m4v469zxTdvKOPWl40N7EJGRa3lBMCH2IpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758830800; c=relaxed/relaxed;
	bh=0Jqvr6aZqMFctJyCbwOIGg2m9JnfdEm7BBcrrO1JbYo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UwNDFqghgf9TN7lns0scbmZudRq9AnT2U96MHvHLuJC/MoGUrg/EbYLR6oMrkMb3gg37jf5Y7/8T48a+D7wt0bbUr6mxSBiV94IFJh+JpEieoCgNtkmcYPgA73d57u4H1p1mjNVCBNbAUJQMV7veaboHf/HLLETphBBIBAT+2ugnhvUNtApdAwSRtzogOYG0KDR+wVSHs/yQ0ejx9162uKhVyRgDQaPzv2oXBCoIM9I1fG3VbjZ8ysE1FWbujdK6Xczl4ga9ncDRHhDtPqs48X+nVKJD6wd4E4a4bX8bKmTJsDo//q1fU3zR/xA/CbHNF6OeaVy7RQ2h9y9I0zsdRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rjos1GMR; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rjos1GMR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXl9C6GBVz2yCK
	for <openbmc@lists.ozlabs.org>; Fri, 26 Sep 2025 06:06:39 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso7782775e9.2
        for <openbmc@lists.ozlabs.org>; Thu, 25 Sep 2025 13:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758830796; x=1759435596; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Jqvr6aZqMFctJyCbwOIGg2m9JnfdEm7BBcrrO1JbYo=;
        b=Rjos1GMR7RVILGh+rh7zUFcp7JR4FZPwN2Dhbc8hx51soQW/MWMKnigX9X75RUXQvE
         jJOJss+8+6fMGplfqG7uEdAUj6ZUpNg2Ya7IqmVAGlGWCn0OdBrXm7RrHVD8G9Csogo8
         2zhOIC2uSjvtlMiNDSzDdyrEYTlU7b7lepn58Uu5FHNvolDxg74rdwJKYFn7I1fVrzgF
         X/UPHbCzwXeksEUUBoed1nGmlc3+Gw/h5OwYay348ym4/tE6mihsSYCIIO2fFN4HHfkj
         Uu2qI2BaNw+nd9clGxWyCpZmucLD++In8nY7c2W3JTjL3XA7V3n4Wdw4OI0d0r1tt7xv
         yuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758830796; x=1759435596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Jqvr6aZqMFctJyCbwOIGg2m9JnfdEm7BBcrrO1JbYo=;
        b=CljNE2fAv1U7SJTJB4QJ1R0i8fRr08IQBlG2Nt2I+z1zghEHaGCyjQmQf77bEzLM0d
         Bdw6Fm4fculEEc7geXrknbBSaq0BALWP1k9IFCuth7tNJDDaXD7lcDFPXOoZ9WRJDvwP
         99u5nhBK/LcPAX6g/DsFVCS0uCrKKfR2SvKYzqY3Z8XOQLmouZ2Su+FJb0hASSZr+bDJ
         3B86WEqZvRqc5L6fcUXTvz/xrmzzv05L8NTGtvUfPsbn+hYp3KkChGf4kqvW/WnPbRkl
         QQ2SP0gjGSY2kG/0n/cZWNG+fZWx44HnZ/tk0oGJuk/U0vL+nIMUNMvLBmasC4klt1o+
         9LpQ==
X-Gm-Message-State: AOJu0Yz/Z2BvbWhVr4y266A2LsJGONwPbwflbwnWgpXu2x/sXfp20DJP
	/DkRjClID4GO8hORzZTZobW/n9ZsvtVqDcdom/e9o2I7IkSzrrz8apLQ
X-Gm-Gg: ASbGncuppgOciO8NYQ1zenOVzFeZU8+J02UedaybSAgMcX9e8aSi6duPXGzVWV/ohVk
	wwM9fmHghvOLeUTq0T81xU+Nf2dhbhWfgBlxODw01fu6Pn3TulQlhf/N4275Z9Oc1Gee4x20/tG
	jOQ598EKHFaKeAmpDu+MHQIdslcGDJzWDk3Aw4hSsx+DkHsMMFabym9uBLjVtScaFDAxHmkVx+u
	buCfPSrO8ebHOlieL5EHZWJXi+E0gsf3mYza3MJwRUv2X7Wo1e1vzvcoQWNs9mYJrIw5hw3d1M8
	oSTNWVQy7clxfliJSGmp+zzfZfZF7Hr6rdENa3A897YzwL/w1nA/jrMYTNdnEB7SPzLsUAq/H3/
	z51O0Ias4PeqiWMfHjo5oABU+DhpQ4vfpzqU7lQnJUnqk
X-Google-Smtp-Source: AGHT+IFNKexEYP6eXvdZomlwHexpTC6N+7NVPLHb2O9ndmfpNliFpqOhvZyQYAMlTJxAljpPMAkehw==
X-Received: by 2002:a05:600c:8b16:b0:468:7f92:5a80 with SMTP id 5b1f17b1804b1-46e329fbd2bmr34832865e9.27.1758830796327;
        Thu, 25 Sep 2025 13:06:36 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e34074983sm43901835e9.10.2025.09.25.13.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 13:06:35 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	avifishman70@gmail.com,
	tali.perry1@gmail.com,
	joel@jms.id.au,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v3 3/3] arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes
Date: Thu, 25 Sep 2025 23:06:25 +0300
Message-Id: <20250925200625.573902-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925200625.573902-1-tmaimon77@gmail.com>
References: <20250925200625.573902-1-tmaimon77@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Enable peripheral support for the Nuvoton NPCM845 Evaluation Board by
adding device nodes for Ethernet controllers, MMC controller, SPI
controllers, USB device controllers, random number generator, ADC,
PWM-FAN controller, I2C controllers, and PECI interface.
Include MDIO nodes for Ethernet PHYs, reserved memory for TIP, and
aliases for device access.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 440 ++++++++++++++++++
 1 file changed, 440 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 2638ee1c3846..53e6a0af5a21 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -9,6 +9,42 @@ / {
 	compatible = "nuvoton,npcm845-evb", "nuvoton,npcm845";
 
 	aliases {
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
+		ethernet3 = &gmac3;
+		fiu0 = &fiu0;
+		fiu1 = &fiu3;
+		fiu2 = &fiux;
+		fiu3 = &fiu1;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		i2c12 = &i2c12;
+		i2c13 = &i2c13;
+		i2c14 = &i2c14;
+		i2c15 = &i2c15;
+		i2c16 = &i2c16;
+		i2c17 = &i2c17;
+		i2c18 = &i2c18;
+		i2c19 = &i2c19;
+		i2c20 = &i2c20;
+		i2c21 = &i2c21;
+		i2c22 = &i2c22;
+		i2c23 = &i2c23;
+		i2c24 = &i2c24;
+		i2c25 = &i2c25;
+		i2c26 = &i2c26;
+		mdio-gpio0 = &mdio0;
+		mdio-gpio1 = &mdio1;
 		serial0 = &serial0;
 	};
 
@@ -16,7 +52,32 @@ chosen {
 		stdout-path = &serial0;
 	};
 
+	mdio0: mdio-0 {
+		compatible = "virtual,mdio-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>,
+			<&gpio1 26 GPIO_ACTIVE_HIGH>;
+
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+
+	mdio1: mdio-1 {
+		compatible = "virtual,mdio-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>,
+			<&gpio2 28 GPIO_ACTIVE_HIGH>;
+
+		phy1: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+
 	memory@0 {
+		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
 
@@ -25,12 +86,391 @@ refclk: refclk-25mhz {
 		clock-frequency = <25000000>;
 		#clock-cells = <0>;
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		tip_reserved: tip@0 {
+			reg = <0x0 0x0 0x0 0x6200000>;
+		};
+	};
+};
+
+&adc {
+	#io-channel-cells = <1>;
+	status = "okay";
+};
+
+&fiu0 {
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		spi-rx-bus-width = <1>;
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			partition@0 {
+				label = "bb-uboot-1";
+				reg = <0x0000000 0x80000>;
+				read-only;
+				};
+			partition@80000 {
+				label = "bb-uboot-2";
+				reg = <0x0080000 0x80000>;
+				read-only;
+				};
+			partition@100000 {
+				label = "env-param";
+				reg = <0x0100000 0x40000>;
+				read-only;
+				};
+			partition@140000 {
+				label = "spare";
+				reg = <0x0140000 0xC0000>;
+				};
+			partition@200000 {
+				label = "kernel";
+				reg = <0x0200000 0x400000>;
+				};
+			partition@600000 {
+				label = "rootfs";
+				reg = <0x0600000 0x700000>;
+				};
+			partition@d00000 {
+				label = "spare1";
+				reg = <0x0d00000 0x200000>;
+				};
+			partition@f00000 {
+				label = "spare2";
+				reg = <0x0f00000 0x200000>;
+				};
+			partition@1100000 {
+				label = "spare3";
+				reg = <0x1100000 0x200000>;
+				};
+			partition@1300000 {
+				label = "spare4";
+				reg = <0x1300000 0x0>;
+			};
+		};
+	};
+};
+
+&fiu1 {
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <2>;
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			partition@0 {
+				label = "spi1-system1";
+				reg = <0x0 0x0>;
+			};
+		};
+	};
+};
+
+&fiu3 {
+	pinctrl-0 = <&spi3_pins>, <&spi3quad_pins>;
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		spi-rx-bus-width = <1>;
+		reg = <0>;
+		spi-max-frequency = <5000000>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			partition@0 {
+				label = "spi3-system1";
+				reg = <0x0 0x0>;
+			};
+		};
+	};
+};
+
+&fiux {
+	spix-mode;
+};
+
+&gmac1 {
+	phy-mode = "rgmii-id";
+	snps,eee-force-disable;
+	status = "okay";
+};
+
+&gmac2 {
+	phy-mode = "rmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&r1_pins
+			&r1oen_pins>;
+	phy-handle = <&phy0>;
+	status = "okay";
+};
+
+&gmac3 {
+	phy-mode = "rmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&r2_pins
+			&r2oen_pins>;
+	phy-handle = <&phy1>;
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	eeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <0x10>;
+		i2c-protocol;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	ipmb@11 {
+		compatible = "ipmb-dev";
+		reg = <0x11>;
+		i2c-protocol;
+	};
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
+	#address-cells = <1>;
+	#size-cells = <0>;
+	tmp100@48 {
+		compatible = "tmp100";
+		reg = <0x48>;
+		status = "okay";
+	};
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
+&i2c9 {
+	status = "okay";
+};
+
+&i2c10 {
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
+&i2c13 {
+	status = "okay";
+};
+
+&i2c14 {
+	status = "okay";
+};
+
+&i2c15 {
+	status = "okay";
+};
+
+&i2c16 {
+	status = "okay";
+};
+
+&i2c17 {
+	status = "okay";
+};
+
+&i2c18 {
+	status = "okay";
+};
+
+&i2c19 {
+	status = "okay";
+};
+
+&i2c20 {
+	status = "okay";
+};
+
+&i2c21 {
+	status = "okay";
+};
+
+&i2c22 {
+	status = "okay";
+};
+
+&i2c23 {
+	status = "okay";
+};
+
+&i2c24 {
+	status = "okay";
+};
+
+&i2c25 {
+	status = "okay";
+};
+
+&i2c26 {
+	status = "okay";
+};
+
+&mc {
+	status = "okay";
+};
+
+&peci {
+	status = "okay";
+};
+
+&pwm_fan {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm0_pins &pwm1_pins
+		&pwm2_pins &pwm3_pins
+		&pwm4_pins &pwm5_pins
+		&pwm6_pins &pwm7_pins
+		&fanin0_pins &fanin1_pins
+		&fanin2_pins &fanin3_pins
+		&fanin4_pins &fanin5_pins
+		&fanin6_pins &fanin7_pins>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	fan@0 {
+		reg = <0x00>;
+		fan-tach-ch = <0x0 0x1>;
+		cooling-levels = <127 255>;
+	};
+	fan@1 {
+		reg = <0x01>;
+		fan-tach-ch = <0x2 0x3>;
+		cooling-levels = <127 255>;
+	};
+	fan@2 {
+		reg = <0x02>;
+		fan-tach-ch = <0x4 0x5>;
+		cooling-levels = <127 255>;
+	};
+	fan@3 {
+		reg = <0x03>;
+		fan-tach-ch = <0x6 0x7>;
+		cooling-levels = <127 255>;
+	};
+	fan@4 {
+		reg = <0x04>;
+		fan-tach-ch = <0x8 0x9>;
+		cooling-levels = <127 255>;
+	};
+	fan@5 {
+		reg = <0x05>;
+		fan-tach-ch = <0xa 0xb>;
+		cooling-levels = <127 255>;
+	};
+	fan@6 {
+		reg = <0x06>;
+		fan-tach-ch = <0xc 0xd>;
+		cooling-levels = <127 255>;
+	};
+	fan@7 {
+		reg = <0x07>;
+		fan-tach-ch = <0xe 0xf>;
+		cooling-levels = <127 255>;
+	};
+};
+
+&rng {
+	status = "okay";
+};
+
+&sdhci {
+	status = "okay";
 };
 
 &serial0 {
 	status = "okay";
 };
 
+&udc0 {
+	status = "okay";
+};
+
+&udc1 {
+	status = "okay";
+};
+
+&udc2 {
+	status = "okay";
+};
+
+&udc3 {
+	status = "okay";
+};
+
+&udc4 {
+	status = "okay";
+};
+
+&udc5 {
+	status = "okay";
+};
+
+&udc6 {
+	status = "okay";
+};
+
+&udc7 {
+	status = "okay";
+};
+
 &watchdog1 {
 	status = "okay";
 };
-- 
2.34.1


