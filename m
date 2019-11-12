Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D5CF990F
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 19:49:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CGxR2YzTzF3ZJ
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 05:49:15 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CFyw3CLMzF3p8
 for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2019 05:05:28 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id C53ED6E223;
 Tue, 12 Nov 2019 13:05:24 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: Yocto/bitbake recipe 'diff test'?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAGMNF6W8bWD_2Zpynz9vcVdGA9d8B+QfbA=oau2zQj+xpf9NEw@mail.gmail.com>
Date: Tue, 12 Nov 2019 13:05:24 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <CEB2088C-C91F-46ED-9FC1-2480893767E0@fuzziesquirrel.com>
References: <CAGMNF6U81+d9wz4h_TiPBA0EoxC6bhiUZ67mozWWwwT4GTVMCg@mail.gmail.com>
 <9AC7EF7E-3FFF-4855-B9DE-80F3B68236E0@fuzziesquirrel.com>
 <CAGMNF6W8bWD_2Zpynz9vcVdGA9d8B+QfbA=oau2zQj+xpf9NEw@mail.gmail.com>
To: Kun Yi <kunyi@google.com>
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
Cc: yocto@yoctoproject.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Nov 12, 2019, at 1:55 AM, Kun Yi <kunyi@google.com> wrote:
> =20
> Sure, it's partially due to how we set up the build downstream. Our =
downstream would put all the needed layers in one bblayers file, so we =
would have something like:
>=20
>   ##OEROOT##/meta \
>   ##OEROOT##/meta-poky \
>   ##OEROOT##/meta-openembedded/meta-oe \
>   ##OEROOT##/meta-openembedded/meta-networking \
>   ##OEROOT##/meta-openembedded/meta-python \
>   ##OEROOT##/meta-phosphor \
>   ##OEROOT##/meta-google \
>   ##OEROOT##/meta-google-gbmc \
>   ##OEROOT##/meta-aspeed \
>   ##OEROOT##/meta-nuvoton \
>   ##OEROOT##/meta-openpower \
>   ##OEROOT##/meta-ingrasys \
>   ##OEROOT##/meta-ingrasys/meta-zaius \
>   ##OEROOT##/meta-quanta \
>   ##OEROOT##/meta-quanta/meta-gsj \
> ...
>=20
> The distinct advantage of this approach is that we would be able to =
build images for different machine types using the same layer conf, so =
the build doesn't need to be reconfigured if you were to test on another =
platform.
>=20
> The challenge, as you can imagine, is that each meta layer now cannot =
'leak' any variable. e.g. if some recipe in meta-quanta sets a variable =
for quanta systems only, then it must specify "_quanta" or a similar =
suffix to prevent the variable expansion to apply to other systems. I =
think this rule is generally preferred upstream, but not sure whether it =
is an official guideline.
>=20
> With my proposal, it would be much easier for a multi-system layer =
setup like ours to work. Not only that, it would benefit the most common =
use cases: moving variable definitions in bitbake recipes, or even just =
adding a variable for a particular machine feature. Having a visible =
diff would make reviewing the changes so much easier.

Thanks for the background Kun.

I know yocto has a concept of Q&A checks that can be run - would it make =
sense to try something like this via that mechanism?  Emit warnings =
(which we can elevate to build failures in CI) if variables aren=E2=80=99t=
 properly overriden?  That is nice because it doesn=E2=80=99t require =
any changes to our CI system.

I=E2=80=99ve cross posted to the yocto mailing list in case there is any =
interest or ideas there.  Here is a link to the entire thread as I =
remove a little too much context I think=E2=80=A6

https://lists.ozlabs.org/pipermail/openbmc/2019-November/019409.html

-brad=
