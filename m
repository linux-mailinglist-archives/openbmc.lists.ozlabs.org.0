Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B004A38FC
	for <lists+openbmc@lfdr.de>; Sun, 30 Jan 2022 21:18:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jn2Zx1B8Rz3bSl
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 07:18:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=LXxa1GmF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=LXxa1GmF; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jn2ZV4Mldz2xXV
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 07:18:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643573878;
 bh=WHKec9KlEABs2CO4vZCuTuGwlLqgGtsX2DEZx9TfIYw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=LXxa1GmF8ddjigRYsLk+FUcrCdHYq8TnmRIoZ+Xx5guD2rSHfvsVloQKkzdSk5szM
 b22Jy3BNbZweQkGz1xCaMtYA5bRNHr9MPQogaJavsM5dfQ2z0eEEKZo4IfVI1owydq
 +YDSMzN6XQNWlp8bE5LlfI4IxH9qWSTw8fR1PLuQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4hvb-1mD3jd2Upb-011mKE; Sun, 30
 Jan 2022 21:17:58 +0100
Date: Sun, 30 Jan 2022 21:17:55 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 5/9] pinctrl: nuvoton: Add driver for WPCM450
Message-ID: <Yfbyc8AZ0i9b377V@latitude>
References: <20220129115228.2257310-6-j.neuschaefer@gmx.net>
 <202201292234.NpSNe4TD-lkp@intel.com>
 <CAHp75VdVoqRk6bLwaOPfGdfyVoH_9DUj2Lb4VBOHrhM9SpoMNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jm0/6VIYyZJCcLqN"
