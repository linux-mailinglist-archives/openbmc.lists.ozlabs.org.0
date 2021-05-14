Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD16C380E18
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 18:24:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhYkW6Y4Hz2yxk
	for <lists+openbmc@lfdr.de>; Sat, 15 May 2021 02:24:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=FIIcorp.onmicrosoft.com header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-FIIcorp-onmicrosoft-com header.b=gDSr9ok7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-usa.com (client-ip=40.107.236.80;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=lancelot.kao@fii-usa.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=gDSr9ok7; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhYk63z8Wz2ym5
 for <openbmc@lists.ozlabs.org>; Sat, 15 May 2021 02:23:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOdzlZqnCGvenflSqBT2bYxr+IpxCqWh4biZFUeJKI6ZtR4DYF2e80GrolgIhXyItanrfPix0uSJYGMceH/sgnbjppLkVKi/nY45ggc8mu+8fuhIh/YnTJZah9JFQaMxwQepyRVUk6ycd06oQ4jQRD3zxNFSXTu449k/8lGgY/YHo9Mi2A6HVttJ0+Xonsw+IMwf4kytbHehxt8oCo9mB0b7qz2V2KLzn+h2BO8a+2sG/Ne33ECQ1xmccsO/V0U2m5I+eVzvdAHFOfV4WZo55PMqlVhsuxMikrwKEM9NHssZIxSiEsUWgO9miZwpi6+m9+5ca0GjGuGAAkSNIvyvTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afbLXDZupcLv6Nf9CVkYECC+2VhvolLNX2fdWvqekk4=;
 b=CC0SIy1Gp5kfVkD7TOfImhBisjsv8UQS4gVrlYqHey4G0JMDwX5KAKzKOhskfC1MQJTPUnQilToQO9cdBfr6n+l9jaodEI830uAZmYtGbEAvuQqvZmpxESadFklynMKOshx6n0UuYshCL8qCy90vB+temEdEhmJ1qoUUyroV+zzx5CPrxOj1vbKGtz0Jn4pVP6oHLzlh02Sq37tip17CEm9r2XxllXIIeFDP5PvfEtMgIZDQ1sQ73nupS/6i72G/vuDnvOnSxndhM9qpr9B3nEX8Aish+PlRSnYQp5yXEvgUq2f+DOkhzaFfjcc4D+3l6keSUgS5bN0pjyVk1UiXcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-usa.com; dmarc=pass action=none header.from=fii-usa.com;
 dkim=pass header.d=fii-usa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afbLXDZupcLv6Nf9CVkYECC+2VhvolLNX2fdWvqekk4=;
 b=gDSr9ok7cBtefKjXVcK2l0wc2xnUfUAa1bz1Gtj0ksIa3bS3KJ0IDtb8KIlNFgj2P/F1yTf0MaAe/d1JBPD3ZYXAlo6ulC48HMucXGG1OSuwSlN2Z1uGvm2AuMwqeM+0L64lky1qk6JaxiBLnByRwh8ROFnyIGroGBK7UV71zx1BlHoCq+LWN03NsNfschcaTjc4Tid0NzM7cc4ZiM9Cs6MXhP0vq7VEBhL3pwt0InUG9S1Wx9vLfnHN056Bk8BdnUrFNbeZXt8Oz2iQ5ughjOejkxkAi8E4c7i2jwU0Qia+bmVXgbhlblURTp04d50oV5ucGj7/kc+9tdOw76RAmA==
Received: from DM6PR08MB4890.namprd08.prod.outlook.com (2603:10b6:5:43::18) by
 DS7PR08MB6895.namprd08.prod.outlook.com (2603:10b6:5:3b0::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25; Fri, 14 May 2021 16:23:32 +0000
Received: from DM6PR08MB4890.namprd08.prod.outlook.com
 ([fe80::8993:53a4:c235:f264]) by DM6PR08MB4890.namprd08.prod.outlook.com
 ([fe80::8993:53a4:c235:f264%7]) with mapi id 15.20.4129.026; Fri, 14 May 2021
 16:23:32 +0000
From: Lancelot Kao <Lancelot.Kao@fii-usa.com>
To: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>, Joel Stanley
 <joel@jms.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>, Vivekanand Veeracholan
 <vveerach@google.com>, Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
Subject: =?iso-2022-jp?B?GyRCMnNKJBsoQjogW1BBVENIIGxpbnV4IGRldi01LjEwXSBudXZvdG9u?=
 =?iso-2022-jp?B?LW5wY203MzAta3Vkbw==?=
Thread-Topic: [PATCH linux dev-5.10] nuvoton-npcm730-kudo
Thread-Index: AQHXNgp+FldPxWbTs06CrlZEGQYk3qrjTiOA
Date: Fri, 14 May 2021 16:23:32 +0000
Message-ID: <DM6PR08MB489070225D91096CF92BBFDFC0509@DM6PR08MB4890.namprd08.prod.outlook.com>
References: <20210420172733.5109-1-mohaimen.alsamarai@fii-na.com>
In-Reply-To: <20210420172733.5109-1-mohaimen.alsamarai@fii-na.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fii-na.com; dkim=none (message not signed)
 header.d=none;fii-na.com; dmarc=none action=none header.from=fii-usa.com;
x-originating-ip: [65.205.114.151]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96ee34e3-cbff-41b3-94a0-08d916f49df9
x-ms-traffictypediagnostic: DS7PR08MB6895:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DS7PR08MB6895393171E18073FC87C5C7C0509@DS7PR08MB6895.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /S2GVfu8lwBzyqn2or6ZPeswID8vxHGzidMXIs7UUtC0At70yDzOhulsmFi94O4wVeYl0TGG8kPeHlaP1FXNrONuZwMEZWPYhGsKDmo6gyAJlHcNHjo9z6D+HfGkPK2Ih43odNLwjVpyHGS5f2xVNzmfT18ACGZjguLTsd4Q+tJJZb7M+BMOoX+kUlCTf8nrzbvk1UzDnEqM40sNEY4yeVS4g1Mk3aGAAuxAG3ADxt9QxKTRwWrB+Dx9/YNTPcJKVniBfvInHuz/e1Kl/QaR+Gwq+e9a5jbb3TH8unSyrPg059SR5LDRpM9Csy5EZqY29x6jjjLlrfg4uZsGt3H1UiVBpfmWPrPZtDRw86ji9GBrfogerIiK2VpCpdrMWRyxL5hB0dB1UUQAkZ6OrN6k7CBxO4DxdH0i35QwYci8v1In7uBwIvYj9gyu1gH8MwqGw2F2BUADfbpNlI0ZD5DHP8GopVR35JlnfzFIzVhCNBlVDdECuF9nk5xyNGMwHem5jEyI9zfkGyT8BQGg4G0pLzv0YNK0PdmypzpVq/4vKbNupTZyVcvn8n/P7AAEtQwVaTpextoTu2BnpXJgyaPvbA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR08MB4890.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39850400004)(396003)(346002)(376002)(366004)(83380400001)(224303003)(86362001)(76116006)(66946007)(66446008)(38100700002)(107886003)(478600001)(52536014)(66556008)(64756008)(71200400001)(122000001)(6506007)(55016002)(7696005)(8936002)(33656002)(2906002)(4326008)(110136005)(9686003)(66476007)(30864003)(186003)(316002)(26005)(5660300002)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-2022-jp?B?TWRwRllGRVNnNnExWXFKcUFlNE50ZGVvbnBSRzZUaVowd0NBTmF6SUNk?=
 =?iso-2022-jp?B?Ym5DRkY4ZVltN2tWdVdTVmFFdVRBVjFPOEtJYWJRMGRrdktveUtZTzRS?=
 =?iso-2022-jp?B?NVA2Z3U5ZEcwTDNtUlRPc3hoOEtQaFg3eXk5VC9XZVdwSWU2NGhHczRQ?=
 =?iso-2022-jp?B?T2Q0RHIxZVZmdkFMSDBqWm05SWdhRTJVa085UlpOc0Vpcmh0aVowbk10?=
 =?iso-2022-jp?B?dnF1WVM4eXVkL21IeURzVlp3RXhhb0NISHZ5K1BLYVlReUJlY2pnNC9M?=
 =?iso-2022-jp?B?T1ZDQ2RUSzdvK0llanlhN2NCYUhtdUx1U24vQjdFTVRFeVZOZTYyL25p?=
 =?iso-2022-jp?B?bDkvc3R5Wmg2OGY2YXJWYWNJQ2t3SG1OVklOdHdDeVFwZnh1U3hUZHdP?=
 =?iso-2022-jp?B?U2VQczBvTGlGR05IRWdDTlY5T3J0VTFCREJva2ZrVytNbmtYNWhXdmtQ?=
 =?iso-2022-jp?B?MC9KYmdDL1VNL3FQVDRTR2t5WkhQNStCaVdTMGcySTc4clFrbjgwdThi?=
 =?iso-2022-jp?B?T1pEOExVZ2pWUVBBSEdZeEprUThtNHFRRHVYVVk3U20xc3lFTVF1eElk?=
 =?iso-2022-jp?B?VlVqeTFsL1NUR0FPRHVQckpRL1VBeDRhbmc2SVBGQStpWnVWT045OG1C?=
 =?iso-2022-jp?B?dlNvNVBaTkV0cGgwMHZmNUcrT1lEVk9mUWx4YmJzdnN4WDBXRmVPajk0?=
 =?iso-2022-jp?B?VklCTGo4eHBPOUQ2bFBqUnkza2JJcHBRTi9xTDlWdFA0TXdvOC9FTzg2?=
 =?iso-2022-jp?B?NHV5MWdsTHBPNGc0SGJRRTFuRUlCd1MxS09ubTdhVnZCajJMUUZQUGVR?=
 =?iso-2022-jp?B?Z0NkMEhPOWViMlNobkk1R3gzUkZaVVpiWkkvTFpiY3RwTlVqYWVOKzNX?=
 =?iso-2022-jp?B?N0laWFRkeDZ2TlBsV2NnS0pLbUdQSEdEZStzdnlGV3RWR0ZjYjNkcGVX?=
 =?iso-2022-jp?B?ZWMzME9UOVVYRWI1T2VWTU5sZTJBeUg5MTQxSFBSY25sdGd1cTMrZUpL?=
 =?iso-2022-jp?B?emZKTWZoR0g0ckZvaHRUOFRtTFRpTW9kaE5abU5meGp2dWFqRVF2ZzFq?=
 =?iso-2022-jp?B?d1Zuc0xORE80MlBLZXFnNFQrdjBZZk9DVWxBSkdFQXNvY0tPanRKVXlt?=
 =?iso-2022-jp?B?aVRtOXdDY2g4SnptbjZGcDZGY05MQndaTmFvUTRWSWRibEZtaUgzK1ZU?=
 =?iso-2022-jp?B?WWlLbjVnSnZhb3h5UlFEMVRsd05KUGFJZ3RnVzNWcjQxNUhzaUxGSCtt?=
 =?iso-2022-jp?B?cytvZjJZMFFEUHlJVDNUMlcrQWFIVkNMa1FIOUN6NnkveVhBaGJUVHZh?=
 =?iso-2022-jp?B?YmlRSGozNnZUdTc4TnFxdnI0dThKTi9TUW5NNWpqMU5RRHd2ODVUa0hF?=
 =?iso-2022-jp?B?b21lNDlXQ0ZVckJjOWlRSDlNYTRlL1JIRjMzb1dUUE04L3dJaURXOEMr?=
 =?iso-2022-jp?B?d2ljM1ZwOUlqMDNaU29OdEhKUERaMkpOVjh2b2xsQXRpMDJ1cGVZWlZP?=
 =?iso-2022-jp?B?UlkvZmd6Y2xFTldWYWlSZ0RpdWtSbGVkenU1OThVOUY0MU1MNEcxb3hO?=
 =?iso-2022-jp?B?Q1N0QXRWMUhWSk5vNTNCa0dpR0ZDWm1ZVFlvZCsvcy9Hb1F0UjRqcXQ5?=
 =?iso-2022-jp?B?aGkyNGRNczFVb0ViM1lHVkRuS1ZaUG1MSnc3WWVoOEZsTFlDQUNqcmpJ?=
 =?iso-2022-jp?B?cGVaekRBbDVpb0xsbmIxRS84WEFpYVN6YTFScVNvd011c0dpN1grcmdo?=
 =?iso-2022-jp?B?UjRYNXpxb3ZFNTAzMGdVSEszRmZBWE5LSktoTnZYSHltZFFpelNySW9K?=
 =?iso-2022-jp?B?blFuSlVkZW9OS0hQNWQzd21sQ2Rrc0NRSm53dXlvVnlCRTdzUld6TGRM?=
 =?iso-2022-jp?B?eXlQdW1JUU1vdGJoWWIxWXZXS3BjPQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fii-usa.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB4890.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ee34e3-cbff-41b3-94a0-08d916f49df9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2021 16:23:32.5860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4pDFduQVooX8AuYYyMKUYTO7pjOeOvkspcshzjG/WG6rtPm/5m7+lyFZogNHbUlcHl4hDs8c643lvwv+4nCJ4faqSNPdDksxFdFx3DydI+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR08MB6895
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
Cc: Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Review-by: Lancelot Kao <lancelot.kao@fii-usa.com>

-----=1B$B86;OM97o=1B(B-----
=1B$B4s7o<T=1B(B: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>=20
=1B$B4s7oF|4|=1B(B: Tuesday, April 20, 2021 12:28 PM
=1B$BZ@7o<T=1B(B: Joel Stanley <joel@jms.id.au>; openbmc@lists.ozlabs.org; =
Benjamin Fair <benjaminfair@google.com>; Vivekanand Veeracholan <vveerach@g=
oogle.com>; Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>; Mustatfa Sh=
ehabi <Mustafa.Shehabi@fii-na.com>
=1B$BI{K\=1B(B: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>; Mustatf=
a Shehabi <Mustafa.Shehabi@fii-na.com>; Lancelot Kao <Lancelot.Kao@fii-usa.=
com>
=1B$B<g;]=1B(B: [PATCH linux dev-5.10] nuvoton-npcm730-kudo

Add device tree for the Kudo BMC. Kudo is an Ampere (Altra) server platform=
 manufactured by Fii and is based on a Nuvoton

Signed-off-by: Mohaimen Alsamarai <mohaimen.alsamarai@fii-na.com>
Signed-off-by: Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
Signed-off-by: Lancelot Kao <lancelot.kao@fii-usa.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-kudo.dts | 1720 ++++++++++++++------
 1 file changed, 1257 insertions(+), 463 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts b/arch/arm/boot/dts=
/nuvoton-npcm730-kudo.dts
index 82a104b2a65f..9e133989bdcd 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
@@ -4,18 +4,23 @@
 /dts-v1/;
 #include "nuvoton-npcm730.dtsi"
=20
-#include <dt-bindings/gpio/gpio.h>
-
 / {
 	model =3D "Fii Kudo Board";
 	compatible =3D "fii,kudo", "nuvoton,npcm730";
=20
 	aliases {
+		ethernet0 =3D &emc0;
 		ethernet1 =3D &gmac0;
 		serial0 =3D &serial0;
 		serial1 =3D &serial1;
 		serial2 =3D &serial2;
 		serial3 =3D &serial3;
+		emmc0 =3D &sdhci0;
+		udc5 =3D &udc5;
+		udc6 =3D &udc6;
+		udc7 =3D &udc7;
+		udc8 =3D &udc8;
+		vdma =3D &vdma;
 		i2c1 =3D &i2c1;
 		i2c2 =3D &i2c2;
 		i2c3 =3D &i2c3;
@@ -31,14 +36,50 @@
 		i2c13 =3D &i2c13;
 		i2c14 =3D &i2c14;
 		i2c15 =3D &i2c15;
-		spi0 =3D &spi0;
+//		spi0 =3D &spi0;
 		spi1 =3D &spi1;
 		fiu0 =3D &fiu0;
 		fiu1 =3D &fiu3;
+                i2c16 =3D &i2c16;
+                i2c17 =3D &i2c17;
+                i2c18 =3D &i2c18;
+                i2c19 =3D &i2c19;
+                i2c20 =3D &i2c20;
+                i2c21 =3D &i2c21;
+                i2c22 =3D &i2c22;
+                i2c23 =3D &i2c23;
+                i2c24 =3D &i2c24;
+                i2c25 =3D &i2c25;
+                i2c26 =3D &i2c26;
+                i2c27 =3D &i2c27;
+                i2c28 =3D &i2c28;
+                i2c29 =3D &i2c29;
+                i2c30 =3D &i2c30;
+                i2c31 =3D &i2c31;
+                i2c32 =3D &i2c32;
+                i2c33 =3D &i2c33;
+                i2c34 =3D &i2c34;
+                i2c35 =3D &i2c35;
+                i2c36 =3D &i2c36;
+                i2c37 =3D &i2c37;
+                i2c38 =3D &i2c38;
+                i2c39 =3D &i2c39;
+                i2c40 =3D &i2c40;
+                i2c41 =3D &i2c41;
+                i2c42 =3D &i2c42;
+                i2c43 =3D &i2c43;
+                i2c44 =3D &i2c44;
+                i2c45 =3D &i2c45;
+                i2c46 =3D &i2c46;
+                i2c47 =3D &i2c47;
+                i2c48 =3D &i2c48;
+                i2c49 =3D &i2c49;
+                i2c50 =3D &i2c50;
+                i2c51 =3D &i2c51;
 	};
=20
 	chosen {
-		stdout-path =3D &serial3;
+		stdout-path =3D &serial0;
 	};
=20
 	memory {
@@ -48,334 +89,754 @@
 	iio-hwmon {
 		compatible =3D "iio-hwmon";
 		io-channels =3D <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
-			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
-	};
-
-	jtag_master {
-		compatible =3D "nuvoton,npcm750-jtag-master";
-		#address-cells =3D <1>;
-		#size-cells =3D <1>;
-
-		// dev/jtag0
-		dev-num =3D <0>;
-		// pspi or gpio
-		mode =3D "pspi";
-
-		// pspi2
-		pspi-controller =3D <2>;
-		reg =3D <0xf0201000 0x1000>;
-		interrupts =3D <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
-		clocks =3D <&clk NPCM7XX_CLK_APB5>;
-
-		// TCK, TDI, TDO, TMS
-		jtag-gpios =3D <&gpio0 19 GPIO_ACTIVE_HIGH>,
-				<&gpio0 18 GPIO_ACTIVE_HIGH>,
-				<&gpio0 17 GPIO_ACTIVE_HIGH>,
-				<&gpio0 16 GPIO_ACTIVE_HIGH>;
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>, <&tla2024 0>, <&tla2024 1>;
 	};
=20
 	leds {
 		compatible =3D "gpio-leds";
 		heartbeat {
 			label =3D "heartbeat";
-			gpios =3D <&gpio0 14 1>;
+			gpios =3D <&gpio0 7 1>;
 		};
 	};
=20
 	pinctrl: pinctrl@f0800000 {
-		gpio61oh_pins: gpio61oh-pins {
-			pins =3D "GPO61/nDTR1_BOUT1/STRAP6";
-			bias-disable;
-			output-high;
-		};
-		gpio62oh_pins: gpio62oh-pins {
-			pins =3D "GPO62/nRTST1/STRAP5";
-			bias-disable;
-			output-high;
-		};
-		gpio161ol_pins: gpio161ol-pins {
-			pins =3D "GPIO161/nLFRAME/nESPICS";
-			bias-disable;
-			output-low;
-		};
-		gpio163i_pins: gpio163i-pins {
-			pins =3D "GPIO163/LCLK/ESPICLK";
-			bias-disable;
-			input-enable;
-		};
-		gpio167ol_pins: gpio167ol-pins {
-			pins =3D "GPIO167/LAD3/ESPI_IO3";
-			bias-disable;
-			output-low;
-		};
-		gpio95i_pins: gpio95i-pins {
-			pins =3D "GPIO95/nLRESET/nESPIRST";
-			bias-disable;
-			input-enable;
-		};
-		gpio65ol_pins: gpio65ol-pins {
-			pins =3D "GPIO65/FANIN1";
-			bias-disable;
-			output-low;
-		};
-		gpio66oh_pins: gpio66oh-pins {
-			pins =3D "GPIO66/FANIN2";
-			bias-disable;
-			output-high;
-		};
-		gpio67oh_pins: gpio67oh-pins {
-			pins =3D "GPIO67/FANIN3";
-			bias-disable;
-			output-high;
-		};
-		gpio68ol_pins: gpio68ol-pins {
-			pins =3D "GPIO68/FANIN4";
-			bias-disable;
-			output-low;
-		};
-		gpio69i_pins: gpio69i-pins {
-			pins =3D "GPIO69/FANIN5";
-			bias-disable;
-			input-enable;
-		};
-		gpio70ol_pins: gpio70ol-pins {
-			pins =3D "GPIO70/FANIN6";
-			bias-disable;
-			output-low;
-		};
-		gpio71i_pins: gpio71i-pins {
-			pins =3D "GPIO71/FANIN7";
-			bias-disable;
-			input-enable;
-		};
-		gpio72i_pins: gpio72i-pins {
-			pins =3D "GPIO72/FANIN8";
-			bias-disable;
-			input-enable;
-		};
-		gpio73i_pins: gpio73i-pins {
-			pins =3D "GPIO73/FANIN9";
-			bias-disable;
-			input-enable;
-		};
-		gpio74i_pins: gpio74i-pins {
-			pins =3D "GPIO74/FANIN10";
-			bias-disable;
-			input-enable;
-		};
-		gpio75i_pins: gpio75i-pins {
-			pins =3D "GPIO75/FANIN11";
-			bias-disable;
-			input-enable;
-		};
-		gpio76i_pins: gpio76i-pins {
-			pins =3D "GPIO76/FANIN12";
-			bias-disable;
-			input-enable;
-		};
-		gpio77i_pins: gpio77i-pins {
-			pins =3D "GPIO77/FANIN13";
-			bias-disable;
-			input-enable;
-		};
-		gpio78i_pins: gpio78i-pins {
-			pins =3D "GPIO78/FANIN14";
-			bias-disable;
-			input-enable;
-		};
-		gpio79ol_pins: gpio79ol-pins {
-			pins =3D "GPIO79/FANIN15";
-			bias-disable;
-			output-low;
-		};
-		gpio80oh_pins: gpio80oh-pins {
-			pins =3D "GPIO80/PWM0";
-			bias-disable;
-			output-high;
-		};
-		gpio81i_pins: gpio81i-pins {
-			pins =3D "GPIO81/PWM1";
-			bias-disable;
-			input-enable;
-		};
-		gpio82i_pins: gpio82i-pins {
-			pins =3D "GPIO82/PWM2";
-			bias-disable;
-			input-enable;
-		};
-		gpio83i_pins: gpio83i-pins {
-			pins =3D "GPIO83/PWM3";
-			bias-disable;
-			input-enable;
-		};
-		gpio144i_pins: gpio144i-pins {
-			pins =3D "GPIO144/PWM4";
-			bias-disable;
-			input-enable;
-		};
-		gpio145i_pins: gpio145i-pins {
-			pins =3D "GPIO145/PWM5";
-			bias-disable;
-			input-enable;
-		};
-		gpio146i_pins: gpio146i-pins {
-			pins =3D "GPIO146/PWM6";
-			bias-disable;
-			input-enable;
-		};
-		gpio147oh_pins: gpio147oh-pins {
-			pins =3D "GPIO147/PWM7";
-			bias-disable;
-			output-high;
-		};
-		gpio168ol_pins: gpio168ol-pins {
-			pins =3D "GPIO168/nCLKRUN/nESPIALERT";
-			bias-disable;
-			output-low;
-		};
-		gpio169oh_pins: gpio169oh-pins {
-			pins =3D "GPIO169/nSCIPME";
-			bias-disable;
-			output-high;
-		};
-		gpio170ol_pins: gpio170ol-pins {
-			pins =3D "GPIO170/nSMI";
-			bias-disable;
-			output-low;
-		};
-		gpio218oh_pins: gpio218oh-pins {
-			pins =3D "GPIO218/nWDO1";
-			bias-disable;
-			output-high;
-		};
-		gpio37i_pins: gpio37i-pins {
-			pins =3D "GPIO37/SMB3CSDA";
-			bias-disable;
-			input-enable;
-		};
-		gpio38i_pins: gpio38i-pins {
-			pins =3D "GPIO38/SMB3CSCL";
-			bias-disable;
-			input-enable;
-		};
-		gpio39i_pins: gpio39i-pins {
-			pins =3D "GPIO39/SMB3BSDA";
-			bias-disable;
-			input-enable;
-		};
-		gpio40i_pins: gpio40i-pins {
-			pins =3D "GPIO40/SMB3BSCL";
-			bias-disable;
-			input-enable;
-		};
-		gpio121i_pins: gpio121i-pins {
-			pins =3D "GPIO121/SMB2CSCL";
-			bias-disable;
-			input-enable;
-		};
-		gpio122i_pins: gpio122i-pins {
-			pins =3D "GPIO122/SMB2BSDA";
-			bias-disable;
-			input-enable;
-		};
-		gpio123i_pins: gpio123i-pins {
-			pins =3D "GPIO123/SMB2BSCL";
-			bias-disable;
-			input-enable;
-		};
-		gpio124i_pins: gpio124i-pins {
-			pins =3D "GPIO124/SMB1CSDA";
-			bias-disable;
-			input-enable;
-		};
-		gpio125i_pins: gpio125i-pins {
-			pins =3D "GPIO125/SMB1CSCL";
-			bias-disable;
-			input-enable;
-		};
-		gpio126i_pins: gpio126i-pins {
-			pins =3D "GPIO126/SMB1BSDA";
-			bias-disable;
-			input-enable;
-		};
-		gpio127i_pins: gpio127i-pins {
-			pins =3D "GPIO127/SMB1BSCL";
-			bias-disable;
-			input-enable;
-		};
-		gpio136i_pins: gpio136i-pins {
-			pins =3D "GPIO136/SD1DT0";
-			bias-disable;
-			input-enable;
-		};
-		gpio137oh_pins: gpio137oh-pins {
-			pins =3D "GPIO137/SD1DT1";
+                /* LED Pins*/
+		gpio7oh_pins: gpio7oh-pins {
+                        pins =3D "GPIO7/IOX2D0/SMB2DSCL";
+                        label =3D "LED_BMC_LIVE";
+                        bias-disable;
+                        output-low;
+                };
+		gpio24ol_pins: gpio24ol-pins {
+                        pins =3D "GPIO24/IOXHDO";
+                        label =3D "BMC_FAULT_LED";
+                        bias-disable;
+                        output-low;
+                };  =20
+                gpio169ol_pins: gpio169ol-pins {
+                        pins =3D "GPIO169/nSCIPME";
+                        label =3D "SYS_ERR_LED";
+                        bias-disable;
+                        output-low;
+                };
+
+		// JTAG Pins
+		gpio17_pins: gpio17-pins{
+                        pins =3D "GPIO17/PSPI2DI/SMB4DEN";
+                        bias-disable;
+                        input-enable;  =20
+                };
+                gpio18o_pins: gpio18o-pins{
+			pins =3D "GPIO18/PSPI2D0/SMB4BSDA";
 			bias-disable;
 			output-high;
-		};
-		gpio138i_pins: gpio138i-pins {
-			pins =3D "GPIO138/SD1DT2";
-			bias-disable;
-			input-enable;
-		};
-		gpio139i_pins: gpio139i-pins {
-			pins =3D "GPIO139/SD1DT3";
-			bias-disable;
-			input-enable;
-		};
-		gpio140i_pins: gpio140i-pins {
-			pins =3D "GPIO140/SD1CLK";
-			bias-disable;
-			input-enable;
-		};
-		gpio141i_pins: gpio141i-pins {
-			pins =3D "GPIO141/SD1WP";
-			bias-disable;
-			input-enable;
-		};
-		gpio190oh_pins: gpio190oh-pins {
-			pins =3D "GPIO190/nPRD_SMI";
-			bias-disable;
-			output-high;
-		};
-		gpio191oh_pins: gpio191oh-pins {
-			pins =3D "GPIO191";
-			bias-disable;
-			output-high;
-		};
-		gpio195ol_pins: gpio195ol-pins {
-			pins =3D "GPIO195/SMB0BSDA";
+                };
+                gpio19ol_pins: gpio19ol-pins{
+			pins =3D "GPIO19/PSPI2CK/SMB4BSCL";
 			bias-disable;
 			output-low;
+                };
+	=09
+
+                /* Mux Pins */
+                // UART Mux Pins
+                gpio167oh_pins: gpio167oh-pins {
+                        pins =3D "GPIO167/LAD3/ESPI_IO3";
+                        label =3D "S0_UART0_BMC_SEL";
+                        bias-disable;
+                        output-high;
+                };  =20
+                gpio161oh_pins: gpio161oh-pins {
+                        pins =3D "GPIO161/nLFRAME/nESPICS";
+                        label =3D "S0_UART1_BMC_SEL";
+                        bias-disable;
+                        output-high;
+                };  =20
+		gpio177oh_pins: gpio177oh-pins {
+                        pins =3D "GPIO177/PSPI1DI/FANIN17";
+                        label =3D "S1_UART1_BMC_SEL";
+                        bias-disable;
+                        output-high;
+                };
+                gpio198ol_pins: gpio198ol-pins {
+                        pins =3D "GPIO198/SMB0DSDA";
+                        label =3D "SX_BMC_UART1_SEL";    =20
+                        bias-disable;
+                        output-low;
+                };
+
+                // I2C Mux Pins
+                gpio87oh_pins: gpio87oh-pins {
+                        pins =3D "GPIO87/R2RXD0";
+                        label =3D "BMC_I2C0_MUX4_RST_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio88oh_pins: gpio88oh-pins {
+                        pins =3D "GPIO88/R2RXD1";
+                        label =3D "BMC_I2C1_MUX1_RST_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio89oh_pins: gpio89oh-pins {
+                        pins =3D "GPIO89/R2CRSDV";
+                        label =3D "BMC_I2C1_MUX2_RST_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio91oh_pins: gpio91oh-pins {
+                        pins =3D "GPIO91/R2MDC";
+                        label =3D "BMC_I2C4_MUX3_RST_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio168oh_pins: gpio168oh-pins {
+                        pins =3D "GPIO168/nCLKRUN/nESPIALERT";
+                        label =3D "BMC_I2C_BACKUP_SEL";
+                        bias-disable;
+                        output-high;
+                };
+
+                // I3C Mux Pin
+                gpio12oh_pins: gpio12oh-pins{
+                        pins =3D "GPIO12/GSPICK/SMB5BSCL";
+                        label =3D "I3C_MUX_RST_N";
+                        bias-disable;
+                        output-high;
+                };
+
+                // JTAG Mux Pins
+                gpio218oh_pins: gpio218oh-pins {
+                        pins =3D "GPIO218/nWDO1";
+                        label =3D "BMC_JTAG_MUX_1";
+                        bias-disable;
+                        output-high;
+                };
+                gpio164ol_pins: gpio164ol-pins {
+                        pins =3D "GPIO164/LAD0/ESPI_IO0";
+                        label =3D "BMC_JTAG_SEL";
+                        bias-disable;
+                        output-low;
+                };
+                gpio16oh_pins: gpio16oh-pins {
+                        pins =3D "GPIO16/LKGPO0";
+                        label =3D "JTAG_TMS_BMC_MUX";
+                        bias-disable;
+                        output-high;
+                };
+
+                // CPU Mux Pins
+                gpio84ol_pins: gpio84ol-pins {
+                        pins =3D "GPIO84/R2TXD0";
+                        label =3D "BMC_CPU_DDR_I2C_SEL";
+                        bias-disable;
+                        output-low;
+                };
+                gpio85ol_pins: gpio85ol-pins {
+                        pins =3D "GPIO85/R2TXD1";
+                        label =3D "BMC_CPU_EEPROM_I2C_SEL";
+                        bias-disable;
+                        output-low;
+                };
+                gpio86ol_pins: gpio86ol-pins {
+                        pins =3D "GPIO86/R2TXEN";
+                        label =3D "BMC_CPU_PMBUS_SEL";
+                        bias-disable;
+                        output-low;
+                };
+                gpio120ol_pins: gpio120ol-pins {
+                        pins =3D "GPIO120/SMB2CSDA";
+                        label =3D "BMC_CPU_RTC_I2C_SEL";
+                        bias-disable;
+                        output-low;
+                };
+
+                /* Control Pins */
+                //gpio10oh_pins: gpio10oh-pins {
+                gpio10ol_pins: gpio10ol-pins {
+                        pins =3D "GPIO10/IOXHLD";
+                        label =3D "MON_BMC_ALIVE";
+                        bias-disable;
+                        output-low;
+                };
+		//gpio69oh_pins: gpio69oh-pins {
+		gpio69ol_pins: gpio69ol-pins {
+                        pins =3D "GPIO69/FANIN5";
+                        label =3D "S0_BMC_OK";
+                        bias-disable;
+                        //output-high;
+                        output-low;
+                };
+                gpio94ol_pins: gpio94ol-pins {
+                        pins =3D "GPIO94/nKBRST/SMB5DSDA";
+                        label =3D "VIRTUAL_RESEAT";
+                        bias-disable;
+                        output-low;
+                };
+		gpio203ol_pins: gpio203ol-pins {       =20
+                        pins =3D "GPIO203/FANIN16";
+                        label =3D "BMC_PWRBTN_OUT";
+                        bias-disable;
+                        output-low;
+		};
+		// graceful shutdown trigger
+                gpio70oh_pins: gpio70oh-pins {
+                        pins =3D "GPIO70/FANIN6";
+                        label =3D "S0_SHD_REQ_N";
+                        persist-enable;
+                        output-high;
+                };
+                gpio90oh_pins: gpio90oh-pins {
+                        pins =3D "GPIO90/R2RXERR";
+                        label =3D "BMC_I2C4_IO_EXPANDER_RST_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio196ol_pins: gpio196ol-pins {
+                        pins =3D "GPIO196/SMB0CSCL";
+                        label =3D "BMC_JTAG_DAISYCHAIN_DIS";
+                        bias-disable;
+                        output-low;
+                };
+                gpio197oh_pins: gpio197oh-pins {
+                        pins =3D "GPIO197/SMB0DEN";
+                        label =3D "FULL_SPEED_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio14oh_pins: gpio14oh-pins {
+                        pins =3D "GPIO14/GSPIDI/SMB5CSCL";
+                        label =3D "PE_THROTTLE_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio66ol_pins: gpio66ol-pins {
+                        pins =3D "GPIO66/FANIN2";
+                        label =3D "S0_PLIMIT";
+                        bias-disable;
+                        output-low;
+                };
+                gpio67ol_pins: gpio67ol-pins {
+                        pins =3D "GPIO67/FANIN3";
+                        label =3D "S0_RTC_LOCK";
+                        bias-disable;
+                        output-low;
+                };
+                gpio125ol_pins: gpio125ol-pins {
+                        pins =3D "GPIO125/SMB1CSCL";
+                        label =3D "S1_PLIMIT";
+                        bias-disable;
+                        output-low;
+                };
+                gpio4ol_pins: gpio4ol-pins {
+                        pins =3D "GPIO4/IOX2DI/SMB1DSDA";
+                        label =3D "RST_POST_N";
+                        bias-disable;
+                        output-low;
+                };
+                gpio5ol_pins: gpio5ol-pins {
+                        pins =3D "GPIO5/IOX2LD/SMB1DSCL";
+                        label =3D "JTAG_MUX_R_EN_N";
+                        bias-disable;
+                        output-low;
+                };
+                gpio46ol_pins: gpio46ol-pins {
+                        pins =3D "GPIO46/nDSR1/JTCK2";
+                        label =3D "ROT_CPU_RST_N";
+                        bias-disable;
+                        output-low;
+                };
+                gpio187ol_pins: gpio187ol-pins {
+                        pins =3D "GPIO187/nSPI3CS1";
+                        label =3D "BMC_FWSPI_HOLD_R_N";
+                        bias-disable;
+                        output-low;
+                };
+                gpio165ol_pins: gpio165ol-pins {
+                        pins =3D "GPIO165/LAD1/ESPI_IO1";
+                        label =3D "BMC_JTAG_SPARE";
+                        bias-disable;
+                        output-low;
+                };
+                gpio166ol_pins: gpio166ol-pins {
+                        pins =3D "GPIO166/LAD2/ESPI_IO2";
+                        label =3D "BMC_JTAG_SRST_N";
+                        bias-disable;
+                        output-low;
+                };
+                gpio77oh_pins: gpio77oh-pins {
+                        pins =3D "GPIO77/FANIN13";
+                        label =3D "S0_DDR_SAVE";
+                        bias-disable;
+                        output-high;
+                };
+                gpio170ol_pins: gpio170ol-pins {
+                        pins =3D "GPIO170/nSMI";
+                        label =3D "BMC_I2C6_RESET_N";
+                        bias-disable;
+                        output-low;
+                };
+		gpio175ol_pins: gpio175ol-pins {
+                        pins =3D "GPIO175/PSPI1CK/FANIN19";
+                        label =3D "BMC_FWSPI_WP_R_N";
+                        bias-disable;
+                        output-low;
+                };
+                gpio206oh_pins: gpio206oh-pins {
+                        pins =3D "GPIO206/HSYNC2";
+                        label =3D "FM_BMC_FRU_EEPROM_WP";
+                        bias-disable;
+                        output-high;
+                };
+                gpio219oh_pins: gpio219oh-pins {
+                        pins =3D "GPIO219/nWDO2";
+                        label =3D "BMC_I2C7_RST_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio15oh_pins: gpio15oh-pins {
+                        pins =3D "GPIO15/GSPICS/SMB5CSDA";
+                        label =3D "PE4_BRICK_EN";
+                        bias-disable;
+                        output-high;
+                };
+                gpio139ol_pins: gpio139ol-pins {
+                        pins =3D "GPIO139/SD1DT3";
+                        label =3D "HSC_A_FAULT_N";
+                        bias-disable;
+                        output-low;
+                };
+                gpio141oh_pins: gpio141oh-pins {
+                        pins =3D "GPIO141/SD1WP";
+                        label =3D "PLD_SYS_RST_BT_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio202ol_pins: gpio202ol-pins {
+                        pins =3D "GPIO202/SMB0CSDA";
+                        label =3D "BMC_SYS_PSON_N";
+                        bias-disable;
+                        output-low;
+                };
+
+                /* Monitor Pins */
+                gpio192i_pins: gpio192i-pins {
+                        pins =3D "GPIO192";
+                        label =3D "BMC_PWR_BTN_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio199i_pins: gpio199i-pins {
+                        pins =3D "GPIO199/SMB0DSCL";
+                        label =3D "BMC_PSU_PG";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio13i_pins: gpio13i-pins {
+                        pins =3D "GPIO13/GSPIDO/SMB5BSDA";
+                        label =3D "S0_RESET_OUT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio25i_pins: gpio25i-pins {
+                        pins =3D "GPIO25/IOXHDI";
+                        label =3D "S1_I2C9_ALERT_R_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio59i_pins: gpio59i-pins {
+                        pins =3D "GPIO59/SMB3DSDA";
+                        label =3D "SATA0_PRSNT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio60i_pins: gpio60i-pins {
+                        pins =3D "GPIO60/SMB3DSCL";
+                        label =3D "S0_SCP_AUTH_FAILURE_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio6i_pins: gpio6i-pins {
+                        pins =3D "GPIO6/IOX2CK/SMB2DSDA";
+                        label =3D "IRQ_SMB_AGORA_MAX34451_ALERT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio11i_pins: gpio11i-pins {
+                        pins =3D "GPIO11/IOXHCK";
+                        label =3D "S0_I2C4_ALERT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio162i_pins: gpio162i-pins {
+                        pins =3D "GPIO162/SERIRQ";
+                        label =3D "S1_BMC_SPARE_R";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio163i_pins: gpio163i-pins {
+                        pins =3D "GPIO163/LCLK/ESPICLK";
+                        label =3D "S0_BMC_VRD3_P0V75_FAULT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio37i_pins: gpio37i-pins {
+                        pins =3D "GPIO37/SMB3CSDA";
+                        label =3D "S1_BMC_VRD3_P0V75_FAULT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio93i_pins: gpio93i-pins {
+                        pins =3D "GPIO93/GA20/SMB5DSCL";
+                        label =3D "FAN_FAIL_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio64i_pins: gpio64i-pins {
+                        pins =3D "GPIO64/FANIN0";
+                        label =3D "BMC_S0_GPIO0_DDR_ADR";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio68i_pins: gpio68i-pins {
+                        pins =3D "GPIO68/FANIN4";
+                        label =3D "S0_I2C3_ALERT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio71i_pins: gpio71i-pins {
+                        pins =3D "GPIO71/FANIN7";
+                        label =3D "S1_SLAVE_PRESENT_BUFF_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio72i_pins: gpio72i-pins {
+                        pins =3D "GPIO72/FANIN8";
+                        label =3D "S0_OVERTEMP_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio73i_pins: gpio73i-pins {
+                        pins =3D "GPIO73/FANIN9";
+                        label =3D "S0_HIGHTEMP_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio74i_pins: gpio74i-pins {
+                        pins =3D "GPIO74/FANIN10";
+                        label =3D "S0_FAULT_ALERT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio75i_pins: gpio75i-pins {
+                        pins =3D "GPIO75/FANIN11";
+                        label =3D "S0_SHD_ACK_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio76i_pins: gpio76i-pins {
+                        pins =3D "GPIO76/FANIN12";
+                        label =3D "S0_REBOOT_ACK_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio78i_pins: gpio78i-pins {
+                        pins =3D "GPIO78/FANIN14";
+                        label =3D "S0_PRESENT_CPLD_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio79i_pins: gpio79i-pins {
+                        pins =3D "GPIO79/FANIN15";
+                        label =3D "S01_ALERT3_SALT3_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio80i_pins: gpio80i-pins {
+                        pins =3D "GPIO80/PWM0";
+                        label =3D "S1_GPI2_SPECIAL_BOOT";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio81i_pins: gpio81i-pins {
+                        pins =3D "GPIO81/PWM1";
+                        label =3D "S0_BMC_VRD0_VDDC_FAULT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio82i_pins: gpio82i-pins {
+                        pins =3D "GPIO82/PWM2";
+                        label =3D "S0_BMC_VRD1_VDDQ0123_FAULT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio83i_pins: gpio83i-pins {
+                        pins =3D "GPIO83/PWM3";
+                        label =3D "S1_BMC_VRD2_VDDQ4567_FAULT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio144i_pins: gpio144i-pins {
+                        pins =3D "GPIO144/PWM4";
+                        label =3D "S1_BMC_VRD1_VDDQ0123_FAULT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio145i_pins: gpio145i-pins {
+                        pins =3D "GPIO145/PWM5";
+                        label =3D "S1_BMC_VRD0_VDDC_FAULT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio146i_pins: gpio146i-pins {
+                        pins =3D "GPIO146/PWM6";
+                        label =3D "S0_BMC_VRD2_VDDQ4567_FAULT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio147i_pins: gpio147i-pins {
+                        pins =3D "GPIO147/PWM7";
+                        label =3D "S0_BMC_GPIOAC5_R";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio160i_pins: gpio160i-pins {
+                        pins =3D "GPIO160/CLKOUT/RNGOSCOUT";
+                        label =3D "RST_BMC_MB_MAX34451_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio231i_pins: gpio231i-pins {
+                        pins =3D "GPIO231/nCLKREQ";
+                        label =3D "FM_SYS_THROTTLE_LVC3_PLD";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio9i_pins: gpio9i-pins {
+                        pins =3D "GPIO9/LKGPO2";
+                        label =3D "FM_SEQ_BMC_PCIRST_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio38i_pins: gpio38i-pins {
+                        pins =3D "GPIO38/SMB3CSCL";
+                        label =3D "BMC_SALT1_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio39i_pins: gpio39i-pins {
+                        pins =3D "GPIO39/SMB3BSDA";
+                        label =3D "BMC_SALT8_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio40i_pins: gpio40i-pins {
+                        pins =3D "GPIO40/SMB3BSCL";
+                        label =3D "BMC_SALT0_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio92i_pins: gpio92i-pins {
+                        pins =3D "GPIO92/R2MDIO";
+                        label =3D "BMC_SMB_ALERT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio121i_pins: gpio121i-pins {
+                        pins =3D "GPIO121/SMB2CSCL";
+                        label =3D "S1_OVERTEMP_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio122i_pins: gpio122i-pins {
+                        pins =3D "GPIO122/SMB2BSDA";
+                        label =3D "S1_SCP_AUTH_FAILURE_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio123i_pins: gpio123i-pins {
+                        pins =3D "GPIO123/SMB2BSCL";
+                        label =3D "S1_FW_BOOT_OK";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio124i_pins: gpio124i-pins {
+                        pins =3D "GPIO124/SMB1CSDA";
+                        label =3D "S1_FAULT_ALERT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio126i_pins: gpio126i-pins {
+                        pins =3D "GPIO126/SMB1BSDA";
+                        label =3D "S1_HIGHTEMP_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio136i_pins: gpio136i-pins {
+                        pins =3D "GPIO136/SD1DT0";
+                        label =3D "S1_PRESENT_CPLD_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio138i_pins: gpio138i-pins {
+                        pins =3D "GPIO138/SD1DT2";
+                        label =3D "CPU_BIOS_RECOVER_JMPR";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio140i_pins: gpio140i-pins {
+                        pins =3D "GPIO140/SD1CLK";
+                        label =3D "PLD_BMC_SRST_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio142i_pins: gpio142i-pins {
+                        pins =3D "GPIO142/SD1CMD";
+                        label =3D "ROT_CPU_RST_AUTH_N";
+                        bias-disable;
+                        input-enable;
+                };
+		// fiu3
+                gpio188o_pins: gpio188o-pins {
+                        pins =3D "GPIO188/SPI3D2/nSPI3CS2";
+                        bias-disable;
+                        output-high;
+                }; =20
+                gpio189_pins: gpio189-pins {
+                        pins =3D "GPIO189/SPI3D3/nSPI3CS3";
+                        bias-disable;
+                        input-enable;
+                };  	=09
+                gpio190i_pins: gpio190i-pins{
+                        pins =3D "GPIO190/nPRD_SMI";
+                        label =3D "S0_GPI2_SPECIAL_BOOT";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio194i_pins: gpio194i-pins {
+                        pins =3D "GPIO194/SMB0BSCL";
+                        label =3D "S0_FW_BOOT_OK";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio195i_pins: gpio195i-pins {
+                        pins =3D "GPIO195/SMB0BSDA";
+                        label =3D "BMC_CON1_SEL";
+                        bias-disable;
+                        input-enable;
+                };
+		// CPU Reset set to high after BMC OK
+                gpio65oh_pins: gpio65oh-pins {
+                        pins =3D "GPIO65/FANIN1";
+                        label =3D "BMC_S0_SYSRESET_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio127oh_pins: gpio127oh-pins {
+                        pins =3D "GPIO127/SMB1BSCL";
+                        label =3D "BMC_S1_SYSRESET_N";
+                        bias-disable;
+                        output-high;
+                };
+	};
+
+	ahb {
+                udc5:udc@f0835000 {
+                        status =3D "okay";
 		};
-		gpio196ol_pins: gpio196ol-pins {
-			pins =3D "GPIO196/SMB0CSCL";
-			bias-disable;
-			output-low;
+                udc6:udc@f0836000 {
+                        status =3D "okay";
 		};
-		gpio199i_pins: gpio199i-pins {
-			pins =3D "GPIO199/SMB0DSCL";
-			bias-disable;
-			input-enable;
+                udc7:udc@f0837000 {
+                        status =3D "okay";
 		};
-		gpio202ol_pins: gpio202ol-pins {
-			pins =3D "GPIO202/SMB0CSDA";
-			bias-disable;
-			output-low;
+                udc8:udc@f0838000 {
+                        status =3D "okay";
 		};
 	};
-};
=20
+        pcie-slot {
+
+                pcie0: pcie-slot@0 {
+                        label =3D "slot0";
+                };
+                pcie1: pcie-slot@1 {
+                        label =3D "slot1";
+                };
+                pcie2: pcie-slot@2 {
+                        label =3D "slot2";
+                };
+                pcie3: pcie-slot@3 {
+                        label =3D "slot3";
+                };
+                pcie4: pcie-slot@4 {
+                        label =3D "slot4";
+                };
+                pcie5: pcie-slot@5 {
+                        label =3D "slot5";
+                };
+                pcie6: pcie-slot@6 {
+                        label =3D "slot6";
+                };
+                pcie7: pcie-slot@7 {
+                        label =3D "slot7";
+                };
+	};
+=09
+};
 &gmac0 {
 	phy-mode =3D "rgmii-id";
 	snps,eee-force-disable;
 	status =3D "okay";
 };
=20
+&emc0 {
+	phy-mode =3D "rmii";
+	use-ncsi;
+	status =3D "okay";
+};
+	=09
 &ehci1 {
 	status =3D "okay";
 };
=20
+&ohci1 {
+	status =3D "okay";
+};
+
+&aes {
+	status =3D "okay";
+};
+
+&sha {
+	status =3D "okay";
+};
+
+&spi1 {
+        cs-gpios =3D <&gpio1 13 GPIO_ACTIVE_HIGH>;
+        pinctrl-names =3D "default";
+        pinctrl-0 =3D <&gpio17_pins &gpio18o_pins
+                &gpio19ol_pins>;
+        status =3D "okay";
+        jtag_master {
+                compatible =3D "nuvoton,npcm750-jtag-master";
+                spi-max-frequency =3D <25000000>;
+                reg =3D <0>;
+
+                pinctrl-names =3D "pspi", "gpio";
+                pinctrl-0 =3D <&pspi2_pins>;
+                pinctrl-1 =3D <&gpio17_pins &gpio18o_pins
+                                &gpio19ol_pins>;
+
+                tck-gpios =3D <&gpio0 19 GPIO_ACTIVE_HIGH>;
+                tdi-gpios =3D <&gpio0 18 GPIO_ACTIVE_HIGH>;
+                tdo-gpios =3D <&gpio0 17 GPIO_ACTIVE_HIGH>;
+                tms-gpios =3D <&gpio0 16 GPIO_ACTIVE_HIGH>;
+                status =3D "okay";
+        };
+};
+
 &fiu0 {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&spi0cs1_pins>;
@@ -397,42 +858,29 @@
 				reg =3D <0x0000000 0xC0000>;
 				read-only;
 			};
-			u-boot-env@100000{
-				label =3D "u-boot-env";
-				reg =3D <0x00100000 0x40000>;
+			image-descriptor@f0000 {
+				label =3D "image-descriptor";
+				reg =3D <0xf0000 0x10000>;
+			};
+			rot-update@100000 {  =09
+				label =3D "rot-update";
+				reg =3D <0x100000 0x100000>;
 			};
 			kernel@200000 {
 				label =3D "kernel";
-				reg =3D <0x0200000 0x600000>;
+				reg =3D <0x200000 0x500000>;
 			};
-			rofs@800000 {
+			rofs@700000 {
 				label =3D "rofs";
-				reg =3D <0x800000 0x3500000>;
+				reg =3D <0x700000 0x35f0000>;
 			};
-			rwfs@3d00000 {
+			rwfs@3cf0000 {
 				label =3D "rwfs";
-				reg =3D <0x3d00000 0x300000>;
+				reg =3D <0x3cf0000 0x300000>;
 			};
-		};
-	};
-	spi-nor@1 {
-		compatible =3D "jedec,spi-nor";
-		#address-cells =3D <1>;
-		#size-cells =3D <1>;
-		reg =3D <1>;
-		spi-max-frequency =3D <5000000>;
-		spi-rx-bus-width =3D <2>;
-		partitions@88000000 {
-			compatible =3D "fixed-partitions";
-			#address-cells =3D <1>;
-			#size-cells =3D <1>;
-			spare1@0 {
-				label =3D "spi0-cs1-spare1";
-				reg =3D <0x0 0x800000>;
-			};
-			spare2@800000 {
-				label =3D "spi0-cs1-spare2";
-				reg =3D <0x800000 0x0>;
+			rot-mailbox@3ff0000 {=20
+				label =3D "rot-mailbox";
+				reg =3D <0x3ff0000 0x10000>;
 			};
 		};
 	};
@@ -440,27 +888,58 @@
=20
 &fiu3 {
 	pinctrl-0 =3D <&spi3_pins>;
-	spi-nor@0 {
+	status =3D "okay";
+
+        spi-nor@0 {
 		compatible =3D "jedec,spi-nor";
-		#address-cells =3D <1>;
-		#size-cells =3D <1>;
-		reg =3D <0>;
-		spi-max-frequency =3D <5000000>;
-		spi-rx-bus-width =3D <2>;
+                #address-cells =3D <1>;
+                #size-cells =3D <1>;
+                spi-rx-bus-width =3D <2>;
+                reg =3D <0>;	=09
+		label =3D "bios";
+/*
+		label =3D "BIOS";
+
 		partitions@A0000000 {
-			compatible =3D "fixed-partitions";
-			#address-cells =3D <1>;
-			#size-cells =3D <1>;
-			system1@0 {
-				label =3D "bios";
-				reg =3D <0x0 0x0>;
-			};
-			system2@800000 {
-				label =3D "spi3-system2";
-				reg =3D <0x800000 0x0>;
-			};
-		};
-	};
+                        compatible =3D "fixed-partitions";
+                        #address-cells =3D <1>;
+                        #size-cells =3D <1>;
+                        system1@0 {
+                                label =3D "bios";
+                                reg =3D <0x0 0x0>;
+                        };
+                };
+*/
+        };
+};
+
+// emmc=20
+&sdhci0 {
+	status =3D "okay";
+};
+// USB
+&ehci1 {
+	status =3D "okay";
+};
+
+&ohci1 {
+	status =3D "okay";
+};
+
+&vdma {
+	status =3D "okay";
+};
+
+&pcimbox {
+	status =3D "okay";
+};
+
+&vcd {
+	status =3D "okay";
+};
+
+&ece {
+	status =3D "okay";
 };
=20
 &watchdog1 {
@@ -492,6 +971,10 @@
 	status =3D "okay";
 };
=20
+&otp {
+	status =3D "okay";
+};
+
 &i2c1 {
 	status =3D "okay";
 	i2c-switch@75 {
@@ -501,31 +984,37 @@
 		reg =3D <0x75>;
 		i2c-mux-idle-disconnect;
=20
-		i2c@2 {
+                i2c16: i2c@0 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <0>;
+		};
+
+                i2c17: i2c@1 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <1>;
+		};
+
+		i2c18: i2c@2 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <2>;
=20
 			// Rear-Fan
-			max31790@58 {
+			max31790@2c {
 				compatible =3D "maxim,max31790";
-				reg =3D <0x58>;
+				reg =3D <0x2c>;
 			};
 		};
=20
-		i2c@3 {
+		i2c19: i2c@3 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <3>;
-
-			// Mid-Fan
-			max31790@58 {
-				compatible =3D "maxim,max31790";
-				reg =3D <0x58>;
-			};
 		};
=20
-		i2c-bus@4 {
+		i2c20: i2c@4 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <4>;
@@ -536,20 +1025,20 @@
 				reg =3D <0x5c>;
 			};
 		};
-
-		i2c-bus@5 {
+               =20
+		i2c21: i2c@5 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <5>;
=20
-			// OUTLET1_T
+			// OUTLET3_T
 			lm75@5c {
 				compatible =3D "ti,lm75";
 				reg =3D <0x5c>;
 			};
 		};
=20
-		i2c-bus@6 {
+		i2c22: i2c@6 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <6>;
@@ -561,12 +1050,12 @@
 			};
 		};
=20
-		i2c-bus@7 {
+                i2c23: i2c@7 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <7>;
=20
-			// OUTLET3_T
+			// OUTLET1_T
 			lm75@5c {
 				compatible =3D "ti,lm75";
 				reg =3D <0x5c>;
@@ -580,35 +1069,101 @@
 		reg =3D <0x77>;
 		i2c-mux-idle-disconnect;
=20
-		i2c-bus@2 {
+                i2c24: i2c@0 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <0>;
+		};
+
+                i2c25: i2c@1 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <1>;
+		};
+
+		i2c26: i2c@2 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <2>;
=20
-			// STB-T
+                        // STB-T
 			pmbus@74 {
 				compatible =3D "pmbus";
 				reg =3D <0x74>;
 			};
 		};
+
+                i2c27: i2c@3 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <3>;
+
+                        // 48V PMBUS this is a Generic PMBus Device
+			pmbus@1f {
+				compatible =3D "pmbus";
+                                reg =3D <0x1f>;
+			};
+		};
+
+                i2c28: i2c@4 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <4>;
+		};
+
+                i2c29: i2c@5 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <5>;
+		};
+
+                i2c30: i2c@6 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <6>;
+		};
+
+                i2c31: i2c@7 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <7>;
+		};
 	};
 };
=20
 &i2c2 {
 	status =3D "okay";
 	smpro@4f {
-		compatible =3D "ampere,smpro";
+		compatible =3D "ampere,ac01-smpro";
 		reg =3D <0x4f>;
+		hwmon {
+			compatible =3D "ampere,ac01-hwmon";
+		};
+		misc {
+			compatible =3D "ampere,ac01-misc";
+		};
+		errmon {
+			compatible =3D "ampere,ac01-errmon";
+		};
 	};
-
 	smpro@4e {
-		compatible =3D "ampere,smpro";
+		compatible =3D "ampere,ac01-smpro";
 		reg =3D <0x4e>;
-	};
+		hwmon {
+			compatible =3D "ampere,ac01-hwmon";
+		};
+		misc {
+			compatible =3D "ampere,ac01-misc";
+		};
+		errmon {
+			compatible =3D "ampere,ac01-errmon";
+		};
+	};=09
 };
=20
 &i2c3 {
 	status =3D "okay";
+        pcie-slot =3D &pcie0;
 };
=20
 &i2c4 {
@@ -620,64 +1175,125 @@
 		reg =3D <0x77>;
 		i2c-mux-idle-disconnect;
=20
-		i2c-bus@0 {
+		i2c32: i2c@0 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <0>;
-
+		=09
 			// ADC sensors
 			adm1266@40 {
 				compatible =3D "adi,adm1266";
 				reg =3D <0x40>;
 			};
+			// ADC sensors
+			adm1266@41 {
+				compatible =3D "adi,adm1266";
+				reg =3D <0x41>;
+			};
 		};
=20
-		i2c-bus@1 {
+		i2c33: i2c@1 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
 			reg =3D <1>;
+		=09
+			// SKM sensors
+			skm@55 {
+				compatible =3D "atmel,24c64";
+				reg =3D <0x55>;
+			};
+		};
=20
-			// ADC sensors
-			adm1266@41 {
-				compatible =3D "adi,adm1266";
-				reg =3D <0x41>;
+                i2c34: i2c@2 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <2>;
+		};
+
+                i2c35: i2c@3 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <3>;
+		};
+
+		i2c36: i2c@4 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <4>;
+
+			// gpio expander
+			pca6416@20 {
+				compatible =3D "ti,tca6416";
+				reg =3D <0x20>;
+				gpio-controller;
+				#gpio-cells =3D <2>;
 			};
 		};
+               =20
+                i2c37: i2c@5 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <5>;
+		};
+
+                i2c38: i2c@6 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <6>;
+		};
+
+                i2c39: i2c@7 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <7>;
+		};
 	};
+
+	mbfru@50 {
+        compatible =3D "atmel,24c64";
+        reg =3D <0x50>;
+    };
 };
=20
 &i2c5 {
-	status =3D "okay";
+        status =3D "okay";
+        pcie-slot =3D &pcie1;
 };
=20
 &i2c6 {
-	status =3D "okay";
+        status =3D "okay";
+        pcie-slot =3D &pcie2;
 };
=20
 &i2c7 {
-	status =3D "okay";
+        status =3D "okay";
+        pcie-slot =3D &pcie3;
 };
=20
 &i2c8 {
-	status =3D "okay";
+        status =3D "okay";
+        pcie-slot =3D &pcie4;=20
 };
=20
 &i2c9 {
-	status =3D "okay";
+        status =3D "okay";
+        pcie-slot =3D &pcie5;
 };
=20
 &i2c10 {
-	status =3D "okay";
+        status =3D "okay";
+        pcie-slot =3D &pcie6;
 };
=20
 &i2c11 {
-	status =3D "okay";
+        status =3D "okay";
+        pcie-slot =3D &pcie7;
 };
=20
 &i2c12 {
 	status =3D "okay";
 	ssif-bmc@10 {
-		compatible =3D "ssif-bmc";
+		compatible =3D "nuvoton,npcm7xx-ssif-bmc";
 		reg =3D <0x10>;
 	};
 };
@@ -691,128 +1307,306 @@
 		reg =3D <0x77>;
 		i2c-mux-idle-disconnect;
=20
-		i2c-bus@3 {
+		i2c40: i2c@0 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
-			reg =3D <3>;
+			reg =3D <0>;
+=20
+			// SMPRO EEPROM  gpio085 Gpioset 2 21=3D 0 =20
+//			scp@50 {
+//				compatible =3D "atmel,24c64";
+//				reg =3D <0x50>;
+//				pagesize =3D <32>;
+			// };
+		};
+		i2c41: i2c@1 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <1>;
+
+			rtc@51 {
+				compatible =3D "nxp,pcf85063";
+			        reg =3D <0x51>;
+			        quartz-load-femtofarads =3D <12500>;
+			};
+
+		};
+		i2c42: i2c@2 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <2>;
=20
 			// M2_ZONE_T
-			lm75@28 {
+			lm75@48 {
 				compatible =3D "ti,lm75";
-				reg =3D <0x28>;
+				reg =3D <0x48>;
 			};
 		};
=20
-		i2c-bus@4 {
+		i2c43: i2c@3 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
-			reg =3D <4>;
+			reg =3D <3>;
=20
 			// BATT_ZONE_T
-			lm75@29 {
+			lm75@49 {
 				compatible =3D "ti,lm75";
-				reg =3D <0x29>;
+				reg =3D <0x49>;
 			};
 		};
=20
-		i2c-bus@5 {
+		i2c44: i2c@4 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
-			reg =3D <5>;
+			reg =3D <4>;
=20
 			// NBM1_ZONE_T
-			lm75@28 {
+			lm75@48 {
 				compatible =3D "ti,lm75";
-				reg =3D <0x28>;
+				reg =3D <0x48>;
 			};
 		};
-		i2c-bus@6 {
+		i2c45: i2c@5 {
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
-			reg =3D <6>;
+			reg =3D <5>;
=20
 			// NBM2_ZONE_T
-			lm75@29 {
+			lm75@49 {
 				compatible =3D "ti,lm75";
-				reg =3D <0x29>;
+				reg =3D <0x49>;
 			};
 		};
+                i2c46: i2c@6 {
+                        #address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <6>;
+                       =20
+                        tla2024: tla2024@48 {
+                                compatible =3D "ti,tla2024";
+                                reg =3D <0x48>;
+				scale =3D <2>;
+				#io-channel-cells =3D <1>;
+			=09
+				channel@0 {
+					single-channel =3D <0>;
+				};
+
+				channel@2 {
+					single-channel =3D <2>;
+				};
+                        };
+                };
+                i2c47: i2c@7 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <7>;
+                };
 	};
 };
=20
 &i2c14 {
 	status =3D "okay";
+	// ADC sensors - DC
+	max34451@59 {=20
+		compatible =3D "maxim,max34440";
+		reg =3D <0X59>;
+	};
+	bmcfru@55 {
+		compatible =3D "atmel,24c64";
+		reg =3D <0x55>;
+	};
 };
=20
 &i2c15 {
 	status =3D "okay";
+
+        i2c-switch@72 {
+		compatible =3D "nxp,pca9545";
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		reg =3D <0x72>;
+		i2c-mux-idle-disconnect;
+
+                i2c48: i2c@0 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <0>;
+                };
+                i2c49: i2c@1 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <1>;
+                };
+                i2c50: i2c@2 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <2>;
+                };
+                i2c51: i2c@3 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <3>;
+                };
+        };
 };
=20
-&spi0 {
-	cs-gpios =3D <&gpio6 11 GPIO_ACTIVE_LOW>;
-	status =3D "okay";
+&gpio0  {
+                gpio-line-names =3D=20
+                /* GPIO0 */
+                "", "", "", "",=20
+                "", "", "", "",
+                "", "", "", "",=20
+                "", "RESET_BUTTON", "", "",
+                "", "", "", "",=20
+                "", "", "", "",
+                "", "", "", "",=20
+                "", "", "", "";
+};
+&gpio2  {
+                gpio-line-names =3D=20
+                /* GPIO2 */
+                "", "RESET_OUT_BUTTON", "", "",=20
+                "", "", "POWER_OUT_OFF", "",
+                "", "", "", "SHD_ACK",=20
+                "", "", "", "",
+                "", "", "", "",=20
+                "", "", "", "",
+                "", "", "", "",=20
+                "", "", "RESET_OUT", "";
+};
+&gpio6  {
+                gpio-line-names =3D=20
+                /* GPIO6 */
+                "POWER_BUTTON", "", "", "",=20
+                "", "", "", "",
+                "PS_PWROK", "", "", "POWER_OUT_ON",=20
+                "", "", "", "",
+                "", "", "", "",=20
+                "", "", "", "",
+                "", "", "", "",=20
+                "", "", "", "";
 };
=20
 &pinctrl {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <
-			&gpio61oh_pins
-			&gpio62oh_pins
-			&gpio161ol_pins
-			&gpio163i_pins
-			&gpio167ol_pins
-			&gpio95i_pins
-			&gpio65ol_pins
-			&gpio66oh_pins
-			&gpio67oh_pins
-			&gpio68ol_pins
-			&gpio69i_pins
-			&gpio70ol_pins
-			&gpio71i_pins
-			&gpio72i_pins
-			&gpio73i_pins
-			&gpio74i_pins
-			&gpio75i_pins
-			&gpio76i_pins
-			&gpio77i_pins
-			&gpio78i_pins
-			&gpio79ol_pins
-			&gpio80oh_pins
-			&gpio81i_pins
-			&gpio82i_pins
-			&gpio83i_pins
-			&gpio144i_pins
-			&gpio145i_pins
-			&gpio146i_pins
-			&gpio147oh_pins
-			&gpio168ol_pins
-			&gpio169oh_pins
-			&gpio170ol_pins
-			&gpio218oh_pins
-			&gpio37i_pins
-			&gpio38i_pins
-			&gpio39i_pins
-			&gpio40i_pins
-			&gpio121i_pins
-			&gpio122i_pins
-			&gpio123i_pins
-			&gpio124i_pins
-			&gpio125i_pins
-			&gpio126i_pins
-			&gpio127i_pins
-			&gpio136i_pins
-			&gpio137oh_pins
-			&gpio138i_pins
-			&gpio139i_pins
-			&gpio140i_pins
-			&gpio141i_pins
-			&gpio190oh_pins
-			&gpio191oh_pins
-			&gpio195ol_pins
-			&gpio196ol_pins
-			&gpio199i_pins
-			&gpio202ol_pins
-			>;
+                /* LED Pins*/
+//                &gpio7oh_pins
+                &gpio24ol_pins
+                &gpio169ol_pins
+
+                /* Mux Pins */
+		/* UART Mux*/
+                &gpio167oh_pins
+                &gpio161oh_pins
+                &gpio177oh_pins
+                &gpio198ol_pins
+
+                &gpio87oh_pins
+                &gpio88oh_pins
+                &gpio89oh_pins
+                &gpio91oh_pins
+                &gpio168oh_pins
+                &gpio12oh_pins
+                &gpio218oh_pins
+                &gpio164ol_pins
+                &gpio16oh_pins
+                &gpio84ol_pins
+                &gpio85ol_pins
+                &gpio86ol_pins
+                &gpio120ol_pins
+
+                /* Control Pins */
+                &gpio10ol_pins
+                &gpio69ol_pins
+                &gpio203ol_pins
+                &gpio70oh_pins
+                &gpio94ol_pins
+                &gpio90oh_pins
+                &gpio196ol_pins
+                &gpio197oh_pins
+                &gpio14oh_pins
+                &gpio66ol_pins
+                &gpio67ol_pins
+                &gpio125ol_pins
+                &gpio4ol_pins
+                &gpio5ol_pins
+                &gpio46ol_pins
+                &gpio187ol_pins
+                &gpio165ol_pins
+                &gpio166ol_pins
+                &gpio77oh_pins
+                &gpio170ol_pins
+                &gpio206oh_pins
+		&gpio175ol_pins
+                &gpio219oh_pins
+                &gpio15oh_pins
+                &gpio139ol_pins
+                &gpio141oh_pins
+                &gpio202ol_pins
+
+                /* Monitor Pins */
+                &gpio192i_pins
+                &gpio199i_pins
+                &gpio13i_pins
+                &gpio25i_pins
+                &gpio59i_pins
+                &gpio60i_pins
+                &gpio6i_pins
+                &gpio11i_pins
+                &gpio162i_pins
+                &gpio163i_pins
+                &gpio37i_pins
+                &gpio93i_pins
+                &gpio64i_pins
+                &gpio68i_pins
+                &gpio71i_pins
+                &gpio72i_pins
+                &gpio73i_pins
+                &gpio74i_pins
+                &gpio75i_pins
+                &gpio76i_pins
+                &gpio78i_pins
+                &gpio79i_pins
+                &gpio80i_pins
+                &gpio81i_pins
+                &gpio82i_pins
+                &gpio83i_pins
+                &gpio144i_pins
+                &gpio145i_pins
+                &gpio146i_pins
+                &gpio147i_pins
+                &gpio160i_pins
+                &gpio231i_pins
+                &gpio9i_pins
+                &gpio38i_pins
+                &gpio39i_pins
+                &gpio40i_pins
+                &gpio92i_pins
+                &gpio121i_pins
+                &gpio122i_pins
+                &gpio123i_pins
+                &gpio124i_pins
+                &gpio126i_pins
+                &gpio136i_pins
+                &gpio138i_pins
+                &gpio140i_pins
+                &gpio142i_pins
+                &gpio190i_pins
+                &gpio194i_pins
+                &gpio195i_pins
+
+                // BSP RX/TX
+		&bmcuart0a_pins /* BSP RX/TX */
+                // BU1 RX/TD
+		&bmcuart1_pins /* BU1 RX/TD */
+                // TX/RX D2
+		&uart2_pins /* TX/RX D2 */
+		// Set system reset to high
+                &gpio65oh_pins
+                &gpio127oh_pins
+		>;
 };
=20
 &gcr {
--=20
2.17.1

