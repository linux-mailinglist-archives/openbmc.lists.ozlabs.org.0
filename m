Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FE63594A6
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 07:34:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGmyy0yT9z3bTb
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 15:34:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=CYGS/5qg;
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
 header.s=selector2-equinixinc-onmicrosoft-com header.b=CYGS/5qg; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGmyN3bXHz3bTw;
 Fri,  9 Apr 2021 15:33:48 +1000 (AEST)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1395X0mo011396; Fri, 9 Apr 2021 05:33:32 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by mx0b-00268f01.pphosted.com with ESMTP id 37te8n8bda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 05:33:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOjPYcEXiLStxyJPuuc9sgPzimAq49qgU2XJA0DtaqHkTES6/sJFB5RvwCBkbMoGioZ0rIc9zxEI3SHF4m969yXBj34I4Vg/r3uqkrzRw70ZNFI+Tk+ZH+zBPoDsKNXshLEN6kkvRzDwGdYFMDPAX2UB6gPR+QDNYnlZ8RNK3CdxCTXfcgK6TWaD+YtnABTpeY0zLB66nAGKnCrHG9s0bOyWW9n5ac82CCWsBDpUyH8gPW9UXtCt+Zf2qIwkdETt5bilG26Sbr4WIb2EcImTa7ZQ/vbuBM0n5zyHtzWOy6hShQ01KpHo2guNsvTSDRIPbfZecAk9t7V+iqHQmtbACw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KY+9YAau+rjmlGM4/q3Erbwcj+oHxhLmMS9Hbihau/c=;
 b=btHDBjDPQvFkm3Zs5RrcMH/42B3hz5Tsh4DTPvyPCppxA8DlQt2NnJR4MwVfdTZqJ/RbtRLtLltBXbK5YHTp1tQDhj0eOhEvcZm6HGULwCpqbz5YbPWylzHZIAnyy0lnamhyT027IyMqFCJnd/KQGLYlbRbayUb7FKcheCXtfSzofM2TBhrX5lVI0k2vUTt4hlxvXqFOJzebfATKvFmTAdYsUa0ohGwWc5R67D3oR9ORetCKaX7TPu1EanAQu0MxoEMbtvgHo6eFT+5rquRBu2d2lpAY69ly5jxbl3sPdRP+plgyp6c/3549qK8K5mSGOogvL1ItbVuVIe67DT/0+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KY+9YAau+rjmlGM4/q3Erbwcj+oHxhLmMS9Hbihau/c=;
 b=CYGS/5qgn50UHtkAJ2/rGEOlS7jrMCjDTfMEHJVq6oGyscB21IzXlZW7EV4tdkjVBgjEVHifee/Zb1K8JLdeR4LxNmvRi13F1DNn810m6Dgxh0HcI9OfvdA2HDiOyPp9dJ7ezGh7tPjaH4R5K5T5mte7e5E/pEY3S+DXt9wa4DA=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM5PR04MB1036.namprd04.prod.outlook.com (2603:10b6:4:45::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.20; Fri, 9 Apr 2021 05:33:30 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.4020.017; Fri, 9 Apr 2021
 05:33:30 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 08/21] ipmi: kcs_bmc: Rename {read, write}_{status,
 data}() functions
Thread-Topic: [PATCH v2 08/21] ipmi: kcs_bmc: Rename {read, write}_{status,
 data}() functions
