Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6168350AE0C
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 04:48:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkzPT25Wdz2yb6
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 12:48:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=WE3v305u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::715;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=WE3v305u; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::715])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkzNF1xYyz2xnF
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 12:47:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ap/VEWHUE6+85bIifep7VDNftLWRosucg3nGPUj+EXBELIRj0fsPbyKD0WSYkECamcpNpLuVBCAGYKtN1ptaVIhp4I7xOtAy1DTYTWjbJd0qkrfD3EtvgL6b6oTx6bJNg+p7jMDy/5ZiTv5kj7VEpbNK74CCKfyolMq2xE4WptLvHBET56zQ9UdXpa2DJFljP2p+8IqL9B7WSxSUOg9WJDzvY/U1k6ge59fi+jCtwRnFLaZVjhw/2Jn1lkb83v/3LxCUOy/bV+PCqLEyKIBpwS6QLMLns8oYxXcSzTfSPDuWDl10++hJofVKQztRsdRUPN8mAmHxYPwt4AvM/Vgunw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Di4c3G+nkTz60rGdAqg0n9+ZMfkpd4f8R5UlLlKdOTs=;
 b=mMLkUQ9fEolPch/QyzR1isJbXv07yhzWhkdnC3WuR2zPW0X/WZFPPx/K9e6+j2+/brhbUDXbLFO0/4esUMgAp33cBk5qhWjvV//EYyWdu2XYSYhL0c9xXcCfu0aNId7toSFZm96hxwYZCMA4AkrIgNqu6FKohoCnI5zttTuOT3h4XwyhrLYQxMDjtG7tua2zzMr9LYIrR4yutHStY3WDWe7hYrQzRW7+dHAfdQqgtgDpjQnudghKjHJuYbkIpDhs+5ZO7lnUEqhTwVjrejg1kcW/pOoyaW2vMbN97RR6L/sGwvkoDYR2XqmQuwyL8oTPmycNmFn33v+3AdmVEwdNqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Di4c3G+nkTz60rGdAqg0n9+ZMfkpd4f8R5UlLlKdOTs=;
 b=WE3v305u7vFsLuFO8FgfHsEYXEb7OVtGrsKagr/oTcQJmLhO/Tpa2WX05tULZge3qV+kuuC9vJ0jXyxblxSPkNGU3QzRKGKQVniMsQoiDCvFZuSHopobu/pqhnUTaKCG+b4RgR8TbrppyeojAxKtNh5Cj5h12NjmEZnZ7tbvCGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BN0PR01MB6845.prod.exchangelabs.com (2603:10b6:408:14a::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.13; Fri, 22 Apr 2022 02:47:13 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 02:47:13 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Thu Nguyen <thu@os.amperecomputing.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v8 0/9] Add Ampere's Altra SMPro MFD and its child drivers
Date: Fri, 22 Apr 2022 09:46:44 +0700
Message-Id: <20220422024653.2199489-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::10)
 To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9885009d-d035-45ca-4d06-08da240a679a
