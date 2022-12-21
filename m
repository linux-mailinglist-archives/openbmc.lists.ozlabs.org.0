Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A421E653A10
	for <lists+openbmc@lfdr.de>; Thu, 22 Dec 2022 01:20:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NcrYG420Kz3bdV
	for <lists+openbmc@lfdr.de>; Thu, 22 Dec 2022 11:20:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=kN1xSIvz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.127; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=kN1xSIvz;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2127.outbound.protection.outlook.com [40.107.244.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NcSS45Ylyz2xJN
	for <openbmc@lists.ozlabs.org>; Wed, 21 Dec 2022 20:14:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmeIpAdNReuCKEKgiPVu5L4PHnye3TtkR2C74j2aUtsRH0cMnSJrftcYukBUBIk2BkgEZGGdwawM97p5dRTvuCFqyEniElWAx8s995G/DufMBVlffpcQMMZKOSblN5PslK6I5cPXuWRZv3ki5cByBi4YTYOTm0Fu5EtLLrUgs6+v//gfwyHbsOX2LZML/As0by83QfVBfrG2jsbdwnLqy0Siunvp397Mf6Tci0s3xpWfhUl1BwTQ0R8sY5WfB6nWQBvHMl1CGxn8YJvQRcpXTnXJgIaS/7VFiTBEyLkpjg9LZlIOF8xybvxSUfVtHc1durp5Js2ZiXljT0YppExyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BG9oHxI0rE9qx7uAKf3D/ERZbbtozXzvp62zKaIBTE=;
 b=lnn5R/5tYKJnOAlz4mGDnDyrx7/H1zREh8jvT9/zLO1+1m2JAR7yRtLuIY7MWtb12wsRTdmPd1pyJw20owrHjAP64f4+rF4bAWV3ak+PxtkqN86R1JXStmkGp1T7twe7ReojJmKwTQvuJCxzN2lgGEeSwIQd9vOdfKCa4oy/38LKVsLqFgnkYcFVTd5g0u5jz0caLbU2iWnMssWf0P0LWLZ2lk1G8puF1VrNLTDADw3WaVdESaeEuDDC7vHWVkKbQx5lK500pVKtvmpEwHn5JacjIM83B0/9l1F6dfW18JZdduxCnM+tm1lnfvysgpcc3Quv9LBklHnrYY3KV9BUKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BG9oHxI0rE9qx7uAKf3D/ERZbbtozXzvp62zKaIBTE=;
 b=kN1xSIvzuBmpFjdcVZB2dSKUXRqQ/buMnHDfB19qlidzi57JN6OXW1GW3mzYgJ6UBWQU+dQgmIlDMGBKN+ILiilXRB5N0HtfztnQWAXnmaT2a/QvFR7D/5/31N2nDRPqWDTK6KQwR/qVf93lQwrMR8XIRywAsteZfpkNsP6KcjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 PH0PR01MB6764.prod.exchangelabs.com (2603:10b6:510:7a::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.11; Wed, 21 Dec 2022 09:13:48 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c%3]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 09:13:48 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <frank.li@nxp.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dan Vacura <w36195@motorola.com>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Vijayavardhan Vennapusa <vvreddy@codeaurora.org>,
	Rondreis <linhaoguo86@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v2] USB: gadget: Add ID numbers to configfs-gadget driver names
