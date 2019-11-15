Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AAAFE19C
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 16:38:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47F2ZB0kpnzF7Qk
	for <lists+openbmc@lfdr.de>; Sat, 16 Nov 2019 02:38:42 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47F2YQ1YFZzF5K7
 for <openbmc@lists.ozlabs.org>; Sat, 16 Nov 2019 02:38:01 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 188046DBDF;
 Fri, 15 Nov 2019 10:37:56 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: meta-ibm restructuring
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAARXrtm_JjCZqRBsnFU+LuH-Xn=4Uj9Eikp7+XKcuvZ8NWGKsQ@mail.gmail.com>
Date: Fri, 15 Nov 2019 10:37:55 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <5FF8B18B-E4BA-4ED6-AEEF-A2C8F7839C17@fuzziesquirrel.com>
References: <90BAE90B-F2BF-46A0-BCC0-88223079D196@fuzziesquirrel.com>
 <CAARXrtm_JjCZqRBsnFU+LuH-Xn=4Uj9Eikp7+XKcuvZ8NWGKsQ@mail.gmail.com>
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



> On Nov 14, 2019, at 9:06 PM, Lei YU <mine260309@gmail.com> wrote:
>=20
> On Fri, Nov 15, 2019 at 1:51 AM Brad Bishop =
<bradleyb@fuzziesquirrel.com> wrote:
>>=20
>> the meta-witherspoon layer in meta-ibm supports a number of machine =
targets beyond witherspoon.  the meta-ibm layer itself is nearly empty.
>=20
> Before the change, meta-ibm layer has below:
>=20
>  bmcweb
>  dbus
>  dump
>  interfaces
>  logging
>  packagegroups
>=20
> I do not think it's confusing because it defines the necessary recipes
> for ibm machines.

It doesn=E2=80=99t though - there are also a number of bbappends defined =
in meta-witherspoon that are also required for ibm systems.

>=20
>> This is confusing to say the least, so I am doing some restructuring =
in the meta-ibm layer such that everything will simply be in meta-ibm:
>>=20
>> https://gerrit.openbmc-project.xyz/c/openbmc/meta-ibm/+/27263
>>=20
>> Please let me know if you have any concerns.
>=20
> The commit moves everything from meta-witherspoon to meta-ibm, which
> makes a machine that inherits meta-ibm inherits everything from
> meta-witherspoon.

That=E2=80=99s just it - the only thing that uses meta-ibm (that I am =
aware of anyway) are the systems in meta-witherspoon.

> Is that intended?

yes.

> Ideally, the recipes (bbappends) in meta-witherspoon has
> append_MACHINE so it will not impact other machines. But can we make
> sure every single recipe has correct append_MACHINE?

Yes this is generally a best practice in any bbappend.

When everything is done we=E2=80=99ll have the following structure:

meta-openpower:
  recipes and bbappends for any power system
  full support for openpower reference systems (palmetto, romulus)

meta-ibm:
  recipes and bbappends for ibm products
  full support for all ibm products

To put it another way - a minimal bblayers.conf for any openpower =
reference systems will look like:

oe-core
meta-openembedded
meta-aspeed
meta-phosphor
meta-openpower

a minimal bblayers.conf for any ibm product will look like (the same as =
an openpower reference system but with meta-ibm added)

oe-core
meta-openembedded
meta-aspeed
meta-phosphor
meta-openpower
meta-ibm

thx - brad=
