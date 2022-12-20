Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B748F651DD5
	for <lists+openbmc@lfdr.de>; Tue, 20 Dec 2022 10:44:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nbs9l3xlnz3fBm
	for <lists+openbmc@lfdr.de>; Tue, 20 Dec 2022 20:44:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QlQ461LS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QlQ461LS;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nbs6L0fG0z3fDJ
	for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2022 20:41:45 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id c13so8126467pfp.5
        for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2022 01:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuPzabFK+ItSAS4Njr3Xe+weyJyvM5VjKuGON2TO41E=;
        b=QlQ461LSl6/nNSszRRAa8o2iBTd+KVoKQMlAbv1zirCUs18dDrBF0bVkg5GuGojPa8
         Wl+lQl1FRWh4B5wZvC6lCySbxJvQHUz7c2ETo7IEKfMtd80ei7mboyB7iA9T2+gY1iAj
         yA+/dqGMj0UaO0Tow+JjIqxULklWOc4fE7fWJOzdYkoKogOYBoH8Fxm3JeTgUzbgbaiP
         FXYVPPEcwsIwYMyColcLOVjM2sHHNeTnTbiyv7fVkME2BOCbq26hK9L7G8uRbp5J0OJL
         /Z6vdizVosObwxDnfkuCwxGJ8RsoiDzI3S1Q5CcqG8uha3ovmZC5UBmFG9atvdSYTjgr
         IVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuPzabFK+ItSAS4Njr3Xe+weyJyvM5VjKuGON2TO41E=;
        b=ybWtao1+o/iE/Z89v48g0RikI8jWqpsiXnY235uaWAKMb+U1OnH6cq2GoUFFQ1hZiC
         /Pb6oJKZhB5KN8rTPHT/lXB5w88Pi7OX41UT5JPHbcTLr+Jg8uaJIZ18r2ISuInFarXH
         KdPkZLOXHwjvRM7xh7ew149c4I0LCoMdsrBFF8q4DSIlX6Yc9Q5ixxY3o3qoEYkWl/4s
         gqqhQcjTG2MfHuzbDdI5dad+coFQExnM/9z/sEeWVKPqbMMfs85kvXyKz1M5viiaW8PS
         s5OfWM2Chbx/u6/nBZHlf/R4o8Mc+1dTy1fOFiBQCnW7igfQz4VzeyIn/tFjbH94QfnU
         vUTg==
X-Gm-Message-State: ANoB5pmVR+6jKTVkt1p5rTEtMxK2iy3PflMEgbl8HNyLMI5Hyf0ziNLi
	arn4mNWXAjGfrPpUW4bfWbnyHKDcW7qpOQ==
X-Google-Smtp-Source: AA0mqf46h3a5VLwRn21N3VCnPWLOMpM4q9QAXLLV+3nNtDy7Mn4Rt9QT6rkkqHPVseUwWIHK0c97LQ==
X-Received: by 2002:a05:6a00:791:b0:577:f836:6bcb with SMTP id g17-20020a056a00079100b00577f8366bcbmr46682140pfu.29.1671529302340;
        Tue, 20 Dec 2022 01:41:42 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id b17-20020a621b11000000b00576a89978e5sm8210230pfb.63.2022.12.20.01.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 01:41:42 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	andrzej.p@collabora.com
Subject: [PATCH v9 1/7] ARM: dts: nuvoton: Add node for NPCM VCD and ECE engine
Date: Tue, 20 Dec 2022 17:40:49 +0800
Message-Id: <20221220094055.3011916-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221220094055.3011916-1-milkfafa@gmail.com>
References: <20221220094055.3011916-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kflin@nuvoton.com, linux-media@vger.kernel.org
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
index c7b5ef15b716..13a76689e14a 100644
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
+		ece: video-codec@f0820000 {
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

