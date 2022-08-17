Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDF4596A3F
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 09:19:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6zsP1qZxz3c3B
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 17:19:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=NpCx75oL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.135; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=NpCx75oL;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2135.outbound.protection.outlook.com [40.107.93.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6zqW55wCz3cDD;
	Wed, 17 Aug 2022 17:17:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+vEAS8xmzQmemUQmevNZFymIw93Db4ZPPezZcchG55ZoX+q1vIS98+F7absXo8hYnBXhTvaxyiOb2h3Q8QfbPPqjRiAI7lN+ReqQ58+0tITx9XxjGkf0ewEqn+lGse6r9oUIGjbldlwDHITcYzyl224KAObKfz3WfaeRMTQ1vbudKKhF/AknJXylhRJjp0+1PZMhcPgUMxZ4F5GTN9CKIQcleo3t8ZimjKZTdy/v1XYYLkZM/Qow43GgcQjhDDI+R304LpEJb/4SG6IsQxo4zJ+8wupHLG4VVv7x+LcrSVGEIBVXzP2/lVqS3DL86Kb2+wGsFzHYOqi3zZCKbOKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+9vnfcD3Y6pmMgdtHwus3Edx1fqGrtNQB2Nwdte/2Q=;
 b=EgC/aDFux93d41VztJgfcCQSVeceEK9D+tewOufLCvg8onh/SuhA4WTV70MxW5u7HlF/QMDJusOYfxDDs9djgwkR6Hsr6Anm6cpj7bjwb7GOgMedN+IKpy4RzvXzzKpfwadhtWM1Vsyovwaijj8q6d2gFEoKy+jhF2JxRTAdEP0QsfAo/7wKvNdbuILiZ00A8hyRgxgCPe1w/leeEZs0st9aAx3F90z6lRkTDuyVmwee31EEWI1jRyeVU+mpSv7WlmIGi6RESwumek9uwRj99vwbfhMPpFDxZAjbQh8l+DjVQ+JdbMsoNCZ7LpMmSgV8Fl5Z12bF7XtXnlEZUSKuRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+9vnfcD3Y6pmMgdtHwus3Edx1fqGrtNQB2Nwdte/2Q=;
 b=NpCx75oLlLxl2/xyNfZ+km25jzL5rbVcNrwaEMGnn7Bjryx3OStH+hW4yC4jZ8o4DnGyI6RgQ3mkj8NmYG2tPuJx2cTpn66LFcg6IEKZN4JOobb5zsYOL2Z/9M4ahkTqBpaz7lyVyLonpG8bRnbWk0O/vxZWa+2so4WmbAqtYKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR01MB5300.prod.exchangelabs.com (2603:10b6:208:78::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.17; Wed, 17 Aug 2022 07:17:09 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::2c79:3341:5ae5:7d26]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::2c79:3341:5ae5:7d26%9]) with mapi id 15.20.5525.010; Wed, 17 Aug 2022
 07:17:09 +0000
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
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: document Ampere Mt.Mitchell BMC compatibles
Date: Wed, 17 Aug 2022 14:15:38 +0700
Message-Id: <20220817071539.176110-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220817071539.176110-1-quan@os.amperecomputing.com>
References: <20220817071539.176110-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37a1d818-e24c-4a2f-d876-08da80207f50
X-MS-TrafficTypeDiagnostic: BL0PR01MB5300:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	YAxlNgqMT//UVztRUMAbhTHMOF5jeHkDwel2FfkOuZYY8qu8x4J4Xbtse26CEh24pXoiK3XMPiMN39KNI2IzoJV3HxQlUDL0G630n30rLn7hr5bnf+msiOmxrf6mK2g4hFcLVIAJxtjlBcQggZWIVyHpoQk8HxwCmKFbVmHm5Wux6Bi3Oui6iK3nWU2AB4kHuj3MTNQUDkOVwxF6UIigyLV2hnzZmJ7hOpb0lrr7eru2u6VN0SEmF1ptpJ6O0L1z+DJztRUXLVlFBgiwsvML/g5K82F1Zb4SU6USbUuq3MMMSsRDx61U2L5uQJY7yDMQ7Y6FHS3IXTLBrmON/aiLCO7UpIpbvv2gDHE9K9RC9BWE6F4SFf2yG1Q/47CLOnmwSO3GQ1Qe+bN8+P4fKBqN5NIT5t0bdEXW0ignsFQLBwky6ZIa4pPq5Bhhzi88QZDPqDCFUPaA1PEi67QpecMxTrEUg4AgtMfUKQHu7dfoAqV2fn0rGyhupd+6X51OQlZBVvXr2/wgn0HgB0IZR5bUa06fbmEAP+cXjUBDlVe/xSwECAO6z4HjXcXX3ATPM32AL80mEwO8IqBSCcKG/VMQ7hRHzoHDuHSXLQJ5GqElKOBMni0tN6seGV7wFBfrddSaWbBq7gad+60bnNhr2Mm5Ft4fbb1t6tGOOCUDeQTtjxnJO5Aw1/erzmrZtd85O42S1tDrVEZlX+hTXtoN96f2/TPDqfQtJR6u1N6HJ9XGKge8su/L1OSZDfj2LervCcLbGEh8VMSyWQtomm/O2ZPByjlNAQH7xpWtiAQ+TNmOivHXaWTgPRq0iMD25NJMt3843sQ2FgvJDnj3q5tQZxzxVQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(6666004)(52116002)(6506007)(6512007)(26005)(110136005)(86362001)(316002)(41300700001)(6486002)(38350700002)(38100700002)(478600001)(186003)(921005)(107886003)(83380400001)(8936002)(4326008)(5660300002)(7416002)(2616005)(4744005)(66946007)(66476007)(66556008)(8676002)(2906002)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?3FJNlfg7DNr82ugeiDJhugc0s8NlEgTW9mj+b1FDAtyuKab/uHHQ6qxvt9Lv?=
 =?us-ascii?Q?twjPD/Ghi031tQiRLLkRT33/728BIqXJUJlgymxSPdbgziD67LvLmE7OqG/Q?=
 =?us-ascii?Q?V6G4f2pp63Bgj0TN4405BGKRkNLylRdra2DVxLMg8BPB+mO5CExJEY8cpjXx?=
 =?us-ascii?Q?3kiwmI1gcd/5k2eGnSPm1vco40E3NrgURHn5efZboU8I9MsV14L14IH80m0p?=
 =?us-ascii?Q?t3+8+Sw/74ykUKQUcm1ZhA/3said1+VPWw85UNjwp0dMw4aYqYFq41k1h1Vf?=
 =?us-ascii?Q?jvD9C1A3f5XzyHNv8ZXG/gVlXv+8NeY3KSpibfkNt35JcvnVawUSS3iUNsa2?=
 =?us-ascii?Q?0FYDnxNdYZ2JvDFXVpINRn0hS4FDEGv0mV7Pc5vJc4sc4ZuvEyUaFsUJf11N?=
 =?us-ascii?Q?HJM0VvyJ578syaJr/7gs9kp7hDnx4vyLI5BtxsSNRjzvXdevrh24cERL6w0L?=
 =?us-ascii?Q?pNDd7+bl499urKRxxamSjUIIVpVjr/IKltD6d9rp0l/k7aJSl7rtAwzgJHtf?=
 =?us-ascii?Q?XTP1M1HKMDsIga4iFZYVzaXqSLDuiWW+m4sRJ6GOaiDgfM5O08orjkEhN0kW?=
 =?us-ascii?Q?Fm7q/9aHF5Cgw5pXwjJ+7167JOgQ0xakTWsVuH9OYnV1E/S/uGFDqGMjL/hy?=
 =?us-ascii?Q?eBoa7LBpw58o7zMniP3xl+CkjTfnbzTclZPEA3/rfGGxmDaQa8OKTXg47I8B?=
 =?us-ascii?Q?uOD5KTG74kLNbsd4yCe84H2vYKfpxcOYeX91lhuoQ2NewP2XQ03v5x4/gMEm?=
 =?us-ascii?Q?e/Ry5hm1LpYpNV7sP1wUQOi4116oyoAqJV23WkT0Rafq7jHtkp2ibFmGHiCV?=
 =?us-ascii?Q?ldbq+RULumo5pI6f8Ttwu1QrHnyEb/V8WmX/c/KqQMbJQaKAOvvZyEKQx06p?=
 =?us-ascii?Q?gqzdjuwyzhAXTbSDqqqeA4Spz5ai0USvNjnb1F0jP6GTMmEr/ZLIcTGqdSlt?=
 =?us-ascii?Q?8EP+AB+O4r6EANRTPXKxUvzWW/eZLq+dymDmn8sn7PcY1GPgsDmm693te1jG?=
 =?us-ascii?Q?8kYEfKUIioTMrc1KOWSNslP06uP9FFn7Sozf0WAbI0uldQLjBku8M4W09m5h?=
 =?us-ascii?Q?YQBrqZWFYlFCrjFIw7IkJ7zfKkznwlkcqjXNgIkYmlrRhTx8mJRC2P+cdEVg?=
 =?us-ascii?Q?PZuKWV2bxftDkBRs3ZFxl4KrpfnYHcOid9rNbkToD2gXsYPHfv11yvhNm8Fy?=
 =?us-ascii?Q?a/z0WjaGzjJJIaNg8VR18uutH8Tfrad/Fpbf7l8yQuvtwGMkfBy9I0pewvFp?=
 =?us-ascii?Q?VgrfxOBTVWee+P0P+a7snKk3gtxwuBBQcFhbrwMoAXSEMbZUnQkE2XA/DIXZ?=
 =?us-ascii?Q?v3Ve/TZuhW6GrKILsMZA+1eVvDj9HQpBbs1Yi5N4+M9IeYe+SPGjTKzxAJTD?=
 =?us-ascii?Q?BejD6jtAuDaztPFJgPLWtHgQ3InfEidonmhweTzCXL3nN+iC285HmbmeFXdy?=
 =?us-ascii?Q?l1VPx/GGxPZZRyv07xv8E+U80X0uEbX4KADBBgSI3CrRwBr0Eu12fWUDfOy7?=
 =?us-ascii?Q?nSIGmMym19aBMfqfMUwvYJ5DRtRQqhNo5D4UKmgZn/kn387sn6QkV3/d24K3?=
 =?us-ascii?Q?E98C/pTaQcWQAGo6QZezMCLmel3O+6EV4gj8B1s4lPOAQE91wnpNjR784qiN?=
 =?us-ascii?Q?Y91acKRk38wxNyji6d7iFJA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a1d818-e24c-4a2f-d876-08da80207f50
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 07:17:09.3398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9m2UyItIlqYPK2SzbRzxAu75iGNWwD19q65v4NUgHiszd41VMdXbBFE+s4e+/pFHKRDOCoCY9cXQj/LQCs3jbPrpmphywi9CBgDLjfksgxo=
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

Document Ampere Mt.Mitchell BMC board compatible.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
v3:
  + Fixed the alphabetical order                              [Krzysztof]

v2:
  + Introduce in v2 to add Ampere Mt. Mitchell BMC compatible [Krzysztof]

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 1895ce9de461..59811e4a084c 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -69,6 +69,7 @@ properties:
       - description: AST2600 based boards
         items:
           - enum:
+              - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
               - facebook,bletchley-bmc
-- 
2.35.1

