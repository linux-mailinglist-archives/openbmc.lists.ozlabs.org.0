Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD947A78562
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 01:56:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZS4fK4HVpz3c8w
	for <lists+openbmc@lfdr.de>; Wed,  2 Apr 2025 10:56:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743551798;
	cv=none; b=QqcuXFRLA/h975jyaIcvx7qJsBfA9/4BwUtI6UzwL5NkXabx1gWdcj+k+H7INkyZX634cqjE6wiEyEGSK1Vq1idPIuB1pSKXSUaz66viY6oVXvCXRJiBxnArEysot9Ord0WcKKIQZxLimRWznfu6wTYXelfwX4IB1o1NY+JJVQq3qQGNX8MixulTrGz2v2aJj6BvQ40zLE+6WF7dqWasV0VYcBfiGGPBPLEaKNSreuRGPSH6lv+sq23hpWz29z8yh/GzBTVqItUVV0EJccOBJU44I87laHq+Sm0HYkVz6A+qu3Xtu0qtEHGounsUU9xmf7Z2+aMuBoOGlIRvwhUeUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743551798; c=relaxed/relaxed;
	bh=b6ihHnN8ilmRZM8hNAaeCWLomeBOtyWBXorZNgeS24M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OUHID/FNQc3kATJXyzZV2LLY4M5IclBtCXXpEbiImYbMZttcjJrsKH6pL+F82DPLADgYJxeffufzZ7t34G81/gg6ipDBhUMfX3ciADQ/WiSP4kwGQ+lNcjn/6yUFdT5DeCkjRvgakuUGTSrUrve0TCeVUZV4TNi+Sfr4tn9eeyFkx7yGxy3LuGEOdLwozGMyQFz6DDFOMsJ1RxfsopNaT72TUChCCLS0mWXzQauDudsrgwq55QdCwwXtS0PrTzbpxV2YcO6aRTn0IrYuNFPs501Uerp7Y1PwFeYG7+GYOweaxnd40kM6SLwmk0Jj3oI14IloKjlr4nm5oHOwLMl8uQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=xU9sI9BL; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=xU9sI9BL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZS4fF12jyz2yYf
	for <openbmc@lists.ozlabs.org>; Wed,  2 Apr 2025 10:56:36 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-223fb0f619dso116205935ad.1
        for <openbmc@lists.ozlabs.org>; Tue, 01 Apr 2025 16:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743551794; x=1744156594; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6ihHnN8ilmRZM8hNAaeCWLomeBOtyWBXorZNgeS24M=;
        b=xU9sI9BL2jS5Qg4uY7nDM18vahXZyT9CBMyptYIhqi3RPaQu8iWkaG2onRWeWKBt14
         pkAMPzJkqPiHlFEF1VqVEjdeBsQN9kv+1a+DR3+2GcbiPOQtpYVYCvEN/foy7c8X0yTv
         2HHp7AbHPkQGJhR9XFgmrRQY1fzUYc/8yGfoPlb1soHoKrrNK7Gko8DjwWUMgbWgu4Dw
         IerB5R51gM1ShdG1GOD1pUXlw8FEFwN+eFAUr53V4+ysYvswgjR64sCnfoo81+0FzA0L
         nzHiD0daRq5E6JpcgAvkrOp8HTAmqfu26dQX7GBxx64cjQYgi+W9OdYnVv69SJKf7J7e
         jZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743551794; x=1744156594;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6ihHnN8ilmRZM8hNAaeCWLomeBOtyWBXorZNgeS24M=;
        b=o1UY6c9t0+xU4RBzJNiDPzfQP7LC4KqSslOfTb+CoDkZDzJr1+LB+rjuDttpFLTwh1
         mRXXlOiBbI0+PAa/1utrs7tI/jeGTaZliX2PMTWC5I3K9QJs0HFEVB5pNfnkBvskeM1G
         UHZPi12v2lyG8l7GXbOOoeRPDsu9WTnyklW4Vhl5MKByAS5wtYQ5Kt0FDUFX8/QAnO2e
         77CQnCiI4bej9+wVWM85iqfTU0FZWdccyI6mOszImvxCSFm13SJxS9advzZPdz2R2UfW
         iaPaINv0qyZq1H+21wmrN+taMX/MCewVYbLgipUMvPoO+g6G+yXbLzEfnh/Z6pbVpwhj
         kOJw==
