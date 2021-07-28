Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BD23D98FD
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 00:42:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZpZR5lNJz30PK
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 08:42:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ijl2ObOh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ijl2ObOh; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZpZ60XYsz2yM3
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jul 2021 08:42:03 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id a19so2586827qtx.1
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jul 2021 15:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lo6hJcKFoOWYBZDIf76dR7Ki7GsgeuexsbCvJNO4vMw=;
 b=ijl2ObOh8q3fsDwVG6VXe2+FaZvZ8bSlsu54YntjpMDRxWU3USvH88HwEma8gSvuCL
 nBECTfLcG2r9bmA9iFOzLRsu6+qocLm5hsVe0YkWrKKfZTkzaYZMCyhPfBYc5MSm/Xbk
 hd7zX31XSHvcmGD8Ltd+gDjCkVaTvvuAP8QUgDNsHLjdva4rz0wvUp5eLpw8pnooOs3C
 eHTm5d/SxCJppKzW/4pjOVuucuePEqrZcep637yjbXIIvKVtZtIXlOEDTVuwT6fm5B13
 kOfX8k2TaZ7hZdRh46J2bdS4BGg+VWEpzpXxxUAHHWkSUsfdDKxxZZFPz159ZmXADKQ6
 i+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lo6hJcKFoOWYBZDIf76dR7Ki7GsgeuexsbCvJNO4vMw=;
 b=AnSYTbKy3MtyLVPC6SGqa4V4MKJ6EPTFtv/DxcF/FD3rsMMYzbYvTSiFSfPw5c9jV7
 RGwbhTDkO25LvYE/jl+vfoKjuQNrUm4EGE2pNmch5wRaXX9cwjc4fww3LJexBwGDh5Pl
 5r7mplGdBBjIT3tp17dootbeBlvuiwxxgjFv1y3jPKAdVPEUzLfj5qVMtG1qe4ipdZr/
 3k3B5ErMS5a24Nx/9+wmmsWSSh89IPVlbUB+SJqU3xecIVNlW5R4jgjx8f+8cxw6dbxr
 kQshhvH3jZDV1yNL+dZXfLQx98PDFW5D3FDhBiwQ7fCHPifxoOcmjUMnWG0jGA1btPFU
 Cd/g==
X-Gm-Message-State: AOAM532SyC9tZYLilw0Y3A/tbMZ8GAR9MICt52i5T3T1DmBBX6BfGBIC
 mFvN4GMrP31AEikqveIaQbE=
X-Google-Smtp-Source: ABdhPJx2vFHhf1ktZr9V68JrQiQ8eh4jMSsWuU7O5laqLi7ZQ9dRsiGF/++ftGz8nbKzPIzXHyUF3g==
X-Received: by 2002:ac8:7d52:: with SMTP id h18mr1692658qtb.179.1627512120031; 
 Wed, 28 Jul 2021 15:42:00 -0700 (PDT)
Received: from fstone04p1.aus.stglabs.ibm.com ([129.41.86.7])
 by smtp.gmail.com with ESMTPSA id u11sm730297qkk.72.2021.07.28.15.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 15:41:59 -0700 (PDT)
From: Brandon Wyman <bjwyman@gmail.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie James <eajames@linux.ibm.com>
Subject: [PATCH] hwmon: (pmbus/ibm-cffps) Fix write bits for LED control
Date: Wed, 28 Jul 2021 22:41:40 +0000
Message-Id: <20210728224140.3672294-1-bjwyman@gmail.com>
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

Signed-off-by: B. J. Wyman <bjwyman@gmail.com>
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

