Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC93211625
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 00:35:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xwyv1GsrzDqjQ
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 08:35:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SNPxLiNE; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xwxk1HLzzDqjQ;
 Thu,  2 Jul 2020 08:34:01 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id h22so11627887pjf.1;
 Wed, 01 Jul 2020 15:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=uIpGHFpv7+1c3lMIAq2yzr7GzCMkTNuLf0hseqYU+Qg=;
 b=SNPxLiNEwpescEVCw35Np5ndbskC1I+ESD/40t6YOl868UIHURbhuCH4/ipG3Jfynq
 GYhIGTAV13WETY1MmCqRMt5Nr/Hy8qFTWe3FfH4T4rE4riifyiWZqXUMj9pJtqqkVCSj
 a1ZIcMqup79oX+OxqJ5gTyvBDukniGyqk7uoqzR89xRj2OAqAuXkxy56FRpH2E8SRYmE
 NbgVCYQOPxHEIOScAXWPztrUaJM+xIQmB7FpOoRhopbAnlRa3A2YrdqESioCpp3cwAY3
 JNRjOXXEeNot9BMBlr4wV1hMhQIJBf62jYrup1IwEIMbmNlb53Qgw0KXO8rc3GF7pMLy
 bfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uIpGHFpv7+1c3lMIAq2yzr7GzCMkTNuLf0hseqYU+Qg=;
 b=OtZcuXnWKob1AHpm5/hfJ1qLtDER8dpAMa4wPT4s4WDDAO183q6/T2tEMvFWQdJk9u
 TV7PR6UpfcG8XFI1XtYh0E+8IoIaiGjwUI5U5OkjPKYmQoeiRkGWjjZHZnBQRN+1pFLL
 gboZ6GTAoVlIik3+rnbESC/d1tQAxGoT1hvjUo7fufCJimupyWeMNEOtdUbc5e+2Skbu
 JE+1XK9zu028csHPnZ2PctX4kK3GVrb7cj8hkG5mL4rCJ+x+U/rxoFd7ebSL0ZlC1ZJ+
 c1ytgSh0GCcuDJYPl4cz1xM3FI/qKY9bTKmsb2Q4eCrbaSyaA7cFpLEXr8TOK5AnKaGQ
 cBlg==
X-Gm-Message-State: AOAM531Lq5q7yXYrWq/WElTYPoUDl+u3LFm+k3n7V9M9AQK9zawM0gwP
 MWjJgt2CFlPunUB7oo19mO8=
X-Google-Smtp-Source: ABdhPJxVSrLOIMSuB1DIGYHJGGnRtZpmypjoJNSavjX3rsTcDLVP1cgQ65ETBsQD4KtJ5cWreMtd/w==
X-Received: by 2002:a17:90a:ef17:: with SMTP id
 k23mr27476229pjz.45.1593642837753; 
 Wed, 01 Jul 2020 15:33:57 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id o1sm7314462pfu.70.2020.07.01.15.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 15:33:57 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH] ARM: dts: aspeed: cmm: fixup i2c tree
Date: Wed,  1 Jul 2020 15:33:47 -0700
Message-Id: <20200701223347.31717-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
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

Create all the i2c switches in device tree and use aliases to assign
child channels with consistent bus numbers.

Besides, "i2c-mux-idle-disconnect" is set for all the i2c switches to
avoid potential conflicts when multiple devices (beind the switches)
use the same device address.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts | 1231 ++++++++++++++++-
 1 file changed, 1228 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
index 016bbcb99bb6..7bc7df7ed428 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
@@ -19,8 +19,8 @@
 		serial3 = &uart4;
 
 		/*
-		 * Hardcode the bus number of i2c switches' channels to
-		 * avoid breaking the legacy applications.
+		 * PCA9548 (1-0077) provides 8 channels for connecting to
+		 * 4 Line Cards and 4 Fabric Cards.
 		 */
 		i2c16 = &imux16;
 		i2c17 = &imux17;
@@ -30,6 +30,11 @@
 		i2c21 = &imux21;
 		i2c22 = &imux22;
 		i2c23 = &imux23;
+
+		/*
+		 * PCA9548 (2-0071) provides 8 channels for connecting to
+		 * Power Distribution Board.
+		 */
 		i2c24 = &imux24;
 		i2c25 = &imux25;
 		i2c26 = &imux26;
@@ -38,6 +43,11 @@
 		i2c29 = &imux29;
 		i2c30 = &imux30;
 		i2c31 = &imux31;
