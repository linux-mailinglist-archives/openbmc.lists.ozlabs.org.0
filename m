Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EADE2A8A84
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 00:12:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRzms0hJmzDr9M
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 10:11:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=supermicro.com (client-ip=210.242.233.163;
 helo=twmga.supermicro.com.tw; envelope-from=michelleliu@supermicro.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=supermicro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=supermicro.com.tw header.i=@supermicro.com.tw
 header.a=rsa-sha256 header.s=dkim header.b=hw1Dzx77; 
 dkim-atps=neutral
Received: from twmga.supermicro.com.tw (mail.supermicro.com.tw
 [210.242.233.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRvTM01rgzDr27
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 06:58:12 +1100 (AEDT)
Received: from pps.filterd (twmga.supermicro.com.tw [127.0.0.1])
 by twmga.supermicro.com.tw (8.16.0.42/8.16.0.42) with SMTP id 0A5JuppJ005497; 
 Fri, 6 Nov 2020 03:58:03 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=supermicro.com.tw;
 h=from : to : cc
 : subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=dkim;
 bh=m7PQiB4mleTVVU1ZWLObBfTY5NYEePIAnJ9g/JzUo6E=;
 b=hw1Dzx77LIFykW0NOoFH5cPsI381MiN7rPZ3njvR/DKod5Rxvks/nTrEJAGghBlYfpdn
 AViOnIVgLHukH5G2zbWkZXG5UIBzZ1/X5mccfbGLAd5QctJga5mCdsIY2o13Cf9kIp8u
 MuZB3CzvcttL4xMoZvKzp8UuR4aiTaWN0njhwCPU39+PyPXiyPojxIqB2b4gBSHsLOUa
 gVvotVyXdKsXNQNoDVWyJKLP7/QgzTyolMz8Dl50cPlsUvVKVwxLPG00MfCwZglfk9Pm
 9GoBVTBdkj5Ld3OW0BD7XhaDtAxaQr81M3bYADxq3e6csZxJF+jQXiZOCyvAyI+DUJhH cA== 
Received: from tw-ex2013-mbx2.supermicro.com (TW-EX2013-MBX2.supermicro.com
 [10.128.8.64]) by twmga.supermicro.com.tw with ESMTP id 34gr3dsyg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 03:58:03 +0800
Received: from EX2013-MBX3.supermicro.com (10.2.1.46) by
 TW-EX2013-MBX2.supermicro.com (10.128.8.64) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 6 Nov 2020 03:58:02 +0800
Received: from EX2013-MBX3.supermicro.com ([fe80::acc9:2a0d:cd46:f137]) by
 EX2013-MBX3.supermicro.com ([fe80::acc9:2a0d:cd46:f137%21]) with mapi id
 15.00.1497.000; Thu, 5 Nov 2020 11:58:01 -0800
From: Michelle Liu <MichelleLiu@supermicro.com>
To: krtaylor <kurt.r.taylor@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: OpenBMC Project Contributor
Thread-Topic: OpenBMC Project Contributor
Thread-Index: Aday6Fip2w9NVEYtTOWps38lDtwUxQA6aUIAAAkrUeA=
Date: Thu, 5 Nov 2020 19:58:01 +0000
Message-ID: <0e024e3297dd4d6a96919fdf359976b0@EX2013-MBX3.supermicro.com>
References: <df1a21b1e7164ed8a8a6b36d8a713c6e@EX2013-MBX3.supermicro.com>
 <3b7a2e0d-5c17-a63a-06f9-307404c7c316@gmail.com>
In-Reply-To: <3b7a2e0d-5c17-a63a-06f9-307404c7c316@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.1.34.79]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-05_14:2020-11-05,
 2020-11-05 signatures=0
X-Mailman-Approved-At: Fri, 06 Nov 2020 10:08:47 +1100
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
Cc: Kevin Liu <Kevin_Liu@supermicro.com.tw>,
 Hancock Chang <HancockC@supermicro.com.tw>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Kurt,

Thank you for your prompt reply. It is our pleasure to join the OpenBMC fam=
ily.
We will do our homework. And, we look forward to working with all of you.

Best,
Michelle


-----Original Message-----
From: krtaylor <kurt.r.taylor@gmail.com>=20
Sent: Thursday, November 5, 2020 8:16 AM
To: Michelle Liu (SW-PM) <MichelleLiu@supermicro.com>; openbmc@lists.ozlabs=
.org
Cc: Kevin Liu - TW (SW-PM) <Kevin_Liu@supermicro.com.tw>; Hancock Chang - T=
W (SW-PM) <HancockC@supermicro.com.tw>
Subject: Re: OpenBMC Project Contributor

[CAUTION: External Mail]

On 11/4/20 2:25 PM, Michelle Liu wrote:
> To Who It May Concern,
>=20
> Super Micro Computer likes to join the OpenBMC community as a=20
> contributor. A signed CLA is attached. Please provide us with guidance.
> Thank you.

Your CCLA has been accepted. Welcome Super Micro Computer!

Re: guidance -> Lots of great info here:
https://urldefense.com/v3/__https://github.com/openbmc/openbmc/wiki__;!!B4N=
drdkg3tRaKVT9!5otlOzkwUlYZ9roBAho62Vrz6MbCB9RCh3O9qH_CJuHNd7kO8izwwh5El5g3G=
OZdYEe4$
and here:
https://urldefense.com/v3/__https://github.com/openbmc/docs__;!!B4Ndrdkg3tR=
aKVT9!5otlOzkwUlYZ9roBAho62Vrz6MbCB9RCh3O9qH_CJuHNd7kO8izwwh5El5g3GN7gkhFt$=
=20

Jump on IRC (#openbmc on freenode), there are a bunch of friendly folks the=
re willing to help.

Kurt Taylor (krtaylor)

>=20
> Best regard,
>=20
> Michelle Liu
>=20
> Director, Software Products
>=20
> Super Micro Computer, Inc.
>=20
> D: +1 (669) 284-1046
>=20
> C: +1 (408) 420-6407
>=20

