Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAC04E21DD
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 09:15:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMS9315W5z30G6
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 19:15:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=DNhYiLDu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8a::72c;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=DNhYiLDu; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMS8c1WlTz2xF0
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 19:14:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfNabEBF8n+/16qurOO3a6yhDU5OdHYvc++EYmCLhYtXdwDPSBQU3YOz2FuMVkn/n8gvy7j4G6xOWbLENEIC7oCCMyOiMxIL7QBZShrLOKN7uGRBE+W8rWMV3VU4Apl3IJYiQHZMNEXPuqH9O30a4YZqbqYfykfdG1cwGu21TY5P9iWx9t8PE3UK3w6za4c8hyNqGdWTgxauYaiM9Q+yY9J79rqYPpz5dYmGKTIaaN+keGxhPyl4Z1T32+PvpmcDgHFOnkU7Hl78gAUxt+MePT5d/N6/yNGbT84LL/G+h65WXeD3msHnpji6x+synmUFkw0PT48+PPbcPe3l4CvEQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STqtF5nkbDBMoESOnwi6xIY9VrkPK2Gt2YkGRSobuI4=;
 b=dyLOjWxcaFQK4HCuN9w/2p+ac1J2chLFucP79y+qClmYEP0WFYtiNksby7uqCz8gumVoPE3whZMHQ8GkV+GTOF99OV2AS2fCyqwpxfrR/YQV9FuCSdrFeIlq7yEpW2KUEI97uAMgrxgPm7i5aw/TpNoyOG3KRybGceqtjboz9WkQUMjmMNetSqAeCEjCI+HSni/10jhcT9gkS5qGXI0X05CWgCIpGuvX0oVnNTQAp5LXfSolzVgOVfJc0AQu70WcAP2IZMs3+I4kEhoPq4LR2AgtgAoOt5TY4Ttafev0ARAhY3fxAbRUq4D77Sv2E00ZrUTJaWTn6po7A/RLfNW8Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STqtF5nkbDBMoESOnwi6xIY9VrkPK2Gt2YkGRSobuI4=;
 b=DNhYiLDuH62Cmqkiobavylrz7GP0q0bjw7U+Nne/CTRoLW5tE1tgZkx+NiKFf1KUb1zC9/jRGHE2Hyh9C7fts56ef1Z+ACr+fXdvHFIw2oN/6S5O+Uet+42v/U2SowjBtDfUzdo/GLG4/UTKD7YAG3uc44mUUFfX3gNOgPUsnY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BN6PR01MB2738.prod.exchangelabs.com (2603:10b6:404:ce::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14; Mon, 21 Mar 2022 08:14:33 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%8]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 08:14:32 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Thu Nguyen <thu@os.amperecomputing.com>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 linux-kernel@vger.kernel.org (open list),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v7 0/9] Add Ampere's Altra SMPro MFD and its child drivers
Date: Mon, 21 Mar 2022 15:13:46 +0700
Message-Id: <20220321081355.6802-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::22)
 To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b04e44e8-8557-4cfc-c24c-08da0b12d410
