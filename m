Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFEA127B8E
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 14:13:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fThz2Kr8zDqw4
	for <lists+openbmc@lfdr.de>; Sat, 21 Dec 2019 00:13:55 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fTgZ3WP9zDqvH
 for <openbmc@lists.ozlabs.org>; Sat, 21 Dec 2019 00:12:40 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: Power Supply Cold Redundancy
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAARXrtnL8-zpiL73E5E=q9=WcX_BDa31ZbcThBTNyMr1UF1HpQ@mail.gmail.com>
Date: Fri, 20 Dec 2019 08:12:34 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <B8C11063-6338-4AC3-892C-701EF7ED077E@fuzziesquirrel.com>
References: <2153c03a-fd09-fb67-7051-5e889e5d2f8b@linux.intel.com>
 <CAARXrt=wL7ZT=tGzP-DQTgEwiSZOfdQ4n1kvE5oa6HhyPV3UfQ@mail.gmail.com>
 <33a034df-8e29-681e-f83d-aa496f558d4f@linux.intel.com>
 <CAARXrtnL8-zpiL73E5E=q9=WcX_BDa31ZbcThBTNyMr1UF1HpQ@mail.gmail.com>
To: Lei YU <mine260309@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>, "Yang,
 Cheng C" <cheng.c.yang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Dec 19, 2019, at 10:15 PM, Lei YU <mine260309@gmail.com> wrote:
>=20
> On Fri, Dec 20, 2019 at 10:31 AM Yang, Cheng C
> <cheng.c.yang@linux.intel.com> wrote:
>>=20
>> Originally, I also thought I may push my code to phosphor-power, but
>> when I was trying to devtool modify phosphor-power, I found a error =
happen
>>=20
>> ERROR: Nothing PROVIDES 'openpower-dbus-interfaces' (but
>> =
/home/cyang29/openbmc-openbmc/meta-phosphor/recipes-phosphor/power/phospho=
r-power_git.bb
>> DEPENDS on or otherwise requires it).
>>=20
>> We do not use openpower-dbus-interfaces.
>=20
> Right, that is a problem, and the good news is that Matt is already =
moving
> openpower-dbus-interfaces into phosphor-dbus-interfaces
> =
(https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/2=
7380),
> so it will be no problem in future :)

This ^ does help but I don=E2=80=99t think its the whole story.  It =
sounds like phosphor-power needs a meson option to turn off its =
dependency on org.openpower dbus interfaces=E2=80=A6regardless of what =
repository is providing those.

Going a step further - what are the org.openpower interfaces that =
phosphor-power depends on anyway?  Can they just be moved to =
xyz.openbmc_project?

-brad=
