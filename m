Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C31604211C9
	for <lists+openbmc@lfdr.de>; Mon,  4 Oct 2021 16:44:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNNlp4Z9Lz2yS9
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 01:44:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XAy6xseK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2e;
 helo=mail-io1-xd2e.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XAy6xseK; dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNNlQ2Fmyz2yPn
 for <openbmc@lists.ozlabs.org>; Tue,  5 Oct 2021 01:44:17 +1100 (AEDT)
Received: by mail-io1-xd2e.google.com with SMTP id p80so20513477iod.10
 for <openbmc@lists.ozlabs.org>; Mon, 04 Oct 2021 07:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EFn5wnEKAEZb25y29QzIAy3UngZkq+Tr6QhUXIqoMzk=;
 b=XAy6xseKyA85uWu1AcjgqVxdVMhk/76Z8hg+31lpt+87yEJMxXwBvO8mxmzXawd4wo
 P6gWWRtvtpImu/vCTs46kGmuSkzGNRyRhJ52TpNNDRcT8aTJhb8F3DLdKqphel/4QWsD
 g+RjodCdu7YYMvRxnHCz/PLtrDOMpCDsCfQ4F8CxnypEaYtFB3Z7h1/Ei4lP0da2cRpN
 7fW+gn7WNtNfUu4XjWvQxrj8l0gjuEiMQP7YiVfKE4yVVtjFDnrt3ueGCcWgDznoUmn0
 hH/3UuGZdwV5lJ9EtwqZv2/w9H9PWHdFZe4dKZy5oxzMJtQi+3EmBdtBjQ+ftkLg5aPy
 etMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EFn5wnEKAEZb25y29QzIAy3UngZkq+Tr6QhUXIqoMzk=;
 b=2JtYeul3zYSQk6sctJsC0/WMyXvIgezjQPpAC9Blzo2crO/5HIg4FCS+14oEXGuZh1
 VIy7oNmarrv1v/uIlCWmt4Pu1+T05BBKvw2eJt9+GLX2Cz9z6AaYwNGmmtFIqTgwl6HW
 77LfOiZI6bpctTv843rqhZgtL/Dckt866441b0Jt9HBgeGK6JD3ScjLjPbs2XBxKxpgi
 SKK2UGcCKRzFZSBCRs9CEkIX46fPm6ShgJdM2aA8krcfly8bMnWeyhQxWIZKFFhjl9Em
 8qmr8J8nnBRx1V2Y7Wvp/ygKJw3dqxEKfFv+ukOvUncE4zmF9a4jx1+5JI9J5CHzoFkh
 ZXUw==
X-Gm-Message-State: AOAM532q5O8uuoaPEBd4eeCQRRYzPkyt/9MzzzLh6B7y6VdY/TRarHgG
 B5SeXQbs0t/EJA4EMxkn4FM=
X-Google-Smtp-Source: ABdhPJwEK9aiS5cXI9Wt4cweO7upc9wAlSU/oP6P8LW313Ia3YpyQIuAlQjfAb77zbpDZBjB69QQAw==
X-Received: by 2002:a6b:5a0c:: with SMTP id o12mr9781570iob.140.1633358653912; 
 Mon, 04 Oct 2021 07:44:13 -0700 (PDT)
Received: from fstone04p1.aus.stglabs.ibm.com ([129.41.86.7])
 by smtp.gmail.com with ESMTPSA id b11sm3692382ile.12.2021.10.04.07.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:44:13 -0700 (PDT)
From: Brandon Wyman <bjwyman@gmail.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 1/2] hwmon: (pmbus/ibm-cffps) Add mfg_id debugfs entry
Date: Mon,  4 Oct 2021 14:43:38 +0000
Message-Id: <20211004144339.2634330-1-bjwyman@gmail.com>
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

Add support for the manufacturer ID to the debugfs entries.

Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index df712ce4b164..2ee47cbbb665 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -18,6 +18,7 @@
 
 #include "pmbus.h"
 
+#define CFFPS_MFG_ID_CMD                        0x99
 #define CFFPS_FRU_CMD				0x9A
 #define CFFPS_PN_CMD				0x9B
 #define CFFPS_HEADER_CMD			0x9C
@@ -34,7 +35,7 @@
 #define CFFPS_INPUT_HISTORY_SIZE		100
 
 #define CFFPS_CCIN_REVISION			GENMASK(7, 0)
-#define  CFFPS_CCIN_REVISION_LEGACY		 0xde
+#define CFFPS_CCIN_REVISION_LEGACY		 0xde
 #define CFFPS_CCIN_VERSION			GENMASK(15, 8)
 #define CFFPS_CCIN_VERSION_1			 0x2b
 #define CFFPS_CCIN_VERSION_2			 0x2e
@@ -57,6 +58,7 @@
 
 enum {
 	CFFPS_DEBUGFS_INPUT_HISTORY = 0,
+	CFFPS_DEBUGFS_MFG_ID,
 	CFFPS_DEBUGFS_FRU,
 	CFFPS_DEBUGFS_PN,
 	CFFPS_DEBUGFS_HEADER,
@@ -158,6 +160,9 @@ static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
 	switch (idx) {
 	case CFFPS_DEBUGFS_INPUT_HISTORY:
 		return ibm_cffps_read_input_history(psu, buf, count, ppos);
+	case CFFPS_DEBUGFS_MFG_ID:
+		cmd = CFFPS_MFG_ID_CMD;
+		break;
 	case CFFPS_DEBUGFS_FRU:
 		cmd = CFFPS_FRU_CMD;
 		break;
@@ -558,6 +563,9 @@ static int ibm_cffps_probe(struct i2c_client *client)
 	debugfs_create_file("input_history", 0444, ibm_cffps_dir,
 			    &psu->debugfs_entries[CFFPS_DEBUGFS_INPUT_HISTORY],
 			    &ibm_cffps_fops);
+	debugfs_create_file("mfg_id", 0444, ibm_cffps_dir,
+			    &psu->debugfs_entries[CFFPS_DEBUGFS_MFG_ID],
+			    &ibm_cffps_fops);
 	debugfs_create_file("fru", 0444, ibm_cffps_dir,
 			    &psu->debugfs_entries[CFFPS_DEBUGFS_FRU],
 			    &ibm_cffps_fops);
-- 
2.25.1

