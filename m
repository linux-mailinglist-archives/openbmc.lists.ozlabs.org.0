Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 654F1324DC9
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 11:19:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmTLP2h9Dz3cKV
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 21:19:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=CYkd1sr6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.122;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=CYkd1sr6; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2122.outbound.protection.outlook.com [40.107.237.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmTL50rQGz3cGZ;
 Thu, 25 Feb 2021 21:19:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6j3NFF8q05oNiH2REJL+vbfTKqQj5q6qdbH4ZvJQkEp6lkmyVqVBMXK9VXp2l/BZWAHN7OpfiZrL4Z/QklEpOjXvb7FucOfD0e44NhmPKM1dGZU9qEjqzjFu0OPBCMf1zaKaPp5ozYjUXh7me3e6rWD32u3JKZRHiuUNkRzFZvF2KQtKVwU4E92XQZ4f/GsJlZbbBY5OJbO6WG9gjkHUW3jv5lvOsJM81wvXF+uHY6T2YiRxggHH9TMzwtOu/59P9x6HgG/CPCaebFlnPc+gNPCZ4QXK0BE3KlTL/ap9owZvGeCBD4j9c1zFH1vbjqGc5UrzFDym3xrMKXGwxYJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPvoP/KFCa1JoNmZY/KCpykl8Qo3IL8ZZaZMA4VQvHM=;
 b=BYhg3Bpky1IcF7sSNFh+iQRMZZayyn4fRsYEf2J9i+/YYGp+uMg/hVtp4OpFiT8BseROO2AG+dbZKfe00IxWgNLdbzaw/4XoF6vdd0MwN2E2s2CVX5goQ9TYSxmSyEcZ9+enFrrSkBgYO9aeTpmF+nFo4vIBRkr40FZ5XVTj1jRWCum3G3aeHtnBY6kktt6zo5d0uRPzh5MyOipcr8lyavqvztC6U1vjx7mmt9tQCHlocBI2j1MHQel4fHYbzcCHvUmggFrDTiJ/ydwXKvy1PUPA2YFR2St+TztOp/2t27nRtSHWrz5rnPoa+DKKiLnU89JlAwO9jpH18pntlNW/gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPvoP/KFCa1JoNmZY/KCpykl8Qo3IL8ZZaZMA4VQvHM=;
 b=CYkd1sr6z/mt6Q6uou9HCjTSx0kgSfyZXde+qLiM1nn0u1YJNGTF1SORmaHXLbXCYjepfjW2QQmPH3LpVdWiCXUt+uHqr8X9DgGL8vYBC0TUQ3q6yRTo//Ej/hNOi4nLecPYOiP4Dcd1nqBLrJdSARj4kxw0HsdvXlNrALLY/rI=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6179.prod.exchangelabs.com (2603:10b6:303:67::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.32; Thu, 25 Feb 2021 10:19:32 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::682c:4e20:b53d:e660%7]) with mapi id 15.20.3890.019; Thu, 25 Feb 2021
 10:19:32 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH 0/4] Add Ampere's Altra SMPro hwmon driver
