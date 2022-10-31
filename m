Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EDC612F22
	for <lists+openbmc@lfdr.de>; Mon, 31 Oct 2022 03:48:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0yJD6Qjxz3c4S
	for <lists+openbmc@lfdr.de>; Mon, 31 Oct 2022 13:48:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=CTKYaLL1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.99; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=CTKYaLL1;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2099.outbound.protection.outlook.com [40.107.223.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N0yFW6VHHz2yyZ
	for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2022 13:45:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WP7/spxPcHMVOkeFyTinsP4bB6SCluHtQQbBfPZgNeGnMspaD09hW75yOnlK+APDO03CTpZIa08OEfUW8PbFJbtVKxldOgMbCulGavVfYYNpeKjJICfjkqYKDgjXB8ftSozgj0B2Q/fdcYBP9WbhhrOFUO0ykPYYAd2lVf2wT1HUsKPFtszU2/4TbMbJRuW6JsBufmPoo0vAZaD9eDdyMljlyOI48diIVZudqF21Z3wvxBCFlro6tYgsp7dCZ/pGOH6ss2OjkD5wgxO9gYHe1Eazm2TfSs7WqshF455F3YXmkTwLlWQ7p1jrFhUIftE2Dr+FBHHcIzVyV64FCtdatw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysYVRBo/veTRpbCOctbMPE1tw+yWS4InOAygBoC8b30=;
 b=d4s1DmHsVf4XaZmf9tsbM47aQHf0AXiNyC2F2BboykVl3pQPHYposo6vWSKDoSKDYQZbjcpnUUFTByX30745XB3Rm02FgBsiqcnYKQmcJ5+NCKGIdlm7bZTtfs/Q6iqSbzGdHGi3XrB2pBayM6WeS7+OaOQbLEva7YxDZulcF8el57DmZQ1d3hMg2tpmoRSE1RlrqRzdF5yo/49UmWZt/VS2dJ5DxQKbb9L83vz0rB2D4liqXzNDMrgf8cW+DgyaTORZ/oNJIumrkqVTHEjA6g03ZdkCK3z/uX7p7kd0K5JNr2+rz6IfBm7D/RFO7TTHPyRl0SVd5bcnhfCqTQse0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysYVRBo/veTRpbCOctbMPE1tw+yWS4InOAygBoC8b30=;
 b=CTKYaLL1Lt4VmHqRPN+0LVWx5A1Y5zZXdZ8uynTK64Zw8eOGGaXfyEMW60h81VGdjZUKHDKfSFx/b5bCAzbE5PDvGjHrl9eS3e/UB3BGfR92GIWRa8BzDXLtRGpT0sPPHmbHgeKQ/zJIwDOezXjQY+2noGbhFQ0fhJmccoVx1AE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 BYAPR01MB5336.prod.exchangelabs.com (2603:10b6:a03:11e::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.19; Mon, 31 Oct 2022 02:45:32 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com ([fe80::44c1:e119:56:cd90])
 by SN4PR01MB7455.prod.exchangelabs.com ([fe80::44c1:e119:56:cd90%7]) with
 mapi id 15.20.5769.015; Mon, 31 Oct 2022 02:45:32 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v10 2/3] misc: smpro-errmon: Add Ampere's SMpro error monitor driver
Date: Mon, 31 Oct 2022 09:44:41 +0700
Message-Id: <20221031024442.2490881-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221031024442.2490881-1-quan@os.amperecomputing.com>
References: <20221031024442.2490881-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|BYAPR01MB5336:EE_
X-MS-Office365-Filtering-Correlation-Id: 39a830af-c83e-42b5-1944-08dabae9fab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	obx/IzS7Lom+XWw3x/ShfrYc+L+j1XOmCrXcj9whRZr7y7PuhlAnUS7MNGZlZj8TbU70IUHMEbwOMxuutKIbwYBmyAt4mPSpSwa+f9+Gxbfl3GB75eZp8LE/0JvxTj9XpPSCLw7HT9/ZSzTh3cqd9LFEgjaZrf1wH91IiT3GKFlPrV1Ai4V6hrkePvcFrsYgLooc/y6Il5FL/SkAsen2B+58GhSC9nQ2P4hCwA6HNQzXcABefhYFAcjRUWmBGIuOIik4EQBp45kzoQbYhemjGU4mooTPIh+Z/rQ/jzxPNKFHNKixNL7hdf3WiFq3k5zK/BEcqv5dyZFbLM4QLyQZVomYRr9ALIeVoiXkzSojxl7jTRhlXF1qroadmDtd1xT11tW10RtbDg/gAQC+2HAhgNcEPQsixr5EJz3akkX5jClO6Ube1XSs9zlXoKEbWlHMlPcQ8bjvf6UjTbYgxY/uwkbYwZ8JKLs2O+W/x30RSK09CvpB4wTmpcQXSJWNUBS5IylFdnajhrRQ6KxXg5DNKtoRRVPtbFwXiKqC1fJCEOd2XulfP8cfY+SclbhAP4UQNKepYtYLqrQSe/M94r1JGr9pxgD/WHxtzKfnZXCSJ+ePMAga4A1zaQfhSI3f12GitoMKgNp3S6FOzL3Cq548QH/odhaiwLwDgjtR9OdaY3JfzSUmetocO7v7kzJ5iCUikGycfk9gSPkJrtxQiOTGNjytm6zHd10jTwumlxjDbRyy9BI7QQZ/LAGSOisOIcvYCRQ1rpoO7bXFKDyL4WpYlw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39840400004)(366004)(451199015)(38100700002)(38350700002)(66476007)(66556008)(8676002)(66946007)(54906003)(110136005)(4326008)(6486002)(316002)(86362001)(83380400001)(2906002)(52116002)(26005)(6506007)(6512007)(8936002)(186003)(5660300002)(6666004)(107886003)(41300700001)(478600001)(30864003)(7416002)(2616005)(1076003)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/TciHqVdBCdkPdhxT3C3f+6cPbbnJY5zazmDdikOrbP1KbVYR5D6vsP2NvYF?=
 =?us-ascii?Q?pPar/oueh2JGlss+/Kxt63ZIE1c/Ut7UVUouGv0bTNXnx/wlV6RmMXbroPPK?=
 =?us-ascii?Q?OeyjN5QEB240eWuz0blmn7BWq7wrD8mU6L0rd0EiWBGavIKU7A6+TKszmy8R?=
 =?us-ascii?Q?F3zFEYfysbBR0nboRUuPEIDt1diigOWz5Q5oiIEUMOcjSC6SzmUfDbmpR7F6?=
 =?us-ascii?Q?sJqRKX6BGcNaxZXHLVH2FcAgoNdvBRQ8I9EOlSVE81jKaXQNiZ9SazraOb16?=
 =?us-ascii?Q?8a1eNmhWeJAcQueHAP5c8XRImH8VN0kTVhGc9NcFI5gGFwa9EAhgl1NwJZgt?=
 =?us-ascii?Q?6EqeJkUQv+1+K4tJS5r7XWogqYK6uwVr/NwO/k40wsBp1HQFzvQ2dWp+l0t7?=
 =?us-ascii?Q?iDLzwXFp85HUOCZiQtMnbZJtCuyWIjeaeAF6VMYZYUhQJFIMPrLV2jcYGFoy?=
 =?us-ascii?Q?NjBMgIWMb4pAWTjzisfK42Kjn2/Dt2DPTWHjyEyObD1rMsGJwhtE53pBblxc?=
 =?us-ascii?Q?UaIAmymKNqhVBz9hvSwOvwSwLlHI8hHmpJGFMdF0sUI77IvF5ejPIkpe79NX?=
 =?us-ascii?Q?QGNJ6dQxfzqGjrIPyAcDrnLsJSHJvFbFQYvbt0Phqb3LfXILCCd02v/XtCST?=
 =?us-ascii?Q?WrRjCzFTfMMgW3WB15Hxbboxranh8lWXPq+whQLmHyKXVqRj3wMJR76rXLQp?=
 =?us-ascii?Q?uFMZcfQMCsgGKGv/WbNFUh6GaN5oV6qcBXxRYeo8Di3YMIA5wIBQJg4wXegi?=
 =?us-ascii?Q?MojLj7W/NcXMSjcqmL7SiRamFbMk0Sh8IO4hyZ+AF5xzf79cHll+g+2Bi3At?=
 =?us-ascii?Q?g/xoNg5XPglhOOS9d7MV2pXGJcjTl2l5+2UWCE2vquNtl0Rf1X8p3JWKoUR9?=
 =?us-ascii?Q?O3QMok1Zj2E7/mWtNER+WIo0c3b6fykO9I4+y8QoEJgAfdNkZI9YsY2PgMjy?=
 =?us-ascii?Q?LNGl1QYuMcsd2fOdTzohmUi/k3ZysymEk3psb0qf7jDVCBm0/m3jP5W6NoGz?=
 =?us-ascii?Q?6CxdqUUbo+uy/hn3uVk0mojUQgpklQ1V18BL45ebAlYEycK4HxYf6Bq84fnQ?=
 =?us-ascii?Q?tXhpGGbuYQH0Gm044apD0Z7vIZ88m4rHUIokcHRMBSyhoPIWxGPJW+MGFpF9?=
 =?us-ascii?Q?LwCceQkr7Q+3ab8gkDSaUSremussp9ruP730OYqhdu07nmT44qS5Cd6V+0e2?=
 =?us-ascii?Q?AcZQOf6oJHIqJeJAgygBxIhqaMNMh6H8uP2wKNd4kVTiDRyt1DdXgGsavKG4?=
 =?us-ascii?Q?85P/jtRMlN3GrXbOaTdKvGZngftdJlC0Wfdtg9LFAGCDx9/y+KqjWrfk0umu?=
 =?us-ascii?Q?Eug6Z80LnRqPZi2asES/CAjmBl4uVIHb2Dct778VWmSXKgTVcWgDBuY+g9YL?=
 =?us-ascii?Q?YRDRJyWmN6KDK3c27FvTOkR0S99jyess/OoF3SU+ZwZTsNG7l9nU25mHGqoD?=
 =?us-ascii?Q?giW6AVcAo5soLOeWjIDg221l6RoM2kRc4GATUYCu0jZ5gqbxsoljOmnn1Biz?=
 =?us-ascii?Q?19ybFdI7fJW1ML28sKVCdh17yagSmWvCAl5GHsSHQRxP3uxG9CRdYlzdmBV7?=
 =?us-ascii?Q?R9J8ZHKgNymp273nFjGZcjzUhnAidUiXCo9ylQx2sv549MhJtvJt5S5z9Pi3?=
 =?us-ascii?Q?AhAWw/laBX96rx0POx0vM9k=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a830af-c83e-42b5-1944-08dabae9fab2
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 02:45:32.6700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRPXDCywikOSB1+YvmC4ZOdWkqDa1PLdsyuy1aM1JGdUGehYHElN/4hr4XKFFnSJ6ucWfWIvjm5XVjCnNeCFQEM9iz3xGf9ZVd+Mgwvg1Bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5336
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Ampere's SMpro error monitor driver for monitoring and reporting
RAS-related errors as reported by SMpro co-processor found on Ampere's
Altra processor family.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Changes in v10:
  + Fix document format                                        [Bagas]
  + Update commit message: s/This commit adds/Add/             [Bagas]
  + Only use Documentation/ABI/                                 [Greg]
  + Drop Documentation/misc-devices/smpro-errmon.rst            [Greg]

