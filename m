Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 887CD5EF2AB
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 11:50:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdTBD2mJSz3bsS
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 19:50:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=iQhGllRc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.109; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=iQhGllRc;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2109.outbound.protection.outlook.com [40.107.94.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdT3Z6XVXz3c2g
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 19:44:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRwbIYXgZcO/6yKoeJksfAY7eHHN4z+8foJxcfLeUH/O1cIaNME+SRutBkxltYyGM67eWKdnT+e68UrDmjwZX/JQvpOsazTDfecIYQcD/rpAYP3DwlprbUP+EArtAlM6iXgOqM97lGdOau12tK/7AjAwSlpuU17NxHFHZYhE0RkEYEHHJ2TFDYc3IA+/d/LkfcY+T1W5QV9jelfrN0afaUZH0lPI02RlhO3cLaGiFWLTC5pIjvoXJIT8yyw/3Rzklz8h7OvjkA27AVHucLnih/E8cDUY1WWdScvgQeTXbunHV/ATsXucFIgINgImRqoMLMmERdS7m28/6dz8USgpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2pKKBbAFeSWafqjLWF1Kgy+yNGfTi9YzV/7SyfIs1A=;
 b=ZgFJ+po8rsXhuLxBD9gnF7kEYtHMGU/RsNQynTu1nHrNnfNGD9iDESRuxeUde46WBHVn0rqJ0jvaw87ewvnqz5MqoF6EGsQFXFzH7VWUp0X11gRNhN2/dIyFmFGgtu3VVFqNTcq9AMZqNZ5Wxvw6yuO0T6yAz8GO4tcPxDaETtAJz9c6Z66iEwWZindBKPnV312YOS/PNa1cahmRHFUazbtyWqbQzCkuLcdN0hw73xwDin3QBAlanluFmfVO5kkJxDXFcgxFm95gg85fECykEEDKleY6tXY2e2du5hYxrRqPZwJa0kBxcEAyPQXauv7RgB2HfpVzYZly4qKn8T8Aig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2pKKBbAFeSWafqjLWF1Kgy+yNGfTi9YzV/7SyfIs1A=;
 b=iQhGllRcIgOD7mLH5+vekoxYJSbnRHQ8oCC24E8MuPalRW0egsLM/ZXQnRBrWKJDcdiYCpZejvr26ANFg+OwapAlMfXGfq9OM98ssVSaaPQ37ZjkG/neM9OhfyPum3O2Y2O3n2dEf6qiePZJ0vNUU2R3RwoOBGtN/pgbfIT/B1M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SN6PR01MB4798.prod.exchangelabs.com (2603:10b6:805:d5::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.19; Thu, 29 Sep 2022 09:44:24 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 09:44:24 +0000
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
Subject: [PATCH v9 7/9] dt-bindings: mfd: Add bindings for Ampere Altra SMPro MFD driver
Date: Thu, 29 Sep 2022 16:43:19 +0700
Message-Id: <20220929094321.770125-8-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220929094321.770125-1-quan@os.amperecomputing.com>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0178.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::34) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|SN6PR01MB4798:EE_
X-MS-Office365-Filtering-Correlation-Id: c46a8a0b-2565-4f5e-b3cb-08daa1ff3156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1/O2wCV9vu97mAfWpnWRl+78PT083596ScFjg3yQ1/XFoNY4id66zyEHRkbaLDhFAm4rEWB6v4CppMqB2MV7ICk9nvoL0C2WlkS1O3jwB7QwJyPzmkv9miVl/l3KasgWfoOETHbBk1AY93eREwzozc/Knt1Bf+WRzL8g5cnwrkawK0pWOnsf4mq85O7ZHYgkQPAcjDjSg99sc9cVmqRSimJ9n1Kz41ndA3EpvK453fbB27HqM9k01rfdsLhze1VnYBpNByfYbVo4J6CPUFREYMFBmUy+h9WMm3tMYJL2liMgmwJUOaO74MCJNTNufxHYwxQ3pRNKe2kqcRvaDf9hhNqJuce0WGzFGHMIQkQw9SWTAYSrSh7bhERjVIqSJgtVOzFyk1SC+D9HOnenVaHRKMULRX6xGJVOijPrWHb5isdskRH3qS/MY66KUVQy1dCBvHTqrtM9q1paroBNCjcqb2y/TkOfHVqMOiq+j10uaOVRsEAdnjudKGsj3h0Y1On+5ChcaVSQIzqJfrjCrJnfj9+Ir/CS/La3tG0+Z2HGruKYizzInumi8JJa/+6pjnrLCzZlYavn5qhXdfvy58Njco/DSYI44gd43uZnRXPu1zv0H2jKL9rAqJIZjYWDdOUfYHxyKZSS1vcQT1chZ1JE9QAjdj8Y7LW+yPGie3r8XEwBCViJnyR0wKEf5ODZY+29YfWH0C/kudTjNkmjecbM5RXQDB2vztzGW/6pt5/ikhfDIeb6YD3Uyr3JURcHJBdiguYQmUxxUH5b9xKLoz3m8U08wa5uiOrO+aHkoUyiIkDWE4+VeYGZuw153cwzhI8YDTaZSefEIJO6zCVRs+7pPZZr+FWN0eTDkLt1Lqx7JVQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(366004)(39850400004)(451199015)(921005)(66476007)(66946007)(66556008)(8676002)(4326008)(83380400001)(110136005)(478600001)(6666004)(6512007)(6506007)(2906002)(26005)(52116002)(41300700001)(316002)(54906003)(38350700002)(38100700002)(86362001)(8936002)(6486002)(966005)(1076003)(5660300002)(2616005)(7416002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?k2Qk7Bwj2+32YT7SiXZB3tbqnRWRrM6gVDxVoeuJ58kG0lD6pOkYmuk8P/Fo?=
 =?us-ascii?Q?oxfRDpUl4obyOqYVIH7uE8MEjHQMOqF3bZsXL7QVQjuuRIwLb6uah0lmfeeO?=
 =?us-ascii?Q?q1qB6NA26KMPE3YTclUSx2dowG5f/fmM9xzEJ+aR9pRJuhKrjiewmNfSXG/5?=
 =?us-ascii?Q?vV1ET/jfKTctW92rAqvyQ9D9hlWw88Q2OS7D0PO5SI5Dd3TRITgkmnwQoHeq?=
 =?us-ascii?Q?/5nKBCtsFhdwLNRisy5l6kGGAurFkjCII6MM9Vc6m8h3AGqohUBkB9syiso0?=
 =?us-ascii?Q?Nvlezuv7WfhxFzCykeYE5TYpk+HSCrUYTfI1UVesyQFOxuJjJePgH9R0xTlz?=
 =?us-ascii?Q?7lHrJjWvH5utvtopA1Je7xUyqLM2KWR6nW0DGOe2SSUCl8mH8whT8WWvnzVT?=
 =?us-ascii?Q?8BIrxLdwOf1Ep8C/uyXgA7yPDg6V7c8EVJJHkxlaGY/uYsCiorfVu0HNGkhh?=
 =?us-ascii?Q?e2SjTIFTMmh/RChbIYSoZTTrMN9QDBPoHEBu2XvxQ4BnGWJYzOIawHg87kEd?=
 =?us-ascii?Q?/y2nGpsw1vAJ/Bd5cxVuU983U6WFsfkbrrOG0jz4ujnsROyFm4nxrM7JAvOU?=
 =?us-ascii?Q?6ZbLCz0BpXKcIxTmLqtw3ElgrhLTawDlFIJl8Aokl2Y+iWvEqnSm5Gt9xK4C?=
 =?us-ascii?Q?jD3Rk5JgRUNcp2PSUSFOMZAeDTy/TF8DrwmoKpma1b2X3gYkBjX9bHi0EdSW?=
 =?us-ascii?Q?pV4kfVfqlPqXANs57qX3kU497BA9E6fT1Ach7ofpyHTl44UBeScY3cn36Hz+?=
 =?us-ascii?Q?FRsCMGERWBMm9y7u28iPAZia5/pqbbq/Pbq6yLgO+0E+oWssOGkMkmBHc7Hd?=
 =?us-ascii?Q?VTWyEdeBGUqg1VrhMYmUg5xP/BH3syIXj87cJBFkqiRlufui6pseuO8Z48GM?=
 =?us-ascii?Q?x/Pp7lSByNnGpvo2s113uS0fM+AMAjDrR8CDU2HC92+EyNK735w2YHqEYEgA?=
 =?us-ascii?Q?fPSXAWBY3qtZkgnhyXKRgGElPHEFNXwOfb3412RGHHVk2IpBSXWwzjPXQzHB?=
 =?us-ascii?Q?u5HmomnWQd8NrDvq/qF9bSrPK2iAs+YtNs0fRtyr8pLiUitZuKZqFpYcdaVM?=
 =?us-ascii?Q?l6DjfG35L+FmywURqLFCZw/jE/vGM3GezyuhhWWrHpiC/WcQGRFSOPgCKwBa?=
 =?us-ascii?Q?gG82qb97qjikPJdDavfpd1oPFiMqzwYlRAKG2GexBbu3tUnaTPxMXUZVedH7?=
 =?us-ascii?Q?2XvHWxiO6tzebUh5vfE8qTxjOU51H3wuyWoMMRMRxVqOztAAPS4SGQ9kkomx?=
 =?us-ascii?Q?7qm7CkfJ2ad25UV3MYzHL24fx3lbftMKLGbGvqTltHt1D27Ec83rfbzIRFUM?=
 =?us-ascii?Q?TUzCTKgA4P04qE1E78zeijhH4tbUEIWpLHC5p1vRCGHk0ZWBB1HPs5ILGsqY?=
 =?us-ascii?Q?eAtWzwgUezUBZhrAl9DMlDb6Y+jLPTJRYJRA39gaaRmF5Vbk9AVNcyP+k0/V?=
 =?us-ascii?Q?S0UXcxC+agoYEjpnWzMno5G8ZXv+Vs3zc+oaRyccb3d9QTYP9b1SDaas5FwC?=
 =?us-ascii?Q?MqsMpmRWfmEFTjkKTCl1zn+jC7rdS3eMGDGTFx4rrHWLnS66xlGzRULMw5Uh?=
 =?us-ascii?Q?sdtd1oJW9Tv9jsbxa/NdytbvmcdKL24OrHdSwKiVncU88/UYQypUnZpfpRN6?=
 =?us-ascii?Q?AkVwTKEl6pn8wM2tTK6jZxo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c46a8a0b-2565-4f5e-b3cb-08daa1ff3156
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:44:24.6597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t25muwaw4YLhZ9XlfgjPFc0zOwMimotY+gFkfeMgsAjdtD3+9MhnuIrn/6Ds9awWRoF4hAcEecjEUOr/m9YuFNXrkGsFILlmGXsmiu9mk9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4798
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
Cc: Rob Herring <robh@kernel.org>, thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adds device tree bindings for SMPro MFD driver found on the Mt.Jade
hardware reference platform with Ampere's Altra Processor family.

The SMpro co-processor on Ampere Altra processor family is to monitor
and report various data included hwmon-related info, RAS errors, and
other miscellaneous information.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v9:
  + Update SPDX license                                       [Greg]

Changes in v8:
  + Removed unused #*_cells                              [Krzysztof]

Changes in v7:
  + None

Changes in v6:
  + None

 .../devicetree/bindings/mfd/ampere,smpro.yaml | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml

diff --git a/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
new file mode 100644
index 000000000000..c442c3cdffed
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ampere,smpro.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ampere Altra SMPro firmware driver
+
+maintainers:
+  - Quan Nguyen <quan@os.amperecomputing.com>
+
+description: |
+  Ampere Altra SMPro firmware may contain different blocks like hardware
+  monitoring, error monitoring and other miscellaneous features.
+
+properties:
+  compatible:
+    enum:
+      - ampere,smpro
+
+  reg:
+    description:
+      I2C device address.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        smpro@4f {
+            compatible = "ampere,smpro";
+            reg = <0x4f>;
+        };
+    };
-- 
2.35.1