+
+		/*
+		 * PCA9548 (8-0077) provides 8 channels and the first 4
+		 * channels are connecting to 4 Fan Control Boards.
+		 */
 		i2c32 = &imux32;
 		i2c33 = &imux33;
 		i2c34 = &imux34;
@@ -46,6 +56,226 @@
 		i2c37 = &imux37;
 		i2c38 = &imux38;
 		i2c39 = &imux39;
+
+		/*
+		 * 2 PCA9548 (18-0070 & 18-0073), 16 channels connecting
+		 * to Line Card #1.
+		 */
+		i2c40 = &imux40;
+		i2c41 = &imux41;
+		i2c42 = &imux42;
+		i2c43 = &imux43;
+		i2c44 = &imux44;
+		i2c45 = &imux45;
+		i2c46 = &imux46;
+		i2c47 = &imux47;
+		i2c48 = &imux48;
+		i2c49 = &imux49;
+		i2c50 = &imux50;
+		i2c51 = &imux51;
+		i2c52 = &imux52;
+		i2c53 = &imux53;
+		i2c54 = &imux54;
+		i2c55 = &imux55;
+
+		/*
+		 * 2 PCA9548 (19-0070 & 19-0073), 16 channels connecting
+		 * to Line Card #2.
+		 */
+		i2c56 = &imux56;
+		i2c57 = &imux57;
+		i2c58 = &imux58;
+		i2c59 = &imux59;
+		i2c60 = &imux60;
+		i2c61 = &imux61;
+		i2c62 = &imux62;
+		i2c63 = &imux63;
+		i2c64 = &imux64;
+		i2c65 = &imux65;
+		i2c66 = &imux66;
+		i2c67 = &imux67;
+		i2c68 = &imux68;
+		i2c69 = &imux69;
+		i2c70 = &imux70;
+		i2c71 = &imux71;
+
+		/*
+		 * 2 PCA9548 (20-0070 & 20-0073), 16 channels connecting
+		 * to Line Card #3.
+		 */
+		i2c72 = &imux72;
+		i2c73 = &imux73;
+		i2c74 = &imux74;
+		i2c75 = &imux75;
+		i2c76 = &imux76;
+		i2c77 = &imux77;
+		i2c78 = &imux78;
+		i2c79 = &imux79;
+		i2c80 = &imux80;
+		i2c81 = &imux81;
+		i2c82 = &imux82;
+		i2c83 = &imux83;
+		i2c84 = &imux84;
+		i2c85 = &imux85;
+		i2c86 = &imux86;
+		i2c87 = &imux87;
+
+		/*
+		 * 2 PCA9548 (21-0070 & 21-0073), 16 channels connecting
+		 * to Line Card #4.
+		 */
+		i2c88 = &imux88;
+		i2c89 = &imux89;
+		i2c90 = &imux90;
+		i2c91 = &imux91;
+		i2c92 = &imux92;
+		i2c93 = &imux93;
+		i2c94 = &imux94;
+		i2c95 = &imux95;
+		i2c96 = &imux96;
+		i2c97 = &imux97;
+		i2c98 = &imux98;
+		i2c99 = &imux99;
+		i2c100 = &imux100;
+		i2c101 = &imux101;
+		i2c102 = &imux102;
+		i2c103 = &imux103;
+
+		/*
+		 * 2 PCA9548 (16-0070 & 16-0073), 16 channels connecting
+		 * to Fabric Card #1.
+		 */
+		i2c104 = &imux104;
+		i2c105 = &imux105;
+		i2c106 = &imux106;
+		i2c107 = &imux107;
+		i2c108 = &imux108;
+		i2c109 = &imux109;
+		i2c110 = &imux110;
+		i2c111 = &imux111;
+		i2c112 = &imux112;
+		i2c113 = &imux113;
+		i2c114 = &imux114;
+		i2c115 = &imux115;
+		i2c116 = &imux116;
+		i2c117 = &imux117;
+		i2c118 = &imux118;
+		i2c119 = &imux119;
+
+		/*
+		 * 2 PCA9548 (17-0070 & 17-0073), 16 channels connecting
+		 * to Fabric Card #2.
+		 */
+		i2c120 = &imux120;
+		i2c121 = &imux121;
+		i2c122 = &imux122;
+		i2c123 = &imux123;
+		i2c124 = &imux124;
+		i2c125 = &imux125;
+		i2c126 = &imux126;
+		i2c127 = &imux127;
+		i2c128 = &imux128;
+		i2c129 = &imux129;
+		i2c130 = &imux130;
+		i2c131 = &imux131;
+		i2c132 = &imux132;
+		i2c133 = &imux133;
+		i2c134 = &imux134;
+		i2c135 = &imux135;
+
+		/*
+		 * 2 PCA9548 (22-0070 & 22-0073), 16 channels connecting
+		 * to Fabric Card #3.
+		 */
+		i2c136 = &imux136;
+		i2c137 = &imux137;
+		i2c138 = &imux138;
+		i2c139 = &imux139;
+		i2c140 = &imux140;
+		i2c141 = &imux141;
+		i2c142 = &imux142;
+		i2c143 = &imux143;
+		i2c144 = &imux144;
+		i2c145 = &imux145;
+		i2c146 = &imux146;
+		i2c147 = &imux147;
+		i2c148 = &imux148;
+		i2c149 = &imux149;
+		i2c150 = &imux150;
+		i2c151 = &imux151;
+
+		/*
+		 * 2 PCA9548 (23-0070 & 23-0073), 16 channels connecting
+		 * to Fabric Card #4.
+		 */
+		i2c152 = &imux152;
+		i2c153 = &imux153;
+		i2c154 = &imux154;
+		i2c155 = &imux155;
+		i2c156 = &imux156;
+		i2c157 = &imux157;
+		i2c158 = &imux158;
+		i2c159 = &imux159;
+		i2c160 = &imux160;
+		i2c161 = &imux161;
+		i2c162 = &imux162;
+		i2c163 = &imux163;
+		i2c164 = &imux164;
+		i2c165 = &imux165;
+		i2c166 = &imux166;
+		i2c167 = &imux167;
+
+		/*
+		 * PCA9548 (32-0070), 8 channels connecting to Fan Control
+		 # Board #1.
+		 */
+		i2c168 = &imux168;
+		i2c169 = &imux169;
+		i2c170 = &imux170;
+		i2c171 = &imux171;
+		i2c172 = &imux172;
+		i2c173 = &imux173;
+		i2c174 = &imux174;
+		i2c175 = &imux175;
+
+		/*
+		 * PCA9548 (33-0070), 8 channels connecting to Fan Control
+		 # Board #2.
+		 */
+		i2c176 = &imux176;
+		i2c177 = &imux177;
+		i2c178 = &imux178;
+		i2c179 = &imux179;
+		i2c180 = &imux180;
+		i2c181 = &imux181;
+		i2c182 = &imux182;
+		i2c183 = &imux183;
+
+		/*
+		 * PCA9548 (34-0070), 8 channels connecting to Fan Control
+		 # Board #3.
+		 */
+		i2c184 = &imux184;
+		i2c185 = &imux185;
+		i2c186 = &imux186;
+		i2c187 = &imux187;
+		i2c188 = &imux188;
+		i2c189 = &imux189;
+		i2c190 = &imux190;
+		i2c191 = &imux191;
+
+		/*
+		 * PCA9548 (35-0070), 8 channels connecting to Fan Control
+		 # Board #4.
+		 */
+		i2c192 = &imux192;
+		i2c193 = &imux193;
+		i2c194 = &imux194;
+		i2c195 = &imux195;
+		i2c196 = &imux196;
+		i2c197 = &imux197;
+		i2c198 = &imux198;
+		i2c199 = &imux199;
 	};
 
 	chosen {
@@ -103,53 +333,846 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x77>;
+		i2c-mux-idle-disconnect;
 
+		/* To Fabric Card #1 */
 		imux16: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+
+			i2c-switch@70 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x70>;
+				i2c-mux-idle-disconnect;
+
+				imux104: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux105: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux106: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux107: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux108: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux109: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux110: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux111: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+			i2c-switch@73 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x73>;
+				i2c-mux-idle-disconnect;
+
+				imux112: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux113: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux114: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux115: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux116: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux117: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux118: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux119: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
 		};
 