Changes in v9:
  + Fix ugly static struct define                               [Greg]
  + Remove unused defines and update documentation              [Quan]
  + Add minor refactor code                                     [Quan]
  + Fix messy goto                                              [Greg]
  + Update SPDX licence                                         [Greg]
  + Use ATTRIBUTE_GROUPS()                                      [Greg]
  + Use dev_groups instead of sysfs_create_group() to avoid
  racing issue with user space                                  [Greg]
  + Refactor code to fix unnecessary initialization issue       [Quan]
  + Refactor code to avoid clever encoding issue                [Quan]
  + Separate error_[smpro|pmpro] to error_* and warn_*          [Quan]
  + Add minor code refactor                                     [Quan]

Changes in v8:
  + Update wording for SMPRO_ERRMON on Kconfig file             [Quan]
  + Avoid uninitialized variable use               [kernel test robot]
  + Switch to use sysfs_emit()                                  [Greg]
  + Make sysfs to return single value                           [Greg]
  + Change errors_* sysfs to error_*                            [Quan]
  + Add overflow_[core|mem|pcie|other]_[ce|ue] sysfs to report
  overflow status of each type of HW errors                     [Quan]
  + Add some minor refactor                                     [Quan]

Changes in v7:
  + Remove regmap_acquire/release_lock(), read_i2c_block_data() [Quan]
  + Use regmap_noinc_read() instead of errmon_read_block()      [Quan]
  + Validate number of errors before read                       [Quan]
  + Fix wrong return type of *_show() function     [kernel test robot]
  + Adjust patch order to avoid dependence with smpro-mfd  [Lee Jones]
  + Use pointer instead of stack memory                         [Quan]

