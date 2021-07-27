Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 345C33D6CD7
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 05:34:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYj8d2GZfz3bZ4
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 13:34:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TmuRNCK6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TmuRNCK6; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYj7T0w3Vz2xvc;
 Tue, 27 Jul 2021 13:33:40 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so2990151pjh.3; 
 Mon, 26 Jul 2021 20:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qOL68tjGXBWZUtM6TEQ+vHsPqA+ZyHl0bEMzbX1MytQ=;
 b=TmuRNCK6tDuk+6L/gDbostE1q2l1pQbexZxt9/tVFilOVlqmzRNG2ZvTLAUhO9y4Ah
 ED/d+jPdjvUvioUCsQNLWVt4AeeBr5Z52TK18ncEVEN5cjaH6A6dJuPg3CTBZLpHXNV4
 QbHwBXNg0/UsvWzIDjMy1ZgbkKa9y1LO+OYYon7bNII4ji6C2MsiINyw7PUsDpPtWxNz
 Ovcnu0+S3FMUEzWU9DR+Lqkqrc/O0lsyU6CdyjpUf85wznj7h4UGtvTG+4eApb9oD+qH
 Kh8d2faLoIZOre+LM8g28LSl+COtQ2sBMy472fI1U16rwZ0vIHrDDYaraeovYKjlCZpY
 uB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qOL68tjGXBWZUtM6TEQ+vHsPqA+ZyHl0bEMzbX1MytQ=;
 b=bh+FTG3t4Y+RftySEvPgW4SVC55uq0bnxrdGn7r8JFx/1zDrSesMReH5/PgANvGuZx
 u0+h3x/RM6FS86tTIVkuO0MSbkPDmQzvfbS6OmCcAnycIZWYauQLIOev9tTwpjIa1ssM
 bPPaAPf6OeKLUoil2lb5OkOjfh+xv5QO7sQYGLNTI2GX4XdO1pGkJxGqt9Kd2jKK+sMn
 tE0ftCR6CwuQCpuiG8jVB4gxtn1Vhqd26W+boShfhJxORMXR44D5VzNV0DgvKAxPnG6u
 36wO4aiNNtckSWOzCtj6RYaAPUWHLZj8Fn5zmjROIopLbW/DGxk0yjbYPpQFGICsJg96
 QuaA==
X-Gm-Message-State: AOAM531FE2YJTH0uPmEO/YlVWRmcqHNOqvTKMV6L7KCJ9EDRC+XXiJDL
 qJvHChGWXxXQStzc/Y+8HyQMR5oYxCk=
X-Google-Smtp-Source: ABdhPJzdGk9WD94Uuhh2J2EKF3olnE354fTv7+8mcMzsHhMYZxC0qXFcg36oTmHG3jjyHqrrPAspeg==
X-Received: by 2002:a17:90b:215:: with SMTP id
 fy21mr7846770pjb.203.1627356818140; 
 Mon, 26 Jul 2021 20:33:38 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id s193sm1528351pfc.183.2021.07.26.20.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 20:33:37 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH 2/2] ARM: dts: aspeed: tacoma: Add TPM reset GPIO
Date: Tue, 27 Jul 2021 13:03:19 +0930
Message-Id: <20210727033319.473152-3-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210727033319.473152-1-joel@jms.id.au>
References: <20210727033319.473152-1-joel@jms.id.au>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The GPIO is used to place the BMC-connected TPM in reset.

The net is called BMC_TPM_RST_N on Tacoma.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index e33153dcaea8..e39f310d55eb 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -126,7 +126,7 @@ &gpio0 {
 	/*M0-M7*/	"","","","","","","","",
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"led-rear-power","led-rear-id","","usb-power","","","","",
-	/*P0-P7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","bmc-tpm-reset","","",
 	/*Q0-Q7*/	"cfam-reset","","","","","","","fsi-routing",
 	/*R0-R7*/	"","","","","","","","",
 	/*S0-S7*/	"","","","","","","","",
-- 
2.32.0

