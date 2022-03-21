Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6BB4E221A
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 09:22:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMSKX74yfz30NV
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 19:22:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=TrdtCXFJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::720;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=TrdtCXFJ; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::720])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMS9B05PTz30KL
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 19:15:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBs/ZnEATian3MBiAvTlMJF+7majuHxEQRV1mcrm82cu4dM/lZZOKSQ4uylPbrQxfWgOaBb31dVIobYA1zgNJIB0RsVLeOUHeEgnAIB51PGB9CSd6kNjj+ANKaYd3161q6+KqM2VMaofQ/OOiE50PrTMLxvf0AubG1svITgiDX7ctbQLOcMyVuu9BL/HWQzXYDQ6luGkbCJNuttqeLdmxXVIuugY7zkPsMjbYm1n849Fl3v7XL0WdherrDdlRtlmzxl4flCV/rC4aEfUBwNHY3xI4jr5totLPwpcAghc9jZtleJgB2xwzlbX0Xpqr6i6ENM44P+PawTm37YUqBE7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iu13vFrkC87x+NN1X6/znM9HXjNvlrldOjzhCFignEs=;
 b=DUalB4O7lLZEriTLeJzAyQLKIaXPrjhZuTy1XIjw50vCc6/uSqHlSVZiBRFs1rbEMEvkUr01Yu0XJAlghSWGhwegRZGnyVuInfUUVyy1RUFbLF9jJtzmi2oPkKbcwby0f867QK2cTJ0fis319CJ0DGjSe8/Ia2xUA3MTZeKmXllv9rUqymHz/tDaEGrAzsJL0Xp6jH5G4COmxlcKmHp3cQp6CN4oKEID6saZ+ezz24mNPpMzstwWqtbrPYwrSs3Yok9r21w45rq8oPkY/Z3qzpPRhg4bEwZljzeO3Pn71Thnho9VB+rjwfOi6p93Bjh4xGTzpf6dJ1hEgVqci9ePkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iu13vFrkC87x+NN1X6/znM9HXjNvlrldOjzhCFignEs=;
 b=TrdtCXFJgD4y22fbLMJmtVAYcV0RG1RRnrlx31SrRbwMNxLfHhqxMB6g9h4oHgDoHUXKrFqxH3JMzFBartYlTNoe/V+QzCfHGGUzE6X8QOu/To0LU6RXdYHNgMBG4Tbdg2nvamNEmQ6M3p6wRfWLNQgrk7S2m++mD9hJpY49jHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SN6PR01MB4112.prod.exchangelabs.com (2603:10b6:805:a6::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.21; Mon, 21 Mar 2022 08:15:22 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%8]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 08:15:22 +0000
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
Subject: [PATCH v7 9/9] docs: ABI: testing: Document the Ampere Altra Family's
 SMpro sysfs interfaces
Date: Mon, 21 Mar 2022 15:13:55 +0700
Message-Id: <20220321081355.6802-10-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321081355.6802-1-quan@os.amperecomputing.com>
References: <20220321081355.6802-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::22)
 To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bf2a670-5212-4739-cd94-08da0b12f1aa
