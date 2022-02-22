Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 559974BF0D9
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 05:17:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2m8m4vsXz30Dg
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 15:17:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KMIv4VV2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KMIv4VV2; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2m7k6shBz2xrG
 for <openbmc@lists.ozlabs.org>; Tue, 22 Feb 2022 15:16:18 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id s16so15972193pgs.13
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 20:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h677NkeS4XHi30yB2hiymA05ngHNnkQkYNLwLq4l+9c=;
 b=KMIv4VV2bGVa3kavmYxtBz8YPxusPoQGlQl2+FFkm4ONajLtc0X9pf5PI7C/+JjNhQ
 Dvr3V3Lr2DOv7JPHJR1AYtjIP5JpcDnob9ULXYAb/qdD7mdFtvPYcWYew9Mwy9z9MP66
 2mae4WhJ7aDxYqwEJxeSC1bn/u3YwJydJTIzjKLhsNTykUaTkiVn4WzVy7lnZvaxNm5J
 0/QFMJYUn+D6AzpxTvrXPCXMYdJMFF1QGkxByVerCy+OQSuNT9Peufxae8K9W6D+NspK
 CZrrYGDuhkbJCP3xX4cITi3lqNyld67g0a+G+3jb7jCAKqcM36PujXtoOVRSXjXaXkbq
 3G2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h677NkeS4XHi30yB2hiymA05ngHNnkQkYNLwLq4l+9c=;
 b=WwdkngGFRrenkiL8/+Wh0cpjuwL9X+zogS6Qj3CSWHan2kuQP4B0XQ9q4pkic0hkkr
 qZ9BzJkh2m5Zh27DhnHKQ5L3n89OjixidS1mEHM+c895byi56yhIq9Za4h3M9MBr3V7P
 +XEFB/l+N7CR4/0S545CMhkoe9ludYvroj60h1y/4nd6R2PT2BX/Y9OUJhZZM3qE4NyJ
 iQXsmv6kIfEGSsC0GKd9lfiQ6rBq6OWd0J2/xmPhIc7U176Nh71W3GUB4vkHjcHMcUwX
 3WPEabjCiueZoqXlYJo7EbrSbIrDLbTUurg3Hf3O7ZUwOaldHK9WFSjRjoAoZvDdkVVi
 Fi8A==
X-Gm-Message-State: AOAM530iA70VpKAwcO3lFm8Jy5JInYWe4HnFfQsHo0ZOwis4yLtyF5UW
 ZYz+PVVnHVox+XGkOdcRWExut1fGKnUGoQ==
X-Google-Smtp-Source: ABdhPJyk4EzFkfF07oGThOncGqWyH9XGd6sm/K1sxaY64Z/YXUBMsC2Q7G5SjDceHhuZL1j2uj52Gw==
X-Received: by 2002:a63:e215:0:b0:373:9dd6:4b99 with SMTP id
 q21-20020a63e215000000b003739dd64b99mr18232981pgh.561.1645503376350; 
 Mon, 21 Feb 2022 20:16:16 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id p1sm14457281pfo.212.2022.02.21.20.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 20:16:15 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.ibm.com>, Andrew Geissler <geisonator@yahoo.com>
Subject: [PATCH 1/2] ARM: dts: aspeed: rainer: Add RTC battery gpio name
Date: Tue, 22 Feb 2022 14:45:58 +1030
Message-Id: <20220222041559.68651-2-joel@jms.id.au>
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
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index b0fad1153e76..d250fe8b59b4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -250,7 +250,7 @@ &gpio0 {
 	/*C0-C7*/	"","","","","","","","",
 	/*D0-D7*/	"","","","","","","","",
 	/*E0-E7*/	"","","","","","","","",
-	/*F0-F7*/	"","","","reset-cause-pinhole","","","factory-reset-toggle","",
+	/*F0-F7*/	"","","rtc-battery-voltage-read-enable","reset-cause-pinhole","","","factory-reset-toggle","",
 	/*G0-G7*/	"","","","","","","","",
 	/*H0-H7*/	"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
 	/*I0-I7*/	"","","","","","","bmc-secure-boot","",
-- 
2.34.1

