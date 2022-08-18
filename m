Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CDE597EBC
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 08:41:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7Zzv6Stsz3blw
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 16:41:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XNjYtxXl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=stanley.chuys@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XNjYtxXl;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7Zy65FPsz2ynh
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 16:40:14 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id w14so738339plp.9
        for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 23:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=B31e4t4sLljfsJVylS8l4l1UUI6Ni8QnHRYHWiz4cYg=;
        b=XNjYtxXlktZX8mwi2L8Jzxjp2PuWd9QGq1botN1nkuq7uWmxxotlsYTZ1ZpQFl1tf5
         /4jy3zbUfSYxNkskWhbYJqCikBlVSovYG20wgT/PcMpOlBYPW9Y+G6OpAv+VDKIL1u+R
         6heNYLcvMJF35KVRNtwaoCV+PPoLsFZchcWAmCQ9LW0hVRITaLJSV9EqhlmXDp3w2UX9
         9KhNYtTIGe/uegdghRYMMvRmSPXrkQIO3xOrEeSywuheeocVbYtF6FpWob+Mcpn++s8v
         gBbbrmDBeuE0n6Hxz4+Z/pf3X1xagnyZl272INcmXr3ZuWKpaVn+KoIRL5/w3n8YX9iu
         171w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=B31e4t4sLljfsJVylS8l4l1UUI6Ni8QnHRYHWiz4cYg=;
        b=C2eLlW+VXqCvg4U0JY1wcpX789te4dXAtvYkS3ZOOGpFsBak8iMy9TsKE7r9Ublh8j
         BR9lbZ2eoJ/Oaue3l2gZlemAezgyiTzVuriDNpL5YaCg8Q6CpG8DdmJ2EwLOPYTnOLaq
         36rS6bjSbDl3TvwvDG6c/4Uz6HBjjTrRjB8//zSYu/VozWu2Wg/t6aLCLNi9BTkzVBZT
         VGS6FdopdnrsJ1NFmLx2vqokKPp5ghNfUBJI47R7YkLPhJoEgfXIu7MbAIKAszED1XWd
         vImUCWNGYvCt8oeVO80BGN078gSdkFfdT/yorsKvQsHosQafeNOOx4W69q74DszA3yUA
         Q79A==
X-Gm-Message-State: ACgBeo3vqThl0YJoqQPaKG0CdnRNHY0wW7YMqfl7B3BmkKM1F+yB0vE1
	XnZ/Dp14DBt5Wb4ERdkAAfDa9gXcLaCy4w==
X-Google-Smtp-Source: AA6agR5A4O8iJ1YBxedBVJSHS55eah2d53ukQdFFHnbAOTfHvW30RbrBvQUzzVVVfsfBtcXA/UfF3w==
X-Received: by 2002:a17:903:1c3:b0:16f:878:ed42 with SMTP id e3-20020a17090301c300b0016f0878ed42mr1429008plh.163.1660804812468;
        Wed, 17 Aug 2022 23:40:12 -0700 (PDT)
Received: from localhost.localdomain ([180.217.158.143])
        by smtp.gmail.com with ESMTPSA id a9-20020a170902ecc900b0016bf4428586sm553188plh.208.2022.08.17.23.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 23:40:12 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 v1 2/3] dt-binding: bmc: add NPCM8XX JTAG master documentation
Date: Thu, 18 Aug 2022 14:39:50 +0800
Message-Id: <20220818063951.12629-3-yschu@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220818063951.12629-1-yschu@nuvoton.com>
References: <20220818063951.12629-1-yschu@nuvoton.com>
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
Cc: andrew@aj.id.au, yschu@nuvoton.com, joel@jms.id.au, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Added device tree binding documentation for
Nuvoton NPCM8XX JTAG master.

Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 .../bindings/bmc/npcm8xx-jtag-master.txt      | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bmc/npcm8xx-jtag-master.txt

diff --git a/Documentation/devicetree/bindings/bmc/npcm8xx-jtag-master.txt b/Documentation/devicetree/bindings/bmc/npcm8xx-jtag-master.txt
new file mode 100644
index 000000000000..e26ec7d37d84
--- /dev/null
+++ b/Documentation/devicetree/bindings/bmc/npcm8xx-jtag-master.txt
@@ -0,0 +1,29 @@
+Nuvoton NPCM8xx JTAG MASTER interface
+
+Nuvoton BMC NPCM8xx JTAG Master is used for debugging host CPU or programming
+CPLD device.
+
+Required properties for jtag_master node
+- compatible	: "nuvoton,npcm845-jtm" for Arbel NPCM8XX.
+- reg 			: specifies physical base address and size of the registers.
+- #address-cells: should be 1.
+- #size-cells	: should be 0.
+- interrupts	: contain the JTAG Master interrupt.
+- clocks		: phandle of JTAG Master reference clock.
+- clock-names	: Should be "clk_apb5".
+- pinctrl-names : a pinctrl state named "default" must be defined.
+- resets		: phandle to the reset control for this device.
+
+Example:
+jtm1: jtm@208000 {
+	compatible = "nuvoton,npcm845-jtm";
+	reg = <0x208000 0x1000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&jm1_pins>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&clk NPCM8XX_CLK_APB5>;
+	clock-names = "clk_apb5";
+	resets = <&rstc NPCM8XX_RESET_IPSRST4 NPCM8XX_RESET_JTM1>;
+};
-- 
2.17.1

