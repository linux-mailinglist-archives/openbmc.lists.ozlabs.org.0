Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D634BD4F2
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 06:12:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K29Qb4H3Lz3cGn
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 16:12:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DwrEBVmt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DwrEBVmt; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1WpR6Vhpz30H3
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 14:57:03 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d17so5767561pfl.0
 for <openbmc@lists.ozlabs.org>; Sat, 19 Feb 2022 19:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=erxXp3pM+vmnwt5dCKBDd+mcnjI272utGNSkJjQm9os=;
 b=DwrEBVmtD6umKXvFbEPmqi3ChydYqF9Do0lV1D7o6JDcbhF0HWZvlU77IplLVNNpnZ
 HGeubBCQyEDrsZsBGwrdHwS2pegxP0pW61+IY4P5EUJQq07Vjo4pa42DycZQRruoX3FS
 msKFOqwv0algQqyxsq7VvsYncb/8y8fbWdOxUNUK/mYzHkIIChDJgPMSqosNUDwIqkpa
 2sJkQocjzguWmrbPW0+uAKWT4u4sAtNxwtDmG1hshX+J0BcX+Hpov4Te/01Eei7ADh0d
 AL55vicQ4F/gwipuvnYAoS51TFt4XzAuD96PRSQFCeyK/hF+qxwgFwDeASdeiMjLQ/uw
 8lGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=erxXp3pM+vmnwt5dCKBDd+mcnjI272utGNSkJjQm9os=;
 b=2EtISHkYj9qGcCGFc/y9W+gtWn39hPixfM9jR1FZXC+G8/mbcuZFUFS2JORGUMk23Q
 +Jb21mU1ms0njFf904ZpSiIfrsOc+3gRKWfk24VeXBbBt1BdCbmDZ9eS/TNP4+8UTxZi
 aN3l8PDDQI+m59r1+nCMdHkyzNLeMQZN8G85qhiideWgnctXmLmC6ckzl5wSO4drukDN
 m4JKxXtKVv0BvvoamVY8cHowKUckbG6OwQb/B/ScShK5CyskEPADLA6O986R3/Q7Wioo
 vrsUWFvXFnUUGBAa9HF3i/cRWy+blE9XeKE293T8baYcLNwu5sEOpLthIhc2/7rvfXyC
 XeNw==
X-Gm-Message-State: AOAM532kVLZYUldhss9P8sRPfEWqogi7cHvocUE/0xN+xLj751gn7aXB
 /IQ2ai3krQKEA9KSqPGk4A==
X-Google-Smtp-Source: ABdhPJzGMy+SAIsfp0thxPyF6s6/dL06QnFuRJKnkvyqz1XIaFiwvLSYo7DoTHXKjl3CwgmJAoOwNQ==
X-Received: by 2002:a63:802:0:b0:374:2e45:c6fa with SMTP id
 2-20020a630802000000b003742e45c6famr1449715pgi.246.1645329421670; 
 Sat, 19 Feb 2022 19:57:01 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a17090ab79100b001b89fd7e298sm3473916pjr.4.2022.02.19.19.57.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 19 Feb 2022 19:57:01 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 semen.protsenko@linaro.org, yangyicong@hisilicon.com, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com, olof@lixom.net,
 arnd@arndb.de, digetx@gmail.com, andriy.shevchenko@linux.intel.com,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v2 01/11] arm: dts: add new property for NPCM i2c module
Date: Sun, 20 Feb 2022 11:53:11 +0800
Message-Id: <20220220035321.3870-2-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220220035321.3870-1-warp5tw@gmail.com>
References: <20220220035321.3870-1-warp5tw@gmail.com>
X-Mailman-Approved-At: Mon, 21 Feb 2022 16:10:35 +1100
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

