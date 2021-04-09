Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 762CE3592D1
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 05:14:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGjsh2gLxz30Ls
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 13:14:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=j3yHDQPt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.120;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=j3yHDQPt; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2120.outbound.protection.outlook.com [40.107.92.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGjsM65sJz2yyr;
 Fri,  9 Apr 2021 13:14:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbV8/t45Tzb3SuY9UwwOlr8PlUDPNdMNobQigRm1rwiyu4W/gLQDC4ye5RvmKHxyhBMZQTxRH8OvKn35jzV2WqPNdl39lYpOYaiJx3rzLUEa9wJYgTo0mCD3WhBGXiesWZwnECzs8C8qyV7vrNuC5oGbFH9WdnPdcFUO7XFRiBbo/++frBuk4xsnD29J3YluRSlcQ55tltMfjlmAbQX7Z42EgWbB9A13dSyNA3rx5Ts72nkDSB4dDeI8lli+BWietJ8KJIK2/vMWO46NMA5rULwlMSKlNIf2I+WeA07r4nWjwIezeoV87BJdaR6n9ziv/aTON150NEM7o9czh2s/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVhCOEEjyjK8hBErrPHRMrkFFG75goC/w2Dgrlmgxpc=;
 b=P3+Kp/aMq4nlwbg0sAbWwmSnhPEklkQGR/2xzEBLD8zzClhuuUzSftEk5vew7zb4lsyyEbizws85mfZMqNpGB4AFHVGL5fIrAkz5BJxIw5IWz9yQ6cPETBzcZBgdgmxSOMkuU7+pg1WkIrodI9o3Hbpr1SHogZigJ7vbTumsFvMelHNSnCe2vkRH/oHodF13oWLhYdJZ4q0ALII37fiXthHVxtHZXL9zIt8gPZICZQL58yXGfDXujC6uWxz7ObIZDQBgG7QUklQAD0/20hYxatvDKIxv9I6SDJZpiRlO6amiI2GMdIunx62fpEyuV0xlmwP4mQuhn24j7qveee9LmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVhCOEEjyjK8hBErrPHRMrkFFG75goC/w2Dgrlmgxpc=;
 b=j3yHDQPtKD3ORKTbpj2ZX3GAVbkmAI8Oopftl0BMJq73tU+ZWwpyLRxxu2p1g8yOaXkcNO1B58AkqhlJtwx/drdcXV80VroKddKymf+GZH0PP20H9GQn1N9leoC1bRl2RqEPb8s2ISQviP3kRijiMRY+cyNqn28T/ymql3wN/Z0=
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR0101MB2991.prod.exchangelabs.com (2603:10b6:301:36::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26; Fri, 9 Apr 2021 03:14:07 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4020.016; Fri, 9 Apr 2021
 03:14:01 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v3 0/4] Add Ampere's Altra SMPro hwmon driver
Date: Fri,  9 Apr 2021 10:13:28 +0700
Message-Id: <20210409031332.21919-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::18) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK0PR01CA0054.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Fri, 9 Apr 2021 03:13:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fc0438a-187b-473d-e7a7-08d8fb05855a
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2991:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR0101MB2991A7CADE494182AC3320DEF2739@MWHPR0101MB2991.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U6+IIfpcEOncMy1qTQI8XKLHvSMsuyRm/4wFnPgLPe1n1TMaiYY7IKng+/4Pnvtl4Z2/ue098NWUJK5fMKrrjDy8CSiBeHgeQLgpFbZF6ILZIKwdXKWcJoGQpcpiXlbVqSE5uBXKETkaGsH3QdtRUJzKGKSWRl/kN6PpslyzUd+yj6LoDuDB/qhovmsiQHtlRSj8hFprlxnsdpy4c4fMOePZim9XYbRC8Jhtm5NRecFy8zWCWCpbDJJQNJ+CrQm/fkJd2pO0/QWfFuiq54AC8QP0Znfvs/kpYAt63qpVtrqUiEX6fXQok3Xi2aU0LKBRo6SWiST9fjtQsfmkZ6VQycaQD8Zzl2ZGgmbaX+h87qeXa7z5M2CwyZrOD/BLlXmnld6a3ASI9UrqJSBvMkM2O+0iQCmUZ1FqUQqeJrAVOZyaAovLhYhY3auli/PKNXK8B7cqvV/VUQWI2tXEb83uRq33hXG+y5bTNJ/p29hvbx8KJaquDoVPWm3JdSduF/XErrAnHRH94oakL1MQvJd02DlN/GO/QXzRhGWbSL7HMePzthCrvnTrcjQbkrORRNVbkL3DgeJhHoiKrVanG5uN+UlILV3hl83T1KH/W0E5s4NO+xirX2lxsvlC1IwSE1mBge8yNuW1hE4IEQ5dCe3ksU0VK07TLsStiKgcZUe4vd2C8VGn8T806NXu9JaONi5jH3DoEp1mBDx13ZyRyPgNfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(396003)(136003)(346002)(376002)(6512007)(478600001)(38350700001)(921005)(6666004)(26005)(316002)(6486002)(1076003)(83380400001)(2906002)(86362001)(7416002)(186003)(16526019)(6506007)(5660300002)(107886003)(38100700001)(4326008)(66946007)(956004)(8936002)(8676002)(2616005)(52116002)(66556008)(54906003)(110136005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Gy6A3fKlCjs3rK6m/ON32FwJ0t15HtNHU78zoVjWLEhZAXbuWbnTzrFR5dyi?=
 =?us-ascii?Q?YiI4eduMxNdflZrzfo7zH4f6waDa69s3haFnO1eSILm/zMWTirWFgfwEc79Z?=
 =?us-ascii?Q?FSXzeulQU1+xwtOA3ejpGDdBaal/5Ar0988hTtecU3OmHRyEIVGnlbQEcq55?=
 =?us-ascii?Q?XkKx6fhQC/zcwbd+0PTXoarVboe7Hw3XsWklQ1ZJEDcq2nVaD/1biUZLIifr?=
 =?us-ascii?Q?uusSsZbipGh/+eQWkqzm5agfB92KA+Dh/J2mW1dtX98OXMwicySLhotTJaJb?=
 =?us-ascii?Q?33VzMsTItGxDfP1SGgRnEHVWlKLr/K8e/HSw7T5k+irxmyIitp5qq+ZSc6o1?=
 =?us-ascii?Q?MJ25t7Fg9k8W8QqJjVBQOlAqDIxvZDO9ypcgZcSZiLLbHaY670GsCruIMclS?=
 =?us-ascii?Q?31eg13L5xrYUWmAgTNw7dGCwF0Yp9L5QdqrX3chdNA931FydzDBEg8UNtmIv?=
 =?us-ascii?Q?kFKGt/lydsEiISb/cJvDduxQB9kYVFSmOiIf2zJtnEWjFc3XWuGvx+kGp4f7?=
 =?us-ascii?Q?KOjQe+rRqRN6uHT2bdNmYT9H0lFzKDPh8t/Z3AJgZQ+Ksbgyth6Vo6O2J+Vn?=
 =?us-ascii?Q?MsW5pdL/kN+B3EwqVVf2bKqfxCnoHvH4w5PUC9B6XpRtPbxwe2y2cd+NpLns?=
 =?us-ascii?Q?TIWmzPisz3skDl0BV8yA7MBmbEqrTU1koivV7KIkrQY9be/bgoUusHptcWO4?=
 =?us-ascii?Q?sY5IhHPataAPTVKPR/fCPtjrrBtKnTa3aolWdOHvmJvh69jJe9mT8DXZRcYd?=
 =?us-ascii?Q?wYKpn5yKGw2lD6HtW11TKr7YDHiA0qEhtOj0IFBK8cCU8mHisRckY4PdJJAl?=
 =?us-ascii?Q?jPHQje+p6WJFpvoOeGSOsSaEeXjmBtqj7qDIjwTcx/01vYG49SeWPQh1vYik?=
 =?us-ascii?Q?jM+bN7lhDpOa7S5JIh0CLPEcgEhHOromolI8HVw8GuDolJgLZQ+DjV4PoU/1?=
 =?us-ascii?Q?bWXMUlUcgR8ByRtDC8AD43WNxsWQSp2oyVrIKaX6G112H69I66rmMbqF4dKD?=
 =?us-ascii?Q?SCceFbYfYwNNG398UQqNOf2skbeG6I7JWQoSqY0y9tNSWQ91n7QoDAfXbfey?=
 =?us-ascii?Q?VUK2Gyi+aEjY+1kx/UofoFdO03DlyrbIyD6c7awOrQmBe/29RukdKNi5BHM4?=
 =?us-ascii?Q?pQDnBeHS3cNR4cTjiDXscGd8ec9+1EXffzNVTVoa4i6yJK0ABQb3QR0a7RwL?=
 =?us-ascii?Q?885usKtnckepA39owRpuAc4hOBTkf+CgCGEelBgzI1h00Gr5JnHVGPXmTBDx?=
 =?us-ascii?Q?bQN8QtCYXwnovTgTHP4rCHSprl7nVYNPehclqqroXKZlh5FgzsrduMO5QZeX?=
 =?us-ascii?Q?MjnS1KDQCRoUH8jY0P/Ebj1c?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc0438a-187b-473d-e7a7-08d8fb05855a
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 03:14:01.0606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTlIWtiu9e2OIL4ilLdb2pXUE3FZdHd20gOmhSZ5LE+BsZKZkRshO/oGbhVHQ1oLHlCZpgeOEVcNkoWEXrdyk5I9hTV9jtArj+3JSOZFATM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2991
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
  dt-bindings: mfd: Add bindings for Ampere Altra SMPro drivers
  mfd: simple-mfd-i2c: Adds Ampere's Altra SMpro support
  hwmon: smpro: Add Ampere's Altra smpro-hwmon driver
  docs: hwmon: (smpro-hwmon) Add documentation

 .../bindings/hwmon/ampere,ac01-hwmon.yaml     |  28 +
 .../devicetree/bindings/mfd/ampere,smpro.yaml | 105 ++++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/smpro-hwmon.rst           | 101 ++++
 drivers/hwmon/Kconfig                         |   8 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/smpro-hwmon.c                   | 491 ++++++++++++++++++
 drivers/mfd/Kconfig                           |  10 +
 drivers/mfd/simple-mfd-i2c.c                  |   6 +
 9 files changed, 751 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ampere,ac01-hwmon.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
 create mode 100644 Documentation/hwmon/smpro-hwmon.rst
 create mode 100644 drivers/hwmon/smpro-hwmon.c

-- 
2.28.0

