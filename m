Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C857F59804B
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 10:45:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7dkP4dqhz3bmG
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 18:45:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Jy6vLxDz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Jy6vLxDz;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7djN2jXGz3c6X
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 18:44:23 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id s3-20020a17090a2f0300b001facfc6fdbcso499363pjd.1
        for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=WL3Sv1vBGufbXDtJz6jqRTIiMMloUab6bi60gMR1Yl8=;
        b=Jy6vLxDzGzWXPTvsdxC9NxKeKUVrSVSbLkxCYjFr0jQyJ7c4HAV+F4o8A/GkeNigAz
         EW0pAZYpsR0z4HS7hyYvhq+P7UMorDlRxiqtQDJMD2mGsN55PtjYJbe7YcGJ3H+I1px0
         2FZMs//ZJfZDO7fbfzQ7YUhdaePoZXSTXzoS0HFqhaX39fpufbqd32TkQ7OINTy8UKnN
         N+QJokyOf2B/fWbNBAYIFx6c9bdBc4Rgf6Rf83nnft7lCdH7zvRadD9XASungcwiAP1F
         UA99nuHq3Av8fmANDfZpQ713vmelvGirp7V6+POaHDYk5ner6R1sNdLoEH9Z/dXrAtPu
         DcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=WL3Sv1vBGufbXDtJz6jqRTIiMMloUab6bi60gMR1Yl8=;
        b=BSGUAKvfTJtTqbzf8Nc/L/hM6FdU9ILERDrdSpnzhTqNe9cYLz6vM7ivB+rM4eWMOc
         yNctcqCyrUGMoUzilb/Snf6Av7Tx/aVEDGhGm2dDYPqwSycIveRHw0qYUh2aeO2eZEK7
         qvMQhbxdWDKySJTC0uLUOo4oNNEXY3dHkwkbDUeOfCqOdF9fAkJIShwcebdvLfT+jd23
         pR4XS0B83vpZLoUttea8RaWqhBLL5ZCUXDSSZvVEM9OzZOgCBUVaexAFYFoxHymWiGtW
         cvo99lYyUNxuzj7wnELYllZ4hugjdnnFrNEVCJxE2+737K/XYWGrkVRsMo3Gd7UlXMtV
         W3Ug==
X-Gm-Message-State: ACgBeo0J/W9PztOso8JgSFOjcJNbow6qAcvXV0kWHUskK4WjBWCHefJC
	IdCq+9pdrP1ML89crmVeQhpqazcPNGM=
X-Google-Smtp-Source: AA6agR7C880CGH0MM5IF8EvLQS2MWmnqMqnnJpnJLHbTz0ZjDVsTx+l9utwq9fZleAimnFS2Q+FVtA==
X-Received: by 2002:a17:902:ea0d:b0:170:cabd:b28 with SMTP id s13-20020a170902ea0d00b00170cabd0b28mr1739654plg.115.1660812261434;
        Thu, 18 Aug 2022 01:44:21 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902ce8500b0016c09a0ef87sm833402plg.255.2022.08.18.01.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 01:44:20 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 v1 1/3] arm: dts: nuvoton: Add node for NPCM memory controller
Date: Thu, 18 Aug 2022 16:43:58 +0800
Message-Id: <20220818084400.19931-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220818084400.19931-1-milkfafa@gmail.com>
References: <20220818084400.19931-1-milkfafa@gmail.com>
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
Cc: andrew@aj.id.au, kflin@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, joel@jms.id.au, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add node for memory controller present on Nuvoton NPCM SoCs. The memory
controller supports single bit error correction and double bit error
detection.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 4 ++++
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi    | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 76137513e567..913c9cbdebee 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -438,6 +438,10 @@
 	status = "okay";
 };
 
+&mc {
+	status = "okay";
+};
+
 &pinctrl {
 	pinctrl-names = "default";
 	pinctrl-0 = <
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
index 6a1f75c93f59..100565118a59 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi
@@ -82,6 +82,13 @@
 	};
 
 	ahb {
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm845-memory-controller";
+			reg = <0x0 0xf0824000 0x0 0x1000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		udc0:udc@f0830000 {
 			compatible = "nuvoton,npcm845-udc";
 			reg = <0x0 0xf0830000 0x0 0x1000
-- 
2.17.1