Thread-Index: AQHXLQHfhQcZKv4KL0KQbMZEFBargw==
Date: Fri, 9 Apr 2021 05:33:30 +0000
Message-ID: <YG/nKd3ERFYPoLhZ@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-8-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-8-andrew@aj.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a618276e-40f2-4533-b208-08d8fb190238
x-ms-traffictypediagnostic: DM5PR04MB1036:
x-microsoft-antispam-prvs: <DM5PR04MB1036F368E88358601A2EA207C3739@DM5PR04MB1036.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U6bgrTQYZL4aOGP/YZenswezh8nPXkWlgGQOO9TWrW6ifCOZ+dKTPv8TPpsL3aB8UoZQyNM/my6SDBEQH7RaE888EhSRd2ZcqeObm6TIpPDV1VsiUh4M6zxxTjso6H/G8LaZiytnhGApzQePNvimejcvJAa/K+F/AojAlT6IOQysKrc1+43h4LgGFOqK4DEozP7PQLjhdvE7bAwv3QuVfBGwE2dpy9KBQVl9SEhOfMPmCoPQo4Wt7K2X+9e3rc1TeVq7fd6fZ38q5qBEOqRmIOBqIfv+dfhBNSUMcJSWFt6xxdSajBLBFapnBoZmqx+Rdgb5AlxdHVp3Lm6fqYCvAEZY5yVI196sLbWFM1rUQcZXjCeOmbXDTz8o0N7YMYI2yVNSodxw1Z6R+7uvBnSsd8EKrUhksLpKD1lsBIgS+Qb0FoTK0J10EeFtQXycJHTnyzCFJDE44sr1l9M0lM75ODcvHc4xr3ngdlB2gYFylzlqCvBSv2ISChWrqTCQTYbSM5VR5YWPOp+vITGRri0nDuuedr2m230V1cpri19DPfdu7dkZtF5KsQh6Y8kq9w/w64pAlYRNmXt4pPVlhhJI75etlqg4iaI3GBk+7KH86NkVLPweJibPPQfRGvzWhMw5fKMjx2l7TG46nL9RWOLnEeFa33HDpEoYycb9VO+QMFY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(136003)(346002)(396003)(366004)(376002)(39860400002)(71200400001)(6506007)(26005)(2906002)(186003)(9686003)(4326008)(6486002)(6512007)(8936002)(558084003)(76116006)(66476007)(6916009)(316002)(66556008)(5660300002)(8676002)(66946007)(64756008)(54906003)(86362001)(66446008)(38100700001)(33716001)(478600001)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?8CED1pjcWvcEDmYvDpc2xkLoQIBhELa2EM7NAhRFtsM2rPBWZLicHmzycKz0?=
 =?us-ascii?Q?u78eSWdpQBqt3eHlv9bTc5llQiNrqSGWf3q6r1KR+5KOuugDY4OgSzmF9ap7?=
 =?us-ascii?Q?BBeAYGQbT1wmDuWOMuOXpkDuIJjpltx2LjIjd6k5X/bWjpajI0sAvVht+A31?=
 =?us-ascii?Q?eKztt+HVSebDwMIInKTbSnU0CxZ6MhKvaXHUbZHyJG9KtkJMjyoFHvdIZaxh?=
 =?us-ascii?Q?gmVi6YGZuJTD6S9OVOGZ6EUXb6K93bITJfeAKIfHdAhD+yW7O4PNKMp7R1jt?=
 =?us-ascii?Q?/zHLeUmPzkzKVxZERtapzzkHjuaJ4F4IM4jOAMb/Ed86wPJWIA+yFDa/s7Ec?=
 =?us-ascii?Q?dZgCQsFxzfx77yYHmVvpK7DD7uNMG7u2eE1l/kDyCeAF4rgmYWod2O6WMqXK?=
 =?us-ascii?Q?qjPp6QtWrdZCj2hpRn3G0Q4cvuB9FgkjvUfUzkhnxZeoZ2IYMpntxBwXVh0N?=
 =?us-ascii?Q?umcwHdAbhMTKqT42zyjYc5dfpF6jVjYlYFENd48eRVzeEdywOSav5uUUkfkV?=
 =?us-ascii?Q?6mffvNhlkhu5hSC/36mugbaCO9w2qsK0BFV2w7ipoL0jyVK/CtxPQDdUx/zx?=
 =?us-ascii?Q?9JGMz6gohojmuRCzju8mTA/u2WRk0/3VTpleAyBiBUkCwrpOum6MXglh+rto?=
 =?us-ascii?Q?m0fw2LA3tfCed6DHJIDcrI/2b3V5GED2D9Q6oQRphFmzTFQ8bocVUiv0IsqR?=
 =?us-ascii?Q?RdK6O53EfYUW7goZHVoF6EoZHLY6IiYK4INcemqTMxML+wUivqO83fd37kV4?=
 =?us-ascii?Q?JFpbQXMmWsveZZcUlOUg5ObFPWvOmQQw78lW3VIKIjvVd4bh9IayDspolMN7?=
 =?us-ascii?Q?O4OgViODpDxXdhPckrsPlZAo3UOerDau4w6EcMIV38U1bzQIkO7cHJWbUDoC?=
 =?us-ascii?Q?Qxx8Eg1FL3k3ORyuk4MtZwhqqxCAeUM0y7OlnMQeEovyOsw2zfeIVUsF6X+n?=
 =?us-ascii?Q?ISzDp0p1uw2svvOHcJFuPo3L6uDU47eg9Xra0E2zMlaZ222L6TelKTxrQdTh?=
 =?us-ascii?Q?Ul/FPm0rTpRSpUZJ3Qg9/iNHychq6ripmqY78zABSCeAKWfU5bXSk6f4Ptf3?=
 =?us-ascii?Q?Em6ElrxR/wyhUYD7lQeu6W8DFoVnp+9x6i8QQC7FJdADCaWM6bidue1XQK0I?=
 =?us-ascii?Q?2B0l5NYkugeN356LjVTG81drLY1rD24qHjDUvb83D9NP405/Kqkv+DylQkff?=
 =?us-ascii?Q?XLexY+OuLTuEEXWHJ4abCSTtYzstz2zGBN1cMxUHHpFSn7VY0oBHbE0air8f?=
 =?us-ascii?Q?E6ciljKoRwyanitCnZsx4RSUYV5rJvNNNtCJFkt5sPme1FQ36vEyj6oOO1j0?=
 =?us-ascii?Q?JSn4VcMzJpyV0LZ/eGrjUp40e8s0ScSjJ6f5xSdghJp7Mw=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <202975FCCD186C458FEC884AEE7E8215@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a618276e-40f2-4533-b208-08d8fb190238
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 05:33:30.1989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FtGdBvJIumOalsgmAK8Zp5u3wDxnls3qb+j1nUr4FQEGjH8WQ9qPw4IbrSqAXgFDGhK739thqkPnp7SNvgSeJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1036
X-Proofpoint-GUID: GlYcPpq7r6dlbVWKcuq3dlkp2_MAqEZi
X-Proofpoint-ORIG-GUID: GlYcPpq7r6dlbVWKcuq3dlkp2_MAqEZi
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_03:2021-04-08,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 mlxlogscore=819 clxscore=1015 priorityscore=1501
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

On Fri, Mar 19, 2021 at 01:27:39AM CDT, Andrew Jeffery wrote:
>Rename the functions in preparation for separating the IPMI chardev out
>from the KCS BMC core.
>
>Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Zev Weiss <zweiss@equinix.com>
