Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A57651C27
	for <lists+openbmc@lfdr.de>; Tue, 20 Dec 2022 09:04:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nbpxm5h86z3c9M
	for <lists+openbmc@lfdr.de>; Tue, 20 Dec 2022 19:04:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=boQBueAK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=jim.t90615@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=boQBueAK;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbpvB3kc1z3bZj
	for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2022 19:01:58 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id w20so4901108ply.12
        for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2022 00:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cn9sFYqIGbUunzJ/h1lkLLrsgoXDUwwaBnwYE/8qbO4=;
        b=boQBueAK+MllFRt+huvohf4L7VYUzk0TicrIJE5Yg+ZbwQQUNgVyjvgKrmojKPTadC
         1mi7J+6CiEfWZhy+yFMfhkXHM1RoRXiWwLIzwzxRggB0a9o4jxmflAHR9KYHVsCKDPyL
         8l6QEAgafhCll0i//bQJDQIg7b8EvNWtPtTkRSfM3SIHLQL9QnnLFSaIjCyIXXf3XfB0
         3T65dSGI/b1UBTfGCaHp8co4AawmnAhT+6RQpERM8x7HHvIehx2qRNuyWLckt1BCcLm4
         EwHHqWneU2SN3aWO9w5bxliWnT5Z5lFI3VvjMFknqgW8UcB16XkAYvJumtvurb9gEBVI
         RUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cn9sFYqIGbUunzJ/h1lkLLrsgoXDUwwaBnwYE/8qbO4=;
        b=v+cOYcPGWNKQ3EBNI1m3VyVB1QKDfUCWl++A5jbtFohIFYSQYK8+92hnTCf8ir/dK/
         ilhhdIzkS5T89/adq8kg9uDsg4QG2hKCtZpCHYLKYbdaf+ZUwUM86v5hbNn6YNaT/bx1
         sFQGioMUU+whis7RAHZz0/CN00T7wOrJ02xKI5gvWx+ARAjcV1u7mfztQUuqzbI9dQUV
         9Y0KreRIEa+jEjOmtfxcpQAnqI4ZMy+IW+pqsuWsBR9Jct8gWXsOuKZ8YY24KCiDqC5K
         WDWCC2XpjIp7Izfsiyc4UDE+jeALH+K0U9Yd2G/miz+R88KBrMRVRv7e56tQwUkp949c
         Uhzw==
X-Gm-Message-State: AFqh2kqIaroyEL+YTp+nw4maNWv41dZPyuKLjFCFAMWSGeoxvxbbAZg4
	E8mr46vBpvtjqnzHuRLG5l0=
X-Google-Smtp-Source: AMrXdXvGVaCuW8BstMZUCIUBRCXv7DaUOthBPlGx2Hh+ViA88FYbhCNh1vaxhPxPFf6xT4We9sP2oQ==
X-Received: by 2002:a05:6a20:3d25:b0:af:953a:12b2 with SMTP id y37-20020a056a203d2500b000af953a12b2mr29479761pzi.43.1671523318093;
        Tue, 20 Dec 2022 00:01:58 -0800 (PST)
Received: from localhost.localdomain ([180.217.146.214])
        by smtp.gmail.com with ESMTPSA id u15-20020a65670f000000b00476d1385265sm7559179pgf.25.2022.12.20.00.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 00:01:57 -0800 (PST)
From: Jim Liu <jim.t90615@gmail.com>
X-Google-Original-From: Jim Liu <JJLIU0@nuvoton.com>
To: JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	jim.t90615@gmail.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v3 2/3] arm: dts: nuvoton: npcm7xx: Add sgpio feature
Date: Tue, 20 Dec 2022 16:01:38 +0800
Message-Id: <20221220080139.1803-3-JJLIU0@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220080139.1803-1-JJLIU0@nuvoton.com>
References: <20221220080139.1803-1-JJLIU0@nuvoton.com>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the SGPIO controller to the NPCM7xx devicetree

Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>
---
Changes for v3:
   - modify node name
   - modify in/out property name
Changes for v2:
   - modify dts node
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index c7b5ef15b716..f780474a16ce 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -330,6 +330,36 @@
 				status = "disabled";
 			};
 
+			gpio8: gpio@101000 {
+				compatible = "nuvoton,npcm750-sgpio";
+				reg = <0x101000 0x200>;
+				clocks = <&clk NPCM7XX_CLK_APB3>;
+				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+				bus-frequency = <16000000>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&iox1_pins>;
+				nuvoton,input-ngpios = <64>;
+				nuvoton,output-ngpios = <64>;
+				status = "disabled";
+			};
+
+			gpio9: gpio@102000 {
+				compatible = "nuvoton,npcm750-sgpio";
+				reg = <0x102000 0x200>;
+				clocks = <&clk NPCM7XX_CLK_APB3>;
+				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+				bus-frequency = <16000000>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&iox2_pins>;
+				nuvoton,input-ngpios = <64>;
+				nuvoton,output-ngpios = <64>;
+				status = "disabled";
+			};
+
 			pwm_fan: pwm-fan-controller@103000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.17.1

