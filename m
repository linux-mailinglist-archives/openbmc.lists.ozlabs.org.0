Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F18CA5EF269
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 11:44:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdT396x9Hz3c65
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 19:44:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Ccg02Gb5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.95.100; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Ccg02Gb5;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2100.outbound.protection.outlook.com [40.107.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdT2h0HTPz30F7
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 19:43:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGyGtDUv4bQuxL1qU6DDBkUMxdIDXH/LuhWEvfZqaRGCreRj1hvi3KRRnFVq2dS0hp40ldUmCXWFm2mUpp16LPcujASPEsim8ZBl62pDCDtc4R/eAFpxr/gQejbyUxWI0WdJF384QAmeNYBcO42XqWmIbPMmrY+tjCUia+q4qCU7aZEFB7c0zHZwoEpRXvsiWh08iRC0tFjufoELo9ocZKpdU1mYDt+wf1fK8yXDqR7AjLfkI8qRU+ME0owq/zbxTwm1H9C3OemnNA+4bWTmz+KC0ceLJNuXxaXKRuqpPhCu+ldHdHJCGjFbjYRNJwNTv7dq8GiA/iNM/a2k2zW18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p64rIwCei+svjV0NncnmKTHDiB9Qo/kXHJu5lYSPTfI=;
 b=K9qqPPx8dTOGf8l+DinW6Lj71BV+RxWgcXnFfwh4LGMKVqy/kFAzmAeb5X/fRvQk7o5f8szp7OGWWtLUfrBB/wMrAjf9CWbuXYy/QXPjRP2LW6P20/U1fJeBR/8BetYl4L+iXkiSrULiP9EI4NV/0vQgFu7iRfai8QWaDLJJLGeRB0GW1JQU5E6id4FVvdrmlXaeXEfa2KXj9Ybt09BpzFvg0B7eMsYze0iizd0iqT++oxMsp8EoEBG7b6WYoU0P+sRwft+qbkwqPCQTYuglmfaSz6NQQUo2TDlVhO2cDydn8ZL3UmaFfOp0RmrxpHBEbRQXpDP4+5/nPhxGL5Twjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p64rIwCei+svjV0NncnmKTHDiB9Qo/kXHJu5lYSPTfI=;
 b=Ccg02Gb51Rsbl/PQl99hyGj5UFqlZ+rnHrfY4zrxSz3dQkVD2aaLr5OTy9Mup4SlWNR4vNuuxm9WAG5jqErcmN9kIhBDPl+hGOiinGK2r9KYbq+4rx66u38l7IvBx7fvTf9cKT2zdswqpr5Sdf4OI/d0qGm3aWpklUpQSbCp6hw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BN8PR01MB5682.prod.exchangelabs.com (2603:10b6:408:be::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.26; Thu, 29 Sep 2022 09:43:44 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 09:43:44 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: macro@orcam.me.uk,
	Lee Jones <lee@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Thu Nguyen <thu@os.amperecomputing.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v9 0/9] Add Ampere's Altra SMPro MFD and its child drivers
Date: Thu, 29 Sep 2022 16:43:12 +0700
Message-Id: <20220929094321.770125-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0178.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::34) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|BN8PR01MB5682:EE_
X-MS-Office365-Filtering-Correlation-Id: c7125ce7-0f50-4644-c0d2-08daa1ff1939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xaM3bCbr4NAPCYmTl0dJn4jn7x48TJNYg64GIXZTz25fRbzWRV4jlz6INWT1USVE/7aMt159sULpYcvFupvHpJY/ZSN42a8WmgTQcUXrGTPPuDzSro3ckYku+1GM6FLOfeyzmWja1EH8o/KljQ7eLGVoq9XROE4mSilYRNeg1nCUED0eGrtP1ojsjp6sdHDJpDka3Y7SXKRXbZIaK3hEDeWb7SfyfFlN89pY20L85DpEvEtlNwnbLmajYCHTKJyE44j/m15vIAF4VtEopczkIzRFi40ZPxf8t+y/hmwvZ/aM1zks1yfFRQgLzKcWtoQ+v2i6UBIQrix5UeeGrBBI2bqdpbUn4AQ1XR+r9gxxTkon5EKz8z1MmwFFkIoTB1E8O+OaS42A+vCyoInThHm0Ne7P+eOuvAx8b/of+piMXSbEzxWCi4zHcwSqUEWoadYBLcthCwSoR6NUKurK9fxU0ckW/hllXu5044+RjupEj65wVuHVD6v5OGx/wnh4xY5itP++giuPV7pbBGatZ0Gj12T5YRsn1vp7KIsnxqBge6P7YS3SkA2k0PABEn8v0CaBN6IVybH2ZktsvBwxvJc1yFoeRoCYBNP/1jxTZMmuSqrfDK3mD3clcwypUO1xQl0U373EPi4U3xto8VHT4sppwmQOJXfsRXaNUU6kHlTowbs8o6PKlfzOrMYPDVw6IztQy5KfKC8xp4HJJ1DATShZ01bCxcGWKk9tCSdjIVXDJul84k9vuJZ+w7Bceg2N6IvaLVwHQDwgMzN/we20I2ExcNW+gcHL4oW2gayHTDUAJco2Rshaom9kiRL47RfHRXJZ8578gmlQIDfoy22T5C6eWD5v/gxT09X7HTTSzlXDzS4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(376002)(346002)(136003)(451199015)(7416002)(26005)(86362001)(6512007)(107886003)(110136005)(5660300002)(8936002)(66476007)(66556008)(8676002)(6666004)(41300700001)(83380400001)(4326008)(316002)(66946007)(2906002)(186003)(52116002)(1076003)(6506007)(2616005)(38350700002)(966005)(6486002)(38100700002)(921005)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?MmvqyXG/fhWvdLY8xeeQhtFLPIKPqvOqWL/TYLEc7ysaOTu6SJ5coOGCh513?=
 =?us-ascii?Q?+Z9EeFQTo6SECe0uOO9RweY1X90cufGOSmjIKHPlhhjIAEp/UDu/6eVJIT/A?=
 =?us-ascii?Q?Va75vZX6JwhadimVJqG1R3uws1/bFoUCGKDN3WqFniruLZY2R7ru3Wmiq/YH?=
 =?us-ascii?Q?ZRh7wcCQ2NRn7bwtImrgc4pv81Pt7BA0wCBjFa7agTNe1COhp2bVdihvoitq?=
 =?us-ascii?Q?wUjKiFk6RKI2d5pR2P+F1kumDWz4hFcmttBBNbfEUpk91VxwPXX0mJH6n7Ej?=
 =?us-ascii?Q?OQmJtw4nuE8zpUINMWSXt+/20mkzqg+mEPlYo+Z1udDHhj9QfaPwkSqU3dDv?=
 =?us-ascii?Q?fJ+jDWSe0HyCCba5j5JWMEnWJvPYvzps2b7Qjbh4fe9voWNEZ1i7+EtUxvbt?=
 =?us-ascii?Q?Klsd4/B2UVdUo3eo+RkdJ5YfNkEPTtbxhInLXmLFXATCpwJPJs7n1jSXsjCT?=
 =?us-ascii?Q?VLCaKGUQAdcnUnr4iVJzze/+sH8iUobPc4gRwfcGzJrSG0mgBgGz7RrXpl96?=
 =?us-ascii?Q?oFTW8A7LNyWViFKEIbf9DsmCaF65vsobosFTOrYcBG7fR1IpoCXfYwG4blfA?=
 =?us-ascii?Q?LbWU2jKN/eh5HE66wWziik8+6aSEAgcOxE/sGfMOnza3Oa6zePGq6L47o3jm?=
 =?us-ascii?Q?tvgDjNbhFXoePa/5v9g3wKYAOQoSqswRZOiQ7z/hMbi8h56EuQjsBgP/xV6W?=
 =?us-ascii?Q?gTT+fHPQeLrDxgRJDB6b6OtFTLs39eEPi1nVn0wIFW66us3IQGLQxIB3aOUZ?=
 =?us-ascii?Q?/i3DBi3mMYCc0w81s753Cm7pk3qZZnDVZpRdGCNSHbvNmRwVgzwXbeaxl+Rd?=
 =?us-ascii?Q?pDDP024S/zW9cFVwLdqfDWi/iATxhFmlS8zQgLaRrFKWxnZeL1ZFcrSwtC20?=
 =?us-ascii?Q?mPdh2JPsdcAWf8BoeTYZXhV/+FroNn8LcQWdtrJWqo4JezlSETtF1ZmHg6nn?=
 =?us-ascii?Q?stZ+Ou8YcvtwdmWBXg++pgUWPa62CTnASBzWhNhKaGolt4Pb2S6lDX4Capop?=
 =?us-ascii?Q?l0KTFQdM0frFX5F1DVB258HPPDylA4svwyptRFefI2phb7gm6QMp1yBDz47X?=
 =?us-ascii?Q?SEJ1ydEhRMlS6QCV2Vt/BoexrpFui+9LGwAeoNVju/czHkz+dWC5tfVINdaL?=
 =?us-ascii?Q?1SiYaCe+b1/uWis+179/Ul4d6rHYSishxvTvrGILDpwd3vX9pSJwnODfGY5B?=
 =?us-ascii?Q?71fH4Io9AGxxDJhwDrQD32DtYWBXT9TDvHumBQZhvcK79FvlhwheNSWiNdwg?=
 =?us-ascii?Q?krf5LnOM42MUu1Qp5zZLpkYoRRInToVDbLscjkNovHv9F6361X22TBpq70PL?=
 =?us-ascii?Q?7MgJbnD8n1JH/IPxvb4DRB6z9qbacr74HuARlDepdn9uVJYwTuWDfmB5qaJs?=
 =?us-ascii?Q?8+4cYf0pBoyoZohJ/fVZzn1oEN6JqBLpfRnJ3nC2U4jDo2pTfznKHmgBHjrC?=
 =?us-ascii?Q?BL2yNYZGphfIEbQUalx6Pi2fJzeMv2WRIfvOq23xcO5YMYaKogDXtheOXjw3?=
 =?us-ascii?Q?8t9SPTruRYUDEvLqBFWG9Qb0F+W4qh70vgo17Iy2Vo9uOAaRR5Ip6KNVRNrM?=
 =?us-ascii?Q?fxatRF24e7dKuynq7gwGVs3RaC/kajOIpX003+DIfSWc9Nu3fTvlzOqeF26z?=
 =?us-ascii?Q?3lZDjH2JSh+1AhZpk2HXWaY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7125ce7-0f50-4644-c0d2-08daa1ff1939
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:43:44.3137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfHW6PWSrAyFi9RQ/X2Ta7+5LJv5OFwGr0KwXF6JGkuH91vCvMsy2A24noDrkTII0oBq/7b8Trg3nJ9THsvb8AtMtuN9ME1Vbotcog2Gj3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR01MB5682
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
Cc: thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
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

