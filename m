Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E1B4CB906
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 09:32:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8PPS5WJRz3bvM
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 19:32:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EvqlPZpK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EvqlPZpK; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8PNQ4hG9z3bg2
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 19:31:50 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id t14so3914562pgr.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 00:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=erxXp3pM+vmnwt5dCKBDd+mcnjI272utGNSkJjQm9os=;
 b=EvqlPZpK/FhAwCgU46yyCn1/DR/GXNUx31r/geQajYQZTgcBCPj3+oQpGb8LYKaM6I
 Py+oh9eglshOwAen03eu88uDeJwzHpkqPCWBqwRQ6y86lcBdJyZIFcam/xjN5tSRcxlA
 guwfdWsbUJ6OzswbSqjRbXrkbta9iwYbpg+67TkSKMRT5Wm5EuN6jyLj470foW/rhWyO
 llRlA1twHALDUgWHBaFfas/dFJmTjhXcOUXHgKpUw1ymgfzYhjAopf9f2X1qJkAOm4Tu
 O3md6TN6r3DwWnyD0Nb1GgxLZjWTbKcZYKFZqnJyCXAYw8UHhC2ZaohEUrgN0KN0AFIC
 p/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=erxXp3pM+vmnwt5dCKBDd+mcnjI272utGNSkJjQm9os=;
 b=DcOp08hH/tD3tg22g/1Tqkkk+TsF48Zupfvy1dLZL8YqfpXh317v3gTZI/DUt1iUU8
 XSS5BoW7+F7GZZOm552tiqwOmE+89IhOLoymj5l8McMOacjkUgCtDG5vdDkBnTL04Yq7
 G/ZjlOALCCAkvghaZI4wMvg5zzQ5kddineSe+pi1NxuZYd+uCqiG74rjsSuxSsMS5eo2
 JqBYBRjhaWxHUiiViKF9zzMoTrgWGw5xH/Yb4bLFVzEks7vRwmoZMHblwO4dw7QDNE+N
 /DvqXtTkC+HrT/BpB+XH9YFTf+jv8oRnTPYwkTS0WC3YDKWqa0I74rjZkox0EPc8aYtT
 J6eQ==
X-Gm-Message-State: AOAM530u1KQMbMReY1RCAU4nTjsu1tbzBRTiM0N3Y1vCD/0YNBFY220u
 gq8W5OPLhh9VwGdNrHQjNg==
X-Google-Smtp-Source: ABdhPJy8KAmbOkAKBXDhMrCYCXH9ke2KfmkfkubbXteCqA2YKtEYeJYD8An3dI4IqGRzwTxSefziOw==
X-Received: by 2002:a63:481b:0:b0:378:9b24:5163 with SMTP id
 v27-20020a63481b000000b003789b245163mr16830752pga.224.1646296309300; 
 Thu, 03 Mar 2022 00:31:49 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm1406174pgj.85.2022.03.03.00.31.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Mar 2022 00:31:48 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 yangyicong@hisilicon.com, semen.protsenko@linaro.org, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
 andriy.shevchenko@linux.intel.com, warp5tw@gmail.com,
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com
Subject: [PATCH v3 01/11] arm: dts: add new property for NPCM i2c module
Date: Thu,  3 Mar 2022 16:31:31 +0800
Message-Id: <20220303083141.8742-2-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083141.8742-1-warp5tw@gmail.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tyrone Ting <kfting@nuvoton.com>

Add nuvoton,sys-mgr property for controlling NPCM gcr register.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index 3696980a3da1..0fee5fc67e02 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -371,6 +371,7 @@
 				interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb0_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -383,6 +384,7 @@
 				interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb1_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -395,6 +397,7 @@
 				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb2_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -407,6 +410,7 @@
 				interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb3_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -419,6 +423,7 @@
 				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb4_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -431,6 +436,7 @@
 				interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb5_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -443,6 +449,7 @@
 				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb6_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -455,6 +462,7 @@
 				interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb7_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -467,6 +475,7 @@
 				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb8_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -479,6 +488,7 @@
 				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb9_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -491,6 +501,7 @@
 				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb10_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -503,6 +514,7 @@
 				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb11_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -515,6 +527,7 @@
 				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb12_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -527,6 +540,7 @@
 				interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb13_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -539,6 +553,7 @@
 				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb14_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 
@@ -551,6 +566,7 @@
 				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&smb15_pins>;
+				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
 		};
-- 
2.17.1

