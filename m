Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 165314D6851
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 19:10:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFYrm6jqQz30Md
	for <lists+openbmc@lfdr.de>; Sat, 12 Mar 2022 05:10:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b91012sJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c29;
 helo=mail-oo1-xc29.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=b91012sJ; dkim-atps=neutral
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFYrJ2HQPz2yXP
 for <openbmc@lists.ozlabs.org>; Sat, 12 Mar 2022 05:10:23 +1100 (AEDT)
Received: by mail-oo1-xc29.google.com with SMTP id
 w3-20020a4ac183000000b0031d806bbd7eso11349926oop.13
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 10:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IiXxyHsgfTOlGSBUBDet/+QfpWGHIGkaOs4O67rqF3M=;
 b=b91012sJtY7KuSmcUXg8KKm7RlHqbOU8tfkEkcbx+9FEZX4EIj9BrubwmW6hkWhjhf
 ZyaUPkv8QbXKFbW23ATHEJmCBP9V5zUt4BEgBJdrjeM5FucuaRusNeQ2BgkEFBknZBeI
 awuG4zzfXB975rpus0R+/RN9Ws5MCklOI7zRzqq5hvv7VIuuvdTQl1xkSqUAJlRIT9sn
 +ulJQkPjRyJQFiorMTsdnn9lmB6kKuLRKNkNYaulNY+IctlyQBxlr3NO+xukPdPwnJpe
 N5VM65FKjbUft74bX4D6H5KDwuBEyjDOZtgEZc0BPtvXUxHgCGN/eDTBjcwdNci4vzx0
 w8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IiXxyHsgfTOlGSBUBDet/+QfpWGHIGkaOs4O67rqF3M=;
 b=yr7j4+EjKnEz2AGVyTC1FSwu7kaNX/F4YW0IlYwugKAYf3CmdgVW+wR+s2edSWqzuy
 bEcTMGWy7OF7NWC6HD9gqdvZGjazEqZ0paGxkWMtnh0qDIbjEBIu+SitHC95CFzcXR6c
 /wjMBiLaTrNwriI8wzWvqmgHCbxI9TvECmpkZ5eUjc1LI1XOL2nGA1JtYZtJIlFyruvA
 gec1Rd3wDPYE9McmHT+G7GzRmvtGf6BVzcxn8xuWtvZUa29Px8qN4NeUqCRaPxEjgYIb
 8TxFZHy7zG9V+fdBiwANFrUrsoljVC7H3QZRaWcLa1B1rIAVBB/c6HTEHQS4B2hKx9Bg
 UGqw==
X-Gm-Message-State: AOAM531yuygJoXUe1xnxbMGKAbbN//gwYlqi4HZ2b0eOl3v6TvCWkKXg
 NMx8jOWfCG+kXIHp5JZqtZ8=
X-Google-Smtp-Source: ABdhPJzMyariRy8rQjTfsq0Ik6o8MYOaMiQZDQen9AtoKXvvNrfz9qRad3dE3XqwMqtDbkP0u9b+yg==
X-Received: by 2002:a05:6870:3113:b0:d3:473b:3f1d with SMTP id
 v19-20020a056870311300b000d3473b3f1dmr6061237oaa.116.1647022220168; 
 Fri, 11 Mar 2022 10:10:20 -0800 (PST)
Received: from fstone04p1.aus.stglabs.ibm.com ([129.41.86.7])
 by smtp.gmail.com with ESMTPSA id
 s24-20020a056808209800b002da3b9bf8e0sm3600917oiw.32.2022.03.11.10.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 10:10:19 -0800 (PST)
From: Brandon Wyman <bjwyman@gmail.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] hwmon: (pmbus/ibm-cffps) Add clear_faults debugfs entry
Date: Fri, 11 Mar 2022 18:10:14 +0000
Message-Id: <20220311181014.3448936-1-bjwyman@gmail.com>
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

Certain IBM power supplies require clearing some latched faults in order
to indicate that the fault has indeed been observed/noticed.

Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
---
V1 -> V2: Explain why this change is needed

 drivers/hwmon/pmbus/ibm-cffps.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index e3294a1a54bb..3f02dde02a4b 100644
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

