Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D883C6A2B
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 08:01:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP94f2dcRz309Z
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 16:01:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=tcmFlByJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.96;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=tcmFlByJ; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2096.outbound.protection.outlook.com [40.107.223.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP94G6S7Qz2yMs;
 Tue, 13 Jul 2021 16:01:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAi1oaYPzLfrD4/FDnQBeCau6zXBZtEsN+eUZ8h0EDGt7Njjnl0h/i1ZJbFdaTM0e2osq5caAJv8Y7kT8WlpZODNc3b8H8Nck6LlPjv+uMAulpCa3Ef/FODbzlRVLFdG99eIzTgPXS8AzA0Ucsj/7OB1a6nYkDHUOz0GFyuxWMJ12SxRBV8U+xLw3LAJzyxg0VS0/fFtWOKMBe9IOYCDEwD63TjnnAngNvjgLu1o2DgSYeCTfTU0K+bgg2ULdBgw/zDz/9lLiBu1ccxmiDJ0x8kjb24QHpOuHUv++55W+VncvxLrQBlATMOIGQQN+o42Cu6bmAkUvirauBsXNlHfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpI2DB3LowwXkWjhZj1eu9Brd7NJtIUUsTgO/PMskHk=;
 b=VyroCLl7TUk0DF4yOOHxpEJH5+W+bI569ja6h0IF2z2AD0J/kV3ELXh1+filRnPcxA7OUl+8clgpnd1Tx+J4aFCXcwXJlydabBZ+ATRPdiiq8SqgiGz1iKL/w+ArVNfD92ea62oi2wKxryzkHNaxcmBdCVad0eL3I11uWO+ybu4Cw//WzqqzP76DXlbp3FEWyGMfLShwcTLYheHUFPQBBg6ZRe36Zhwt5Etu0smQjvNDYjlEDQn4MoMBrVym69HL4i1r0sTq5kkevqNqiQAYm/dhQCh/ZlH8J1fGYYZ/4rPpCncyBa9ZMTaAUJ3AFFFtWYYiyyYo2tLKeNTDQvEmUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpI2DB3LowwXkWjhZj1eu9Brd7NJtIUUsTgO/PMskHk=;
 b=tcmFlByJb7aFtHqleAqIjpsscdFY7ualR6RMAk7OCr7jFUghAnb2ygTfMfkearlussGBfwqZ5dnyWOA+4hJrcTvOqM46hdoCJhWXS8CWbNx0FN8zqSjro8ixh6N8O5ORTQknp/j0VmmjA5296ma/HvEO6ho3QaZM6hZyjbuCUgs=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6323.prod.exchangelabs.com (2603:10b6:303:78::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20; Tue, 13 Jul 2021 06:00:57 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::452a:24fb:12cb:9d7e%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 06:00:57 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v5 0/4] Add Ampere's Altra SMPro hwmon driver
Date: Tue, 13 Jul 2021 13:00:27 +0700
Message-Id: <20210713060031.31568-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0052.apcprd03.prod.outlook.com
 (2603:1096:202:17::22) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK2PR03CA0052.apcprd03.prod.outlook.com (2603:1096:202:17::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.10 via Frontend Transport; Tue, 13 Jul 2021 06:00:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f22a43d-6bde-446a-cc52-08d945c394be
X-MS-TrafficTypeDiagnostic: MW4PR01MB6323:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB6323A4F989F1608272EA88ADF2149@MW4PR01MB6323.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QnPX/aSaMlt5JnCvwL5CFeYXutVSQojuOAKddvyFO1U9ECnswj1H53BBz1i2kLNd75ac/7y758hUM65IGIt8ganl0CfDM+KVItPbhjFkTlBNuoCM8nBoSVvJxvAMmWYM/RtoJaCXR9bftXnsMQGRmAC+VyutaAlfObKYbwtYhuLD0dYQy9AT97cZ4WZAywribWYkCE64zfJ0+lXeDgGqCZkmAaI6IMwPF8fPSAlYkTtibeHQnckdhdZXk5PD7V87/OHrcUlvMeSYsaUt20jIe6jk7w4jKC9NGpYk0c1dZSEDzC/BH+dYlTfky2vpZTAz7FvB8ApXiywooUdh+bMqtoBGJdDa6ZPopsQX4T8uCJT7sRzDL8rW8KV3aeR2Q4RMdNXRVFumPjOS6mpDd6MN3+he8XJH0LGw+8KfOSHAepWoezO62UMkCPVn5nO6LKdVXuQRnACDiHKVjb94mMmJBxRrk6TiUUB029Q84AClmv3W/OZCOoymsxpsVaVD9m69lA6iec1pu3Ij54r6gbFaknhHfBkSc5CXIRkGL4fHN+IhOCs6680rKl4RiQnW1a+htEhZjz1amXKqpnJ5qvkp4WqTkaDO0Mr4p1n2Gg8y5rfMjsVf8O7CYX3xzJQFtoV75Sn6sNt/0XCX6XL4gd+rokpyWhLnYzyZK6CziHd8ajvLhd5ieK+McWcIAaXueWl240K5naxHqH1h6zBmzZPr6/rg4qJHNj3FmA+tU1/KAGw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(346002)(376002)(396003)(366004)(136003)(1076003)(6486002)(6506007)(66556008)(52116002)(66476007)(8936002)(26005)(86362001)(6512007)(4326008)(956004)(2616005)(2906002)(8676002)(6666004)(54906003)(110136005)(186003)(66946007)(478600001)(7416002)(38100700002)(83380400001)(5660300002)(38350700002)(107886003)(921005)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rqPlT15u4aKw8kPIFqFkSvY2KoVnhY36Zl2T6Tb63rUq9E0Lp1s5zxU79wJY?=
 =?us-ascii?Q?uXrHaLw6FbaKFBE7iyZj7fcyWXdpe9D43B3DD+cT2zGTqxLjY+0XOjS03zdq?=
 =?us-ascii?Q?fBhoORYikb6N0GL40bI+zCuvfEUnvP6gGCZj0TSctzjXMyIgzgUDzqWsMiwp?=
 =?us-ascii?Q?3LphzRBs6PjxRB8Jo0r+DirPEd6ybACIDgfeyywgp12n5f04PutRqP+1lmUc?=
 =?us-ascii?Q?ufW4K+ciXrJiHkAMt90buvgfj2snNRNR9GiEphneCBjzqQq2fP4lEvVeQnf4?=
 =?us-ascii?Q?zkA74fQcDbz8QD3uEtOWZJtp5WRwGFk84me8pQ3SJsUCYp5wA3m2dehGHYXH?=
 =?us-ascii?Q?8ZClZgGfiRuBCwLZb+rvW9QBwAMtw7Bi/PCA86JdfpZHzsvtSCV9U+KLeHGh?=
 =?us-ascii?Q?HV7H21+ZAmFyFYdHD/OmQM8VOs7rh3HOzz8OdNQO1XF6xiCMzbcMH1NjrkWr?=
 =?us-ascii?Q?3h1/kjUxh/dPW5S6VFxoeWwV4B8WiNWwvLtQuu8+bJ1lrAUDQZENtfHpH4dE?=
 =?us-ascii?Q?hRabaE5Rh2cVriMsXzWIS1G0p73LIKJUpmRdqiWqqpHcrwxzEyoFyC+YrIqW?=
 =?us-ascii?Q?Ax/7GeWwzJAG73jwUbC+TU2ZXJkOYUq5PjM/HT3k6iPy1n9D4Zda3mcAn64L?=
 =?us-ascii?Q?si9YNuRo786DFOxSJ+5czlyQkdZhtdtdCQ6fsTe93IMmd6W1g6JwRwp6hh3X?=
 =?us-ascii?Q?Asxke1PqlR8fgDj19DkFTumPdP22quqfGZn5ZKnvmQQlteeNh/GUcINyZdu6?=
 =?us-ascii?Q?kBBltk4aJPT1hT8uV1A9VC01ZQmYIwB+Wn5qeeWaAlxNoS2kmZHJLWw31FhI?=
 =?us-ascii?Q?dc6ZfRpQfr+A5lza7fuSAyOa2pRlg5gOJBS4uHnL1OBg3N6MThzoErMfwyps?=
 =?us-ascii?Q?MvcuXrtW7ndsqJodSbLi3u/7ZSEiIMA9CTxNZ3MTHDPvdxlbydI0aoznptqb?=
 =?us-ascii?Q?vyerTOZF53Fg7H3cVzlCuZeCQqLdI0n8gYu9N9Cw2fzValX4pIcrDXzlSxJS?=
 =?us-ascii?Q?rUF9PGzUsApx+npe9bKvIYugBPm/Rd5dsiCTu492cTFsyaeh5qYfoFjew/vk?=
 =?us-ascii?Q?bGt4ThLdOyQ3/IvoaoyZh0IirAvErH5UlvYOPVMNAciGaB66H80iEpyDjQVC?=
 =?us-ascii?Q?o4+cacjtt27WURtvzdZxWBEmMhPYIg6E89wDHZAgYuSu4+SYib8M3zx1lPr7?=
 =?us-ascii?Q?RYuh8j4rfiBBKFTZybJYp7nBD8WRFeiibVYDP7XnE1C8lLSAA+CDnbJKzIr5?=
 =?us-ascii?Q?weV5nBoRGQHTbi4hOfA9tUWHVJL3DydplIrxD37YiWUHk9dUgnTh1L/sG1J5?=
 =?us-ascii?Q?NmPgMeFxb2cT5g+9kjBfUk3J?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f22a43d-6bde-446a-cc52-08d945c394be
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 06:00:57.0174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7hKmBHOQXWRDegLSowWvRvUpb9Y0hDhy7nFVHix99UKu4AmKwAVz6I7UPCgXtfxwB4/JKNpWlyBXpx19NC9IUg5RHvQvfLOxtFOhvIK4mw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6323
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
other miscellaneous information. The SMPro MFD driver intializes the
register map and instantiates all sub-devices. All the specifics will
be handled in the child drivers.

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

Quan Nguyen (4):
  dt-bindings: mfd: Add bindings for Ampere Altra SMPro MFD driver
  mfd: smpro-mfd: Adds Ampere's Altra SMpro MFD driver
  hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
  docs: hwmon: (smpro-hwmon) Add documentation

 .../devicetree/bindings/mfd/ampere,smpro.yaml |  52 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/smpro-hwmon.rst           | 101 ++++
 drivers/hwmon/Kconfig                         |   8 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/smpro-hwmon.c                   | 463 ++++++++++++++++++
 drivers/mfd/Kconfig                           |  12 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/smpro-mfd.c                       |  74 +++
 9 files changed, 713 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
 create mode 100644 Documentation/hwmon/smpro-hwmon.rst
 create mode 100644 drivers/hwmon/smpro-hwmon.c
 create mode 100644 drivers/mfd/smpro-mfd.c

-- 
2.28.0

