Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF661618F31
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 04:39:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3RFH5FdRz3cLq
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 14:39:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LWfmil8f;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LWfmil8f;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3RDg5lSVz3brQ
	for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2022 14:38:43 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so7061960pjc.3
        for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2022 20:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucUqZbR/kDPQRdKfiuudXWiRnCiCHKT9s9GBhXX4jwM=;
        b=LWfmil8f1DsRQUwuclZkyuz4wuprWIudvwX9Ra4Zjqow2C++2RUtTINPeLhyMkVEuU
         LbLz5nvJ9rPBiJj6/giSdmLlvG6zS6PHAzvGpNlqlcnwCnP6cgxz7WXYamSdAcgWM+00
         AddZ//26TtH18MNsyz9PmGTdfoxTzjcYmgwTWMWCXsFqOodqisMihsyfem2oM5CJsTxH
         4t34uzx1PAfEiTC8T+3qqH+m1WfvtelTSREbsE5tNhOaH4Koaj3+Y2bgjW6ucgRg3x0X
         z+91nvngPFpDi/w6dr+0rOZm/D75ruyum9h0PA5VHOy02+0QR9S1RmUu3wemQMQH3PJq
         HepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucUqZbR/kDPQRdKfiuudXWiRnCiCHKT9s9GBhXX4jwM=;
        b=DbSMObAu6+EDjSzkHZ1jyhsnNM6nktG3iCs1ei/WwJSSR9rws9UYrURSxNiMBqxY4X
         uVlnHVrzMlI94Rd/MO0S9HvuEN+OAia7DncH/0uqz4KYceGdUKs0g6KvmrcmmR5dJ3r3
         6OvGHKVyPBzXTNLk1Rkgc79N7e6eHfQbMdpfo84gj7Ah/6/wk1CxpuTPy7jOZVvCoMh9
         Pr1AcwmVu/AO3XY8AatrqshgjC/7GCG5/4AIKaJLvpPm0/JXkynMS9YRwykovklqDcmS
         p4iKrwhNuySVCzCTmvD+hB+nnPeNjNudhfxJcugmNn9ACtPw3ZABUCiGRORu9A8JduuY
         MTXg==
X-Gm-Message-State: ACrzQf3zufMzhYYQ3OX84zqwwE57naCDnailJDs61ii9WdRrKKVGVE8f
	SFQkMBXI5fFgL5s+ZWFnoXg=
X-Google-Smtp-Source: AMsMyM5dE4H5YykBsYSZibO8HhRSLSFVb1FzvML1jk6mWgGTv5vudgXpdOtIzrLVLHZSPS8Y56Wb/w==
X-Received: by 2002:a17:90a:2a8b:b0:213:9ae5:b9ab with SMTP id j11-20020a17090a2a8b00b002139ae5b9abmr35062656pjd.110.1667533121225;
        Thu, 03 Nov 2022 20:38:41 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id f17-20020aa79d91000000b0056bb06ce1cfsm1545759pfq.97.2022.11.03.20.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:38:40 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/5] arm: dts: Add node for NPCM Video Capture/Encode Engine
Date: Fri,  4 Nov 2022 11:38:06 +0800
Message-Id: <20221104033810.1324686-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104033810.1324686-1-milkfafa@gmail.com>
References: <20221104033810.1324686-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add node for Video Capture/Differentiation Engine (VCD) and Encoding
Compression Engine (ECE) present on Nuvoton NPCM SoCs. Tested with Nuvoton
NPCM750 evaluation board.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index c7b5ef15b716..293a550955bb 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -179,6 +179,19 @@ fiux: spi@fb001000 {
 			status = "disabled";
 		};
 
+		video: video@f0810000 {
+			compatible = "nuvoton,npcm750-video";
+			reg = <0xf0810000 0x10000>, <0xf0820000 0x2000>;
+			reg-names = "vcd", "ece";
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_VCD>,
+				 <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_ECE>;
+			reset-names = "vcd", "ece";
+			nuvoton,syscon-gcr = <&gcr>;
+			nuvoton,syscon-gfxi = <&gfxi>;
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -554,6 +567,12 @@ i2c15: i2c@8f000 {
 				pinctrl-0 = <&smb15_pins>;
 				status = "disabled";
 			};
+
+			gfxi: gfxi@e000 {
+				compatible = "nuvoton,npcm750-gfxi", "syscon",
+					     "simple-mfd";
+				reg = <0xe000 0x100>;
+			};
 		};
 	};
 
-- 
2.34.1