Content-Disposition: inline
In-Reply-To: <CAHp75VdVoqRk6bLwaOPfGdfyVoH_9DUj2Lb4VBOHrhM9SpoMNA@mail.gmail.com>
X-Provags-ID: V03:K1:4GOCgY+HgfHqSlLftYw6Ss7XZF65gtr6I+38e5TfVJVdft2pkLV
 tNVN5znJSp0VIpFM+Z/1LWK5odLxH4nAUNBglXxOmdg+UL79u4bTXgMeM/q5firchyHbGRL
 Zf4UsbsJkpG06C4Gjwgo8drGGLS/sPuP7a9OK6SbxDzpksiNZiO4Hd/MJa8LM9hLA70HahT
 uQf6ryOoFoBv5bp7+a1MQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:M/s+H1A7UcU=:3p+osN6ZE2pCys44ed+POz
 IAB0S01wkwGH8ykcEB1MP5KJGCzNhqPWBRzdEFHbYnLDK+AvCVFvVGAhCW0pNEV2XTfuYyjQ7
 YdhVb49zO21bnytEgYrybCUURAz7LIWSL/j7D4u/4E/Ye9TM+3JywABdCH7oCufWevimxyCoj
 lHN7aFTyCAf2NhtXGZRQKkBTNXlOuq+sDTfVL6TYNLywNhKxFNlFhS2VNKmJmfOmYFWLFm2gC
 F2TIFx71nmJ1es3XYyb16AhWvb/0lFhb2xA0F5zsHA3s2nRrpJmbuBTUqb8kn9nQUI3vwFNlB
 jxKuJZEZZ/Z2TSBKigu+BCwj++NZz/CHgQPSC9szBQ86koVf8Eg5li7k+PR3HsAamx2jdEtsQ
 EsMmqEQOWw97q4IrNrZEa0QIeD24uwrS/9OInUm7Do4ySDkrdX1oBlqFde9REjDE31XZZjbf8
 2iDTPeKkT2yl6eRuhkB3x9upACqr9fv6HvTd26DjJ9qFlv4mMNvCUaYH5wn40G8jzh49Y8Cra
 4JymDDrfDvXcnNv9ZIPZL5/ixSHA+ZxbT13q+AHka+VGFqMYg+55qGvOzu3iMfilgMUoPSI0P
 x7Sv2o6MNf3d0kffz4ZTG46fAaRGRfqenNu7JTEi8WnIcKC0435mE1PgVBC7A1tODFTwU74p1
 aR6K8T7QTApRM1cwmrQgMnVbacY83KMC10eqmtYDZFg+2e+qKmF8B8TQ8y4mD4dYqQigVhOrh
 Ng9Z/NrBePwTu6lfhDeXw8HSvvEjByFny7idzcekaTR2QXjiocGVxX5ghdSlI/1tSe5CquD3p
 Nl1sxXUrcg3MEYamRPvD7ST9sVjc1t/wb8Cso32c0BFkw9yZQrfB3Rff9Z1jpthGptPD9/Zyq
 ZH1Q4/PYGo/PFrqNQnC712VKAI9hX3NTczzt0uGDgPN2j/j8EUg3aEWaxfpHcqjTXhdUf0Y3M
 SBk6Gv2gGc4GiQbqvV+qeclVa5PbKn+bkVp3rtOlqqlKBLoAj0caqTKWeJmVxikc/E/2zrZCF
 VmCK/IM+AX/9zf5mCNP3LMntgBkSE1RCO1Fp55jt1ucSTyJYYRQliiVr4PluRxqR4anBwOw9Y
 LEcOqZuEeify28=
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
Cc: devicetree <devicetree@vger.kernel.org>, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, Avi Fishman <avifishman70@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--jm0/6VIYyZJCcLqN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 30, 2022 at 08:47:23PM +0200, Andy Shevchenko wrote:
> On Sat, Jan 29, 2022 at 4:10 PM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi "Jonathan,
> >
> > I love your patch! Perhaps something to improve:
> >
> > [auto build test WARNING on linusw-pinctrl/devel]
> > [also build test WARNING on robh/for-next linus/master v5.17-rc1 next-2=
0220128]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/Jonathan-Neusch-fer/Nu=
voton-WPCM450-pinctrl-and-GPIO-driver/20220129-195955
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pi=
nctrl.git devel
> > config: um-allmodconfig (https://download.01.org/0day-ci/archive/202201=
29/202201292234.NpSNe4TD-lkp@intel.com/config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > reproduce (this is a W=3D1 build):
> >         # https://github.com/0day-ci/linux/commit/3fd91ea1bad905592e89c=
8f987f6bd3740329b80
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review Jonathan-Neusch-fer/Nuvoton-WP=
CM450-pinctrl-and-GPIO-driver/20220129-195955
> >         git checkout 3fd91ea1bad905592e89c8f987f6bd3740329b80
> >         # save the config file to linux build tree
> >         mkdir build_dir
> >         make W=3D1 O=3Dbuild_dir ARCH=3Dum SHELL=3D/bin/bash drivers/pi=
nctrl/nuvoton/
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
>=20
> ...
>=20
> > >> drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:908: warning: "DS" redefin=
ed
> >      908 | #define DS(lo, hi) (((lo) << DRIVE_STRENGTH_LO_SHIFT) | \
> >          |
>=20
> >    arch/x86/um/shared/sysdep/ptrace_64.h:38: note: this is the location=
 of the previous definition
> >       38 | #define DS (HOST_DS * sizeof(long))
>=20
> This is a good example why short and namespace-less definitions are
> not always good even in standalone module.
>=20
> ...
>=20
> >    drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c: In function 'npcm7xx_get_=
groups_count':
> >    drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1564:21: warning: format '=
%d' expects argument of type 'int', but argument 4 has type 'long unsigned =
int' [-Wformat=3D]
>=20
> Should be %zu
>=20
> If it's already in for-next, there should be two patches to fix these iss=
ues.

These warnings are about the pinctrl-npcm7xx driver, which was merged
many releases ago, but started to be built due to the Kconfig change in
my patchset.

I'll fix them anyway.


Jonathan

--jm0/6VIYyZJCcLqN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmH28k4ACgkQCDBEmo7z
X9tbGBAAjvOrvlyTms9k3lD/kxnuNMDuDsix2wT4GRbtDD4LZgJPYBBMeDKHpc2R
CZWEBrGZpbK4FUYynHIFqvjPjEN8FiY8QVtwkI7Zc7M966v1SLe2YrOZK++p5U4L
HcuZW3hpRB7etlfSzprH6RVP3Lg/xnn9fj1o5LS6VsCLiMR+Phz7CKnQzEhd7v+G
ytmg1pOCi40zSwZkjI1D6IPwUvZKvz+FUUszL60zS4xVKv5SQFFuGCPDJAWRTYrR
sNf9HSvHXKjxS6LPuEvzQDR+FGy/ICS8/yEmEsasgzCdbpW2ehJiVsp4S07WHQe1
ALyonug6EpCISBpZGIXEPKojVcCkcqFat/5ZFkH2rOT5o9avhZ3p5YtWt9YXBbZZ
1yhLHRuNuJI3sjKYgFtBQHvA/d+yjKPz3KtkthZs8UGI8Fi5jc4+zSMbvDav9U3B
lUm4x8hF9VbLTHKDM40D7sIUlx2jHQjRKCkcLEdr3CtJRNbrN/Vy554PZ7wTq6OW
9Dqo7ExjmQbQQqwOn9vDVtrwkgdO9LTasZba+MpqRPYaKomPsNZrU26I9HyAccLY
W8AY2AR1iwVl3JCrIgpJKCWTNJJzZGh7cI0HtMLY3DKmuTWJc9j+p8dP/Q6dFIXK
Hoq5G12A8HXJvR+46QdMeq20tfkGx1MVT+0xvXQnfkkg+gh/W2U=
=y+iT
-----END PGP SIGNATURE-----

--jm0/6VIYyZJCcLqN--