X-Forwarded-Encrypted: i=1; AJvYcCXuH3C31v7VDR9HiapRHarY8tPI0MzwAE6JbVaZiMbrQcYRkCCGBFnO7vqGAJFd5nTbdbPgVIlR@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxd4c0FsCwMGckYCXYo4mm87fwKNV2grdEF+CArFYxZ346lixIf
	Ru5cFBFaR0Oyth/p9FGdTdMwBwXZulNuohi1fvja+KtcQOUrKj1/0azazcjbaQc=
X-Gm-Gg: ASbGncs6buHe+3HY+MnlPqMsmMhBRNSdTIEb9DZa09hIijSdJEEKitMQs3At903Us00
	1n1sncIsVJQt/+LUvs+N6swYwe8vSDzCaMzqSn8czyKnYyQob6S43ofHllHd3d+2oNsGUefR8rG
	o2RM/i/0LgME5yN9Oj63XuLukBid/xLqwL/nCnbwZl6yiDky1EIpw/Wg0OxXOCKLDO90lipuh3b
	voFr/mQ96Uib68iAopxokRs8JkWmlhXsfPRs/bIwVplX93aLNUFPeFD2cJYFNh5WdpZf2duUpTI
	bq36w5+AbbKJs3e0z4QjJcD5bHpLd+393FYLh6JwPCdgREe/JNRcRmusNaZ7peboZpwifi1ePr1
	v32BKY0QU23azp5kvXzGLH2174H6Kdms=
X-Google-Smtp-Source: AGHT+IFylzDbhBQ/sL2ExeIt5kLtcQJnLm0bfmikXo5VViRiVMSH4IaRuk3kFMVNKPfBS80Y7hZfgQ==
X-Received: by 2002:a05:6a00:1486:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-739b611955fmr5416229b3a.21.1743551794244;
        Tue, 01 Apr 2025 16:56:34 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:895:611e:1a61:85c1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970def428sm9646836b3a.32.2025.04.01.16.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 16:56:33 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2] ARM: dts: nuvoton: Add UDC nodes
Date: Tue,  1 Apr 2025 16:56:30 -0700
Message-ID: <20250401235630.3220150-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Reply-To: 20240925093956.2449119-1-william@wkennington.com
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, "William A. Kennington III" <william@wkennington.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The driver support was already added but we are missing the nodes in our
common devicetree.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
V1 -> V2: Fix udc -> udc nodenames, fix reg values for npcm750

 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   | 71 +++++++++++++++++++
 .../arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi | 65 +++++++++++++++++
 2 files changed, 136 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 5a466e97955a..e337f40ae0f2 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -99,6 +99,11 @@ rst: rst@801000 {
 		};
 	};
 
+	udc0_phy: usb-phy {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+	};
+
 	ahb {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -193,6 +198,72 @@ fiux: spi@fb001000 {
 			status = "disabled";
 		};
 
+		udc5: usb@f0835000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0835000 0x1000
+			       0xfffd2800 0x800>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc6: usb@f0836000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0836000 0x1000
+			       0xfffd3000 0x800>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc7: usb@f0837000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0837000 0x1000
+			       0xfffd3800 0x800>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc8: usb@f0838000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0838000 0x1000
+			       0xfffd4000 0x800>;
+			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc9: usb@f0839000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0839000 0x1000
+			       0xfffd4800 0x800>;
+			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			nuvoton,sysgcr = <&gcr>;
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi
index 30eed40b89b5..f42ad259636c 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi
@@ -58,5 +58,70 @@ gmac1: eth@f0804000 {
 					&rg2mdio_pins>;
 			status = "disabled";
 		};
+
+		udc0: usb@f0830000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0830000 0x1000
+			       0xfffd0000 0x800>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc1: usb@f0831000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0831000 0x1000
+			       0xfffd0800 0x800>;
+			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc2: usb@f0832000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0832000 0x1000
+			       0xfffd1000 0x800>;
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc3: usb@f0833000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0833000 0x1000
+			       0xfffd1800 0x800>;
+			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc4: usb@f0834000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0834000 0x1000
+			       0xfffd2000 0x800>;
+			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
 	};
 };
-- 
2.49.0.472.ge94155a9ec-goog

