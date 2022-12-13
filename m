Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A958064D72C
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 08:18:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXk9d3Sc2z2xH8
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 18:18:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=m/+DWgMf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.95.122; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=m/+DWgMf;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2122.outbound.protection.outlook.com [40.107.95.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWQ9Z5B71z2xG9
	for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2022 15:14:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaQ9Pz0XC9idKPcQWoI28jpSQ6GfTGADT4aD2PHtdM3RU6G8Zc287tW4MCy/C6lGVLPVzoRt0fHgTdLOc6s3+EWQhNNyVpCCT5tXiWGQvxuPcaVmZMq8ETZEMRX2WDGZo1qOYWLBqovZ312UoJBEkkuGgllvptJGw7HUocvcr91CwSo+YE/gREsdv7ZCrYLBRLn2BiJBukNh6qPRSPlwbBZGWD58HA1/mFbkJudjs0jf5UFvs5CMN/E8Km5o/pNGewAMnMSrX4gamn3EdI5ul1if0cSwFYLBnt7KcMqxbyx5ZWX+XYKxHpJZFgklzLeTcrlXOcBQbWPcBFr8Lv5o/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wf6uf+6ZQwdWb6sZhQCe2n7TsUhkINjQ9HHPAPKK3gk=;
 b=Ian5nQ7FLPHMVj/VkSTM/XNe3xrr+HzOn+/+Z/a6kNQ8MrLkqHvmjz8XW568ZXrfdtdL1rnZDyuKO1fw4cgDPCkynayIRrjFHTkqBJ20akHVe6X40hTqQyNNhu2ej3NCIkMNAkv1ff4SNbzLZJpKfBrepUnNzU5X4B2qRqbqNdVL/kI909eW/9iDH8xZBSXnmfPpcCarTMb7bUodC9MKxqXO+wifSUQ7wQLMeX09mlbC8T5fFF+lUX8jZaerYMWgaLvPQ+c18q891tW4MxtjS236DHyZK/N+9TrqBw2yv7WIKKwnufSHVwXg/gaOPBt81OpEG9LVuBzmMLBmY+Mddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wf6uf+6ZQwdWb6sZhQCe2n7TsUhkINjQ9HHPAPKK3gk=;
 b=m/+DWgMfPjCf1xaKCt9yBUSBVEo5tS6bQaYNOqdekexBXbVtMtGl1WG9NQs3mlqFNIlZdoD6q0ALhA+iOe50Or4KR1BcYvwaYADQFbbsXSDonxCXNZRYS+elTHlzf0ZhXvP3FXRgQKOAdq1fO3dqZVe/ypuGd6tQ/VvkVr0KMKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 DM5PR01MB2314.prod.exchangelabs.com (2603:10b6:3:9::16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.11; Tue, 13 Dec 2022 04:14:01 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c%3]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 04:14:00 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dan Vacura <w36195@motorola.com>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Vijayavardhan Vennapusa <vvreddy@codeaurora.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH] USB: gadget: Add ID numbers to configfs-gadget driver names
