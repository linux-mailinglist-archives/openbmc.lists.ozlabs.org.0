Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01991862077
	for <lists+openbmc@lfdr.de>; Sat, 24 Feb 2024 00:05:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=aKHgSgLb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThQbR5GSJz3vYP
	for <lists+openbmc@lfdr.de>; Sat, 24 Feb 2024 10:05:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=aKHgSgLb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=9783e0ec32=zweiss@equinix.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 4064 seconds by postgrey-1.37 at boromir; Sat, 24 Feb 2024 10:05:04 AEDT
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThQZm6wl9z3d4H;
	Sat, 24 Feb 2024 10:05:03 +1100 (AEDT)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
	by mx0b-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41NKFIcj003644;
	Fri, 23 Feb 2024 21:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=5jxZlJGHmFnzSpuUN4tfCEy5yEH2OZA0xSUoIXTOZvM=;
 b=aKHgSgLb6hY+bcRBNLdeiDRP6Ve6CXsxEPxHqRoxKU1fp8I9Z9LRHy44hjiQ/IHlnDfI
 d6jXrqS4E+ske4mk1kd9JeEr7SVTjrgMFAwUOsSJJjRn6eLo82eh91E3GMQoeOI9kz2i
 nyjgDk97osKUOGRwKeP/N7vRecFuU7DSn2u7RJK6tgvx07mQBU7hU8+wG8845e7+RFCJ
 HzBKHxBm+tPneVLbZAnGiCEj/JFVmjYP+JSqpwRO373fKPynKK8A9q3JUODzu+k7rEYM
 tDLljfhZ8CCjkosKjL7+Zl2wmvV1OMqLX/8BdKncbMRehsmNi8IlK0R/5pR2FNqnpBvu XQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3wf283g9qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 21:56:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcHW3Bx15EfiMC6bh7gDsBprFQpYWGZUDPJR3B2DqOrOGL19NUCnAfAT1rhfFEKvgDBLONM638jyXowaCeVUO4uI/b01+O49bCfAvH6eXK8bkDySnQDwuHAPZapUbgDbYovKenwJvQDJYn/734j3oKRAzcMtEC5xE5Otmbpasbibxysq4neG4XvpjC9RMw9cUocChx3+szNYQQBc6slDBQ4iXjkKvBN/30KmYP1QrV397RErC3GqQQGrXyxbFkgQDfdl+aYsE1zM/lDPrQCMfh+2mHv0fIy134AcW552GTHog/yOvYKa3elodKhSnFZOADM45wouF4umIV7TmF55cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jxZlJGHmFnzSpuUN4tfCEy5yEH2OZA0xSUoIXTOZvM=;
 b=nJMfgvYR7VdK82JtHNd3QJLodC2MtFY7tGwpE3cW5dOVGqLmWxu2LJ5ooGZc0KvlmobPg0XHpDZO5iaasnQOSA8e1VzOS98jq+gMIQRK+RIIHsr03a0kbAjhVeVpn0mTiEeNatCCTSVqiuYWDK7l12KcHL9LlimkgPIxGbbw6N1RRlhrQDDCUtjE8vBEbEqRvo1kdhXe7iYV++xKu5pAyA66YOmt6m1mlECvBAo5Y0ngdDaEH73wxQeKNLk8BDMZ8yNXxprcnUNMVHvHee2r62rzSn7zBSnN9IKoDLb8tt/rvnqhuVtRi0SjVc/jmHba+/f/exhmid0751N+j7dbNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from CO6PR04MB7843.namprd04.prod.outlook.com (2603:10b6:5:35f::22)
 by BY5PR04MB6453.namprd04.prod.outlook.com (2603:10b6:a03:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 21:56:30 +0000
Received: from CO6PR04MB7843.namprd04.prod.outlook.com
 ([fe80::f16c:1fa7:9c55:c1c]) by CO6PR04MB7843.namprd04.prod.outlook.com
 ([fe80::f16c:1fa7:9c55:c1c%2]) with mapi id 15.20.7316.018; Fri, 23 Feb 2024
 21:56:30 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Kelly Hung <ppighouse@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: x4tf: Add dts for asus x4tf project
Thread-Topic: [PATCH 2/2] ARM: dts: aspeed: x4tf: Add dts for asus x4tf
 project
Thread-Index: AQHaZqMooqYzpBOY30+1T4s//fkNxA==
Date: Fri, 23 Feb 2024 21:56:30 +0000
Message-ID: <20240223215620.GA9299@packtop>
References: <20240222085914.1218037-1-Kelly_Hung@asus.com>
 <20240222085914.1218037-2-Kelly_Hung@asus.com>
In-Reply-To: <20240222085914.1218037-2-Kelly_Hung@asus.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR04MB7843:EE_|BY5PR04MB6453:EE_
x-ms-office365-filtering-correlation-id: 9970ec64-9f66-47f4-eda5-08dc34ba4ae8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  zvxrvfPx5Hab8BP+7wvRwxnARCmIywy8r0hZBP7sEr6ZuhmLnBfenhY8U7N/3PN1/IYKPewS3MuRve2IP/ig7NWIzRKd7NXTkO37K4MsPqKfC8WGZroGhJuiQNyRAvqwCnGBObHV/0QYDyV8t2YYrLvUTfiWJhqCql4g86BwKLA/iMjYZF3yPJjXw2Se30VnKAICAerNUPcYBMPtvcjKFE/WHaHReKWt/1cNAUvlHY672Rs+L9h+ig1GI61aV+IZdSlIQ/u4FqZbx+iNA80mcLfoeFHKZ/Izg2ZJRfrG5pkFPuJ90CSrsb1YeydmrjtUzY3T31hgIRJAdiQ4PK5CV9jQMVpb9x9giZHFP4DC0PTkYJsOoKNaKYttz3yruvNloi4AYjl/m5W5Viy+vt/gFdfjUijabpYFXhCzwKowcGY06Pd/Pdnl+dLhxpYdCEv3lV6rqtGmT76lS1G1SxhTyy8JLhH4hPAkiD5dbHJcl7ohPR2fxZTmySJKyx/JgaBJf4GSE6tsp2nVjMqGvzRFcKeLDlnZ9H8NxIFF77gUoz4n7J6QbRJfnzG64baAGpt53rOMXG2l5GdkVc3krvOECji+70O9DxSojF7Q6JtpLfehCxv9gTEWUWhuFspoy/cv
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR04MB7843.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?Wjoh8rJB9RnmNkKoGPlGc05eErBSodZyvrdRj6+HBSUZQQPoOVrMWvHGaEYf?=
 =?us-ascii?Q?tN9Kwk9x2mMwCG4ma1nwfmy3//09oFV0p1JG1Hp3WZGv6jbPqLp5dwGSBz2E?=
 =?us-ascii?Q?uOGysFhG4iImo03mue+yIc861sSc4ms1wX7QWrVWBjmX3E2sr9csWh+T67Zp?=
 =?us-ascii?Q?d4SoYTxwjGeasK+BVUFnSEhHwbDfPDDSuM5dC7GtjEegzTYyV2GpIu/IXCFK?=
 =?us-ascii?Q?WLKjiN4RYoTqkOC7d1f+g9oN/NKg1S2EDDhaYloTRfsG3hWwqdJa3BPkzPX3?=
 =?us-ascii?Q?zwjWo31s0VqGZdOvQVR3h/v5J47XK7tXUI013ijr7o+dA77Y1C4iyMauAyVg?=
 =?us-ascii?Q?nXuwzl2D0lPhcBgObz9N/HemM3GMC/BGH0uDuSOgxquskeg6RlHY07jvFkYn?=
 =?us-ascii?Q?pd7GqBIPmDy7OQhPDSt+r+7E2+ajC2KROFdRamZFUuSeVbTP1/9hCAcYeE4c?=
 =?us-ascii?Q?tMBJaTu8Umo5lH+doK9sSpCQMeJbXLK2SW9hkE9CgUYK/Wn5r688aKz1TI1s?=
 =?us-ascii?Q?4MFcvXzInZAYsb48aSPM4qhwYbtbnWJ3GZW6qI9KlnZBBoXSlncbIW4rTfec?=
 =?us-ascii?Q?+GPdcrFv38zio1+7y45pzKxlN1lQs8044q0pmIo9evhgela6Y0P0erhGUQ+y?=
 =?us-ascii?Q?u8PC5aDdjK2okLf911FEO/N9hDEkMhpEH6J64J/U+lD6nNpXomAWZnFgzhAO?=
 =?us-ascii?Q?H3+RFPK4WhZOfsXhtzMqcMYt/K0U06w2OLoCrAkAhsBEu4y+CjQzpofmkQ91?=
 =?us-ascii?Q?pqWLA65ngYx6gWQo7l1z4xYHNAtKaSf4AanPvkpbUyNYQX/esKWzQEA9bXVL?=
 =?us-ascii?Q?OeSmb3HN5Y3LrLQtUAJSve9mcOkNqgRiFzcpG2K9PmsQ0gRIvFXdHz/Penoo?=
 =?us-ascii?Q?EfU43wwtytGBC++abtaTiymH+KSEzEyFnNkqMn3htiZVmpuwLikwX6q+QLEU?=
 =?us-ascii?Q?1P19ruRUcwwql2enmJ0pJwRxHZ2a4MY10RUKMK9hqmxIqoNBWVEedRL5sCWK?=
 =?us-ascii?Q?FxKHEU86Na12mXENjOIiLNlhNpB9mBN/J1yS+eMWUz9ZlQ8/9TigtNm0jXVi?=
 =?us-ascii?Q?chGAAI0YMoPMYCUuY39yT977PLy2CwSGIVbzzT8ZypfKuopLQN3CoZdP+7Rm?=
 =?us-ascii?Q?MNAEmHIJdY0rdSI8gQeFF3xUZzmPx+0jy5rP79X8sW/4ue0XYKafz1vcyBsc?=
 =?us-ascii?Q?N0E3tQpj8omlTey3P/9JguOmxSYccWWhcUd6N+CAgH0y2kTrDGCKvqlUxzDj?=
 =?us-ascii?Q?fqdxeRI1Fao65OgVW8S4+Kb2FoC2hKAGjiWRsa5lMMcGohyzHbnvMQqnxolA?=
 =?us-ascii?Q?jLKS4pjOmbg9VoukjRXfb1MTIJrvMobgEEr6Alc77zCw3Iu2TsK8NM67d/Id?=
 =?us-ascii?Q?0cPyl2RKTFuiE8fZLGFZYmgOZY3JAglthgSMCrjqfGZDhkh9p+weia48izKt?=
 =?us-ascii?Q?xEHxXp0wFdqumya7E3NbpBY6CMRXZDhz+WMAE70NR5bXCruIzDbcC6IIiPdZ?=
 =?us-ascii?Q?c8Al1BbW2TJwVaOOj7XUWi3cllsAnZbspd047heW8vOLL1QdkQROM7HPgWQW?=
 =?us-ascii?Q?ol1Rt2a24BkrMBXH0JUWbEjjhII8mx4btJhsh6pv?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C88DE8B381433044A66E154D65A097F0@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	PfDTyDLDpdOU67bRvWWvIUZX/bd9AvXQKQ3W9b4/MifEd2VSmEjZC+YhD4RR1Nynml4kuYP6nlIJ94jxppbk2tuYvVo8AMbOxdatod/ttyWZWiNDbaH6pVQZkYI0zb9QbZYqu/Z8sZXtizN3gKVaH4O1Ajw6QqvCMyD6re8hTcKsuIAIAFx7PueTTpzuaHJsemZh+JV8I4G3QXp1ghTbXJlNV8fFNXBOT0lsd2NRTa3gP18zy8yrSobheQk22mtfJTPnou0VP17JaU0+kkXPGmujwXHg+HHnlbrLeON+PXAWiCK+3BWc1vQj8sb5DWr6gI7pdRxOEG8clCWuQtAecIoa3nE6exiaCp+g3CNg5+mzq3SynxoYRYd/vMmc14E1F+GKEiziz+nWx9jF4x/W2Hg8ldLxAeIYR3QWUf9enwTECkdDkDR+YBnDGCxCUq1/X6PcMng9DzPiomF4WjLxQt2q1gsyY/Yc5Y0fR20IXn9fVTlnXNYSgYKvg/wxI2+1S+WKMPJqOzMCqpsFmP9gSk/eWjqodmzLrlVUplvl9aM6ALWZQW9reRGEI1MlKBEtAW2siRWZDebjRFfViVV0FEXrVLgaXJnElhjE+Lm6371vjug8gGHFl33gc9liPrfsryhtpRCygZX6c82TT27I8UzzeUlOwSg+wroQmZvYL3E=
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7843.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9970ec64-9f66-47f4-eda5-08dc34ba4ae8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 21:56:30.4762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w4dqW4Gmz4kLXRnJMnH8SRgqXbaBUhjEIv0gGK1DHYofmRYSibSnpVSuKjmKVy/lOSPUgsmJfLdSAnVkeqPL8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6453
X-Proofpoint-GUID: VISMh-BNOsRdbnFJJLJFhfHuX28EcS8-
X-Proofpoint-ORIG-GUID: VISMh-BNOsRdbnFJJLJFhfHuX28EcS8-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-23_06,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402230157
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kelly Hung <Kelly_Hung@asus.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "Allenyy_Hsu@asus.com" <Allenyy_Hsu@asus.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 22, 2024 at 12:59:14AM PST, Kelly Hung wrote:
>Base on aspeed-g6.dtsi and can boot into BMC console.
>
>Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>
>---
> arch/arm/boot/dts/aspeed/Makefile             |   1 +
> .../boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts  | 592 ++++++++++++++++++
> 2 files changed, 593 insertions(+)
> create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
>
>diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/=
Makefile
>index d3ac20e31..32c41f3d9 100644
>--- a/arch/arm/boot/dts/aspeed/Makefile
>+++ b/arch/arm/boot/dts/aspeed/Makefile
>@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
> 	aspeed-bmc-asrock-e3c246d4i.dtb \
> 	aspeed-bmc-asrock-romed8hm3.dtb \
>+	aspeed-bmc-asus-x4tf.dtb \
> 	aspeed-bmc-bytedance-g220a.dtb \
> 	aspeed-bmc-delta-ahe50dc.dtb \
> 	aspeed-bmc-facebook-bletchley.dtb \
>diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts b/arch/arm/=
boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
>new file mode 100644
>index 000000000..1bda14a66
>--- /dev/null
>+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
>@@ -0,0 +1,592 @@
>+// SPDX-License-Identifier: GPL-2.0-or-later
>+// Copyright 2024 ASUS Corp.
>+
>+/dts-v1/;
>+
>+#include "aspeed-g6.dtsi"
>+#include "aspeed-g6-pinctrl.dtsi"
>+#include <dt-bindings/i2c/i2c.h>
>+#include <dt-bindings/gpio/aspeed-gpio.h>
>+
>+/ {
>+	model =3D "ASUS-X4TF";
>+	compatible =3D "asus,x4tf", "aspeed,ast2600";
>+
>+	aliases {
>+		serial4 =3D &uart5;
>+	};
>+
>+	chosen {
>+		stdout-path =3D "serial4:115200n8";
>+	};
>+
>+	memory@80000000 {
>+		device_type =3D "memory";
>+		reg =3D <0x80000000 0x40000000>;
>+	};
>+
>+	reserved-memory {
>+		#address-cells =3D <1>;
>+		#size-cells =3D <1>;
>+		ranges;
>+
>+		video_engine_memory: video {
>+			size =3D <0x04000000>;
>+			alignment =3D <0x01000000>;
>+			compatible =3D "shared-dma-pool";
>+			reusable;
>+		};
>+	};
>+
>+	iio-hwmon {
>+		compatible =3D "iio-hwmon";
>+		io-channels =3D <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
>+				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
>+				<&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
>+				<&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
>+	};
>+
>+	leds {
>+		compatible =3D "gpio-leds";
>+
>+		led-heartbeat {
>+			gpios =3D <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
>+			linux,default-trigger =3D "heartbeat";
>+		};
>+
>+		led-uid {
>+			gpios =3D <&gpio0 ASPEED_GPIO(P, 1) (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN=
)>;
>+			default-state =3D "off";
>+		};
>+
>+		led-status_Y {
>+			gpios =3D <&gpio1 ASPEED_GPIO(B, 1) GPIO_ACTIVE_LOW>;
>+			default-state =3D "off";
>+		};
>+
>+		led-sys_boot_status {
>+			gpios =3D <&gpio1 ASPEED_GPIO(B, 0) GPIO_ACTIVE_LOW>;
>+			default-state =3D "off";
>+		};
>+	};
>+};
>+
>+&adc0 {
>+	vref =3D <2500>;
>+	status =3D "okay";
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&pinctrl_adc0_default &pinctrl_adc1_default
>+		&pinctrl_adc2_default &pinctrl_adc3_default
>+		&pinctrl_adc4_default &pinctrl_adc5_default
>+		&pinctrl_adc6_default &pinctrl_adc7_default>;
>+};
>+
>+&adc1 {
>+	vref =3D <2500>;
>+	status =3D "okay";
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&pinctrl_adc8_default &pinctrl_adc9_default
>+		&pinctrl_adc10_default &pinctrl_adc11_default
>+		&pinctrl_adc12_default &pinctrl_adc13_default
>+		&pinctrl_adc14_default &pinctrl_adc15_default>;
>+};
>+
>+&peci0 {
>+	status =3D "okay";
>+};
>+
>+&lpc_snoop {
>+	snoop-ports =3D <0x80>;
>+	status =3D "okay";
>+};
>+
>+&mac2 {
>+	status =3D "okay";
>+	phy-mode =3D "rmii";
>+	use-ncsi;
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&pinctrl_rmii3_default>;
>+};
>+
>+&mac3 {
>+	status =3D "okay";
>+	phy-mode =3D "rmii";
>+	use-ncsi;
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&pinctrl_rmii4_default>;
>+};
>+
>+&fmc {
>+	status =3D "okay";
>+
>+	flash@0 {
>+		status =3D "okay";
>+		m25p,fast-read;
>+		label =3D "bmc-spi";

Is this specific label needed or desired for some particular reason?
Most OpenBMC platforms just call it "bmc", and I think some of the
firmware-update machinery may have assumptions about that baked in, so I
wouldn't be surprised if this naming breaks things...

>+		spi-max-frequency =3D <50000000>;
>+#include "openbmc-flash-layout-128.dtsi"

Just to confirm, this is actually a 128MB flash chip?  I ask because the
previous version of this patch had some indication of it being 64MB
(though there was a lot that looked wonky with the partition layout, so
maybe that was wrong too).

>+	};
>+};
>+
>+&spi1 {
>+	status =3D "okay";
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&pinctrl_spi1_default>;
>+
>+	flash@0 {
>+		status =3D "okay";
>+		label =3D "bios-spi";
>+		spi-max-frequency =3D <50000000>;
>+
>+		partitions {
>+			compatible =3D "fixed-partitions";
>+			#address-cells =3D <1>;
>+			#size-cells =3D <1>;
>+
>+			biosfullimg@0 {
>+				reg =3D <0x0 0x2000000>; //32768 *1024 =3D 32 MB
>+				label =3D "biosfullimg";
>+			};
>+		};

If there's only one partition that's just covering the whole chip
there's no need to include the 'partitions' child node.

>+	};
>+};
>+
>+&i2c0 {
>+	status =3D "okay";
>+};
>+
>+&i2c1 {
>+	status =3D "okay";
>+};
>+
>+&i2c2 {
>+	status =3D "okay";
>+};
>+
>+&i2c3 {
>+	status =3D "okay";
>+};
>+
>+&i2c4 {
>+	status =3D "okay";
>+
>+	temperature-sensor@48 {
>+		compatible =3D "ti,tmp75";
>+		reg =3D <0x48>;
>+	};
>+
>+	temperature-sensor@49 {
>+		compatible =3D "ti,tmp75";
>+		reg =3D <0x49>;
>+	};
>+
>+	pca9555_4_20: gpio@20 {
>+		compatible =3D "nxp,pca9555";
>+		reg =3D <0x20>;
>+		gpio-controller;
>+		#gpio-cells =3D <2>;
>+	};
>+
>+	pca9555_4_22: gpio@22 {
>+		compatible =3D "nxp,pca9555";
>+		reg =3D <0x22>;
>+		gpio-controller;
>+		#gpio-cells =3D <2>;
>+	};
>+
>+	pca9555_4_24: gpio@24 {
>+		compatible =3D "nxp,pca9555";
>+		reg =3D <0x24>;
>+		gpio-controller;
>+		#gpio-cells =3D <2>;
>+		gpio-line-names =3D
>+		/*A0 - A3 0*/	"", "STRAP_BMC_BATTERY_GPIO1", "", "",
>+		/*A4 - A7 4*/	"", "", "", "",
>+		/*B0 - B7 8*/	"", "", "", "", "", "", "", "";
>+	};
>+
>+	pca9555_4_26: gpio@26 {
>+		compatible =3D "nxp,pca9555";
>+		reg =3D <0x26>;
>+		gpio-controller;
>+		#gpio-cells =3D <2>;
>+	};
>+
>+	i2c-mux@70 {
>+		compatible =3D "nxp,pca9546";
>+		status =3D "okay";
>+		reg =3D <0x70>;
>+		#address-cells =3D <1>;
>+		#size-cells =3D <0>;
>+
>+		channel_1: i2c@0 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <0>;
>+		};
>+
>+		channel_2: i2c@1 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <1>;
>+		};
>+
>+		channel_3: i2c@2 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <2>;
>+		};
>+
>+		channel_4: i2c@3 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <3>;
>+		};
>+	};
>+};
>+
>+&i2c5 {
>+	status =3D "okay";
>+
>+	pca9555_5_24: gpio@24 {
>+		compatible =3D "nxp,pca9555";
>+		reg =3D <0x24>;
>+		gpio-controller;
>+		#gpio-cells =3D <2>;
>+	};
>+
>+	i2c-mux@70  {
>+		compatible =3D "nxp,pca9546";
>+		status =3D "okay";
>+		reg =3D <0x70 >;
>+		#address-cells =3D <1>;
>+		#size-cells =3D <0>;
>+
>+		channel_5: i2c@0 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <0>;
>+
>+			pca9555_5_5_20: gpio@20 {
>+				compatible =3D "nxp,pca9555";
>+				reg =3D <0x20>;
>+				gpio-controller;
>+				#gpio-cells =3D <2>;
>+				gpio-line-names =3D
>+					"", "", "", "", "", "", "", "",
>+					"", "", "SYS_FAN6", "SYS_FAN5",
>+					"SYS_FAN4", "SYS_FAN3",
>+					"SYS_FAN2", "SYS_FAN1";
>+			};
>+
>+			pca9555_5_5_21: gpio@21 {
>+				compatible =3D "nxp,pca9555";
>+				reg =3D <0x21>;
>+				gpio-controller;
>+				#gpio-cells =3D <2>;
>+			};
>+
>+			power-monitor@44 {
>+				compatible =3D "ti,ina219";
>+				reg =3D <0x44>;
>+				shunt-resistor =3D <2>;
>+			};
>+		};
>+
>+		channel_6: i2c@1 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <1>;
>+		};
>+
>+		channel_7: i2c@2 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <2>;
>+		};
>+
>+		channel_8: i2c@3 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <3>;
>+		};
>+	};
>+};
>+
>+&i2c6 {
>+	status =3D "okay";
>+
>+	pca9555_6_27: gpio@27 {
>+		compatible =3D "nxp,pca9555";
>+		reg =3D <0x27>;
>+		gpio-controller;
>+		#gpio-cells =3D <2>;
>+	};
>+
>+	pca9555_6_20: gpio@20 {
>+		compatible =3D "nxp,pca9555";
>+		reg =3D <0x20>;
>+		gpio-controller;
>+		#gpio-cells =3D <2>;
>+		gpio-line-names =3D
>+		/*A0 0*/	"", "", "", "", "", "", "", "",
>+		/*B0 8*/	"Drive_NVMe1", "Drive_NVMe2", "", "",
>+		/*B4 12*/	"", "", "", "";
>+	};
>+
>+	pca9555_6_21: gpio@21 {
>+		compatible =3D "nxp,pca9555";
>+		reg =3D <0x21>;
>+		gpio-controller;
>+		#gpio-cells =3D <2>;
>+	};
>+};
>+
>+&i2c7 {
>+	status =3D "okay";
>+
>+	i2c-mux@70 {
>+		compatible =3D "nxp,pca9546";
>+		status =3D "okay";
>+		reg =3D <0x70>;
>+		#address-cells =3D <1>;
>+		#size-cells =3D <0>;
>+		idle-state =3D <1>;
>+
>+		channel_9: i2c@0 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <0>;
>+
>+			temperature-sensor@48 {
>+				compatible =3D "ti,tmp75";
>+				reg =3D <0x48>;
>+			};
>+
>+			temperature-sensor@49 {
>+				compatible =3D "ti,tmp75";
>+				reg =3D <0x49>;
>+			};
>+
>+			power-monitor@40 {
>+				compatible =3D "ti,ina219";
>+				reg =3D <0x40>;
>+				shunt-resistor =3D <2>;
>+			};
>+
>+			power-monitor@41 {
>+				compatible =3D "ti,ina219";
>+				reg =3D <0x41>;
>+				shunt-resistor =3D <5>;
>+			};
>+		};
>+
>+		channel_10: i2c@1 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <1>;
>+		};
>+
>+		channel_11: i2c@2 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <2>;
>+		};
>+
>+		channel_12: i2c@3 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <3>;
>+		};
>+	};
>+
>+	i2c-mux@71 {
>+		compatible =3D "nxp,pca9546";
>+		status =3D "okay";
>+		reg =3D <0x71>;
>+		#address-cells =3D <1>;
>+		#size-cells =3D <0>;
>+		i2c-mux-idle-disconnect;
>+
>+		channel_13: i2c@0 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <0>;
>+		};
>+
>+		channel_14: i2c@1 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <1>;
>+		};
>+
>+		channel_15: i2c@2 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <2>;
>+		};
>+
>+		channel_16: i2c@3 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <3>;
>+		};
>+	};
>+};
>+
>+&i2c8 {
>+	status =3D "okay";
>+
>+	i2c-mux@70 {
>+		compatible =3D "nxp,pca9546";
>+		status =3D "okay";
>+		reg =3D <0x70>;
>+		#address-cells =3D <1>;
>+		#size-cells =3D <0>;
>+		i2c-mux-idle-disconnect;
>+
>+		channel_17: i2c@0 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <0>;
>+		};
>+
>+		channel_18: i2c@1 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <1>;
>+
>+			temperature-sensor@48 {
>+				compatible =3D "ti,tmp75";
>+				reg =3D <0x48>;
>+			};
>+
>+			power-monitor@41 {
>+				compatible =3D "ti,ina219";
>+				reg =3D <0x41>;
>+				shunt-resistor =3D <5>;
>+			};
>+		};
>+
>+		channel_19: i2c@2 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <2>;
>+		};
>+
>+		channel_20: i2c@3 {
>+			#address-cells =3D <1>;
>+			#size-cells =3D <0>;
>+			reg =3D <3>;
>+		};
>+	};
>+};
>+
>+&i2c9 {
>+	status =3D "okay";
>+};
>+
>+&i2c10 {
>+	status =3D "okay";
>+};
>+
>+&i2c11 {
>+	status =3D "okay";
>+};
>+
>+&i2c14 {
>+	status =3D "okay";
>+	multi-master;
>+
>+	eeprom@50 {
>+		compatible =3D "atmel,24c08";
>+		reg =3D <0x50>;
>+	};
>+
>+	eeprom@51 {
>+		compatible =3D "atmel,24c08";
>+		reg =3D <0x51>;
>+	};
>+};
>+
>+&sgpiom0 {
>+	status =3D "okay";
>+	ngpios =3D <128>;
>+};
>+
>+&video {
>+	status =3D "okay";
>+	memory-region =3D <&video_engine_memory>;
>+};
>+
>+&sdc {
>+	status =3D "okay";
>+};
>+
>+&lpc_snoop {
>+	status =3D "okay";
>+	snoop-ports =3D <0x80>;
>+};
>+
>+&kcs1 {
>+	aspeed,lpc-io-reg =3D <0xca0>;
>+	status =3D "okay";
>+};
>+
>+&kcs2 {
>+	aspeed,lpc-io-reg =3D <0xca8>;
>+	status =3D "okay";
>+};
>+
>+&kcs3 {
>+	aspeed,lpc-io-reg =3D <0xca2>;
>+	status =3D "okay";
>+};
>+
>+&uart3 {
>+	status =3D "okay";
>+};
>+
>+&uart5 {
>+	status =3D "okay";
>+};
>+
>+&uart_routing {
>+	status =3D "okay";
>+};
>+
>+&vhub {
>+	status =3D "okay";
>+};
>+
>+&gpio0 {
>+	gpio-line-names =3D
>+	/*A0 0*/	"", "", "", "", "", "", "", "",
>+	/*B0 8*/	"", "", "", "", "", "", "PS_PWROK", "",
>+	/*C0 16*/	"", "", "", "", "", "", "", "",
>+	/*D0 24*/	"", "", "", "", "", "", "", "",
>+	/*E0 32*/	"", "", "", "", "", "", "", "",
>+	/*F0 40*/	"", "", "", "", "", "", "", "",
>+	/*G0 48*/	"", "", "", "", "", "", "", "",
>+	/*H0 56*/	"", "", "", "", "", "", "", "",
>+	/*I0 64*/	"", "", "", "", "", "", "", "",
>+	/*J0 72*/	"", "", "", "", "", "", "", "",
>+	/*K0 80*/	"", "", "", "", "", "", "", "",
>+	/*L0 88*/	"", "", "", "", "", "", "", "",
>+	/*M0 96*/	"", "", "", "", "", "", "", "",
>+	/*N0 104*/	"", "", "", "",
>+	/*N4 108*/	"POST_COMPLETE", "ESR1_GPIO_AST_SPISEL", "", "",
>+	/*O0 112*/	"", "", "", "", "", "", "", "",
>+	/*P0 120*/	"ID_BUTTON", "ID_OUT", "POWER_BUTTON", "POWER_OUT",
>+	/*P4 124*/	"RESET_BUTTON", "RESET_OUT", "", "HEARTBEAT",
>+	/*Q0 128*/	"", "", "", "", "", "", "", "",
>+	/*R0 136*/	"", "", "", "", "", "", "", "",
>+	/*S0 144*/	"", "", "", "", "", "", "", "",
>+	/*T0 152*/	"", "", "", "", "", "", "", "",
>+	/*U0 160*/	"", "", "", "", "", "", "", "",
>+	/*V0 168*/	"", "", "", "", "", "", "", "",
>+	/*W0 176*/	"", "", "", "", "", "", "", "",
>+	/*X0 184*/	"", "", "", "", "", "", "", "",
>+	/*Y0 192*/	"", "", "", "", "", "", "", "",
>+	/*Z0 200*/	"", "", "", "", "", "", "", "";
>+};
>--=20
>2.25.1
>=