+		/* To Fabric Card #2 */
 		imux17: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+
+			i2c-switch@70 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x70>;
+				i2c-mux-idle-disconnect;
+
+				imux120: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux121: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux122: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux123: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux124: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux125: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux126: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux127: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+			i2c-switch@73 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x73>;
+				i2c-mux-idle-disconnect;
+
+				imux128: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux129: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux130: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux131: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux132: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux133: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux134: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux135: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
 		};
 
+		/* To Line Card #1 */
 		imux18: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+
+			i2c-switch@70 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x70>;
+				i2c-mux-idle-disconnect;
+
+				imux40: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux41: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux42: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux43: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux44: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux45: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux46: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux47: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+			i2c-switch@73 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x73>;
+				i2c-mux-idle-disconnect;
+
+				imux48: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux49: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux50: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux51: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux52: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux53: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux54: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux55: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
 		};
 
+		/* To Line Card #2 */
 		imux19: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
+
+			i2c-switch@70 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x70>;
+				i2c-mux-idle-disconnect;
+
+				imux56: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux57: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux58: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux59: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux60: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux61: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux62: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux63: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+			i2c-switch@73 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x73>;
+				i2c-mux-idle-disconnect;
+
+				imux64: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux65: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux66: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux67: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux68: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux69: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux70: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux71: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
 		};
 
