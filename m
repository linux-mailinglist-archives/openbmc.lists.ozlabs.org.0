Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF874D5673
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 01:19:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF64p2ZKhz30DT
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 11:19:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=T7XZ0ytt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c33;
 helo=mail-oo1-xc33.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=T7XZ0ytt; dkim-atps=neutral
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF64L72Xzz2xtp
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 11:19:14 +1100 (AEDT)
Received: by mail-oo1-xc33.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so8784127oos.9
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 16:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U0AZdJmAf3KnMnmaCT6PVX8yffxCxk1VkTp4io1uedY=;
 b=T7XZ0yttiyIczz6uUfertqFXDorsdoEbYKOzkVYQ4f1F0sSgHVZNGmWLUQqMWopSCw
 wCpJDGiczXpAGxAsxY3eh0v/y887FlVKpRsp/JNqLeG2+Zmd5JxE911nGx+vfQEF5zM1
 +80MRU0TCJmvCYirCevEPleQn6VQTfqBeGCJ5dhEeoc1rtmnhNyGg4lyJTS0Vtk5vPO8
 8KRdPxSVo8vFGT069tWZdJOZnxS6uJ85vsdm6VJgXFM33/FzsOpM44QPc31dC4XjqRro
 UfeNcYV585i3AoBTSWSC4m1MXE/IkZ1GhXcrfc3RSUtkF1vJ839aBiR4+MZYKOwaG9dP
 jrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U0AZdJmAf3KnMnmaCT6PVX8yffxCxk1VkTp4io1uedY=;
 b=pOtGHI6sOBV7e0VjjrnqetymlKkIQsyfTGJfX4Cy0QebUQmuX2kCTbuC3n0LtIdit5
 x9/U0BtRjJx1WGv7CZyPVbansgC2246uPPOFpp/lVO9D0HszwFcfK0fvddphugtbsQ3/
 lddsbuQnq0wO1boEIr92fstkCs9IsuErxrpXf38tzSMmm63F9GcBbpSJxxO3iGsQ3TOY
 vGwTPsXxxLR66tDiYhrycjMkzaLhuTBgxgesUuvlaQXKOsrUaqmLBzPpOQeuHM1cjk8w
 EITeoqFESAoQu+nXhV/LH1TytnvQos+NIkKgsxGFsTIzpxhynjCd9qcVn6m710Be6ZIN
 XCDQ==
X-Gm-Message-State: AOAM530oOjbr6/NcZyqkSdDzkV70xrA0A1OlUBBUp3wrMtLSJxZXjPe3
 YLlfWJp0Y6tArouoHj21GhM=
X-Google-Smtp-Source: ABdhPJyiVhuWhrH8JIV4+a4K60XF6nqM1KS+9cIGeBeVK6gpoCOYo1uIgDu+V3vdeOg8/+HhKcvR+A==
X-Received: by 2002:a05:6870:590:b0:d7:b0:7412 with SMTP id
 m16-20020a056870059000b000d700b07412mr9849300oap.115.1646957950797; 
 Thu, 10 Mar 2022 16:19:10 -0800 (PST)
Received: from fstone04p1.aus.stglabs.ibm.com ([129.41.86.7])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a0568080f1100b002d71e151e51sm3211000oiw.0.2022.03.10.16.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 16:19:10 -0800 (PST)
From: Brandon Wyman <bjwyman@gmail.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus/ibm-cffps) Add clear_faults debugfs entry
Date: Fri, 11 Mar 2022 00:18:58 +0000
Message-Id: <20220311001858.4166205-1-bjwyman@gmail.com>
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

Add a clear_faults write-only debugfs entry for the ibm-cffps device
driver.

Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index e3294a1a54bb..fca2642a8ed4 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -67,6 +67,7 @@ enum {
 	CFFPS_DEBUGFS_CCIN,
 	CFFPS_DEBUGFS_FW,
 	CFFPS_DEBUGFS_ON_OFF_CONFIG,
+	CFFPS_DEBUGFS_CLEAR_FAULTS,
 	CFFPS_DEBUGFS_NUM_ENTRIES
 };
 
@@ -274,6 +275,13 @@ static ssize_t ibm_cffps_debugfs_write(struct file *file,
 		if (rc)
 			return rc;
 
+		rc = 1;
+		break;
+	case CFFPS_DEBUGFS_CLEAR_FAULTS:
+		rc = i2c_smbus_write_byte(psu->client, PMBUS_CLEAR_FAULTS);
+		if (rc < 0)
+			return rc;
+
 		rc = 1;
 		break;
 	default:
@@ -607,6 +615,9 @@ static int ibm_cffps_probe(struct i2c_client *client)
 	debugfs_create_file("on_off_config", 0644, ibm_cffps_dir,
 			    &psu->debugfs_entries[CFFPS_DEBUGFS_ON_OFF_CONFIG],
 			    &ibm_cffps_fops);
+	debugfs_create_file("clear_faults", 0200, ibm_cffps_dir,
+			    &psu->debugfs_entries[CFFPS_DEBUGFS_CLEAR_FAULTS],
+			    &ibm_cffps_fops);
 
 	return 0;
 }
-- 
2.25.1

