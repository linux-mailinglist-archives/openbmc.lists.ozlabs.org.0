Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EE75EB7DE
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 04:43:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc3pm3j11z3bkQ
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 12:43:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=hZdQmXId;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=2269a7e675=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=hZdQmXId;
	dkim-atps=neutral
X-Greylist: delayed 3068 seconds by postgrey-1.36 at boromir; Tue, 27 Sep 2022 12:43:15 AEST
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc3pC38tPz2xy4;
	Tue, 27 Sep 2022 12:43:14 +1000 (AEST)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
	by mx0a-00268f01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QKx0jg022112;
	Tue, 27 Sep 2022 01:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=PVK+00F/fHK6zi0e9j8KP71Xhqecd+tFCPpdchEgLQE=;
 b=hZdQmXIdk0Pye+hnKquWxQwkXG6x9zAT4B0FYfd/AbLPuR+DfejBRXrsXT0c6841H/Wk
 yZX9BSBXFFRND8xfaRgVm1PYyLFO+ngyl16OSRoA+a9OG75W75VbqNy9y1bH/vfsNsGj
 6W+X+0w1/Ck9QPoq3CIIti7H+dcY1HOddm3zs76EifhZo15bso5nxGie5PGXQCIJOYUA
 KXWOCcCGHUpHEaSnTIyCIfQQQZJG6KzKJtFRRzGCJ43EeDfs2RdbNIekIZglgjipXJyh
 RnRzLJkC/1r84kFh1j8LuqzCgvb30csdVJ7y52n/djhQbE7msQg0A9G8M9g1ZhRXC6rp hg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3jukkernx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Sep 2022 01:51:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5/y8y+yZ2d22C2mqv7oVSu8cdGPukc1ffgEU7k97InSmeP47CWaqBNwn3+kdpABYS8wLnsRmtS0/hD06eiiebDSknDTPuWR6yovQQXAc23POLVj8hw1/bhSuyYzQuUtjtAmsuZNfCpoXPKW3kSs11QYLtHdzFlSoN1JU6LmIc4P8Jd8s2VxrwXJqnysWwZsl4Z4Y/q1ta8YVbtlDsqmdYdpQ3DYK0fgpkdHhfdthA4lu5zHfAcWvCCkeIxHm7Ll9YbXPvxNLSlqzO5+mbxsniTP8pOtJVJnube2+m2p9yQtYDUqqY4XJsRgeOJsbOHdk7GHYuyvmfRoBLrPB1IiHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVK+00F/fHK6zi0e9j8KP71Xhqecd+tFCPpdchEgLQE=;
 b=Gu4TlyWwNlM4O1MnYYEpzI1Q6jkV9BWbcgnEZYOS4Hji6gRWdNZaXnDvIfO4NeSFc/AaNVC4cm7eFSW7G5keQdKZJ3wuhD5U54wVTmn6fq0r28kaKf7AgmTAsjGvXDO1ce1wKpHJL7b0XmyjJOYv454HYFnjzFx86Qd/V6cT4SDflCg9ZDpW0+kI53jtod+8Y6yqIf850iiPMQmhqh6fiHuS8XZB1hNMowIApAghnOeZjpSnOIiSyTY8xQ99Q72Xr0Q/gYtB8E+ZxjRBgu0IuzRcu/3iR+BjSxAyj7/KDB6nQtFmhhIGHoMwHVOLFp+LZOuoZuP/XzUhhTz+0gNMiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by BY5PR04MB6550.namprd04.prod.outlook.com (2603:10b6:a03:1db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 01:51:31 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::4043:b584:ed2f:7b95]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::4043:b584:ed2f:7b95%4]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 01:51:31 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Subject: Re: [PATCH v5] ARM: dts: aspeed: Yosemite V2: Enable OCP debug card
