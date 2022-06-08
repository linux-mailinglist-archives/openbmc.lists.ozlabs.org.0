Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 346B8542CFD
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 12:18:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJ38P36Zfz3bm2
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 20:18:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=JK1/cEdh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=9158c48c14=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=JK1/cEdh;
	dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJ37t1HGZz2ypV
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 20:17:41 +1000 (AEST)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
	by mx0b-00268f01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2585b5hk000943;
	Wed, 8 Jun 2022 10:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=8EgNJNYdyvCBnSmS8mFqr/WTO2BMVPGQAtZ8Aqh3yNA=;
 b=JK1/cEdha5VwJOBs13NNQud3abPZcoOsDxB5jFrkcGVPTNNJez4CCEtcUOdhz25ZmPL9
 Iv29iLhomL+TEKBy9sRLw2Os5NPCUCWRkmisBqsLrnmXdFUiBo8iGof2VQdnloIv71UY
 f5Ygl2qlJ/OLkZpKVSjYFS0D+KFD/tmnS6nQ54rMR0PnfRucxYRLTZYidoTW6WxWRuVw
 nBYbt+xSEe/N6qgYHqfsrtJEK4GQSTQNl7EIn5RzppWGhG2jThUTRcOpPDQI5V01uYH3
 US9apby4DmQeUm4xckeFVubj2SVFY9G8SZbYMhZ5ft48w2umMF2RlWA57Ii7G93Cj4Rz fg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3gjnsd8r0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jun 2022 10:17:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NelrMgI7DPwBt0K87He3KA6WRrRJHayaWpprXUBLF12bJnltMFIfrtjrzMd+P56m6+c5WfsZs/JOBGtje9hkw8nJS0FEi2USQ0/bU4iFz8zT6+vH+jDkDIkwgHOXXdeJ9h6HHLDcc5ME7HnNwhs60dXiY66+xSMcynIzBoj5F8pZKxupUiGTYbVOp1M1TL/eofZwK2V9LsYU4fElcCkM1WOZ4ZlHx5YM8C5B1nTuFcmPbaHeW6/5eBMCMx62PABd2/+w2LH5YxAH0k1hPCKQWAIfT1jgyik3ZbnnzsoAWxPXBBmTMdYLRMAVFDgNIz6S52RYnuOxfeF+PoM7cy96MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EgNJNYdyvCBnSmS8mFqr/WTO2BMVPGQAtZ8Aqh3yNA=;
 b=oT8TCoF/Dzx3emUzcHGpl8sdbyr679MwYOrJ+Se3k7jDqzDuWyyqRv4yhN3KW9heZ0z422GaWTqObJcHWfdrbMXv4aEvYfZXEz/j1Y25y+8ow/edkFe+lTMHoS0n9yjqShA0pEpC98zQIALhnUygToKN6OHNiX+B9wtXH7jlfuJGRTCabuErBBw0ZDe9TfvCwJzBlWHg2dJmzaWi8XKv8glNMyuLDKhxtEJ66tHwksdeG0o4la7/swE5ajdQbjOhu4CdFd0x4F08B/j1M2w+feV70cNZ8k8lGd1dy0Rm6LtCmjCgi5DDgKfbtcw+Wuuh6a+oh4n+Puvbu7kdc4Da7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7863.namprd04.prod.outlook.com (2603:10b6:8:34::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Wed, 8 Jun
 2022 10:17:28 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::3cb6:207c:de36:12f5]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::3cb6:207c:de36:12f5%6]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 10:17:28 +0000