Date: Tue, 13 Dec 2022 11:12:03 +0700
Message-Id: <20221213041203.21080-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To SN6PR01MB4973.prod.exchangelabs.com
 (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|DM5PR01MB2314:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ce94ac-c437-49b5-7d3f-08dadcc0767a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	9PcoP0Yi13szBMxjQafnh2cxBB0lW3u5iNcGMaivXWD+1ZjMAxLHdjYnLqk4zGplrjQJiPnWVRPDOWPbJe4rv1rcThRzhEzabPXUzDjelR7xlBp1Gavfry6bUYNV6zecKlFh18xoSYg+35sMdBl4RM5z565WC+YC9fZszj3xXlZzEps5F5UnQ/VjWNtMbZp9AKu2INYlyPLcF9yC+EMjj0InNEbsI8mh+OPY4xtk0YAntWrbOOQvB8lIrVqsDfFAN2ZfntQH2Lh2Pklo6uU+/8zDjzlq/w7D4/thMeZ0Ql748J75XBuR4nRDrdISdAX50vyfaqdw1k2exUcJL1tIoKCR314KLmILKbUSp9ntqOHswCwxUVWh6lG0bd8tW31bq8mEE1/51sRfCDXinRcheswHcfZF0uUnbgWJdHpDIAlFW3VCP3VhWKrztt6YXJESy4VJryoFhYwMQ3U8NsZ/8DJ7hwFG/PxY868S877Ks4vgERVM1mELY+VxptkAjV7rYBnDy8QCi0hxTxJKw7Ls7FTRwP9LpNniq0FYMARLC2QG9zG6oP73UTpEqwhjd4jLXdQ8AEKPggM3Ozy/mTZh0UoTHk4MgAPt8vqoC5WhuJGFgT3PvTxHgSt2e/fjD0CN3eFOwig255obdPgKGzxmT64HMQdoD/nCerbqtJLhYfBvgOWw40zF30LOJT0dBQ+TMpe13aFqaV5VVc/KPQbkkw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(136003)(39850400004)(376002)(451199015)(6486002)(478600001)(107886003)(2906002)(86362001)(52116002)(38350700002)(26005)(186003)(66946007)(6512007)(8936002)(921005)(6506007)(1076003)(38100700002)(2616005)(4326008)(5660300002)(83380400001)(66476007)(110136005)(41300700001)(66556008)(316002)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?W/FF8f6D4pGY52HDNypd/vOUiWZYLntdPgegK78wQKtqw/fwfQtkMl+LkiIa?=
 =?us-ascii?Q?5f0lrULY2DVH/O2jYrVJxS/tQe6H7NRV4HuKR5P6QvUEaVqsPCKlNE0Yj3KV?=
 =?us-ascii?Q?soVAmboI9/X7Sk1jjCZgl8z+39gNl9nO5JoaOkEoRRHpG0Rt1wUw/rgNQK/g?=
 =?us-ascii?Q?ALfWlEOq1wzyuhxK/byvJLu/iOHl2Ym1VH3ZDtgXoNWxl4PMUda/JSZVBbOB?=
 =?us-ascii?Q?ZLKm9Pa5ZZBsSELYaFgM7NviGw4wt9MJFb94xAZ3LFRDxM1i+6J3vkphMGuF?=
 =?us-ascii?Q?UB8Ibnmssx06rRj7eO8pl2KdpcV/3VpdxYgFmoyNjFCyF9MHSzREzOadl3qx?=
 =?us-ascii?Q?EANPodLxctE84W27A4WvrX+VYKslBvL8lwGbtLRNg3/03Jv5KKbTiP9k4HjQ?=
 =?us-ascii?Q?scUqZuPgfDrxaY/wuek6N2XMW/1HbfAnMLLfoyX0FKLJP/Ch7YYABXo7Czmp?=
 =?us-ascii?Q?NFwO0LnwL8eQ9mAcWCrh4v1QXYK7rGp2e01Rud28yHzKyhVdnXaP7XTYCpOz?=
 =?us-ascii?Q?yocZrWiSxCHavSwJGNN/Hvus2dCgYNRFD78xMwkuhS1ACjNUgTcjTfWOauNr?=
 =?us-ascii?Q?I2SV7ZHC9rNpMFqqG3JOU5u/yD/mg/9QblWgCX1qczuJh4Hjeu/XcFaPcRma?=
 =?us-ascii?Q?b4AmeriqlvoGBbKEr15tHSmASQ3DWCv3fz5KAuQvC2agzIp1OFhldOXY1qIS?=
 =?us-ascii?Q?nUwuYJFxyc9yrVvWGqkAr3wX3athuTFoynGpxHL3bRbB1vKJQbffTuK5UJgQ?=
 =?us-ascii?Q?12WHNVNgviNE/wFYDQRd0MZt7y/XQ314MirnRjFv9eY/ykF2em5duky4BAEh?=
 =?us-ascii?Q?MaDKTCx0FT2XAC/2V+IVYnhqw7mZ56aujC/ahjpeRj6lrSAXXTgcfH+1LbKL?=
 =?us-ascii?Q?4cf86TkNfjNwRIAWggQtDJViSFR4zcoVhS3HJdoAGm+UBBV1QoZUFjjPHHK8?=
 =?us-ascii?Q?bTFjRr4ZgwZdweQh5uVT0zaxQ0Ql6OBxvtuL8pE4lyHWEaBD21Q+t+bVEevR?=
 =?us-ascii?Q?fHC8fCf4upTX9IucmaWK3woEFBDkBQBMfePWVkvSZo+8Sds+FgmjdKlrD9of?=
 =?us-ascii?Q?HLwm6CS4HJbLHaM0KLMWcrNghNUcvUxV6j3gypF59aZc67RjVCOT9d4RLUhc?=
 =?us-ascii?Q?eQXDgWESu/+gyKgSMHUatKULn05lzvZNryjGh1UXB5MBzqtZEcXc+A5ZJWBE?=
 =?us-ascii?Q?YGLMg+JEdPBF1/chOmamWTQrggQjuaT3UkEsokTdsVdm7g9fSiVW2n8k6x6F?=
 =?us-ascii?Q?5YuzEtkk042AIb/f0da3IKNPtdiNbxZnIW94UeDUZqR+ZVNxaJrHVc+sUJCd?=
 =?us-ascii?Q?TlKApKzrGWulHAEUGloiCvhwu89Ki2VVfLKyDuxMBBXNaLh33NbQPfPmkHDt?=
 =?us-ascii?Q?cbVnSf6kJ+mSCSlH8g695F4Jfcd9AvCe3tAUWVkyqwLbAn2Umf5YryRJSXGz?=
 =?us-ascii?Q?MIeC0syE4Ptcykt/BgRt/c09i+3YVmiUL9LEaiGkMd/IHS392BpKQvCTVO8F?=
 =?us-ascii?Q?RsuqqXygExrDTCLo6SEnRoTXAS5TxcpwkG5Qs5QajEMCnjmJEsACXejrmtix?=
 =?us-ascii?Q?mnRbvNUhr3BO95J8EfXCZkIvNV1RatmWmBm2QIrCab4VWEHVgD2wRlHLomIe?=
 =?us-ascii?Q?6NzxT10Bo5sK9SgSAVwjCQc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ce94ac-c437-49b5-7d3f-08dadcc0767a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 04:14:00.8416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxHz3cw9ypJfP4847d388+9vx3m+ZOih4RCq6XPG9d+iUCzcdTdvqN9JmiWrieqNFBOJu8gf+vXlEkXgxuy29lNMJQDn/X2gD9YddL7ufsj8MmhGD4OHIiVReAUA1Z5I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR01MB2314
X-Mailman-Approved-At: Thu, 15 Dec 2022 18:08:48 +1100
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

It is unable to use configfs to attach more than one gadget. When
attaching the second gadget, it always fails and the kernel message
prints out:

Error: Driver 'configfs-gadget' is already registered, aborting...
UDC core: g1: driver registration failed: -16

This commit fixes the problem by a ".N" suffix added to each
configfs_gadget's driver name (where N is a unique ID number),
thus making the names distinct.

Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 drivers/usb/gadget/configfs.c | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 96121d1c8df4..d8c5156ad777 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -3,6 +3,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/device.h>
+#include <linux/idr.h>
 #include <linux/kstrtox.h>
 #include <linux/nls.h>
 #include <linux/usb/composite.h>
@@ -11,6 +12,16 @@
 #include "u_f.h"
 #include "u_os_desc.h"
 
+static DEFINE_IDA(driver_id_numbers);
+
+/*
+ * Driver name has the form of "configfs-gadget.%d", where %d
+ * is id allocated by ida_alloc(). The max value returns by
+ * ida_alloc() is INT_MAX, in 64-bit system, it is about nine
+ * quintillion: 19 digits in decimal. Set the max length to 35.
+ */
+#define DRIVER_NAME_LENGTH_MAX 35
+
 int check_user_usb_string(const char *name,
 		struct usb_gadget_strings *stringtab_dev)
 {
@@ -52,6 +63,9 @@ struct gadget_info {
 	char qw_sign[OS_STRING_QW_SIGN_LEN];
 	spinlock_t spinlock;
 	bool unbind;
+
+	/* Make driver names unique */
+	int driver_id_number;
 };
 
 static inline struct gadget_info *to_gadget_info(struct config_item *item)
@@ -1582,6 +1596,8 @@ static struct config_group *gadgets_make(
 		const char *name)
 {
 	struct gadget_info *gi;
+	char *driver_name;
+	int ret;
 
 	gi = kzalloc(sizeof(*gi), GFP_KERNEL);
 	if (!gi)
@@ -1623,6 +1639,21 @@ static struct config_group *gadgets_make(
 
 	gi->composite.gadget_driver = configfs_driver_template;
 
+	ret = ida_alloc(&driver_id_numbers, GFP_KERNEL);
+	if (ret < 0)
+		goto err;
+	gi->driver_id_number = ret;
+
+	driver_name = kmalloc(DRIVER_NAME_LENGTH_MAX, GFP_KERNEL);
+	if (!driver_name)
+		goto out_free_driver_id_number;
+
+	ret = scnprintf(driver_name, DRIVER_NAME_LENGTH_MAX,
+			"configfs-gadget.%d", gi->driver_id_number);
+	if (ret < 0)
+		goto out_free_driver_name;
+
+	gi->composite.gadget_driver.driver.name = driver_name;
 	gi->composite.gadget_driver.function = kstrdup(name, GFP_KERNEL);
 	gi->composite.name = gi->composite.gadget_driver.function;
 
@@ -1630,6 +1661,11 @@ static struct config_group *gadgets_make(
 		goto err;
 
 	return &gi->group;
+
+out_free_driver_name:
+	kfree(driver_name);
+out_free_driver_id_number:
+	ida_free(&driver_id_numbers, gi->driver_id_number);
 err:
 	kfree(gi);
 	return ERR_PTR(-ENOMEM);
@@ -1637,6 +1673,12 @@ static struct config_group *gadgets_make(
 
 static void gadgets_drop(struct config_group *group, struct config_item *item)
 {
+	struct gadget_info *gi = to_gadget_info(item);
+
+	mutex_lock(&gi->lock);
+	kfree(gi->composite.gadget_driver.driver.name);
+	ida_free(&driver_id_numbers, gi->driver_id_number);
+	mutex_unlock(&gi->lock);
 	config_item_put(item);
 }
 
-- 
2.17.1

