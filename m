Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 430B74D904E
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 00:25:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHXhR1CmHz2yJw
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 10:25:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZoIVAwvx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=jim.t90615@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZoIVAwvx; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFG1x3xGvz2xb1
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 17:17:41 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id e6so6684131pgn.2
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 22:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kQqw7tTt+yfVeLVpBIoJCXqGZMxXviWoufN/qt8xwd0=;
 b=ZoIVAwvxj2sYqN0VDOivFza7qxhW4lpJGmh5u/++SwtQhhYiTuPswWU2Ca7YBC2bHT
 28P5dsZIXurAcjFMWbxXNqmPHkaPGUWjSMB5glQho/JoXGrfwfrEJ+h6W+DKH8jcGSXv
 1PFKtkWSYanjLP39p52gYkPwGFt7MGerBMUWaHV1gW3fpwmtN1JNDFb3pnrAmX1nYexb
 Zw9LGvFjh9bdOxuQMg4U3JCWTB6R/z7mgCBPPC1y31Fn5pjbdpcspNVx4vkuARdwUaQ8
 gIX4OvGb12b/vUQVLi/hqbs4K9IwsRt2Iga9m5ex+buHT+uIw4hVu8tJHi4ung7zS/Nu
 VVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kQqw7tTt+yfVeLVpBIoJCXqGZMxXviWoufN/qt8xwd0=;
 b=wdeYPn68/6jHrI6ont3s/3vYviBFEM8635BFRSgQ0d3uU0MSnLo0gzbU5XZkwS07rE
 KoFCOFDhMX9t1ZTzYoiQ7GMFrI3smlOzdhYAjfJP1AWCFa8Fq5VWTHM0xPZRHcjBUaqY
 bBCjd1kFQNZ8eZ1s1ceMDvRE3o5QmlyVDqwBml+Lpci+WOfmbnArJAR9zZMh9PFUSy0Q
 hthG8AQrOmvODvDQiu/0PnXIgEP287r1XrqjHFiNLQdk4ByZ2v/rve05gZIlFdbpN3Eh
 jn5zJrqYkFo7cpyprOQ7L869sd25XAMvFYPloGTF1+dq2p6JnInd9XbTHEcvvmvDOKQF
 6lRw==
X-Gm-Message-State: AOAM5306X2JklZ0KEIjykYlgrKBBJqnkmkBRWgskD2J3D3/yLzoPSdqo
 yMJw0kcSMedVdcJZXfEvfrjKUKWdSqo=
X-Google-Smtp-Source: ABdhPJxnk1FATJe0oNRePPbbVf+GZMCM0mYjz3niQ17X5pIinsD+fFnbRH7sE0Gunr4Euqpe6F91Rw==
X-Received: by 2002:a65:57c9:0:b0:375:7489:1bac with SMTP id
 q9-20020a6557c9000000b0037574891bacmr7118940pgr.349.1646979459493; 
 Thu, 10 Mar 2022 22:17:39 -0800 (PST)
Received: from localhost.localdomain ([116.89.135.255])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a056a0010d400b004f7093700c4sm9101764pfu.76.2022.03.10.22.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 22:17:39 -0800 (PST)
From: jimliu2 <jim.t90615@gmail.com>
X-Google-Original-From: jimliu2 <JJLIU0@nuvoton.com>
To: JJLIU0@nuvoton.com, KWLIU@nuvoton.com, linus.walleij@linaro.org,
 brgl@bgdev.pl, robh+dt@kernel.org, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, jim.t90615@gmail.com,
 CTCCHIEN@nuvoton.com
Subject: [PATCH v1 1/3] dts: add Nuvoton sgpio feature
Date: Fri, 11 Mar 2022 14:09:34 +0800
Message-Id: <20220311060936.10663-2-JJLIU0@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220311060936.10663-1-JJLIU0@nuvoton.com>
References: <20220311060936.10663-1-JJLIU0@nuvoton.com>
X-Mailman-Approved-At: Tue, 15 Mar 2022 10:24:35 +1100
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

add Nuvoton sgpio feature

Signed-off-by: jimliu2 <JJLIU0@nuvoton.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index 3696980a3da1..58f4b463c745 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -329,6 +329,36 @@
 				status = "disabled";
 			};
 
+			sgpio1: sgpio@101000 {
+				clocks = <&clk NPCM7XX_CLK_APB3>;
+				compatible = "nuvoton,npcm750-sgpio";
+				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&iox1_pins>;
+				bus-frequency = <16000000>;
+				nin_gpios = <64>;
+				nout_gpios = <64>;
+				reg = <0x101000 0x200>;
+				status = "disabled";
+			};
+
+			sgpio2: sgpio@102000 {
+				clocks = <&clk NPCM7XX_CLK_APB3>;
+				compatible = "nuvoton,npcm750-sgpio";
+				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&iox2_pins>;
+				bus-frequency = <16000000>;
+				nin_gpios = <64>;
+				nout_gpios = <64>;
+				reg = <0x102000 0x200>;
+				status = "disabled";
+			};
+
 			pwm_fan: pwm-fan-controller@103000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.17.1

