Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D99EE4D407C
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 05:58:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDcKB5Qvrz307C
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 15:58:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p+lanh1x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=p+lanh1x; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDcJl4s87z2xsq
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 15:58:14 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id bx5so4207856pjb.3
 for <openbmc@lists.ozlabs.org>; Wed, 09 Mar 2022 20:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0eLQUSWxt5bZR5tNw2GR9QvHCs4KNecw3HHAadvhVns=;
 b=p+lanh1x/iEUSSN6YznSiGdm3zhL50/5T6as6R1ckKf9Vht+Ot5YidE+ETnsmRJYy+
 pVUMoRjigG9a4tx3sqazXBegp+k3xwbCqf9tVxoDLDcB7i9PxTwNOD91jZZsmewPDg70
 pDyJLG1oiYPuRrkzFFSiySELPJkA9vD5BmNqdG63Qf+KYj8X+O4nzysx+EPC5t4BZAv7
 1GVOOxYHSVN/dXbPW/0HSfjLD6TRTBRuiRTRsmNmj14T+dA8J+7WjpYJOW50lk+Qugys
 TtF2UaBjc5voMUzBzbjtwPsU88yhFzdoXYsgqW8llUFiT6R36HMSJJKY7TneLlnz2JwT
 2g5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=0eLQUSWxt5bZR5tNw2GR9QvHCs4KNecw3HHAadvhVns=;
 b=kxx1Wo25mOIJwdmw+4h8NzRvs0d6N9ZUGytoxrYbPMQh6PtWFJ0K8rxzqbnvSuWMpD
 Hl38yj2pPzIK9MU17PIZR+PjtNTKHKIrfa8uG4T6vr4YqxIHpg6AwxmUbj2knOc3uk0J
 7kQk8sUD+NjA6mOEQiwBHOAoiORbeOGoQmFe8ZxctUk7vbyrLCUQkYYICDvi1fBshDRd
 dIW35G/LgsF0emSVLyRs3AAy5LrHEp4lVBr8NkZtVjRMH3JsjygpRLFDzaZPwyNBSDVw
 HhLV+4La3pQF7yGdYFz5v3PScIUOm7LpOzRCIR3XtfPQyGEkZT4IAG9IjBHkZ4Y86QmU
 hc4Q==
X-Gm-Message-State: AOAM530uoFmK+/UCSiYfzpxrg+wHQcXyc17k7hEQbIIg0v4ofUiTTezj
 mV0wtCOKIQsFmfLIEIAr+x0oFOBT8cSG1w==
X-Google-Smtp-Source: ABdhPJyTUOarVJShYOAFtkiKWxrD0GcZMYYUuQ5h8WO2TA0zsCZfFBlXCftqjvfaqxVULvkYCopIOg==
X-Received: by 2002:a17:90a:2d6:b0:1b8:cd70:697d with SMTP id
 d22-20020a17090a02d600b001b8cd70697dmr14325164pjd.78.1646888291058; 
 Wed, 09 Mar 2022 20:58:11 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 ng12-20020a17090b1a8c00b001bfc847b555sm1184860pjb.46.2022.03.09.20.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 20:58:10 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] as2600/scu: Fix printing of
 security info
Date: Thu, 10 Mar 2022 15:28:01 +1030
Message-Id: <20220310045801.183051-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Johnny Huang <johnny_huang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The current code misses initialising the char buffer 'alg' to zero,
causing the sprintf to potentially write past the end of the buffer.

Most of the time strlen happened upon a 0 early in the buffer, and the
resulting string would be constructed in bounds:

 Secure Boot: Mode_2, m��ERSA4096_SHA512

Avoid the issue by not constructing the string in memory. Instead print
it out as the bits are parsed.

Fixes: dd27b24b13d5 ("ARM: Aspeed: update secure boot information")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/ast2600/scu_info.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-aspeed/ast2600/scu_info.c b/arch/arm/mach-aspeed/ast2600/scu_info.c
index 606b2445e7de..a2277eec584d 100644
--- a/arch/arm/mach-aspeed/ast2600/scu_info.c
+++ b/arch/arm/mach-aspeed/ast2600/scu_info.c
@@ -95,7 +95,6 @@ void aspeed_print_security_info(void)
 	u32 sb_sts = readl(ASPEED_SB_STS);
 	u32 hash;
 	u32 rsa;
-	char alg[20];
 
 	if (!(sb_sts & BIT(6)))
 		return;
@@ -104,38 +103,39 @@ void aspeed_print_security_info(void)
 		hash = (qsr >> 10) & 3;
 		rsa = (qsr >> 12) & 3;
 
+		printf("Mode_2, ");
+
 		if (qsr & BIT(27)) {
-			sprintf(alg + strlen(alg), "AES_");
+			printf("AES_");
 		}
 		switch (rsa) {
 		case 0:
-			sprintf(alg + strlen(alg), "RSA1024_");
+			printf("RSA1024_");
 			break;
 		case 1:
-			sprintf(alg + strlen(alg), "RSA2048_");
+			printf("RSA2048_");
 			break;
 		case 2:
-			sprintf(alg + strlen(alg), "RSA3072_");
+			printf("RSA3072_");
 			break;
 		default:
-			sprintf(alg + strlen(alg), "RSA4096_");
+			printf("RSA4096_");
 			break;
 		}
 		switch (hash) {
 		case 0:
-			sprintf(alg + strlen(alg), "SHA224");
+			printf("SHA224\n");
 			break;
 		case 1:
-			sprintf(alg + strlen(alg), "SHA256");
+			printf("SHA256\n");
 			break;
 		case 2:
-			sprintf(alg + strlen(alg), "SHA384");
+			printf("SHA384\n");
 			break;
 		default:
-			sprintf(alg + strlen(alg), "SHA512");
+			printf("SHA512\n");
 			break;
 		}
-		printf("Mode_2, %s\n", alg);
 	} else {
 		printf("Mode_GCM\n");
 		return;
-- 
2.34.1