From: Zev Weiss <zweiss@equinix.com>
To: =?iso-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add a palmetto board (AST2400)
Thread-Topic: [PATCH v2] ARM: dts: aspeed: Add a palmetto board (AST2400)
Thread-Index: AQHYeyD00zlY1fd3OUqFfq+le18Eyw==
Date: Wed, 8 Jun 2022 10:17:28 +0000
Message-ID: <20220608101727.GR11809@packtop>
References: <20220608082221.460166-1-clg@kaod.org>
In-Reply-To: <20220608082221.460166-1-clg@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27f03bcd-8287-454b-11aa-08da4938174d
x-ms-traffictypediagnostic: DM8PR04MB7863:EE_
x-microsoft-antispam-prvs:  <DM8PR04MB78638FB7CDA5EB112753C811C3A49@DM8PR04MB7863.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  giEdEq/wTLXjhwCoZN04ot3bfUyc68hlkY9djs2jb564Pu4mZzzlLOHD/C6DFpfvaxlxmrus5ML4XMWaXrcUDg0EE3NXrBEYB1r7t0nAQWpMpCUSSXJ8fApZwoctlMB7+lzeNIggq8iA+ZTNSTBKkrHZm1ToQ/n0hiJMpn7HdXLTHp8/i/NejV1VpgQIZNDEdKwLbZtiArXnDaVI0feSepeIgAvgpnI7IhXdZ/TdubcQgEJslTrzJgA+GM0Ink+Y3dsL18WyeVfvVMfDb+33PX5KRzUXE8YhQ7+GirulmiQkozXa9ax+fSCDpYaD3sFkBAkbTTKJ9GiyH3b3pckl3+CPuWweodaFuhr3ducPhUqz/MRGXWVKSbDSU6tWVGpgUu8UtGmNJJH8CbELuZvTcE9VXMMzTTo9g43Gg+gD0eP+AxjgnGOoJm1qpEHxzIVmAip677K6jt3rxSN9H15YDEq94YsdOneRhbeUB96lXuVdSTtJDGtyLSOHhIsPmlfMwl+GVIZNCW8nW0zsEz+TGC7fLzcDerP7K/ZIcFqaomdpM7ICrsVsAhfMhARk4MQzdxbe1TRlpqI9E8ZeZeW22N4lPzu9nvQ/SaJF/MSJYeWK2fYFAvXNO8laGYxp47ZX6AdrUzN2Uppezoee56WHmWk7x9VMIxKXx9blzCW9gq1o8apUJsuun3R/bnXCZsZfDQF7UcB63maxz7+wbMLkow==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(86362001)(1076003)(186003)(316002)(6506007)(6916009)(54906003)(9686003)(6512007)(26005)(4326008)(508600001)(122000001)(33656002)(8676002)(5660300002)(66556008)(38070700005)(91956017)(66946007)(66476007)(76116006)(71200400001)(33716001)(83380400001)(8936002)(64756008)(6486002)(66446008)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?ExaLFkMmB/qt8ew7CE6gLmyd9AkIOUyTVcv67djz8KA2k6iBnG61AP7mVa?=
 =?iso-8859-1?Q?si537yySUBP6GQzOvOHq8Gz2H4g843PKrMb7kjP8O+bggIgUiudjBfDEdx?=
 =?iso-8859-1?Q?ti3ii9Ybn0zFSLeC1Luw3G8r4XP26MQLXEde/ilGzLN6VYDZ/OextEUovs?=
 =?iso-8859-1?Q?FQ+oLwJvI/vLF6OBdWDVHc1mE9v4jPQEvVAYzy7sGGayxTPoxGM2kMLwVf?=
 =?iso-8859-1?Q?sdHzdVQR65KpTsciFCa8IMrFlXUlySbQ8LWqFtpWLYIC1AKy0HDwRWuFKp?=
 =?iso-8859-1?Q?IZmo963ZQNg8aFQ7v12xYjelwIrptg9ntNrczPBv3WS7RHcaSxhqVX5z6I?=
 =?iso-8859-1?Q?piuHNTK7vgSeP9ZcW5LCa4+qDEYmKzCenvslgdj/t0MpKFSxP8cFCjfZH4?=
 =?iso-8859-1?Q?YYxhqts1jZMUaBJNmf0WJZQ+q4szDwY2/AzkCGb9te6jDAytowFZFxrwQv?=
 =?iso-8859-1?Q?72FYQ8p9etnCMPbKp9DpMzIL08qXw0tuKg4gbMY3AC7eX0N36ziYlcCKXv?=
 =?iso-8859-1?Q?f5GLc1e5ide2xDc0egMkoSmKA2BXzVEnUHhh/G4O0NPr70NxxmsYhINTNl?=
 =?iso-8859-1?Q?2XntLIduPasAQlkObT1ewMygWSLVGRVMR3wogTnfDTq6zCg7BEEFEc3X68?=
 =?iso-8859-1?Q?1MvgUGSeXlJqB+iZ8tLlL5/MpZp+2G98pEoAqjkgClORHg+eQm/b5e77v+?=
 =?iso-8859-1?Q?QI7YV4g1vzQ+I5FOYy9pwv0+bQOh203zl29fvBIl/+fRr1to9tKFt0xWDp?=
 =?iso-8859-1?Q?mU+t6+/+7OU/67pNYstL2ptQAR8VCDvahUtbiCb0io5DpuKSGC7KCvJv/J?=
 =?iso-8859-1?Q?LfOxpDcwsDwNkCaXKod0nrl8dsTKnee4GP7OdVpVHoWjXQtp9oGvUsdGac?=
 =?iso-8859-1?Q?G7aOeckYdPRLt7qb8bnVl2fepiuWavjG/Gzsejo1abD7e/tDYFy7GVphGY?=
 =?iso-8859-1?Q?c/dPmfO4gSK3Ak0y0lOUA+NqGMMwkXpv8E4NLVNYb5dJ0pWxq8fgOoCp71?=
 =?iso-8859-1?Q?G41Ugn3P8v5Blga0uN4qa7P3WQJAxMMRWeunoic49qOGnvKPva4ZlHn5vh?=
 =?iso-8859-1?Q?/m+jsr0DVii/KJoVk7uyPNtVVm52SdvFjFndeiyGUuaGLsBHQXlpNMJ2lo?=
 =?iso-8859-1?Q?pegBVvhrwYRVyoQOpPw8CF8XbslgcbtYj5iRCz12PIKaDP+MrhWDeZcVas?=
 =?iso-8859-1?Q?jDUtQyY2cO/tsYAmrH+Hk+LcMf5dkI39UdcfrYfoHBk7QYe8R0VnZW/ZNs?=
 =?iso-8859-1?Q?Dsq4RygmOvRLpQx6i57jwOkIJO/btYH7SQQpPRKvfo78H7NKULheSQXXe3?=
 =?iso-8859-1?Q?tDmfku5+8+kpojbHZkMNcL4tNQKkW9ZbTippzmzf7iaVViIbUlt/8SJq8l?=
 =?iso-8859-1?Q?EDR/ERPFjKS/A6lB5s/vhYnfY2hVtFobyxwDROtAuXrRKGDNzxIehQioPe?=
 =?iso-8859-1?Q?riNhvlSBMBn4ZWRjlkHj5b9f0p78Xtlp+KNPd2HIS5af8s7kYks1lg2sw6?=
 =?iso-8859-1?Q?witcOQDPxt73bsDBL1nPmwNaGbJznmRqhMyEAXgcV2UDVitkDdwKGJPKyT?=
 =?iso-8859-1?Q?x2uExgtCXz9OqKwI5Kw23N4f+FEVo1Ty72qW8JE05PQtgwC1RBIiVZxckY?=
 =?iso-8859-1?Q?tKGZBJUZZTkXNSIxAeC93EexPohN+IrzDdx3r2II20njvpTO6hOHXt5h6F?=
 =?iso-8859-1?Q?uR4HwahLsRlxq1XYTXgjFlSPx3suT87NV/V20lKGmJ7AFSDwQ3H1IpV8lz?=
 =?iso-8859-1?Q?Ge2E1gCvwFccyH0VRNgvq8ycbh2vSAE1nlBKGXA5/W1MINVjEaXsaf4mz7?=
 =?iso-8859-1?Q?+ogQyPbgwe+UTGDzPwtBWguDGd+mMFc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B6831C1189A3D74EBCA665E565FBA8A2@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f03bcd-8287-454b-11aa-08da4938174d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 10:17:28.3644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZZiHpXSnK1h+yopgc+I9hmNRVImr3UYIbXNhHVrwnuf3sjD3f2hFiRP3SRVqbAnfo/gskSxRxBoLVbEYNhL0fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7863