X-MS-TrafficTypeDiagnostic: SN6PR01MB4112:EE_
X-Microsoft-Antispam-PRVS: <SN6PR01MB4112D28A7EFD68EDDE2F54A8F2169@SN6PR01MB4112.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iXLm5MQmFoS6MyX2TeBuR6ObBMxshL1VYAdmC5JJGWgb1KX3Z2ELiWLGie/4nXmsHqovl98ULq8KjZMNtQiXOru6SXzYYlcqnyFJcTkEB0nn6iSnH/hCI1HkSdQ0zjBoDXTcNZrr3+fTFsHgEbA4pqM+lPPRwOoi8h+dE/p06+Ei12MmqA5e4/fhmWmdRb3vDyvPBxww/PklJ5D5+yPTjCpr9BsKXMYd9lWUkOj0SdK5Q7Dh3ZpZMAkUYv5g8evQG0CaUEaTDCCTUwK4dbdBpZWFUHYC5sb4Mg3Fr+lX4AzTrkGIoPUiZPFOgLv/brxvT+sumaSFEMTNW+yzpmrj+mDyaU/AxHVXnNPpXSHh3WgAIJTnkR0Qv92jdtnLlucLdgNOF7eebW1XdZ9tXAAJ2xwJsavz66qbCPxRCtiQ4zc/yAXfugumoVTTrwAIUTT6iNfkQfY26xvY8FBG77Zzb9loUemBO+7G8tFm1yPx40Ghn+GyjLP0QtQaGY8PCTiI2Gqa7AewYbuFgRCSUKzQi0SfO1Z6zQn3OGmrmHDag30KLJdU/tvqIanNEJkY8PYye+Km4kkJNOg5UaTY6VfJ4RW0jwGlhlgQrL0sQyKsKuWhT20Fwfo1kgKbPqMYJ59C+sAmLKGcH2lp4F4CnfOnr2TzdnP/df3gALYCcLrbdNLR0dBkrOgXg8aCWuLawmtMzn+ajjsO9CbRyypvOdDwduKE4M6xoxGpQnSwC4dlQsU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(508600001)(2616005)(26005)(107886003)(86362001)(8936002)(186003)(2906002)(1076003)(52116002)(7416002)(6666004)(6512007)(6506007)(921005)(38350700002)(38100700002)(110136005)(83380400001)(8676002)(66946007)(316002)(4326008)(66556008)(66476007)(6486002)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zDaaV07E2TxYzh0FdJCZ82jzLATA+PvQNkYizfg9nz0Y31Stu090hZTV1J4S?=
 =?us-ascii?Q?h5POVW0c79hjKHgKGEi/YbqCOxn26Mj6fOYq8frSaONTyUrULRJJMJvPMozC?=
 =?us-ascii?Q?QUA2wcoFnXv6n7f2nIK/r1GsHd9q8GduAUgo/kme36INvWriqxsJNA8D7/ax?=
 =?us-ascii?Q?0YBZflXnd+8NusNizA2dKf2ZuwDN1Xkx0S6RNl3wIUzT1dctoRnHgwEBi37u?=
 =?us-ascii?Q?lnudUBkUV+lgADPuf3HkROFZ6cXvM8/1oO1bvUAfzCeC6K1g4lkCGko8xn7k?=
 =?us-ascii?Q?fktnUM4csTY1hnAoSxZ0OJGyyKAPd4H4n9TwO7/J5ofkUkuqZRbH1rD+YWWC?=
 =?us-ascii?Q?MA0+d3FrAzMAYje9mDn7Z+SP+oLP3vrfsWJtAKkGeKl/5hqEza3o2Nz3ojMH?=
 =?us-ascii?Q?D9YxMfZ5COLQkI8MdxmmyIeb8XkmCrPYqYLrzNwwZqAS5P1iXRlYiOkkkW+b?=
 =?us-ascii?Q?lUCnKyXvSj5gYssIOXSzXsAtlQhrMPsHO3MvqmO8heZUI5Hp0EoL4nKk3QEI?=
 =?us-ascii?Q?LziG3wFUDSZPN3xO5dspFXOFSC7vKb7SVEhqER7f9U13qh/W1x0NhKaKedkZ?=
 =?us-ascii?Q?tD1o4Io6WRwAIu6VuQrQzGm5xqE3+lycoZkbtgY6OqdUr8SB78Wb6kIxU6XO?=
 =?us-ascii?Q?XBkACsoGdSuqRO4uo8ReP+NmhRT3RQ+OxaKeDWqLZmgsLXri4J9RN7u7BS/u?=
 =?us-ascii?Q?xQD3UCHQmHvW9EYjgffvQz+NuYnSpRnypwhyPrTGBHmudUtw8Jsys8GyprAj?=
 =?us-ascii?Q?XA3palBtQb1XvSnFw1q8jFmZRNxARkliikj1fyqli6ksupNGkruReaqqy3nF?=
 =?us-ascii?Q?IBGF/1pSOv29fvYXDZEk8b2s1H/BcTu7dJ6fxIzT1xE3aaLioSRTXY/EPc7H?=
 =?us-ascii?Q?eI3qxou8cGRBjnw08tPwih0XEuIoMz1O7ZOLR8309S/PTisVWpli7GE3U/eq?=
 =?us-ascii?Q?BxWwAVbO0e3BhSyd9adK5xm+pNpodrrjnbSDD6e/aWGQBIoyeXEMivgvoygG?=
 =?us-ascii?Q?pYOVtu/4YUKIGEGMdo7DoJrKk738gTDGeqyQP+LktVAYqb/mrt03XkQUL2eR?=
 =?us-ascii?Q?0Uhs0JYSijBDxBSc7EG4dkZWSsXquCJTKm9+bCY6lkrL/siZxzU0ppUx898N?=
 =?us-ascii?Q?qGn5MeRN5sbBTrdBc6TWsSZTptShCIwVtNgQIj+zxp5OIeslDnnA/3jOE2P1?=
 =?us-ascii?Q?XHekyfZIaggP9gJH/KKBRE4Kps3TZ8B1x7HUrjPNVrgKPCbPMeVmWkHeyoq5?=
 =?us-ascii?Q?8wGO9tJBIzZvASUzhWcof1FzHGVmaHog4X+dyoMtGjr86FPza4OcprPY2Mmy?=
 =?us-ascii?Q?TmPKC6F1A9Zga7ju4JnxiGXhAffmYC4bsBlIOGMFBNvDMlvQAonlf/kAy1m0?=
 =?us-ascii?Q?I0gAtrFnQ4bgaXm//kCMrE7GvLEKPiv13LzmtiRPanH5leOPC1ZFtIYw3TP9?=
 =?us-ascii?Q?Rty3KkI8y7liGH7KDL2KnVKmyU1uHUIPBTauSWUpsK/8ng7AgQdP5yZMw7nv?=
 =?us-ascii?Q?q4BMWPOG8/wtXDE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf2a670-5212-4739-cd94-08da0b12f1aa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 08:15:22.1134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1uPOPuoLjDECTEOzfMRyYlYi0l+ifyA+kg4mUP3kOcJiIdHf7F6FtlIBddcoipemcWmgeNQXntxRdgjOGnyS46pXmChvMlBjpeSBV7CEF60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4112
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

