Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE01359839
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 10:47:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGsFm3WJ6z3bpW
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 18:47:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=ZE3D+P4J;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=5733813a0f=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=ZE3D+P4J; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGsFQ2pzsz2xYq;
 Fri,  9 Apr 2021 18:47:04 +1000 (AEST)
Received: from pps.filterd (m0165118.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1398bOPt032448; Fri, 9 Apr 2021 08:46:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by mx0a-00268f01.pphosted.com with ESMTP id 37t1u23er9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 08:46:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6M/8ryatV8iao+90s3IPjXi+wVzaskuD8rIOjrPilsnkfqCLJFfvHzAj862kbqYYmLoKxc0ZcZeOltHv72WoZ5Gx2+8UvlpNBHTIye+UqHG+o3tzC9fXO2HcKf5WV23l/UTqsEzOhLXifKPKG+UJwJswjfmPpqXqEU3cHga3FQAtzKrHi2kwNHB/W1RaJLKjRXp6zaAvs7IUgwI+iTewFRbst5GkJk5KFmKV2zXzA2TeaXl/e2H+OkIHc28ZnWqGLC9MXSUKnECN4C/C4w7rtixTBYHcq5OL6CC4MS9JL5cbDHw62abEVbu5ma/yKwRYd5h/2kYxsnirHDCZZtffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECL1mqiAm4FqsMWIHs2/+MCggk6RqmCsH0IKPsEzANw=;
 b=MGVE6bR8RyPGYpMY4tmG6DlMf52JutjrjtTeX1GeBnrbDurfHHo19qar/AZJpkHyKIt9VDHXJJNIGNIuuwh4GUxu8Y1X33WCD4xrvCl9wjrP8K2Ql3Et7GFkme+NV+BcP3tsnh7hyHI2qeaNSIHBi4V3cmXlT94wwetWyraT+TxotJDiqgFwmZuJFrZVzcF4BPjX1br82S53jNjZA8tso4VC4CHDC3kukwRxKM1avubz5napNip1xQLsYu7MbdumuvoC4Z0VCUNKrvxB2W6vNyS0HERr7UfeJ61QlAg/eC5xwpQ46jEA4A5omTmWdhR/3y2haLs01DcIr6ynckeTaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECL1mqiAm4FqsMWIHs2/+MCggk6RqmCsH0IKPsEzANw=;
 b=ZE3D+P4JnoB5E2bbQiq0jyJ6L2wWCZzmhLB16hFhKRKr/MXxqdnGFjnXwRISaVBQXmrLIHROfjw9mOQpnhW8+Y82jTMDECx2/7JIWyLujXmmcaBvi3CytiyZ5cznrYbYMFlnhZ1OjKNVP3o72MrMTOG6n8CD/Dv0YIdUf92jZ8U=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM5PR04MB0765.namprd04.prod.outlook.com (2603:10b6:3:f8::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17; Fri, 9 Apr 2021 08:46:38 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 08:46:38 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>, "g@packtop" <g@packtop>
Subject: Re: [PATCH v2 17/21] dt-bindings: ipmi: Convert ASPEED KCS binding to
 schema
Thread-Topic: [PATCH v2 17/21] dt-bindings: ipmi: Convert ASPEED KCS binding
 to schema
Thread-Index: AQHXLQNa/Br1rKNdC02YFyK1SqJv1Kqr362A
Date: Fri, 9 Apr 2021 08:46:38 +0000
Message-ID: <YHAUbTeoxRFBUjMi@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-17-andrew@aj.id.au> <YG/i9lSxxCMIzkRs@packtop>
 <29937129-3a17-4a32-a723-191b693a1e0c@www.fastmail.com>
 <YG/ppKEAs5EBUao3@packtop>
In-Reply-To: <YG/ppKEAs5EBUao3@packtop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3d99d31-110f-46e2-349d-08d8fb33fd35
x-ms-traffictypediagnostic: DM5PR04MB0765:
x-microsoft-antispam-prvs: <DM5PR04MB07658C21D9D86AEA1B2887A9C3739@DM5PR04MB0765.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7idMIY3i2UCSDF2JptTW5xoEbk1smmMf8B5f6ai6agQpdB2zLrqESAK+iD17uTLCx/F53EFfPeDm5fEGgOyFMS3wf4cHcEpm/0VCMqOC+8BsCt8qrQk2kcA5UIzMLjr5RTSYNVYaas22zOfqUGUt7BW4zZInnRBQOER0zKxbXVAIebpekFVbg3slvKos6gtBQ2UxOwccvgdVQqD7jzvy4eIzqS1bblrRdI21F3K6YgwndDZpWcUMukgDo1OWpd+2IRDBrziP1vKAv6NdcqaPBl9aj5f8uVp/E5kc3jW8ZLmbF6V8NdlSJaWMYGGI3Cj8mBZz0RooHAarGiclrl/Xh9WBW0xIUbHb4yc/33DXKGgfKKHseAO4VxG6vjW9rAsg9WgbGUyGMHKqEZJzI4xsF12uI1vtmQGKm1yPvZtcCKv/7S3tZBZUi/bOAlwtBBuvtmxY/cbWbSdxbJstgc371hZEU2aG1P4lJhHiognATZeCX0v0Ql81JWYl3PaKO91yrGJUC/d7NY6NIoX8222WjXliBdNdIHpRiG0hrnZv/qjbGq/7OL4s0DOKVhs+t499X2JQx6TRDEs28YZWi4hJFuqFhVUoEk+LQXYAU0UwpiQ//svvQ6FIR/Q1o8F0tPal5u3IgeAxQG/P1Fao+r5Vlxs/sFxWc8ZsM4dpwZsZfhWqRn9WTwQ+WvSp6Yy0ExpxCkoNRoW2TwAyQY8SRmrVNQmahyFfQJhy6gq6GxqO1t7grL2Sbtm+GAZ1IgoDC32o
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(376002)(39860400002)(346002)(136003)(366004)(396003)(54906003)(6506007)(66946007)(186003)(2906002)(5660300002)(316002)(76116006)(66446008)(66476007)(64756008)(86362001)(33716001)(8676002)(66556008)(8936002)(6486002)(7416002)(478600001)(966005)(6512007)(9686003)(4326008)(71200400001)(83380400001)(26005)(38100700001)(781001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?7ZxoGTa/NLqZt9FG1q+7o1CcYfWYWCdDucXj+Npl2ttO9roUQoobEpTNmAaD?=
 =?us-ascii?Q?yDOAxguZuhJlyvCY9yfSD5ne36wl2YiQK2bSIjSZkTAW0vjsmKsf2GvIFdHY?=
 =?us-ascii?Q?CX4OGrHK4zZeWv4g89XIb+5xGvz0eD7fvqWp+X7EZgVEn7EZ6myLwLyB/nEg?=
 =?us-ascii?Q?vAEx0eNDq5c29tko487MfdJjzES08TxM+zRaW06C4BbP/ejXNiE4K6Xu9axC?=
 =?us-ascii?Q?8TT54U61Zo//PysWIEJdDimph7eLofKrjN+5XH7QitMufbcp+14AvIujpbtz?=
 =?us-ascii?Q?QaNHu1i51HdCufLgdYJBPzaFn/Qx/j4RH6JRdJ7mEmnSNxYVWvJU36r0e4fV?=
 =?us-ascii?Q?ToJUruIWNwtzuCzX0s0agbYXc10ZBglz7z6mSLiyqNkyEXE1Hu1Ly8h/0O6p?=
 =?us-ascii?Q?4YTp1XjKQ1/glOVnWts41oV6oXi92wFx6T74AL/aFNWpqMvIDU30Et5EBpav?=
 =?us-ascii?Q?hqDOf8bnaQ0ee841Lxcl53YngSE2cs0CD303GvpJfjOoVwnFRX+cSCja3DLJ?=
 =?us-ascii?Q?jDNbF49jqW9QwTFTroHRiq4ajgOkei8Uc7p2MGyDx1LG2kWrrzlwSrMJl7g4?=
 =?us-ascii?Q?pyrRaL5CsDMDpILdphZz0nXGNkpua5EQlNc79r9XXVk4R0xxXY8SU2d85EUH?=
 =?us-ascii?Q?lK0Jkwq8FAiVJEuwGGapU1ZALDRlOH/jtyG+3QzvD47uqYajQOcF7fTOu5pL?=
 =?us-ascii?Q?ZiMDI1oTbQ+mSUt4n0TuFBflJftR3FfCS5zWpBl3Bm0vK5a6Ro1JGTLfupho?=
 =?us-ascii?Q?IU2gcsUXR6/wuSKtu5RcHpCI+VQyRs6yHzPzLK/aHmCIjT7qnPBGy6ntSlkS?=
 =?us-ascii?Q?JCd7pWo1eHXXhbjqEqxJbqUzEM4SPLoNUYP3T345zw7fpHsDxEsIMvplR2SP?=
 =?us-ascii?Q?qAchB6EnuIR0Dd5xIh0QaHelPjdFFd44gzV1L/SH8FnOVriV4U2GwCVze8pD?=
 =?us-ascii?Q?VO7H30JkcDp2ZVrkvgSFORBkghwRORGfscfsBeduWTbiG/DEh0PmNt/Z2NFK?=
 =?us-ascii?Q?gMa6Ww96UyEmZp2oFEYjWKG3lwAyItqYJcjfQuyn7QjXwZQmsiYlFthyRJhk?=
 =?us-ascii?Q?vJ1c4DQUqMaYHT9873VOc4KDITybKJ1y65bv8ATzCKKKR4Mul3dia0kfIvDA?=
 =?us-ascii?Q?9XWHaF0gJUGg5pylTph7vvpICNxY8RuivWc5musSYdiFlySlkuEY9p57G/pT?=
 =?us-ascii?Q?4w1kxYOlyxXcUbexh7uRmrIBfmIlROPzZMOhbQMPZB5lIzriioLG5F9cW2mE?=
 =?us-ascii?Q?3v7NE3MyF8jNu6DX6oJNtwE0IJtas377BkQSw026hVuHRinKRNWG/3xXRbVA?=
 =?us-ascii?Q?a+My1YYs4sN1Jx+YPcSWgAaO93a0myhfrWkqRSQPxIcGww=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2CE63F17A1E32544907C8F607C4FC4BE@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d99d31-110f-46e2-349d-08d8fb33fd35
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 08:46:38.1292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FOW1l4yBsp0C2oqWWAKI2bQ1zzQJPmwvUzrno07oP+0X/08IeplRQuV3XxRqu24oM7Sxaf/R91+xPYAadRC15A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0765
X-Proofpoint-ORIG-GUID: s46Yv14xlTe9gbJ8Og13FLJupGY7__pt
X-Proofpoint-GUID: s46Yv14xlTe9gbJ8Og13FLJupGY7__pt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_04:2021-04-09,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104090064
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Corey Minyard <minyard@acm.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, Lee Jones <lee.jones@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 09, 2021 at 12:44:04AM CDT, Zev Weiss wrote:
>On Fri, Apr 09, 2021 at 12:33:10AM CDT, Andrew Jeffery wrote:
>>
>>
>>On Fri, 9 Apr 2021, at 14:45, Zev Weiss wrote:
>>>On Fri, Mar 19, 2021 at 01:27:48AM CDT, Andrew Jeffery wrote:
>>>>Given the deprecated binding, improve the ability to detect issues in
>>>>the platform devicetrees. Further, a subsequent patch will introduce a
>>>>new interrupts property for specifying SerIRQ behaviour, so convert
>>>>before we do any further additions.
>>>>
>>>>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>>>---
>>>> .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml | 92 +++++++++++++++++++
>>>> .../bindings/ipmi/aspeed-kcs-bmc.txt          | 33 -------
>>>> 2 files changed, 92 insertions(+), 33 deletions(-)
>>>> create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast24=
00-kcs-bmc.yaml
>>>> delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-b=
mc.txt
>>>>
>>>>diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-=
bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.ya=
ml
>>>>new file mode 100644
>>>>index 000000000000..697ca575454f
>>>>--- /dev/null
>>>>+++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yam=
l
>>>>@@ -0,0 +1,92 @@
>>>>+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>+%YAML 1.2
>>>>+---
>>>>+$id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml
>>>>+$schema: http://devicetree.org/meta-schemas/core.yaml
>>>>+
>>>>+title: ASPEED BMC KCS Devices
>>>>+
>>>>+maintainers:
>>>>+  - Andrew Jeffery <andrew@aj.id.au>
>>>>+
>>>>+description: |
>>>>+  The Aspeed BMC SoCs typically use the Keyboard-Controller-Style (KCS=
)
>>>>+  interfaces on the LPC bus for in-band IPMI communication with their =
host.
>>>>+
>>>>+properties:
>>>>+  compatible:
>>>>+    oneOf:
>>>>+      - description: Channel ID derived from reg
>>>>+        items:
>>>>+          enum:
>>>>+            - aspeed,ast2400-kcs-bmc-v2
>>>>+            - aspeed,ast2500-kcs-bmc-v2
>>>>+            - aspeed,ast2600-kcs-bmc
>>>
>>>Should this have a "-v2" suffix?
>>
>>Well, that was kind of a matter of perspective. The 2600 compatible was
>>added after we'd done the v2 of the binding for the 2400 and 2500 so it
>>never needed correcting. But it is a case of "don't use the deprecated
>>properties with the 2600 compatible".
>>
>>I don't think a change is necessary?
>>
>
>It just looked inconsistent with the corresponding string in the
>ast_kcs_bmc_match[] table; perhaps that should be changed instead then?
>

...except I realize now I only saw the 2600 v2 string in the match table
because I put it there myself in the process of resolving a conflict
when applying your series to the openbmc dev-5.10 branch for testing
purposes.  So nevermind on this.

Reviewed-by: Zev Weiss <zweiss@equinix.com>
