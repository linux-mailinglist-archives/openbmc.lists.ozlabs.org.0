Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D79247EB37
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 05:15:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKtyY3CM5z2yfr
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 15:15:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=i6e8yI3d;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.136;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=i6e8yI3d; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2136.outbound.protection.outlook.com [40.107.220.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKty56Wkxz2xXZ;
 Fri, 24 Dec 2021 15:15:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvOH8gZ7a7GpFKOh9ZeOjIHJJh+NhzM1985uey8JTIoTtdK5+bDwexDmPzmLfGvwR9wuE0H98pL30EVRRkwc+pqlSvVWKfQdx0DTnBS0NPrLC2Fd+YLgmazMhJICB4iDA6hTO1lIByUhZlLcmUGoaDH0pKrqNiEdH0h8cI/82L+SmemEhoR15ddhg6xkC+0ySIgZ36a3bLqQJNRqWuCGkwJ7CF/KZEtjxE+sZKwsHyVgJBfoJw+2O/XvDQHfqcq5g7P+lz4bGrBoKvaQ8InY4JshbDPLPlyxc7v/q6ElfIefnW9zVNFYzC/hsWtu2MocxWO0wbJLbh5vls/x3wwJwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBh+F0uDhHjazkNSCgQiPa8X0nKBzz/c9ZalNcsz/fU=;
 b=chsYn2TlfLbuiWneF00KkjoJAqzI00SYsxVlAUXDQ5mcaXNbBNuFxvDx/ZnciyyWgucwRCNyeZfjwrx9a5YmJw5VlbwnUfHWJfqybLEGL6AQTT2LbCWfZtL9Q0lTffI/9h3dEG3o9kdXBOaWQdqF29cJnUVoIbf0ggaNSC5RYoEb2Q7gJ3kIzwoi2qJEADvhlRVJpasVsUdmldQxTJvIsoKl/7ElFaUivmlRHXWaHoiv4QGDyoFlwfLwNBb+ThzH6c1KjIMev7zesEMNv58vjKNfrIHis7tB83OebhMrfXPX4sF7iKNFeuJyVyYqlIa/IrClpbqLdOaYyBQfeV1etQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBh+F0uDhHjazkNSCgQiPa8X0nKBzz/c9ZalNcsz/fU=;
 b=i6e8yI3dF5xCVfpoqEWQybc1yUEXBVbMc8yERFhk4GCMU5p+dO7qhIRCsU99mtVNKAtvbhcHZbqXDyrVoyhqYzZysdPCGNFXY6U39pRCpg6EfWEYArd8/oIsfpQDwpFaJGTcMOTKx30jROD8fM83HB41GWiFI+J3E3NlyrNg9Io=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BYAPR01MB5189.prod.exchangelabs.com (2603:10b6:a03:78::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.21; Fri, 24 Dec 2021 04:14:47 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f957:680d:69b0:9999%4]) with mapi id 15.20.4801.019; Fri, 24 Dec 2021
 04:14:47 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Subject: [PATCH v6 0/9] Add Ampere's Altra SMPro MFD and its child drivers
Date: Fri, 24 Dec 2021 11:13:43 +0700
Message-Id: <20211224041352.29405-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0134.apcprd06.prod.outlook.com
 (2603:1096:1:1f::12) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30a61422-a31b-474d-71a7-08d9c693ec0e
