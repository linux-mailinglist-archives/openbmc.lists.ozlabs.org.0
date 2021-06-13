Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA483A5742
	for <lists+openbmc@lfdr.de>; Sun, 13 Jun 2021 11:23:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G2pzP6tzVz3018
	for <lists+openbmc@lfdr.de>; Sun, 13 Jun 2021 19:23:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=eRvjSB0i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=eRvjSB0i; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G2pz91lVzz2yXh
 for <openbmc@lists.ozlabs.org>; Sun, 13 Jun 2021 19:23:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623576186;
 bh=okNCnhz8ZcJc8WTr8+XvkczOnp6GsFLk6kg/e2sFsg8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=eRvjSB0iWPWP66dr02za6lhNEELH+HFGuVB2iXxnZG2rIqunvxVi8KTAT8OEtqZEI
 D4aw0k/OgsYKFPzfysV/gJtavawYqeUk2KSuCKv/29bK0BIPTxCp+u1rpbUkFKcrdB
 IjQgSkqMadz5C+ko4A2Ctx1TceV7rknehg3mChwk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N95eJ-1lDmE12cUh-016APA; Sun, 13
 Jun 2021 11:23:06 +0200
Date: Sun, 13 Jun 2021 11:23:04 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/8] ARM: dts: wpcm450: Add global control registers
 (GCR) node
Message-ID: <YMXOeBWu31LC+23X@latitude>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
 <20210602120329.2444672-4-j.neuschaefer@gmx.net>
 <CACRpkdY7AqcE4CMAdZHR-DfV-3ZCO3h9kYUZoZCUodLQmyyfXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="e6m2u25cBZWWEgkD"
Content-Disposition: inline
In-Reply-To: <CACRpkdY7AqcE4CMAdZHR-DfV-3ZCO3h9kYUZoZCUodLQmyyfXw@mail.gmail.com>
X-Provags-ID: V03:K1:7dJQb3p8adrc+g8Un5qHDgxFkFzatiPk/BDCWczj+T39aSmdeul
 r3ibglWBNORKNbCUZZI39cr2UkhymiYhva5qwHtDbc+DB31IN/o1cyV/hLLrBZLLkR8HrJ4
 SBn0WN7jiVPwfNuACbNi8Rl1YkNm7cvUqwJ0BXhEr1WTChESP9D+WR5NMX2UngBSGLRLSMD
 58MA08VMhfSEvKX0EHE1w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8WwyLXGQffA=:LDai38MS5FyP7r2snIsCT9
 v18Fc7ffHbAdpyb4Rwqe6rNLKW25A9JUYOript0Q0WgZ52JOJOx2ytvxxeIuNg8oCM6C3H9bF
 5AlgItw5/M/GraEM/fh7SFCBposrFRh+W5V70T0HeKgQSm6Xor3Jr/8qwE3L84NXDFlhecuqV
 fj6ymLSr4aKKhC3LFd/tzK6oyZYLrWpfoSXLg8bDSyP4pG1J/fZLWBktfK3Q6ztcphwHFK2x/
 Gw0VnFXQK/BTN4B5cnmarTgAKXOCbzqCNFbkJ+DJ7c2f0xBTFm3IatJbx1cUZ9XdIwIotLqP7
 JwAZIEC4WNJ1kbze3vGtsgmedJZl5vuWLN0h5Tv7MwvI/cSvlu2SiOmEhmc2bPN6Cc3a88/t4
 19okC490OZ/tMYVII9GlpTIDyVcKqOdq6fphyKEDhTwY9UP52sfDvnBrL++QdGL8ugvcXFWMQ
 1M5oOJFBturcje4LontH3HROBIMhfiBh7jmtOJLsRK2Dj1lyQfm0za52/14jAb3MWQa9OeSXp
 Bq1pqFsusu8RJs4b8F63qbs2o8EGj7RhjOvMTUELdsGtGCUwRhfY7TpOwbHL4h/qIxgL15pVa
 fjiF8Lns0xggXFm04WHA/wOKYvmofP7SWCvSTlAuSdlXZaXaR/rHNgoDXEENC5KqKGJxMdvvN
 fBjSzmStzNT5FtxGUhlEQyfy9MT2j6pd8Kzn0jqci2WXOErW7uXjJrN4uteIPVGv10MM7CtM/
 WvEvS9xNRxH+46CvPRC/fF4lBTRPjS8TEw3q40ZgY5+pdLd9BMhvzU5u35/7KoBpdcrjVvYUg
 S1x0OhnDvWtON8Rmk5yEBHeX+/Vst2p2xK4ZI+QiBb2DlmJYGx30bTBVBpMzDMI3aNvJPhtat
 cNEC6fPENScb2haC7WTPWHcp6Bm5MVgx658KfOcRpXB11O1IYFI27NQRLHKbJjN8ZjPok1omw
 CjJ0yO24THU+8sDNUrvZtbLaFb+1aBvynlPUfFWbU7LaQDUFYXxLXojcki3mMn7Tfuv5xg3W/
 YkaktY7cVYqzbTpxO7X7sR0T65uLxOc2I1EeCtQEzgRVWlg4pPSs+fAAv3RG78IkxoRYPt7vI
 X6m2bD4QK8Oa2IQOWwbIDm+KRHaM9ddHePFI/mWkOWTbnhc2mLNwNPAQw==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--e6m2u25cBZWWEgkD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 04, 2021 at 10:01:07AM +0200, Linus Walleij wrote:
