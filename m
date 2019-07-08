Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E6861BBF
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 10:32:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hzGk61pyzDqDC
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 18:32:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="V8Nc6PnZ"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hzGF3430zDq9G
 for <openbmc@lists.ozlabs.org>; Mon,  8 Jul 2019 18:32:21 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id s20so15364603otp.4
 for <openbmc@lists.ozlabs.org>; Mon, 08 Jul 2019 01:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5dDBBh5wf/ZKKDSQTTNMvbsF4VqPQmM/SoWmEGDB6Pg=;
 b=V8Nc6PnZgB6sYgOVjdd5HIpJRyz3dO22DSwaA0Aeq2qdlBULUGStRHFXcZ8Ad4/95a
 +0DQ66Rct50xPoGEqwmEL1tj3/5cLyZ7fQKMDWiODpfkqU6Mm3hLela/KUl2InjRrsR+
 hdvNzenhg6s/VkwLwYvDq2ljuzYPbXfT7kS1fISP9v1O8qzp4xtts8vMFXmnRtVTDLIK
 rYyHVm/AqrV/nXeeS5ZX4RQcoNT1UPkA6QPj8nFwhQgEaesr8vq3cZ9tttEjCVYdr/BT
 2LLp3aNg82w85XYRRnvjJgkVqryaZ39vGOK8Krz59x6+A5iGm5oQEoA4vICCmsgJyS0J
 zNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5dDBBh5wf/ZKKDSQTTNMvbsF4VqPQmM/SoWmEGDB6Pg=;
 b=kBMcfiAhpiON5B4B2db3Psr0L3daPat+1HooKcyUoUyf+UW9thF5L5MhEU9DdAgPkB
 mGKv2zn8Pecbu6zLh0uRjTVkxMeJLr1P0RAnzUSzQuciTRrrElBwPIRIDr3X2VOSX299
 pMo676AzPjsd1N5by4fxjhQXoLI9TEu1Q8F4okOQ3NDdqSHhdoAIjEHROBCDyYlaH8GT
 R+dh9PSambcNDqDsvsV466lDdap9QFw1KB10udtQxWMFSuKuwYSRxWI64jx6rfZrRfcL
 rd5H/Id/0+Te8eSJuAwCB5QvD4dGVfhO4ciAQjii5gkt56XliQy3cLXNIi44Oh6jddsW
 rFjw==
X-Gm-Message-State: APjAAAXXIEGkIYrtFObC/mYnGOcymfC1Pa+aydbdMxPo9TyCni0DDAAa
 NBCQwbuxWzvnWI4BQC9uSuA3aZWxkvI=
X-Google-Smtp-Source: APXvYqxUpdMRTDqatmfjSNXwGGJ0CjAhbOndlFqwLiaFhuUyDyyMtAadwApnnNP+6jPTtwZrLYjVsQ==
X-Received: by 2002:a9d:4c8b:: with SMTP id m11mr14074405otf.293.1562574737692; 
 Mon, 08 Jul 2019 01:32:17 -0700 (PDT)
Received: from localhost ([32.97.110.56])
 by smtp.gmail.com with ESMTPSA id i21sm5577681otl.24.2019.07.08.01.32.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 01:32:17 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.1] hwmon (occ): Fix division by zero issue
Date: Mon,  8 Jul 2019 16:32:01 +0800
Message-Id: <1562574721-125584-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 2.7.4
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

The code in occ_get_powr_avg() invokes div64_u64() without checking the
divisor. In case the divisor is zero, kernel gets an "Division by zero
in kernel" error.

Check the divisor and make it return 0 if the divisor is 0.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 drivers/hwmon/occ/common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index e9d7167..15c5d43 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -406,8 +406,10 @@ static ssize_t occ_show_power_1(struct device *dev,
 
 static u64 occ_get_powr_avg(u64 *accum, u32 *samples)
 {
-	return div64_u64(get_unaligned_be64(accum) * 1000000ULL,
-			 get_unaligned_be32(samples));
+	u64 divisor = get_unaligned_be32(samples);
+
+	return (divisor == 0) ? 0 :
+		div64_u64(get_unaligned_be64(accum) * 1000000ULL, divisor);
 }
 
 static ssize_t occ_show_power_2(struct device *dev,
-- 
2.7.4