X-Proofpoint-ORIG-GUID: 7i0szBZwh86k1-X1JjK6TRVJIJEyMScc
X-Proofpoint-GUID: 7i0szBZwh86k1-X1JjK6TRVJIJEyMScc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-08_03,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 mlxlogscore=999 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206080045
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 08, 2022 at 01:22:21AM PDT, C=E9dric Le Goater wrote:
>Palmettos were the first OpenPOWER systems built by Tyan with the
>product name: GN70-BP010. They contained an IBM POWER8 Turismo SCM
>processor and an Aspeed AST2400 SoC.
>
>The ast2400_openbmc_defconfig defconfig is based on the evb-ast2400
>defconfig, plus these extras :
>
>  CONFIG_BOOTCOMMAND=3D"bootm 20080000"
>  CONFIG_DEFAULT_DEVICE_TREE=3D"ast2400-palmetto"
>  CONFIG_PHY_NCSI=3Dy
>
>Cc: Joel Stanley <joel@jms.id.au>
>Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
>---
>
> Changes in v2 :
>
> - device tree cleanups to match HW
> - renamed defconfig to ast2400_openbmc_defconfig
>
> arch/arm/dts/Makefile             |  1 +
> arch/arm/dts/ast2400-palmetto.dts | 74 +++++++++++++++++++++++++++++++
> configs/ast2400_openbmc_defconfig | 72 ++++++++++++++++++++++++++++++
> 3 files changed, 147 insertions(+)
> create mode 100644 arch/arm/dts/ast2400-palmetto.dts
> create mode 100644 configs/ast2400_openbmc_defconfig
>
>diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
>index 8f876a0aa0d7..1d523c5d5da0 100755
>--- a/arch/arm/dts/Makefile
>+++ b/arch/arm/dts/Makefile
>@@ -676,6 +676,7 @@ dtb-$(CONFIG_ARCH_BCM6858) +=3D \
>
> dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> 	ast2400-evb.dtb \
>+	ast2400-palmetto.dtb \
> 	ast2400-ahe-50dc.dtb \