> On Wed, Jun 2, 2021 at 2:04 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
>=20
> > The Global Control Registers (GCR) are a block of registers in Nuvoton
> > SoCs that expose misc functionality such as chip model and version
> > information or pinmux settings.
> >
> > This patch adds a GCR node to nuvoton-wpcm450.dtsi in preparation for
> > enabling pinctrl on this SoC.
> >
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>=20
> As noted I would name this architecture-neutral with
> syscon@...

Will do.


Jonathan Neusch=C3=A4fer

--e6m2u25cBZWWEgkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmDFzngACgkQCDBEmo7z
X9t6JQ//chcN7SkKZs+e33NvgLaS4erJo3PPq7tgIrSyot+fc9+JClf7/gK3sdxw
Y4LJaOFI+Ueg6nrQXayFFni61GC1DEMtCoLQbgWsR8G91H5HHA5gBXmWu/9GKNTE
ctuNCII0PKszX/jB3hMDP4rQ0szMZNjWQShbtOMgBUMvMarOtXzJBNb4Pblh3GYI
DODgdRfIMIQZDPRUpVq2OwamCpD3sX4QUY9XGSJtm9uj3unvVzCroDmzZuf0FnYq
USgZCEsFnpTtq87+TMUw/mO5LEK4vD4H5tZ7GYguVpiwJr8fW8qzY1xxkFgM4rmb
qK9vH+bot2jkKwn4xIpK528YOnBAuo5zF+VcIu+y9KPWDOCEZH7+qb/mKyXUv2Sm
vS2+LPkXc0YjVvSCR7p6wWwvsS3djpBIVkVA8y3Dj5TiJhih/yJd+UVr9SlaEB8y
u7RWu9Whbhz6wPpEBHE6sn7bhT7ArM3ZKqMvvv3eKOI3osqaol/vnHRFch5qNaMC
Anz4TCT7h3NpFtXodAfbel/Czznhl06EN8EWp0HaCWz+0aV4plR0K4le0wNdnfW7
nlgy/cD2SozTC1+048iR8pv8SHQEVxBEb9eFtTsMIWWhoYxH/mscuR7NFtYPDc1I
GtQXVYzAlftsfU6QMY/3zZwlrcAJt6L+xqkeQGJQyetHCLFlSco=
=flg7
-----END PGP SIGNATURE-----

--e6m2u25cBZWWEgkD--
