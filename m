Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EB135945F
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 07:16:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGmZB3xnxz3bpW
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 15:16:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=BtxB/pZv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=5733813a0f=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=BtxB/pZv; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGmYr3jq3z300S;
 Fri,  9 Apr 2021 15:15:59 +1000 (AEST)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1395F8MM020505; Fri, 9 Apr 2021 05:15:37 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by mx0a-00268f01.pphosted.com with ESMTP id 37te7hgat0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 05:15:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSYLx7hHidEv8Km4M6t3Gp2jN2bGv55cgU82kV/ijtTxtnmIBVHsZE3fDzTLJZj0KoFnZqALNnaz/6ZFxaENBkSGmF5INGcTsehqwggiHxPQ9/gcd3W5vNTecjUGmlAIXfM5l/Yo1QnGpYP400JRXObcV1HMp4uo2fKr8vk/qPg66qXUEe9O257yzSKQTTt0M15jJGsv+352y2it90IXrj6M2u+VqvLvhnnJlo4yH6C7fdU0nV2IoPXJeowYs6HTFitvEUmn1quz+kqzEkGsFb+HBfwP88kOJx9B2JS4dXPlFWv+rsD6sUttcznpDbYQtto7I2ZAET0sxyR6aqxrSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mheu3lEgOB5NsXOqtk3QFHM/taU7Ct10qX/nzcee2Dg=;
 b=HesHcYjtjZFWy49Z0sDw7+darDvP/hJYreZyDX7pfTV5otetMdaXzDPGBS6SfsUsJhqZ3BSrpQmHL1TKiKgwWZGX0lr4tghxdgTHW+WDftYYcP5AVNOCC3G3Q1EllrzJN48MlSt7EN95MS5apfzQTl/9iW1KBYsVvXkvpQYa31N8VMI2lvIB19TobSIdo0f+l4Zc9Tb+UK79DbXcyB1WRcMnXnrDuvcuvuu78Nn3pOzX/yCnbklzbpOchFR3SiEptuBZRsHg7E//FvWqHZhs7L7eS8OuS4JbgbJJSUm1wEyTQyb681DCxntfvZxSbHSJbw5epdHp5VQVl/hUFllqzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mheu3lEgOB5NsXOqtk3QFHM/taU7Ct10qX/nzcee2Dg=;
 b=BtxB/pZvO/TE7hmm1NwRvGBB2dzjQBknQFUIKlwQVW/kKsIszxX6ickYGb9wwHGDXSVByv6zooYzAMck5jt3yIfuVGkKwwfCzCUGU//ToPdMiuIcQo0qc12qTtOJGYadFzUa4XcTDd8YS35cWUZqt5xEORG8V63exxJEBI72jDc=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB4266.namprd04.prod.outlook.com (2603:10b6:5:98::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.18; Fri, 9 Apr 2021 05:15:35 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 05:15:35 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 17/21] dt-bindings: ipmi: Convert ASPEED KCS binding to
 schema
Thread-Topic: [PATCH v2 17/21] dt-bindings: ipmi: Convert ASPEED KCS binding
 to schema
