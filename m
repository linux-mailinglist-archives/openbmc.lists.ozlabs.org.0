Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7EA3594CD
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 07:41:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGn6n2L5sz3bSy
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 15:41:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=iCbd8IZb;
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
 header.s=selector2-equinixinc-onmicrosoft-com header.b=iCbd8IZb; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGn6F042hz3bTn;
 Fri,  9 Apr 2021 15:40:36 +1000 (AEST)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1395XX8a017230; Fri, 9 Apr 2021 05:40:08 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by mx0a-00268f01.pphosted.com with ESMTP id 37t8pf1c4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 05:40:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGcBFysM8hEWateRzO/PbDnPSYFo6AnQv1QkxH5ctjCms2h71hLJRKCSLrPTGUiCOT4IagZvKnrahax7YLoo38G/DEgvsqfVjJaiiXEEvyuvK/y/K+b23lSeCggicoLeKXky+r+yamCUqsnHqvWDmbnvIVa6MktFv5hRnxrNKHd6yJN8U03pWLTw3ilSzLVETcorERX5d6snZ1Vdj9fiO2S6rQJrtQXt/+sL0vrCZ9rNrA0a9OfPMuN8xVr6U4PvzWtBD8tLVj8UXx8zSHdIuHX0xI3t2DpzBSJQDya2cVJf9zce7jq5ol55khZBCJWmy41Dqc1/XPdesVBwQ8lWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwF0PXHvnKbMGAQs213iPHi1mM+9f3XVtCVAM7hrpyI=;
 b=MG0hkS88/n39RQS7vs9Qszz7xSjmZhMbnFQ659fYRqUPRabSpCqOc707Snc1XNStucxeCVLWm7pfRwHLfjZ5f/3qEYJj5REhfExr8xrNUyq1qOeKTa4SyddECSPDZ/rn8GVCh6NSjxl1CI8ILLU6Olj5gI5Wjjl24DWyXJtafAeDqRfyLq4mfC3b1EyKupy0BbPnGU1b5+4a/JtZdcRg5kVR0lEdl81ltF5jVisRYJl6YVIzT9HSgyoCTBANDI+siIIA+LWJUxgOL0lHmiF8h1qX9TgKaLLC3Wx13rRUV9J0jcrkhalyXrDNou+d8JFqA4lQfncFbF+WgXGYXbbFdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwF0PXHvnKbMGAQs213iPHi1mM+9f3XVtCVAM7hrpyI=;
 b=iCbd8IZbApc5lt73soAvetcYIgIEyygaAv9SEIuGxAc2r7Dg/tZjdwN2aNaJM9RhovpWvc12zxRgKzq73ko2x85U6gX4s13jt2nMVDcmyJB0MnLP1xyCk2Bquhf9j6jRyh4Ebfx12/WfSP/T1kIrftFAu/DaLAVa9a6yKhrrJh4=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB6428.namprd04.prod.outlook.com (2603:10b6:5:1e1::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.18; Fri, 9 Apr 2021 05:40:06 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 05:40:06 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 20/21] ipmi: kcs_bmc_aspeed: Fix IBFIE typo from
 datasheet
Thread-Topic: [PATCH v2 20/21] ipmi: kcs_bmc_aspeed: Fix IBFIE typo from
 datasheet