Discussion for v8:
https://lore.kernel.org/all/20220422024653.2199489-1-quan@os.amperecomputing.com/

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

Quan Nguyen (9):
  hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
  docs: hwmon: (smpro-hwmon) Add documentation
  misc: smpro-errmon: Add Ampere's SMpro error monitor driver
  docs: misc-devices: (smpro-errmon) Add documentation
  misc: smpro-misc: Add Ampere's Altra SMpro misc driver
  docs: misc-devices: (smpro-misc) Add documentation
  dt-bindings: mfd: Add bindings for Ampere Altra SMPro MFD driver
  mfd: Add Ampere's Altra SMpro MFD driver
  docs: ABI: testing: Document the Ampere Altra Family's SMpro sysfs
    interfaces

 .../sysfs-bus-platform-devices-ampere-smpro   | 125 +++++
 .../devicetree/bindings/mfd/ampere,smpro.yaml |  42 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/smpro-hwmon.rst           | 101 ++++
 Documentation/misc-devices/index.rst          |   2 +
 Documentation/misc-devices/smpro-errmon.rst   | 193 +++++++
 Documentation/misc-devices/smpro-misc.rst     |  82 +++
 drivers/hwmon/Kconfig                         |   8 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/smpro-hwmon.c                   | 463 +++++++++++++++
 drivers/mfd/Kconfig                           |  12 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/smpro-core.c                      | 138 +++++
 drivers/misc/Kconfig                          |  22 +
 drivers/misc/Makefile                         |   2 +
 drivers/misc/smpro-errmon.c                   | 529 ++++++++++++++++++
 drivers/misc/smpro-misc.c                     | 145 +++++
 17 files changed, 1867 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
 create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
 create mode 100644 Documentation/hwmon/smpro-hwmon.rst
 create mode 100644 Documentation/misc-devices/smpro-errmon.rst
 create mode 100644 Documentation/misc-devices/smpro-misc.rst
 create mode 100644 drivers/hwmon/smpro-hwmon.c
 create mode 100644 drivers/mfd/smpro-core.c
 create mode 100644 drivers/misc/smpro-errmon.c
 create mode 100644 drivers/misc/smpro-misc.c

-- 
2.35.1