Changes in v6:
  + First introduced in v6 [Quan]
---
 .../sysfs-bus-platform-devices-ampere-smpro   | 264 +++++++++
 drivers/misc/Kconfig                          |  12 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/smpro-errmon.c                   | 529 ++++++++++++++++++
 4 files changed, 806 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
 create mode 100644 drivers/misc/smpro-errmon.c

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
new file mode 100644
index 000000000000..2b84dc8c3149
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
@@ -0,0 +1,264 @@
+What:		/sys/bus/platform/devices/smpro-errmon.*/error_[core|mem|pcie|other]_[ce|ue]
+KernelVersion:	6.1
+Contact:	Quan Nguyen <quan@os.amperecomputing.com>
+Description:
+		(RO) Contains the 48-byte Ampere (Vendor-Specific) Error Record printed
+		in hex format according to the table below:
+
+		+--------+---------------+-------------+------------------------------------------------------------+
+		| Offset |     Field     | Size (byte) |                     Description                            |
+		+--------+---------------+-------------+------------------------------------------------------------+
+		| 00     | Error Type    | 1           | See :ref:`the table below <smpro-error-types>` for details |
+		+--------+---------------+-------------+------------------------------------------------------------+
+		| 01     | Subtype       | 1           | See :ref:`the table below <smpro-error-types>` for details |
+		+--------+---------------+-------------+------------------------------------------------------------+
+		| 02     | Instance      | 2           | See :ref:`the table below <smpro-error-types>` for details |
+		+--------+---------------+-------------+------------------------------------------------------------+
+		| 04     | Error status  | 4           | See ARM RAS specification for details                      |
+		+--------+---------------+-------------+------------------------------------------------------------+
+		| 08     | Error Address | 8           | See ARM RAS specification for details                      |
+		+--------+---------------+-------------+------------------------------------------------------------+
+		| 16     | Error Misc 0  | 8           | See ARM RAS specification for details                      |
+		+--------+---------------+-------------+------------------------------------------------------------+
+		| 24     | Error Misc 1  | 8           | See ARM RAS specification for details                      |
+		+--------+---------------+-------------+------------------------------------------------------------+
+		| 32     | Error Misc 2  | 8           | See ARM RAS specification for details                      |
+		+--------+---------------+-------------+------------------------------------------------------------+
+		| 40     | Error Misc 3  | 8           | See ARM RAS specification for details                      |
+		+--------+---------------+-------------+------------------------------------------------------------+
+
+		The table below defines the value of error types, their subtype, subcomponent and instance:
+
+		.. _smpro-error-types:
+
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		|   Error Group   | Error Type | Sub type | Sub component  |               Instance                 |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| CPM (core)      | 0          | 0        | Snoop-Logic    | CPM #                                  |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| CPM (core)      | 0          | 2        | Armv8 Core 1   | CPM #                                  |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| MCU (mem)       | 1          | 1        | ERR1           | MCU # \| SLOT << 11                    |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| MCU (mem)       | 1          | 2        | ERR2           | MCU # \| SLOT << 11                    |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| MCU (mem)       | 1          | 3        | ERR3           | MCU #                                  |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| MCU (mem)       | 1          | 4        | ERR4           | MCU #                                  |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| MCU (mem)       | 1          | 5        | ERR5           | MCU #                                  |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| MCU (mem)       | 1          | 6        | ERR6           | MCU #                                  |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| MCU (mem)       | 1          | 7        | Link Error     | MCU #                                  |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| Mesh (other)    | 2          | 0        | Cross Point    | X \| (Y << 5) \| NS <<11               |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| Mesh (other)    | 2          | 1        | Home Node(IO)  | X \| (Y << 5) \| NS <<11               |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| Mesh (other)    | 2          | 2        | Home Node(Mem) | X \| (Y << 5) \| NS <<11 \| device<<12 |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| Mesh (other)    | 2          | 4        | CCIX Node      | X \| (Y << 5) \| NS <<11               |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| 2P Link (other) | 3          | 0        | N/A            | Altra 2P Link #                        |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| GIC (other)     | 5          | 0        | ERR0           | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| GIC (other)     | 5          | 1        | ERR1           | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| GIC (other)     | 5          | 2        | ERR2           | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| GIC (other)     | 5          | 3        | ERR3           | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| GIC (other)     | 5          | 4        | ERR4           | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| GIC (other)     | 5          | 5        | ERR5           | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| GIC (other)     | 5          | 6        | ERR6           | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| GIC (other)     | 5          | 7        | ERR7           | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| GIC (other)     | 5          | 8        | ERR8           | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| GIC (other)     | 5          | 9        | ERR9           | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| GIC (other)     | 5          | 10       | ERR10          | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| GIC (other)     | 5          | 11       | ERR11          | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| GIC (other)     | 5          | 12       | ERR12          | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| GIC (other)     | 5          | 13-21    | ERR13          | RC # + 1                               |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| SMMU (other)    | 6          | TCU      | 100            | RC #                                   |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| SMMU (other)    | 6          | TBU0     | 0              | RC #                                   |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| SMMU (other)    | 6          | TBU1     | 1              | RC #                                   |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| SMMU (other)    | 6          | TBU2     | 2              | RC #                                   |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| SMMU (other)    | 6          | TBU3     | 3              | RC #                                   |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| SMMU (other)    | 6          | TBU4     | 4              | RC #                                   |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| SMMU (other)    | 6          | TBU5     | 5              | RC #                                   |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| SMMU (other)    | 6          | TBU6     | 6              | RC #                                   |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| SMMU (other)    | 6          | TBU7     | 7              | RC #                                   |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| SMMU (other)    | 6          | TBU8     | 8              | RC #                                   |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| SMMU (other)    | 6          | TBU9     | 9              | RC #                                   |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| PCIe AER (pcie) | 7          | Root     | 0              | RC #                                   |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| PCIe AER (pcie) | 7          | Device   | 1              | RC #                                   |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| PCIe RC (pcie)  | 8          | RCA HB   | 0              | RC #                                   |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| PCIe RC (pcie)  | 8          | RCB HB   | 1              | RC #                                   |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| PCIe RC (pcie)  | 8          | RASDP    | 8              | RC #                                   |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| OCM (other)     | 9          | ERR0     | 0              | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| OCM (other)     | 9          | ERR1     | 1              | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| OCM (other)     | 9          | ERR2     | 2              | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| SMpro (other)   | 10         | ERR0     | 0              | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| SMpro (other)   | 10         | ERR1     | 1              | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| SMpro (other)   | 10         | MPA_ERR  | 2              | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| PMpro (other)   | 11         | ERR0     | 0              | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| PMpro (other)   | 11         | ERR1     | 1              | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+		| PMpro (other)   | 11         | MPA_ERR  | 2              | 0                                      |
+		+-----------------+------------+----------+----------------+----------------------------------------+
+
+		Example::
+
+		 # cat error_other_ue
+		 880807001e004010401040101500000001004010401040100c0000000000000000000000000000000000000000000000
+
+		The detail of each sysfs entries is as below:
+
+		+-------------+---------------------------------------------------------+----------------------------------+
+		|   Error     |                   Sysfs entry                           |   Description (when triggered)   |
+		+-------------+---------------------------------------------------------+----------------------------------+
+		| Core's CE   | /sys/bus/platform/devices/smpro-errmon.*/error_core_ce  | Core has CE error                |
+		+-------------+---------------------------------------------------------+----------------------------------+
+		| Core's UE   | /sys/bus/platform/devices/smpro-errmon.*/error_core_ue  | Core has UE error                |
+		+-------------+---------------------------------------------------------+----------------------------------+
+		| Memory's CE | /sys/bus/platform/devices/smpro-errmon.*/error_mem_ce   | Memory has CE error              |
+		+-------------+---------------------------------------------------------+----------------------------------+
+		| Memory's UE | /sys/bus/platform/devices/smpro-errmon.*/error_mem_ue   | Memory has UE error              |
+		+-------------+---------------------------------------------------------+----------------------------------+
+		| PCIe's CE   | /sys/bus/platform/devices/smpro-errmon.*/error_pcie_ce  | any PCIe controller has CE error |
+		+-------------+---------------------------------------------------------+----------------------------------+
+		| PCIe's UE   | /sys/bus/platform/devices/smpro-errmon.*/error_pcie_ue  | any PCIe controller has UE error |
+		+-------------+---------------------------------------------------------+----------------------------------+
+		| Other's CE  | /sys/bus/platform/devices/smpro-errmon.*/error_other_ce | any other CE error               |
+		+-------------+---------------------------------------------------------+----------------------------------+
+		| Other's UE  | /sys/bus/platform/devices/smpro-errmon.*/error_other_ue | any other UE error               |
+		+-------------+---------------------------------------------------------+----------------------------------+
+
+		UE: Uncorrect-able Error
+		CE: Correct-able Error
+
+		For details, see section `3.3 Ampere (Vendor-Specific) Error Record Formats,
+		Altra Family RAS Supplement`.
+
+
+What:		/sys/bus/platform/devices/smpro-errmon.*/overflow_[core|mem|pcie|other]_[ce|ue]
+KernelVersion:	6.1
+Contact:	Quan Nguyen <quan@os.amperecomputing.com>
+Description:
+		(RO) Return the overflow status of each type HW error reported:
+
+		  - 0      : No overflow
+		  - 1      : There is an overflow and the oldest HW errors are dropped
+
+		The detail of each sysfs entries is as below:
+
+		+-------------+-----------------------------------------------------------+---------------------------------------+
+		|   Overflow  |                   Sysfs entry                             |             Description               |
+		+-------------+-----------------------------------------------------------+---------------------------------------+
+		| Core's CE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_core_ce | Core CE error overflow                |
+		+-------------+-----------------------------------------------------------+---------------------------------------+
+		| Core's UE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_core_ue | Core UE error overflow                |
+		+-------------+-----------------------------------------------------------+---------------------------------------+
+		| Memory's CE | /sys/bus/platform/devices/smpro-errmon.*/overflow_mem_ce  | Memory CE error overflow              |
+		+-------------+-----------------------------------------------------------+---------------------------------------+
+		| Memory's UE | /sys/bus/platform/devices/smpro-errmon.*/overflow_mem_ue  | Memory UE error overflow              |
+		+-------------+-----------------------------------------------------------+---------------------------------------+
+		| PCIe's CE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_pcie_ce | any PCIe controller CE error overflow |
+		+-------------+-----------------------------------------------------------+---------------------------------------+
+		| PCIe's UE   | /sys/bus/platform/devices/smpro-errmon.*/overflow_pcie_ue | any PCIe controller UE error overflow |
+		+-------------+-----------------------------------------------------------+---------------------------------------+
+		| Other's CE  | /sys/bus/platform/devices/smpro-errmon.*/overflow_other_ce| any other CE error overflow           |
+		+-------------+-----------------------------------------------------------+---------------------------------------+
+		| Other's UE  | /sys/bus/platform/devices/smpro-errmon.*/overflow_other_ue| other UE error overflow               |
+		+-------------+-----------------------------------------------------------+---------------------------------------+
+
+		where:
+
+		  - UE: Uncorrect-able Error
+		  - CE: Correct-able Error
+
+What:		/sys/bus/platform/devices/smpro-errmon.*/[error|warn]_[smpro|pmpro]
+KernelVersion:	6.1
+Contact:	Quan Nguyen <quan@os.amperecomputing.com>
+Description:
+		(RO) Contains the internal firmware error/warning printed as hex format.
+
+		The detail of each sysfs entries is as below:
+
+		+---------------+------------------------------------------------------+--------------------------+
+		|   Error       |                   Sysfs entry                        |        Description       |
+		+---------------+------------------------------------------------------+--------------------------+
+		| SMpro error   | /sys/bus/platform/devices/smpro-errmon.*/error_smpro | system has SMpro error   |
+		+---------------+------------------------------------------------------+--------------------------+
+		| SMpro warning | /sys/bus/platform/devices/smpro-errmon.*/warn_smpro  | system has SMpro warning |
+		+---------------+------------------------------------------------------+--------------------------+
+		| PMpro error   | /sys/bus/platform/devices/smpro-errmon.*/error_pmpro | system has PMpro error   |
+		+---------------+------------------------------------------------------+--------------------------+
+		| PMpro warning | /sys/bus/platform/devices/smpro-errmon.*/warn_pmpro  | system has PMpro warning |
+		+---------------+------------------------------------------------------+--------------------------+
+
+		For details, see section `5.10 RAS Internal Error Register Definitions,
+		Altra Family Soc BMC Interface Specification`.
+
+What:		/sys/bus/platform/devices/smpro-errmon.*/event_[vrd_warn_fault|vrd_hot|dimm_hot]
+KernelVersion:	6.1
+Contact:	Quan Nguyen <quan@os.amperecomputing.com>
+Description:
+		(RO) Contains the detail information in case of VRD/DIMM warning/hot events
+		in hex format as below::
+
+		    AAAA
+
+		where:
+
+		  - ``AAAA``: The event detail information data
+
+		The detail of each sysfs entries is as below:
+
+		+---------------+---------------------------------------------------------------+---------------------+
+		|   Event       |                        Sysfs entry                            |     Description     |
+		+---------------+---------------------------------------------------------------+---------------------+
+		| VRD HOT       | /sys/bus/platform/devices/smpro-errmon.*/event_vrd_hot        | VRD Hot             |
+		+---------------+---------------------------------------------------------------+---------------------+
+		| VR Warn/Fault | /sys/bus/platform/devices/smpro-errmon.*/event_vrd_warn_fault | VR Warning or Fault |
+		+---------------+---------------------------------------------------------------+---------------------+
+		| DIMM HOT      | /sys/bus/platform/devices/smpro-errmon.*/event_dimm_hot       | DIMM Hot            |
+		+---------------+---------------------------------------------------------------+---------------------+
+
+		For more details, see section `5.7 GPI Status Registers,
+		Altra Family Soc BMC Interface Specification`.
+
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 358ad56f6524..b9ceee949dab 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -176,6 +176,18 @@ config SGI_XP
 	  this feature will allow for direct communication between SSIs
 	  based on a network adapter and DMA messaging.
 
