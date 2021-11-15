Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9F0452627
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 03:00:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtTm427qkz2xrl
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 13:00:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fii-usa.com header.i=@fii-usa.com header.a=rsa-sha256 header.s=selector1 header.b=J/o1Qrd/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-usa.com (client-ip=40.107.236.64;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=charles.boyer@fii-usa.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fii-usa.com header.i=@fii-usa.com header.a=rsa-sha256
 header.s=selector1 header.b=J/o1Qrd/; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtQDb3sc5z2xtK
 for <openbmc@lists.ozlabs.org>; Tue, 16 Nov 2021 10:21:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EN1B/wJv6VkQvZw6pjYjzkc64FF4tHqSPCMAjGdfk5nmScj6at+DkPuT3nA8h5OhWt3/l0idoMCUZkGRJM489+1rBtct54bDic4Y6ZwI4hwinvcKC6szTU2DuE+OUbsonCYVi15Q92VSVSunN4RFM9Qbe0RnXhfddLgIuwsavNhfTLvIP5+XzOzFXEXfxIx72doNM3o6IKmRal4tn1bJWpoQzs9mVWAygf8N7YfSrna3tE06TOlT3gl+x9jfQZoIp9k3U84ik0yE4wZ3R0CUOLzAQ4MwWxKqSLeiuHTzzly7xExGI7nYZ87I5sl0XLCvvO/jdMg9OAg5DbWRiaTN9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OCSlu22Sdq/Zzugj9S/t3bNmN89ecEuJ3pYbtH71Hk=;
 b=BIXHSQ6pd+TrMcF/dAjCeuLn+C6sN8bJEVCgo4uGrBXrK5lxXoZOWJGj4U/WSuuZdedlGl4Ai/Dh1J67mrqExeGcRlCHRx4Gpxoz2TKi/GmjKjxs8wvvS0PPpzO+xPVxLHZqH59nD6elsSKRLiItI26erzzUKkTZEIR0VPME3zEYrI09J8Fgp3QXuHvjglqtaglonHclnY13fopb3IGutPUOsGhY6HltuT0bPzs45ky1Wv93fFaBB/tME47QYwKu5dHmq+tqp+Bx84HF3QC7MT2u6JSU2RNhUEd880DgT2+s1WyfLLYTXPZgFfSN3szh99sAMtMNIa9eO9a2YxGTBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-usa.com; dmarc=pass action=none header.from=fii-usa.com;
 dkim=pass header.d=fii-usa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fii-usa.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OCSlu22Sdq/Zzugj9S/t3bNmN89ecEuJ3pYbtH71Hk=;
 b=J/o1Qrd/IZ0qZPyjXtpIyzQJjfHCaDB2IvBLuc/+E/LFjakIgxkMfT9oYW1YAO1L5r7/nKy1RpiOOxrt/OaXmOBTVoQ0rKinBCX135IeYFI6nG70K3AkdnvCTqv7C2sTvrRtF9hhleKdhIDSU0Hv8Hpx+EIhwHy68jukY7bWocN3djOofXXGwFQspvzVnKCAYd9/jmILSn92SH87C/nYENiVYjP6RBcC0pNpKU4i845wXOCxBfDy/S2oSYyLlFz0tohgwSr/GgiNL+a8cUtpsgvgnpmOw3p9Tn+mpWyIfPSEKodrKrJlTRtMIJXZxN4sYDY9DDO1GWailnT7tFa5qQ==
Received: from SN6PR08MB4032.namprd08.prod.outlook.com (2603:10b6:805:22::29)
 by SN6PR08MB4304.namprd08.prod.outlook.com (2603:10b6:805:38::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Mon, 15 Nov
 2021 23:20:57 +0000
Received: from SN6PR08MB4032.namprd08.prod.outlook.com
 ([fe80::14fd:68c0:a776:ea4c]) by SN6PR08MB4032.namprd08.prod.outlook.com
 ([fe80::14fd:68c0:a776:ea4c%4]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 23:20:56 +0000
From: Charles Boyer <Charles.Boyer@fii-usa.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: phosphor-pid-control: PWM not changing back from Manual to Auto mode
Thread-Topic: phosphor-pid-control: PWM not changing back from Manual to Auto
 mode
Thread-Index: AQHX2mHyL6t5qy7NnUSS9zVLNPHKBw==
Date: Mon, 15 Nov 2021 23:20:56 +0000
Message-ID: <SN6PR08MB40321BF3F391E7CFDEEBC2C4B6989@SN6PR08MB4032.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: a03bda79-c5bb-9561-82c5-6444925daf9b
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fii-usa.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f355ac9-bf67-4b61-261b-08d9a88e93c9
x-ms-traffictypediagnostic: SN6PR08MB4304:
x-microsoft-antispam-prvs: <SN6PR08MB4304197769ACEEAB605BB66EB6989@SN6PR08MB4304.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KaSrt+Y15ja/f/5u5C1iNfwB4/S4uuUAoyRuYsvTR2X83n+14vp/XRLg2VFERH18UxsCmQd14bt7EclalT0YKzr4kE9b1+8tDyIrI6nQSNX9l2vtgbv1GD4PywAbxsmf4n0igUk/Dyfw84b+b7zStqRqHb833QadzfUFS8HL/wRfXOM/S0IHh7SxAufIh7qwZ4dV57cNfnLX9sgvKggRCqMWqazYNpEAJ2lbkZK/mNELkHBr6zKCa3sD3msIr2X8u1T+y47/Gj3pTxXTVmznbdyq5jVwXMq0b5MNgBC7A5qCIH1J+MSNl2er2PcelkcFCvUFvJ9bTGH+IyiMF8DMGqRl7EKcBScpCSnh2wOsQWeRBZM7oP08pOw9j5MJwwhsDbTeEnH8jeTl0Fosl8nc/0uHNkuSQd20kxgn1ML3meMoAjXHrQDwQ1arbmN90ITArSY+9caeBu93/A/LNBRw++5dRGdHUPPbkAOpbP/Fs9m4ZPIlO5UzjJFnr/K50wGeeuG0hH49WBfRAO/i89dHAZt9thgDf192orXpYy+OAXeLZwgup85WSM1GdKnuaSDOXc6PN//RV85rkxjrM4QZg/iSatxPDekPp+/moWjzFtDkQfy0HqJM3lzUalhI1NW/uaSjVQlDqPQvny46VySgfGC/JqgarXYBKBYpKGx0UcbugMMVczqVHxupZolb4LvId+4NI6kWkaXch3s8Goc+OW25ZEZTCVP4lHOw/xWslB+LbnVpW16nFE/cBNyb4BgU9B8uYbFoedIrud3vDoQlJJWtgWLd3lMVdPZvkgEtzaE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR08MB4032.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(122000001)(54906003)(8936002)(166002)(2906002)(38100700002)(508600001)(86362001)(966005)(7696005)(52536014)(9686003)(55016002)(33656002)(19627405001)(8676002)(71200400001)(5660300002)(26005)(6506007)(4326008)(316002)(107886003)(186003)(6916009)(83380400001)(38070700005)(66476007)(66556008)(66446008)(64756008)(76116006)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?miJGuwkCEOcHoE/n5/xrMK3kt63+Wqs/b+tNoG3SWVrjYvsuJ4hjmzCQwx?=
 =?iso-8859-1?Q?BhNUwf9UhWu4YctQjjoS+mKvWot2Zl3W9IMsJwo2q01A7OeiqQwMFrink0?=
 =?iso-8859-1?Q?vwn+u1x+xmHClMyAXGjUKdybKJ60MP2ZSp4uOkR+zA9YMtfqH0tXFnec1W?=
 =?iso-8859-1?Q?pwEC7mSszmfWdiZyU9Mv25K4Jxqao4Xg6wqU4WNO8YdkYqjNULk7IdH9l1?=
 =?iso-8859-1?Q?6WIe1uNMzyq6LeS+/P2ux0ZF4OprzzIRHBzXoO0F4lMYwaOddxTjPtARIL?=
 =?iso-8859-1?Q?NggGpnwZUU68ihtM9d1IIIl0vcfJTTQ5k2JkNGWZmVnzlPk4ahCoJiLuTc?=
 =?iso-8859-1?Q?juqYsI0K8ojMk23gUd2xPEXEFNLZvBdegwIrH4D+5JBmYbM4VfZry7G79i?=
 =?iso-8859-1?Q?4PA9dtWeCnB6gGhgkaA1Vtto/B/EwdwlXP3aR6eb1R+3LcvWuEpaE0tlX3?=
 =?iso-8859-1?Q?FMSPlPcrg3qVC/6yZ7+m6wJ7sGn42ABTYW/vxJte3ef9ZbGBmusmJP287I?=
 =?iso-8859-1?Q?O7fPt8E/Dev41HbpdUmzqkb8nDZD2Yh4cxiACjKm7NaUx7KSUhnosbHEdg?=
 =?iso-8859-1?Q?bxyqqvlIwnkEro70swWCkc6WobHiWCn/6pnMjwbsT1+lBuM3bkvfxglrGB?=
 =?iso-8859-1?Q?Owi4teDOh/5FWdI/xiU62ehTrln4a6BUhKu9pdNZt8f5WRMs1bFIdWSi3S?=
 =?iso-8859-1?Q?u8L1kC0KLNQymcuk65BZWRTGg7rmq0EfI9SBTbyHgU8jSSuxwe9hB0kU/L?=
 =?iso-8859-1?Q?OOg3iFGSU1kLKiPCQa/tFI24gGM5Xi5PaSu8OicFKwb4SBxelDmfg+Yqpe?=
 =?iso-8859-1?Q?pzx+HhayUE79yAvxr+JLCktOYq25KC/RBYeit7RPOEpZrIPr0QqoMss98y?=
 =?iso-8859-1?Q?RXLdu9dCx+HyDP0aF3Rad/Ix7HXIbRj7q/gC3X0kDZyFoifRGDi1sLTIjm?=
 =?iso-8859-1?Q?qvRwFCEeTf9gLgXGgMvcUDPv2i+sBbSSQC7rardEJqaqNNLI6VXcZXqzuH?=
 =?iso-8859-1?Q?z9NcPkdEHXXFNm22xjcroaCak+Ol7QE7RdNdsQoTzp2Msj7UMrdbDpNv2F?=
 =?iso-8859-1?Q?M7bXVD4l/ek2yOaxhG/9vmPzsfFC+VTPvjxGvsKa6aPZDXpMHwPaK51mTb?=
 =?iso-8859-1?Q?R2ibKM/V8oSzR9KH49C5vP48yjBaFlG6z+PaJjvcPZ39BRjzt6R39Aj0a9?=
 =?iso-8859-1?Q?BfL2VwB/xwCRZfAUArRl7Sea7jPp/jcgiX2Hi2ZdBi2c4rm5lu6K3/6tE1?=
 =?iso-8859-1?Q?zjdt5In9kEm/c2Y1HOSP4RrpEnfs3QWV8bgu+M0pZJMaa/NM+tBvYtk6Fh?=
 =?iso-8859-1?Q?U32d/2sSEt2Whla3vm3lgbB4Vy6pN965Avc05hdcjjvDMtfMr4/adZ91NE?=
 =?iso-8859-1?Q?OG3U6g5GkSDdjyVkgq09yThv6dUufAorhCIjgUuMOZ0Mvtwe1KdNWn1Y8n?=
 =?iso-8859-1?Q?GB9rhbStp3AgaYnZ7supo2BYydNpvVTPzVxJqk+rNrJsrtKN6fiIHyv7eX?=
 =?iso-8859-1?Q?3FxBK3hLfMfgPC9diXmLtdEER6CHprqyp5EnLdl6gGei/dd/uo6/wU39lf?=
 =?iso-8859-1?Q?crodLNbWtgHN/Pz5aQhskEUjX7kt9tjTzzckODB21VTVjJEeR5qwRXw8rw?=
 =?iso-8859-1?Q?omeLTLw2hH2drRtEieNQ4/6Rxd9Yj/YCJVOFXY3yIi13VTH3vKeR+3UI2d?=
 =?iso-8859-1?Q?G+YQqr1BoqXpZ81W/a+sxZh7GY4KWr+V1lXbUhYrBxwinIf7rGzYc2hyQU?=
 =?iso-8859-1?Q?o5ag=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR08MB40321BF3F391E7CFDEEBC2C4B6989SN6PR08MB4032namp_"
MIME-Version: 1.0
X-OriginatorOrg: fii-usa.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB4032.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f355ac9-bf67-4b61-261b-08d9a88e93c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 23:20:56.6292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xYzfZ0JVhDrkSnv2Lmju5My+F8+Jyr2pbF2Mx/eXXe3TBGE4ddW3D0Vyr9ZWmmHhZKghzCdRkGrvcQvBBvpI+/mZr3edCCAIBOBfPsjsocY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4304
X-Mailman-Approved-At: Tue, 16 Nov 2021 12:57:15 +1100
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
Cc: "venture@google.com" <venture@google.com>,
 Mustafa Shehabi <Mustafa.Shehabi@fii-na.com>,
 "krellan@google.com" <krellan@google.com>,
 "edtanous@google.com" <edtanous@google.com>,
 "vveerach@google.com" <vveerach@google.com>,
 Lancelot Kao <Lancelot.Kao@fii-usa.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SN6PR08MB40321BF3F391E7CFDEEBC2C4B6989SN6PR08MB4032namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Josh and Ed,

I used the OEM IPMI command to enter Manual mode of phosphor-pid-control, a=
nd then I set the PWM value. After leaving Manual mode, I would expect swam=
pd to bring the PWM back to the value from before entering Manual mode. How=
ever, the PWM remains the value I set in Manual mode. Although, when I indu=
ced a temperature sensor to approach its setpoint, I observed the PWM to ch=
ange.

I believe the reason is because of https://github.com/openbmc/phosphor-pid-=
control/blob/cca9c659889d149c06e95bab4b8808db4f1e3eab/dbus/dbuswrite.cpp#L6=
9. My system uses DBus fan sensors, so the fan controller will call upon Db=
usWritePercent::write, which writes the calculated output value (ovalue) if=
 it is different than the oldValue. When I enter Manual mode and set the PW=
M, the oldValue does not change; when I exit Manual mode, the ovalue and ol=
dValue are the same as before Manual mode, so it skips the PWM write.

How can the PWM "immediately" return to its original value from before Manu=
al mode?

Thanks,
Charles


--_000_SN6PR08MB40321BF3F391E7CFDEEBC2C4B6989SN6PR08MB4032namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello Josh and Ed,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I used the OEM IPMI command to enter Manual mode of phosphor-pid-control, a=
nd then I set the PWM value. After leaving Manual mode, I would expect swam=
pd to bring the PWM back to the value from before entering Manual mode. How=
ever, the PWM remains the value
 I set in Manual mode.&nbsp;<span style=3D"background-color:rgb(255, 255, 2=
55);display:inline !important">Although, when I induced a temperature senso=
r to approach its setpoint, I observed the PWM to change.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I believe the reason is because of <a href=3D"https://github.com/openbmc/ph=
osphor-pid-control/blob/cca9c659889d149c06e95bab4b8808db4f1e3eab/dbus/dbusw=
rite.cpp#L69" style=3D"margin:0px;background-color:rgb(255, 255, 255)">
https://github.com/openbmc/phosphor-pid-control/blob/cca9c659889d149c06e95b=
ab4b8808db4f1e3eab/dbus/dbuswrite.cpp#L69</a>. My system uses DBus fan sens=
ors, so the fan controller will call upon DbusWritePercent::write, which wr=
ites the calculated output value
 (ovalue) if it is different than the oldValue. When I enter Manual mode an=
d set the PWM, the oldValue does not change; when I exit Manual mode, the o=
value and oldValue are the same as before Manual mode, so it skips the PWM =
write.
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
How can the PWM &quot;immediately&quot; return to its original value from b=
efore Manual mode?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,
<div>Charles</div>
</div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
<br>
</body>
</html>

--_000_SN6PR08MB40321BF3F391E7CFDEEBC2C4B6989SN6PR08MB4032namp_--
