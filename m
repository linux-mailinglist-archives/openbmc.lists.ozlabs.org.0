Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F14ACEE0D
	for <lists+openbmc@lfdr.de>; Mon,  7 Oct 2019 22:53:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nCP105kDzDqM6
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 07:53:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nCNS60JKzDqGh
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 07:52:40 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 72ABA14C5B;
 Mon,  7 Oct 2019 16:52:37 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: unit test build failure in phosphor-hwmon
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notwGr6KV6aSqoBMRH+X=jVakOWBCr86K9OA4MCC0ph6KbA@mail.gmail.com>
Date: Mon, 7 Oct 2019 16:52:37 -0400
Message-Id: <9E57E780-D6F2-498E-B5D5-5E6220F07F74@fuzziesquirrel.com>
References: <7050D8BB-A7B0-4CA5-AA56-8AB61D762AEB@fuzziesquirrel.com>
 <CAPnigK=c+rpWLtB7XbaPPM3s2V8TAbgRgqKChUTKkNpUtC836Q@mail.gmail.com>
 <CAGMNF6VCJxS_ewJkpvGAUwtiJrgVUSp2ajeVeN+k7hZoiXj8gg@mail.gmail.com>
 <CAO=notwGr6KV6aSqoBMRH+X=jVakOWBCr86K9OA4MCC0ph6KbA@mail.gmail.com>
To: Patrick Venture <venture@google.com>
X-Mailer: Apple Mail (2.3445.104.11)
Content-Transfer-Encoding: quoted-printable
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
 Matt Spinler <mspinler@linux.ibm.com>, wangkair@cn.ibm.com,
 Andrew Geissler <geissonator@yahoo.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 4:29 PM, Patrick Venture <venture@google.com> wrote:

>>> On Mon, Oct 7, 2019 at 1:02 PM Brad Bishop =20
>>> <bradleyb@fuzziesquirrel.com> wrote:
>>>> I was trying to get meson going in phosphor-hwmon today and I stumbl=
ed =20
>>>> on a
>>>> unit test that doesn=E2=80=99t build under gcc 9.1.0.  The failing t=
est is the
>>>> average test.
>>>>
>>>> I just thought I=E2=80=99d quick throw this out there in case anyone=
 feels like
>>>> having a look.  Also, I think this means our repository CI environme=
nt =20
>>>> has
>>>> gotten out of sync with upstream Yocto?
>>>>
>>>> I realize =E2=80=9Cpatches welcome=E2=80=9D applies here for both is=
sues :-) but I just
>>>> wanted to broadcast them.
>>>>
>>>> thx -brad
>
> I don't see your patches on gerrit.  I don't mind building against
> experimental patches :)

Right=E2=80=A6I don=E2=80=99t have any patches for either of these proble=
ms.  I did just =20
put my patches that add meson support out there; however:

https://gerrit.openbmc-project.xyz/25877

thanks!