+config SMPRO_ERRMON
+	tristate "Ampere Computing SMPro error monitor driver"
+	depends on MFD_SMPRO || COMPILE_TEST
+	help
+	  Say Y here to get support for the SMpro error monitor function
+	  provided by Ampere Computing's Altra and Altra Max SoCs. Upon
+	  loading, the driver creates sysfs files which can be use to gather
+	  multiple HW error data reported via read and write system calls.
+
+	  To compile this driver as a module, say M here. The driver will be
+	  called smpro-errmon.
+
 config CS5535_MFGPT
 	tristate "CS5535/CS5536 Geode Multi-Function General Purpose Timer (MFGPT) support"
 	depends on MFD_CS5535
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index ac9b3e757ba1..bbe24d4511a3 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_ENCLOSURE_SERVICES) += enclosure.o
 obj-$(CONFIG_KGDB_TESTS)	+= kgdbts.o
 obj-$(CONFIG_SGI_XP)		+= sgi-xp/
 obj-$(CONFIG_SGI_GRU)		+= sgi-gru/
+obj-$(CONFIG_SMPRO_ERRMON)	+= smpro-errmon.o
 obj-$(CONFIG_CS5535_MFGPT)	+= cs5535-mfgpt.o
 obj-$(CONFIG_GEHC_ACHC)		+= gehc-achc.o
 obj-$(CONFIG_HP_ILO)		+= hpilo.o
