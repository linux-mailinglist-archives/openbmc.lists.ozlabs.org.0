Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C64E596A32
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 09:17:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6zqT66Jxz3cFp
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 17:17:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=be5uzltk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.107; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=be5uzltk;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2107.outbound.protection.outlook.com [40.107.237.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6zpj1LF1z3cB1;
	Wed, 17 Aug 2022 17:16:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXy/SYsGvRy/2uLY9ALq2MkWx/hiOIPRoSfdO2agS6ol4i2OOI+gdEc9lkK1MD/lArFSKutaPYM7ASMHqFrbqAv8vkI92MYCnSaaRNIH6x51Dqurp44Sc8fhmaZYolsCf/hEXURip9rvJCXlzPE7YfB7SoU0JHRjvPyoZOC8U8Mvoq9vLlhP9x3ulH5St9ada7lQFcnK8LsCuOm6lXAMaVpddWfyhFELNe7qRmGzkTcvIhbsC1rPyXMs/i2Zra7uki5qT3xMKKIIZMLZk2LZOpkR8cL5tr0KifIDQFulKXrl4G8DvjrpEFeIcd1SpIIBnICb4Avbv4xXXWRaclBi+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8A8efsndowdMBNoJsnkZ1LEc/rTlAmrxqdPIq1X66E=;
 b=c1yG3nDAV9Fl6UMawxASRBPifUSKbmMHoiJIPJ/XXKQiq+hqp+tJIk0Vi9gVsBM+R9/gjUEn9nn01e0XraShhGw6R6MJLXaSxKUQsL2MmmIkuo3bHGYkm2Cs3JnuXwWT9iVI34ehqVQGdRHuvorILaQ32qNx6ziDuMvFEOfe/De3CHGG7yIX9bGef+/c31Xb2ysJkI463U52ClwNpTJNSLogU2ABHJLaFjB3BpAIU6auRX+AN6+ul16SFjQpl9efHsyMlf/pIhCVBRHdK/3xLkYNtqxBntZFeHomKG/gf8wKa5isUaVWTuueSmlwi1CTv5vEqLQWh5UdRKxi/WpxQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8A8efsndowdMBNoJsnkZ1LEc/rTlAmrxqdPIq1X66E=;
 b=be5uzltkeCvcDvTakVEdvHiFDbg2CF5NzTowrL6VyeMFLwecQojYZEWOdlVl8ZTN5b3em2AgqykGEVRgrKAjMDTVqrQK9WS+k0lkO3lxeOskFQM+M7ED3/z7EYQB35dgoROLuuinPdOyKa+ASKTmn8Fe8A7/uW59l1rnZUmcVKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR01MB5300.prod.exchangelabs.com (2603:10b6:208:78::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.17; Wed, 17 Aug 2022 07:16:24 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::2c79:3341:5ae5:7d26]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::2c79:3341:5ae5:7d26%9]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 07:16:24 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Quan Nguyen <quan@os.amperecomputing.com>,
	openbmc@lists.ozlabs.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v3 0/2] Add device tree for Ampere's Mt. Mitchell BMC
