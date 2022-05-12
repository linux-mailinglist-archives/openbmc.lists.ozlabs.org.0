Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3525294BF
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 01:12:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2FQ00jk3z3bpb
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 09:12:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ETrbDFnf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ETrbDFnf; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzNf66tRMz3bZt
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 17:27:41 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id p12so4084672pfn.0
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 00:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vbCROyekNSS6r922VIpU9j52qiNMPCsXY7vyKjWup7s=;
 b=ETrbDFnf6QoERKrNeXN/vJhckh+Jid/ylQ9oIwHuOniqdIh7zvCVmou2Vg34q5d78Z
 E2vlgCPPNmeNeeVCkQ8euCfkKx/un4TGIzmvp03oZXRtGJqv46hD6CMHUUK466GNnti1
 SRz5m/g4zl4xctVYY2GAexq5GI1EnoX4mCta9rehXYeNx/GD+jV2ppkQggEphnOcvC2y
 jnkLT1bRjwy9BLkWV3hNvnHjCfDXRzM8x8ovcUxNN/idcYhy/N5GnpVddJUatOet8cc9
 /2MAK5OsLIbflwf//T+zJOHirXYz3syCBIsJhf6GdoCdxKuhpLw+6zFHezlrMGON9okB
 rgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vbCROyekNSS6r922VIpU9j52qiNMPCsXY7vyKjWup7s=;
 b=tchRkk/Db6BhZ5SRel4yKMKRIIid78H+twPjtXHd/jhtnWlV3ZqQ0xYEsfMW3EuORB
 Qk1yD5vIJksabCAhbrxs2eDgzFc0GEJrKdNdAk9C9mWpd8CaoZSOpwNUNChjpsgXC82x
 eel+KYgPyBTz3OIF53t9bz7KkDC+ZqsflF90lTE8XUjR55JU5Ux4f6ZwP9mwvmhx8GmH
 AtH4d5McRi6H++mr/gdJOhhl8OvFtb9/G4BMYXOGhwH/8Kw/6w9wmoymrDnhfp6o/pQH
 YFHT3VtM2HdujKdyTRLy96VHh0zLKlb7cZJUpi9aMWem9M0GE43Nr4ep9lo2jutX51VD
 RE8A==
X-Gm-Message-State: AOAM53330xten6C+R1WaYbctpwxSn+ZWCcnvE+RJnNFNs87J2CTBhCIP
 7ARC0G01pRY6L3pCYsU32DQ=
X-Google-Smtp-Source: ABdhPJwzcBtT4Mxya91XaNMZTt6nZp5IgwGbwP4h7R1jpflxvjexD1216f1TtHet2cJ//gaUJGoTbA==
X-Received: by 2002:a62:5ec6:0:b0:50d:a467:3cb7 with SMTP id
 s189-20020a625ec6000000b0050da4673cb7mr28079644pfb.85.1652340458700; 
 Thu, 12 May 2022 00:27:38 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 z9-20020aa79e49000000b0050dc762813csm3082779pfq.22.2022.05.12.00.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 00:27:38 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
X-Google-Original-From: Marvin Lin <kflin@nuvoton.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/5] arm: dts: Add node for NPCM Video Capture/Encode Engine
Date: Thu, 12 May 2022 15:27:18 +0800
Message-Id: <20220512072722.25005-2-kflin@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220512072722.25005-1-kflin@nuvoton.com>
References: <20220512072722.25005-1-kflin@nuvoton.com>
X-Mailman-Approved-At: Tue, 17 May 2022 09:10:20 +1000
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, avifishman70@gmail.com,
 openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add node for Video Capture/Differentiation Engine (VCD) and Encoding
Compression Engine (ECE) present on Nuvoton NPCM SoCs.

Signed-off-by: Marvin Lin <kflin@nuvoton.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index 3696980a3da1..0d2df74974bf 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -178,6 +178,19 @@
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
@@ -553,6 +566,12 @@
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
2.17.1

