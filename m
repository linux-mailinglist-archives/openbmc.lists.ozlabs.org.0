Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB757AA8F2
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 08:25:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DlKjekOm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsMhr3sd5z3cKV
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 16:25:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DlKjekOm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsMgC4ncDz3bT3
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 16:24:23 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-577fb90bb76so1075610a12.2
        for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 23:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695363860; x=1695968660; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ce8/QAABUl/Q3jFyxxZV+5lP94Ev40T9XLcoA3tCOQ=;
        b=DlKjekOmVmFHraMwzwirkeLGI6ziMhwe9nmc+V4cRUQHjdPOHYyiYiQrgcOu0LyD2C
         N4nGhT9jyoqy0q/EIIT9o7HhkFnmuPcLfRj5v9tT6w9tGoMsGQhWHooQHExmWfjyacIb
         xTEQub5yxe1lbXWp8aPE5aGBajCEU/CMH3CnBo4fBDT4TphyLxTyep8nUAQiz4lkYWmg
         WJzzjzxamA5tlJAEKag176VSYFqGW3lw7m0UnyYWZzX/lXTeX9JG2ATkrdcTVHjXfpMo
         7bT7I6NWl0GcwZ+7VTJ0ug4taotdz/qF+NG3OHROGnPS67grgBfZwl5NTIrCQoTA1AWc
         OBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695363860; x=1695968660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ce8/QAABUl/Q3jFyxxZV+5lP94Ev40T9XLcoA3tCOQ=;
        b=Vqywvk8Z+fSfhutXH7wEFbWzJH3XFg6PL4pBvFfUS4dz1x5hz6Ncopxusr1k8CcUTe
         TFSPRHUX66UVyDjptiYeA/5GyuXLQTbyBvdioG2Ty39C4FZW+FI3IZ5XMR8VeyZDfBqH
         sVLSQJBAJvK4cqFaOTTtoYaZ+8fKqTtERy3Iu+xHZu4SQHDrHX0EikFZ/IrzSvtY/WyN
         eKNwVTuxDaHhAAMpJs6WCZZLL4hrAYOYX1mcP00E9EsAEarpU5TL01QLmrW6NoGmVHPb
         JYOWkLmrU718aN6Vq6T5gVd1rJjnibxYzL0IzO/tqJRNd4mS/aO3zgak/ofyOJpv4Lfv
         169w==
X-Gm-Message-State: AOJu0YzVn4p5pncjuihIh6fczfbMOmbJS+5Ki4vUwzBpor9kO16vnsbb
	PdduLxZIkWTp5vKmYYFyvOA=
X-Google-Smtp-Source: AGHT+IFhQjVuS1CC2PunRJNz0HYPfEL0rk671Tl12LHtA+Xp+2Kx8/034wdXuS2gi56Zjz+3ZlNGsg==
X-Received: by 2002:a05:6a20:428e:b0:157:b453:dbb9 with SMTP id o14-20020a056a20428e00b00157b453dbb9mr9153065pzj.6.1695363860460;
        Thu, 21 Sep 2023 23:24:20 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id m11-20020a17090ade0b00b00274de7c8aacsm4157417pjv.45.2023.09.21.23.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 23:24:20 -0700 (PDT)
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
Subject: [PATCH v16 1/7] ARM: dts: nuvoton: Add node for NPCM VCD and ECE engine
Date: Fri, 22 Sep 2023 14:23:59 +0800
Message-Id: <20230922062405.2571850-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922062405.2571850-1-milkfafa@gmail.com>
References: <20230922062405.2571850-1-milkfafa@gmail.com>
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

