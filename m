Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 385CC963EFE
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 10:48:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvZgR58Jmz30Wp
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 18:48:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724921296;
	cv=none; b=H0goUxOAHyuriJ9chbxV//oBYJrV1KoL0h+q83K8TaejGPBieLQbAcnuWAEl7I2rdE8or18wH9pOInvsoN3ZK4gq20n0YOCyIhP2/TQWsedOXNBERdITzZsTBeiKrSG+bhqnMzykTjOGW/FXspIjrSr8bpSx60hqzg9ayB5Mh/88LtSjqirkvN7vE4GaYrj9Ve0AqPIdY4hOA4MFzDBr1pxl7+cTEJqrWf96F5yGTXP7r+de2gkgjscZeC7CWxoGW8fJ8OIM+alXFQTKKYpCqDQq/X4UoDqVCdk0n3wOmGLJp/ckBSj4ws4reptCNWAeAdEitGEcrFTnLhBgWlBDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724921296; c=relaxed/relaxed;
	bh=GG81LAGDpFJiGRfxBSZqetvPquvef5Vqmc7bke5SAow=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding; b=STsGY6rAmYMDsIGIfH6i0kdChawSGsH+VlAwO9OzNtwQfE+h1JS3NRtyJrX9vAN3gySgBngamiPRVA/WUnV99lzLF5hmv8YLTDDGMkrR4VPHe8sc/mSpyu2A3lMMiKNTyvXi0E8hxjMmJzeKpgE+r+Q66xm7LZ1FGZ4fEeUs16/63oAmWhY64+FPhwzltle55JiSw3jFCSGbf4jl6ti7Q9Qi6xz0y/Klq2ZWvliNSZogPdNtekluz2bqEAzRvzmYMIiCogjRUgCvLVa7HryKxS3lrzCxRd4/ducBkbcnT4ODUAhgG8iXcvfC4c8KoJ/urKBib4SQT+J7Edjn6XLTXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f5oThppi; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f5oThppi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvZgM4PzKz2ytV
	for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 18:48:14 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20223b5c1c0so3753865ad.2
        for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 01:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724921292; x=1725526092; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GG81LAGDpFJiGRfxBSZqetvPquvef5Vqmc7bke5SAow=;
        b=f5oThppiRiydaBG9KkIa5m9J3EsEZX9SAt5L7Ea+sgpto/NszmtoiW+enExwtJg02Y
         AzeYCBrcP+KAi6E86UDdiU2Xo30K1peZz7zn1oIIDyewsn+eWVY2JuM9zAMRoSDHp0pu
         g2OJ3SFGsa6ma+gMMR8CFom+CtvAbziLgpQw3wE1lbYwkq1zjvK6YJ09Evfi+zdWmsZ4
         PGs5EqpC5W5YJ6kfN2Bj74Bp9L3V//PBaU2upy7zeponh8xRWN4JTgBPKPm7vnD3uxXB
         Hc8reg7aXsfVlfaQncUOlSlWtma3T3fwwxO3mHcdgBCp2YPbr+gokonVYUV+fxHOudc8
         +fRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724921292; x=1725526092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GG81LAGDpFJiGRfxBSZqetvPquvef5Vqmc7bke5SAow=;
        b=ilpW+Xcy3yDbvJH5hhU+JegyKr1vc13EVTe36akhnYY+Gez8b8KhKLG8CFFre0VgWf
         zsFIKDUH58am0tMRLrRVRUFp3mx+VYOqvgNQaIAmv06hSYy/mJ5ZnSjGbtAG30itmxQf
         FA0K23pdLQzMBpJtEF1FJOXdxhvCIpCDFqTtAO6qGTNWQPt/unkl9LAcVrqG8zkdxlGx
         NFeOSxx9SH5OEjU9D9P0K8bdtRssohSx8hR40tnuZWiAXS92cshf6aZu8ANNDF8HgTLs
         w6kPwsbKomoXG8TlzuljyCE4DpppHUV0F3bfxMeGA9H26s+09kXmo6509xUG317Tex7i
         SINw==
X-Forwarded-Encrypted: i=1; AJvYcCXjTpvb832WZxfTTLEqOxSLRfjB1l8JiAv8oSR9GJdirS+M+y3T5ydggqzSoHX53JcQZw53Hy1W@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz2+e0oR3cKb0q6RbpByg9NC00HiaNb4LdojSCqN3MDaqTnnlh6
	Kr2hHxYaTMWk68IEmeOcM52PvxNs4XSbxoS16t2w+A6fsKea3YuX
X-Google-Smtp-Source: AGHT+IG26XBu6T+LkCNVJ8UBYRN3MpQu5Dsj9UgTbt0bXnKMs3/nTjdzx9dehGrarIu/iIp4xnlKQg==
X-Received: by 2002:a17:902:f682:b0:202:27ba:3639 with SMTP id d9443c01a7336-2050c21705bmr24526095ad.10.1724921292164;
        Thu, 29 Aug 2024 01:48:12 -0700 (PDT)
Received: from cosmo-ubuntu-2204.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1225sm6935785ad.22.2024.08.29.01.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 01:48:11 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.6] hwmon: (pt5161l) Fix invalid temperature reading
Date: Thu, 29 Aug 2024 16:41:20 +0800
Message-Id: <20240829084120.656973-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: chou.cosmo@gmail.com, cosmo.chou@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The temperature reading function was using a signed long for the ADC
code, which could lead to mishandling of invalid codes on 32-bit
platforms. This allowed out-of-range ADC codes to be incorrectly
interpreted as valid values and used in temperature calculations.

Change adc_code to u32 to ensure that invalid ADC codes are correctly
identified on all platforms.

Fixes: 1b2ca93cd059 ("hwmon: Add driver for Astera Labs PT5161L retimer")
Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
Link: https://lore.kernel.org/all/c16f3254-36c1-4ec3-ac09-ca15ed547413@roeck-us.net/

Change log:

v2:
  - Fix build warnings of dev_dbg().

---
 drivers/hwmon/pt5161l.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pt5161l.c b/drivers/hwmon/pt5161l.c
index b0d58a26d499..a9f0b23f9e76 100644
--- a/drivers/hwmon/pt5161l.c
+++ b/drivers/hwmon/pt5161l.c
@@ -427,7 +427,7 @@ static int pt5161l_read(struct device *dev, enum hwmon_sensor_types type,
 	struct pt5161l_data *data = dev_get_drvdata(dev);
 	int ret;
 	u8 buf[8];
-	long adc_code;
+	u32 adc_code;
 
 	switch (attr) {
 	case hwmon_temp_input:
@@ -449,7 +449,7 @@ static int pt5161l_read(struct device *dev, enum hwmon_sensor_types type,
 
 		adc_code = buf[3] << 24 | buf[2] << 16 | buf[1] << 8 | buf[0];
 		if (adc_code == 0 || adc_code >= 0x3ff) {
-			dev_dbg(dev, "Invalid adc_code %lx\n", adc_code);
+			dev_dbg(dev, "Invalid adc_code %x\n", adc_code);
 			return -EIO;
 		}
 
-- 
2.34.1

