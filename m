Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 141BE6671E
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 08:39:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lNYY1YlszDqgS
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 16:38:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ribseH07"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lNVn43PdzDqc5
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2019 16:36:33 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id m9so4260913pls.8
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2019 23:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kwO7stI8IclU6cY1WznkD7UgvGicce1LOFfb8N6au/8=;
 b=ribseH07y+8klYbs33X+8HmyXnsC9o1Y7kWcL40u/MgCv0yaeOZZQ3O3jBBJnO0Ije
 z6aps0Sgb7du/jzpM7P8RGiPn1w7TIz/4g11qFKu2baq1OMSTLnv2S0vu0P4TUR42vPz
 BIJMMER+vaDRBVBSoYcA8l/25keInkFkCDcozpwQ35VGwhOoaICUlgf7iB4NVQUuWKfe
 7ai9cuFjHjDy8xb1v1QWlBxwTLuQLucJzPYQFuYp/tqnhHIFbuQWNytk/xHh1nN8rgbY
 w+80SnHSlfWGnKRlyz42tFS33j9jRevs5e4AhpJC9WE5gws0hFdn1YD6+XjU/2b49/BL
 r46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kwO7stI8IclU6cY1WznkD7UgvGicce1LOFfb8N6au/8=;
 b=RT05LsWujPiMdQfSjQAUXwjqoWq2cAPQleH6FLwXa5Wg3wWy8jrV9jMTOU/Vnhjq3p
 yCP4XvipITMg+KroeAIGWQ21mEP6VrpKWWLaDZ1MkYznfIoTCR6SMx92Jz/2AtaG+vZ/
 vsdHId84dN63gKXt6wEdLr9BDK3nv5KQ1Oejxnevl5yqynQV38L6YBSqcVig8XuxGAXN
 VHp+bN6qD3F6TWLz2/8JrmfdJjYuGXY3mXDhM6Pst3qcvG2eOb0j3dwoBToJKusQ7D4/
 fEObh2dd5oIuMHk3cZoTS10XK7ypsb4aONe/eoSX9SfuviUxGi9AbFbfFnom5BEOUlRd
 O+tA==
X-Gm-Message-State: APjAAAUprdMEN5Qf95ORx7t2YnDcySQoEWyFVYk8umOhKRqqq53ITtNP
 gRTPk8mQQY7TvgR9RbJpD6k=
X-Google-Smtp-Source: APXvYqxR5wlPEZtoza6HT3TpB39P/m3xv+kNjGhFiwkej/TOA2WiuojPMh0e8KZKRoWVf9/h2mJzIg==
X-Received: by 2002:a17:902:e383:: with SMTP id
 ch3mr9394349plb.23.1562913390610; 
 Thu, 11 Jul 2019 23:36:30 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id z19sm6610488pgv.35.2019.07.11.23.36.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 11 Jul 2019 23:36:30 -0700 (PDT)
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: joel@jms.id.au,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com
Subject: 
Date: Fri, 12 Jul 2019 14:35:07 +0800
Message-Id: <20190712063511.96268-2-chyishian.jiang@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190712063511.96268-1-chyishian.jiang@gmail.com>
References: <20190712063511.96268-1-chyishian.jiang@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Samuel Jiang <Samuel.Jiang@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

this patch match v1-1/6 patch. and the v2 add iio-hwmon

From: Samuel Jiang <Samuel.Jiang@quantatw.com>
Date: Fri, 12 Jul 2019 10:19:20 +0800
Subject: [PATCH dev-5.2 v2 2/7] ARM: dts: nuvoton: runbmc-nuvoton: add hwmon
 and ahb features

add hwmon, mux-controller and ahb features like:
1. ethernet
2. usb
3. udc
4. partition
5. lpc
6. kcs

Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 248 +++++++++++++++++++
 1 file changed, 248 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
