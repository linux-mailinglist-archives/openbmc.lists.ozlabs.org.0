Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A46A664C5D9
	for <lists+openbmc@lfdr.de>; Wed, 14 Dec 2022 10:28:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NX95D3g5vz3bhJ
	for <lists+openbmc@lfdr.de>; Wed, 14 Dec 2022 20:28:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NNgZuapk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NNgZuapk;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NX94c4pjTz3bgr
	for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2022 20:27:27 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id k79so4019696pfd.7
        for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2022 01:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1v2Hnzs0/1OJywqxGltmBJ3aGPcFLQM/mVyL2AkPibQ=;
        b=NNgZuapkeFk7n59ulBy0O32WFNBp51TE995pPuOgE5QJLoqrWkOWVFtoV5scKn5e3Z
         xaqMVhVK0LxpFgCi5MaTO43wQhauSWct2uGbH9U6GmNajOh2Ks/eLc2eJ07xU428Laz8
         m+nbaGm5wOee7OvVfeSnJ+mCSiFTuOgUk0vZ2Y1+XBsfrD2KoX/+xdTx9T5UunowER3F
         IgB2mqs/186mc7EHSnxk1TcLtJcd8Gm4wk/jURQK+ytRyfFmRzvCcx9Z6OcnID3YlyQG
         U/9A/b2GmceDvWkgwbJkK8Zj8WhiHN9UyujlRmb2tFE0aRhjQAy3b7Ql6BujngFF0xCz
         gHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1v2Hnzs0/1OJywqxGltmBJ3aGPcFLQM/mVyL2AkPibQ=;
        b=OYunzpJQm7mrPUvgzkhbForxmYJB5wYiPbZ7SRov2eU1u3deRkrmXIj7BPawo7n5/D
         +SxY2BplXVXdQX9f05PSgA9DciixVkrGrZBONvJ+5Y+MgG8Q1d/GUH264bXjKUf7IyE+
         sryK9dfLjTxxsIuD8NJtuCUYEbmHgqhaLD45tPYbRgpxEyB/E3qLRvi68Co3Dk8erRjW
         YOeNnJKL4gu7bn8XFmJniskrw8llaQC1ZXXJxRFNB/Jsz9frtWo90kFZ/tlphVJS2I32
         KTEM3pRcZl7+yEedfi40YpQnFgX4U6RMI3sKaL0HUxCVLdTC5rFVFxFVVnUs8YAqbLW/
         V9nw==
X-Gm-Message-State: ANoB5pnauqwIJOf8utQy/kRmI75k/aBCPH44oFKnOwUm2OJXLfFnXuXl
	JyVWLCLL5HTJTfEuctIeL+c=
X-Google-Smtp-Source: AA0mqf5hhWMvTBEcxBKuAav1yFJesn4l75sw28A1sQknb8ihHWqlvJvBB5lLwUGOIS0SFCHTbQvbgQ==
X-Received: by 2002:aa7:9810:0:b0:577:1553:9241 with SMTP id e16-20020aa79810000000b0057715539241mr27771275pfl.17.1671010045184;
        Wed, 14 Dec 2022 01:27:25 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id t123-20020a628181000000b00576145a9bd0sm9003312pfd.127.2022.12.14.01.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 01:27:24 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v8 1/7] ARM: dts: nuvoton: Add node for NPCM VCD and ECE engine
Date: Wed, 14 Dec 2022 17:26:30 +0800
Message-Id: <20221214092636.810883-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221214092636.810883-1-milkfafa@gmail.com>
References: <20221214092636.810883-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kflin@nuvoton.com, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add node for Video Capture/Differentiation Engine (VCD) and Encoding
Compression Engine (ECE) present on Nuvoton NPCM SoCs. Tested with
Nuvoton NPCM750 evaluation board.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index c7b5ef15b716..78a309a56cd5 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -179,6 +179,24 @@ fiux: spi@fb001000 {
 			status = "disabled";
 		};
 
+		vcd: vcd@f0810000 {
+			compatible = "nuvoton,npcm750-vcd";
+			reg = <0xf0810000 0x10000>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_VCD>;
+			nuvoton,sysgcr = <&gcr>;
+			nuvoton,sysgfxi = <&gfxi>;
+			nuvoton,ece = <&ece>;
+			status = "disabled";
+		};
+
+		ece: ece@f0820000 {
+			compatible = "nuvoton,npcm750-ece";
+			reg = <0xf0820000 0x2000>;
+			resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_ECE>;
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -554,6 +572,11 @@ i2c15: i2c@8f000 {
 				pinctrl-0 = <&smb15_pins>;
 				status = "disabled";
 			};
+
+			gfxi: gfxi@e000 {
+				compatible = "nuvoton,npcm750-gfxi", "syscon";
+				reg = <0xe000 0x100>;
+			};
 		};
 	};
 
-- 
2.34.1