Sort?  (palmetto after ahe-50dc)

> 	ast2500-evb.dtb \
> 	ast2600a0-evb.dtb \
>diff --git a/arch/arm/dts/ast2400-palmetto.dts b/arch/arm/dts/ast2400-palm=
etto.dts
>new file mode 100644
>index 000000000000..2a49ded27b43
>--- /dev/null
>+++ b/arch/arm/dts/ast2400-palmetto.dts
>@@ -0,0 +1,74 @@
>+// SPDX-License-Identifier: GPL-2.0+
>+/dts-v1/;
>+
>+#include "ast2400-u-boot.dtsi"
>+
>+/ {
>+	model =3D "Palmetto BMC";
>+	compatible =3D "tyan,palmetto-bmc", "aspeed,ast2400";
>+
>+	memory@40000000 {
>+		device_type =3D "memory";
>+		reg =3D <0x40000000 0x10000000>;
>+	};
>+
>+	chosen {
>+		stdout-path =3D &uart5;
>+		bootargs =3D "console=3DttyS4,115200 earlyprintk";

Does bootargs serve a particular purpose here?  (The other ast2x00
device-trees don't appear to include it.)

>+	};
>+
>+	aliases {
>+		spi0 =3D &fmc;
>+		spi1 =3D &spi1;
>+		ethernet0 =3D &mac0;
>+	};
>+};
>+
>+&uart5 {
>+	u-boot,dm-pre-reloc;
>+	status =3D "okay";
>+};
>+
>+&sdrammc {
>+	clock-frequency =3D <200000000>;
>+};
>+
>+&wdt1 {
>+	u-boot,dm-pre-reloc;
>+	status =3D "okay";
>+};
>+
>+&wdt2 {
>+	u-boot,dm-pre-reloc;
>+	status =3D "okay";
>+};
>+
>+&mac0 {
>+	status =3D "okay";
>+	phy-mode =3D "rgmii";
>+
>+	pinctrl-names =3D "default";
>+	pinctrl-0 =3D <&pinctrl_mac1link_default &pinctrl_mdio1_default>;
>+};
>+
>+&fmc {
>+	status =3D "okay";
>+	flash@0 {
>+		status =3D "okay";
>+		spi-max-frequency =3D <50000000>;
>+		spi-tx-bus-width =3D <2>;
>+		spi-rx-bus-width =3D <2>;
>+	};
>+};
>+
>+&spi1 {
>+	status =3D "okay";
>+	flash@0 {
>+		pinctrl-names =3D "default";
>+		pinctrl-0 =3D <&pinctrl_spi1_default>;
>+		status =3D "okay";
>+		spi-max-frequency =3D <50000000>;
>+		spi-tx-bus-width =3D <2>;
>+		spi-rx-bus-width =3D <2>;
>+	};
>+};
>diff --git a/configs/ast2400_openbmc_defconfig b/configs/ast2400_openbmc_d=
efconfig
>new file mode 100644
>index 000000000000..d09358777304
>--- /dev/null
>+++ b/configs/ast2400_openbmc_defconfig

Is the implication here that the testing discussed in the v1 thread
(using the existing evb defconfig instead of an entirely new one) didn't
work out?

>@@ -0,0 +1,72 @@
>+CONFIG_ARM=3Dy
>+CONFIG_ARCH_ASPEED=3Dy
>+CONFIG_SYS_TEXT_BASE=3D0x0
>+CONFIG_ASPEED_AST2400=3Dy
>+CONFIG_SYS_MALLOC_F_LEN=3D0x2000
>+CONFIG_ENV_SIZE=3D0x10000
>+CONFIG_ENV_OFFSET=3D0xF0000
>+CONFIG_NR_DRAM_BANKS=3D1
>+CONFIG_FIT=3Dy
>+CONFIG_USE_BOOTARGS=3Dy
>+CONFIG_BOOTARGS=3D"console=3DttyS4,115200n8 root=3D/dev/ram rw"
>+CONFIG_USE_BOOTCOMMAND=3Dy
>+CONFIG_BOOTCOMMAND=3D"bootm 20080000"
>+CONFIG_PRE_CONSOLE_BUFFER=3Dy
>+CONFIG_PRE_CON_BUF_ADDR=3D0x1e720000
>+CONFIG_SYS_CONSOLE_ENV_OVERWRITE=3Dy
>+CONFIG_HUSH_PARSER=3Dy
>+# CONFIG_AUTO_COMPLETE is not set
>+CONFIG_SYS_PROMPT=3D"ast# "
>+# CONFIG_CMD_IMI is not set
>+# CONFIG_CMD_XIMG is not set
>+CONFIG_CMD_MEMTEST=3Dy
>+CONFIG_SYS_ALT_MEMTEST=3Dy
>+CONFIG_CMD_CLK=3Dy
>+CONFIG_CMD_GPIO=3Dy
>+CONFIG_CMD_I2C=3Dy
>+CONFIG_CMD_MMC=3Dy
>+CONFIG_CMD_SF=3Dy
>+CONFIG_CMD_DHCP=3Dy
>+CONFIG_CMD_MII=3Dy
>+CONFIG_CMD_PING=3Dy
>+CONFIG_DEFAULT_DEVICE_TREE=3D"ast2400-palmetto"
>+CONFIG_ENV_IS_IN_SPI_FLASH=3Dy
>+CONFIG_USE_ENV_SPI_BUS=3Dy
>+CONFIG_ENV_SPI_BUS=3D0
>+CONFIG_USE_ENV_SPI_CS=3Dy
>+CONFIG_ENV_SPI_CS=3D0
>+CONFIG_USE_ENV_SPI_MAX_HZ=3Dy
>+CONFIG_ENV_SPI_MAX_HZ=3D100000000
>+CONFIG_NET_RANDOM_ETHADDR=3Dy
>+CONFIG_REGMAP=3Dy
>+CONFIG_CLK=3Dy
>+CONFIG_DM_GPIO=3Dy
>+CONFIG_ASPEED_GPIO=3Dy
>+CONFIG_DM_I2C=3Dy
>+CONFIG_SYS_I2C_ASPEED=3Dy
>+CONFIG_MISC=3Dy
>+CONFIG_DM_MMC=3Dy
>+# CONFIG_MMC_HW_PARTITIONING is not set
>+CONFIG_MMC_SDHCI=3Dy
>+CONFIG_MMC_SDHCI_ASPEED=3Dy
>+CONFIG_DM_SPI_FLASH=3Dy
>+CONFIG_SPI_FLASH=3Dy
>+CONFIG_SPI_FLASH_MACRONIX=3Dy
>+CONFIG_SPI_FLASH_SPANSION=3Dy
>+CONFIG_SPI_FLASH_STMICRO=3Dy
>+CONFIG_SPI_FLASH_WINBOND=3Dy
>+CONFIG_PHY_REALTEK=3Dy
>+CONFIG_PHY_NCSI=3Dy
>+CONFIG_DM_ETH=3Dy
>+CONFIG_PHY_GIGE=3Dy
>+CONFIG_FTGMAC100=3Dy
>+CONFIG_PHY=3Dy
>+CONFIG_PINCTRL=3Dy
>+CONFIG_DM_SERIAL=3Dy
>+CONFIG_SYS_NS16550=3Dy
>+CONFIG_SPI=3Dy
>+CONFIG_DM_SPI=3Dy
>+CONFIG_SYSRESET=3Dy
>+CONFIG_TIMER=3Dy
>+CONFIG_WDT=3Dy
>+# CONFIG_EFI_LOADER is not set
>--=20
>2.35.3
>=
