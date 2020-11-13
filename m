Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A392B13ED
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 02:39:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXLjP0M25zDr4t
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 12:39:05 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=dkim header.b=eRZ9oNXF; 
 dkim-atps=neutral
X-Greylist: delayed 1405 seconds by postgrey-1.36 at bilbo;
 Fri, 13 Nov 2020 12:38:15 AEDT
Received: from twmga.supermicro.com.tw (mail.supermicro.com.tw
 [210.242.233.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXLhR0NwQzDr1V
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 12:38:14 +1100 (AEDT)
Received: from pps.filterd (twmga.supermicro.com.tw [127.0.0.1])
 by twmga.supermicro.com.tw (8.16.0.42/8.16.0.42) with SMTP id 0AD0maII025849; 
 Fri, 13 Nov 2020 09:14:41 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=supermicro.com.tw;
 h=from : to : cc
 : subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=dkim; bh=3XQzLjzdPZwA/gqLa+HFeNE/PNHY3YE62xkWSjJt8Ik=;
 b=eRZ9oNXFX+JVpaczKBNZt4KOEvGWxH2q0av99mYSwC+Oul+Z3miY15gv0a9VFS5BjDrK
 ryK29lamJ1USMtjcofGkMzl1xRydl9vAWA1MnIIP6a+HUW6J99VSqXc7Yrl8wuG4sOHX
 9vdi2t/2tFhnvIlTkMpOC0Lm+nw2atbtMmKmQf+XAK0Uh890IHPzN0Aacl6D/ycGct/9
 zm7se5+hCYRcyrxinyab7h/DAf5C1XayAmjvTr5sI+IVJGGVQCK8GdJtuWe+YChOKD3n
 RyBtS2sbGjsWFS2j36rvj+dTLh6BO/am/SnEY+ueS7n7KLCJsdA1/l+5v/R0dpZRxSRV +w== 
Received: from tw-ex2013-mbx2.supermicro.com (TW-EX2013-MBX2.supermicro.com
 [10.128.8.64]) by twmga.supermicro.com.tw with ESMTP id 34nbrca43k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 09:14:41 +0800
Received: from TW-EX2013-MBX2.supermicro.com (10.128.8.64) by
 TW-EX2013-MBX2.supermicro.com (10.128.8.64) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 13 Nov 2020 09:14:41 +0800
Received: from TW-EX2013-MBX2.supermicro.com ([fe80::6dc3:c328:5621:ff7a]) by
 TW-EX2013-MBX2.supermicro.com ([fe80::6dc3:c328:5621:ff7a%12]) with
 mapi id 15.00.1497.000; Fri, 13 Nov 2020 09:14:41 +0800
From: Hancock Chang <HancockC@supermicro.com.tw>
To: krtaylor <kurt.r.taylor@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Need to create Supermicro's repo for OpenBMC Contribution 
Thread-Topic: Need to create Supermicro's repo for OpenBMC Contribution 
Thread-Index: Ada5WVLVdTQdRtNrQkuX76FPCTQPrA==
Date: Fri, 13 Nov 2020 01:14:40 +0000
Message-ID: <56e966abb56a491fafe047d03b8453a3@TW-EX2013-MBX2.supermicro.com>
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
 definitions=2020-11-12_16:2020-11-12,
 2020-11-12 signatures=0
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

Hello Kurt,

As previous communication in below, Supermicro has completed the CLA and be=
en accepted, our BMC dev team is preparing to have some contribution to Ope=
nBMC, so would like to ask for help to create "meta-supermicro repository a=
s openbmc subtree" then could start to follow the process to do some contri=
bution

We have 2 BMC senior staff would be as repo owner, name and email address a=
s below assume this will be needed for creating the meta-ampere repository.

     Ryan Sie, RyanS@supermicro.com.tw
     Ryan Zhou, RyanZ@supermicro.com


Thank you

Hancock Chang
Product Manager, Open Source SW
Super Micro Computer, Inc. Taiwan
Email : HancockC@supermicro.com.tw
Tel : +886-2-8226-3990=A0Ext:3198




-----Original Message-----
From: Michelle Liu (SW-PM)=20
Sent: Friday, November 6, 2020 3:58 AM
To: krtaylor <kurt.r.taylor@gmail.com>; openbmc@lists.ozlabs.org
Cc: Kevin Liu - TW (SW-PM) <Kevin_Liu@supermicro.com.tw>; Hancock Chang - T=
W (SW-PM) <HancockC@supermicro.com.tw>
Subject: RE: OpenBMC Project Contributor

Hi Kurt,

Thank you for your prompt reply. It is our pleasure to join the OpenBMC fam=
ily.
We will do our homework. And, we look forward to working with all of you.

Best,
Michelle


-----Original Message-----
From: krtaylor <kurt.r.taylor@gmail.com>
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