Date: Wed, 17 Aug 2022 14:15:37 +0700
Message-Id: <20220817071539.176110-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9082b829-1814-47e9-bdfe-08da8020647d
X-MS-TrafficTypeDiagnostic: BL0PR01MB5300:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Edt/F8MGtnsvrSXtPm4+f9gHbac/GsVBKnwJM+tkWFyo41cQWWNgsqTGevurDMD8rukmZNA8ae7XBkn+B2bwmiSUAydCsV8BJFHMxgHtmKePPEo1GNcVe1NbIFvfn0nX8seTAA432hpw4ek1wwEmOsb9xIIrmRffAjtA6UZlKL2uHPSJmDlVdmX+gxdmmXQ60IFTHOaopN8ofgTTTHyUM/UCAgu7utw56FqXPDqAYZPQZ3YEZrIs5oVvEB79WpYr0rUS8FNY9qNcu4KzUY3Gcu2bzrNd1/j7x1RBO3nPe+uiZQ9kIwL8wa0nZL/gD0+IW21f0z0Do9iOJtQ6krsnx6ZFtEGhoNHcWlP2n1QK++MU9FdLJKmgDqVfy8Q2/SJ59GIdbxv9K4EG/j4xVmbREJyKq+lGZYLmoTo8/+fObPcyFfNXY23BG+6ATyIzO9tmghYj460fLq0tYaeRo8H546/viAtXi9e9Cqj1trJwozx6d9UiWsNocDKbP/VriAsh6ioq03aSnEjwugEO5cWxZJEHEJrGpAZK+SS6ZR+ciAEehgw2HiZTIfst1wWLfTvORaP76HmxiAlw5812GZIe4qKwnupkwxBUQTYN9ipIcZRUamxIaSrdk89NXMuWa+d8dxaqzm+3zA5ihA3H/3Hzf5OUy01X8a574E6ayBPhp6C5XAQNO76PLcwCedpUGu2Jzk9gMzK/A0HMite8WfCfl//CFzlOnWiO2V31ZvY+wWcWeleeFO6BlOZXo2iy9w6UXs9GpJ92LI3dWCa9Ro5pMclBWt0teEy0Y9TODlcjAtfGWppw2ec+zAiXPUd18SQT
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(6666004)(52116002)(6506007)(6512007)(26005)(110136005)(86362001)(316002)(41300700001)(6486002)(38350700002)(38100700002)(478600001)(186003)(921005)(107886003)(83380400001)(66574015)(8936002)(4326008)(5660300002)(7416002)(2616005)(66946007)(66476007)(66556008)(8676002)(2906002)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?B196IkUKRtLm8DhoRf0GnEC1fuF2rGQDqMs/Ll1Z9HRMTPFY0zdpeV/Q/ZCS?=
 =?us-ascii?Q?f8KulHL/KqIq/v3iWdKjUVnlC06NwZpqquudslPJMOnTdo3d7j4sZfNwqwuC?=
 =?us-ascii?Q?8zwWPFnsCIH7xQ0pExPeEcyjvo4whQf8P85z+kmhPKMHHYG+Hmj2o48y5wDi?=
 =?us-ascii?Q?hbKejCizWqbfpJUP1N2hB+ulil5phdFcHbptpXrGjc349SKvsjs36AYqCC+A?=
 =?us-ascii?Q?qjhaWI9sDYSmSJdw/Q9ZvNAIaMZzWzZ5ZFHT+BD3aJu93BvPcI9Bps837ahh?=
 =?us-ascii?Q?AdsvEPmnLqEXgMQw37gUycYUC6cTnDm0s3ghPzGsNTEcLM+ega7T0Rp8aj0m?=
 =?us-ascii?Q?BDo75uVmsqg1BB8WyZOq44YrytmDCZOnP+KaHEKFgMHP37ILCvEz+4cKCAPZ?=
 =?us-ascii?Q?ZtU6KbgtvwS3WaAKbWBE6mX+gWALeCEzYLnI2qawklwYdX2VeRot4xkZ+ySr?=
 =?us-ascii?Q?ld4gSCgJ2kl9pXTYlDVLIJkbbMEJ0yfs5N+AuwzH6P1uAJRQQDUaLItrWfkn?=
 =?us-ascii?Q?lsZiSLUyqsk4bPeby12A4+T29nOYlXMVhkHVaENicAqV2vV5u8KN8vXQQlON?=
 =?us-ascii?Q?4v5wm1hpAJ0qV8jX+GoeUvf/H82875jKhuEomVqjCO/UQuTMv0j4+9NEVDD9?=
 =?us-ascii?Q?tZLuAyqW1jqhQdXxAv7XeR0j7joeo1dfCJAwh4SI2ABh0bcn/h5N6eG9Kcos?=
 =?us-ascii?Q?ypRixP8AyspllFE+3OXATfQ2vlpAOym4Zrr4EFGSr0KaXHaiL1XbySSQ+zNL?=
 =?us-ascii?Q?V1hnGiq86dtKh7E5FtCxLpKTVCZCi6cF98Z90NIveQxM+FoxxHoMErPfcRkU?=
 =?us-ascii?Q?+HL3EZBZRBuA1QbK6UeV2EjryPH8fEwPEUAQmjOOinv5V3u2Xw0z9uPkWspJ?=
 =?us-ascii?Q?DJtzglHQpSrQhQFcYl7m5lbo+9tgvE3/gzdfxX8HBldYJrCvWRzH5tlIPhVs?=
 =?us-ascii?Q?rH3YXtEaSgywvrAaYBHCcK2b/NOXXvxsXyLsfoHbq2KZ0xMu6705JhHN0CZJ?=
 =?us-ascii?Q?rgPfe801pX/hhxJcdq0K1mIduxcd3BOdckrPnI01+VBAetlIOkoS2qgHZ1S7?=
 =?us-ascii?Q?9YvTEsQSL6KRtaWjipQEj1dm8/mO5fEQI4O4ElDuOWvV7w+svLjbY3xBegEu?=
 =?us-ascii?Q?h/yNUK2Cr8RnS28uS2xN7levUgu9HPyVItuhGu4uipkDw+h0eT7aAAda79oU?=
 =?us-ascii?Q?YTp+HhfQSj7dwEQ55Rgp6pVEeGI1mm885GRPPOcuQ/OKYvjh0iAKnEuJqURk?=
 =?us-ascii?Q?bTWY+GFN9r6I7Bn6WHquBr38waDBOTKZly2FZynTVFeVSHOo9ofezktFzkSC?=
 =?us-ascii?Q?WZ1rRPhedH/aqWpM3dMDSCTHWxKV/0Mpq7BDCw3a6En7fqqOoArljnXWfK/b?=
 =?us-ascii?Q?82BGXYzijggA3CTi/PrEf3hpB0ZalyxsFtAPK2F7GGAQNC78YatvLagIERXq?=
 =?us-ascii?Q?RzVl5eLo0f+vsYRKBwOB0VQjtAUSc26i2PXXzL69+zLXfMHkvd34e0tknqev?=
 =?us-ascii?Q?m9v47x4mQIx8PBuyPiEEXrz3R88/tt4mIN9eXWUvWuVAagXgkz2HLSftIR7B?=
 =?us-ascii?Q?24uYKBsc6bTOScPjNaOmayLoetYy3KK4e3R7jqu/NoFBoZUJ0Ab1H2PmHDOd?=
 =?us-ascii?Q?EA7vH5+BuLTYfTpgd2sgpTs=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9082b829-1814-47e9-bdfe-08da8020647d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 07:16:24.3207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OJgk9d7CADwl/sv8YZMstX07ybe2e34Y8tFvd+/tOK7hWTZEJLMqqs5qVj8Ghkp7lcyQ3cXYzyOJu6AFr5EAEtFZL1+SYaNEzFWHlbX6FA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB5300
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

