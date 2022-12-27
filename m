Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D250B65692E
	for <lists+openbmc@lfdr.de>; Tue, 27 Dec 2022 10:53:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nh92T5HPsz2xCd
	for <lists+openbmc@lfdr.de>; Tue, 27 Dec 2022 20:53:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F8J7oA8L;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F8J7oA8L;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nh90q3Q1zz3bT4
	for <openbmc@lists.ozlabs.org>; Tue, 27 Dec 2022 20:51:55 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id m7-20020a17090a730700b00225ebb9cd01so4892088pjk.3
        for <openbmc@lists.ozlabs.org>; Tue, 27 Dec 2022 01:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuPzabFK+ItSAS4Njr3Xe+weyJyvM5VjKuGON2TO41E=;
        b=F8J7oA8Lbv5Z2/cnu9xN69NUs+tjMghmpHUg/HEH+z3nW1b92eQxsf6wyxipVyfbew
         mgquQUvtjdNkUS9xw146qyzkFCdFHmihwEY0Mmlzm4EH/Rfs6QeIJiAy2ieyUhHKqMgk
         WzHLQBSNyfP3qKqunXY7ibSCYg1VpudEyBXqZp5TZgQ+eEeJpt0Pv66a4HmgkfixbHb6
         rpMBLhzIS4fpu28Jl005zYlPatbB2BDaeBwy2owSG/9ZK0cBRqV42jwTfNuoI2g4QJE8
         CXANHt0k6smMBur0Jl3nYMgz51IVxej5E3OlM+Byohf0OB7oa+lE7qHCnMFpT/ZJ6A+B
         z0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuPzabFK+ItSAS4Njr3Xe+weyJyvM5VjKuGON2TO41E=;
        b=gCAvLiarUDlJ+raF2ENyRHhvAA/pN/8+/80znHnohLY+2/NDDt9gCWVsqmGYZPN19K
         PAEZKBJHoc4Mz3OtibUPkf41Gb3K+1NqEresDoXnctYmkPx76Kcj0Q1saM3vVAeI1xMJ
         Q4zgLLSv6ou3PxchwCMrBtTjiq/Ab5NdMnesmEhnBmdxXk0UR3se3BGhP7ujJYkIGj2y
         aXjoDV8pdBfLeqZceE93F6Ake409d6vjkssVlnhStQ3QXNK1iQgczVeo4XQXZlHaoYox
         Hrkq7wIQqrK8Ll3jP/q5tvsLHWQtNJTpZ9npVcJx53r2uxCQWuLUHWwKirzhmjuR8riK
         nBfw==
X-Gm-Message-State: AFqh2kpjC7Zv0Nn8mgrZOonjuGRXFM5m667K3zHvLqm3JS7l09Nv4ct8
	WiOn+dO5NKUmlQBUtOt+KiY=
X-Google-Smtp-Source: AMrXdXvZ0ihW3bCVl+gyhDG2Rk3F3CtAk8qiU/DoyxlhQnQFi7n7aLrrNdPAK8CNj9hTnNQK+B47sw==
X-Received: by 2002:a05:6a20:3c93:b0:b0:30d8:d53 with SMTP id b19-20020a056a203c9300b000b030d80d53mr32892588pzj.19.1672134713154;
        Tue, 27 Dec 2022 01:51:53 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 21-20020a621515000000b005813aec74bdsm2619052pfv.139.2022.12.27.01.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 01:51:52 -0800 (PST)
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
Subject: [PATCH v10 1/7] ARM: dts: nuvoton: Add node for NPCM VCD and ECE engine
Date: Tue, 27 Dec 2022 17:51:17 +0800
Message-Id: <20221227095123.2447948-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227095123.2447948-1-milkfafa@gmail.com>
References: <20221227095123.2447948-1-milkfafa@gmail.com>
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

