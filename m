Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C932612F1E
	for <lists+openbmc@lfdr.de>; Mon, 31 Oct 2022 03:46:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0yG54cvjz3c3W
	for <lists+openbmc@lfdr.de>; Mon, 31 Oct 2022 13:46:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ih6DlIXr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.99; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ih6DlIXr;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2099.outbound.protection.outlook.com [40.107.223.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N0yFV232bz2yyZ
	for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2022 13:45:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASspo+WiFW21gF0pWYeyPRg3RESu3EaAlsNAZR6Rg3pFh6KNx6FOMswojkgeyJ+4xNu6dCmg+H6JX5BB+O9n+uXjhmbr6xBCKKci8w27Ra+WClACZ/MWDsZV+oW0m+6moxaQa3zuT3e8KP6OFRc2a1RDGjoYC+CjeqOHV97MvuB8JWkErEgI10D5aD2KIDohEpZVLKoqiheAo5sZBgEb3ThO6eYw45mYIIjsB5qCWcJiyfzpChBIdIpKAUtF6gnLhS1k+NaeeI/b8jxRSKxFMpzpVM0W5ohcty9dySRsm6lL3fgThIzeIANQeuy5l5Xn5TQ92TRXZb8hevQznTQscw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bC5nq/2r5ZrpnC3yL/x25JaSbZkzCTR3f1J6GSRSltU=;
 b=aqVBEoXPKAV3MPIWcrHIk3+PmY8XCfWWlo5F5SAmTmPNZHwLUA3bDC6iuke29y+QvUgbgENNcqYAT2By559Yk7wi3t9cdJn/6tVYaQZg6cJXDLFL3qhfSi8/tzJmL5Igo+z5yLYfZ84rnj2Tf2NYokXPKPD58Du7Mo3V63UJYKRXaqja3k9y3cM/ANyB076x3reZLg5iZ9RaxgZcC2nK8GUx+ISF5ywJ5hDrO5JKLW3Z8EbnQpuQx7l7bFlI7SjtUB90pgl8jGS9Rp/LzEN6KCGf00eTOi+Ku+l3g6BJeVzVpw4vG86TKqJF6sJYKzqok3twVSfHobb+pGU0QGVZ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bC5nq/2r5ZrpnC3yL/x25JaSbZkzCTR3f1J6GSRSltU=;
 b=ih6DlIXrQzM99b1C2YLFlILrEolYKm3UkwMEIX6ua3lwRp29INMS6jo9G51az8437Omk+WBEp8LRL356nZZmUnnsdMGSuzpHDhFnCDbvZhRiRmf7CWR4eSVnkgRtComRC+yIRTuRR4Lmi50toM556aKBMn+pXRXmwLLjVDEGPlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 BYAPR01MB5336.prod.exchangelabs.com (2603:10b6:a03:11e::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.19; Mon, 31 Oct 2022 02:45:24 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com ([fe80::44c1:e119:56:cd90])
 by SN4PR01MB7455.prod.exchangelabs.com ([fe80::44c1:e119:56:cd90%7]) with
 mapi id 15.20.5769.015; Mon, 31 Oct 2022 02:45:24 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v10 0/3] Add Ampere's Altra SMPro child drivers
Date: Mon, 31 Oct 2022 09:44:39 +0700
Message-Id: <20221031024442.2490881-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|BYAPR01MB5336:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b4b5a5-863f-44d3-6b9e-08dabae9f554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+c78kSYvA0tyxKftVZlZUGnAA5ni8EeDfIB3VX71PoYMQBtR3kJNiaA6UPCWmW7LV5Dkoj5GDNBFLyeleM8hKBV7oVIjHMZikQxbcJDQ5QGQI2pTANOhW1zmxnkkZORqI1TJ/5Juxs5eDOsHRzRt4VWAcRf8UVb+zlWCFTvMlPEBEctbMqt0YobUfvN4uUO9htGICLFyyQpWztCt7ffSmvoMeGu4cme6r59LR2D9rj12Ej8lVqjAKEUxPJqQI9DlNLU2azxKi67Jg4CsfrnBd4Zg4XjBzI/Cn3/ZwY5MHwg880RX3yBRTvp/B5NZTZf5NOznb8vcjaNafOsqFmVin4gTGWl4kbrheV0lkg7D0/z/h9SvpzvD7rACxU5t/rzT1vF3LkWFB2xMixKFuc8QXt8Ij4X+lnxpfIn5u+wEZCD94YcG/DiK8xulbrNC40iDqEqLiTZgTTytbmHwfW9XbwMUlg3iCkyjbWORH2BiS8nVIgmTVFvCxNorS2MpyltQCsPiZZvoeJSSJCNQtbIY7l20VrA/eOcCjEQGuc/47pCkBtsbZz3yAXhLh4++uX67T7/O1qB8odzxWPIZFuyTUCo2ai6JgotSGTqV3rMOVK1BXc+wfADX1081yFLp6RWK3fp9sUmq6ZnTubb1XkMOH3stbR5KzYJgVPeJRLpljOxgSymt3GxuaFNZHrf3hF+7+jwT30iPxPyfu8jEYzqCqGVKSdxCROFMX0AliA3WyYwv49yZAOjDUEWbb9dTpwisCVS9EA52QFDPYPoKBrx9wq3w9VmpFOdoXIYwK7e/gjM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39840400004)(366004)(451199015)(38100700002)(38350700002)(66476007)(66556008)(8676002)(66946007)(54906003)(110136005)(4326008)(6486002)(316002)(86362001)(83380400001)(2906002)(52116002)(26005)(966005)(6506007)(6512007)(8936002)(186003)(5660300002)(6666004)(107886003)(41300700001)(478600001)(7416002)(2616005)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?e61jVewvDmSeV9QswtQrIS/dBzUkKuXb2kFk1+IfYOxEpdZZpAEYWce/y1mw?=
 =?us-ascii?Q?2pgeN6OLh2wqLxhVKg0tr910vLY7E14P6O5ZomYAXSLr1nZ7D45w6iMGNY2T?=
 =?us-ascii?Q?yBsqAyoHVo6up++YFk0GuOXHZuiQ1yeaoWJrcZCgFa9fZmp5T9F5g4vqckrv?=
 =?us-ascii?Q?3Z8hyy/FNUl3yHXIzkS7WlhQfwp0j0ROvpCTgOv+Wa1vwge9GBvDAlURa4Hg?=
 =?us-ascii?Q?Hzu/slc7BRAIV/gNBAEh0k0FH0oLpin/GmlC+dhg6PTgg/XKxAzMbIGpjSpg?=
 =?us-ascii?Q?oxQ/UB+A7qJ8NAuvTeN9f0le+PJcbORZOk1eieUwFt46R1uEQ5dIC77CCEzt?=
 =?us-ascii?Q?WiF6UqwJK+YxkbGM/V0ysuugFpmyyw948JhJLn/3nhvIbDP824jIrOOcIpwK?=
 =?us-ascii?Q?KanIB3765SAZdH8tTxXjbskTYaePe+oLV11qibTtalBPJtSSWaCOi4pcEysq?=
 =?us-ascii?Q?IVMB1kCvGYNeyphJ6IK1w4tEL8bAGOyVh8plUbN1YG7leeoMUqxPjBoODCur?=
 =?us-ascii?Q?cCKXOpSRRl0qlz41biwk0BEWU+eMxa3q9voN+GELW31AistOwUwIOwyCCzJ0?=
 =?us-ascii?Q?3gL+HVhPadD16Am4ZWJItIIk/NxRP6Zs6jG0wvShsshqwxd95FNWmLwYsb/j?=
 =?us-ascii?Q?DCpcxEAJk+vXkWpS3008eRbjwHkGfKtjS1rSIvPPS2Jlkvk+zA1chU8QU41H?=
 =?us-ascii?Q?+AcClFP4Pak4UR5HxyfyRN7sYKuGL4FtD8pbfuT9OjNbY1z0uqM52Y/muv1z?=
 =?us-ascii?Q?nCgTzWak3zMb/wahX5UvrIyHwJdaur4ePZmDAWw/KtnoTvVeA1gv1/F70dNx?=
 =?us-ascii?Q?uYJ0vT3J1BFiO8KZLCsAlzBC9eJS24rM1u92tTEAmelgBP1yLbiiGuMV4Vq+?=
 =?us-ascii?Q?0RuR7OH8JOuKCmSPVnp9SBar2cpDivEKHWCY9ypk8NG5UKSC6DO6TxsczrF/?=
 =?us-ascii?Q?3mElQhOP/9x2fbmJJ+/c6PrekssbShKT3jA2r7WYPyXWAODRhKEwRo7vwFc9?=
 =?us-ascii?Q?hFDkCyhrlarHJpZmvOkJE5UccrhexDqoe/res27kqkD5nUvSjQmqo8x05v5W?=
 =?us-ascii?Q?/PtWsNEBQiDxfA82bZZgswGU5fDtHUtv5OnBkKL7zMUt9h5HVz2oarBAtoOz?=
 =?us-ascii?Q?Z21UIaNqEbVHs/i2IPaWk7qo5KmFizt1iuO45JtVgiVrsYaT9uEvcHF2H679?=
 =?us-ascii?Q?KnxRqaYO2idMZulEssaGiA2rpw9SrXBTX3CK/F+5QxIAAskG0JDkrdLWOd/6?=
 =?us-ascii?Q?1jGmFlSExjaigjDth4rKHNi/YGk4VvLuxUhWmY/boFQdegmewLM3ZJYesKix?=
 =?us-ascii?Q?IhgrOrwL6S3kvxV1CMvWfGgQOlbipUgPaZ+ckZJzGLu3pOtdc5awEgG+nQew?=
 =?us-ascii?Q?T/lHsGgawhOXOhgw3q0xYhtXkgvIfRHFnqBwgpPELc1WuFO1cHRuyEo/f9zo?=
 =?us-ascii?Q?/Jx+l6lcdGq6/xlvX0/btg7aBMG8H41cIeVw33FEW4JCUoP3DFH76vw18G/A?=
 =?us-ascii?Q?xcrBH+/V/QH/AqKiZlBGGhWLSZ6mGZvX6JplHY9U4K2xvzMui5XA/QWpA8U9?=
 =?us-ascii?Q?c8FNB6cRebvzLL+2oKgXT35LoRh0BQnT0HuKF6yOEmaYW7B1XYmZNUPqawnu?=
 =?us-ascii?Q?m9ltUfiQmhF8JZYfD49IyBg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b4b5a5-863f-44d3-6b9e-08dabae9f554
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 02:45:23.9004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmgBCr+VaCjxOuP5cgNxTDcq7TkQfuhZBJTcQ9lFrPqTwNnQseebQoDdhDck06v9jZgpirmfPqWKbERAcZCVr/ll6kjjUhQtg825lQrHf3g=
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