The Mt. Mitchell BMC is an ASPEED AST2600-based BMC for the Mt. Mitchell
hardware reference platform with AmpereOne(TM) processor.

v3 :
  + Change adc-i2c node to generic adc node               [Krzysztof]
  + Remove unused status property in adc node             [Krzysztof]
  + Remove trailing blank line at the end of file         [Krzysztof]
  + Fix alphabetical order in dt-binding documentation    [Krzysztof]
  + Remove the wrong comment on vga_memory nodes             [Andrew]
  + Remove gpio-keys                                         [Andrew]
  + Remove the line-name for bmc-debug-mode, eth-phy-rst-n,
    eth-phy-int-n, bmc-salt12-s0-ssif-n, fpga-program-b,
    bmc-uart-cts1, bmc-spi-fm-boot-abr-pd, emmc-rst-n gpios  [Andrew]
  + Update line-name for hs-csout-prochot, s1-spi-auth-fail-n  [Quan]
  + Add line-name [s0|s1]-heartbeat                            [Quan]

v2 :
  + Add Ampere Mt. Mitchell BMC compatible                [Krzysztof]
  + Remove bootargs                                       [Krzysztof]
  + Fix gpio-keys nodes name to conform with device tree binding
  documents                                               [Krzysztof]
  + Fix some nodes to use generic name                    [Krzysztof]
  + Remove unnecessary blank line                         [Krzysztof]
  + Fix typo "LTC" to "LLC" in license info and corrected license
  info to GPL-2.0-only

Quan Nguyen (2):
  dt-bindings: arm: aspeed: document Ampere Mt.Mitchell BMC compatibles
  ARM: dts: aspeed: Add device tree for Ampere's Mt. Mitchell BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 546 ++++++++++++++++++
 3 files changed, 548 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts

-- 
2.35.1

