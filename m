Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE9C3FFB11
	for <lists+openbmc@lfdr.de>; Fri,  3 Sep 2021 09:29:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H18Yq38rdz2yQH
	for <lists+openbmc@lfdr.de>; Fri,  3 Sep 2021 17:29:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BTluj9wB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BTluj9wB; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H18X03Czmz2yK4
 for <openbmc@lists.ozlabs.org>; Fri,  3 Sep 2021 17:27:44 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 8so4729541pga.7
 for <openbmc@lists.ozlabs.org>; Fri, 03 Sep 2021 00:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=13c32CVZExqlyBCuXlCiKmSwYBsqzhViG5keMj4Ljec=;
 b=BTluj9wBbSzJaU7S4Dgu5cf9cA+iHTC2/NKY/9DKsUUA8zLZijmwS5bn1Bhg0oboef
 YFRhww+TBJUDDGh7eIDlnKwFvfP8YCVFKHDe0oRryThzdD2jTr/6l6I2NH0voI4Aqwrs
 5Bq2+3EO4UxSmVBRuH1GoX9Q0YeIBEkdsOxPwYscPw+tGfANJDdHUEnt87IKH0NGP2Ln
 P97azlxiRcV2FLFntdKZoPidMfgrQAn/RYVyiHNa1mBqLVmuouH82XGdrW0cQjyhTxQB
 61+GrYeS9TwIdLOK4ZLU3hcF2krCRpe/mrtI5N4INwbaAVTUxq+47Vi7z+G9NoHFGph2
 822w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=13c32CVZExqlyBCuXlCiKmSwYBsqzhViG5keMj4Ljec=;
 b=eDnbFE9weeeVz8DYZJifgV1d4J7NjSsh4hy6Oh7bM5hSP2KItfm7fdqWVpJvIyulmT
 AJjPOBbOQc12nYnw4M7GljMRZ2oZBy4HlSozikHbf7/0Ktwua8tSqqEczQj2P2ckk3oz
 UjPxHB/WRxMPt6Rebi5afParEcoo0BakaluBqTC+8/inPrVcPyv+s5dNr1A791ZVMIqR
 lFwhIVALYuJYSa6ohCISQmZP9JxhkM5A9weHZK2GLl/jC4hnk+l1Z5GpIJmLAYcr66vj
 Id8NVPEikUiD4r5NGP7fQLkvxofGrCNvAGNbymp0WBJwJeJEvsp44orknvY8AXPH1UnK
 DrGA==
X-Gm-Message-State: AOAM531UlZguMynIXFaPDt+VIIEBHuyffIddftlW3k3hi4ZslxstA1ho
 k+aPy+lsTDq0ujkvLXs6qtFeeoJZDpc=
X-Google-Smtp-Source: ABdhPJw07OEmGQMs/PiAI80YyEz1tV8VTEtVinjUK+dBoVBhXkrLsB8GV4klJPprQdCRzjUI95dBVQ==
X-Received: by 2002:a63:4c1f:: with SMTP id z31mr2408770pga.50.1630654061649; 
 Fri, 03 Sep 2021 00:27:41 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id y9sm4395413pfc.193.2021.09.03.00.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 00:27:40 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [RESEND linux dev-5.10 2/2] ARM: dts: aspeed: everest: Add I2C bus 15
 muxes
Date: Fri,  3 Sep 2021 16:57:24 +0930
Message-Id: <20210903072724.316336-3-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903072724.316336-1-joel@jms.id.au>
References: <20210903072724.316336-1-joel@jms.id.au>
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Eddie James <eajames@linux.ibm.com>

Add the muxes that are attached on I2C bus 15.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 158 +++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 3f3d18289416..91242983a7b2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -96,6 +96,18 @@ aliases {
 		i2c32 = &i2c14mux1chn1;
 		i2c33 = &i2c14mux1chn2;
 		i2c34 = &i2c14mux1chn3;
+		i2c35 = &i2c15mux0chn0;
+		i2c36 = &i2c15mux0chn1;
+		i2c37 = &i2c15mux0chn2;
+		i2c38 = &i2c15mux0chn3;
+		i2c39 = &i2c15mux1chn0;
+		i2c40 = &i2c15mux1chn1;
+		i2c41 = &i2c15mux1chn2;
+		i2c42 = &i2c15mux1chn3;
+		i2c43 = &i2c15mux2chn0;
+		i2c44 = &i2c15mux2chn1;
+		i2c45 = &i2c15mux2chn2;
+		i2c46 = &i2c15mux2chn3;
 
 		serial4 = &uart5;
 
@@ -2817,6 +2829,152 @@ eeprom@50 {
 
 &i2c15 {
 	status = "okay";
+
+	i2c-switch@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c15mux0chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c15mux0chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c15mux0chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c15mux0chn3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+	};
+
+	i2c-switch@71 {
+		compatible = "nxp,pca9546";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c15mux1chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c15mux1chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c15mux1chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c15mux1chn3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+	};
+
+	i2c-switch@72 {
+		compatible = "nxp,pca9546";
+		reg = <0x72>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c15mux2chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c15mux2chn1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			eeprom@50 {
+				compatible = "atmel,24c64";
+				reg = <0x50>;
+			};
+		};
+
+		i2c15mux2chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c15mux2chn3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
 };
 
 &ehci1 {
-- 
2.33.0

