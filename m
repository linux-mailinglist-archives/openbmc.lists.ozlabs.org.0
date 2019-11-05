Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6036BEF305
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 02:50:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476XgM3Rx4zF49H
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 12:50:39 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 476Xfm18XmzF374
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 12:50:07 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 7C9BB6DBDD;
 Mon,  4 Nov 2019 20:50:03 -0500 (EST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: Issue found during installing systemd unit from repo
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAARXrtkU_0SYLd3VeqsVo-LYkVNHo_F4Ge9oQ=+M37WNJvGeqQ@mail.gmail.com>
Date: Mon, 4 Nov 2019 20:50:03 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <425E05BE-FFF3-44AE-942E-655A1585A16F@fuzziesquirrel.com>
References: <CAARXrtnas2R+cbdRmUOwDtibt17h=WTBNxvfPue5NVYuAD31Zg@mail.gmail.com>
 <1C10C853-9371-4F83-A205-DF2572CFB3B6@fuzziesquirrel.com>
 <CAARXrtkU_0SYLd3VeqsVo-LYkVNHo_F4Ge9oQ=+M37WNJvGeqQ@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 George Liu <liuxiwei1013@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Nov 4, 2019, at 8:47 PM, Lei YU <mine260309@gmail.com> wrote:
>=20
> On Tue, Nov 5, 2019 at 7:05 AM Brad Bishop =
<bradleyb@fuzziesquirrel.com> wrote:
>>=20
>>=20
>>=20
>>> On Nov 4, 2019, at 12:39 AM, Lei YU <mine260309@gmail.com> wrote:
>>>=20
>>> https://github.com/openbmc/openbmc/issues/3627
>>=20
>> Hi Lei YU
>>=20
>> Do you have a good handle on the resolution to this problem?
>=20
> The simple way is to "fix" the services in repo:
> * Use ${xxx} instead of ${{xxx}}
> * Manually expand the "known" variables, e.g. {envfiledir} to /etc
>=20
> Then we are all good.
> I am not sure if that is the *expected* fix though.

Yes, this is the expected fix.

If you want to parameterize tokens in the unit file you can still do =
that using the repo build system.

-brad=
