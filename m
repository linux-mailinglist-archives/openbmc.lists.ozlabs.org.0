Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 443CBA26899
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 01:32:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yn47f0KnRz3dVC
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 11:32:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1032"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738561435;
	cv=none; b=KVf3epSGuEpnAeq/8IfY2xG74B8JkGmirGMnuq0sOOLpuJ3zCHw4BjTzkJCwJFvQAlntU8+CH6a3Rc6u0xw+4SZmBWaqI00+q0Qzkd2jYGnX3Rgh6CgEcOOHiS3VV0lOECUN6wDu/uLAIqy/0CbCo8d50TKyUHgW2n8Jh1KcZN6LXgxrdKE78UOc9jCvYxeAAzGE460+XUNWL25Zo6nVEWuinsoQUYKOKumxedJufRmcQfsBLdro/n21Jy2/1rHWLpdQ4s9000m3TsV5c5BijTlW3zqFVi83asdQ5rGzKpy2UJhSfQyrLBaFjN44ViP7KagMaXItke/pCukG5/fm4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738561435; c=relaxed/relaxed;
	bh=31XzgfEM+1LFHGxho2u9u4JYE7XQW6zgDynf3Dbgkps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VcuoUMYn9itV7/X3q067plihkqHBpMXfDzYCUiiXyZHqK8JJ0FiSOOGwW+wjLbCV9CQkBaFc1JSrmmnyzvnOd5EwE+4xL9DHEc3aXZPlxvH90+KP9f5Ffuh4n6jLtAcZOzK1GBWlIb3HqLX9ibqMHnVJJBi2NDSHJF7JPrBf0M8+ggJPMVAQqDah1lh7b0Eh07f16mznR7IEdpGcX0BVu2DP5/xOw3Dtei0nSLgH1RlnF/kRNUT21g/45+kcF3agmuOW/7cY6xkQeC5zAoJ+AGyqFTrLVaIw2fNK4L/vZ+jKvRl8DfSCdS5D9yQtdi9eJjRwwjo45RtkSfGPikt6OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WAzap+1d; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WAzap+1d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ymb5k3ZQJz2xVq
	for <openbmc@lists.ozlabs.org>; Mon,  3 Feb 2025 16:43:54 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2f44353649aso5047014a91.0
        for <openbmc@lists.ozlabs.org>; Sun, 02 Feb 2025 21:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738561432; x=1739166232; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31XzgfEM+1LFHGxho2u9u4JYE7XQW6zgDynf3Dbgkps=;
        b=WAzap+1dbvb9NJzvm56XAKg9oy2PqMF7NTRbXH0eby3Ur67FGRzb6lO6Z4u956GpNH
         X+wFqlOgTO16H9OILLpeCbL7gstB73wqUnoYDhyEuggZrPNbDcO4DLRp1AnPtsuMCDd6
         9dTvlbCWOK4US4GfMa75TOQ6+9QLR1eMm2BaSO7jyYtmfGRa9tFghQeZxi4c/UTLv1cd
         lghT1ioPTmspFqNyolYxmLpKaGUMScx5ha+xFeuqQZ/xzzwT29dNBM9cpmJEU/FwF2aL
         aX8GWZpv5sq1LDaZllhVas9Ml0WRLRwG2my4F6+XbcsRSHncC7v2mekhxD4ekVU6lO/v
         IrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738561432; x=1739166232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31XzgfEM+1LFHGxho2u9u4JYE7XQW6zgDynf3Dbgkps=;
        b=E1GzieSms04WDYIoGkFv72JkJWNIwTIfVkG2RgNycvQPo9kTDQn2z6QK4//VhIvenH
         c4KCr2UtORfSBru/0CAtu1Dnz6oseLVzFoiKKje0xiUJ552grR6HXNWcgnpPz6Is/FQa
         z3FX7DpIuPd1Nl3qvle6CvvdakBRt0H6iZ+U5KIl0NXS4jphUnK/cSlgkSunSoAOwjK5
         LcMaH+3/bVp7SemAWJBTL+oXel+Vnwdv1rNY89xVZi+8ymdZMwmko8C8pmn4qwa4qHOz
         Ok/qVjghAzoyH9jBwch2x8gGJZE7YaBIMT31w9y3OAdBgzEZ9Y9pcNYcPf9Hj5Qz0Pn7
         y+/A==
