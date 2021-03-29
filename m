Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6413C34C17A
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 03:54:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7wcS2z5Tz3017
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 12:54:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=EpFbFQG3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.109;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=EpFbFQG3; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2109.outbound.protection.outlook.com [40.107.93.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7wbB6gQyz2yxc;
 Mon, 29 Mar 2021 12:53:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/nh2WIQ66w8ulJkRMl+wfRtovMEmoRZAKLPs6+ofH0ACoTKIuBXZ1MnATVCldsQByGIP4rKqe6f3U81rGHdrFh5euNVNnjc0xw6Mz7NlkB+FsATk0ZxglOOx3Bs9C589YojUDgaAQSSp145qXEZCDSKe+n9UVdtKqxqMHigXR1Nrb+LbZTlTcXZ6/uHXGbxpQSz8jSNPFK/mHad9ZpCqOuYTEYBSNi1jzyCkZ3YpnxxIGEYTbX4qX+w0Y2djKFssN62tIIUTmlZ57ieHfH8bkr70tcix5Y2gm+6voXoBXxQlvosm/RXdBZizXzb0AbgGZ2F7ond216NbiMM0UOnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29W8ho0+Xw7Kqr3NjweadDw7HfMJk04fN+WYpLmVGU8=;
 b=im5u1MrFLLaNC4g0y332Kf3NTiOHQCkWcffuOBJwJnEym7zP3ZgremgwNkhezUmm6UqCJHm/1evg094gDFYdUe6Kv8Z7vBOSKADSo/xV8FRrvjMrN6FGi918UY94PK/XScbOLzPbjQIBit/uTFNp+6XDVKI+lARgoNRLftdrx2w3DcD/Xw46KuPMhzkZqLwE+vAmQ7wpydNLIMdqlU+HVtjpz9Y5R8mSc5tYK19pAOpgLRGvjW4Y8uKTznSrMsj3aYtlwIB4MwIZbZq888iy3QEOlPtwHOi0jInGFIaHkqZF4HdK4sPSZHJUnP8tLP4kRKfbIpmsoxr1PBONl6F1UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29W8ho0+Xw7Kqr3NjweadDw7HfMJk04fN+WYpLmVGU8=;
 b=EpFbFQG3WMoPrPO489YC9QNypZ61Ky9kP0mmg2F47h1WfdCRW8UhUa7FShHy1XviKqe7RJJJAdei9puKyvMKSQFIHAnPzqk5JeFaI2e7gt1bwybjJ/n6wwVMkMRng1hISraPbk/Y3lkErMmab9vzbwj+WAO0YrPsCrOmOzpT59Q=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6226.prod.exchangelabs.com (2603:10b6:303:77::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24; Mon, 29 Mar 2021 01:53:22 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 01:53:22 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v2 2/4] mfd: simple-mfd-i2c: Adds Ampere's Altra SMpro support
Date: Mon, 29 Mar 2021 08:52:36 +0700
Message-Id: <20210329015238.19474-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210329015238.19474-1-quan@os.amperecomputing.com>
References: <20210329015238.19474-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR0302CA0008.apcprd03.prod.outlook.com
 (2603:1096:202::18) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK2PR0302CA0008.apcprd03.prod.outlook.com (2603:1096:202::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.14 via Frontend Transport; Mon, 29 Mar 2021 01:53:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 211e8a35-62bd-47f9-b32f-08d8f2556eb7
X-MS-TrafficTypeDiagnostic: MW4PR01MB6226:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB6226DD6913DCFE49ABDB43A5F27E9@MW4PR01MB6226.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QajNjZEOb81ITIh8YQYIrgPjcfplk0CLbK1/WWBHyPkxnL2Zn0raUI7uGTtpB/4RS3duW1WpFN009NSnyfTcKj4ygGMB+eIn0XQR1uYYYZyNvR1zzkqPlUi3ior7N6Lju6rLoUUSsLOoBz2AjuOmD2KZEkdMQgmHLomTx3UcGutdrwJATTHcM26RsQKE/ueTPWgA+EiWQvLJNMknGq7cCE7RZI+1xY+VGJouz8ezyHlmdA7ar0gYe4DJd99nJlwqpcFVdApaHWX6pdbyfk6npfcoULoc/Syuit7/3Wus2Dpl32kAMNQOs/nfP7LhVVkoxjmab+WK9FqbjpN+vKadRbkRx5AY4N/Hf5B2iEIjrubV+GiuQ0foGXOKwyYh6Jwd0bLxyXiCHTBGRXwPxQlij76NJwlWIEfCxc4Fa9B7/YG3R5d60XeZHRAL1V+f3ti7cSdVhlxJbAzslVHBQ5KacrKjj1LcMUovqyBn0V7/hqFKWTT7O61PGXqOytm8lSRFIA8u9cWlm1BzUkeb2RqIJuV1iZM1BZuw5q/wV/Gxkn5nmIgtMIMbMbSio5yGWNnNxLmJjC8SOTDpAvLAccxUj71jkzCh/J7zvR3lM0TjsmcQCnVqvsF1zeIEVW/qf5wdDglqa1a3FfvyI3u41wdcXVTTA7dTdDOYlGckAsHaT+s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39830400003)(54906003)(6486002)(921005)(7416002)(52116002)(86362001)(6666004)(4326008)(66946007)(316002)(2906002)(8936002)(2616005)(478600001)(26005)(6506007)(66476007)(1076003)(16526019)(186003)(66556008)(107886003)(83380400001)(110136005)(8676002)(6512007)(38100700001)(5660300002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0QGsUNbJ1hdqD4JMdYRb6dQ3LFtBM5e/KKptB/ts9cLW1K743AJu76Vuwifn?=
 =?us-ascii?Q?f9sdc1rn2lSI21afZV7IiQ5O1yVI6yFDG4vLdvHskiqbaxC/O87Mv7LDbSu5?=
 =?us-ascii?Q?z1uebPTUd/Gef/q+dF2MAQFxjTtYPYUDRX+SdmOOOezdT0uXaIQPm2GKhfKK?=
 =?us-ascii?Q?qdKnYu6Q7/ebcmsLqDoUkmx5kth/C3+YrwVCTXWbf2z+hHgbUtejRRgghcvF?=
 =?us-ascii?Q?I3mTOYqXJt0poIbKPO+t0i2MDlMG8sF5DIjJnIcqGiGuDdSTVTuZv7yaG7rK?=
 =?us-ascii?Q?0JQEdAcgdpyl93bs3/UkZ6Cclc4t7xMAoa+Y+oNrp79Yctm6KAGd3ZYnyOL6?=
 =?us-ascii?Q?LHskvLcXLOBF0H7u+pTpvpu5Y4JGC8p7oYyXY25LcIebm+oogPPtHATNlqTA?=
 =?us-ascii?Q?8LXFidKzNO3PDJ2tHj2kDAu0270QvopY7Dxvj34OvaSufzH38cP/wv2Tg+ks?=
 =?us-ascii?Q?/WHPjG9J4LfmwNlLns6q6QGETiDfb5Jj3/Ihl4bqBFEjZ4H8QiyyWqfz8Ui1?=
 =?us-ascii?Q?BXB+QE3RBl6aAk6tENJ1sBV8ON/aUbJQgqIQlEecS22wJpdKmTK6PjysnVxd?=
 =?us-ascii?Q?hV3+6qYq0U5hD+1YcnC/MRYv7++20xhn90Mh222hwkHOJNZH7X/itxWSCWTJ?=
 =?us-ascii?Q?99ME5XxGiKtWDG2fUDs4Gmiib5JYDOxX4UwSiy2uKe7jmu4/hpQbIfwqePr2?=
 =?us-ascii?Q?A75onvDmEG/D4QpGpi9dpb9APMT7CNyKm9lNjn+p6ORAK8MymyF4Ver7NHlY?=
 =?us-ascii?Q?sE7l5WpQcKTlthxSJknzVGnIKGYB89LekNXuirLld/9KhY4V+pqJYsdjE1XJ?=
 =?us-ascii?Q?TCW4wD/U0WVq5jOmNUYuMc9IGNiV4iWTzsL6Zp/41fL3pTSW5kjapSHtnYbc?=
 =?us-ascii?Q?drtBt4D1jt71QCCflxR46LScID5Sy0JH0RK6GRkCglu/DQMc0+60hmagUCRC?=
 =?us-ascii?Q?Ne565gQgJmOozkBVEtYcb6cSvKZM+ZXOT+1d/KR8a+Q2n+25gt6FLjWsAl/2?=
 =?us-ascii?Q?nsRAhdWN+QypQK2gRiE0iS55x2zLnMZuvMRProeLn2gOFLGj+yeH9xj4GY06?=
 =?us-ascii?Q?vMJx+iAmXBoxSoRpd0LaaAzwc5YcmWGdHI20+C0APJVrSnUqPwM+gwfP5B0c?=
 =?us-ascii?Q?GjmxUC2YTbHbleOBZlyxGyc0/aOIaVE+6t1evD+X0Vgk7bwP0cdABafgGOz3?=
 =?us-ascii?Q?bsMqKQj+JG8MpvPfCr4ylyx7R/826O77si33hFwsto8IqfLL+3qFlWQNHOoU?=
 =?us-ascii?Q?jwnoeAzW3uZyu9I73pUoaQodAdzjCnM9QXIF0u/KiGKagRKNr8w+CiUvJCpp?=
 =?us-ascii?Q?hhnm1aTocCH226pTAIb/R9vk?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 211e8a35-62bd-47f9-b32f-08d8f2556eb7
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 01:53:22.2686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSQt9oWvpvG00YJ7fV3KQLQEH0UxZc4yD65GNo9tt8oj2s/Z+iZccoTmwlwncHGW9B1y7Z2WVUZp1SU46jR3W31GhgAu0h3Xj9+BCkj+zAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6226
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adds an MFD driver for SMpro found on the Mt.Jade hardware reference
platform with Ampere's Altra processor family.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 drivers/mfd/Kconfig          | 10 ++++++++++
 drivers/mfd/simple-mfd-i2c.c |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index d07e8cf93286..f7a6460f7aa0 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -77,6 +77,16 @@ config MFD_AS3711
 	help
 	  Support for the AS3711 PMIC from AMS
 
+config MFD_SMPRO
+	tristate "Ampere Computing MFD SMpro core driver"
+	select MFD_SIMPLE_MFD_I2C
+	help
+	  Say yes here to enable SMpro driver support for Ampere's Altra
+	  processor family.
+
+	  Ampere's Altra SMpro exposes an I2C regmap interface that can
+	  be accessed by child devices.
+
 config MFD_AS3722
 	tristate "ams AS3722 Power Management IC"
 	select MFD_CORE
diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 87f684cff9a1..9a44655f5592 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -21,6 +21,11 @@ static const struct regmap_config simple_regmap_config = {
 	.val_bits = 8,
 };
 
+static const struct regmap_config simple_word_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+};
+
 static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 {
 	const struct regmap_config *config;
@@ -39,6 +44,7 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 
 static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "kontron,sl28cpld" },
+	{ .compatible = "ampere,smpro", .data = &simple_word_regmap_config },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
-- 
2.28.0