Thread-Topic: [PATCH v5] ARM: dts: aspeed: Yosemite V2: Enable OCP debug card
Thread-Index: AQHY0hOqzhlbl775rEujDf7XROiYCA==
Date: Tue, 27 Sep 2022 01:51:31 +0000
Message-ID: <20220927015130.GG30806@packtop>
References: <20220926124313.GA8400@hcl-ThinkPad-T495>
In-Reply-To: <20220926124313.GA8400@hcl-ThinkPad-T495>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8007:EE_|BY5PR04MB6550:EE_
x-ms-office365-filtering-correlation-id: 8b04e200-c0b4-4074-5907-08daa02accfe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  tr6Y2tivMNaJAwiLTbsq0X5dm4iUycvAdHmj93Xb5OPOdeuVUK145IfwCoou+KPXx0e5oe2ONzC05kBSzT4hI76jVVKtS3TdXS+WyrGILqYKKgQAdg1NAT0Jz9Ib2pMfO1F7kITN9WsJDLlly1x2gRG9vT20igNqY/9E036Ziirh5WQ8i8OYsyYk7esSg9g0Nce9z+NolvNaU+AGMwF7RP2upmCO4a8P1CDhL3bBz+0W+2yK88WG1790hmJSaelb/646bydL9hca/us/+g8HwjdPVVNKw5m6vunRjhkuLn93r6dK0zNOcTOWSrOssBesSUc77a1NjjFX4XdH+Zr1FBp47690e6cPLLYZYO9/ZEyl0yHgVltErTlfjaG46vFdlYYxpMObXUTeA/NIaQxIvGRv+ng7hrRFwInHX5xqdHQC9cFzkcUADh1WqGLci+0YVF0DzCY2FsIlG68qlZwJyOCk+sQmOKY1g8UKhmQvueomb4oWieiai2qbwKtZx4fnIpO+fa0/fO9GswWc4b8zpnFijXf1Tz2+uxC8FvNt9+zHU0SienXDAsLYuFANAmrsbPRZeQkZ58OX6CRLBiMn8x7xPIFdxG5bXF0ZU1WsbFlGic+2Gvy/IzP9oLIn+AEhOjNb0Yn2U89rkdgQAAAG3f7NXMdi/YhLgkCWLIMwkxX+j4CetlKaNWz7yGWo2rmgVYKbYTxdSq6P7FqoE6ZjIPJTCm5jeR4CdxMxSq10lvVKK7RcM+sQYT34Nc57faSXjRKx6t+khkpnqC8oMsv9eA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199015)(33716001)(2906002)(4326008)(83380400001)(316002)(122000001)(38100700002)(64756008)(41300700001)(86362001)(6916009)(26005)(8936002)(66476007)(66946007)(8676002)(66446008)(66556008)(76116006)(54906003)(5660300002)(33656002)(1076003)(478600001)(9686003)(6512007)(6486002)(38070700005)(91956017)(186003)(71200400001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?8vvxCFWqQTgdxgWxpaq8mBSQWxI81QUqoUESv4Ff/lv2NGCSLfl/uTh5TcI/?=
 =?us-ascii?Q?RGxdYBUOXIQRGAwKaKfW/YA7Jv+mAagbLBZZEYvM3QvCkDvFKSCN4vVxVkw7?=
 =?us-ascii?Q?DdfZm3+WXkYlramopQnVCIkYqEmIrM4WK+rhVWF7qhZzgcOzDEyd1HdWf16j?=
 =?us-ascii?Q?Rs1FueVLnaFXNh+XESvSiGRBfPphuCyvQcPoTgWyxF/I/nUuKlkJESMyQRqe?=
 =?us-ascii?Q?qjSRwj9aRm7CwUHWvxSguqnzMXsl3dHTg/9EwZpC2SCS9Oq9zu/YN5YsJwSx?=
 =?us-ascii?Q?bptCW9nAJD/6KcuYMcfTKzd0SlGTkQ1dPwFOmflX8WkuCE0w30ud8vGUqBsW?=
 =?us-ascii?Q?oMy1BVMaUeg1hg0tasvl7E0tjCvFcLQAV6zzkyu8YrFgI9fzyySh+OH0xkcZ?=
 =?us-ascii?Q?ETxPMOTzaKp8ztMHVZ08nzDmGxA0stb0AoOZtOl3BqoGUu+pdikVWwbsYVno?=
 =?us-ascii?Q?TYcFjMssRjseRjeEl+xPmgE8vkiapT9Ks3mYImEh3gZES1lDWtEw4wjqq+1j?=
 =?us-ascii?Q?fqa4wnG5WsL6SOU4kZ/Ee0pnGzspHtrvGHz+C3F33ahmBcIdQ5AF/WaZku8q?=
 =?us-ascii?Q?kBiqdPORr05t7XKFuaRH+PNoPgyOHw0rHFL74M1z3G6aCjiitU3ubILJLLY5?=
 =?us-ascii?Q?4KGiiS9/ogKtYUchnDD+he2wjqXljY73jgFekjRRiajNZvucjYdwgU9tdKHV?=
 =?us-ascii?Q?3hmVgW4iUdLQQ8pmTPtDq8p1BDY5n74lZnKAyhJaeaDKaDZlqvk/yoybHNVN?=
 =?us-ascii?Q?9aTfO4WdbIrtGtpVVXIqeaMjgyp4eB+dZ6ZBXJ+J6yETiWHFC54OEV4Z87mz?=
 =?us-ascii?Q?YEns75qwhOa/r6wSbqejHT8XDW5V1TI3YPjUwWRRxuzBxAfUyS++J67KJxjM?=
 =?us-ascii?Q?zbmvi+O/JUQhLGYspwtapHW8jGP5WJlVF2NXdfNch8qOjmZ7LprTbSI0WQsp?=
 =?us-ascii?Q?cKyYfkEsz7XLN2yE8TBB4vm9q8H/oSqyz3aEOc5asZllRedYdXphmM8nQ4cZ?=
 =?us-ascii?Q?+e0vDzxItwjmgo2qklAGCGPrr2nxE4Ltx3ZenM2Tf61Ez2BGgteLrhCGzKG7?=
 =?us-ascii?Q?Lnr/uookVSSZUDns88nQNhWq00VJycDkoOFxpT16WtXLynVDL71ssYQb2IqK?=
 =?us-ascii?Q?GlA8zcjk+N9Dt/r92LQSRLTnyap2RYQP3NwEtEv9+WfHxt7prHXK0CgIf0XT?=
 =?us-ascii?Q?MTcwJ9rAiS2gcrm6mg+ne5pesTYyrjeXH59kPMixliVKcaGuZAAHl5Jil4gr?=
 =?us-ascii?Q?WLZ5sE2ypmTL/E4c4tk6NkpVOjLUkJ2VA4101oLR/ciAG0bgs1eKRdMKBYs5?=
 =?us-ascii?Q?rj3CRqiNvVdhpXaNIs5ZU1oYK48e2oz6pQ7xWba6j2m2ZEnMDQVJc3Q3T03h?=
 =?us-ascii?Q?9KkUno+EOVqInnTHGwe53qhJw2lEIBZK6/ol1XURgkMFKEms2hELtyecWT8P?=
 =?us-ascii?Q?KuRBUU2qTs0CeRirNuv7afR5l/Ggo7TWEzTjM2IExeRX+R7dbHIGdUWUkzP8?=
 =?us-ascii?Q?2K/tp+e69nreqDovVp/9mO9uFII780PeKSPcaJBnIgKNWoqShzltQLcb6Kx3?=
 =?us-ascii?Q?yTRjuPQigtU8dROhn90lx/xMNXpR8dvSU0BhMA++?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C94E632F4FEE6F45BE949DD6A33DE9C8@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b04e200-c0b4-4074-5907-08daa02accfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 01:51:31.4168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l4BOqZUNsbtJM2Q/A8Kxk/wvuuQKmJjwvI5BYyRrF93jWWT+8ShqtqhI2wc1Or8peLdfmCWfVaUahsCqRSnIsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6550
X-Proofpoint-ORIG-GUID: cVhZWHx9wK3T_6Sc3Z_5PxrLSeR8b3Ts
X-Proofpoint-GUID: cVhZWHx9wK3T_6Sc3Z_5PxrLSeR8b3Ts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_11,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209270009
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 26, 2022 at 05:43:13AM PDT, Karthikeyan Pasupathi wrote:
>Added IPMB-13 channel for Debug Card communication.
>which improves the readability of the machine and makes
>it easier to debug the server and it will display some
>pieces of information about the server like "system info",
>"Critical sensors" and "critical sel".
>
>---
>--- v5- Updated commit message
>--- v4- Resolved syntax error
>--- v3- Updated the title and commit
>--- v2- Updated the title
>--- v1- Initial draft
>---
>

Note that git treats a '---' line as a separator, so everything past the
first one above will be discarded when this patch is applied (e.g. via
'git am')...

>Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>

...including your S-O-B line here.

If you're aiming to do something like what Joel describes on his blog
(https://shenki.github.io/git-patch-workflow/), you should make sure put
your first '---' line and any non-commit-message notes *after* your
S-O-B and any other tags.

>---
> arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts | 11 +++++++++++
> 1 file changed, 11 insertions(+)
>
>diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arch/a=
rm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
>index 8864e9c312a8..84236df522dc 100644
>--- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
>+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
>@@ -215,6 +215,17 @@
> 	};
> };
>
>+&i2c13 {
>+	status =3D "okay";
>+	// Debug Card
>+	multi-master;
>+	ipmb13@10 {
>+		compatible =3D "ipmb-dev";
>+		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
>+		i2c-protocol;
>+	};
>+};
>+
> &pwm_tacho {
> 	status =3D "okay";
> 	//FSC
>--=20
>2.17.1
>=
