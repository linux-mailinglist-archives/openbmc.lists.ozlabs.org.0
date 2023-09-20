Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2DC7A7084
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 04:30:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XLpMIOt0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rr2Z06TTsz3c5J
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 12:30:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XLpMIOt0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rr2XH0MTNz307h
	for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 12:28:46 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bf55a81eeaso47875945ad.0
        for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2023 19:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695176924; x=1695781724; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ce8/QAABUl/Q3jFyxxZV+5lP94Ev40T9XLcoA3tCOQ=;
        b=XLpMIOt0h/S8ikKCc+c+SylIJS28UeKhlrRYFqLIYBJU5LDEYPojajz27DpzP3Fvyh
         IIvCp/J3SYj8eU99FSGYWk93pY+/LXDh5/dx2AC6eZKSfgO/fPrnPOXbV6unB6ilgoku
         1DfxRHvuRqc7aZTOZvr2Rcwn+/EcAXk2IrlVrSVAEHibwCgo7RLT0iKLDytiEdv1qcmn
         8h1bGtsmtI6k3OQU9ajR18BU1GXi9R4n60POV94cYQaSR9DgJm0exAKuAdiG29DB7bet
         YTrg1oTMN5NXPF8PfA+YQ2QEUZposMYIqVAXgiWveAHiCjlDa5+fhhbTxx+9UeAHA+I4
         2FaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695176924; x=1695781724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ce8/QAABUl/Q3jFyxxZV+5lP94Ev40T9XLcoA3tCOQ=;
        b=XYLu6fLnnknoXLlsMx67s5TWgGomgwEnZUkguQInknJVbiYErqgmdKXVWQJb2D/zPk
         +Dbk+I1zcPcZSC0ENpnQdKSUb6NtScF5f9oNRXg1191fwcL9X5lTF20KZTelPCDHCeLb
         Nt+XlF8T4ixso/cPPF1DXk7Ca7qlUIhfWqRYwk2ssIAOdbbkzPlpfK0yovK7eOtXHKNH
         QIjyZ5n/LxRWX3O0fXbmaKdPF0rfoNcd9KUb2bdsrkM7bvttgX5sH2oacZQlcZy5ga+h
         yzxUyQIWij4ualuCyKd1LEBA/0sZo6GOx+4LwTsmdStxwSGYUYEf5IW+tXfKi0GPQ+Og
         GmOQ==
X-Gm-Message-State: AOJu0Yxegq0Hd8WE87Ux1c50vwZnfRU7WrXqCcKYoYDdmP7o8Yv4KhAZ
	xB8UQ2oL3qFP8UfIW9e/W2A=
X-Google-Smtp-Source: AGHT+IGNcYN5lavrcyLztbagSU1dbA/PUkRKt9koAmJGVs4XXP6FL0hoT36nowjanjoGYljC3WzDBw==
X-Received: by 2002:a17:903:245:b0:1c3:ed30:ce04 with SMTP id j5-20020a170903024500b001c3ed30ce04mr1316357plh.25.1695176924093;
        Tue, 19 Sep 2023 19:28:44 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id n9-20020a170903110900b001bc930d4517sm10610009plh.42.2023.09.19.19.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 19:28:43 -0700 (PDT)
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
Subject: [PATCH v15 1/7] ARM: dts: nuvoton: Add node for NPCM VCD and ECE engine
Date: Wed, 20 Sep 2023 10:28:06 +0800
Message-Id: <20230920022812.601800-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920022812.601800-1-milkfafa@gmail.com>
References: <20230920022812.601800-1-milkfafa@gmail.com>
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
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 868454ae6bde..e69746948f5e 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
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
@@ -563,6 +581,11 @@ i2c15: i2c@8f000 {
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

