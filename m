Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 371536654E2
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 07:52:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsJJx0Jqwz3cFB
	for <lists+openbmc@lfdr.de>; Wed, 11 Jan 2023 17:52:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=V0eRHeMF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.106; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=V0eRHeMF;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2106.outbound.protection.outlook.com [40.107.92.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsJJK63c5z3bWj
	for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2023 17:52:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jmof/iZIDirGeaR9roY+CTkSv8C9a+EO1ePR1p7RwsMamtX/k382tuEqIkCHwkChi9lKQBBUy1Hy+dxLzhIMKRx9iqfAs9eOWh/gyyuTAN/BhZAQcEcg/BpMgxrb/2Y9EY8yFyc8/z7uWFIyxjqQsef/fZCrYVhkq3F8qs9ZpWP8udiUvTyZftf/VNLQrhMoO0IcDCgUC+ZRhz4I2ayk6VmLuSvTTYwyyg2A2X+MDwQgVLi77fN+8rcjGe1pp600a1vAByVIzSwr/vLjJMwj+6/T/BGXOMozHuCaOdhflAm9LUQQSRpT8vpoChopE142AIE9dHbDM9Z1YklMcbCrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=om26t3Ueiey9H2rV3vbCzTVJEZutbaR4nfV8Chp5Xl0=;
 b=Ua0nP9Ir4k97GOqUDDHbfpTazuikowbSqgqqHKWRtPuPr3YHsiahYyzqrYoX/Vw/XjlrZDnbbuzihtuPykcR78H6QWYYpNeg2GKNPMG8fpFDZh2vQsXoN5/8uy8Fa/q8cSVKRb4h/DMUDoMU9fd5nC1Q/53v30HEOwzhkiAdcF+WwcjYDfAuHGhkGAxLw0813msYIfY3IL6LHXFuXPJHtWUoX8dFI4CrHESfsWmrFirTPSfdHFzpX0xaqpGsZNhbyqClUG6lLiIayHKsVj2Yls4jFlnTVaHSADGTZ6r3ZHQJ+MgTJ9OqBRfUWw7Q/bGCx/w+78aCzBTFpQ8b+qK2mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=om26t3Ueiey9H2rV3vbCzTVJEZutbaR4nfV8Chp5Xl0=;
 b=V0eRHeMFYQZTjWnFXADmDojPhUxNxggyIktEfcf0lgcle5jG/RyFZqgEOZcaUqZ7e0D4NkKOHdFx2cG+6cS/9JR+Cb6E+RT5ZHdZUWux0HsKxeYWU4DQb2kVS8EnqtRFJp6gGDpwSeY+tXqpNeEl95ZW5qSIXarpCFLBS16mNVo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 MW4PR01MB6227.prod.exchangelabs.com (2603:10b6:303:73::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Wed, 11 Jan 2023 06:51:39 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c%3]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 06:51:39 +0000
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
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v3] USB: gadget: Add ID numbers to configfs-gadget driver names
Date: Wed, 11 Jan 2023 13:51:05 +0700
Message-Id: <20230111065105.29205-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: TY2PR0101CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::15) To SN6PR01MB4973.prod.exchangelabs.com
 (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|MW4PR01MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: bc3a3f07-0a24-459a-6e5b-08daf3a049e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0xUBr0ZB8sCvEK41ceBosfh72ULqexIDw4XVJDJzT95xf/ylR4QtLHWWomZMO88x6xUI8gwDkS59BCAwXoXaGwMruilV2q1c7Duokubsd95FLC3FAibIXnlsdfZ8GiRJO6RNiOojb3PLcOKXCYPsya3z4ZOc1FVVOq0qJQ1AKRhkQeUV1Pd/mT6yOAy9zJOTEEm+YWfFydSqS4KxUX6mgRWVFsOBEXwIiu85u/BhXHNyrCjCAstQgpWa0hMNhM8F2x012OdPCAFsMJDbg9FsR8CnUnLNxlzaDDYXvFecqLYshsHEYDVsc5eHRyAhtpxOoP6VPtkjyZfJ/YLhlgzync3z8M9xCDRqHUIr1ZitWd9VXKyuBOV9PEffi0M9BIKy4jitg01Pfr36MJmCmscEf5Rn5MUSP8R8IUiIXHFfcONBJGJYn5VWkr4knUwdTx6D9xycLXU9rK+38v2L47CTxgMP8IC6OamQHFt2R0mBKRhx6msMeRWHsAJ6nqi9GuDGB/wzkc/7dA6hzu4CMZadRi1pB9ay0QuUWPCh5REqFmPlo+J3zP7Kd4l8FsNSvgbUGNKFQMH5D7B4KEpLmne3Q3mHhlh4nhXUWzEa3icJyl9QOIPiuTUqjs/uFJpC934z3GLlTTVt0MugZrO4hJAiFQlCtz7Hd92TqRCtKyb592mjWYbDuce1Roc7G/ozHpdjDLM7DfJuZFTvcNhF9OTheA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(366004)(376002)(39850400004)(451199015)(186003)(26005)(6666004)(8936002)(107886003)(6486002)(6512007)(6506007)(1076003)(2616005)(66946007)(5660300002)(66556008)(52116002)(66476007)(7416002)(921005)(316002)(4326008)(86362001)(38350700002)(38100700002)(478600001)(8676002)(41300700001)(110136005)(83380400001)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?pn7YFhgmSTnZFTpJKLLQBeDE9kM02qvfb0qvtAMrTac9OD/Ku7ee7hz++MAx?=
 =?us-ascii?Q?PZkMHjDEjVsKGeSRLAhVGg9b1Z54UHfhRJXbsug57e1x6IBs7E2igK+TcNU2?=
 =?us-ascii?Q?V/Ln3wCt13bNQnEAQDMDrrxRmEKiJOqvvblZ06Q3KITcruHr66sYOfIEyDon?=
 =?us-ascii?Q?SUwNGjyRY68LdRB5pKzNprZmLr1ZVBZV4bB4EDJKWndxUeJiXFPHuhZRG14l?=
 =?us-ascii?Q?aDr5aZvI7cqRmho5ib5n/LiHFjVL1X5LcLqu2B1fCbXTwlMwHSLTd9OOBCwU?=
 =?us-ascii?Q?EY/+Pxm4ZdcEWE8bC42Eqv5m7N9Czxh9l16e0xZQu84KoFlt82shV+JRDScT?=
 =?us-ascii?Q?Z237RhtRg9qAMR0597aaD7BNV2sAXA1GWJEctqu6bZzi8sQ9obX0wMliw6sM?=
 =?us-ascii?Q?aiLhp7zmU0lNGnF1g1u4/iCWhYA+kqaH3KjZOj0VsVpdMVkroQh09Nziyr3s?=
 =?us-ascii?Q?xm3Bgs56zUfqyA7pgqu7YxI1fuXJUDc7YkRAgGb9sxpvxcJc8m3mW9OKrHUC?=
 =?us-ascii?Q?b3vPxqfnBNYqD65vgSG5cGAderLd8OU3t35Vtm78A9nqIuR1ZV5VHoG/82VE?=
 =?us-ascii?Q?y1vCjaKfVh65HNJHDJlgSJB7YBZM0COKl/17xl7zlqIff1J+XAKKWiEjLZVt?=
 =?us-ascii?Q?7FPr4SczrsKbJBalUpGl1oin4EriTfqFFAmG0chflOqp+kc3eaALPe3hgM+A?=
 =?us-ascii?Q?RnLu8eVzvGtfWw1mLizSmI1dgcL9KxevupqZbX/zHbvrEIabSlKoH7GYQLeP?=
 =?us-ascii?Q?iuc5EedIpNMClc0Mmci/cy1Vlfu5s01hBvF0wXmasZXzxTjnCw0NFwGPZyUA?=
 =?us-ascii?Q?pMGaXkKXl6vlgFgdjBDBGlV+eQxQyEYNY+1n9w9fZhYSJ8jfiWbIO9dnIa5g?=
 =?us-ascii?Q?LCTPnLw0O6Ku+Avmrc0lHi1yphv+kCXg1PBRhJrcnUrSAA57z1l7NSlirMVN?=
 =?us-ascii?Q?qBJT1hr31/EdGuTmbr/XlWXv2Js9z08jcq2UXQvLJ8javE5NdWGTVZnw64Tz?=
 =?us-ascii?Q?VhP95CMTQj8Lw7a6Q62ew9DI8NmjFC2NcS2xgUW5hhcHFu9zARsV0IYRfxXC?=
 =?us-ascii?Q?SF7jOggWKu+zRehSV6153dPxOQBrB5aXlB9PIp/M1WO3/g1gdWsQt1qv220v?=
 =?us-ascii?Q?eJSNEJViT7q+JqjTqlRlo7ndXPs6VsniWAPheTodGXYYaOrw9+8nZ4mlargr?=
 =?us-ascii?Q?5WLOwsLtjvF7XaI6W1vdstMrzml7a/S4odBoIVSDIZEFPlRzsuNWLwugJCMJ?=
 =?us-ascii?Q?diyRGExz0tLEbgfBfKmcNOC8Twwczekf5cqFxSDLu09Aac2ATJ8efKodVa7d?=
 =?us-ascii?Q?UYXbqqDnWDIPwg8MFtqucIqkUAcdb/Q4dGHn3/iOpdCzf+W418ZARr6Rbkgw?=
 =?us-ascii?Q?J0XKGmIHUCUV+nnev6V0BGynL4O632RptsZwdi2obNobhmAepF78kaYnbp9G?=
 =?us-ascii?Q?Z7CoBGXaphJzL4aaRGGb9z/fKDfc8bA8qQOd2NjSq5RjlYCEENZoP6/RAaze?=
 =?us-ascii?Q?m8iaon3wK4aMJ8DAE8EAlajakQFa0VOW/tzGv4BfrdT+hAEYyXBk+NeDdBF7?=
 =?us-ascii?Q?gn33uG02c/fSfBs3iN3eKJekC7HzK3A06Zghhx3qOwpYB1fMuGr0UfOr+Z/j?=
 =?us-ascii?Q?CCBqIPZorM9bxrOqQZVRzFw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc3a3f07-0a24-459a-6e5b-08daf3a049e7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 06:51:39.0473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNNzUb/fwxluSkgL+Ogz3OoGRunETpJpvMari/gySpwe+bDn1vgPlJB8DeqTN8OrlSalm89yWhc70HMmB0HNf4MLpVq89VXvVmRBGOVmY2BhewYRHvRTXasISA5vfb/h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6227
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

This commit fixes the problem by using the gadget name as a suffix
to each configfs_gadget's driver name, thus making the names
distinct.

Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>

---
Changes in v3:
  - Use the gadget name as a unique suffix instead     [Andrzej]
  - Remove the driver.name allocation by template        [Chanh]
  - Update commit message                                [Chanh]

Changes in v2:
  - Replace scnprintf() by kasprintf() to simplify the code [CJ]
  - Move the clean up code from gadgets_drop() to
    gadget_info_attr_release()                        [Frank Li]
  - Correct the resource free up in gadges_make()   [Alan Stern]
  - Remove the unnecessary variable in gadgets_make()    [Chanh]
  - Fixes minor grammar issue in commit message          [Chanh]
---
 drivers/usb/gadget/configfs.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 96121d1c8df4..0853536cbf2e 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -393,6 +393,7 @@ static void gadget_info_attr_release(struct config_item *item)
 	WARN_ON(!list_empty(&gi->string_list));
 	WARN_ON(!list_empty(&gi->available_func));
 	kfree(gi->composite.gadget_driver.function);
+	kfree(gi->composite.gadget_driver.driver.name);
 	kfree(gi);
 }
 
@@ -1572,7 +1573,6 @@ static const struct usb_gadget_driver configfs_driver_template = {
 	.max_speed	= USB_SPEED_SUPER_PLUS,
 	.driver = {
 		.owner          = THIS_MODULE,
-		.name		= "configfs-gadget",
 	},
 	.match_existing_only = 1,
 };
@@ -1623,13 +1623,21 @@ static struct config_group *gadgets_make(
 
 	gi->composite.gadget_driver = configfs_driver_template;
 
+	gi->composite.gadget_driver.driver.name = kasprintf(GFP_KERNEL,
+							    "configfs-gadget.%s", name);
+	if (!gi->composite.gadget_driver.driver.name)
+		goto err;
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
 err:
 	kfree(gi);
 	return ERR_PTR(-ENOMEM);
-- 
2.17.1

