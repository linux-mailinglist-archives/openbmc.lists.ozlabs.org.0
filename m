Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A7A46FA86
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 06:56:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9KsS6nHWz3c6p
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 16:56:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=i6ReUqnT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:febc::724;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=troy_lee@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=i6ReUqnT; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0724.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::724])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9Krw5Pmlz3076
 for <openbmc@lists.ozlabs.org>; Fri, 10 Dec 2021 16:55:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYNn7R2HTNbPkn8puT08hyywOvO8+qNJSgnvQTGZ4ckoj3zMbkrY/1ORUt64qviw2rCcv0OMi0iwAN9dDuLitDKmVY5eRqN6G8ZgpoPa+0KYgB17AIc3d7z/39tSKqfgERHX1uLoHog9l5WGRT9TeP3BMi/g/BJ7dSVXfCqdewFHpD3lvzfN4Gwf9fmbab5QBZfNrljNByHVVje+V0BQMKPD/1r9fOChe9aFSBxqyYiscxRFewWZg7KEgJi/MOHKXICv5V+DTBd/DpHuxSdu4Wqt16SLZl4PvFFWWohwzzCAnb+67RfYGC+RF7eDTKi3ysmINOAdIlcA9+cBYBCq6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tlzL73DPXrQFSKjLJAg3yXJ5oLd+G4mA239QWDBoJQ=;
 b=NydLgxiUzXbN39lZOWzfBFADRvM0hPsXACgA8FDwBs3oaSFy9zVXPhvQbz84vj5HsmRVyejHiNK1ICqGa2zPpG7IfVgQaPSOcIdi21irwV1RjlxivJ2ma+Ri41a7dIgN4YuykGZ7wqLYET/1yk9D0BpfGNmTur/WsPphL+KLUMi1P6SfKISoNNDmBIiddx5sdy2YSN/lHCQjJBQN4iaPmqBKEdqc5DT4j78r+cLprWiIpc8q2RSfIEVd/4l5Dzy4UGii6HyvcBubZuv1LcjTFLkPR/UA/XNpe0XQevTSCq3PV9yMQpxb0mdRUWpDzfaeuJj/d3raq7qj8bvTpkqDHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tlzL73DPXrQFSKjLJAg3yXJ5oLd+G4mA239QWDBoJQ=;
 b=i6ReUqnTZ96QNsVQ2vXJLWccMhky8CHqv6mWg9A12lGNrngrUDb5nUyXmRuUQuN43NgOc6rDTaDBzXBNo1vd1CMX7kM2Pp+IiP5KYxxbqcx2x5IHmK0DtAZqbrBTJaazMI/Aof9t8UGwRGBEufhalv0JgjdNnXkZw3zJv6LsywHlxt6sxDoXZvOnQBCVoRVQyS2TsDEyiQP0bAzht1u2idGitB6FhUuug8vPA0CsxdmTC/Ff5yYzR+dfT4tFFyc7JHer1fYbsg5Y+KSk40pAhJDwr1WtW5Cq4+E9c2IvuV1q/rqpvlWWW+lEl2/+nnMjXLpJma5ZJkycAqXosdTTjQ==
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com (2603:1096:203:4b::20)
 by HK0PR06MB2738.apcprd06.prod.outlook.com (2603:1096:203:59::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13; Fri, 10 Dec
 2021 05:55:33 +0000
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::3095:e729:9cf7:64c1]) by HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::3095:e729:9cf7:64c1%6]) with mapi id 15.20.4778.014; Fri, 10 Dec 2021
 05:55:33 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: Dhananjay Phadke <dphadke@linux.microsoft.com>, "andrew@aj.id.au"
 <andrew@aj.id.au>
Subject: RE: Security Working Group meeting - Wednesday December 8 - results
Thread-Topic: Security Working Group meeting - Wednesday December 8 - results
Thread-Index: AQHX7GfTWuXBgzBpzUytead4eN9P8awp9CyAgABzGwCAAAUlgIAAZaiAgABbOgCAAA2ZIA==
Date: Fri, 10 Dec 2021 05:55:32 +0000
Message-ID: <HK0PR06MB214566D1A94F1B93795A44A78A719@HK0PR06MB2145.apcprd06.prod.outlook.com>
References: <df30fbcd-870a-4d9e-9377-80c0b1a9c3ca@www.fastmail.com>
 <1639112518-8080-1-git-send-email-dphadke@linux.microsoft.com>