Thread-Index: AQHXLP9fANAyEFKsV0+ijzR7TK+RYw==
Date: Fri, 9 Apr 2021 05:15:35 +0000
Message-ID: <YG/i9lSxxCMIzkRs@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-17-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-17-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32ff5040-92d4-4598-da2b-08d8fb1681ad
x-ms-traffictypediagnostic: DM6PR04MB4266:
x-microsoft-antispam-prvs: <DM6PR04MB42668EC4AB3E06603DD7F4B4C3739@DM6PR04MB4266.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +OHMim52lbiOLwdG/yosp2C76jOdTEQ94yHtNyAnVKM7JHrxBABkzei9GsaMpM0Kdffy1nX45+W0SsyHj6//4tmN0Ews9/wBVYdBP5HiYU6MCQOw8UjZSUXFlKTiRZMA3S1rLJrnpbh/gUnIkZ3H3UguW9EKLRMqdFwWRfZRCC7qtshpM9K2MfRhFJH2qdu7BOOk21f6cNBXYNyUtSUqImKsTvnIs+bZlZ5NI2fSQkHQ4Br/Ob86PJZKLBIw2FDFG44tyMrRcRp+Ni/PcnBQZQm09OGIA9NBRyFy0cnp6l4yztE81nbBiHGz0CV7nX9hPSHcpDxaunVIYUwnbtVjh1PeSQ03VLnDXLxn+UF91ZHPWVb6uI5dI1fLx2dWpqB6nZ0khKCPwbpwcCDPLPlTs3/snGeCY3MZ/0FCxzCCZi/0jFuc9RUJit1xLt9mNVQWKkYcphrjmxULQM0usvVqpBLoprEx60DMb5d2Theq42RIM42DeR01iGKtTHTjP+BPIMlAkpQq4R4Os7SeTRB1Vnc+KiimvKqdEumJqc67CeT6d2Q4LZgHu/3QqXmzWwZNDFbXvI4Z3slJG+0lLnEyfNTOuSo5+WFbc4ogW7ccZLU/xo12+/HkBCQrOvCwVehJBPqQFQZr77FgJISj91Xhj28bbKqoq/D51hU2Qk4Z4OXBQ1jnNFhH5wbsTegkPYm3L+vQlHGvHxkikIpFvSob/vqthv76n99AnF6oyGr5Yjo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(136003)(346002)(376002)(396003)(366004)(39860400002)(83380400001)(6916009)(4326008)(54906003)(38100700001)(316002)(9686003)(33716001)(966005)(6512007)(86362001)(7416002)(478600001)(26005)(186003)(76116006)(66476007)(66556008)(8936002)(66946007)(6506007)(6486002)(71200400001)(5660300002)(2906002)(8676002)(64756008)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?wlvCT1hp6J0Y0k53x9FI0DbIjOhTZ/Duo0RCRSExUbc/LlfCBjfC7awPCf3Z?=
 =?us-ascii?Q?V9qkHKL/AxH39s4grZW15V40F/Tj0ZKVr5VCHGk2fIoc/MmPRLpW4fbeY+2m?=
 =?us-ascii?Q?0OojUB98ly3kRDFm5plWD+LZEURTJcSe725I90O0R6Wvy2rZm26xfpYmzye7?=
 =?us-ascii?Q?7A2CXAUpKDDtTi2A4CZ1b7IgUDlM0c7RGZe63x6IHhmhUI1E2WtaMzVcqb7J?=
 =?us-ascii?Q?UU7FxVit9bG31P91E7yG1IFfgt4z4PrQ03EOUGz+yK0TJt6uOB5Y7foqlAzC?=
 =?us-ascii?Q?BsiWQsEZ5nsonm//FubI7Xv3uA2EN3tXKZ7sMHd5s/Sjk1YND0nrSIwsfWxq?=
 =?us-ascii?Q?BKm+z2+2UX8MzT9WwU8TRR95/0K8Cg/ChJLNLbhowQ7hFHXYd8kKPKJTAkVd?=
 =?us-ascii?Q?AK2cVK63+8G2uUScfGcAvWjTuZ5akyb0FoJ+LlxN+qU1bPHwUyrvmkAqZXCk?=
 =?us-ascii?Q?1WwieAlHTjfee/r2HkSZbzg14i4DbExZoxDxUxucOUiXkHZ7mqhkeAvl4ZuY?=
 =?us-ascii?Q?pnJUmMdt3Zw6WMSBFhFl7dk93wL/Ka8AOmvBiNoYCGimbCjZCfZ4LHJcnOlt?=
 =?us-ascii?Q?VCPMoY4SJ+ViS/CcwWwdw4xrdtOpweRv1L4jpWk7GUwXDIg8yt/o7EdC3NuZ?=
 =?us-ascii?Q?wkjnt030S0leTPpl7DKHS/e2d/3nQ5r9gV7CooAOP7qlJrYTVxaR7g38WVbe?=
 =?us-ascii?Q?QqTsKdTUMjVDRW0TgWMDj4muaQfx3kKQ/1NII0bJC08OaIdSGIMdglr9URwy?=
 =?us-ascii?Q?vruyA9An+3cRieLCTaGh7Ac9wwtzokerNuhlqzQecvaTG2ovZxzHYNqWJZ+3?=
 =?us-ascii?Q?/ELVDSkyR1d0w5Bn3sW3KBMbjjHB1xHZr5pI3EzrThzSCDX8aLFeq1O/oZWB?=
 =?us-ascii?Q?0c0iTQj/Iim1GSAaTNDBrBVcn1ubkH1Dgg3rLkHqdSuPq2p1+sZorqn4ovps?=
 =?us-ascii?Q?fC6fkNdWhozvugzmYTqaGzfc6s3XWNO1Qo6y0N10Fbpm0nwXGFJ73aw3deV7?=
 =?us-ascii?Q?PTKs8BeBm/AXWDUJztZcvxOGqARLyUBaZaEs4Dufoj7T4GjavzO0AGwWkePF?=
 =?us-ascii?Q?PLfH9R/K88+dDD4V7jrODNpPC/LRPTDuXMCWhMiqRs/1Mn7dWXf7X0jnh8ow?=
 =?us-ascii?Q?WWgMLkg2Jfz19iTBtow/XBDk9wuiXNseYWgxD/wlQ9t3Y+7Mg3HWpx6ox1ek?=
 =?us-ascii?Q?n9XVt+md7iNBWXyGwF2YZd9AIOG7gycqYnmoBXPFdkovYHZ77p2wDyPsET1u?=
 =?us-ascii?Q?uFXtXHx6IhCtlko1mKRBQgcUsRDB5kVYzeJOznUMd5SJDecOfHYQFEUducg5?=
 =?us-ascii?Q?bOHzMloQQKuWGyCDlgIJNBfH/R6rrnIlMR3lLUBql6sEUA=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2B442FA99D93824E94D4E74E8E8D404E@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ff5040-92d4-4598-da2b-08d8fb1681ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 05:15:35.5882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iLjU1PZkXSADIyH3M9HYnwjvrpaYE58YYZ2uHFR2SjOmBOFMK0TpuUckW85n+F4V3+FpFSQvo4zd6PB/gARzqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4266
