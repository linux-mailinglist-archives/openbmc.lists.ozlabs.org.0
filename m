Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E22012B3B43
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 03:07:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZCBf3wFrzDqNC
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 13:07:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=supermicro.com.tw (client-ip=210.242.233.163;
 helo=twmga.supermicro.com.tw; envelope-from=hancockc@supermicro.com.tw;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=supermicro.com.tw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=supermicro.com.tw header.i=@supermicro.com.tw
 header.a=rsa-sha256 header.s=dkim header.b=jmJZb0bo; 
 dkim-atps=neutral
Received: from twmga.supermicro.com.tw (mail.supermicro.com.tw
 [210.242.233.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZC9Z2yhKzDqNC
 for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2020 13:06:24 +1100 (AEDT)
Received: from pps.filterd (twmga.supermicro.com.tw [127.0.0.1])
 by twmga.supermicro.com.tw (8.16.0.42/8.16.0.42) with SMTP id 0AG22eXI019314; 
 Mon, 16 Nov 2020 10:06:17 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=supermicro.com.tw;
 h=from : to : cc
 : subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=dkim;
 bh=csuoKHdtBqCFHGGXxTNiOZYVz5S4/TllhPmOSa1TDNg=;
 b=jmJZb0boHdERBjCFQ0/XYbqbMxXH9VKOCvXoggy7sfFs/rl6mAhKQxBAoU4VxEudfGbV
 DblGaktaoRWX+PylZks+gQeGudjZlkb1D0jMopy0vArs2RHy6eWT5HI9dk7zYdGGX9/m
 FlhmUGnFGIgLHNDa4kAhRzXm9dD75tGOeaa2b5/12Fh3MBMy1JbQpNci4Rx1Z4lvITDm
 p5PSb9mObNS0lVP4aw8yUAkMuTQXRHvn0YbkSzUGYpQpuaWb/81chc05RI5xOWDj9naK
 zBkJ68S+LkqWUEEAbUDCyqnoMOKlSnziIloyP2i+ZNp9hMTHB3ymoc27xGrb6tj7FEUC Pw== 
Received: from tw-ex2013-mbx2.supermicro.com (TW-EX2013-MBX2.supermicro.com
 [10.128.8.64]) by twmga.supermicro.com.tw with ESMTP id 34sydd8esh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2020 10:06:17 +0800
Received: from TW-EX2013-MBX2.supermicro.com (10.128.8.64) by
 TW-EX2013-MBX2.supermicro.com (10.128.8.64) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 16 Nov 2020 10:06:14 +0800
Received: from TW-EX2013-MBX2.supermicro.com ([fe80::6dc3:c328:5621:ff7a]) by
 TW-EX2013-MBX2.supermicro.com ([fe80::6dc3:c328:5621:ff7a%12]) with
 mapi id 15.00.1497.000; Mon, 16 Nov 2020 10:06:14 +0800
From: Hancock Chang <HancockC@supermicro.com.tw>
To: Phong Vo OS <phong@os.amperecomputing.com>, krtaylor
 <kurt.r.taylor@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Need to create Supermicro's repo for OpenBMC Contribution 
Thread-Topic: Need to create Supermicro's repo for OpenBMC Contribution 
Thread-Index: Ada5WVLVdTQdRtNrQkuX76FPCTQPrAAwbxEgAGhRblA=
Date: Mon, 16 Nov 2020 02:06:13 +0000
Message-ID: <0539b32675d94af28ffe557acbc8b435@TW-EX2013-MBX2.supermicro.com>
References: <56e966abb56a491fafe047d03b8453a3@TW-EX2013-MBX2.supermicro.com>
 <SN6PR01MB409396D2B24F8007E719D2E187E50@SN6PR01MB4093.prod.exchangelabs.com>
In-Reply-To: <SN6PR01MB409396D2B24F8007E719D2E187E50@SN6PR01MB4093.prod.exchangelabs.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.133.160.151]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-15_11:2020-11-13,
 2020-11-15 signatures=0
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
Cc: Ryan Sie <RyanS@supermicro.com.tw>, Ryan Zhou <RyanZ@supermicro.com>,
 Kevin Liu <Kevin_Liu@supermicro.com.tw>,
 Michelle Liu <MichelleLiu@supermicro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Phong

>>I would assume you are request meta-supermicro, and not meta-ampere as we=
 have been requesting meta-ampere also?
[Hancock]: That is correct, what we were asking for is to create "meta-supe=
rmicro" only, I just took another similar email as example but kept somethi=
ng incorrect, thank you for correction.=20

Best,

Hancock
-----Original Message-----
From: Phong Vo OS <phong@os.amperecomputing.com>=20
Sent: Saturday, November 14, 2020 8:15 AM
To: Hancock Chang - TW (SW-PM) <HancockC@supermicro.com.tw>; krtaylor <kurt=
.r.taylor@gmail.com>; openbmc@lists.ozlabs.org
Cc: Ryan Sie - TW (HW 1) <RyanS@supermicro.com.tw>; Ryan Zhou (HW) <RyanZ@s=
upermicro.com>; Kevin Liu - TW (SW-PM) <Kevin_Liu@supermicro.com.tw>; Miche=
lle Liu (SW-PM) <MichelleLiu@supermicro.com>
Subject: RE: Need to create Supermicro's repo for OpenBMC Contribution=20

[CAUTION: External Mail]

Hi Hancock,

I would assume you are request meta-supermicro, and not meta-ampere as we h=
ave been requesting meta-ampere also?

-Phong

> -----Original Message-----
> From: openbmc <openbmc-
> bounces+phong=3Dos.amperecomputing.co
> m@lists.ozlabs.org> On Behalf Of
> Hancock Chang
> Sent: Friday, November 13, 2020 8:15
> AM
> To: krtaylor <kurt.r.taylor@gmail.com>; openbmc@lists.ozlabs.org
> Cc: Ryan Sie
> <RyanS@supermicro.com.tw>; Ryan
> Zhou <RyanZ@supermicro.com>; Kevin
> Liu <Kevin_Liu@supermicro.com.tw>;
> Michelle Liu
> <MichelleLiu@supermicro.com>
> Subject: Need to create Supermicro's
> repo for OpenBMC Contribution
>=20
> Hello Kurt,
>=20
> As previous communication in below,
> Supermicro has completed the CLA and
> been accepted, our BMC dev team is
> preparing to have some contribution to OpenBMC, so would like to ask=20
> for help to create "meta-supermicro repository as openbmc subtree"=20
> then could start to follow the process to do some contribution
>=20
> We have 2 BMC senior staff would be as repo owner, name and email=20
> address as below assume this will be needed for creating the=20
> meta-ampere repository.
>=20
>      Ryan Sie, RyanS@supermicro.com.tw
>      Ryan Zhou, RyanZ@supermicro.com
>=20
>=20
> Thank you
>=20
> Hancock Chang
> Product Manager, Open Source SW
> Super Micro Computer, Inc. Taiwan
> Email : HancockC@supermicro.com.tw
> Tel : +886-2-8226-3990=A0Ext:3198
>=20
>=20
>=20
>=20
> -----Original Message-----
> From: Michelle Liu (SW-PM)
> Sent: Friday, November 6, 2020 3:58 AM
> To: krtaylor <kurt.r.taylor@gmail.com>; openbmc@lists.ozlabs.org
> Cc: Kevin Liu - TW (SW-PM)
> <Kevin_Liu@supermicro.com.tw>;
> Hancock Chang - TW (SW-PM)
> <HancockC@supermicro.com.tw>
> Subject: RE: OpenBMC Project
> Contributor
>=20
> Hi Kurt,
>=20
> Thank you for your prompt reply. It is our pleasure to join the=20
> OpenBMC family.
> We will do our homework. And, we look
> forward to working with all of you.
>=20
> Best,
> Michelle
>=20
>=20
> -----Original Message-----
> From: krtaylor
> <kurt.r.taylor@gmail.com>
> Sent: Thursday, November 5, 2020 8:16
> AM
> To: Michelle Liu (SW-PM)
> <MichelleLiu@supermicro.com>;
> openbmc@lists.ozlabs.org
> Cc: Kevin Liu - TW (SW-PM)
> <Kevin_Liu@supermicro.com.tw>;
> Hancock Chang - TW (SW-PM)
> <HancockC@supermicro.com.tw>
> Subject: Re: OpenBMC Project
> Contributor
>=20
> [CAUTION: External Mail]
>=20
> On 11/4/20 2:25 PM, Michelle Liu wrote:
> > To Who It May Concern,
> >
> > Super Micro Computer likes to join the
> OpenBMC community as a
> > contributor. A signed CLA is attached.
> Please provide us with guidance.
> > Thank you.
>=20
> Your CCLA has been accepted. Welcome
> Super Micro Computer!
>=20
> Re: guidance -> Lots of great info here:
> https://urldefense.com/v3/__https://gith
> ub.com/openbmc/openbmc/wiki__;!!B4
> Ndrdkg3tRaKVT9!5otlOzkwUlYZ9roBAho
> 62Vrz6MbCB9RCh3O9qH_CJuHNd7kO8iz
> wwh5El5g3GOZdYEe4$
> and here:
> https://urldefense.com/v3/__https://gith
> ub.com/openbmc/docs__;!!B4Ndrdkg3tR
> aKVT9!5otlOzkwUlYZ9roBAho62Vrz6Mb
> CB9RCh3O9qH_CJuHNd7kO8izwwh5El5g
> 3GN7gkhFt$
>=20
> Jump on IRC (#openbmc on freenode),
> there are a bunch of friendly folks there willing to help.
>=20
> Kurt Taylor (krtaylor)
>=20
> >
> > Best regard,
> >
> > Michelle Liu
> >
> > Director, Software Products
> >
> > Super Micro Computer, Inc.
> >
> > D: +1 (669) 284-1046
> >
> > C: +1 (408) 420-6407
> >

