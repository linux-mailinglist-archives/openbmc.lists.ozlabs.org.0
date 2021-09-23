Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC4D415980
	for <lists+openbmc@lfdr.de>; Thu, 23 Sep 2021 09:46:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFS0j6gm4z30GN
	for <lists+openbmc@lfdr.de>; Thu, 23 Sep 2021 17:46:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Zh54TXtz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Zh54TXtz; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFS0C11b3z3cDZ
 for <openbmc@lists.ozlabs.org>; Thu, 23 Sep 2021 17:46:18 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id r7so3308750pjo.3
 for <openbmc@lists.ozlabs.org>; Thu, 23 Sep 2021 00:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hFtgL8+aWjX8ui9LUxdfJKElzRL8zZOvK+0mzSVsxXI=;
 b=Zh54TXtzIPjwCZembFbsP5gy6Hoj+V7XIFXnGz1jgZttJ/PsF4UeIWVmPTGOeb7Oux
 cOxft32W/+uJcpdfkm4Dh5dL8jwvX4KSLiHi6MRi+Bf0nQGZNpqXZ5/z30TlksQ8mQx6
 fpXbxuZwOFcoV5KQl3r4lJycsi0E5h1dAAxuNHFlSI9X9CVFfirrKkYggNmKSKb4PtxT
 GvmDawN7+P0AFxwFo4fTxlJ3vuh3EASnTDQ7J74m6lZvo5WIOaDRwCfFAyDaVgTENq9L
 bJkUSRcF0jEGkpm0u3f2QIYsFvjkyIqXjJhq2E0ZL4EE3S5foJpgddh6kV0WCi2BYnbh
 Jhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hFtgL8+aWjX8ui9LUxdfJKElzRL8zZOvK+0mzSVsxXI=;
 b=1uojr1AabwJHQJm6wno5x6P/uIVdl3TvHilbloK1riYW//ycZjc1Or20NZO1Ebamdw
 GAlCkhYXes8A6CaMM5y5ZY7nfHzFKXrivBYaCdljA+qID8ooEXmQ3m6IIaBlt09cebpt
 WYgKrm2irrMUzqPSQXr+js6i4IpZGbPEFP3ej4NX4I48ruKa4223uyo84pt85rAFSG2I
 RVFMCi0635kbuSHOhtxUqY+cruOBK/qGCXHP9xNDxPGP8ZeX14AiWAsljrfRsA9Bl9FL
 TZmOiDTHS8sgW1LMUZjs0kivLT2yg6//e9bhfvGTpua2PBHfYnYBouq0vFiELKOMS4lg
 v4nQ==
X-Gm-Message-State: AOAM530QWX2YkF9uagaF1cNvNSs8H73/FtvJ8pK4bQOLtcyGeaE0wGlJ
 ke5dM/fxJ3jkKr6RNPzlyJ1lhNi/Dag=
X-Google-Smtp-Source: ABdhPJyqmIXkE8xqOb0/jBPuG7aH6jtal+Sk+Rm6JqEbweghPPaT0BBdbWY+0XeV3iaYdJKooB8KyQ==
X-Received: by 2002:a17:902:aa02:b0:13a:6c8f:407f with SMTP id
 be2-20020a170902aa0200b0013a6c8f407fmr2950203plb.59.1632383174782; 
 Thu, 23 Sep 2021 00:46:14 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id cp17sm4492141pjb.3.2021.09.23.00.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 00:46:13 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] ARM: dts: aspeed: p10bmc: Define secure boot gpio
Date: Thu, 23 Sep 2021 17:16:06 +0930
Message-Id: <20210923074606.283393-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The secure boot GPIO is connected to a jumper that can be used to enable
or disable the enforcement of secure boot policy.

When in the secure boot state, it makes the EEPROM at 0x50 on bus 14
read only.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index bb6bbcb4e14f..587cd83cffb1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -272,7 +272,7 @@ &gpio0 {
 				"factory-reset-toggle","",
 	/*G0-G7*/	"","","","","","","","",
 	/*H0-H7*/	"led-rtc-battery","led-bmc","led-rear-enc-id0","led-rear-enc-fault0","","","","",
-	/*I0-I7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","bmc-secure-boot","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
 	/*L0-L7*/	"","","","","","","","",
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 4f108e4e454f..21c64fe14186 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -249,7 +249,7 @@ &gpio0 {
 	/*F0-F7*/	"","","","","","","factory-reset-toggle","",
 	/*G0-G7*/	"","","","","","","","",
 	/*H0-H7*/	"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
-	/*I0-I7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","bmc-secure-boot","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
 	/*L0-L7*/	"","","","","","","","",
-- 
2.33.0