Date: Thu, 25 Feb 2021 17:18:50 +0700
Message-Id: <20210225101854.13896-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR01CA0061.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::25) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK0PR01CA0061.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Thu, 25 Feb 2021 10:19:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ca25638-c3a2-4d6c-56ac-08d8d976d70b
X-MS-TrafficTypeDiagnostic: MW4PR01MB6179:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB6179E0E399D6F5BC86A34BDCF29E9@MW4PR01MB6179.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wAgee1rSs+Td92/s8UU8+3l0LKYGPc8oo7iv35B/yxgjUNetNE6l08t3UK2Qh4J/RK7RTlAJuvnlp2QxoLCxiBTNiP9hxXaoJ6RHY7oA1uhJFPqkJPqacC8EPkbaepV3/XtIBUvxdEhBoWu/rKuDzqPexHC3gKuStOzCeJpn+shSZ3zKpatBtbk+bxdaYwWMHAsR+NaOseFh4qR3/uPmPaWH8fBXF8VELoVgAFsdRqiIXCT5R87KuodDH/G00Ahwus11RtFkRnGUcOqyLnuxUl1b9dpl1yMA7BWWtZpRdqpIXEAQSTGZOi8Zxg1NX1FtE5J/8TGCPrA86+WLc6PgFDmcLRYr9HeBicxwXltNeFrttR/rSoaA3Nd+mdS5XKQNoEj5z5RAQ1VI9ktnuHYZoG18+6T6pbRGZ8p+mYyqr/YFHngQ1dEZ/2w6REw+7l/D/bfnZ4cI89GlQpVNosfaiL6RkUz0mWD8/2mYImwI+gxWDnmzDbk+FPz/QsE1c49Kh9SjjaRJmJu4XXmAZPLxYDFrcvMCdk0D01zp533fRp/opTEzAyyzXhOrEb14dyKV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(376002)(366004)(346002)(136003)(2906002)(186003)(8936002)(26005)(6512007)(8676002)(16526019)(86362001)(83380400001)(110136005)(52116002)(316002)(4326008)(6506007)(478600001)(5660300002)(7416002)(66556008)(6666004)(921005)(1076003)(6486002)(66946007)(66476007)(2616005)(107886003)(956004)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?K9x104xuN2+FrEfm00fQD3FAxsH0Wyo/aXjefAkvBT0TJB+q5T1kr9+bgeR4?=
 =?us-ascii?Q?RzBkiHE4ro5drwQ4WqZcibUcWDz8XZI+f9f8wqA4eOo2PXuDPiws3Sf/raKP?=
 =?us-ascii?Q?8ZK0MZV+/y8hlHaD8SzL6B9u5/KKbPZgkAgLlNHZ0Jh0nXuGQRfmuxNhltW1?=
 =?us-ascii?Q?v3ACkS4y+otkbtL1UVnDernB9WkDJ0MUo7x65dgxIWMX9XAatzetnNzAf+d7?=
 =?us-ascii?Q?WWReViklbN7T3/0MkWxP3hljcUrLjs+6AFCdJQ2d7RslDtjN3I6NiM7finzP?=
 =?us-ascii?Q?OSVkcAVqXDiiGfwFe/mivDm94V3lrCryzoaxUnxrJ6exS8xaqUawTA5z8HGT?=
 =?us-ascii?Q?O/iJE0STSlRnQkdgH4/Bp//rv+2cp9ZsUQpxLgjUo4Ixm11CDzZMhXY5lrA1?=
 =?us-ascii?Q?tHd0lzDdsxUw4gTsDuYCtI9f8PLiSQWMNONQravFIpYhVUzkujbfMhIMqeqA?=
 =?us-ascii?Q?p/w7gWzVxosTG1wI5wCvGf03N9R8bvqWyQJ7ZsRiSqQv0p5qswjM8UMd1D20?=
 =?us-ascii?Q?kXbwRCzGCkkVFBfoN7Tck39o5VASULJXzkZZj1FwCXumSBMCQXPgWMMlYk4F?=
 =?us-ascii?Q?nXa/A+2Ao4UU1z/ltAi3BMU7p7fN95TqKSC28lFguvkhzuMbxQEG7eYFq2k6?=
 =?us-ascii?Q?Lnp9DD7U5XsSFvr1PIBn1NW6+TnJTLAt3wtc4Shs03a0VbXazpeA02GgDW9Z?=
 =?us-ascii?Q?aqzzzsqRbV0a6eKsKLcwd8KrpypHHAahe1rKJ4cD2j9b1Cw874Yf+oDJp0qi?=
 =?us-ascii?Q?Imldx24iFLRvcuUxQCOuAu7f0MQ8L7Khn80jhvhNhlcZ6aOae4PNZoRvtbVP?=
 =?us-ascii?Q?3aCSXmb91lUmINCWl2dtI6D2fN9AKESila8Nv5iI5pjBi7/keUg2fYjaCo/j?=
 =?us-ascii?Q?RzOLWkznsbEb3b50xslkMQfT9s8ioVwfo6DaVFd4HiautMGceG8/9FJC0o2+?=
 =?us-ascii?Q?eLs29mcn8RJdwlYkZHEacUBjnAicTCFV0I27nfGd1KSR5PXJDF70W6fxoSGF?=
 =?us-ascii?Q?DfLSF5+cb3q9B7iEP0q7DpzUF6bGshhMVB1WdeYK7YgiICqNEM36/HQtxe84?=
 =?us-ascii?Q?exHfimyUnp0XvPNVstujyduBalAjVaRhIQRAmvfZRwmVmGyi0rhvVTnpKB8U?=
 =?us-ascii?Q?w2n6xLPWcCPOocaXu6mB2YKcAqZneSlbM/Rh67/T05r5Am6f2rMlvIKyXbki?=
 =?us-ascii?Q?Bb1/Ro9wCzmKRZDersbgYdUL+QZGFW7H0Ulu5wA1cszF7nZeJetoIwduxEAU?=
 =?us-ascii?Q?iU4t0N9W5nIoleupoxgoWu/sS0Xg4fVI5j89hC0JRncDKsx4ng/awouhjOt+?=
 =?us-ascii?Q?t5VgVrvI5eArWH3yDpI1X+KB?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca25638-c3a2-4d6c-56ac-08d8d976d70b
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 10:19:31.8913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpndLkPYyPthhvunDmPDrsuoFKu9dS4myTh1Pk/fB0Pw1hoUNj41CLE5ssQ/yKA9loccJJjnbu72T16peV7wnyKujOO71ajxMYt8J67D+sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6179
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

This patch series adds support for Ampere SMpro hwmon driver. This driver
supports accessing various CPU sensors provided by the SMpro co-processor
including temperature, power, voltages, and current found on Ampere
Altra processor family.

Quan Nguyen (4):
  dt-bindings: mfd: Add bindings for Ampere Altra SMPro drivers
  mfd: simple-mfd-i2c: Adds Ampere's Altra SMpro support
  hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
  docs: hwmon: (smpro-hwmon) Add documentation

 .../bindings/hwmon/ampere,ac01-hwmon.yaml     |  27 +
 .../bindings/mfd/ampere,ac01-smpro.yaml       |  82 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/smpro-hwmon.rst           | 100 +++
 drivers/hwmon/Kconfig                         |   8 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/smpro-hwmon.c                   | 620 ++++++++++++++++++
 drivers/mfd/Kconfig                           |  10 +
 drivers/mfd/simple-mfd-i2c.c                  |  15 +-
 9 files changed, 862 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/ampere,ac01-smpro.yaml
 create mode 100644 Documentation/hwmon/smpro-hwmon.rst
 create mode 100644 drivers/hwmon/smpro-hwmon.c

-- 
2.28.0