X-Proofpoint-GUID: PSQjCzavJfCewycbbKKC3Rs2M_LAtyAD
X-Proofpoint-ORIG-GUID: PSQjCzavJfCewycbbKKC3Rs2M_LAtyAD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_03:2021-04-08,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=847
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104090038
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "chiawei_wang@aspeedtech.com" <chiawei_wang@aspeedtech.com>,
 "ryan_chen@aspeedtech.com" <ryan_chen@aspeedtech.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "minyard@acm.org" <minyard@acm.org>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "benjaminfair@google.com" <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 19, 2021 at 01:27:48AM CDT, Andrew Jeffery wrote:
>Given the deprecated binding, improve the ability to detect issues in
>the platform devicetrees. Further, a subsequent patch will introduce a
>new interrupts property for specifying SerIRQ behaviour, so convert
>before we do any further additions.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>---
> .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml | 92 +++++++++++++++++++
> .../bindings/ipmi/aspeed-kcs-bmc.txt          | 33 -------
> 2 files changed, 92 insertions(+), 33 deletions(-)
> create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-=
kcs-bmc.yaml
> delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.=
txt
>
>diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc=
.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
>new file mode 100644
>index 000000000000..697ca575454f
>--- /dev/null
>+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
>@@ -0,0 +1,92 @@
>+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>+%YAML 1.2
>+---
>+$id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml
>+$schema: http://devicetree.org/meta-schemas/core.yaml
>+
>+title: ASPEED BMC KCS Devices
>+
>+maintainers:
>+  - Andrew Jeffery <andrew@aj.id.au>
>+
>+description: |
>+  The Aspeed BMC SoCs typically use the Keyboard-Controller-Style (KCS)
>+  interfaces on the LPC bus for in-band IPMI communication with their hos=
t.
>+
>+properties:
>+  compatible:
>+    oneOf:
>+      - description: Channel ID derived from reg
>+        items:
>+          enum:
>+            - aspeed,ast2400-kcs-bmc-v2
>+            - aspeed,ast2500-kcs-bmc-v2
>+            - aspeed,ast2600-kcs-bmc

