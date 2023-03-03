Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BD96AB383
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 00:30:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVHxj3SfNz3cKj
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 10:30:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B198lDGi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=tomato1220@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B198lDGi;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSdYW3M1Tz3cJK
	for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2023 17:37:03 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id d10so859381pgt.12
        for <openbmc@lists.ozlabs.org>; Thu, 02 Mar 2023 22:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677825421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HwKQWiJXolgzL1MeiJl+AGrVhqp1zaGutWHj6thTrA0=;
        b=B198lDGitf009QIb9uXueNODLc03HLIak8EtHmF9jj3Np5WRntWEA8PuLhQZOK/zGP
         NZ+vn+0aZwvmCGiVcShKPvP8ch6lvHIqTaj6YVlqVyNXnOaWDHo+851LJaZie9TOokdl
         Cvnp9VNwYYhUUChaZ5h8QCVuaUq2brD7JPDUzcKGoyUjA9pIob8oYQTGiVoslmjuYSdt
         24qkAEuzM+8WYuiUnMGstAT1eV2X+CUVgLXG4qhM7qcfGFNobUJ8kCHu9nmMsIQK4J/q
         Ivs2Ec6nJjjRGNJLC6ZvfvgYtzFY/haUdzrIz/oSfNdmUMMrnR8b2TChDTcasy/Z6UYI
         itig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677825421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwKQWiJXolgzL1MeiJl+AGrVhqp1zaGutWHj6thTrA0=;
        b=E8ZXBxfBM9A+J1fxy7yEoNwv1p13qieq2oMCB4Xd9mX734SbbAnR1GEdUq5kUd8H6R
         r/noGUDvAq7zVQoL1or1MMzWVF8j5iSMAdrDX4ZII3QFB1aX7kug49TD57rbci2UJkk5
         EAsYG30YJuAPQqQMxq439ric8nzCkZzbPY4cNOk38gFm2eeej3GVO7ZJG1IGt5Lja1FR
         Mfq3kpVYdVoA7i9+JRuqBhjZS5rGNCq/TYm6EewCKZv0Sx3oZEKaGa5Bt3j4cHI17Ilh
         W5o8xZREge4cBnNVEQV0dlKDWclZ5YRapular3H44PMV/ZgrBRi2f0GT1KnnTu+KjbT7
         euXQ==
X-Gm-Message-State: AO0yUKXqfL5jeKj5G2FtxSRPetGSjqacJB0IjUDaHZ69WJMxo/JcjHqZ
	tVUsuKYCriOyHoSQ0hXfaUQ=
X-Google-Smtp-Source: AK7set/mi2fukCSpA4ET7YXAhcZoWqchQvjCCfDcfym+FcBe1AfZMJ3f5FJytQnHgfVRYLiITx70Eg==
X-Received: by 2002:a62:1c91:0:b0:5e6:14a9:b0c8 with SMTP id c139-20020a621c91000000b005e614a9b0c8mr1000851pfc.32.1677825421100;
        Thu, 02 Mar 2023 22:37:01 -0800 (PST)
Received: from davidwang.dhcpserver.bu9bmc.local (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id l30-20020a635b5e000000b004ff6b744248sm736348pgm.48.2023.03.02.22.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 22:37:00 -0800 (PST)
From: David Wang <tomato1220@gmail.com>
X-Google-Original-From: David Wang <davidwang@quantatw.com>
To: arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 5/7] ARM: dts: nuvoton: gsj: Correct gpio-pins
Date: Fri,  3 Mar 2023 14:34:33 +0800
Message-Id: <20230303063435.803097-5-davidwang@quantatw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303063435.803097-1-davidwang@quantatw.com>
References: <20230303063435.803097-1-davidwang@quantatw.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Mar 2023 10:24:04 +1100
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
Cc: devicetree@vger.kernel.org, David Wang <davidwang@quantatw.com>, fran.hsu@quantatw.com, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, linux-arm-kernel@lists.infradead.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Correct gpio-pins accoring to the nuvoton pinctrl driver.

Signed-off-by: David Wang <davidwang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi
index 53cfd15fa03f..527755dfd4e1 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi
@@ -99,12 +99,12 @@ gpio19pp_pins: gpio19pp-pins {
 			drive-push-pull;
 		};
 		gpio24pp_pins: gpio24pp-pins {
-			pins = "GPIO24/IOXHDO";
+			pins = "GPIO24/HGPIO4/IOXHDO";
 			bias-disable;
 			drive-push-pull;
 		};
 		gpio25pp_pins: gpio25pp-pins {
-			pins = "GPIO25/IOXHDI";
+			pins = "GPIO25/HGPIO5/IOXHDI";
 			bias-disable;
 			drive-push-pull;
 		};
@@ -114,12 +114,12 @@ gpio37od_pins: gpio37od-pins {
 			drive-open-drain;
 		};
 		gpio59pp_pins: gpio59pp-pins {
-			pins = "GPIO59/SMB3DSDA";
+			pins = "GPIO59/HGPIO6/SMB3DSDA";
 			bias-disable;
 			drive-push-pull;
 		};
 		gpio60_pins: gpio60-pins {
-			pins = "GPIO60/SMB3DSCL";
+			pins = "GPIO60/HGPIO7/SMB3DSCL";
 			bias-disable;
 			input-enable;
 		};
-- 
2.25.1

