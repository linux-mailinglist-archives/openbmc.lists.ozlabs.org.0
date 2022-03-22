Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D97494E38B0
	for <lists+openbmc@lfdr.de>; Tue, 22 Mar 2022 07:05:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KN1FC61n3z2yHc
	for <lists+openbmc@lfdr.de>; Tue, 22 Mar 2022 17:05:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FKiwxPHP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FKiwxPHP; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KN1Dm2rj8z2xb1
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2022 17:05:26 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id m22so14871636pja.0
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 23:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mGaGlKOqkoke5q59wbPIhnJJCDF1xon3UaxJeXjGELc=;
 b=FKiwxPHPUMWm5l3Y1R3Le8osLge9m1CqBp3AkgsLbAWk53zeGML0dqQPC6ZiZ7TxcW
 our42FBDDAlUwjl5VOjkCnMy/M+DtmpjHizC19VzMldcWUl9lrAB0uzCJs6xykET/Qcp
 QaYusGqCOxm6HYfs0RuVHKzxb7rYAg0tfEjCEBH9Qe18t6UtEI52iuskOGNU6tqJcj22
 y9HC19MjEivfw/IdTsiHD5TbA9vP6sD69K80bG3EfPhjDFFC1DwU/AfM6T+/gmhBkP5P
 3sGZTX+lCvP8z3/ciIkqD/7rKD2zrpc72Qw64mYeLX3KcggrNooxBxitgHfU8DyX3OMz
 gSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mGaGlKOqkoke5q59wbPIhnJJCDF1xon3UaxJeXjGELc=;
 b=2rxFL+kpOwu91LcyeuFY90bZfa3ooDQSR2boCjO+VeTNjcTUrn07HfNZddHymDrl43
 DYbZBDmBF99URQS1zJMC48s+3/ghgnlkan1dao5kAAtu8wiECUsKPuQOxOE8Aj2HrW+d
 xdi57bVTkGvWYruYgID7TI3wcjdQKlomohyQJq9sB215VZjUAFJdrDUOluriwiHT0g+V
 STh5moEJ2vw/dqMxmSvKqjRuyOPx88SudsCoglMiCQtL+E3rlf4F1cEu6vSS55rPa1TX
 xWcoll59OTu3bPLnm9zoCDf0p+PfiTnPdLBtbRQubsBfRHb9A0npgF/ZBND2dFk/lg/o
 kFag==
X-Gm-Message-State: AOAM530sVZTvdBS2x64NtRYcvJ8KwlmjaySS4jW/0oFZS7oQ/qMI9Ni7
 23kaYqIiAnHN+GBM3FZCJTM=
X-Google-Smtp-Source: ABdhPJybwkIi7Tghs7kbn/3tzTFQ/I80qr+Fen3yA3bFn70PJwn+1ZbX26raIT7zlavYa+ucd/dyNg==
X-Received: by 2002:a17:90a:528b:b0:1bc:c5f9:82a with SMTP id
 w11-20020a17090a528b00b001bcc5f9082amr3087272pjh.210.1647929122205; 
 Mon, 21 Mar 2022 23:05:22 -0700 (PDT)
Received: from localhost (95.169.4.245.16clouds.com. [95.169.4.245])
 by smtp.gmail.com with ESMTPSA id
 3-20020a17090a0cc300b001c743a2b502sm1267840pjt.43.2022.03.21.23.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 23:05:21 -0700 (PDT)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@inspur.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: fp5280g2: Add UID button gpio name
Date: Tue, 22 Mar 2022 14:05:16 +0800
Message-Id: <20220322060516.665340-1-liuxiwei@inspur.com>
X-Mailer: git-send-email 2.30.2
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
Cc: George Liu <liuxiwei@inspur.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: George Liu <liuxiwei@inspur.com>
---
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
index 60a39ea10ab1..067b8b82b6ed 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
@@ -91,6 +91,12 @@ ps1-presence {
 			linux,code = <ASPEED_GPIO(F, 1)>;
 		};
 
+		uid-button {
+			label = "uid-button";
+			gpios = <&gpio ASPEED_GPIO(Y, 1) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(Y, 1)>;
+		};
+
 	};
 
 	gpio-keys-polled {
@@ -231,7 +237,7 @@ &gpio {
 	/*V0-V7*/	"","","","","","","","",
 	/*W0-W7*/	"","","","","","","","",
 	/*X0-X7*/	"","","","","","","","",
-	/*Y0-Y7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","uid-button","","","","","","",
 	/*Z0-Z7*/	"","","","","","","","identify",
 	/*AA0-AA7*/	"clock-gpios","","data-gpios","","","","","",
 	/*AB0-AB7*/	"","","","","","","","",
-- 
2.30.2

