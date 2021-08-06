Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0BC3E31F3
	for <lists+openbmc@lfdr.de>; Sat,  7 Aug 2021 00:52:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhLMX6Q3Zz3cHQ
	for <lists+openbmc@lfdr.de>; Sat,  7 Aug 2021 08:52:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=U3oMmwKA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c34;
 helo=mail-oo1-xc34.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=U3oMmwKA; dkim-atps=neutral
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhLMH314wz3bY0
 for <openbmc@lists.ozlabs.org>; Sat,  7 Aug 2021 08:51:54 +1000 (AEST)
Received: by mail-oo1-xc34.google.com with SMTP id
 h7-20020a4ab4470000b0290263c143bcb2so2627417ooo.7
 for <openbmc@lists.ozlabs.org>; Fri, 06 Aug 2021 15:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mxn7llJ5mZ0hc2ANTwcNCtoQg7U/UkmI/LGIHOAc8EE=;
 b=U3oMmwKAQziuR7DJ97t0wQ0+qI2imBrqiFWvdXM0cBnNVVlRy/jfZJvUaKQjUnEwUl
 aD2lAarJtc2qGWZHpFDjKwL+tEdPXUOB3PlSqrhTDRq0+tvVfd8IzgSDgWX9IE4+TKRS
 xF/fk5nlTN15q/S8nhLRH/ZS7f7SJqe9BRzXkGXz5I9CAnzWKPJdL75akvyipojo5M2O
 psLE9dq5Di0H9h+Fds5z5ZDl9FuNOcFPSu938dx1zUytGSqCWW4VSNyxolZjzcWusm4u
 bzPJ2UxU/A77wKPQvnYFOTy3DooDqoYU55NHMe5VEXr5fBHzt1Oz+kHcsqVVNjhoUJ54
 1ppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mxn7llJ5mZ0hc2ANTwcNCtoQg7U/UkmI/LGIHOAc8EE=;
 b=eOzIPF7ElQoofJ9avqBBSR6TGpEBEck5lcavrxaSaFSLYk3It0K3k/hUIwO5/KUUiJ
 l2ogm8jANx8bxMQFf1rXZcVC2DDy0kgK3E455VhP1kW1KfMzNF2VNCw2cUjvm9Z7FOpc
 M2whF5N3QH/uZ2VctgkgRaMAVeS4cN5lfkiAHVT4xi/rwmahqj+di+M0i/r0mQdvVdmt
 GcSmQYhzFbhvAtelzGPI0TXAPKLaB4HySoA/6+06+GSWQ5xT0voIXZnw5upOGsie4FTJ
 Vwlwsp5nvJC6mxLvbX3giw9MUpmhUYAgLlgwvqYMK+WKHHm08PNu5SiunaNabr2e/gmx
 MWYA==
X-Gm-Message-State: AOAM532ypZpaQOApdWH2bdI7bw+qIVHqOblHaKN4ofLjhmS5pqbd9+/q
 XYvZPArrarlByjVJc1DLUds=
X-Google-Smtp-Source: ABdhPJzEiY/mdoLGpKdu+X5ieV7KcHPjb6jgu4o6xwcrppAhlvDaotoMJjqXIn3H8Ta4eO6R7PWrKA==
X-Received: by 2002:a4a:6507:: with SMTP id y7mr5598750ooc.38.1628290309336;
 Fri, 06 Aug 2021 15:51:49 -0700 (PDT)
Received: from fstone04p1.aus.stglabs.ibm.com ([129.41.86.7])
 by smtp.gmail.com with ESMTPSA id g1sm1783966otk.21.2021.08.06.15.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 15:51:48 -0700 (PDT)
From: Brandon Wyman <bjwyman@gmail.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v2] hwmon: (pmbus/ibm-cffps) Fix write bits for LED control
Date: Fri,  6 Aug 2021 22:51:31 +0000
Message-Id: <20210806225131.1808759-1-bjwyman@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: "B. J. Wyman" <bjwyman@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: "B. J. Wyman" <bjwyman@gmail.com>

When doing a PMBus write for the LED control on the IBM Common Form
Factor Power Supplies (ibm-cffps), the DAh command requires that bit 7
be low and bit 6 be high in order to indicate that you are truly
attempting to do a write.

Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
---
V1 -> V2: Use full name instead of initials in Signed-off-by line.
---
 drivers/hwmon/pmbus/ibm-cffps.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index 5668d8305b78..df712ce4b164 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -50,9 +50,9 @@
 #define CFFPS_MFR_VAUX_FAULT			BIT(6)
 #define CFFPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
 
-#define CFFPS_LED_BLINK				BIT(0)
-#define CFFPS_LED_ON				BIT(1)
-#define CFFPS_LED_OFF				BIT(2)
+#define CFFPS_LED_BLINK				(BIT(0) | BIT(6))
+#define CFFPS_LED_ON				(BIT(1) | BIT(6))
+#define CFFPS_LED_OFF				(BIT(2) | BIT(6))
 #define CFFPS_BLINK_RATE_MS			250
 
 enum {
-- 
2.25.1