Thread-Index: AQHXLQLLVPEmXeRF2kWhLB2fQs7OrQ==
Date: Fri, 9 Apr 2021 05:40:06 +0000
Message-ID: <YG/otW6XwZFT6fPy@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-20-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-20-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46095030-31b2-41e4-70d1-08d8fb19ee50
x-ms-traffictypediagnostic: DM6PR04MB6428:
x-microsoft-antispam-prvs: <DM6PR04MB642826F9A0FC89577B56FD83C3739@DM6PR04MB6428.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xoaQ4Q/ZSxX2ZF7YNCOp5elxpiydzf5En5WUCpj/uA4HErlW2kaAPFlxDkK/GXZCodwLQRBiZE4YADlglXmR9aqYU+R3ERIaFtwtgh90WmsfbvB9XDgOvl9lkGaq2pj6tlZsoX7CYGpJvMDi5lVz66GzvmrOrBZwc3YUB4KO7b3YDEGtiCYcnMdZ2RQfxGP79OSteUKbRfmNGtJN22CjgufsUnRvSohGWGMHP9ck3rf00XVUYQyhil5eisRQLlo/876cw/yqtCZDx2O/35Z4r5dp3FXpbuzCkNCu/s846KtO73RoJakyjWhNLHzF5nl8lBX0KpipurJvp9Lxpi5YpeA1F+kpUcGWPb3zXqYM3QwJt48HtTbixLtxLTmBgioXNIQ5jCJrXdT79Nk07N/TrLBLeDG/hWUa2pxf2arZJQlJqmqlUrapOUXrmtu6sSijcrlp/2IbtiXI/XXY5pcAdcYgM52EZTxiCmIpYMRaaC8O18Q8UrCscj7VKypbupRwd3xE1Ivoe80AA1nlnRv7YUsA0+hmbNP6zLZOvKFB/yDj6jjdIzAw++HZnx1Jdw4Ddi0ncCq+ak7ZdbS/xwk83fMmABJOWwBtKgtF6S2Q4Lj6Qk7MqWOH6YvirGBJLOhvO/x9NP3/88v8WBAaxRgRUUzNysVHlew/AGVU6/RkROs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(26005)(6512007)(5660300002)(186003)(6916009)(6506007)(71200400001)(66446008)(86362001)(66556008)(2906002)(7416002)(64756008)(66946007)(316002)(76116006)(33716001)(6486002)(9686003)(66476007)(478600001)(4326008)(8936002)(54906003)(8676002)(558084003)(38100700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?1NNQb0aqf6C/SvvlYAEi9pALH/F1fT51PUblxmffxjdR0laKAYoOJX0qtVve?=
 =?us-ascii?Q?j4Rw+OUKUSNUPhks9clibqsFYc8pR4T8oC/2l5kbw8l1x6lLGNOZsf0YGe9F?=
 =?us-ascii?Q?rnJW2EBe3waYgLKfKZMCvRqH1KuW/pIuLW3kLim4qIp+8zJxp8kyizs2BCko?=
 =?us-ascii?Q?Osrh1cx4rX5ImWjzjNhkxJyoIZXH0bBmPW4+t4kRy+TKMFTYSo1l7pgbjYBf?=
 =?us-ascii?Q?0LvOiD7C3HL/hAOoFALMCzqor8d06aAdi9pnK/+JaAKh6FzOd3HW+DW6bQwt?=
 =?us-ascii?Q?vkc47H92QjfscfCtJ0uL2+dElPJcITDNpX3Y9R48dxNUZ9owE3/LJeaC8iTQ?=
 =?us-ascii?Q?BLsU9GePHLjMB6fg9EPfGslSXG2eRyVIdnr58D3d7dMZvge8X0yVBA5OG2lK?=
 =?us-ascii?Q?FBlmTwhhMeYjaAtFvK4LbhE6b/aVl+Vg5uR+5xS2usmhKtbL2vbogcZWbF+0?=
 =?us-ascii?Q?nDMTC65ogpQxf1s3slVLQ7HPCL38sGzbQ8EQXZ8H1torh9QEu6pSn3YBzbI1?=
 =?us-ascii?Q?htOgL4bkAH+Pjeq/rGBuiVsRXrPUY9B2NQou2Fv2EtSBeBKq4qLIpQZrBFxl?=
 =?us-ascii?Q?jEL8S4bstMJN6r7cRolcGqAvat3psj5z+6j4s12WS1PDxmorfLMFY7Lpsr1k?=
 =?us-ascii?Q?l8AaEZtjkkQLrAdgHQWPFeyyWXliEOwyT9TfHBUjFjbh8qyR94sKF8hVA0gy?=
 =?us-ascii?Q?mZl22Q6U/a7x4JAfIoR6ZyCqF6JazRpUU1Orbq4uvOeYLsmdMaYgx6+qQJEN?=
 =?us-ascii?Q?YlgwE2I+hyTBdAusi4T+cB5IxzRtQ7Hi2djbBMaAdqFMK64AUSc42s/6Qopn?=
 =?us-ascii?Q?kDjFrGFHOSXs3O2g95f6THkJMF7VwogCqZ1PONs83odlAkCA5madkM/ouyNB?=
 =?us-ascii?Q?kPgwbImVYB8CG3EFaz54MVtTIe+w0kiEbGNIzdZKus7blRyef0M6GFggtxYT?=
 =?us-ascii?Q?yjY7pNXzMvjuIMIiz2wgksuv7tril6ScfzMTwt/sowrmnvzAOrKMQXPapE1y?=
 =?us-ascii?Q?bRwcYdO6/7AJtZIeU8+kvmdRCZE5Ue/PVg5jIAaR1IP44ILVwXi+ngqZylzI?=
 =?us-ascii?Q?As7TFE+rEshKhxzuMZnEawFerjPwtHRQUGr8T3y7r+eOhysYxTFujM9xZM7B?=
 =?us-ascii?Q?tPCmD7URhtPj1jE7a+0E8WTH5Mw3C7tZ4y57AlS/qxTPAFMU5krjXt/7i3iN?=
 =?us-ascii?Q?KF/EXvrlaQDUI5X8uT4AeHxppdd2dR1zrr9B8rdGIzyfgbDkhMq+W3F6tKCD?=
 =?us-ascii?Q?Kid1GO54CG0qvzdlsWwBTsnMNsDlyWUrLAFQl7El7Gh7EHZ+p15FN7q76+FK?=
 =?us-ascii?Q?Ypjxz4eqnh5jnFgYXPnFn5ALIEszEyfDFh24WGeYgjDLjA=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7C004BC1A1D7F942BE25F8B30FCE28F9@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46095030-31b2-41e4-70d1-08d8fb19ee50
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 05:40:06.3068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7X/ntuX39f2nLPd6CGJhEhRdanMrZ6YOBjT0IQLmoA1DujGMoSxVEtqN3J1c50ZZ7Y0quMkilMLFaaLT2oFOjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6428
X-Proofpoint-GUID: ZEuDvwPHhsa97t_DQojy5twMiqQfJ9JD
X-Proofpoint-ORIG-GUID: ZEuDvwPHhsa97t_DQojy5twMiqQfJ9JD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_03:2021-04-08,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=728 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090041
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

On Fri, Mar 19, 2021 at 01:27:51AM CDT, Andrew Jeffery wrote:
>Input Buffer Full Interrupt Enable (IBFIE) is typoed as IBFIF for some
>registers in the datasheet. Fix the driver to use the sensible acronym.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Zev Weiss <zweiss@equinix.com>
