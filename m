Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03721367D3D
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 11:09:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQs7K6cFtz2yxY
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 19:09:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=cnNLGntc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::701;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=cnNLGntc; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::701])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQs7308syz2xZG;
 Thu, 22 Apr 2021 19:09:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIDYf1pgPLR4YVudy/Cvlr7c8uqHpEhPu7jQERd3LSVO7e0zPFfHvHCe2xUfrvzBI77MRzRh1W6zzh6kOsHZywvSdHAcf+gLcWAxWOD0e/iDkWnIcHsTtC2QcXdOZ/qUqMPK7Q1wSXkf1p2hun7j/20IN4YxlwrkNwsaaNClzHlD4O5MLyUuiEHBrI+Vj3Pc1EmbEURSYGIf2IMb3cQiVcW0H44Z9/Tb6SPRHMmfrJpxmiawDzWCpBQAInxQHuKFEzTlmeRewAfCn/V9xlhdNpUFjNFYt0z5ChIoWRHXGAxhjqNSlxEZiLhwK6asI/oLXSnd8vWDVRLyvdtPAMyytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kE2UKDyZ8sOR69NvZ5WjaBSZYr62tBaW+JbNtO+8UcI=;
 b=ECeXe/R8aOYJA0LMYQVWetRVHoV1q9/G3r0fHZ23+eSBEotUsKHpsYsTX8ul8tK5yKFzlmw4AwVrnSTRUU+wzbSpYMZfISWnDZMhYyRqE4IolOUyZQUXd1cbxdAGpl2RuhF6C0QH4ShbazCDq3jkHspLhci1I+v8LisD41YZSSt3cukH5iaWkcLi5I5dW4qD2rfG6mnIM58ZMjlfthod0SigzyAPKAZY2xc1HIMM/458xgYMckk6pfBv1FvqTYt5fZH2JDN2ZFHurglOCqsZyzHQeVyoti+MYoXkYJ18OcVGL/+a9Z5E7ktwgjA7SsDUFX97m2F87MLuEL3f9wcKaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kE2UKDyZ8sOR69NvZ5WjaBSZYr62tBaW+JbNtO+8UcI=;
 b=cnNLGntcVFaLCSfLDeqVkUA5TRxUxrWXKI7NGtvWNfF4dePjmq5YWeUpRagtPjlScMWxuBlBRDrBd2YD5KR0YYguNSrzNny0YSN2onlvU++wrdX6mAfdDGwFaa38Sa5ca7FDQ8SgAy8631QFDCzMnWdB9F6jHO5WTwPAEWRWkJo=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6356.prod.exchangelabs.com (2603:10b6:303:66::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Thu, 22 Apr 2021 09:09:06 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 09:09:06 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v4 0/4] Add Ampere's Altra SMPro hwmon driver