+		/* To LC3 SCM */
 		imux20: i2c@4 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <4>;
+
+			i2c-switch@70 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x70>;
+				i2c-mux-idle-disconnect;
+
+				imux72: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux73: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux74: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux75: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux76: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux77: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux78: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux79: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+			i2c-switch@73 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x73>;
+				i2c-mux-idle-disconnect;
+
+				imux80: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux81: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux82: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux83: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux84: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux85: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux86: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux87: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
 		};
 
+		/* To Line Card #4 */
 		imux21: i2c@5 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <5>;
+
+			i2c-switch@70 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x70>;
+				i2c-mux-idle-disconnect;
+
+				imux88: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux89: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux90: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux91: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux92: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux93: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux94: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux95: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+			i2c-switch@73 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x73>;
+				i2c-mux-idle-disconnect;
+
+				imux96: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux97: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux98: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux99: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux100: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux101: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux102: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux103: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
 		};
 
+		/* To Fabric Card #3 */
 		imux22: i2c@6 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <6>;
+
+			i2c-switch@70 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x70>;
+				i2c-mux-idle-disconnect;
+
+				imux136: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux137: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux138: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux139: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux140: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux141: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux142: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux143: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+			i2c-switch@73 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x73>;
+				i2c-mux-idle-disconnect;
+
+				imux144: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux145: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux146: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux147: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux148: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux149: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux150: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux151: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
 		};
 
+		/* To Fabric Card #4 */
 		imux23: i2c@7 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <7>;
+
+			i2c-switch@70 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x70>;
+				i2c-mux-idle-disconnect;
+
+				imux152: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux153: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux154: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux155: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux156: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux157: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux158: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux159: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
+
+			i2c-switch@73 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x73>;
+				i2c-mux-idle-disconnect;
+
+				imux160: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux161: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux162: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux163: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux164: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux165: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux166: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux167: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
 		};
 	};
 };
@@ -165,6 +1188,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x71>;
+		i2c-mux-idle-disconnect;
 
 		imux24: i2c@0 {
 			#address-cells = <1>;
@@ -252,7 +1276,7 @@
 };
 
 /*
- * I2C bus to Fan Control Board.
+ * I2C bus to Fan Control Boards.
  */
 &i2c8 {
 	status = "okay";
@@ -262,29 +1286,230 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x77>;
+		i2c-mux-idle-disconnect;
 
+		/* To Fan Control Board #1 */
 		imux32: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+
+			i2c-switch@70 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x70>;
+				i2c-mux-idle-disconnect;
+
+				imux168: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux169: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux170: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux171: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux172: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux173: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux174: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux175: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
 		};
 
+		/* To Fan Control Board #2 */
 		imux33: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+
+			i2c-switch@70 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x70>;
+				i2c-mux-idle-disconnect;
+
+				imux176: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux177: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux178: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux179: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux180: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux181: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux182: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux183: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
 		};
 
+		/* To Fan Control Board #3 */
 		imux34: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+
+			i2c-switch@70 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x70>;
+				i2c-mux-idle-disconnect;
+
+				imux184: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux185: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux186: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux187: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux188: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux189: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux190: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux191: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
 		};
 
+		/* To Fan Control Board #4 */
 		imux35: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
+
+			i2c-switch@70 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x70>;
+				i2c-mux-idle-disconnect;
+
+				imux192: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+				};
+				imux193: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+				imux194: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <2>;
+				};
+				imux195: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <3>;
+				};
+				imux196: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+				};
+				imux197: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <5>;
+				};
+				imux198: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <6>;
+				};
+				imux199: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <7>;
+				};
+			};
 		};
 
 		imux36: i2c@4 {
-- 
2.17.1

