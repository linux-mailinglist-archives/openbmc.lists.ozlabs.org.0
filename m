Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3055D4DD11E
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 00:22:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKNT30yqqz30jZ
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 10:21:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M7g23SMX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c32;
 helo=mail-oo1-xc32.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=M7g23SMX; dkim-atps=neutral
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKNSc2pnyz2xrc
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 10:21:36 +1100 (AEDT)
Received: by mail-oo1-xc32.google.com with SMTP id
 h16-20020a4a6f10000000b00320507b9ccfso8339830ooc.7
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 16:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cV2G53aQ8gy5xgFrzeVM67TOnDJP6UFgv7JOAg+ZKWQ=;
 b=M7g23SMXsoBSpy5meppRZhZ9iJd6A1uiBr9hvVMVpqk+LXXZx6qHDtr5tv8/j5pqXl
 18GJFWFYcUiH8MfsMi05vmvsjihNU6mF10W/KnfcwystkmUCBfcHc3Dzelei1Dv2kyI3
 9LhhVYktOShrLdOw4kqCJ/cOlOAkM1C1+kzA/Uw93daCZYZaHrpxIQq4LB4w1eLL2rSe
 vu/DLza6h8iMKOUrFA+LYcKYBfb8X/5zXDwDYP7ZRCUKjry2F8oeEzUxHHdBeW0Chje1
 GTEVVwGXVwXMuFP0sDOqDOaGErYFIDJ7ejZYdgkkwtUyBhwf94QX16auJz1djyhta7P4
 SsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cV2G53aQ8gy5xgFrzeVM67TOnDJP6UFgv7JOAg+ZKWQ=;
 b=wv/OqCpUiBqGSEXgF3EG/xItQQ9vAdY1VkJ8nBdtyBx+qi1AAzeRwIj0mgVgou5CV1
 qyfn64D0BeGPTvxMf86T4FOlNOrHlXjXbVxIlGcsRN+5quSavGInhGj74bCsVySEmp0M
 O0xuNc7P/yir2bXGsG5CLV5SwwnlKtHrqGgVF5VMpjyPr45iOEwnLqqUbQ56tDZ0IBfs
 dfucTc9ZkSTu6PuH6BIKK/xfot0oBNLR12cnszfWW8TaeNdeTcDqtsc0HQxXn7S31s3a
 jO39qzgIPtHKjWiSlaR3eeUeHBuEpmAKyMqRCpIW65mkqLKnyF5gJcnqXEbFTjXv3pYV
 dtOw==
X-Gm-Message-State: AOAM532IaI/zXEglu6rsnz4hMITrAaEP8JkJyMHER4iRfXXLHRUHfoTG
 QE2yopONw5dPAUcS0LfMD4k=
X-Google-Smtp-Source: ABdhPJxJ+l9rTlCJYd2wVYy2pwNS7uAh2Sp5Ne51ph7mT/7XNCauNvYRHmWpLePy55iAhu00t0gKlw==
X-Received: by 2002:a05:6870:c10b:b0:da:40b:9d92 with SMTP id
 f11-20020a056870c10b00b000da040b9d92mr2800341oad.31.1647559292787; 
 Thu, 17 Mar 2022 16:21:32 -0700 (PDT)
Received: from fstone04p1.aus.stglabs.ibm.com ([129.41.86.15])
 by smtp.gmail.com with ESMTPSA id
 2-20020a056870124200b000dd9ac0d61esm2869159oao.24.2022.03.17.16.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 16:21:32 -0700 (PDT)
From: Brandon Wyman <bjwyman@gmail.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus) Add Vin unit off handling
Date: Thu, 17 Mar 2022 23:21:23 +0000
Message-Id: <20220317232123.2103592-1-bjwyman@gmail.com>
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
Cc: Brandon Wyman <bjwyman@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

If there is an input undervoltage fault, reported in STATUS_INPUT
command response, there is quite likely a "Unit Off For Insufficient
Input Voltage" condition as well.

Add a constant for bit 3 of STATUS_INPUT. Update the Vin limit
attributes to include both bits in the mask for clearing faults.

If an input undervoltage fault occurs, causing a unit off for
insufficient input voltage, but the unit is off bit is not cleared, the
STATUS_WORD will not be updated to clear the input fault condition.
Including the unit is off bit (bit 3) allows for the input fault
condition to completely clear.

Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
---
 drivers/hwmon/pmbus/pmbus.h      | 1 +
 drivers/hwmon/pmbus/pmbus_core.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index e0aa8aa46d8c..ef3a8ecde4df 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -319,6 +319,7 @@ enum pmbus_fan_mode { percent = 0, rpm };
 /*
  * STATUS_VOUT, STATUS_INPUT
  */
+#define PB_VOLTAGE_VIN_OFF		BIT(3)
 #define PB_VOLTAGE_UV_FAULT		BIT(4)
 #define PB_VOLTAGE_UV_WARNING		BIT(5)
 #define PB_VOLTAGE_OV_WARNING		BIT(6)
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index ac2fbee1ba9c..a0d899dc81f0 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1373,7 +1373,7 @@ static const struct pmbus_limit_attr vin_limit_attrs[] = {
 		.reg = PMBUS_VIN_UV_FAULT_LIMIT,
 		.attr = "lcrit",
 		.alarm = "lcrit_alarm",
-		.sbit = PB_VOLTAGE_UV_FAULT,
+		.sbit = (PB_VOLTAGE_UV_FAULT | PB_VOLTAGE_VIN_OFF),
 	}, {
 		.reg = PMBUS_VIN_OV_WARN_LIMIT,
 		.attr = "max",
-- 
2.25.1

