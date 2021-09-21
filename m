Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA8E412D26
	for <lists+openbmc@lfdr.de>; Tue, 21 Sep 2021 04:57:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HD5gX5Gjrz2yJG
	for <lists+openbmc@lfdr.de>; Tue, 21 Sep 2021 12:57:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=IZX69Y4b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=08983686e5=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=IZX69Y4b; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HD5g053P6z2xv2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Sep 2021 12:56:42 +1000 (AEST)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18L0veRK016092; 
 Tue, 21 Sep 2021 02:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=kEJxmgy2g0u+JHPwlkfi7fSKRAkXOuWIy/fi3wMYt00=;
 b=IZX69Y4bS3sHfZxr8Q+mkrXa+qLsCjr6xXOLJOpwBD3CwvD2ZozRVAKX22dF9qTs5W4/
 Zky19hPXg/siJsfqi8QeJcFkrhwev/qPDDBAOQf8ar7Kffmnep4oWwCSrhteT0fWm4t0
 KprhW+SDzexaPxHgQuCEmnqo6aPF9X2mssufpeCPXgakfJZckNqumPCs+j+NtZxAhqmH
 tki0naVn5TlJIyPEUadd1wrzfhS9ysZPIdgh6OQF8XzZt/o2HIWVBP7uOpjQp4a0oa2A
 NeSFr7/XOCNKtJy/jL512X77UTraZhxUPBj2zm31Lv+mehpYJ50+1h7mvYUnfG4VEF8Y Tg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by mx0b-00268f01.pphosted.com with ESMTP id 3b75adr90d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 02:56:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipk2XPZoj3nB+t6SWffSCCjzUnz/BkNzTFvqRzhNlS9SB1m/1k/fVCuWoeU2UckUQSNxurSfYPvSk7BooYfYsokWvtpnvL/5QBhADRwIp+S20nERllF2tZKXObsg/SgnvmmAmK2+szEiFGzWx6fFx1HA1wmFsy0i7yHRVMAur7fPWd3mc2E9B+x4O1gfZ3ZAqH0KCMMGoU5rD6IGuV3Glt/gMvWxiV4l0kixkOPJ/ppaACxVkAPv5fT8Ee3HszxJ5Kiv5rbq3ZItSm4KprRS/vskYiLUCUCcVVf9eE5w2WbRIQlRI1i6w3W1hv0pMPvUYqNj3Te8BlgLtWacYYdGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=kEJxmgy2g0u+JHPwlkfi7fSKRAkXOuWIy/fi3wMYt00=;
 b=K/XX9jkvo2F+ou9AO3NOK5QoKhwUvzVWMrgBYlrUDjDq7xnCa86WNVs5385bGKY2boNxv9FUc0keFZI596tLEKf3xmqwsT54kPY9znoO9v3OkUAvShN4t/lAlV93EZAYGuWgxdrfihof3Od2Y4+g75unmaUMm0AfV99VJaYT85BFX6Zk5vp2Jeo1oKMnUN18OOj2TOk5WnCdlPMxhIC6ZH6liAoroN2AcO0lr6JtpanHU8e3AycOh37/kuxP4UTUNLnYpTbWAVxXfIe8QRypZ4Dg1skJOxGIUF6XwTArAI/IePzQfzmQPRIYQUoDRAROAmLQ2XrL5Xv6Rrreb73Qig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7765.namprd04.prod.outlook.com (2603:10b6:8:36::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 02:56:28 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0%6]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 02:56:28 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH RFC] Specifying default-disabled devices
Thread-Topic: [PATCH RFC] Specifying default-disabled devices
Thread-Index: AQHXpo8qZtITUnASC0CJomxE9mdra6ut22yA
Date: Tue, 21 Sep 2021 02:56:28 +0000
Message-ID: <20210921025627.GN17315@packtop>
References: <20210910022433.GD17315@packtop>
 <71375410db4f03bd19c820f97f3a23418b56ecc0.camel@codeconstruct.com.au>
 <20210910034958.GE17315@packtop>
 <1df72fd584f9c54544f9d5fafcd6232e3079ee49.camel@codeconstruct.com.au>
 <20210910052835.GF17315@packtop>
 <857e71679c7d1a421f6cc50896ac7927fe49cd74.camel@codeconstruct.com.au>
 <20210910083542.GH17315@packtop>
 <a2c3598e977a6283a9e65f3f29a74fe55d12ca20.camel@codeconstruct.com.au>
 <20210910215945.GI17315@packtop>
