Return-Path: <openbmc+bounces-1243-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6FDD3BA5E
	for <lists+openbmc@lfdr.de>; Mon, 19 Jan 2026 23:06:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw4Kd5w1Pz30Pr;
	Tue, 20 Jan 2026 09:06:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768808039;
	cv=none; b=Rr5S9TVCgFqJ+fI3H2qq1F9VsHXcLK816oeyRyRR/wz4nG8QnGs7oFisyZq5q7LVMRoMtG82q8G0Zo8ozRe5X02qc6fWt3YEb5ORu50j6hvd1x4BlKjF582q8WlN1igBZXr5w2BUE2r1/QFn6xBSnX4/1C4eDSZn+Z0pamBMMY+oa+Y/r35VOa/n0SljImR3gvYossfxvRITcIOZ6WSxkVXca3fFFA1TdzBqXoiUkOAUERdRaMq7b2FA6JRqDU+RbfY0Py3baZCpd3yE2kFOYdIgGOmgnznShjA3hHKLlED9HlSLb1jt56s9OUPkfQWvdb8OMvmjhseXYfRcvSpfsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768808039; c=relaxed/relaxed;
	bh=hqveaJe53LxwbIM9SPax0uC9xDx3I0UHkG7RcVXnAnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Svop4gAFIGVGN8VKiovDS62wZJys9YT5ig3l0TwSzCj4cH8PoFySlqHVq9KUDgOI0JEklUTPyTaS+zejIo+mmwC6NdeBTKtwbeyOCVj8jfOp15GuoIOEMdgqHXQp/adO0j7Mqw0iNKPspB1GicsoiPit8LRutAbb81blopjVXutY0F4yJMLwryK8//SqFsD2OLXCmuTrlq6dhpnrqp6HjV5B4CtwEgJ565WPOnwb2xbqC6zTl4CWuHZdfyQRX2VRj58q/Iopwll+5tPJbOF6NAjdvMo01Z1KsS6s8cR7Hfefa6ZP8nXszK915ojnS0hxEr+4NUXMeXHIl2/o3sAYew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VKlR9DPZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VKlR9DPZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvhzB6BTbz2xHW
	for <openbmc@lists.ozlabs.org>; Mon, 19 Jan 2026 18:33:58 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a0834769f0so27333905ad.2
        for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 23:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768808037; x=1769412837; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqveaJe53LxwbIM9SPax0uC9xDx3I0UHkG7RcVXnAnw=;
        b=VKlR9DPZeUvf28lbrmykgVlcsfzSBU9xpQeZBc/IpDI/1QjiK52kQE4XD2N3HZQDDj
         Jl2HJ7uFRbtk2fMtXMx2980jtIi7hbJDxEDx/B7ohL224jfjJVwyHS8UNxSVQ2xa4ehP
         1oHDmHcRcRjUkENwGV84GKf7lVpWVeD1IalUVK8EGJql+xNiRdU7RAUz8Q+jkNaZyTj7
         voHCQF+N3hCyzPFoZ7dqKJTkhoOSReR7D2mUuPfowEu7LlgJZFqy2mrKyVlfpRy3RWag
         i+a3cx3XU+nL6kfb3aAtcOFPJbZlRpKeFBqHBPqJSuyDyGyRgV7gMtL7IorWxtSbFBNe
         yePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768808037; x=1769412837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hqveaJe53LxwbIM9SPax0uC9xDx3I0UHkG7RcVXnAnw=;
        b=RzTt4xXbOv8tTFhGpO8M5Sp+0tiQ9jYpS+fh+8RUQrTruKtnP2TTrv1uHQ5ZQcu292
         uByVmZqiu3fjv0R3ICLPRy1+PVpex3RFntXidUOdurjxsKV2k4w5WHck8IQe1GHMr1Ut
         TOdxWff1F5Rhnec7O9VaU7IjW/RAcEI09jHo2mQrdBX+MGEnAgICrL7SnrBalS1G2LiL
         h2vbbjy19OpGUt4m+M8pQsVqTui4aXf1IdvS1VBcRKrOxGJVi4wFjDmdNzZswi31LDvO
         siR2symAtjC2R2m/4IoKJi/NpH0a6hcbTX8SA7fAziu1FkJ8qvXPKk2UVnhsskiD3kXq
         KOgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWANqqVtsrmstxxtNUwv3uQQPTBCNNhzff+tm2DcI1zQE+txl7XVlN6mpCDBIKXxJ17EglYMG85@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzLCPFrYTl4QnMYuXJxrbDKd9mriaUksMQObd6tvkxVg9gbP1Es
	Y4R52Shrz5ysNQZ6OswZDlg7MWV0ZKB/BYeKMez78TPS/FORjaORMxLQ
X-Gm-Gg: AZuq6aKMojHZv2qXroLkG/oyQYnUxamKJLUpYOBqYE8gnhrbBOgJgv2nN6IjrAKe5xS
	o4oc8nVblQXOQ+pUF/n3+3jAC73+DIgc4p60GLB4eo6IfVS8w56hpV6o5Jo8EDiVZgrTlQpXnyB
	lav7UkS4qOT80OiVxvjNXvqwdCEJN+NlTTiD6IJKdp6fcjIBfrok+Pthy1bP4KfrdYtU2PWXbs/
	shQvxjI77bbSJvhtrrv5vjZvfnvuAYu5TEsnIeTm4uc2AqFLeJeE2PAVyT6quiu5hnnPfYSElef
	YxGhotqASstZVV3tiJhMVGT7bv00dQB2OUop9K5LGCb/wcRLlrjzgsIefDTgFV+O7huHFq9ThSH
	HA/dV0DlVqxCZEzlq35x98XBXiZxmobCBGcNpED2mJY4e7bHBKCtlxaeuqDfv0ey4oUc/s4i4Dw
	v21Ky2IGhYwRNh4kIjebyVncCzsf1/SnjoS/HTeiSNwtSFIS6rrqxrEkjV02M3CYIakRd826cg
X-Received: by 2002:a17:903:3b87:b0:29e:93be:fe50 with SMTP id d9443c01a7336-2a71891ace9mr83664425ad.42.1768808036852;
        Sun, 18 Jan 2026 23:33:56 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941e3cdsm84863325ad.100.2026.01.18.23.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 23:33:56 -0800 (PST)
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
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net-next v8 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Mon, 19 Jan 2026 15:33:40 +0800
Message-ID: <20260119073342.3132502-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119073342.3132502-1-a0987203069@gmail.com>
References: <20260119073342.3132502-1-a0987203069@gmail.com>
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
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add GMAC nodes for our MA35D1 development boards:
two RGMII interfaces for SOM board, and one RGMII
and one RMII interface for IoT board.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 12 +++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 10 ++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 54 +++++++++++++++++++
 3 files changed, 76 insertions(+)
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
old mode 100644
new mode 100755
index 9482bec1aa57..5cc712ae92d8
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
old mode 100644
new mode 100755
index f6f20a17e501..1d9ac350a1f1
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
old mode 100644
new mode 100755
index e51b98f5bdce..89712e262ee6
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
2.43.0