index 831a73e5a88e..dc34f53af0b7 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
@@ -10,10 +10,27 @@
 	compatible = "nuvoton,npcm750";
 
 	aliases {
+		ethernet0 = &emc0;
+		ethernet1 = &gmac0;
 		serial0 = &serial0;
 		serial1 = &serial1;
 		serial2 = &serial2;
 		serial3 = &serial3;
+		udc0 = &udc0;
+		udc1 = &udc1;
+		udc2 = &udc2;
+		udc3 = &udc3;
+		udc4 = &udc4;
+		udc5 = &udc5;
+		udc6 = &udc6;
+		udc7 = &udc7;
+		udc8 = &udc8;
+		udc9 = &udc9;
+		emmc0 = &sdhci0;
+		spi0 = &spi0;
+		spi1 = &spi1;
+		fiu0 = &fiu0;
+		fiu1 = &fiu3;
 	};
 
 	chosen {
@@ -24,14 +41,197 @@
 		reg = <0 0x40000000>;
 	};
 
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
+	};
+
+
 	ahb {
 
+		gmac0: eth@f0802000 {
+			phy-mode = "rgmii-id";
+			snps,eee-force-disable;
+			status = "okay";
+		};
+
+		emc0: eth@f0825000 {
+			phy-mode = "rmii";
+			use-ncsi;
+			status = "okay";
+		};
+
+		ehci1: usb@f0806000 {
+			status = "okay";
+		};
+
+		ohci1: ohci@f0807000 {
+			status = "okay";
+		};
+
+		udc0:udc@f0830000 {
+			status = "okay";
+		};
+
+		udc1:udc@f0831000 {
+			status = "okay";
+		};
+
+		udc2:udc@f0832000 {
+			status = "okay";
+		};
+
+		udc3:udc@f0833000 {
+			status = "okay";
+		};
+
+		udc4:udc@f0834000 {
+			status = "okay";
+		};
+
+		udc5:udc@f0835000 {
+			status = "okay";
+		};
+
+		udc6:udc@f0836000 {
+			status = "okay";
+		};
+
+		udc7:udc@f0837000 {
+			status = "okay";
+		};
+
+		udc8:udc@f0838000 {
+			status = "okay";
+		};
+
+		udc9:udc@f0839000 {
+			status = "okay";
+		};
+
+		aes:aes@f0858000 {
+			status = "okay";
+		};
+
+		sha:sha@f085a000 {
+			status = "okay";
+		};
+
+		fiu0: fiu@fb000000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&spi0cs1_pins>;
+			status = "okay";
+			spi-nor@0 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0>;
+				spi-rx-bus-width = <2>;
+				partitions@80000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					bmc@0{
+						label = "bmc";
+						reg = <0x000000 0x2000000>;
+					};
+					u-boot@0 {
+						label = "u-boot";
+						read-only;
+						reg = <0x0000000 0x80000>;
+					};
+					u-boot-env@100000 {
+						label = "u-boot-env";
+						reg = <0x00100000 0x40000>;
+					};
+					kernel@200000 {
+						label = "kernel";
+						reg = <0x0200000 0x600000>;
+					};
+					rofs@800000 {
+						label = "rofs";
+						reg = <0x0800000 0x1500000>;
+					};
+					rwfs@1d00000 {
+						label = "rwfs";
+						reg = <0x1d00000 0x300000>;
+					};
+				};
+			};
+			spi-nor@1 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <1>;
+				npcm,fiu-rx-bus-width = <2>;
+				partitions@88000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					spare1@0 {
+						label = "spi0-cs1-spare1";
+						reg = <0x0 0x800000>;
+					};
+					spare2@800000 {
+						label = "spi0-cs1-spare2";
+						reg = <0x800000 0x0>;
+					};
+				};
+			};
+		};
+
+		fiu3: fiu@c0000000 {
+			pinctrl-0 = <&spi3_pins>;
+			status = "okay";
+			spi-nor@0 {
+				compatible = "jedec,spi-nor";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0>;
+				spi-rx-bus-width = <2>;
+				partitions@A0000000 {
+					compatible = "fixed-partitions";
+					#address-cells = <1>;
+					#size-cells = <1>;
+					system1@0 {
+						label = "spi3-system1";
+						reg = <0x0 0x800000>;
+					};
+					system2@800000 {
+						label = "spi3-system2";
+						reg = <0x800000 0x0>;
+					};
+				};
+			};
+		};
+
+		sdhci0: sdhci@f0842000 {
+			status = "okay";
+		};
+
+		pcimbox: pcimbox@f0848000 {
+			status = "okay";
+		};
+
+		vcd: vcd@f0810000 {
+			status = "okay";
+		};
+
+		ece: ece@f0820000 {
+			status = "okay";
+		};
+
 		apb {
 
 			watchdog1: watchdog@901C {
 				status = "okay";
 			};
 
+			rng: rng@b000 {
+				status = "okay";
+			};
+
 			serial0: serial@1000 {
 				status = "okay";
 			};
@@ -47,6 +247,54 @@
 			serial3: serial@4000 {
 				status = "okay";
 			};
+
+			adc: adc@c000 {
+				status = "okay";
+			};
+
+			otp:otp@189000 {
+				status = "okay";
+			};
+
+			lpc_kcs: lpc_kcs@7000 {
+				kcs1: kcs1@0 {
+					status = "okay";
+				};
+
+				kcs2: kcs2@0 {
+					status = "okay";
+				};
+
+				kcs3: kcs3@0 {
+					status = "okay";
+				};
+			};
+
+			lpc_host: lpc_host@7000 {
+				lpc_bpc: lpc_bpc@40 {
+					monitor-ports = <0x80>;
+					status = "okay";
+				};
+			};
+
+			spi0: spi@200000 {
+				cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
+				status = "okay";
+			};
+
+			spi1: spi@201000 {
+				status = "okay";
+			};
 		};
 	};
 };
+
+&gcr {
+	serial_port_mux: mux-controller {
+	compatible = "mmio-mux";
+	#mux-control-cells = <1>;
+
+	mux-reg-masks = <0x38 0x07>;
+	idle-states = <6>;
+	};
+};
-- 
2.20.1