In-Reply-To: <20210910215945.GI17315@packtop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeconstruct.com.au; dkim=none (message not signed)
 header.d=none;codeconstruct.com.au; dmarc=none action=none
 header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1305403d-3ecb-4266-ffd5-08d97cab6855
x-ms-traffictypediagnostic: DM8PR04MB7765:
x-microsoft-antispam-prvs: <DM8PR04MB776582B35DF28F1F544CB171C3A19@DM8PR04MB7765.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nWV21MDUFYdOF2wWk0dx5mzwsor6Idm+28rqbWiViGzjoAyDgh8AWcXD6zbUfMvNAPrqeX86Gi5wF9fHVptB3jOewbCm2TfCGc4bzcXGfvlIaPtUdQ3l3soRMPWpoJyJ0ia/EXuPdjx1+dMPp9oG6yeRC9N/WDTnAb8nblYWpSd5WktDMbsfH27L5Wv8FQz5qTdjdZxmIk7YCDgS6nQb3RJ4oi8dqSCppxcCvNxAOe2pvmX/iWLUZfeKx9unxMdUDbaK6j2AGnTXb753Qauicxu3eCb1jQuQx7uK2sD6/43i+qYF08se/JLbIdzjOrowXaterL7xXLIfHokNyeQIzmKagjFqkEqxuLoaRA68aMlSOwoToDSncY3bJwZ6g7Mtf2HqLzT/bxgDBGhR6USffjj2m6OrgnTFD1LzBNZ+RWpC8oww2kBXF1oubajKAwmDidvQTu/Xix3Wevb44w5PlSTk6zjAH09uClA3Av6gVc/+Jo5Y+mIqGOXXa5iZ8TPLyHhiei9BFXDamsuNcfJyO5Qdv6Xzurw37/lf9XpVFiDqdurAGz4N01m4GdizRgtO7fBlEwBHNw7aTsO5UBfY7GBnOTkc8kQpdOWMXpiyJ5p4IHZxcHsNFib9BXhuo0s/YvIC8/r0SR6cuegUBcH+4beaf74SgcvS+5yygTsgmKVt31RXXsiR8764RF5d4Yn9SB+6mVgLigMEnSEwNxgDGA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(8676002)(122000001)(76116006)(4326008)(66946007)(91956017)(508600001)(33716001)(33656002)(66446008)(64756008)(53546011)(66476007)(6916009)(186003)(6486002)(2906002)(26005)(86362001)(316002)(54906003)(8936002)(6512007)(9686003)(5660300002)(38100700002)(6506007)(71200400001)(83380400001)(66556008)(38070700005)(1076003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sOWv7XCqFUpYodq/6ENOvEk1sqgCnOVdV1tBF18Jw0DOsrsBoG86JZ4ewE?=
 =?iso-8859-1?Q?i1+PixbHbC2SuS2byiyjgfjv3yv/aZssDZ6O2euUL1f+R+0o1KxuikYynq?=
 =?iso-8859-1?Q?i7EFKS81BRfwOijuZ0L4AlykVd4BWf+qow9yhsN4TiMtvDbZ/xM0MicRqB?=
 =?iso-8859-1?Q?BWMfCMS4GXOe1JJa6TYawvRVUi0pKpe6tAf+tslUXUAhH3fxxLc50YQrK/?=
 =?iso-8859-1?Q?lQGQPrt9gBLPj4oRuXhvuNSxH6uvD6pzkcXNJD9yVtw/uPGRQN4PsOI/ky?=
 =?iso-8859-1?Q?wGN/BuAbf2a/mXTq+84umu4ZCR71pyFtS714Hpqzo4hSTAtgR+m7cxmwo3?=
 =?iso-8859-1?Q?6lYQkGOIuY1N+w/pkpR8pU7ZvGhKcuTWqVxOwY6z/In0iL29MPUOqsi1P3?=
 =?iso-8859-1?Q?GBLn58D/zMlcXajhMcWGGAqboakrHANvINYJsYrctIRrbMDTPdI2yqpbrq?=
 =?iso-8859-1?Q?n5Yhtz+rsSktVZBwXoiD/mmOubhgKhxBe5B+op9qwUpHilq4JE2CeXLfzT?=
 =?iso-8859-1?Q?vtyS5zPIgitjRUYi5HcxO16co8tr5SdWPUN7v9xY1gnlNhEr/sbMaQB3SA?=
 =?iso-8859-1?Q?AmIcx+tuZaxdsIGGJxXwsocVyA2RjzDHGeniTmmSDLCH9RlRMxEZ95iFCT?=
 =?iso-8859-1?Q?h2336c2PNzjo9/BQTYIInP+YWCyRHPJYWVxoHmzuYI70d71tITYEEztUnp?=
 =?iso-8859-1?Q?sJNSSdH8t+o2UtJdGc6FX7UyQLiI6nCbwIUvDKShT2RnTaTo0mJy7nU+Ok?=
 =?iso-8859-1?Q?bcrByhGOqnBB3aQM2phJJneafGXFrm+A/paBlPZFUxzIzaV8t5WcpB9kiA?=
 =?iso-8859-1?Q?h4iKt46kxPj6LZ9tZSxBKgL6iFzSqcPPPdu/M5aLurDQzX268ReVRSlx/L?=
 =?iso-8859-1?Q?Kmw8AwgO3U3xPQIB/oZ3NZhf5FYGRpxbOhY5Lm8G9CzPKaaaORNamyC1am?=
 =?iso-8859-1?Q?/K0jlC0QW2T6dULxXnaoVD35tTRAwMT425KkJjvIEkjcvGlutBOzte8L+/?=
 =?iso-8859-1?Q?+XNh3ag4hM+zC3cOM0w1m5rLOA798F14Kxy8GMI9fPmtVYPRJKgqKsyDHt?=
 =?iso-8859-1?Q?wlDztN9nbWi+ZhOs4EACeYQ+TKWxrKXgYBOtdk2SeidptPxjYGW3ebC1U7?=
 =?iso-8859-1?Q?/cp1skjlg3LoH9bDIftY7UN4fje+HUbZ4+ntIjSliNH4uUVaVayogA6ycK?=
 =?iso-8859-1?Q?M/+ecLUoXqA1hNMry1kV+HG1qoQpbgLiKwZo2X/h3r9DvAXFqZEQO1KQQM?=
 =?iso-8859-1?Q?rGHaU00yDw+hRYJVX5U8cBUVSwwjIYPgvsOwYKJ1GRTvDDOgL8VlMTnvF2?=
 =?iso-8859-1?Q?582qzKZPg0TzYcMaT5XSQktvc7Fc096l9hhTdM4x4KL5eHOLTdiVkiehL3?=
 =?iso-8859-1?Q?oPO7sATQaS?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <74373ED72D040C4B8B2773DFF3F45A31@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1305403d-3ecb-4266-ffd5-08d97cab6855
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2021 02:56:28.0667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GUnH75OX5vO41WTBsumkOvesMUbgFlhddxafYr8f1OgjAOb6rt+NwFYMfhahB+aTFSUZcM6T+5qVPxrEldRSfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7765
X-Proofpoint-ORIG-GUID: D-SWk9Zubv2RQy7mLu8631Ne9_lwwsu2
X-Proofpoint-GUID: D-SWk9Zubv2RQy7mLu8631Ne9_lwwsu2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_11,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 clxscore=1015 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109210016
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 10, 2021 at 02:59:45PM PDT, Zev Weiss wrote:
>>>Well, I'm aiming to be able to use a dts fragment looking something
>>>like (on an ast2500):
>>>
>>>=A0 &spi1 {
>>>=A0=A0=A0=A0=A0=A0=A0=A0status =3D "reserved";
>>>=A0=A0=A0=A0=A0=A0=A0=A0pinctrl-names =3D "default";
>>>=A0=A0=A0=A0=A0=A0=A0=A0pinctrl-0 =3D <&pinctrl_spi1_default>;
>>>=A0=A0=A0=A0=A0=A0=A0=A0flash@0 {
>>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0status =3D "okay";
>>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0label =3D "bios";
>>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0m25p,fast-read;
>>>=A0=A0=A0=A0=A0=A0=A0=A0};
>>>=A0 };
>>
>>[do you want just the flash node to be reserved, or the entire
>>controller? I assume the controller is always available...]
>>
>
>The flash node would make more sense, but thus far with my noautobind
>argument I've been doing it at the spi1 controller level because I don't
>know of a way to do the runtime attach/detach of individual flash
>devices behind the controller (the analog of doing the driver bind via
>sysfs), and from a glance at the aspeed-smc driver it doesn't look like
>there is one (the aspeed_smc_setup_flash() call in the controller's
>probe path seems to be the only path to instantiating any child
>devices).
>

Pursuing this angle a bit, however, I now have the below patch which
enables attaching & detaching individual flash chips behind an
aspeed-smc controller at runtime (via sysfs).

This has the downside of burying 'status =3D "reserved"' support in a
piece of somewhat niche functionality in one specific driver, rather
than for DT devices in general (though after investigating a bit, it
looks like even adding driver-core support would only cover devices that
get drivers bound, e.g. the aspeed-smc controller itself, and not any
child devices further down the tree, like individual flash chips).

That aside though, this seems to solve my problem in a fairly clean,
non-invasive manner that shouldn't cause any compatibility problems
elsewhere, which is appealing...a viable approach perhaps?


Zev

From b17ad478b9d2e8357461412f9d5d734a8ad8df0b Mon Sep 17 00:00:00 2001
From: Zev Weiss <zev@bewilderbeest.net>
Date: Fri, 17 Sep 2021 17:03:18 -0500
Subject: [PATCH] mtd: spi-nor: aspeed: make flash chips runtime
 attachable/detachable

There are now two new sysfs attributes, attach_chip and detach_chip,
into which a chip select number can be written to attach or detach the
corresponding chip.  Chips marked with a DT status of "reserved" are
left detached initially and can be attached on demand by userspace via
attach_chip.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/mtd/spi-nor/controllers/aspeed-smc.c | 166 +++++++++++++++----
 1 file changed, 138 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi=
-nor/controllers/aspeed-smc.c
index c421fad4b3f5..db7cc8d2f4d0 100644
--- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
@@ -190,6 +190,7 @@ struct aspeed_smc_controller;
=20
 struct aspeed_smc_chip {
 	int cs;
+	bool attached;
 	struct aspeed_smc_controller *controller;
 	void __iomem *ctl;			/* control register */
 	void __iomem *ahb_base;			/* base of chip window */
@@ -207,12 +208,13 @@ struct aspeed_smc_controller {
 	const struct aspeed_smc_info *info;	/* type info of controller */
 	void __iomem *regs;			/* controller registers */
 	void __iomem *ahb_base;			/* per-chip window resource */
+	struct resource *ahb_res;		/* resource for AHB address space */
 	u32 ahb_base_phy;			/* phys addr of AHB window  */
 	u32 ahb_window_size;			/* full mapping window size */
=20
 	unsigned long	clk_frequency;
=20
-	struct aspeed_smc_chip *chips[];	/* pointers to attached chips */
+	struct aspeed_smc_chip *chips[];	/* pointers to connected chips */
 };
=20
 #define ASPEED_SPI_DEFAULT_FREQ		50000000
@@ -619,15 +621,27 @@ static ssize_t aspeed_smc_read(struct spi_nor *nor, l=
off_t from, size_t len,
 	return len;
 }
=20
+static int aspeed_smc_unregister_chip(struct aspeed_smc_chip *chip)
+{
+	int ret =3D mtd_device_unregister(&chip->nor.mtd);
+	if (!ret)
+		chip->attached =3D false;
+	return ret;
+}
+
 static int aspeed_smc_unregister(struct aspeed_smc_controller *controller)
 {
 	struct aspeed_smc_chip *chip;
-	int n;
+	int n, ret;
=20
 	for (n =3D 0; n < controller->info->nce; n++) {
 		chip =3D controller->chips[n];
-		if (chip)
-			mtd_device_unregister(&chip->nor.mtd);
+		if (chip && chip->attached) {
+			ret =3D aspeed_smc_unregister_chip(chip);
+			if (ret)
+				dev_warn(controller->dev, "failed to unregister CS%d: %d\n",
+				         n, ret);
+		}
 	}
=20
 	return 0;
@@ -1232,25 +1246,57 @@ static const struct spi_nor_controller_ops aspeed_s=
mc_controller_ops =3D {
 	.write =3D aspeed_smc_write_user,
 };
=20
-static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller=
,
-				  struct device_node *np, struct resource *r)
+static int aspeed_smc_register_chip(struct aspeed_smc_chip *chip)
 {
-	const struct spi_nor_hwcaps hwcaps =3D {
+	static const struct spi_nor_hwcaps hwcaps =3D {
 		.mask =3D SNOR_HWCAPS_READ |
 			SNOR_HWCAPS_READ_FAST |
 			SNOR_HWCAPS_READ_1_1_2 |
 			SNOR_HWCAPS_PP,
 	};
+	int ret;
+
+	ret =3D aspeed_smc_chip_setup_init(chip, chip->controller->ahb_res);
+	if (ret)
+		return ret;
+
+	/*
+	 * TODO: Add support for Dual and Quad SPI protocols attach when board
+	 * support is present as determined by of property.
+	 */
+	ret =3D spi_nor_scan(&chip->nor, NULL, &hwcaps);
+	if (ret)
+		return ret;
+
+	ret =3D aspeed_smc_chip_setup_finish(chip);
+	if (ret)
+		return ret;
+
+	ret =3D mtd_device_register(&chip->nor.mtd, NULL, 0);
+	if (ret)
+		return ret;
+
+	chip->attached =3D true;
+
+	return 0;
+}
+
+static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller=
,
+				  struct device_node *np, struct resource *r)
+{
 	const struct aspeed_smc_info *info =3D controller->info;
 	struct device *dev =3D controller->dev;
 	struct device_node *child;
 	unsigned int cs;
 	int ret =3D -ENODEV;
=20
-	for_each_available_child_of_node(np, child) {
+	for_each_child_of_node(np, child) {
 		struct aspeed_smc_chip *chip;
 		struct spi_nor *nor;
-		struct mtd_info *mtd;
+
+		/* Skip disabled nodes, but include reserved ones for later attachment *=
/
+		if (!of_device_is_available(child) && !of_device_is_reserved(child))
+			continue;
=20
 		/* This driver does not support NAND or NOR flash devices. */
 		if (!of_device_is_compatible(child, "jedec,spi-nor"))
@@ -1294,35 +1340,20 @@ static int aspeed_smc_setup_flash(struct aspeed_smc=
_controller *controller,
 		chip->cs =3D cs;
=20
 		nor =3D &chip->nor;
-		mtd =3D &nor->mtd;
=20
 		nor->dev =3D dev;
 		nor->priv =3D chip;
 		spi_nor_set_flash_node(nor, child);
 		nor->controller_ops =3D &aspeed_smc_controller_ops;
=20
-		ret =3D aspeed_smc_chip_setup_init(chip, r);
-		if (ret)
-			break;
-
-		/*
-		 * TODO: Add support for Dual and Quad SPI protocols
-		 * attach when board support is present as determined
-		 * by of property.
-		 */
-		ret =3D spi_nor_scan(nor, NULL, &hwcaps);
-		if (ret)
-			break;
+		controller->chips[cs] =3D chip;
=20
-		ret =3D aspeed_smc_chip_setup_finish(chip);
-		if (ret)
-			break;
+		if (of_device_is_reserved(child))
+			continue;
=20
-		ret =3D mtd_device_register(mtd, NULL, 0);
+		ret =3D aspeed_smc_register_chip(chip);
 		if (ret)
 			break;
-
-		controller->chips[cs] =3D chip;
 	}
=20
 	if (ret) {
@@ -1333,6 +1364,78 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_=
controller *controller,
 	return ret;
 }
=20
+static inline struct aspeed_smc_controller *to_aspeed_smc_controller(struc=
t device *dev)
+{
+	struct platform_device *pdev =3D container_of(dev, struct platform_device=
, dev);
+	return platform_get_drvdata(pdev);
+}
+
+static ssize_t attach_chip_store(struct device *dev, struct device_attribu=
te *attr,
+                                 const char *buf, size_t count)
+{
+	unsigned long cs;
+	struct aspeed_smc_controller *controller;
+	struct aspeed_smc_chip *chip;
+	ssize_t ret =3D kstrtoul(buf, 0, &cs);
+	if (ret)
+		return ret;
+
+	controller =3D to_aspeed_smc_controller(dev);
+	if (cs >=3D controller->info->nce)
+		return -EINVAL;
+
+	chip =3D controller->chips[cs];
+
+	if (!chip)
+		return -ENODEV;
+
+	if (chip->attached)
+		return -EEXIST;
+
+	ret =3D aspeed_smc_register_chip(chip);
+
+	return ret ? ret : count;
+}
+static DEVICE_ATTR_WO(attach_chip);
+
+static ssize_t detach_chip_store(struct device *dev, struct device_attribu=
te *attr,
+                                 const char *buf, size_t count)
+{
+	unsigned long cs;
+	struct aspeed_smc_controller *controller;
+	struct aspeed_smc_chip *chip;
+	ssize_t ret =3D kstrtoul(buf, 0, &cs);
+	if (ret)
+		return ret;
+
+	controller =3D to_aspeed_smc_controller(dev);
+	if (cs >=3D controller->info->nce)
+		return -EINVAL;
+
+	chip =3D controller->chips[cs];
+
+	if (!chip)
+		return -ENODEV;
+
+	if (!chip->attached)
+		return -ENOENT;
+
+	ret =3D aspeed_smc_unregister_chip(chip);
+
+	return ret ? ret : count;
+}
+static DEVICE_ATTR_WO(detach_chip);
+
+static struct attribute *aspeed_smc_sysfs_attrs[] =3D {
+	&dev_attr_attach_chip.attr,
+	&dev_attr_detach_chip.attr,
+	NULL,
+};
+
+static const struct attribute_group aspeed_smc_sysfs_attr_group =3D {
+	.attrs =3D aspeed_smc_sysfs_attrs,
+};
+
 static int aspeed_smc_probe(struct platform_device *pdev)
 {
 	struct device_node *np =3D pdev->dev.of_node;
@@ -1357,6 +1460,12 @@ static int aspeed_smc_probe(struct platform_device *=
pdev)
 	controller->info =3D info;
 	controller->dev =3D dev;
=20
+	ret =3D devm_device_add_group(dev, &aspeed_smc_sysfs_attr_group);
+	if (ret) {
+		dev_err(dev, "Failed to create sysfs files\n");
+		return ret;
+	}
+
 	mutex_init(&controller->mutex);
 	platform_set_drvdata(pdev, controller);
=20
@@ -1366,6 +1475,7 @@ static int aspeed_smc_probe(struct platform_device *p=
dev)
 		return PTR_ERR(controller->regs);
=20
 	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	controller->ahb_res =3D res;
 	controller->ahb_base_phy =3D res->start;
 	controller->ahb_base =3D devm_ioremap_resource(dev, res);
 	if (IS_ERR(controller->ahb_base))
--=20
2.33.0