diff --git a/drivers/misc/smpro-errmon.c b/drivers/misc/smpro-errmon.c
new file mode 100644
index 000000000000..d1431d419aa4
--- /dev/null
+++ b/drivers/misc/smpro-errmon.c
@@ -0,0 +1,529 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Ampere Computing SoC's SMpro Error Monitoring Driver
+ *
+ * Copyright (c) 2022, Ampere Computing LLC
+ *
+ */
+
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/* GPI RAS Error Registers */
+#define GPI_RAS_ERR		0x7E
+
+/* Core and L2C Error Registers */
+#define CORE_CE_ERR_CNT		0x80
+#define CORE_CE_ERR_LEN		0x81
+#define CORE_CE_ERR_DATA	0x82
+#define CORE_UE_ERR_CNT		0x83
+#define CORE_UE_ERR_LEN		0x84
+#define CORE_UE_ERR_DATA	0x85
+
+/* Memory Error Registers */
+#define MEM_CE_ERR_CNT		0x90
+#define MEM_CE_ERR_LEN		0x91
+#define MEM_CE_ERR_DATA		0x92
+#define MEM_UE_ERR_CNT		0x93
+#define MEM_UE_ERR_LEN		0x94
+#define MEM_UE_ERR_DATA		0x95
+
+/* RAS Error/Warning Registers */
+#define ERR_SMPRO_TYPE		0xA0
+#define ERR_PMPRO_TYPE		0xA1
+#define ERR_SMPRO_INFO_LO	0xA2
+#define ERR_SMPRO_INFO_HI	0xA3
+#define ERR_SMPRO_DATA_LO	0xA4
+#define ERR_SMPRO_DATA_HI	0xA5
+#define WARN_SMPRO_INFO_LO	0xAA
+#define WARN_SMPRO_INFO_HI	0xAB
+#define ERR_PMPRO_INFO_LO	0xA6
+#define ERR_PMPRO_INFO_HI	0xA7
+#define ERR_PMPRO_DATA_LO	0xA8
+#define ERR_PMPRO_DATA_HI	0xA9
+#define WARN_PMPRO_INFO_LO	0xAC
+#define WARN_PMPRO_INFO_HI	0xAD
+
+/* PCIE Error Registers */
+#define PCIE_CE_ERR_CNT		0xC0
+#define PCIE_CE_ERR_LEN		0xC1
+#define PCIE_CE_ERR_DATA	0xC2
+#define PCIE_UE_ERR_CNT		0xC3
+#define PCIE_UE_ERR_LEN		0xC4
+#define PCIE_UE_ERR_DATA	0xC5
+
+/* Other Error Registers */
+#define OTHER_CE_ERR_CNT	0xD0
+#define OTHER_CE_ERR_LEN	0xD1
+#define OTHER_CE_ERR_DATA	0xD2
+#define OTHER_UE_ERR_CNT	0xD8
+#define OTHER_UE_ERR_LEN	0xD9
+#define OTHER_UE_ERR_DATA	0xDA
+
+/* Event Data Registers */
+#define VRD_WARN_FAULT_EVENT_DATA	0x78
+#define VRD_HOT_EVENT_DATA		0x79
+#define DIMM_HOT_EVENT_DATA		0x7A
+
+#define MAX_READ_BLOCK_LENGTH	48
+
+#define RAS_SMPRO_ERR		0
+#define RAS_PMPRO_ERR		1
+
+enum RAS_48BYTES_ERR_TYPES {
+	CORE_CE_ERR,
+	CORE_UE_ERR,
+	MEM_CE_ERR,
+	MEM_UE_ERR,
+	PCIE_CE_ERR,
+	PCIE_UE_ERR,
+	OTHER_CE_ERR,
+	OTHER_UE_ERR,
+	NUM_48BYTES_ERR_TYPE,
+};
+
+struct smpro_error_hdr {
+	u8 count;	/* Number of the RAS errors */
+	u8 len;		/* Number of data bytes */
+	u8 data;	/* Start of 48-byte data */
+	u8 max_cnt;	/* Max num of errors */
+};
+
+/*
+ * Included Address of registers to get Count, Length of data and Data
+ * of the 48 bytes error data
+ */
+static struct smpro_error_hdr smpro_error_table[] = {
+	[CORE_CE_ERR] = {
+		.count = CORE_CE_ERR_CNT,
+		.len = CORE_CE_ERR_LEN,
+		.data = CORE_CE_ERR_DATA,
+		.max_cnt = 32
+	},
+	[CORE_UE_ERR] = {
+		.count = CORE_UE_ERR_CNT,
+		.len = CORE_UE_ERR_LEN,
+		.data = CORE_UE_ERR_DATA,
+		.max_cnt = 32
+	},
+	[MEM_CE_ERR] = {
+		.count = MEM_CE_ERR_CNT,
+		.len = MEM_CE_ERR_LEN,
+		.data = MEM_CE_ERR_DATA,
+		.max_cnt = 16
+	},
+	[MEM_UE_ERR] = {
+		.count = MEM_UE_ERR_CNT,
+		.len = MEM_UE_ERR_LEN,
+		.data = MEM_UE_ERR_DATA,
+		.max_cnt = 16
+	},
+	[PCIE_CE_ERR] = {
+		.count = PCIE_CE_ERR_CNT,
+		.len = PCIE_CE_ERR_LEN,
+		.data = PCIE_CE_ERR_DATA,
+		.max_cnt = 96
+	},
+	[PCIE_UE_ERR] = {
+		.count = PCIE_UE_ERR_CNT,
+		.len = PCIE_UE_ERR_LEN,
+		.data = PCIE_UE_ERR_DATA,
+		.max_cnt = 96
+	},
+	[OTHER_CE_ERR] = {
+		.count = OTHER_CE_ERR_CNT,
+		.len = OTHER_CE_ERR_LEN,
+		.data = OTHER_CE_ERR_DATA,
+		.max_cnt = 8
+	},
+	[OTHER_UE_ERR] = {
+		.count = OTHER_UE_ERR_CNT,
+		.len = OTHER_UE_ERR_LEN,
+		.data = OTHER_UE_ERR_DATA,
+		.max_cnt = 8
+	},
+};
+
+/*
+ * List of SCP registers which are used to get
+ * one type of RAS Internal errors.
+ */
+struct smpro_int_error_hdr {
+	u8 type;
+	u8 info_l;
+	u8 info_h;
+	u8 data_l;
+	u8 data_h;
+	u8 warn_l;
+	u8 warn_h;
+};
+
+static struct smpro_int_error_hdr list_smpro_int_error_hdr[] = {
+	[RAS_SMPRO_ERR] = {
+		.type = ERR_SMPRO_TYPE,
+		.info_l = ERR_SMPRO_INFO_LO,
+		.info_h = ERR_SMPRO_INFO_HI,
+		.data_l = ERR_SMPRO_DATA_LO,
+		.data_h = ERR_SMPRO_DATA_HI,
+		.warn_l = WARN_SMPRO_INFO_LO,
+		.warn_h = WARN_SMPRO_INFO_HI,
+	},
+	[RAS_PMPRO_ERR] = {
+		.type = ERR_PMPRO_TYPE,
+		.info_l = ERR_PMPRO_INFO_LO,
+		.info_h = ERR_PMPRO_INFO_HI,
+		.data_l = ERR_PMPRO_DATA_LO,
+		.data_h = ERR_PMPRO_DATA_HI,
+		.warn_l = WARN_PMPRO_INFO_LO,
+		.warn_h = WARN_PMPRO_INFO_HI,
+	},
+};
+
+struct smpro_errmon {
+	struct regmap *regmap;
+};
+
+enum EVENT_TYPES {
+	VRD_WARN_FAULT_EVENT,
+	VRD_HOT_EVENT,
+	DIMM_HOT_EVENT,
+	NUM_EVENTS_TYPE,
+};
+
+/* Included Address of event source and data registers */
+static u8 smpro_event_table[NUM_EVENTS_TYPE] = {
+	VRD_WARN_FAULT_EVENT_DATA,
+	VRD_HOT_EVENT_DATA,
+	DIMM_HOT_EVENT_DATA,
+};
+
+static ssize_t smpro_event_data_read(struct device *dev,
+				     struct device_attribute *da, char *buf,
+				     int channel)
+{
+	struct smpro_errmon *errmon = dev_get_drvdata(dev);
+	s32 event_data;
+	int ret;
+
+	ret = regmap_read(errmon->regmap, smpro_event_table[channel], &event_data);
+	if (ret)
+		return ret;
+	/* Clear event after read */
+	if (event_data != 0)
+		regmap_write(errmon->regmap, smpro_event_table[channel], event_data);
+
+	return sysfs_emit(buf, "%04x\n", event_data);
+}
+
+static ssize_t smpro_overflow_data_read(struct device *dev, struct device_attribute *da,
+					char *buf, int channel)
+{
+	struct smpro_errmon *errmon = dev_get_drvdata(dev);
+	struct smpro_error_hdr *err_info;
+	s32 err_count;
+	int ret;
+
+	err_info = &smpro_error_table[channel];
+
+	ret = regmap_read(errmon->regmap, err_info->count, &err_count);
+	if (ret)
+		return ret;
+
+	/* Bit 8 indicates the overflow status */
+	return sysfs_emit(buf, "%d\n", (err_count & BIT(8)) ? 1 : 0);
+}
+
+static ssize_t smpro_error_data_read(struct device *dev, struct device_attribute *da,
+				     char *buf, int channel)
+{
+	struct smpro_errmon *errmon = dev_get_drvdata(dev);
+	unsigned char err_data[MAX_READ_BLOCK_LENGTH];
+	struct smpro_error_hdr *err_info;
+	s32 err_count, err_length;
+	int ret;
+
+	err_info = &smpro_error_table[channel];
+
+	ret = regmap_read(errmon->regmap, err_info->count, &err_count);
+	/* Error count is the low byte */
+	err_count &= 0xff;
+	if (ret || !err_count || err_count > err_info->max_cnt)
+		return ret;
+
+	ret = regmap_read(errmon->regmap, err_info->len, &err_length);
+	if (ret || err_length <= 0)
+		return ret;
+
+	if (err_length > MAX_READ_BLOCK_LENGTH)
+		err_length = MAX_READ_BLOCK_LENGTH;
+
+	memset(err_data, 0x00, MAX_READ_BLOCK_LENGTH);
+	ret = regmap_noinc_read(errmon->regmap, err_info->data, err_data, err_length);
+	if (ret < 0)
+		return ret;
+
+	/* clear the error */
+	ret = regmap_write(errmon->regmap, err_info->count, 0x100);
+	if (ret)
+		return ret;
+	/*
+	 * The output of Core/Memory/PCIe/Others UE/CE errors follows the format
+	 * specified in section 5.8.1 CE/UE Error Data record in
+	 * Altra SOC BMC Interface specification.
+	 */
+	return sysfs_emit(buf, "%*phN\n", MAX_READ_BLOCK_LENGTH, err_data);
+}
+
+/*
+ * Output format:
+ * <4-byte hex value of error info><4-byte hex value of error extensive data>
+ * Where:
+ *   + error info : The error information
+ *   + error data : Extensive data (32 bits)
+ * Reference to section 5.10 RAS Internal Error Register Definition in
+ * Altra SOC BMC Interface specification
+ */
+static ssize_t smpro_internal_err_read(struct device *dev, struct device_attribute *da,
+				       char *buf, int channel)
+{
+	struct smpro_errmon *errmon = dev_get_drvdata(dev);
+	struct smpro_int_error_hdr *err_info;
+	unsigned int err[4] = { 0 };
+	unsigned int err_type;
+	unsigned int val;
+	int ret;
+
+	/* read error status */
+	ret = regmap_read(errmon->regmap, GPI_RAS_ERR, &val);
+	if (ret)
+		return ret;
+
+	if ((channel == RAS_SMPRO_ERR && !(val & BIT(0))) ||
+	    (channel == RAS_PMPRO_ERR && !(val & BIT(1))))
+		return 0;
+
+	err_info = &list_smpro_int_error_hdr[channel];
+	ret = regmap_read(errmon->regmap, err_info->type, &val);
+	if (ret)
+		return ret;
+
+	err_type = (val & BIT(1)) ? BIT(1) :
+		   (val & BIT(2)) ? BIT(2) : 0;
+
+	if (!err_type)
+		return 0;
+
+	ret = regmap_read(errmon->regmap, err_info->info_l, err + 1);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(errmon->regmap, err_info->info_h, err);
+	if (ret)
+		return ret;
+
+	if (err_type & BIT(2)) {
+		/* Error with data type */
+		ret = regmap_read(errmon->regmap, err_info->data_l, err + 3);
+		if (ret)
+			return ret;
+
+		ret = regmap_read(errmon->regmap, err_info->data_h, err + 2);
+		if (ret)
+			return ret;
+	}
+
+	/* clear the read errors */
+	ret = regmap_write(errmon->regmap, err_info->type, err_type);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%*phN\n", (int)sizeof(err), err);
+}
+
+/*
+ * Output format:
+ * <4-byte hex value of warining info>
+ * Reference to section 5.10 RAS Internal Error Register Definition in
+ * Altra SOC BMC Interface specification
+ */
+static ssize_t smpro_internal_warn_read(struct device *dev, struct device_attribute *da,
+					char *buf, int channel)
+{
+	struct smpro_errmon *errmon = dev_get_drvdata(dev);
+	struct smpro_int_error_hdr *err_info;
+	unsigned int warn[2] = { 0 };
+	unsigned int val;
+	int ret;
+
+	/* read error status */
+	ret = regmap_read(errmon->regmap, GPI_RAS_ERR, &val);
+	if (ret)
+		return ret;
+
+	if ((channel == RAS_SMPRO_ERR && !(val & BIT(0))) ||
+	    (channel == RAS_PMPRO_ERR && !(val & BIT(1))))
+		return 0;
+
+	err_info = &list_smpro_int_error_hdr[channel];
+	ret = regmap_read(errmon->regmap, err_info->type, &val);
+	if (ret)
+		return ret;
+
+	if (!(val & BIT(0)))
+		return 0;
+
+	ret = regmap_read(errmon->regmap, err_info->warn_l, warn + 1);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(errmon->regmap, err_info->warn_h, warn);
+	if (ret)
+		return ret;
+
+	/* clear the warning */
+	ret = regmap_write(errmon->regmap, err_info->type, BIT(0));
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%*phN\n", (int)sizeof(warn), warn);
+}
+
+#define ERROR_OVERFLOW_RO(_error, _index) \
+	static ssize_t overflow_##_error##_show(struct device *dev,            \
+						struct device_attribute *da,   \
+						char *buf)                     \
+	{                                                                      \
+		return smpro_overflow_data_read(dev, da, buf, _index);         \
+	}                                                                      \
+	static DEVICE_ATTR_RO(overflow_##_error)
+
+ERROR_OVERFLOW_RO(core_ce, CORE_CE_ERR);
+ERROR_OVERFLOW_RO(core_ue, CORE_UE_ERR);
+ERROR_OVERFLOW_RO(mem_ce, MEM_CE_ERR);
+ERROR_OVERFLOW_RO(mem_ue, MEM_UE_ERR);
+ERROR_OVERFLOW_RO(pcie_ce, PCIE_CE_ERR);
+ERROR_OVERFLOW_RO(pcie_ue, PCIE_UE_ERR);
+ERROR_OVERFLOW_RO(other_ce, OTHER_CE_ERR);
+ERROR_OVERFLOW_RO(other_ue, OTHER_UE_ERR);
+
+#define ERROR_RO(_error, _index) \
+	static ssize_t error_##_error##_show(struct device *dev,            \
+					     struct device_attribute *da,   \
+					     char *buf)                     \
+	{                                                                   \
+		return smpro_error_data_read(dev, da, buf, _index);         \
+	}                                                                   \
+	static DEVICE_ATTR_RO(error_##_error)
+
+ERROR_RO(core_ce, CORE_CE_ERR);
+ERROR_RO(core_ue, CORE_UE_ERR);
+ERROR_RO(mem_ce, MEM_CE_ERR);
+ERROR_RO(mem_ue, MEM_UE_ERR);
+ERROR_RO(pcie_ce, PCIE_CE_ERR);
+ERROR_RO(pcie_ue, PCIE_UE_ERR);
+ERROR_RO(other_ce, OTHER_CE_ERR);
+ERROR_RO(other_ue, OTHER_UE_ERR);
+
+static ssize_t error_smpro_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_internal_err_read(dev, da, buf, RAS_SMPRO_ERR);
+}
+static DEVICE_ATTR_RO(error_smpro);
+
+static ssize_t error_pmpro_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_internal_err_read(dev, da, buf, RAS_PMPRO_ERR);
+}
+static DEVICE_ATTR_RO(error_pmpro);
+
+static ssize_t warn_smpro_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_internal_warn_read(dev, da, buf, RAS_SMPRO_ERR);
+}
+static DEVICE_ATTR_RO(warn_smpro);
+
+static ssize_t warn_pmpro_show(struct device *dev, struct device_attribute *da, char *buf)
+{
+	return smpro_internal_warn_read(dev, da, buf, RAS_PMPRO_ERR);
+}
+static DEVICE_ATTR_RO(warn_pmpro);
+
+#define EVENT_RO(_event, _index) \
+	static ssize_t event_##_event##_show(struct device *dev,            \
+					     struct device_attribute *da,   \
+					     char *buf)                     \
+	{                                                                   \
+		return smpro_event_data_read(dev, da, buf, _index);         \
+	}                                                                   \
+	static DEVICE_ATTR_RO(event_##_event)
+
+EVENT_RO(vrd_warn_fault, VRD_WARN_FAULT_EVENT);
+EVENT_RO(vrd_hot, VRD_HOT_EVENT);
+EVENT_RO(dimm_hot, DIMM_HOT_EVENT);
+
+static struct attribute *smpro_errmon_attrs[] = {
+	&dev_attr_overflow_core_ce.attr,
+	&dev_attr_overflow_core_ue.attr,
+	&dev_attr_overflow_mem_ce.attr,
+	&dev_attr_overflow_mem_ue.attr,
+	&dev_attr_overflow_pcie_ce.attr,
+	&dev_attr_overflow_pcie_ue.attr,
+	&dev_attr_overflow_other_ce.attr,
+	&dev_attr_overflow_other_ue.attr,
+	&dev_attr_error_core_ce.attr,
+	&dev_attr_error_core_ue.attr,
+	&dev_attr_error_mem_ce.attr,
+	&dev_attr_error_mem_ue.attr,
+	&dev_attr_error_pcie_ce.attr,
+	&dev_attr_error_pcie_ue.attr,
+	&dev_attr_error_other_ce.attr,
+	&dev_attr_error_other_ue.attr,
+	&dev_attr_error_smpro.attr,
+	&dev_attr_error_pmpro.attr,
+	&dev_attr_warn_smpro.attr,
+	&dev_attr_warn_pmpro.attr,
+	&dev_attr_event_vrd_warn_fault.attr,
+	&dev_attr_event_vrd_hot.attr,
+	&dev_attr_event_dimm_hot.attr,
+	NULL
+};
+
+ATTRIBUTE_GROUPS(smpro_errmon);
+
+static int smpro_errmon_probe(struct platform_device *pdev)
+{
+	struct smpro_errmon *errmon;
+
+	errmon = devm_kzalloc(&pdev->dev, sizeof(struct smpro_errmon), GFP_KERNEL);
+	if (!errmon)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, errmon);
+
+	errmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!errmon->regmap)
+		return -ENODEV;
+
+	return 0;
+}
+
+static struct platform_driver smpro_errmon_driver = {
+	.probe          = smpro_errmon_probe,
+	.driver = {
+		.name   = "smpro-errmon",
+		.dev_groups = smpro_errmon_groups,
+	},
+};
+
+module_platform_driver(smpro_errmon_driver);
+
+MODULE_AUTHOR("Tung Nguyen <tung.nguyen@amperecomputing.com>");
+MODULE_AUTHOR("Thinh Pham <thinh.pham@amperecomputing.com>");
+MODULE_AUTHOR("Hoang Nguyen <hnguyen@amperecomputing.com>");
+MODULE_AUTHOR("Thu Nguyen <thu@os.amperecomputing.com>");
+MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
+MODULE_DESCRIPTION("Ampere Altra SMpro driver");
+MODULE_LICENSE("GPL");
-- 
2.35.1