X-MS-TrafficTypeDiagnostic: BYAPR01MB5189:EE_
X-Microsoft-Antispam-PRVS: <BYAPR01MB518949304562EC47E53C4233F27F9@BYAPR01MB5189.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wRJA4QLHDzf9BxS5ZIRW6lh/RTwfpvJiIlst79AJUJsC7BBUyHEKceXklHQLQoHTtG3aNRh8z0jVZbzMtnP+KNDUHMgPLMQsi5PaKCLZMguymPZ8XSi4Cal4gZwUQnuxIuLx2JP0hA5MdWiANaP3RB/+H92zUxXwEJN+aX0p7dpowgWIfyexIhlEpC32on4fEN5P1MuCnruZWw5vEiRGWV2u8vDqE9fo7ABzEaOyEy095n6BZLdUTZR1mWfSLnEr5zmFdvVW+wemNwxwh8pDRjuFYoPWfvZ7Gv4tG8lQ68272v3JuhIJ/lcjaff6feiLSYmw6kvsI1f618wUzJwv62i47wkol5RwdwGz7rZw9KTTnv8EggnjOhmyp5t/zUqEcWYsqG7mZ949RWwbQDu0nsFXcIavp7jVAdABa6kKpLl9BCVJc9KN3tFPwVOSaKUHuRLFPO6tH3q4gBHx1trSeaXER8lXd3vHULAbAkF3IZoXRT2jNMBixRq3VIJIE3gbj3n7k0vpnRSMS+isH5PR/PWyJzYet3fF8TNd88BWqymI+IaHvmMkM0OgGmZbfmj7LilHlTV9f2b6VHYaTBZKnBh15ihUdEZHwyb1jSQThWRXbl885+VMOc85OysqBbMeKLoinzXf4zVsEsKGUiaASK5hFKX+JnJ4CsvqMqc+zV/8HkJLWliOwdEQbiU2tTzJluwBxn5/dhckGR7lSr3eKTwro8Zr7679Fd+W+Jo33z2KEHyBb+Uf1JFUWnkG3GPganDMrdJRGbDWVgR9pSVlrznc1UfXCxJBGVWYAj1LHDx7S9cvZ8YZhAqWrTWWGzo6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(54906003)(86362001)(38100700002)(38350700002)(83380400001)(66476007)(52116002)(5660300002)(107886003)(2616005)(8676002)(66946007)(6666004)(66556008)(966005)(2906002)(508600001)(1076003)(4326008)(316002)(6506007)(8936002)(6486002)(26005)(186003)(6512007)(7416002)(921005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?npAI9aK1FMJT83G/w8IjYjCp6almSJsIZ19Y3rfO3LF+ujBS6FwR9cJTEQ8e?=
 =?us-ascii?Q?h+vxbD6HRTHobl9RuvZZwoLW5bulqJ/IotgDlii5LbjrTSvYKWYchuauoRnd?=
 =?us-ascii?Q?c2d9PbRjU5MYmD6Fz0NhvzGFXaRtyEI8lZr95Fq2CnF72FF6OfrdB0HpSzTJ?=
 =?us-ascii?Q?/OT6yKjmLI26O/1eNSb8thbhlaGYOHppAtLZsTDcCg9kqL0eQ7kAuIf8o2Jx?=
 =?us-ascii?Q?v7iSOvrvcdvngwdbR9uyqNPIuWMpKM2MXXvjGEkJIfnexQmZcwmi8d94aZ6h?=
 =?us-ascii?Q?KU+IJoLH+MIYcvuTusrtKWbS3VU62gh3pQK2mExQlxWM0Bs+wSg8OEoI6pYa?=
 =?us-ascii?Q?pJpEOETPh4lEnFXt0I+VHZAR5XSvtpgUnzk47KQmwtLTeG3nTe9IoCCdfk/4?=
 =?us-ascii?Q?Kbn3C2Tr8YuO/YN4AewTwz6ZpWt8BCACFTlCiLWsxgiE2rPl/M01hsQA1tkb?=
 =?us-ascii?Q?OhTzCop4OiMIdBDIktrzCqEaicnPc0LYE01yMpv13+eMb/eVWHBSRRf7nIfS?=
 =?us-ascii?Q?G9N5mBBll+DQuY/DgomD5uWTtIGZZ0It64A0hag6r1Us3sHkj2D7OYGrFBfg?=
 =?us-ascii?Q?ZanpQpk3ucO0OiVaaQMYP+ZQ8SAkkbgBhT9yTyGyGJwVPEU8x4S3LWfL1llv?=
 =?us-ascii?Q?v1uCrnlcxLToLJIx3ZnZ+fLEcDFHvZLrxfg3byV9xqj13SO2WKFqzIHEtyqL?=
 =?us-ascii?Q?YB0Y6zpMwsflDPi80UK9EERU6XeS4NIEGXGMc2awkp9ZgrzpP55du98SnCNN?=
 =?us-ascii?Q?IDweonyqAYnJ09xl1G51zNIDjOogrnSqIZus2cD6we6FtojOQKsPa/OTHDm8?=
 =?us-ascii?Q?Fc+TBkk0CWn5IEIdBqtMmmDy3lNIlw4tuwjdc0CQWaJQabOk72jB9MDHu2sf?=
 =?us-ascii?Q?e5HrVzddHiPCxvQFMJ7Jv79lKPJbrf/dA0V9zUjf71CRVMCuHLi0TkfMb3Qu?=
 =?us-ascii?Q?wIni0bM1qQNDGndLR6ze06jcjVpywHyoGb+Q7IjZUwAi14FbhUt0vqABy6kv?=
 =?us-ascii?Q?hN6cPwXiYinPoboEsZoPIN0cZs4d5+MFsRmtAepROq44kPudggztiHwvheKj?=
 =?us-ascii?Q?ibFFTWBp1nnUiVeL6boqddR4D9KDOIvJZmwrkGC6vYpipFe0gQknU7jZt49H?=
 =?us-ascii?Q?yNnwpJUqfryaO+Xk2rm6Ba8wN3jhei5Dl0OAHa3ALQFGf71tKuI3zAewhlHs?=
 =?us-ascii?Q?uJHkmzBGMpqEmV19P246nXK+RGECZZelgs2Xc3AQ+VAi/W19OwLi2TOfps52?=
 =?us-ascii?Q?vSaxYRPZU0mk7udUs/qI9isuxXoxFygw7KfqFkrdZHGHS6ggNX9bJpqBUp4B?=
 =?us-ascii?Q?zWjxHw6A2oYc9SDgFUSz872AKeYlbtSfpll9lsmlto1yyTITQUGnTIrEb5HT?=
 =?us-ascii?Q?JxFDzo8Q9O05M27VknH6URHs4RgynfrxXC/Bm7D2GGr/X/gSg7KL/JmQk8OO?=
 =?us-ascii?Q?GU4vF1Vaf/KnzPB2OLP7T7EGEsAOY19QmUUi6IT9etpJH/Ba09P024wALSyB?=
 =?us-ascii?Q?ZNZxUXZ8X4re7c3A192w+9dE8OR2nYNQ5oJ/QhZKn8yW+QQy+12pBWt7eZwH?=
 =?us-ascii?Q?ByqS+IwTboJodxBA+KW1zv1PMfSObwaRloVncuLElZWtCXIVaj0t5lcYIi2r?=
 =?us-ascii?Q?bc6Toe8imSvur803rXCqibCCvXKj5EYYCyqIMMD4HkFHc9pC89S/H5/GL+q7?=
 =?us-ascii?Q?SRfM1prO9jV670/8HPOyWe8N64M=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a61422-a31b-474d-71a7-08d9c693ec0e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 04:14:47.6428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUzhdOZ41M8JOol1J1YJgp4Dan7y/zLQOdToKl65+aBecRxiwahHQIPeJOvvgxdtYuEICyzsKxcmntvnDJymxQ6b85sEQl+LBSey6xGwARI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5189
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
 Phong Vo <phong@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>
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

v6:
  + Introduced smpro-errmon, smpro-misc as smpro-mfd sub-device [Quan]
  + Comments for v5: https://lkml.org/lkml/2021/7/13/49

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
  dt-bindings: mfd: Add bindings for Ampere Altra SMPro MFD driver
  mfd: smpro-mfd: Adds Ampere's Altra SMpro MFD driver
  hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
  docs: hwmon: (smpro-hwmon) Add documentation
  regmap: Introduces regmap lock helpers
  misc: smpro-errmon: Add Ampere's SMpro error monitor driver
  docs: misc-devices: (smpro-errmon) Add documentation
  misc: smpro-misc: Add Ampere's Altra SMpro misc driver
  docs: misc-devices: (smpro-misc) Add documentation

 .../devicetree/bindings/mfd/ampere,smpro.yaml |  48 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/smpro-hwmon.rst           | 101 ++++
 Documentation/misc-devices/index.rst          |   2 +
 Documentation/misc-devices/smpro-errmon.rst   | 206 +++++++
 Documentation/misc-devices/smpro-misc.rst     |  82 +++
 drivers/base/regmap/regmap.c                  |  12 +
 drivers/hwmon/Kconfig                         |   8 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/smpro-hwmon.c                   | 463 ++++++++++++++
 drivers/mfd/Kconfig                           |  12 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/smpro-mfd.c                       |  78 +++
 drivers/misc/Kconfig                          |  14 +
 drivers/misc/Makefile                         |   2 +
 drivers/misc/smpro-errmon.c                   | 571 ++++++++++++++++++
 drivers/misc/smpro-misc.c                     | 177 ++++++
 include/linux/regmap.h                        |   2 +
 18 files changed, 1781 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
 create mode 100644 Documentation/hwmon/smpro-hwmon.rst
 create mode 100644 Documentation/misc-devices/smpro-errmon.rst
 create mode 100644 Documentation/misc-devices/smpro-misc.rst
 create mode 100644 drivers/hwmon/smpro-hwmon.c
 create mode 100644 drivers/mfd/smpro-mfd.c
 create mode 100644 drivers/misc/smpro-errmon.c
 create mode 100644 drivers/misc/smpro-misc.c

-- 
2.28.0