X-MS-TrafficTypeDiagnostic: BN0PR01MB6845:EE_
X-Microsoft-Antispam-PRVS: <BN0PR01MB6845F9B465DC13B05DA202A6F2F79@BN0PR01MB6845.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1mdc9b/0rV3Ay3rXRU6E6YzFlp6OLlaV5N+JZ036zcvCUea5bWt3Fe17IFLu2vq3/uj8gpomr79ddJ+5HxmYqxeXaMtZwYrY4PjNY+8vl7kukGXAoVhu+E0NBg3r0oqHREamEl3ReC+vQc9l1isF/fD55hdf5llYXQSvEUOf07hNrSYONjsqrEbEXj8GyNXd5C6HdLqQw7bP9sDaeEWgtsAgDlR1avRBH0Mmo4K/CZVDR1bqxJtH+FnuDS4Yoj0pnQWIcdAiPOyyDlExpQj/3r7VxWajFNu59PAhE6SET/vc1RduIRKmCdimzuu39H2Fcnpvqt2qruZpIukdkBsWHxgBldkp7s19xaaElOVMGKSMl4N4A0MZy+whxj1RuieTvHSH5qDvS9V3OJC/4qCniiQSeTtk7/O124L5gRz0gSRWaNVcfWcx1hMbEln+Y70ILstYnFoFdAZo5uNi2GQiQXLpGcQwLKHPvY1wKZQ25pwSLqyEzRLCjMJpTTTMOHO6XYuvb/kdyzFnT/+7bhf4JTSOv4OSEW6oGMc32i24v2v0D4z1pD+EXsxzpJDjlC7h0UbZGb4hrX/KvtDa6yrr/gpcX0Q8cWehNNAd8LRz1avimi3rDeIcyGvDG6xleUxBpTKH2WIvOpEGEFr7u59ylY12lwESGYZ/R6y0d0EjQilCi85Yf4TU+QMgcifXqKX2Uge/Y8fD09D98J0bZScwGXSQof3yUeb4904/EHbycxc9i7AnDSz/0zl1sGE6yB7afyv2O2zTLke8bdA/nnf/HeSXX1lkB8mda52aYHMM6M6E6UZSyPPUB9wNFf8PzPSD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(316002)(8676002)(6486002)(966005)(86362001)(38100700002)(38350700002)(8936002)(508600001)(5660300002)(54906003)(110136005)(66476007)(66556008)(921005)(7416002)(107886003)(66946007)(1076003)(83380400001)(186003)(52116002)(6512007)(2616005)(26005)(6506007)(2906002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gL6nKr6jNUs5HEXa3lG7kp1pXRdwLnDUWKthJO3Ae7vjqeuyC8f3SOL4XdqY?=
 =?us-ascii?Q?CDnm53hF5MJWOFc/gNsoqvNhxCRqeOzmKOwOr8S756FQsvUga/4zI9v8A1FN?=
 =?us-ascii?Q?vrQTFV7HtWMRKeKpqNHbvbfK0yh3OUcGFvWm3g5zHsLxAHSgDqsOtUASRSDv?=
 =?us-ascii?Q?S59ZqhjbE3sW96ugVlydNONBBiztRYtufC6ooJS32O9c1pHLpypCcUZhtEs0?=
 =?us-ascii?Q?0NMzA1XKDgyk8qPkQe8tTcasudhzzSfUEzutkuyxABniK8rpzBJZJ6j9M8L3?=
 =?us-ascii?Q?Tv6gd3ckxky/NI97lVE7iHhwYM6Xa+oAT88NghYUAA7eHLB5Z+91U6kx5KFF?=
 =?us-ascii?Q?uWJgGdiF1aX2j1Fwodbx9dEKWEki2vm6gTOJfRfeOzQ0kBfHP8x2B4jLs1QA?=
 =?us-ascii?Q?1ZvAdumotTkTerQtTwnHtGCGl/eWp4tKO/0ZsaRUWyBmsBJRQQ1BtjCZBWnW?=
 =?us-ascii?Q?H2QBXHr5VLyl9RTGfUExbPOdsvKJ/CzsxYBp8lspastPcDTn3GdP/oOIrTBS?=
 =?us-ascii?Q?X8qmh0ECSfp7fzGybtuyLIuikf6ukznjHhthk+QnAQ9toGDXO6c5YpF0jfdt?=
 =?us-ascii?Q?Xwn9q1U04gqngkM3hCpvRQKwFjRfn8NXiuCh3kqWOIRU0HYbxP4e480CyVr1?=
 =?us-ascii?Q?0w2D0ooDhloPXziisoYHOYA28mcEypDR4F0LCSqZZm/ovYUIIrk6FO8D+71X?=
 =?us-ascii?Q?zwqJYXs38ppWL6lT48q1V+SCWnLTRK2+j97iYo06QMu3Uq4lkDlpj6tq2+Nh?=
 =?us-ascii?Q?t/9vwf7DRSPwcWT+LxzYpeFNFz1b/wKfwkx9LJpe0bqvC1o7qe9ahVBexAec?=
 =?us-ascii?Q?LTAW8zN8t0O+6rXkpzpnwgO0cDs81vJJF66AxMK8zSO0XrG8PjGzz7bfQFt1?=
 =?us-ascii?Q?10k+n/HAwOp8o1hhFXMcuvg1K3i0dU7DVphH9hOrQrmFVp/jD+LVLq1wT4j/?=
 =?us-ascii?Q?obZTMEmpoKlIzDne/QOfOxz+9TuHG7bhAvZfOoMQSu0dQVWOeDV23Wl9CrzS?=
 =?us-ascii?Q?t+iEAnfn6E2CNxut3u8GF6hXFWQm6WYgG/tSVhoGld9BCkBJe9Pxo1wSoqea?=
 =?us-ascii?Q?z2FeCgRYsM4Y6mQZIzKWdfseafowbe9Vzp6OiF4k26gc64v8JXGCM/i/iLyQ?=
 =?us-ascii?Q?DQj7+KlCNCdRFOHoBpS43zkUcAdEV8osGLRrF/ozJhm4alVy2774E1Ty/J5A?=
 =?us-ascii?Q?6eg2sqJ6H4GKMc9V+I/G2R4+5sJH4v7lCHzsDLHWkNp6wY+iPq5xpXrargGq?=
 =?us-ascii?Q?H2mgFEcGRf0RQfpCmhiYX2i+gUzWTO3CQr1s8s7vVxpwKqcis+l+ozaoWVLM?=
 =?us-ascii?Q?Yoz9GDDP2Wjqb/J0XYLsbSuem5Gix3VnhvVM/8gk2VkQMyA6yI4u9KWhGZop?=
 =?us-ascii?Q?uGP8wrfa6ZrvNxA+atSI6pBpI7B5tQn3mGmnfdNQziQnX7XQXyPGei9z6Lbo?=
 =?us-ascii?Q?6Fg77zN8NL8BxbRa9yw1BvUED2+fDSDs7rPtUR5Jx0y8uK4fGgtuNDVsC2Tc?=
 =?us-ascii?Q?k4zB3CTAle/4M3jFPvp/fOAUxjw1d1AnZVhCJGxViPo2/KEcAKLSgKTris2+?=
 =?us-ascii?Q?vVRO0096++IHMSgWCWp0G8WZTldqZ4cPOTqQylQejI8EID/xxN9ykhjB1DSj?=
 =?us-ascii?Q?6+HaAQfbmIKQ54w+sYeTxdevFOc6qMZ+thVj6kin4HKaXSjePB4ctZpWveEE?=
 =?us-ascii?Q?YCu3VuWZZjxk3TjzywFFSn2lgF+hQyK28sS8cN/pp4eeaaEV4WRMoq7Iddb9?=
 =?us-ascii?Q?fBv4CLgckS0RMBfH/vOeaMrIPW5qPAFDHdIirE+r0rz1fVy6Qpd9?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9885009d-d035-45ca-4d06-08da240a679a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 02:47:13.6846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJ50s8u+VH6WOHE9ep233ICV2EHxSfwyNFpumK+D05cKtUkbvKTWX/z3fhdWoD4PteQEpQ/m+DcjSCV2RlH+4qhID+kTo1Zr6k2zGI9XpnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR01MB6845
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

The SMpro co-processor on Ampere Altra processor family is to monitor
and report various data included hwmon-related info, RAS errors, and
other miscellaneous information. The SMPro MFD driver initializes the
register map and instantiates all sub-devices. All the specifics will
be handled in the child drivers.

This patch set includes support for Ampere SMpro hwmon, errmon, and
misc as the child drivers. The hwmon driver supports accessing various
CPU sensors provided by the SMpro co-processor including temperature,
power, voltages, and current found on Ampere Altra processor family.
The errmon driver supports monitoring and reporting RAS-related errors.
The misc driver is to support reporting boot progress and other
miscellaneous information.

Discussion for v7: https://lkml.org/lkml/2022/3/21/125

v8:
  + Insert 'break;' to avoid fall-through          [kernel test robot]
  + Avoid uninitialized variable use               [kernel test robot]
  + Remove unused #*_cells                                 [Krzysztof]
  + Switch to use sysfs_emit()                                  [Greg]
  + Sysfs to return single value only                           [Greg]
  + Fix KernelVerion field in Documentation/ABI/testing doc     [Greg]
  + Change errors_* sysfs to error_*                            [Quan]
  + Add overflow_[core|mem|pcie|other]_[ce|ue] sysfs to report
  overflow status of each type of HW errors                     [Quan]
  + Update wording in Kconfig for smpro-errmon and smpro-misc   [Quan]
  + Masks reserved bit when read 10-bit power value             [Quan]
  + Add some minor refactor                                     [Quan]

v7:
  + Add docs to Documentation/ABI/testing                       [Greg]
  + Re-order patches to avoid compile dependency           [Lee Jones]
  + Remove regmap_acquire/release_lock()                        [Quan]
  + Install regmap bus->read/write() to handle multiple types of bus
    access                                                      [Quan]
  + Replace i2c block read by regmap_noinc_read()               [Quan]
  + Fix wrong return type of *show/store()         [kernel test robot]
  + Update GPL version                                          [Quan]
  + Add some others minor code refactor                         [Quan]

v6:
  + Introduced smpro-errmon, smpro-misc as smpro-mfd sub-device [Quan]

v5:
  + Introduced the smpro-mfd driver and drop the use of
  simple-mfd-i2c driver to avoid DT node with no resource in child
  device DT nodes [Rob]
  + Removed the use of reg DT property in child driver [Quan]
  + Validated ManufactureID when probing smpro-mfd drivers [Quan]
  + As child devices are instantiated by SMPro MFD driver, drop the
  ManufacturerID checking in child driver, ie: smpro-hwmon [Quan]
  + Revised commit messages [Quan]

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

Quan Nguyen (9):
  hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
  docs: hwmon: (smpro-hwmon) Add documentation
  misc: smpro-errmon: Add Ampere's SMpro error monitor driver
  docs: misc-devices: (smpro-errmon) Add documentation
  misc: smpro-misc: Add Ampere's Altra SMpro misc driver
  docs: misc-devices: (smpro-misc) Add documentation
  dt-bindings: mfd: Add bindings for Ampere Altra SMPro MFD driver
  mfd: smpro-mfd: Adds Ampere's Altra SMpro MFD driver
  docs: ABI: testing: Document the Ampere Altra Family's SMpro sysfs
    interfaces

 .../sysfs-bus-platform-devices-ampere-smpro   | 157 ++++++
 .../devicetree/bindings/mfd/ampere,smpro.yaml |  42 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/smpro-hwmon.rst           | 101 ++++
 Documentation/misc-devices/index.rst          |   2 +
 Documentation/misc-devices/smpro-errmon.rst   | 198 ++++++++
 Documentation/misc-devices/smpro-misc.rst     |  82 +++
 drivers/hwmon/Kconfig                         |   8 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/smpro-hwmon.c                   | 465 +++++++++++++++++
 drivers/mfd/Kconfig                           |  12 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/smpro-mfd.c                       | 134 +++++
 drivers/misc/Kconfig                          |  22 +
 drivers/misc/Makefile                         |   2 +
 drivers/misc/smpro-errmon.c                   | 477 ++++++++++++++++++
 drivers/misc/smpro-misc.c                     | 161 ++++++
 17 files changed, 1866 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
 create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
 create mode 100644 Documentation/hwmon/smpro-hwmon.rst
 create mode 100644 Documentation/misc-devices/smpro-errmon.rst
 create mode 100644 Documentation/misc-devices/smpro-misc.rst
 create mode 100644 drivers/hwmon/smpro-hwmon.c
 create mode 100644 drivers/mfd/smpro-mfd.c
 create mode 100644 drivers/misc/smpro-errmon.c
 create mode 100644 drivers/misc/smpro-misc.c

-- 
2.35.1

