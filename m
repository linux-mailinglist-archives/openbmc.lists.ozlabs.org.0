Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF55159DA9
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 00:48:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HKGq27bCzDqKq
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 10:48:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HKG50pkhzDqKj
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 10:47:55 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 15:47:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="380597860"
Received: from maru.jf.intel.com ([10.54.51.77])
 by orsmga004.jf.intel.com with ESMTP; 11 Feb 2020 15:47:51 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH dev-5.4] hwmon: peci: change label strings to reflect natural
 numbers
Date: Tue, 11 Feb 2020 15:49:50 -0800
Message-Id: <20200211234950.4010-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This commit changes label strings to reflect user friendly natural
numbers like 'Core 1' instead of 'Core 0' and 'DIMM A1' instead of
'DIMM A0'.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/hwmon/peci-cputemp.c  | 2 +-
 drivers/hwmon/peci-dimmtemp.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 mode change 100644 => 100755 drivers/hwmon/peci-cputemp.c
 mode change 100644 => 100755 drivers/hwmon/peci-dimmtemp.c

diff --git a/drivers/hwmon/peci-cputemp.c b/drivers/hwmon/peci-cputemp.c
old mode 100644
new mode 100755
index 78e442f433a7..b9fe91281d58
--- a/drivers/hwmon/peci-cputemp.c
+++ b/drivers/hwmon/peci-cputemp.c
@@ -363,7 +363,7 @@ static int create_core_temp_label(struct peci_cputemp *priv, int idx)
 	if (!priv->coretemp_label[idx])
 		return -ENOMEM;
 
-	sprintf(priv->coretemp_label[idx], "Core %d", idx);
+	sprintf(priv->coretemp_label[idx], "Core %d", idx + 1);
 
 	return 0;
 }
diff --git a/drivers/hwmon/peci-dimmtemp.c b/drivers/hwmon/peci-dimmtemp.c
old mode 100644
new mode 100755
index 8ceab08d06e1..45eabd2ec5c8
--- a/drivers/hwmon/peci-dimmtemp.c
+++ b/drivers/hwmon/peci-dimmtemp.c
@@ -260,7 +260,7 @@ static int create_dimm_temp_label(struct peci_dimmtemp *priv, int chan)
 	rank = chan / priv->gen_info->dimm_idx_max;
 	idx = chan % priv->gen_info->dimm_idx_max;
 
-	sprintf(priv->dimmtemp_label[chan], "DIMM %c%d", 'A' + rank, idx);
+	sprintf(priv->dimmtemp_label[chan], "DIMM %c%d", 'A' + rank, idx + 1);
 
 	return 0;
 }
-- 
2.17.1