X-MS-TrafficTypeDiagnostic: BN6PR01MB2738:EE_
X-Microsoft-Antispam-PRVS: <BN6PR01MB273866D0787057D916E628ACF2169@BN6PR01MB2738.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Zatu/ayNy1IXpO4A5Gxx4s5OCyRWumFtwoiTCgrNjuW7+rA/thz2Yau6w5pUudhfm4wQQQgvlFAE6izdVJV71kdoNyfH4mY99Jj5bRyRXNkIJA9v4YSNogtyFrxQ6gCXJQztJsE7mYQw34eXOVT5QnKBwMRphCthtJA0VYhYzzdq0rmsALHh3jNAv4hYazjuxdAqWt5k5D8xhWo+xGJk2raGAG3FiTL+1dJD9Ou54TFgV84cgxGZURUOfsoCD9ntMJTlMVjOfhm2ahGF35i/Xqx99Cx6A4osuyW8jkfIhTXZ12def1KdUXwbGkhmt12ocCfvfds5cajn8KW7xjJZZioCFLTi92X0VKHmb9LQEiMgpZVOyo85QZ/+ZMhAU/xaTIuJZeg3quHft5kGx3tSBpfE/B5VtSSFs+G9ix4zQKLXZZjftSaoEbV7Hsnf9kaLcnrxrBMJwrTxKJR78uKQ8gZFgjKl/rc4WxYPTae9ugl6x6P52dibC6XuqvfMqiPp337TO1kGMEbKSw2z3UApWMdWE1ei9p12+c1nrfzaYVR22JqeiHTmvuTDS+SSIiTkoP4OjOqRSGTMDEvrxcPkLaZwuP8Emm3gi0flU3RfYfIfallrOjb80JhR4GYiFvZyEu8+bfhaRj2n4XAi8oDYdL9g6zX/4Mu2lLIt5W/P89FNLRYB401sSJX73xO0I6k00BJa1Br580Qo3U5Vu4YO7TIgb8WCmDDj4iKkklqDab1QpVEiqe4qcDdzr3M2ravnWsg/Xj9LjK/Gx2YBzm3e1QvP1K9xqqhAozaHzk7sYpJ8aTJdavhsK0oJ4M7fhBJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(66476007)(66556008)(6512007)(66946007)(7416002)(107886003)(186003)(1076003)(86362001)(38350700002)(4326008)(5660300002)(8676002)(26005)(316002)(52116002)(110136005)(921005)(54906003)(2616005)(2906002)(508600001)(8936002)(6486002)(6506007)(966005)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HH3M20RRi1bEPj+AACgJ6qxz9allBrGbIczGieByaERi7fhzkY7uXYpFYUEA?=
 =?us-ascii?Q?TbvWEQuG6EuBP8Br8Jy+Py4SoiFt1Hg51YjK/NDP0QQ3VXWdGQ/B3Qdmi+vC?=
 =?us-ascii?Q?1pv2u+4W5emXyHD5Tt39CYin4tTdAzj1/rsCbJLojcw9TolMbtgIvQDcqlHc?=
 =?us-ascii?Q?Jw34K/Yrv9B7SCBQ4vvMfMua5cjwl4FR6Kqofqc1QjnXiuuZ8PCwPVpBNIU1?=
 =?us-ascii?Q?efSKQyYzkWhmAsoKYizuHMxMnmyKQOHQxLb7FuKuH4l1JnPhLlgBEiMJf9WK?=
 =?us-ascii?Q?uklZejmA4C8syt2mjbF7l1369n0FC6bnJKK5edIRpgKjj5lO2T7q1Q/+bclx?=
 =?us-ascii?Q?3OMrfOHwJNFX32wCUWEWUUYFmEiE2MgEGnf68VdTAbJCGau4E7PERnMjh32y?=
 =?us-ascii?Q?LyQq9ntAZYQIT0P/agNWIbvYDcVg3NH10/r2cYpOhIbvD6CDldcHtovobjAC?=
 =?us-ascii?Q?wrwFnKqlhHa+dgqzBLon7yTdwsiXQGe/XNPpuk5SsumyL/2+RstUJQYZGd2f?=
 =?us-ascii?Q?WqFIeE3XRDOlUDcZ9/YUWmN8KIHeNz+uMCPXeh0EhcHGd4RGfzWKfbJb7HoG?=
 =?us-ascii?Q?7mlrFtGDW3kzR2Abxxx1DhcokvxFzlH4QUsHAHi1p3AC4JiJ91orhG1Ifwqq?=
 =?us-ascii?Q?+EXHf8opQQXAg/eeIqKkRQXHYZEJ5GSTC/CkR57xJSWTUCfBmvHKs3TPpcyT?=
 =?us-ascii?Q?SOpjUGjxpLY9PGGVllorKNE2YzV6+9MTR2ZB16KgxoV/E0Pf+lNN/ofRm99V?=
 =?us-ascii?Q?lLVdDVkD0uADJaBrmWtgeIsJOVwHkpRIdpjKOj1fIs6P3R10Q3bKXqyVKFGE?=
 =?us-ascii?Q?dQklPt5U9ejKwQ0Vuwn6/MXhsyNLGkZah8f6XURmtPzDbXDdAcKmD64/vh85?=
 =?us-ascii?Q?owp+e46Bj2IOsmHqpAjmEcXGXrvnTiUTJZDGQaDw0he4jjMU39LcLJkcVtwc?=
 =?us-ascii?Q?qxRGJgGg3oTbR61oUqndPBcSQqx0DnORV5Ta1CjweNFbI0XoMjEkSr+qmcf3?=
 =?us-ascii?Q?cu3Q7dZZa8iUQg3KKJmpUUJgJuEqD8XSFXtl947NxQfm/AmWnc6KROwGNm0z?=
 =?us-ascii?Q?MpysdzLn2jIlXg9jJJxYccl5c0I2sPxzR97PZyXch5TQEDzJna9TT8Qy3Mt3?=
 =?us-ascii?Q?xlSrcReHzG8hDdfUdhb+NM16dMp8zrW11K7caJosIrcSjN6f654gKTe7b2ns?=
 =?us-ascii?Q?Rub1lWqov97lIK39+xlOfMrth8oVCH2V/R+8VKRNJdW1HLWasw5mfr9wsQOu?=
 =?us-ascii?Q?MsNoP+5bDxLxZAncFhbgP8QQ1FSQd/Y90xFrffJ2iv/IzFDW8CWapPG+phcr?=
 =?us-ascii?Q?TQpolyXW9tFjyrDa+VoCp7sdL18drKXbfALnJx9YFvkjfMvnUSSFePRkCgap?=
 =?us-ascii?Q?hAfPpYL6jQd6O7HdY3P0y/6h7ovBDDP84lDn2OMNCiUcEu6CG4AgO65mZ8KW?=
 =?us-ascii?Q?8wfGB2xHw6Au2a/EVsaOhgbbVHj7W2yiIbCLTGaNJfr52uhqzmPoEe1iZasv?=
 =?us-ascii?Q?kdJWqQaDFzNc8zg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b04e44e8-8557-4cfc-c24c-08da0b12d410
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 08:14:32.4655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XodbWveoAKEuKo2ch0ZFK+Er7IWbVoQZzXubLp05Y8Ida08XW9MRHn9oFzV9qYLGFXwrm8PysnW7+KFyAoKee9UvThC8hdBSg1BVLeThqhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR01MB2738
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
other miscellaneous information. The SMPro MFD driver intializes the
register map and instantiates all sub-devices. All the specifics will
be handled in the child drivers.

