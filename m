Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 442DA1006C0
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2019 14:47:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GqyV1D54zDqXL
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 00:47:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GnSf6wR3zDqWM
 for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2019 22:54:57 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.31])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 4578C6E211;
 Mon, 18 Nov 2019 06:54:51 -0500 (EST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: meta-ibm restructuring
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAARXrt=sG-pMjs6H9z89FtUHBEDbO3kahPSbHgEPWnO-UwExBg@mail.gmail.com>
Date: Mon, 18 Nov 2019 06:54:50 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <F242114E-32D6-41DD-A8B1-647063FDB492@fuzziesquirrel.com>
References: <90BAE90B-F2BF-46A0-BCC0-88223079D196@fuzziesquirrel.com>
 <CAARXrtm_JjCZqRBsnFU+LuH-Xn=4Uj9Eikp7+XKcuvZ8NWGKsQ@mail.gmail.com>
 <5FF8B18B-E4BA-4ED6-AEEF-A2C8F7839C17@fuzziesquirrel.com>
 <CAARXrt=sG-pMjs6H9z89FtUHBEDbO3kahPSbHgEPWnO-UwExBg@mail.gmail.com>
To: Lei YU <mine260309@gmail.com>
X-Mailer: Apple Mail (2.3601.0.10)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


>> To put it another way - a minimal bblayers.conf for any openpower =
reference systems will look like:
>>=20
>> oe-core
>> meta-openembedded
>> meta-aspeed
>> meta-phosphor
>> meta-openpower
>>=20
>> a minimal bblayers.conf for any ibm product will look like (the same =
as an openpower reference system but with meta-ibm added)
>>=20
>> oe-core
>> meta-openembedded
>> meta-aspeed
>> meta-phosphor
>> meta-openpower
>> meta-ibm
>=20
> Got it.
> So the plan is to move palmetto and romulus into meta-openpower, is =
it?

Correct!=