Date: Thu, 22 Apr 2021 16:08:39 +0700
Message-Id: <20210422090843.4614-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:203:d0::21) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HKAPR04CA0011.apcprd04.prod.outlook.com (2603:1096:203:d0::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Thu, 22 Apr 2021 09:09:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec1a848f-8b64-4c25-f467-08d9056e47b7
X-MS-TrafficTypeDiagnostic: MW4PR01MB6356:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB6356413D2150CCE40BF0E345F2469@MW4PR01MB6356.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1w+fWBM4pumegkEI4DVbGv0CwjxTB1ZS0cNNiqkPxhci+Jp+Thy5glJxRD8Xh8ukM1LJrVGBndBDTSMl4bfxyEmXA4iUmoCH2Z2tBV6wTyyhSrVFcHPoZYnKPte0q3NWpZJLpOQTjUqtcQdiXPVwMMM9JKdjIn3AuAqSfQE13kPP5IY2tRTxUytcGOAtf5/g7aej3n6X1GkA7R5OvjJkigz4GV39Qre0jzNzHUM2BcM1tFlTwCZ42wD4gXpqyblDlTJB2baHGb3gwcLLsMzpV6cztfnj6Zj0PUhANQoILr8uPdvg613LlPVvhRWkaCz4AoOvfKtEOi8Z4WHaNmVlVepEmnlcTnxQvvBysG0UcfmPsp1LhIC/s6Fzf91o0aMoj+j8mh68kPyE606PAAElT6uJ3K07sZzPcFFOO4d7W5L1hqDTvXO8TkW9eYWeHDBB75qpSAFof3ocHkDk+h0R75lGsWByXxCCIBX3YoBnSW5f3996tkz4xrMwfJi7/+//QrujfyoWoKTaWFVJc1+c4qG3iaZ3j4vs6TFC+pV+vDNJmi956nIn1n1RD5qzJPVGNqKdKr6u3ebQLR1OxoHFM8hslVjaQOdkiAG/0Vmx7XJJ3BCMppDrg5erflI71frG090QmE5y6bQiDEKM0FklOYJv758wKYqoRFyGGUByMbc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(110136005)(38100700002)(26005)(107886003)(5660300002)(86362001)(956004)(2906002)(6512007)(1076003)(6666004)(316002)(8676002)(186003)(83380400001)(66476007)(4326008)(16526019)(66556008)(52116002)(38350700002)(921005)(7416002)(2616005)(8936002)(478600001)(6486002)(66946007)(54906003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BJDuChUXH8rEHDgPjTxxnSKbIYpFXe57EBVQgJCpXHqGMbrPm+upAO1XMC6K?=
 =?us-ascii?Q?DFdl+g+sokiNt3ooaBAn6pm7GLx8IHW1bgueY9aVMtA3QOl/BaREGxXt1I+8?=
 =?us-ascii?Q?8M5jRzV+u/nNTDYEnw3+Yb97w4AOwvBtDXD0N6CIs6IUR9d4HoVW2J1yQz9t?=
 =?us-ascii?Q?INqG5L1tizuJARPJtJKz6pnEOkFqkMWzMqBr+c6qcbjej3o4zIkURBUjHBLy?=
 =?us-ascii?Q?PUUBRGMOZzsI+dx7lXsCnrIngbARcE5snpF5oclI20nYGv91WFVUKRYWVoWx?=
 =?us-ascii?Q?P6pUgordQsYrxMk23o+BhdKcbic3KG78RvyFNLjcGa3bYQG3gwwlbwL6K+r+?=
 =?us-ascii?Q?YJ0hSFJW6aVPZqx9eSALkdh16HdWI4NPL67Pe+HuX/eZYBMpryBmkuWEvP0v?=
 =?us-ascii?Q?j0nCS+ihrcWRnMaEiYesjlJsrQtz7Ivf2Wp7TD1mude1qH0Q1M+xVzjAymen?=
 =?us-ascii?Q?6ysqEEC3js8xJgMC+rQvkboztd54uEYGG9bb2GnlUJHExHx6wtxjeH1u8wvg?=
 =?us-ascii?Q?VngEm1yd2yu3FESvGvuu2HJGhhfjv9eu5eUD99sUJbPWNp4nSS7iVQFX+Jti?=
 =?us-ascii?Q?0IdYOYdk93IEIvTIqVU1nmTUJWpc0Xkb87b65aoqtdK0RhbN2DgKlp+3CdOW?=
 =?us-ascii?Q?ZjdWYxX3eKDmWYnYzLG81g6Pd5fRe83Bxim7Ai0GIU7dXcGhHKVmv2gu558g?=
 =?us-ascii?Q?bU5AHQGrgsFln4sr+18kD0itwSGPIvymq5fvzKVLx7WKGN8754V+eb1YXqXa?=
 =?us-ascii?Q?PKAgEN3hVKU9cxHgwzUmnDRVADMevTx1lQvBPVFh5yjSIDxHsSidPFk9Hzmz?=
 =?us-ascii?Q?GuH+m0go92SaB2BClQT1sVWHL2vttX48hbL9b73c4a94FabTrTUjroP4aYX4?=
 =?us-ascii?Q?prEhl7gqchF/tatYbhg6zZnDjPQw7PYs/tmKi7RnXEAmSsBlB7cwuP9tdowO?=
 =?us-ascii?Q?4NMOJYMux3Ji10OriIKRjsQhWjElqCyV3drVZK9go0l5i147sLXy/+lOvJED?=
 =?us-ascii?Q?69b+Up37ppKnoVIQQP5qvzFn2gthzHEeBuYrqRSfaZE0fOL1ihbpGmRwk8Fb?=
 =?us-ascii?Q?AH4dc1wC2GCQENPf8sT+25+LESVvMPPy3+JYz8e3/71z9a2EY7gzglDMqdyS?=
 =?us-ascii?Q?Ixbx73kHfH9r0UyAecVDX49ihFid7N923i2Uty+kddAOTZsaPPjvJQH1kb0k?=
 =?us-ascii?Q?JivO5r0omInUrvLnEVf3I4PpQIfZKKeWZzZTR2XI64xitaUMqFhlMn0pTR+V?=
 =?us-ascii?Q?Gg3WZ5q+O/MZe8vNW4K+WveVGsH+rcT++hfGxd9NZxygR/nYPB/a+JpCjubL?=
 =?us-ascii?Q?5lWmj/hy+TMZS0mKzDVGpWMn?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1a848f-8b64-4c25-f467-08d9056e47b7
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 09:09:06.1682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1dt9penD5mILxIHAeJPwuZpYReWdN1YuMBiw1lmSvkNyFuLeRJ+djNmfnmUnStEHN45/e1a1kI3PsnNRODm0PRjgAci9/59LNn/TpMFEFQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6356
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

This patch series adds support for Ampere SMpro hwmon driver. This
driver supports accessing various CPU sensors provided by the SMpro
co-processor including temperature, power, voltages, and current found
on Ampere Altra processor family.

The SMpro co-processor on Ampere Altra processor family is to monitor
and report various data included hwmon-related info, RAS errors, and
other miscellaneous information. This parent SMPro MFD driver creates
a single simple register map to be shared by all sub-devices and leave
all the specific to be handled by the child drivers.

v4:
  + Revised commit message [Quan]
  + Fixed build issue found by kernel test robot [Guenter]
  + Returned regmap_read() error code [Guenter]

v3:
  + Supported list of compatible string [Rob]
  + Introduced reg property in DT to specify reg offset [Rob]
  + Updated description and other minor changes in yaml file [Rob]
  + Handled negative temperature value [Guenter]
  + Returned -ENODEV if Manufacturer ID is wrong [Guenter]
  + Refactored smpro_read_string() and smpro_temp_read() [Guenter]
  + Removed smpro_write() function [Guenter]
  + Added minor refactor changes [Quan]

v2:
  + Used 'struct of_device_id's .data attribute [Lee Jones]
  + Removed "virtual" sensors [Guenter]
  + Fixed typo "mili" to "milli", "nanoWatt" to "microWatt" [Guenter]
  + Reported SOC_TDP as "Socket TDP" using max attributes [Guenter]
  + Clarified "highest" meaning in documentation [Guenter]
  + Corrected return error code when host is turn off [Guenter]
  + Reported MEM HOT Threshold for all DIMMs as temp*_crit [Guenter]
  + Removed license info as SPDX-License-Identifier existed [Guenter]
  + Added is_visible() support [Guenter]
  + Used HWMON_CHANNEL_INFO() macro and LABEL attributes [Guenter]
  + Made is_valid_id() return boolean [Guenter]
  + Returned -EPROBE_DEFER when smpro reg inaccessible [Guenter]
  + Removed unnecessary error message when dev register fail [Guenter]
  + Removed Socket TDP sensor [Quan]
  + Changed "ampere,ac01-smpro" to "ampere,smpro" [Quan]
  + Included sensor type and channel in labels [Quan]
  + Refactorized code to fix checkpatch.pl --strict complaint [Quan]

Quan Nguyen (4):
  dt-bindings: mfd: Add bindings for Ampere Altra SMPro drivers
  mfd: simple-mfd-i2c: Adds Ampere's Altra SMpro support
  hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
  docs: hwmon: (smpro-hwmon) Add documentation

 .../bindings/hwmon/ampere,ac01-hwmon.yaml     |  28 +
 .../devicetree/bindings/mfd/ampere,smpro.yaml | 105 ++++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/smpro-hwmon.rst           | 101 ++++
 drivers/hwmon/Kconfig                         |   8 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/smpro-hwmon.c                   | 491 ++++++++++++++++++
 drivers/mfd/Kconfig                           |  11 +
 drivers/mfd/simple-mfd-i2c.c                  |   6 +
 9 files changed, 752 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
 create mode 100644 Documentation/hwmon/smpro-hwmon.rst
 create mode 100644 drivers/hwmon/smpro-hwmon.c

-- 
2.28.0