This patch set includes support for Ampere SMpro hwmon, errmon, and
misc as the child drivers. The hwmon driver supports accessing various
CPU sensors provided by the SMpro co-processor including temperature,
power, voltages, and current found on Ampere Altra processor family.
The errmon driver supports monitoring and reporting RAS-related errors.
The misc driver is to support reporting boot progress and other
miscellaneous information.

Discuss for v6: https://lkml.org/lkml/2021/12/23/760

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

 .../sysfs-bus-platform-devices-ampere-smpro   | 133 +++++
 .../devicetree/bindings/mfd/ampere,smpro.yaml |  48 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/smpro-hwmon.rst           | 101 ++++
 Documentation/misc-devices/index.rst          |   2 +
 Documentation/misc-devices/smpro-errmon.rst   | 206 +++++++
 Documentation/misc-devices/smpro-misc.rst     |  82 +++
 drivers/hwmon/Kconfig                         |   8 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/smpro-hwmon.c                   | 463 ++++++++++++++++
 drivers/mfd/Kconfig                           |  12 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/smpro-mfd.c                       | 134 +++++
 drivers/misc/Kconfig                          |  14 +
 drivers/misc/Makefile                         |   2 +
 drivers/misc/smpro-errmon.c                   | 517 ++++++++++++++++++
 drivers/misc/smpro-misc.c                     | 177 ++++++
 17 files changed, 1902 insertions(+)
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