Date: Wed, 21 Dec 2022 16:13:17 +0700
Message-Id: <20221221091317.19380-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To SN6PR01MB4973.prod.exchangelabs.com
 (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|PH0PR01MB6764:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd0dbae-b99e-454f-aaba-08dae333ab1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	L40nVs+8+TyMj6Tamtodiv7xNL3HArTburI2ZnDvX6rnvvTzKZ1NVtlN5VEaD3yG3LvjU6kOpRjCe1ZS8Basdk+j9qq9AQh+YNMyNu4tmKObb85yK1Ywbi9CzxrzV6hkyMF/rsjFBe6Neop998NUnxKC2fftn8ehE9w30xjf+uY/dtvb58qQKGmg+WXlTvS5SGP+GhLRu7J3WR6MX8CClduMhr3nf3gi+EEgtoFuWyncQiEGXtOn+nTmN6fQQpPy1JdVLHK1PVDNAZ0WlM5FVREstRxXC8G9tLmLX8yo4ZxvxM92vvZoCz2ovhQr18d6dRwC0CgKbaPKuokAnlhYWpvYaCL6G7ayZ2lJOKE23MD0Sh3MG5BamxAdvSXaPx+BAbRg+XKmmh3Cnmf/1X1EOQARufYMXQrZWIsPkS+m6W9XvmQQGu5tzysx3ZGg0G6hrk9WgFB6At6m3AH4MiGPTr1dGGaa2/moLkMl93CnQG2Px0m71NuO7/tnXisaJkMJtpMz5Mx1wPW32RuOnf4773itTdPgauaTG3rdB+rNwJnGt37iwxWpi2WrpuVo3Qz4qY9Cq/7yql2mJljFCE0/FBJlkO50ahiVr4zNHnqZ0Yhk9bMJASyFqlXdDvE7m4QvYWWTxv3rFS4pmqPxMtlpCleE8AX66jMv43jyTSxKbb3LaUEuJqmrYlVb1/L9h9GFFG3FbNAsq1G6YbvyzKAijw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(396003)(39850400004)(136003)(451199015)(5660300002)(66476007)(2906002)(8936002)(41300700001)(4326008)(921005)(66556008)(86362001)(66946007)(7416002)(8676002)(110136005)(316002)(6506007)(26005)(6512007)(186003)(52116002)(38100700002)(38350700002)(107886003)(6666004)(83380400001)(2616005)(1076003)(478600001)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?AeDX5soJfO6MvPUfeVamrhluIls1DSxMRbeSaYd4BGU8s42aCab7TO4SJQNt?=
 =?us-ascii?Q?hrOQW5sSrTFy5xd3t83YH30VxoOhpuQunAtKDg8rE/7DALR1qYeFpAvzr9TP?=
 =?us-ascii?Q?WN+BZSLIpGihdgj814anPUyqRkHvoCzrWfOxoMTFGPwwJ2T2tf+w6HFFUGAN?=
 =?us-ascii?Q?BBKeh92Xn7grOCRY02m6ka9D6b6TL+Ysha1lQpwWzFz0Y1npq7Y5jmoRAr6k?=
 =?us-ascii?Q?zNzLXG+3+Jyb/k+9KxRjWi7kbX/zLhDZHqJbpXoXQcA1KcFyt8KRWiX0o+hT?=
 =?us-ascii?Q?rHHOJdqlECKnokpfvxn6TiJLJlncmGp2JDlO6c9awgfq7AofCze+93kxeL+4?=
 =?us-ascii?Q?0pvvPChK0/pXFF0ud2IgDg33w6suYVi48NhGniiDFx4CCPyxoVVb7CCu78WE?=
 =?us-ascii?Q?nWaV13ISNDE8Q0aAWJ3A/4fhp63NkAUT9YcRDbnUXaQmJ2hD3f4ezSIEQY92?=
 =?us-ascii?Q?m7Q7CCksfJ5L2+9mAP2vcZTzM99QfzKmEufVREsNARRn85jf/KqRehkQuhqC?=
 =?us-ascii?Q?9JJpHzkHlhNAqLa3+3Kgl6hUneu6Eroj/CDKwEpUNZls9lFCNLxav2snRPHA?=
 =?us-ascii?Q?DD9RT7nKVFZDJC47fytYDC0RodCxVTEmnT6h20DPFBQQGY45MdUdFcWfqgUN?=
 =?us-ascii?Q?wq0VYMa5PhfUCwbohnFZiqmjv7B7O+zHKnYQiXB/dsbKI6oyRHZu/sTftPBy?=
 =?us-ascii?Q?5xuhIeX+m4lz33G7j67fCzTiGXn1mD4/nAsW8twfcqysMnOjyXqMFov6G8+L?=
 =?us-ascii?Q?+su9Z+hQRr+GL2phBalf4KiCVy9RVe7sWp3D0J4yXsf+PhtdFc+2JMDuJrb0?=
 =?us-ascii?Q?7zmKv1bd60wySPkyJ0uEB5GtdZz/E6y5+ATgrrqko5ERzxJX71oJq0cmJGzX?=
 =?us-ascii?Q?9mI1ukfa0nf/mMJ0uLTj0y32vUuzNq2f2oi1rafVSyzqV/K12qD27IgP+VsQ?=
 =?us-ascii?Q?eXsWje2uklVfx0OpuXf3HYeePp5LqY5FXx3NLyWNCMZYhZu41weyTyH22pX0?=
 =?us-ascii?Q?CJDqU23DdDscpwG7d0WGub2sQ9K2U/G/w4jX6+yknNUDOhJfuRsaG4KfN1ET?=
 =?us-ascii?Q?M6aEF9hk8jCNhHKP40LvMFIBREmxW3JTxFgeY8s8qMBf3/aw3kxP9M9lL5ED?=
 =?us-ascii?Q?iTMXFzAsufRt2JW+jJwq/McSj6p3MTm2RbUAPq6r+9g5NPvndDom7WK1yGsM?=
 =?us-ascii?Q?DldphmxBBkVkNUO4bSZ15bnI9xW6DE04xqsnHoatvuTez9dN3ngHgPJZRGO5?=
 =?us-ascii?Q?4oYvd0puF6dDJVpHsEmLLKVzR8Z5w7C/kn0sq5f0/EXDVBWhUli8vragv4LT?=
 =?us-ascii?Q?Plk8yq4cdqhojG3ITeZurZ+afoNMNcR9OkP4TqrK/ni24OZxjTgd0lRtHGsI?=
 =?us-ascii?Q?m5CwKQsz4CpBeFTCgL7fYUJa0fsc4CojPpXuwETWaqIQu66sNFzCDmzA8HFZ?=
 =?us-ascii?Q?qXG5G0SMDJx2/zm5e9mXseE7PCLaygye+kmSJmxtdzJodJcuKyw3G6NtuYIy?=
 =?us-ascii?Q?a2P3edsma9eOHX/XWQlmUANyAGyPoRr6lm2+Eibk5FDMz5T+94k5CDaMh+9H?=
 =?us-ascii?Q?ojD01kOy2Mi+2YKSRVPOYaxUWv1uABOHeHWwvJX4aBo/szIHG8s4QlZRkahS?=
 =?us-ascii?Q?V3xm/ZHS+CCIlrQOMBp2Xy8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd0dbae-b99e-454f-aaba-08dae333ab1f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 09:13:48.2975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSRu83wmTOVQDrCdtgNHuD/aGjpdBAcx8vVxrjsVSBbHkaaSgNFKaFnayNiHRAsUtlUAyXKXuUQE7iHPsL/0PH06iNNo22dqQHjN0UIWBArULGpTwIFnZpo3epk90j2f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6764
X-Mailman-Approved-At: Thu, 22 Dec 2022 11:16:45 +1100
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
Changes in v2:
  - Replace scnprintf() by kasprintf() to simplify the code [CJ]
  - Move the clean up code from gadgets_drop() to
    gadget_info_attr_release()                        [Frank Li]
  - Correct the resource free up in gadges_make()   [Alan Stern]
  - Remove the unnecessary variable in gadgets_make()    [Chanh]
  - Fixes minor grammar issue in commit message          [Chanh]
---
 drivers/usb/gadget/configfs.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 96121d1c8df4..7faf68bfa716 100644
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
@@ -11,6 +12,8 @@
 #include "u_f.h"
 #include "u_os_desc.h"
 
+static DEFINE_IDA(driver_id_numbers);
+
 int check_user_usb_string(const char *name,
 		struct usb_gadget_strings *stringtab_dev)
 {
@@ -52,6 +55,9 @@ struct gadget_info {
 	char qw_sign[OS_STRING_QW_SIGN_LEN];
 	spinlock_t spinlock;
 	bool unbind;
+
+	/* Make driver names unique */
+	int driver_id_number;
 };
 
 static inline struct gadget_info *to_gadget_info(struct config_item *item)
@@ -393,6 +399,8 @@ static void gadget_info_attr_release(struct config_item *item)
 	WARN_ON(!list_empty(&gi->string_list));
 	WARN_ON(!list_empty(&gi->available_func));
 	kfree(gi->composite.gadget_driver.function);
+	kfree(gi->composite.gadget_driver.driver.name);
+	ida_free(&driver_id_numbers, gi->driver_id_number);
 	kfree(gi);
 }
 
@@ -1623,13 +1631,28 @@ static struct config_group *gadgets_make(
 
 	gi->composite.gadget_driver = configfs_driver_template;
 
+	gi->driver_id_number = ida_alloc(&driver_id_numbers, GFP_KERNEL);
+	if (gi->driver_id_number < 0)
+		goto err;
+
+	gi->composite.gadget_driver.driver.name = kasprintf(GFP_KERNEL,
+							    "configfs-gadget.%d",
+							    gi->driver_id_number);
+	if (!gi->composite.gadget_driver.driver.name)
+		goto out_free_driver_id_number;
+
 	gi->composite.gadget_driver.function = kstrdup(name, GFP_KERNEL);
 	gi->composite.name = gi->composite.gadget_driver.function;
 
 	if (!gi->composite.gadget_driver.function)
-		goto err;
+		goto out_free_driver_name;
 
 	return &gi->group;
+
+out_free_driver_name:
+	kfree(gi->composite.gadget_driver.driver.name);
+out_free_driver_id_number:
+	ida_free(&driver_id_numbers, gi->driver_id_number);
 err:
 	kfree(gi);
 	return ERR_PTR(-ENOMEM);
-- 
2.17.1