The SMpro co-processor on Ampere Altra processor family is to monitor
and report various data included hwmon-related info, RAS errors, and
other miscellaneous information. The SMPro MFD driver initializes the
register map and instantiates all sub-devices. All the specifics will
be handled in the child drivers.

As some patches in previous version were picked, this patchset includes
the remain patches which are Ampere SMpro errmon, SMPRO misc and dt
bindings document for SMPro MFD driver. The errmon driver supports
monitoring and reporting RAS-related errors. The misc driver supports
reporting boot progress and other miscellaneous information.

Discussion for v9:
https://lore.kernel.org/lkml/Y1aHiaZ1OpHZIzS9@google.com/T/

v10:
  + Revise and fix document format                             [Bagas]
  + Update commit message: s/This commit adds/Add/             [Bagas]
  + Use
    Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
                                                                [Greg]
  + Drop Documentation/misc-devices/smpro-[errmon|misc].rst     [Greg]

v9:
  + Fix issue when building htmldocs                           [Bagas]
  + Insert 'break;' to avoid fall-through          [kernel test robot]
  + Update SPDX license                                         [Greg]
  + Fix messy goto                                              [Greg]
  + Use ATTRIBUTE_GROUPS()                                      [Greg]
  + Use dev_groups instead of sysfs_create_group() to avoid
  user space racing issue                                       [Greg]
  + Fix ugly static struct define                               [Greg]
  + Rename smpro-mfd.c to smpro-core.c                     [Lee Jones]
  + Fix include files in alphabetical order                [Lee Jones]
  + Add defines to avoid using magic numbers               [Lee Jones]
  + Return -EINVAL if device does not match                [Lee Jones]
  + Remove unnecessary comment                             [Lee Jones]
  + Remove unnecessary channel info for VRD and DIMM event      [Quan]
  + Separate error_[smpro|pmpro] to error_* and warn_*          [Quan]
  + Add minor refactor code                                     [Quan]

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

Quan Nguyen (3):
  dt-bindings: mfd: Add bindings for Ampere Altra SMPro MFD driver
  misc: smpro-errmon: Add Ampere's SMpro error monitor driver
  misc: smpro-misc: Add Ampere's Altra SMpro misc driver

 .../sysfs-bus-platform-devices-ampere-smpro   | 312 +++++++++++
 .../devicetree/bindings/mfd/ampere,smpro.yaml |  42 ++
 drivers/misc/Kconfig                          |  22 +
 drivers/misc/Makefile                         |   2 +
 drivers/misc/smpro-errmon.c                   | 529 ++++++++++++++++++
 drivers/misc/smpro-misc.c                     | 145 +++++
 6 files changed, 1052 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
 create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
 create mode 100644 drivers/misc/smpro-errmon.c
 create mode 100644 drivers/misc/smpro-misc.c

-- 
2.35.1

