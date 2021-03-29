Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C277334CFF1
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 14:20:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8BVl5QKXz30Fg
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 23:20:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=aXNDbJms;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.135;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=aXNDbJms; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2135.outbound.protection.outlook.com [40.107.244.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8BSj21tRz302m;
 Mon, 29 Mar 2021 23:18:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVO8+G/yVE+0hzptPYhPgxrRr1uvDpCDnALSPGpGynussmHgABuUUhmMkDPmGo4t23U9HMQlg34VTaUlZltvgwaKwD3rIPM+IZ66S1FDm8Eb1WZB01AQtKQ7qi0yVgNRJLJ8iYzpI6s8QwJ81d8LgcC93QksgHYpUrZP5c8Uq0NulWBXfeNXjCx8MaX+S7WyMjCiff/v7dRUOp42wFwOsHcflW7kU95z/H59NyN3LEQGpOT7yx+LSfBe2zhGRVYMpChg5dtARdlIUQkui/wETNmC9yDKFYwV7LSm3wcXdVN1CKmNRawQZNqUF/alMIB5VFlwdzkXiEx8d44yIeJD4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDKOwdplJFsue3nynYNcN8vpg88fsI9i8TnpdlofzgA=;
 b=lCM/QLpKeATeGO2wpydCHh2LCaT2H35IhkTiLDNN38onjGx9QjRcv2jlRPyoRVoRhdZX/a7LOx+1PY628Hg4750EkIIrN9v9taNsqIjvT4QMyKhrbsrrjZZyf4FUxGBE4qEJBm5bYYDDSsiQZ7kttRzPhCKP88hzKYhjCNBLa3YMOlH93BCxhKmYz/YFEL2yzRbIK8i+ouMVUFrRcjv071hU8lFSd9ANB+94BCGkFVQF8rQi4En8e/ZUKzPX3YIaBTOJpwnys6Y/s9ZoAU5IwrhKrBWZbZ91UFUWmyeRoTQlshKjF4YclgO/frHB8rVGT5JD6Dlxap/utQI3jiMIpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDKOwdplJFsue3nynYNcN8vpg88fsI9i8TnpdlofzgA=;
 b=aXNDbJms5Jic0RFSuN6MwiTMAihgavQS/svT+7eTUf2OcJSiy2fUnVcHoJPdNcd82PkARKmzCW9zjmbA10PbnVeB4m0Bgf8ZDBYz1WJkdNyAfbjsCu4v1sWvJ7N7VVJ56oSHuY6EAP9g5zyifLnsPOX/LSijJPNaWeM2DXYcACs=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO1PR01MB6679.prod.exchangelabs.com (2603:10b6:303:f5::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24; Mon, 29 Mar 2021 12:18:40 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 12:18:40 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Wolfram Sang <wsa@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v1 3/3] bindings: ipmi: Add binding for Aspeed SSIF BMC driver
Date: Mon, 29 Mar 2021 19:17:59 +0700
Message-Id: <20210329121759.5644-4-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210329121759.5644-1-quan@os.amperecomputing.com>
References: <20210329121759.5644-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:c9::14) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.14 via Frontend Transport; Mon, 29 Mar 2021 12:18:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46ea3989-e7c9-4691-91e2-08d8f2acc942
X-MS-TrafficTypeDiagnostic: CO1PR01MB6679:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR01MB66796052D613491CE3F5B150F27E9@CO1PR01MB6679.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZSjvsP07r12ybwdhCSpuKWhi2qRPzMUHkD9LP7+0LoKMfaAm0PuxdfTJT+TZZKwr7iX6OmumHVb9RZdYsbNN7ijBK1FtifjBsqaxjDXLaNQzl0X7IlsYk8kDPzjlFXEqkkpaXANvmymizeJ5V+voI9B3G56/sXWx4YfM8t2LSEljyj1lew39/G1Gn+BhcHyM0BqAbvYHtt3CFKQooPqLY3/3To12deD7lUVYPqgaA40ukKXF4FNod2fNNMefGRyCcuJmbqLkIhhc8V0PxY55YBRXz5gWcNE5RGJ0v+i6hs1hsHulLBEgvRtT/GegInxPi6xsdfSWpsRb3km6VPyq7asVVzQJqXLGizoKbDKHUFkn9OVXJ2/RBE6kwlr0AFXPrHSOcUrDoIYaMhYghuEonTAH5THz4C7pu+0BFEJQcD5gYS1Fbr1fMhyFys500kL83vV8LQSXnW4/cUumd6dCFQ+QCAaVatIaQieMgXYhQTQRUcPvd1AA4tSBEUD4E/zmSwHObGS2eZgLMvhyO68abQ8mo28pf247+U49qf5AgkLpdokWkZvRy77xxLkTyCdhMBoSghnJerbS8iHEsbKFEXbKbYMrTHrxXR8GFKR4Z5yK9+HjYoM7888Qft921bDogTh7jg0E0dTF6CeLb2eJ+0nQq5s66aKDju+tnE5vHl0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39840400004)(396003)(346002)(136003)(921005)(52116002)(6506007)(66556008)(4326008)(6486002)(16526019)(54906003)(2906002)(107886003)(956004)(6512007)(110136005)(86362001)(8676002)(38100700001)(8936002)(1076003)(66476007)(5660300002)(2616005)(7416002)(316002)(26005)(478600001)(66946007)(6666004)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/mwKPzIZJsdMvpHpvGdAgrYSiPtlzGwGB1GYOfN08x0zZxp1/rS8DDbEM9cW?=
 =?us-ascii?Q?Jaw+w87WhVNFs2+A7ajdBP8Es28azjHTgmqwdqBpWdR55fhXgXXTfN8vmYxX?=
 =?us-ascii?Q?zkLn87yKmS1IJmYmiAjU5ronEEXyBypyP0Gy54YLU0kXWdkirCV86yYJ3yW3?=
 =?us-ascii?Q?1mMNv4pOG1S3+ADUEn8y2Uv2w6eKLRkA7f7lR5vQXo3BS0g6SHVAp+UZefRX?=
 =?us-ascii?Q?JuRzogRMGifiAVFSaygfAMVWo6KiY9zPn4e28YZBtmslMELr5bSdWaQZkfsP?=
 =?us-ascii?Q?RPu7xLkLUmzXH15vI4Q6fDeN7yLSCHzYERaNtTLa32gxr06iwSugdltM+46x?=
 =?us-ascii?Q?j79sAh/qpYNjQ6QbSCgWPQ54bS4x30d/1V2XIRQXvhHDgqoPH/eJ9hEoTcYB?=
 =?us-ascii?Q?JeHod1XvFDUORX5OCxRcjw35CizMH/uZa0+vU6w61TdOqbXHFS8LVczPfagP?=
 =?us-ascii?Q?jJBVxbj37P1ma9cdERGptZfGk1DWZ89Ttult2G+6MNVhmxk1y50uPzSw6JCW?=
 =?us-ascii?Q?u+SCpfXXut8MYcw7LZwZnvygzK2/hEuZ742tY/DC+2uA1KMVFnav6NQAeInB?=
 =?us-ascii?Q?EzWZjfoC4bZq4BBhj3uVG8gF7wndF93vjVD/OXLRDcosu5vnGjfHCuV1M5cS?=
 =?us-ascii?Q?H0+BKeju1UiOIW3AeZztPOWRGn86dRBt4f+4djZPhSPx8xvNfX2Ml1DEAj1H?=
 =?us-ascii?Q?ze25W8PThe3azFz8zoRcsDUZlJhLIktjyvB+FjXP1HEC8IFds0hpqETov7Nq?=
 =?us-ascii?Q?PdnRP8s0yjVKrkYKTshuquzeUHH5bGRh9c61dgT1zfN6T7VU5JrVu9xfj958?=
 =?us-ascii?Q?q/298Jh/JIbHYqA+xb0DGg6l12poO+BbzntyEsxQNlQ2QNKnvC1s+7Ln91N/?=
 =?us-ascii?Q?4P0pH+0k3hNjBeVLGplOUCLXI/Nr8yAUrEfEVfx70tKqsjiwHGNuCxjU+QS1?=
 =?us-ascii?Q?rroBglQQKIqRYRiwgKNJr3qwJgXXi0eIwv2YHOYMpDn4krx8DKAuewKaHLzw?=
 =?us-ascii?Q?HX+Zs7cnH1Rem9d5tWWKH7/jOqpV6bhVnvvbYSgp0Gz2+WODqNPbpSdACHgg?=
 =?us-ascii?Q?K/aB/kW3ekvuVd3TgNFgTCSBoz/lTPoVza0WzuD43GAD3yKQr/Ayx7ne5+0e?=
 =?us-ascii?Q?tZJLjrzFtKK2sQVLyuoG2puq4UntYsMefo4IM0cOoDap/8a7cWPhCMGelRPQ?=
 =?us-ascii?Q?Q+gB1OrhnXfAS6wh54k50qAVef5PRhowmuS4t4saK7oP1qFvhP32NZ9xfJ1B?=
 =?us-ascii?Q?lsjf80rhqYRjn90DLcdH+Mwq1d4vZdrEQjl8EBTN8AZ756yCtQCQBl50xnRS?=
 =?us-ascii?Q?NbfS60xjktBP/3mORJ3Eg4b5?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ea3989-e7c9-4691-91e2-08d8f2acc942
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 12:18:40.3891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: reBwA3rMYilNvsFOEQbxHp95W50/CLt8fPjKrcm3lhGa98Mb2P0IDGVPQMYIypkhz63wrULkj7i5acLFH++dNu4wUez2IBQ/LqXepeQKmSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6679
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
Cc: openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add device tree binding document for the Aspeed SSIF BMC driver.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 .../bindings/ipmi/aspeed-ssif-bmc.txt          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt
new file mode 100644
index 000000000000..1616f0188db9
--- /dev/null
+++ b/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt
@@ -0,0 +1,18 @@
+# Aspeed SSIF (SMBus system interface) IPMI BMC interface
+
+The Aspeed AST2500 are commonly used as BMCs (Baseboard Management Controllers)
+and the SSIF slave interface can be used to perform in-band IPMI communication
+with their host.
+
+Required properties:
+
+- compatible : should be
+       "aspeed,ast2500-ssif-bmc"
+- reg: I2C address the registers
+
+Example:
+
+       ssif-bmc@10 {
+               compatible = "aspeed,ast2500-ssif-bmc";
+               reg = <0x10>;
+       };
-- 
2.28.0

