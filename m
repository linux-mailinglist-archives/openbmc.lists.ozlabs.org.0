Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 256C816B0E6
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 21:24:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RD7F661LzDqTY
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 07:24:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TbLJvyA0; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RD6Z3t3PzDqSS
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 07:23:48 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id q81so10272616oig.0
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 12:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ousQFp+7MdUC8o9MBT6+2+qYse/LWR/za7NDMdl7IuY=;
 b=TbLJvyA0sM6cyf5M43iH2myGKaZxED5J7m6UvY6jWYQukvhpyihYL/WhFvntGs8J/u
 oeSoqQCrmYuGh4mfzIfbbIOaPZXUNgUGa2Spp9ijFSDCh9cw1Sw8xBAUZzIYt6DgPRj8
 UHGLUCM1KPgm7ePuqFTFe7MR8ti3X6IUMdPfw8j4T+hqUcGPTxmLRWOtQsoSZWzTCA5c
 E7k0ddR6coq4/nzCKkrOEyYgNFMcrN/PJTnq8PMpk+dzu1V95xW81H0e6W2CHJA0mSTF
 hLglKJqVz1Rz3MWXPnCokhf6ozZpbGfn9nIBwwbzLWOIBYf0WAC1slneL1O10QbWO/bZ
 mPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ousQFp+7MdUC8o9MBT6+2+qYse/LWR/za7NDMdl7IuY=;
 b=dpx0zEc4xtBoXsrSsa2naV/S8/yZ1Bqi+5or/W39UQFMHPExceIHgGS4le6OpwrZf7
 y5P3dMkAqnB4LrXYmWVvaVtUixaqd8OGfljWDzg9Sue/th7uoRxx5C61rk4WgT0qzPcs
 THCnCUZ1slMcxwcIH01B6bZ3PSQkH0iZbDxezpjTJEPYrmlG5EedPrc8/CBiNNZFLVha
 +qsHDJKDeywG81pnfZ3fWmp1ZRNXMT+AHh6EkCGwaLsrOh7fONDJ8QOyFWtb7qkCgmGC
 GIBr2M3pwBr/pmZOZp/FvgYRhmBlcg7AkgfkjGmOAkzqkxODA5H+x64EcGVa4mNKj7bW
 mzNw==
X-Gm-Message-State: APjAAAV8gsdSfH3yRY8pTTYDAAACR94AHHIh/XfvJnHgi36tvPLjCpeE
 F2VwxrsXXFlSbuPWSnUcN1U=
X-Google-Smtp-Source: APXvYqwrbBo119AF49EGPmrXtsfOHGuB1LPeJU8APDswnYeo6/Dyom7AlyChOYW3unm75tOL0edD1g==
X-Received: by 2002:aca:220c:: with SMTP id b12mr643870oic.55.1582575824474;
 Mon, 24 Feb 2020 12:23:44 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:9de1:6afc:2c8a:7364])
 by smtp.gmail.com with ESMTPSA id k18sm4350470oiw.44.2020.02.24.12.23.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Feb 2020 12:23:44 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: OpenBMC Starting Point
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <CA+k9xxb0eBfXVeA4zxULKL-0NCwmO6=vPw7TBkyGt4fc6xfmOg@mail.gmail.com>
Date: Mon, 24 Feb 2020 14:23:43 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <217C5292-AFE8-4139-A1DF-0761BF719781@gmail.com>
References: <CA+k9xxY2wfrzE=kQOM24wc5pgs+poqNEKyHooQNfxNfZrSsGFA@mail.gmail.com>
 <5937.1579503424@localhost>
 <CA+k9xxb0eBfXVeA4zxULKL-0NCwmO6=vPw7TBkyGt4fc6xfmOg@mail.gmail.com>
To: Samuel Herts <sdherts@gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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
Cc: openbmc@lists.ozlabs.org, Michael Richardson <mcr@sandelman.ca>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Feb 24, 2020, at 9:40 AM, Samuel Herts <sdherts@gmail.com> wrote:
>=20
> So if I wanted a c++ script to run on the bmc whenever I desired, how =
exactly would I go about implementing it as a module to run? Kind of =
like the Phosphor state manager module that the Hello World guide starts =
on, specifically, what steps would I need to take or what resources =
should I look into for creating my own module that will run when a =
specific command is sent, like the systemctl start phosphor.=20


This would probably make a good tutorial under
https://github.com/openbmc/docs/tree/master/development
but here=E2=80=99s the really fast answer from my perspective.

First you create a git repository somewhere (i.e. github).

Next you pick a logical location in for your recipe to
be located. For example if it was going to be a package used
by all of OpenBMC, it would go out somewhere in
=
https://github.com/openbmc/openbmc/tree/master/meta-phosphor/recipes-phosp=
hor

A good example is bmcweb:
=
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosp=
hor/interfaces/bmcweb_git.bb
You=E2=80=99d make a recipe like this, point SRC_URI and SRCREV to your
code and the commit id to pick up.

You=E2=80=99d create your own service file, like bmcweb.service
(note the service file is packaged in your repo).
(i.e. https://github.com/openbmc/bmcweb/blob/master/bmcweb.service.in)
For the [Install] section you would just put the following
to ensure your service was started on BMC boot up.
WantedBy=3Dmulti-user.target
You=E2=80=99d adjust the ExecStart to call your application

Note that bmcweb uses CMake but we=E2=80=99re moving a lot of
projects to meson which is what I=E2=80=99d recommend if you=E2=80=99re
creating a new project.
=
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-state-manager/+/2787=
8
is an example of adding service files to meson.

Then you would go into a packagegroup, like
=
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosp=
hor/packagegroups/packagegroup-obmc-apps.bb
and do something similar to what they did with
bmcweb and add it as an RDEPENDS

Then you would bitbake your image and voila, your code would
be pulled down, built, and packaged into the image. When you
start it in QEMU you would see your application run.

If you were writing something you thought would be useful
for the community then you would send out an email and
write up a design doc to get feedback on the right
location for the code and recipe to go.
https://github.com/openbmc/docs/blob/master/designs/design-template.md=20=


Andrew

>=20
> On Mon, Jan 20, 2020 at 1:57 AM Michael Richardson <mcr@sandelman.ca> =
wrote:
>=20
> Samuel Herts <sdherts@gmail.com> wrote:
>     > I am currently working on getting a working OpenBMC test =
environment
>     > up and running. I am using VirtualBox and the github Development
>     > Environment tutorial. I had a couple questions regarding how to =
make
>     > our own modules. Would it be possible to upload files to the bmc =
on
>     > the virtual server?
>=20
> You can do that.
> The disk is rather small by default.
> If you are using VirtualBox, you may be able to use the vboxfs file =
system to
> mount the host. That might require adding modules to the kernel.
>=20
>     > And would I be able to make a script which can read text off of =
that
>     > file inside the bmc chip?
>=20
>     > I have a physical server which I am not using yet, would I be =
able to
>     > install openbmc and the scripts and insert the file onto the =
actual
>     > bmc chip, and eventually read from that file?
>=20
> Maybe. What server do you have?
>=20
> --
> ]               Never tell me the odds!                 | ipv6 mesh =
networks [
> ]   Michael Richardson, Sandelman Software Works        |    IoT =
architect   [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on =
rails    [
>=20
>=20
>=20
> --=20
> Sincerely,=20
> Samuel Herts

