Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D184BF0DA
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 05:17:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2m9R45Krz2ynt
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 15:17:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hWZJhKT9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hWZJhKT9; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2m7q35Crz3bZP
 for <openbmc@lists.ozlabs.org>; Tue, 22 Feb 2022 15:16:22 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id z15so4953812pfe.7
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 20:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9y7F/bHnqXkW0oPkMs+ZHTotblfOd4M60KSXaKT3heo=;
 b=hWZJhKT92r2aFMCYB6i0MD7BDsUnO77pDZC5relUS8F6bzVYxfdSMgNaZYsBcK+b/T
 n/vASbDfIhAstud9Q095WeH7PV8urKuWCrOgH78K5GDLqa/MLVJzbCb95kQCVzxnI847
 I5YloiTNnS7oF8MWy6Z/acI1H/xLBRLYzM9GHiCUXpzj0GLlxyyXL2PeVk9foVrOQmPd
 3h5PUr2exvTEbcJz0PNb0rwjuTNBHW/Avd7NPMy7pJ5ycUCHZS1FM828zH2I+/K6QcPw
 1lwZuA7PZ+Lqitw10u6k/jGUuJZ2ENFvLbk9cMkXz42dhMa0nJixdVIFCViQjsif+O7Z
 zzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9y7F/bHnqXkW0oPkMs+ZHTotblfOd4M60KSXaKT3heo=;
 b=wX/JIjJw9e9uE3YJMt/7Y4Pjjc03IaskTn3Ppa69JKfm4B79MJ9HhK6+4IYkyHCHcv
 29VPm5hMeflhBodO39YFJtDr5EdKDWCW45LRuS/qJNhALtdCgutbhtVuqFAYm8k292KU
 Z1rzxfiLJwjdhZmPj3J+4yodyJZi6+IrA9CVJcZepGL+c/lXVSDGNTOYT7kXOFc8uVAO
 bj8Ht0a0yAG9o0YpLpHzTUKC1CYqlzS4rUILpbN6rNXvFU8dAZInf4HV11FNYnkS2nu2
 Ygzimp1pd7WXuIrLezDQ8tT+xKVSRlF6vYMxfYQ5aJ5KguqijQa/od1KWvibSZ/lMEs7
 YxpQ==
X-Gm-Message-State: AOAM533fruNnEXa2RWh/9Ax1Y0IAtz4K+iKVxUCSpYY/smeDlieFWJUC
 OHaLGS+jPBO9ftNSkqN/4QNKkOyEaBXTHQ==
X-Google-Smtp-Source: ABdhPJzHyeNKGP+EkoBWGasneTNGYW1cJmJJv6In1HchamHUPk1C5Jju2+z2FGL/3OLnQGjvh2GxZg==
X-Received: by 2002:a65:52cc:0:b0:374:3ee6:c632 with SMTP id
 z12-20020a6552cc000000b003743ee6c632mr6767614pgp.91.1645503380463; 
 Mon, 21 Feb 2022 20:16:20 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id p1sm14457281pfo.212.2022.02.21.20.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 20:16:19 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.ibm.com>, Andrew Geissler <geisonator@yahoo.com>
Subject: [PATCH 2/2] ARM: dts: aspeed: everest: Add RTC battery gpio name
Date: Tue, 22 Feb 2022 14:45:59 +1030
Message-Id: <20220222041559.68651-3-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220222041559.68651-1-joel@jms.id.au>
References: <20220222041559.68651-1-joel@jms.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is the documented name used for OpenBMC systems:

 https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md#rtc-battery-voltage-read-enable

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 547c71bfdfa7..64bc5b674288 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -269,9 +269,7 @@ &gpio0 {
 	/*C0-C7*/	"","","","","","","","",
 	/*D0-D7*/	"","","","","","","","",
 	/*E0-E7*/	"","","","","","","","",
-	/*F0-F7*/	"PIN_HOLE_RESET_IN_N","","",
-				"reset-cause-pinhole","","",
-				"factory-reset-toggle","",
+	/*F0-F7*/	"","","rtc-battery-voltage-read-enable","reset-cause-pinhole","","","factory-reset-toggle","",
 	/*G0-G7*/	"","","","","","","","",
 	/*H0-H7*/	"led-rtc-battery","led-bmc","led-rear-enc-id0","led-rear-enc-fault0","","","","",
 	/*I0-I7*/	"","","","","","","bmc-secure-boot","",
-- 
2.34.1