Should this have a "-v2" suffix?

>+
>+      - description: Old-style with explicit channel ID, no reg
>+        deprecated: true
>+        items:
>+          enum:
>+            - aspeed,ast2400-kcs-bmc
>+            - aspeed,ast2500-kcs-bmc
>+
>+  interrupts:
>+    maxItems: 1
>+
>+  reg:
>+    # maxItems: 3
>+    items:
>+      - description: IDR register
>+      - description: ODR register
>+      - description: STR register
>+
>+  aspeed,lpc-io-reg:
>+    $ref: '/schemas/types.yaml#/definitions/uint32-array'
>+    minItems: 1
>+    maxItems: 2
>+    description: |
>+      The host CPU LPC IO data and status addresses for the device. For m=
ost
>+      channels the status address is derived from the data address, but t=
he
>+      status address may be optionally provided.
>+
>+  kcs_chan:
>+    deprecated: true
>+    $ref: '/schemas/types.yaml#/definitions/uint32'
>+    description: The LPC channel number in the controller
>+
>+  kcs_addr:
>+    deprecated: true
>+    $ref: '/schemas/types.yaml#/definitions/uint32'
>+    description: The host CPU IO map address
>+
>+required:
>+  - compatible
>+  - interrupts
>+
>+additionalProperties: false
>+
>+allOf:
>+  - if:
>+      properties:
>+        compatible:
>+          contains:
>+            enum:
>+              - aspeed,ast2400-kcs-bmc
>+              - aspeed,ast2500-kcs-bmc
>+    then:
>+      required:
>+        - kcs_chan
>+        - kcs_addr
>+    else:
>+      required:
>+        - reg
>+        - aspeed,lpc-io-reg
>+
>+examples:
>+  - |
>+    kcs3: kcs@24 {
>+        compatible =3D "aspeed,ast2600-kcs-bmc";

And likewise here.

>+        reg =3D <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
>+        aspeed,lpc-io-reg =3D <0xca2>;
>+        interrupts =3D <8>;
>+    };
>diff --git a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt b/D=
ocumentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
>deleted file mode 100644
>index 193e71ca96b0..000000000000
>--- a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
>+++ /dev/null
>@@ -1,33 +0,0 @@
>-# Aspeed KCS (Keyboard Controller Style) IPMI interface
>-
>-The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs
>-(Baseboard Management Controllers) and the KCS interface can be
>-used to perform in-band IPMI communication with their host.
>-
>-## v1
>-Required properties:
>-- compatible : should be one of
>-    "aspeed,ast2400-kcs-bmc"
>-    "aspeed,ast2500-kcs-bmc"
>-- interrupts : interrupt generated by the controller
>-- kcs_chan : The LPC channel number in the controller
>-- kcs_addr : The host CPU IO map address
>-
>-## v2
>-Required properties:
>-- compatible : should be one of
>-    "aspeed,ast2400-kcs-bmc-v2"
>-    "aspeed,ast2500-kcs-bmc-v2"
>-- reg : The address and size of the IDR, ODR and STR registers
>-- interrupts : interrupt generated by the controller
>-- aspeed,lpc-io-reg : The host CPU LPC IO address for the device
>-
>-Example:
>-
>-    kcs3: kcs@24 {
>-        compatible =3D "aspeed,ast2500-kcs-bmc-v2";
>-        reg =3D <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
>-        aspeed,lpc-reg =3D <0xca2>;
>-        interrupts =3D <8>;
>-        status =3D "okay";
>-    };
>--=20
>2.27.0
>=
