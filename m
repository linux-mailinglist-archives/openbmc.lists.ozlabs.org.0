Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 868BA5F3FC7
	for <lists+openbmc@lfdr.de>; Tue,  4 Oct 2022 11:34:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhXbM2720z306m
	for <lists+openbmc@lfdr.de>; Tue,  4 Oct 2022 20:34:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=eHQnlxK4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.120; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=eHQnlxK4;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2120.outbound.protection.outlook.com [40.107.243.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhXXS24Cfz2xJ6;
	Tue,  4 Oct 2022 20:31:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggtOuspWmbsYq67riWFIiTTafctsw/gNhiX7hpbCMp6kp79gestLQ6uSmOElmJtpjpbRh4mrTJnb8wXWsz1RLhyV55+Kv292PEJvw0Tg4JPVejrN51L7YL79+n+lOyY1gWgR8I578nU4hiCeHtjKfmq0AaopNSccffyMenUZ5TA+UuG1+Mw28R2fdeeu583JLVv9ibQVPUOpCwzOQiwp6CftxnaPcOOT8pCk+rUhK3Pnu5jkHwFSnGOutdnYQ6XWTeJL8fI7c1qc2+TuUtJdv0jC2ZnPrXG9cK015seZ1Pg0CtMU/KdmCIwrYHDj4NSkY424hnH3ZQSuag96KnO+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TUMvTNE7ZOA26Snq3JCd6YliAo5iu1MMM78QQ4h3Rk=;
 b=B/pigH2OA7VZTH1UJFf6Lkiqqx1sx0woruO1GAx5hMiqFq5B9vcTo3mHWsD9EnBaqzAvNClCOX9VPk1C+fHStMPggyu/y7rhKEUC1o16XA7MRU/ohzSAypVQ13ld9gG5Im9j5vmwFnjwztf/M1qEjeVlbA/e7Tc/oWCgSztvNCiFAGriI8ND+HLwbNrfMhA1x0aOrYyAbWHBBDBl2rKADGYvsIVEoK7dEArRNQr48EMRPkGd921uTd636RY2SCgCvTGOjyui0dSVZmmIRvpd45DPU9X4PSg498713OREYP7dQH5o3/p31qj2k8tjxF6AKGLBGaQsdEyngvm3Txpu5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TUMvTNE7ZOA26Snq3JCd6YliAo5iu1MMM78QQ4h3Rk=;
 b=eHQnlxK45cmyWYDa4kXzTsCpFwvOeFOp+L5v0nMV/1ff0AdGTh82NooKfy4on8SSYwf37WwZfPJ9OtmsxPO9t46VevOnBw9OkEBhSZD3TfSSoXbaVDDbkt69Xc1B18hTm9XRguWfNqauUCTuAYlGMwEiLD72sjGyZYBH+M42kpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 PH7PR01MB7703.prod.exchangelabs.com (2603:10b6:510:1d6::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.28; Tue, 4 Oct 2022 09:31:39 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 09:31:39 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Wolfram Sang <wsa@kernel.org>,
	Corey Minyard <minyard@acm.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v10 2/3] bindings: ipmi: Add binding for SSIF BMC driver
Date: Tue,  4 Oct 2022 16:31:05 +0700
Message-Id: <20221004093106.1653317-3-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221004093106.1653317-1-quan@os.amperecomputing.com>
References: <20221004093106.1653317-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0029.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::16)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|PH7PR01MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: c4a71c54-c827-4924-3162-08daa5eb3d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Ci6AywFsOdJmeIZ5GqRM8e7p9TQ5ipySVcJVTqsroF8EsqIW5PfttmhzEh7GDS5hM4M7mCqQaKypj/vgZdTSGe/GvmOb2kFUVtao7bbQutUTCAQujsGp5mFXKFiVqiyLFW9kgaa1CCtHiXV//O1S6tpPkdwivD8adksfGvWVV/QOO8kNvVNHCxsDUSy3kLkh/KSV0LcKG9dXsc3OR9fRQ5m0HqSZj16ftrQNzv4DThxM5NlC05GLnA3PyDW6ARZjpkrHX3tZ7cY5/Ly36RekNKcLeFmwqjyF4N2I/dYC2ha+i0fPy4VCC0KQiXnN+5FS1/N/C5fasYJ3ikjgraR7G+n5NEb0j+i3Gvpi9o+oL148L6of0HF8d6Or2Pk+eEe6WBTMrYXOOZq0OsgKIKT91FPoJmndTfnRDNAcZ+rQV+PfiJtdQepy6Owvok7ZMUM85CC75n7kl8HOFg6ykiAjTU6j5+azoHR5/nLlmSC10fZyyX0iLpTaZdTsXM8gZbGF66sI71UoAcn8GPLGxSLFkD82aX1u83G3xUaY53EMUAeAItSbId12ImnAFaDLqeLkkG/ua0wSHhsMvfE6oEBnHS2ggQ7+bQ6ONjsUPl3KHHtbEUR5/0iux+iB1ezezeqFC+kukfGsPJK+F/Ihyf6rZHd3kdJg02bQl24C1MscJO0OLq/xh4LlGEyneABMy4KqeTIhTOpKQnY9Sef47AqZQ9NDPYAv+TN9BVbhruT8Z6THsuwisysH6wtcVTHgjIfDjQ9Rh274GV2wq5hRGlBanytfbtTI6sT2tFY+8/rwLw0GgPgme6L3Wgx/GYccg4X1w3rkbeIpRceOxIl8dlA79znylqNt7HzRGwKiWeM4nvc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(39850400004)(136003)(346002)(451199015)(1076003)(966005)(110136005)(186003)(478600001)(6486002)(6506007)(83380400001)(6666004)(52116002)(6512007)(2906002)(5660300002)(54906003)(2616005)(38350700002)(38100700002)(4326008)(8676002)(66556008)(66476007)(26005)(66946007)(316002)(921005)(41300700001)(7416002)(86362001)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?TET2uh6ieznKx5il4v5AVd9XjQViP4AeriR5cX3jBMmc0S/4PkYx383uVQOT?=
 =?us-ascii?Q?d4ttNlJSrQhJtbUuraBc350RApbCxpZ5cWZbjz+ie6540VxLygJHVF7+CdeE?=
 =?us-ascii?Q?x7ivWFv4Hb5oXq0and4Qzgb5px2qeDATfOD/ckK/FHVhA+nEnenCr806aVSt?=
 =?us-ascii?Q?ctL+/SnJuNy5lvJtMYklTSQiDYIgcEx+qDs631ScJvvytxOZFQSVMuJBw+f1?=
 =?us-ascii?Q?grbvuMyp3BA9XIc7oRitwZrhakdh4/h28RlTMWjVxzk4UTQQ8/iyqnUiOfAM?=
 =?us-ascii?Q?IM08bKzRL8n/1Sxxg9jzPb/JHsgVh0ooOt8NyYhBUMx6euMfgJnIZi9RpLgh?=
 =?us-ascii?Q?Ovk8t+dPdXl9BPcNhJLlKkznR2q5iCAWh2dD/gzsE9NDH2MACNH9czeg6eyD?=
 =?us-ascii?Q?sKm/LK82xwSH7w1O9V7zb4+zVq0IiwTHnty87UlvWjsaLZmpBORLb7mOIIlv?=
 =?us-ascii?Q?Zu4YGJOH7J7sZXQww0Vx9LVLhX6SZe8Vt9tevHRZ8/4weiNYDA001CKJ070T?=
 =?us-ascii?Q?s+qr2UD9OTTfphH9h6eX/6JrXb5zWSN3sie5NM0HEuALOiy/LSdkz+7v9/Sl?=
 =?us-ascii?Q?Upiu1/7KWGW3hm+Z/T2YDS2tzasOgfBWabWEaYygs147U1bUqOYEmgabsf6h?=
 =?us-ascii?Q?bgJ4RET9lUDdD6P8drWw2iYMWZRPofPF88uvSz/gTHAeR+L0mkwwvmZIFS+o?=
 =?us-ascii?Q?hatPfqlyphijzMnOEw2L6kAjnqAPC9/E+REUKdpDPGX5cN3Zkau49Bh0lvUQ?=
 =?us-ascii?Q?wQIcc1fuU6Z0I9TJbYuPaPNTxYB+m2N3RxHncZu5X3K0aiPExJsUdXqazUYd?=
 =?us-ascii?Q?X5SIzsQp5LdhD3P4NQFOhQhlV4cl4IhZS70BB8N8DFQ6ci1X4FLRJS56jn6S?=
 =?us-ascii?Q?3CXgvFETF5HFl9raKflvFHgmwCJ8muHrNxzsDb5aVDlo33ilt5crLmGvyJ5P?=
 =?us-ascii?Q?+uD9LT3Fow0IJGjuO5pTxrhbT8DBYpAmZvFmpj7NIMN/Oaffth136uwzwLDu?=
 =?us-ascii?Q?OnqB3Wii87Vvj6GtSA9gus2op9eGmsDFTCCje3SkyyvuvHL8p+pRFtEfzW42?=
 =?us-ascii?Q?OYh+qna1UYET6ePS5crKgvKhrwwOr9J1OsbvFFMlJobS034UZOTUivql7PdA?=
 =?us-ascii?Q?RmAgRDAeNGA//5KeeM/Kk81lI7G7XxtFCdkS2D3GJkCqBiJDj2uO/vwBlG1e?=
 =?us-ascii?Q?azKTaFmCY/Xkf36VwCdcnqpnjhE+rTM5W9Itoe4FNvQrJwHjYxDBNnnPQfSs?=
 =?us-ascii?Q?3H0pT5Vb2jGM2db8d0hvDhymCNQJoLY6aA9KG+myrUc3jK6DbVPES2c1k++/?=
 =?us-ascii?Q?qKUWWhw3lDGwvUuusNIp3R4QM7c9qNyhEQ0SqFMx5BPaC4pGUUGtgAYXXcwj?=
 =?us-ascii?Q?z4E+S6754nlM1XIPp92AOhKyiJKzSgF1HoENNXAobZH6O8m96sUSrM9Rvcb8?=
 =?us-ascii?Q?DEmLETJb6nV200ODDPMK4Jwc09JLUDzEXV/hzWa/A1OSZvBysAhDNdSAclpH?=
 =?us-ascii?Q?DO6Z3eHKqU24GYiQ0FqErYhZNvdnf0yRLY5ikSAf+SMsP/GKAxhBUGSz6PCb?=
 =?us-ascii?Q?X08Mb3GysgCRgNtMRqHoC+jnz5y60GPLU7DW+OQXwkyX5/+hD6oU0JZ3Rn1R?=
 =?us-ascii?Q?YXRiep1bC1kgPP1rveyprpo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a71c54-c827-4924-3162-08daa5eb3d7e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 09:31:39.6423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vO07yTEtfJXvpd0DvX8/J7UjNvpwfMDII/2NfzFj+3enu1sMgjjsvvj1o/+PPW2eCWqp2hAd8LwP9ZjPKpXkkGvAhUkIL9majm0N0WwhRkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB7703
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
Cc: Rob Herring <robh@kernel.org>, thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add device tree binding document for the SSIF BMC driver.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v10:
  + None

v9:
  + Update missing Reviewed-by tag from v7                         [Rob]

v8:
  + None

v7:
  + Change compatible string from "ampere,ssif-bmc" to "ssif-bmc"  [Jae]

v6:
  + None

v5:
  + None

v4:
  + Fix warning with dt_binding_check [Rob]
  + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml [Quan]

v3:
  + Switched to use DT schema format [Rob]

v2:
  + None
---
 .../devicetree/bindings/ipmi/ssif-bmc.yaml    | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml

diff --git a/Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml b/Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
new file mode 100644
index 000000000000..02b662d780bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ipmi/ssif-bmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SSIF IPMI BMC interface
+
+description: SSIF IPMI BMC device bindings
+
+maintainers:
+  - Quan Nguyen <quan@os.amperecomputing.com>
+
+properties:
+  compatible:
+    enum:
+      - ssif-bmc
+
+  reg:
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
+        ssif-bmc@10 {
+            compatible = "ssif-bmc";
+            reg = <0x10>;
+        };
+    };
-- 
2.35.1