In-Reply-To: <1639112518-8080-1-git-send-email-dphadke@linux.microsoft.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9c7b622-c789-410b-588a-08d9bba1add4
x-ms-traffictypediagnostic: HK0PR06MB2738:EE_
x-microsoft-antispam-prvs: <HK0PR06MB2738E99D8EB361E19848F53A8A719@HK0PR06MB2738.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HCWIrKZfPPf8est6b1gTLf/euHwj6JmuqVIwlsopXT61nbRdciKrDNhMfAs9BJJNO7NBipyuo7Jonma644CT1CiJTuYhwfu3kSCPNBzlGY9YHf1202/J/2vi2bifAXHO83FKNBhPSa/XbkjvTc9mkPVxj1S3/7Ztkx2Hrem4jHL/AFCElNawRL3L2F/1qWvM7OY+3xGrrSEQeOeMzmJzmKDUZdKihkN80emT6Vi61Dcuf6IYgh/2GEIddI8+XCWpXrDWwet4PBFsxALpGTLeDPj80D3r+Bs6ygw8QUZ6blKOkiatq/Ei+Ckvh1g3rmasvOJxaaFldT3aRVYpc0eGbXCs119dIdHLlVSEKy7StBAMctFB6FfgfdLvoiU0EYkJlDAHm1ZpD6asW/zAjrZOAs9H8ZEqmSJw/jgxauOSE0/gOODeBCPavO1b60JHG73KT7+igdrIePqaIacMbohOq214FQVpFAqvGW2qlvJ/bTMcFFpwa13rjQ1A2MM9EFzQgMVtnuJ1+Ft2JP197WO7HDOqlN6gKLXADhpaa/VLv+v+OepB+0YipYd+RdZqkcEF+wS3yAmUJ0sYD6AhD8jjVyrzwSmwYlHH8DhJVDnmRFHjIBV7wpNQVgDPGEsHI1qdBg2ajJF29G6lsKHAwv0+wgSXmrGmcgRfwtBFg9hFr4t8onff0vQs/ZYCrOEHWMrPLlSaYcBawdtUDaJ3ycVopyfU7VPaCTDFlI1WBssvzzx4oxXIYrOiqhHZ/Iw/uPJKRWS/icHxEiy0g/wZvdo9ZJdM8kLKBPSwySX5/WIwUvXYRu9z6Lr+UdqpNBtyZna2Ysaj0Q7RHdgPX1xBWOxaPg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2145.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39840400004)(346002)(366004)(376002)(4326008)(54906003)(5660300002)(110136005)(508600001)(71200400001)(7696005)(26005)(52536014)(122000001)(966005)(6506007)(38100700002)(55016003)(66476007)(66556008)(66446008)(64756008)(9686003)(66946007)(86362001)(186003)(8676002)(8936002)(38070700005)(76116006)(2906002)(316002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?04qCpotFqPD2lgR3RzBchF84iRNqpRNRhzinBB1V2m778vhxbuiM25KI9REa?=
 =?us-ascii?Q?59Bjtua+9dcl1w79GFbTb8wPeBpuIDldAjfMnE9rUzv7Hymf1N+6Of2UKkw/?=
 =?us-ascii?Q?mn3S8eSfbYCXDghC1gMNmxsrxXMgwA8IGhL98ZWNYu1tZhy7WDaphPPK4xb3?=
 =?us-ascii?Q?K06lFEygySIHDzI5wKeeCvk8cPVCgKnlX8f4JJ3wF86VhP6k42k9pAe4vxPa?=
 =?us-ascii?Q?64D9UNhbaPe/nFPKmrPkr2Wz01VhZTNUYmWv+K46PVOvF0G5tWqflASoJj6n?=
 =?us-ascii?Q?oHpHqIfj5N3T4rFw6zowNtHXSsQs9IcwIH7mfOkU7iytUN6eqbTmnPY3WMl2?=
 =?us-ascii?Q?bcI1YWxpyago3lrbhMu6rDE/KHjJuuPGppiNGMEqISBnPs5IdNEPTe2vF3cL?=
 =?us-ascii?Q?sV88dcHUkrovuRWfCD8A0TWX2aFr7k0kpf1p2LuvP4SgwETaHfgp2EpTp7FM?=
 =?us-ascii?Q?EM6Noz8uMMZulZnopcBj6CBFKpLLsZDzsmNMKWhl5vHogP8ZHUmYHQAykqRe?=
 =?us-ascii?Q?Ruygo+9guAdcEaVKyw5cPGCWp6f4cABDNqfRNuXGXF97prGWcSpzoTHeJads?=
 =?us-ascii?Q?WaG//UnOZRXolwZTGmIdffKJpGUWaU84zQhuUWmKZZoTjQJUU2SiQ6ASXUj3?=
 =?us-ascii?Q?X4gg7rGSh5RRPH831eDqzQH2V8LHA3qrz23Ibi3O8602qEFTqk7mM1GqvOcM?=
 =?us-ascii?Q?AK7j7kMWN872LbTGSZwUY7caFLWSMZeHh7grStT7XNSDRAZE5NfS5P6W7FjC?=
 =?us-ascii?Q?w6fUYHbZv1fVHKgzqkAQ5/rR5NynWECBfi1U8Cw/dPSGCSakkxVPpS7jSSfe?=
 =?us-ascii?Q?txL+Hy2BEehGPzrktrO83cJxbkfxdMdYNpfy5HmCMd/TKLD1PMAVmm0ZEtVH?=
 =?us-ascii?Q?PsxdLYamztfFOEze8DGMKxqsbd2pJg14eAH3Od03C/z2M3wutrvcvnwpMGD5?=
 =?us-ascii?Q?sa8lV0AtWspbQC5RW4LNRPXF7QebNR5fthCwGSm4h+4yZMNOkaTgX1sdAMoI?=
 =?us-ascii?Q?6zpEmw7HgNXuT5I2oYFCshoShBQGsrJCKzq48jlZl0x1FpUQvpYuyc6MBzbk?=
 =?us-ascii?Q?fiJTRhxGp/pIX/MCj0ukli3Bs/OT00gTdNzHIf0vBa6bAHzk/EIcaMEBx5bU?=
 =?us-ascii?Q?6Cd7DnTFJowgBkx8oIPpmSFX95GyVI2IYioyxOspvq9zyef7jwljGeL51BNU?=
 =?us-ascii?Q?ewbZv53/MYNSSjQtZpwTZSWTMDsN+JeSJJjb92YCYUNRG3O+TXbOOnLOM+KM?=
 =?us-ascii?Q?mBsuerycl/Iozs5e5sy0rv/6DCNyHzk5lZv4APp6LASVoqq0QpjhyIlwCmL6?=
 =?us-ascii?Q?HK54fsBd/3vyYVj2tb95hz4M0fKx/HAG5ZvRSkCKiZlEJbMM2ewQ5E7NvKPQ?=
 =?us-ascii?Q?Bt6XFEMacqBmGqGsQxhzpIPALW9bmKjZaxGwaQvQvifP0sxuIkfCzOm32ngO?=
 =?us-ascii?Q?PhnWLhr7FJHfNGYxiOTQpUFIh/oA7pD6s6YWFU8/0lW6qfRJb3kpbsqCJcmE?=
 =?us-ascii?Q?0yModdQLBLZeEML02A8OPu5awQnF9d4wdJfTok7XL+I0VxoBZKjoh8rUW9ds?=
 =?us-ascii?Q?Q+z3annkHDM4Dy+aPRhKbl8u09n8fw5QOmqoEMyflJHxP0imaqGGMZJ4wAdG?=
 =?us-ascii?Q?0+N0D7XYLV5CrfUgDVdHGC0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2145.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c7b622-c789-410b-588a-08d9bba1add4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2021 05:55:32.9514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DWPdqFUowb304FEstshDNWzLE97KSVGTyK6vTqzcVq4v27dOsnPI1vV79dLGRUofcXbbbCgYzXZhB37D6EVq4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2738
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "jrey@linux.ibm.com" <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Dhananjay and Andrew,

> On Fri, 10 Dec 2021, Andrew Jeffery wrote:
>=20
> > There's not much documentation as yet. p10bmc can be used as an
> > example of a system that enables it.
> >
> >
> https://github.com/openbmc/openbmc/blob/ade3e145ead0beedad181394f
> caa63
> > 856176bdee/meta-ibm/conf/machine/p10bmc.conf#L39-L56
> >
> > Given the lack of documentation it's probably also reviewing these
> > patches in the context of the configuration above:
> >
> > https://gerrit.openbmc-project.xyz/q/topic:%22secure-boot%22+(status:o
> > pen%20OR%20status:merged)
>=20
> Thank you for the pointer, I'll comments there.
>=20
> >> Need clarity regarding OTP programming.
> >> (1) There's Linux tool
> >
> > I assume this refers to socsec? The socsec repo provides two tools:
> > `socsec` and `otptool`. `otptool` can be used to generate the OTP
> > image and exercise signature validity.
> >
> > https://github.com/AspeedTech-BMC/socsec/
>=20
> Yes, I was referring to these tools, socsec-sign.bbclass seems to cover t=
he
> workflow I was looking for.
>=20
> >
> >> and U-Boot patches floating somewhere.
> >
> > I'm not sure what patches you're referring to here, can you clarify?
>=20
> https://github.com/AspeedTech-BMC/u-boot/commits/aspeed-master-
> v2019.04
>=20
> cmd/otp.c has more changes compared to openbmc/u-boot.
>=20
> >
> >> (2) Any specific OTP straps preferred by OpenBMC, e.g. enabling alt
> >> boot (ABR).
> >
> > There's no real preference. My intent is to add a recipe that can
> > consume a platform-specific otptool json config and spit out the OTP
> > binary as a build artefact. Currently I just have the config captured
> > in a separate repo internally and I generate binaries from that using
> > make.
>=20
> This is useful, having readable config and letting platform select behavi=
or
> such as alternate image in same SPI or alternate, etc.

We have the recipe to generate otp-image with OpenBMC building
process and is working on upstreaming it into OpenBMC.
Could you help to review the recipe once we submit it into gerrit?

>=20
> Regards,
> Dhananjay

Thanks,
Troy Lee
