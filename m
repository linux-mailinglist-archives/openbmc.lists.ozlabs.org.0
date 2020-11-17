Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FF42B5639
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 02:27:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZpGb2TJszDqQB
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 12:27:51 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=dkim header.b=laPbvAOx; 
 dkim-atps=neutral
Received: from twmga.supermicro.com.tw (mail.supermicro.com.tw
 [210.242.233.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZpFf3n4jzDqHh
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 12:26:57 +1100 (AEDT)
Received: from pps.filterd (twmga.supermicro.com.tw [127.0.0.1])
 by twmga.supermicro.com.tw (8.16.0.42/8.16.0.42) with SMTP id 0AH1GPXn001707; 
 Tue, 17 Nov 2020 09:26:44 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=supermicro.com.tw;
 h=from : to : cc
 : subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=dkim;
 bh=vbnnM0ReIgW0CJf09weXiQNhJN+5Mn1yzfgp7HfgxEQ=;
 b=laPbvAOxfiImQ3UglmChB3l4feNV8Dd2dsf+fvI9XFRPlTTvKTFjAy/XWIzim6+sTxA3
 oOQiLufTvlHjwYqy4xXm1tXuBCcXQ4V/F4876FExxW1IjkMTgRp0pxZPf5QcQ6u9AhlI
 3fhSXv6S4W1yDVU8HBz7Ad0p1w1dQOs2TtNBll7IDEfIEP8Vz6RdTHzDeLsgQQvDG6Iq
 mPcXofBvJWAqF9+TkQPfqRWZdLiObaNfaCu/72ewP0nQuZnB+t4zPDLoFNAh5wTb5c6k
 BYeGX7TpDDm8Y80f595uUCYIVQJXp880HbJDj6ZNQUna5T9uGHvXF8mUDZzsJkn7XRuD MA== 
Received: from tw-ex2013-mbx1.supermicro.com (TW-EX2013-MBX1.supermicro.com
 [10.128.8.63]) by twmga.supermicro.com.tw with ESMTP id 34sydd8tyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 09:26:44 +0800
Received: from TW-EX2013-MBX2.supermicro.com (10.128.8.64) by
 TW-EX2013-MBX1.supermicro.com (10.128.8.63) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 17 Nov 2020 09:26:43 +0800
Received: from TW-EX2013-MBX2.supermicro.com ([fe80::6dc3:c328:5621:ff7a]) by
 TW-EX2013-MBX2.supermicro.com ([fe80::6dc3:c328:5621:ff7a%12]) with
 mapi id 15.00.1497.000; Tue, 17 Nov 2020 09:26:43 +0800
From: Hancock Chang <HancockC@supermicro.com.tw>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: Need to create Supermicro's repo for OpenBMC Contribution
Thread-Topic: Need to create Supermicro's repo for OpenBMC Contribution
Thread-Index: AQHWvHd0KfirDSb7ZEajJCz66wZKs6nLh/NA
Date: Tue, 17 Nov 2020 01:26:42 +0000
Message-ID: <3550136424e34bdf899d677fb6200f03@TW-EX2013-MBX2.supermicro.com>
References: <56e966abb56a491fafe047d03b8453a3@TW-EX2013-MBX2.supermicro.com>
 <20201117002018.6aeprjl5cy2otryk@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20201117002018.6aeprjl5cy2otryk@thinkpad.fuzziesquirrel.com>
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
 definitions=2020-11-16_13:2020-11-13,
 2020-11-16 signatures=0
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
Cc: Ryan Sie <RyanS@supermicro.com.tw>, Kevin Liu <Kevin_Liu@supermicro.com.tw>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 krtaylor <kurt.r.taylor@gmail.com>, Michelle Liu <MichelleLiu@supermicro.com>,
 Ryan Zhou <RyanZ@supermicro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brad

Thank you very much, we have seen the repo has been created for us


Hancock Chang
Product Manager, Open Source SW
Super Micro Computer, Inc. Taiwan
Email : HancockC@supermicro.com.tw
Tel : +886-2-8226-3990=A0Ext:3198

-----Original Message-----
From: Brad Bishop <bradleyb@fuzziesquirrel.com>=20
Sent: Tuesday, November 17, 2020 8:20 AM
To: Hancock Chang - TW (SW-PM) <HancockC@supermicro.com.tw>
Cc: krtaylor <kurt.r.taylor@gmail.com>; openbmc@lists.ozlabs.org; Ryan Sie =
- TW (HW 1) <RyanS@supermicro.com.tw>; Ryan Zhou (HW) <RyanZ@supermicro.com=
>; Kevin Liu - TW (SW-PM) <Kevin_Liu@supermicro.com.tw>; Michelle Liu (SW-P=
M) <MichelleLiu@supermicro.com>
Subject: Re: Need to create Supermicro's repo for OpenBMC Contribution

[CAUTION: External Mail]

On Fri, Nov 13, 2020 at 01:14:40AM +0000, Hancock Chang wrote:
>Hello Kurt,
>
>As previous communication in below, Supermicro has completed the CLA and b=
een accepted, our BMC dev team is preparing to have some contribution to Op=
enBMC, so would like to ask for help to create "meta-supermicro repository =
as openbmc subtree" then could start to follow the process to do some contr=
ibution
>
>We have 2 BMC senior staff would be as repo owner, name and email address =
as below assume this will be needed for creating the meta-ampere repository=
.
>
>     Ryan Sie, RyanS@supermicro.com.tw
>     Ryan Zhou, RyanZ@supermicro.com

meta-supermicro created.

-brad
