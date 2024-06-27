Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4548391B288
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:11:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TgBgTx9x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Dpz5J0Bz3cF6
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:11:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TgBgTx9x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdW2pB9z3cVw
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:15 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-706b14044cbso564558b3a.2
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469934; x=1720074734; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFnpTkD+iTiggxR5yfNrPNsib0iELLQcb0TdrQtKxFU=;
        b=TgBgTx9xhrT+toCrrL+4dZQqb7FNsp1sOB6DW3V0ecTzckg31l6ap3CHoDwA04CPYX
         5lvzin3WJoBtYhvuAhKEJCBIZKBmXVXNBj1zWaP/0YUPhSj65D3pD3oER2nD/bWficjn
         5OK0o+M+2mxLhb2V1BJU6rpaFTOm1IRY9Qs+GqjJTtBfE8ijbP1QV55qFFhwxpym43cc
         RwYu0AEP/sDS7exASLENW2tT/w+iBxF/Yd6i6AxYWF40iw7Q91HnpqHBtIYvr4za51+i
         wuXpF7+sGcbuSzlwP/VE0Z2zXk+XSep8en8ZGSYigmDYAR+/VsUCOmzcGncLveZRxneh
         F/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469934; x=1720074734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFnpTkD+iTiggxR5yfNrPNsib0iELLQcb0TdrQtKxFU=;
        b=CqqS8QxEsiKAXPPD3ODRaz23sD/nqQu3H18wXtEPnkO0HcKgraCAAx0ZAlkDUpuzdh
         u7MzMbc7rfusMTNE3H9ZLC5Iu0lY69Orp1dBhBhgx+iT4wjuFaSOskP+Ti04iS3hji0X
         i6HiTObZHmcOLCs6EWAYbyqSIsQXxDbV0KYJBc0ZOtB8Ts8myPSnB+NIgTWY8oAeTboA
         Q6yuW2PTV/usswMZJgY5GJ6YSwv+YG0By46FNPGWMKk0KncVNp6ByyjOw9kqhPgpIM9s
         rQSRxSooNnCuYftg6o3TFGYq3oP906lHb7vTy3BKLA7m75sodNpNXwpjG0choucLRmDT
         BN1w==
X-Gm-Message-State: AOJu0YyHcbbwrHnR5fiRk0S61Nb/nURpVILf7mVbjW54Ks2f/M33ygNi
	hxq7aLLLRxxCBIG9uT0iR1IcVTRGXb1nU3VWG6VtwOm+GFPPoWnBDd+k329B
X-Google-Smtp-Source: AGHT+IGlSWRXUBkaTHLiduQsZ7AS7D32EwX19qsYNEBvqVDMUqor5oVAm4ikvLaPKZyrTKlWJKAnzg==
X-Received: by 2002:a05:6a20:8190:b0:1be:bff2:b1bb with SMTP id adf61e73a8af0-1bebff2b7d2mr3203853637.44.1719469933771;
        Wed, 26 Jun 2024 23:32:13 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:32:13 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 09/17] ARM: dts: aspeed: minerva: add linename of two pins
Date: Thu, 27 Jun 2024 14:29:43 +0800
Message-Id: <20240627062951.936256-10-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
References: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Jun 2024 09:03:24 +1000
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
Cc: Jerry.Lin@quantatw.com, yang.chen@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Yang Chen <yang.chen@quantatw.com>

Add linename of two pins for power good/control.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 86d319d7edcd..f41dcb36243a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -557,12 +557,12 @@ &gpio0 {
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"","","","","","","","",
-	/*Q0-Q7*/	"","","","","","","","",
+	/*Q0-Q7*/	"","","","","","power-chassis-control","","",
 	/*R0-R7*/	"","","","","","","","",
 	/*S0-S7*/	"","","","","","","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
-	/*V0-V7*/	"","","","","BAT_DETECT","","","",
+	/*V0-V7*/	"","","","","BAT_DETECT","","power-chassis-good","",
 	/*W0-W7*/	"","","","","","","","",
 	/*X0-X7*/	"","","BLADE_UART_SEL3","","","","","",
 	/*Y0-Y7*/	"","","","","","","","",
-- 
2.34.1