X-Forwarded-Encrypted: i=1; AJvYcCUUuuuOLvB7Q26CJ2urNOGPfbLACmj+cotBEm/n3oUnF5e5+KVatjsNFpo9G0I/ih0vL6lz1Z51@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyCeXEBLvhJyIhMJtUWX9CnD+lEDQ0OA14bpe73uJf7JzWgopaL
	t/SJea+oZKM7RalPofqvbP5WOXXSGnjbiUgoQk8Ass7odwA+m2y8
X-Gm-Gg: ASbGncueV49Py+ylzyajEUHrj+bvUOeQSU0hStbR9CDj0J5tXr04fLc1nuA6ckIHpl6
	lyY3lq02nBQYQICZENy3uDbQN9Vxjii7M7SJRkQORRJ88sEXZoQ6yhmNtPRfGoGeY4Zs2M1lyHG
	tCClCjwdZHbQkkxBW7kMqEtTCQL17A9lJ5dbM5iEDsjdOuVJmKDKePd7uOeymkoYSCnYbsO3hOx
	NSFjMfIILDk32TPhx4yCpW2y+fhMD/5M+u8YCY9nolYJ40I1XoQapIA03sKjEe/oKBAwhs3/nIv
	geAwaF1s29n/kw1e8cwRx3ZFwTInnFI/+pCdTsL+8ATSbLySXGHEqe6b
X-Google-Smtp-Source: AGHT+IEebl6qnAhUV7DcuC2+Gaci6mLgBlvTtBDmEY8dNeLsOpTRgjxFkU8HCj/XYZqe5f2xfVUW6w==
X-Received: by 2002:a17:90b:3a4b:b0:2ee:bbd8:2b9d with SMTP id 98e67ed59e1d1-2f83ac87b59mr25632915a91.34.1738561432261;
        Sun, 02 Feb 2025 21:43:52 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5fesm66894555ad.132.2025.02.02.21.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 21:43:52 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Subject: [PATCH net-next v8 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Mon,  3 Feb 2025 13:41:59 +0800
Message-Id: <20250203054200.21977-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203054200.21977-1-a0987203069@gmail.com>
References: <20250203054200.21977-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 04 Feb 2025 11:32:08 +1100
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
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com, schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add GMAC nodes for our MA35D1 development boards:
two RGMII interfaces for SOM board, and one RGMII
and one RMII interface for IoT board.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 12 +++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 10 ++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 54 +++++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 9482bec1aa57..5cc712ae92d8 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial13 = &uart13;
 		serial14 = &uart14;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
@@ -126,3 +128,13 @@ &uart14 {
 	pinctrl-0 = <&pinctrl_uart14>;
 	status = "okay";
 };
+
+&gmac0 {
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&gmac1 {
+	phy-mode = "rmii";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..1d9ac350a1f1 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial14 = &uart14;
 		serial16 = &uart16;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
@@ -129,3 +131,11 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+};
+
+&gmac1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..89712e262ee6 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,59 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
 		};
+
+		gmac0: ethernet@40120000 {
+			compatible = "nuvoton,ma35d1-dwmac";
+			reg = <0x0 0x40120000 0x0 0x10000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 0>;
+			resets = <&sys MA35D1_RESET_GMAC0>;
+			reset-names = "stmmaceth";
+
+			phy-mode = "rgmii-id";
+			phy-handle = <&eth_phy0>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eth_phy0: ethernet-phy@0 {
+					reg = <0>;
+				};
+			};
+		};
+
+		gmac1: ethernet@40130000 {
+			compatible = "nuvoton,ma35d1-dwmac";
+			reg = <0x0 0x40130000 0x0 0x10000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 1>;
+			resets = <&sys MA35D1_RESET_GMAC1>;
+			reset-names = "stmmaceth";
+
+			phy-mode = "rgmii-id";
+			phy-handle = <&eth_phy1>;
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eth_phy1: ethernet-phy@1 {
+					reg = <1>;
+				};
+			};
+		};
 	};
 };
-- 
2.34.1