Add documentation for the Ampere(R)'s Altra(R) SMpro sysfs interfaces

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
Changes in v7:
  + First introduce in v7     [Greg]

 .../sysfs-bus-platform-devices-ampere-smpro   | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
new file mode 100644
index 000000000000..9bfd8d6d0f71
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
@@ -0,0 +1,133 @@
+What:		/sys/bus/platform/devices/smpro-errmon.*/errors_[core|mem|pcie|other]_[ce|ue]
+KernelVersion:	5.14
+Contact:	quan@os.amperecomputing.com
+Description:
+		(RO) Contains the 48-byte Ampere (Vendor-Specific) Error Record, see [1]
+		printed in hex format as below:
+
+		AA BB CCCC DDDDDDDD DDDDDDDDDDDDDDDD DDDDDDDDDDDDDDDD \
+		   DDDDDDDDDDDDDDDD DDDDDDDDDDDDDDDD DDDDDDDDDDDDDDDD
+		Where:
+		  AA       : Error Type
+		  BB       : Subtype
+		  CCCC     : Instance
+		  DDD...DDD: Similar to the Arm RAS standard error record
+
+		See [1] below for the format details.
+
+		The detail of each sysfs entries is as below:
+		+-------------+---------------------------------------------------------+
+		|   Error     |                   Sysfs entry                           |
+		+-------------+---------------------------------------------------------+
+		| Core's CE   | /sys/bus/platform/devices/smpro-errmon.*/errors_core_ce |
+		| Core's UE   | /sys/bus/platform/devices/smpro-errmon.*/errors_core_ue |
+		| Memory's CE | /sys/bus/platform/devices/smpro-errmon.*/errors_mem_ce  |
+		| Memory's UE | /sys/bus/platform/devices/smpro-errmon.*/errors_mem_ue  |
+		| PCIe's CE   | /sys/bus/platform/devices/smpro-errmon.*/errors_pcie_ce |
+		| PCIe's UE   | /sys/bus/platform/devices/smpro-errmon.*/errors_pcie_ue |
+		| Other's CE  | /sys/bus/platform/devices/smpro-errmon.*/errors_other_ce|
+		| Other's UE  | /sys/bus/platform/devices/smpro-errmon.*/errors_other_ue|
+		+-------------+---------------------------------------------------------+
+		UE: Uncorrect-able Error
+		CE: Correct-able Error
+
+		[1] Section 3.3 Ampere (Vendor-Specific) Error Record Formats,
+		    Altra Family RAS Supplement.
+
+
+What:           /sys/bus/platform/devices/smpro-errmon.*/errors_[smpro|pmpro]
+KernelVersion:	5.14
+Contact:	quan@os.amperecomputing.com
+Description:
+		(RO) Contains the internal firmware error record printed as hex format
+		as below:
+
+		A BB C DD EEEE FFFFFFFF
+		Where:
+		  A       : Firmware Error Type
+		              1: Warning
+		              2: Error
+			      4: Error with data
+		  BB      : Firmware Image Code (8-bit value)
+		  C       : Direction:
+		              0: Enter
+		              1: Exit
+		  DD      : Location, firmware module location code (8-bit value)
+		  EEEE    : Error Code, firmware Error Code (16-bit value)
+		  FFFFFFFF: Extensive data (32-bit value)
+
+		Example:
+		  root@mtjade:~# cat /sys/bus/platform/devices/smpro-errmon.1.auto/errors_smpro
+		  1 09 0 08 000a 00000000
+
+		The detail of each sysfs entries is as below:
+		+-------------+-------------------------------------------------------+
+		|   Error     |                   Sysfs entry                         |
+		+-------------+-------------------------------------------------------+
+		| SMpro error | /sys/bus/platform/devices/smpro-errmon.*/errors_smpro |
+		| PMpro error | /sys/bus/platform/devices/smpro-errmon.*/errors_pmpro |
+		+-------------+-------------------------------------------------------+
+		See more details in section 5.10 RAS Internal Error Register Definitions,
+		Altra Family Soc BMC Interface Specification.
+
+
+What:           /sys/bus/platform/devices/smpro-errmon.*/event_[vrd_warn_fault|vrd_hot|dimm_hot]
+KernelVersion:	5.14
+Contact:	quan@os.amperecomputing.com
+Description:
+		(RO) Contains the detail information in case of VRD/DIMM warning/hot events
+		in hex format as below:
+
+		AA BBBB
+		Where:
+		  AA  : The event channel
+		          00: VRD Warning Fault
+		          01: VRD Hot
+			  02: DIMM host
+		  BBBB: The event detail information data
+
+		See more details in section 5.7 GPI Status Registers,
+		Altra Family Soc BMC Interface Specification.
+
+
+What:		/sys/bus/platform/devices/smpro-misc.*/boot_progress
+KernelVersion:	5.14
+Contact:	quan@os.amperecomputing.com
+Description:
+		(RO) Contains the boot stages information in hex as format below:
+
+		AA BB CCCCCCCC
+		Where:
+		  AA      : The boot stages
+		              00: SMpro firmware booting
+		              01: PMpro firmware booting
+		              02: ATF BL1 firmware booting
+		              03: DDR initialization
+		              04: DDR training report status
+		              05: ATF BL2 firmware booting
+		              06: ATF BL31 firmware booting
+		              07: ATF BL32 firmware booting
+		              08: UEFI firmware booting
+		              09: OS booting
+		  BB      : Boot status
+		              00: Not started
+		              01: Started
+		              02: Completed without error
+		              03: Failed.
+		  CCCCCCCC: Boot status information defined for each boot stages
+
+		See more details in section 5.11 Boot Stage Register Definitions,
+		and section 6. Processor Boot Progress Codes, Altra Family Soc BMC
+		Interface Specification.
+
+
+What:           /sys/bus/platform/devices/smpro-misc*/soc_power_limit
+KernelVersion:	5.14
+Contact:	quan@os.amperecomputing.com
+Description:
+		(RW) Contains the desired SoC power limit in Watt.
+		Writes to this sysfs set the desired SoC power limit (W).
+		Reads from this register return the current SoC power limit (W).
+		The value ranges:
+		  Minimum: 120 W
+		  Maximum: Socket TDP power
-- 
2.35.1

