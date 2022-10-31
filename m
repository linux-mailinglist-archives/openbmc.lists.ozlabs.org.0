Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D74612F21
	for <lists+openbmc@lfdr.de>; Mon, 31 Oct 2022 03:47:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0yH94SN0z3cC0
	for <lists+openbmc@lfdr.de>; Mon, 31 Oct 2022 13:47:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=VtpTQNy2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.99; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=VtpTQNy2;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2099.outbound.protection.outlook.com [40.107.223.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N0yFW2hVpz2yyZ
	for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2022 13:45:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USbZaabYDAq6XaUVGnfi41uAyDmcazQJqyis7PwwhjqaxUUewtR2oYZn00viTwTK/bkO5INnDc++VcQtePGTebOkCvLMx9jZCzF13ozOcecBhJtc7whLBrNUSn0edmPdwangmMjUS/7SICCmUIOL6y8bOg/VHVu9ZmnOJSo6jQf65JONovYzKf95CzrCUNygAoxmWSTnd9RKumv/fY6PK3u/nEgou8ZQep1Po68GiSbqwtCCAQls0KEk2Jn/+AVkP14jjPUaESOuxUMQvuzY3tkKLtKZd9xeT+z87IC5OSzCu3NoH76FEbfXDYPI4mggJSLNY45MMz++ZuvKcUaTKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FjVwqYmQlbpnFZV0YTwkBKhRKFD5EPBn6d8rnAHbRg=;
 b=l8fUszjPHIhe7piy2PN8qr8vP5chVIbLgoxPCQH7S5vHv9uVtQmHkj8nNzHcO+IyuIVj9MAvJi3U8A0O96eJ3G7nFdwIXbJoSsmXEsW3vnIWrWVi818oF8iibtWWw5DTp8iVwQs7OtyaxrFIMgYcO9jKtvW0YxMXPPY+3D3gscEyBpVgcisDoBXr64Zv3DnF+2m3z90+DEeUjM7x+XrTvU2XoK0yIWsiz9k8qfaohm6WnGwPnL9wu9VNQgyKVl6DTDQVI7pIxCqYbQ+Zm7EYW9DzUKpTWWqj8VHuju4eMhUtzMp1tWcIr0uxy9pPLzvI/NqcBpUghEKJforhmViQJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FjVwqYmQlbpnFZV0YTwkBKhRKFD5EPBn6d8rnAHbRg=;
 b=VtpTQNy26Cs8XZBULoPxkx3fHwJD4glk0zdgIZPBLpyGwK7yCKQQa3AoH6Rn+Tkz3K2taNaz8eHcbKr+YP0G6JraPay9+MFL3g+XIS8VCYpvtfiXZE2YD6hhE/H7UanWIgBpCgEsVC6es/XdtttAd8WwIXEPlPZjt0a3zD7GMxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 BYAPR01MB5336.prod.exchangelabs.com (2603:10b6:a03:11e::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.19; Mon, 31 Oct 2022 02:45:28 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com ([fe80::44c1:e119:56:cd90])
 by SN4PR01MB7455.prod.exchangelabs.com ([fe80::44c1:e119:56:cd90%7]) with
 mapi id 15.20.5769.015; Mon, 31 Oct 2022 02:45:28 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v10 1/3] dt-bindings: mfd: Add bindings for Ampere Altra SMPro MFD driver
Date: Mon, 31 Oct 2022 09:44:40 +0700
Message-Id: <20221031024442.2490881-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221031024442.2490881-1-quan@os.amperecomputing.com>
References: <20221031024442.2490881-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|BYAPR01MB5336:EE_
X-MS-Office365-Filtering-Correlation-Id: 162427c1-87ca-49da-f4f9-08dabae9f82d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0BLG3yVM4PvLwK6W0e4uSN/6i58alwfJIFE5FNlGvTY7dYt092W40jWVZFaj+6rqQqaQUubFlcXQ908SxC88snguscjrj9iLZxLjgP3a2iLBvX01e9jkm6pcjm1HZLNWHf0CaLk3/I83TTwRRcE49G+A9B479iE4O8LuSvd0vOuOjmB6rNQnAihnRfSzM7gQD6NiUKfq8d7K5Lfd4vqLdLCTCB5rSogmU80zrHmEKsLsYXzQvUG4QDfC+J2u5wh37LMU/B3LSXhyWMn18lyHxXpS/19KVtQTBchNBI2M9ak2Jbkup46LBrmnveNR70PGRY5WW6QEc7K15OWMioEesoNmKhacNJglqfYitlQb+rpWAyr69bvla6iK+mquvsZCsy3DcguFEJ0jEXxmeHA1Pgzy+5x/2JK9WAtM822tlMoxIi0MjOvtgTSUGBToDAQ8ckukANH9cIrAFZCTT4gCRDEI7UQgXVS0oGquXu6ye0JLkOtnRBrjYoR6n0JLstzpbG8tF00oUw98NuuvA5mG9Nhp09lU6DvwrRpUZv81UVNKYZoqhsyv+skcsvh/3F/j+5ZcO99TYTiaNMW0x/+PBETEiTwMKYd60MSUq7A6SQjXHs7lydVbtWD33VhFAAyX2mVEudFnh559wlIp55k6OVdlljAaSq4jelg6GquF6RGR/5KcjruTihPs6XY85bECqBq6GZ5Shm2wqTvQZi7oCaVDeZzFf7I92KoWotsnnPKpGFPFbkbohlTukVh8RCFttIXpVpJBrHPfEzs1SCBCcow42htU4FDQRVs7D8Pmc6E=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39840400004)(366004)(451199015)(38100700002)(38350700002)(66476007)(66556008)(8676002)(66946007)(54906003)(110136005)(4326008)(6486002)(316002)(86362001)(83380400001)(2906002)(52116002)(26005)(966005)(6506007)(6512007)(8936002)(186003)(5660300002)(6666004)(41300700001)(478600001)(7416002)(2616005)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?6TKJsmFIjQOA1doi9qfc+hNe4jv/JqD16Eyt5qL2e1+lqm+ct4RY9otBCAG6?=
 =?us-ascii?Q?OsTUUtom4E32c/qssJ4nVsMkSFPQLH3dPUXqiX1WEvtLWn8sHMVCV/Y3f9E5?=
 =?us-ascii?Q?KTY6K2G28PyWudJxQRfKijM7rtk+H/SXjXiE8hhF74hf01tOBSlDNXcf8Z82?=
 =?us-ascii?Q?IjZ4OMBXELpxocGS0ZWM0l0jGWPz/qKrPQHJuGANj4uMNU7XaK/ezq8+GSmq?=
 =?us-ascii?Q?XGteI2N5F3l/B/aqg2tPh5nyNbFFKKN43gEi9fjEyWeq+XzbGo9CMRGKd/La?=
 =?us-ascii?Q?6uM1uW44F0HDIsrbobWpGyGg7QcvB8cJbJBEIhjSn6NyMKdoFYBbdJaVOgIg?=
 =?us-ascii?Q?WuipcpKUKb3tDx2I55WOCC4NhHOLcspVzvyCSeMLLyG1DqTh4OarIDYYTPQ7?=
 =?us-ascii?Q?cgPejGCr6bwqD7NGqoZm0ki9Bm9VsTEkN9sX/QJJaqOcujoY/60TkiEMNUdr?=
 =?us-ascii?Q?tZ1jmvV1pmISb92SZRlxA7viKfE08OmdXmkTd1OPnUf0eIQvyukLuGQ5+7zS?=
 =?us-ascii?Q?x2hGdz+FpcAQQEb2AezLnsYSRaGYBmru5oDG74zKpqdyRVU45GZOvfm3dmQN?=
 =?us-ascii?Q?cM+hGL5yim4UEdRQmpNYY5rH8NWYhslJay8IYjyin2jqbo/T495z67wtVQhD?=
 =?us-ascii?Q?u7PkqJQ4sVIDeoHHJD0l+7EsDixnfhq/InDzQSvlzWvRkXTisIcMOtS/Mx3N?=
 =?us-ascii?Q?ckx33TyWXWjajhlc+OVkMxqDiOTxpYQVCevutaFgz8RnL+kANjkKcMdaMame?=
 =?us-ascii?Q?nRdLyEeaj0q224DYP3qw9kDDzjRss1fVHU51wi0C/h2333RepRk/i2f4lU8n?=
 =?us-ascii?Q?Gm13z+lMiQTVp7hjz6EnQexRV1R98PKBTHd8JNveI8D04YLtQllFprgub/9F?=
 =?us-ascii?Q?qYt1GHEeGeXwRij17M0Y5bs9kHCGhAsBtbRFrQ+W8KM4XWpGfGVidb0PfF6U?=
 =?us-ascii?Q?PARiDossnqVMUWUEB1BPW7NsEk6kwXnsIyJb1syh5MMd00DwJYwGysaN9vNQ?=
 =?us-ascii?Q?OoIoTM6RJ42IV5ZSCzxixyO/ikepxEwxEbDMdrRe/jqEEEaW2BmGjiysLb8z?=
 =?us-ascii?Q?6RAv6q8P/uarASPFcamGbOHg3w9LfjmzTP4O9czi0g/9KAWzxEYN9FNp4cK6?=
 =?us-ascii?Q?IyYRQOyxJhCGF42GyXu69DBPMVIlvRfdryXyHbBb/OKjM+A5FnZ+LnI6usIV?=
 =?us-ascii?Q?M9GfU066Ywnv6PPQx2MqpocNCsPqfjoDzT4nLnV3DJysrK8P/zplxwFxmFtK?=
 =?us-ascii?Q?AlW8WUXYdAQXhWOFlt+kQWWldCfdNzACfgN8CDwQDlqqQA/1BcGoXPwWjEYm?=
 =?us-ascii?Q?d0Ht3IdErm4UairYYvfMXmD0iJuaSa56f1oHfH7MMKDyktoHu1KjC2nwPzXG?=
 =?us-ascii?Q?mdh1yxvoBPC9G4p7mm9+b5eedxTYHnBH/pVOPGPSk5UwEYcvU3ediLWmBVLX?=
 =?us-ascii?Q?WaV9m8ls7tz6iDGRYotPIrX8glBFQTn6xZmAdzlwov66/n7z6pCZE1CwCk+w?=
 =?us-ascii?Q?y/OSIo2kIa2Agp/QtMdOAk7IBni5pQ/Ax3gdY5MJJSrv6TmpZBZPwGSjhp9x?=
 =?us-ascii?Q?uccXrMP7wdQemxXJTR/NSBJGuSyDGOg7dOqE3pJrFn2IxelCFl1idoSov8IK?=
 =?us-ascii?Q?KyjhmVnmRl/ZoQo0zqwRpw0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 162427c1-87ca-49da-f4f9-08dabae9f82d
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 02:45:28.4628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0jE6yRT4ziaBkzdSDu1MbIV9Fg2USFxhn0B8SGme9DGCxyfFbdkNPFjm3ZUyHVlnERSwnXjjBP6jPyHbez4e5bd2p43SzNMFfKDJbXZFb4=
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
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
Changes in v10:
  + None

Changes in v9:
  + Update SPDX license                                       [Greg]

Changes in v8:
  + Removed unused #*_cells                              [Krzysztof]

Changes in v7:
  + None

Changes in v6:
  + None
---
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

