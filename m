Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 529E132D712
	for <lists+openbmc@lfdr.de>; Thu,  4 Mar 2021 16:50:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrwL42JJzz3d56
	for <lists+openbmc@lfdr.de>; Fri,  5 Mar 2021 02:50:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=gGQfHTPB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=gGQfHTPB; 
 dkim-atps=neutral
X-Greylist: delayed 357 seconds by postgrey-1.36 at boromir;
 Fri, 05 Mar 2021 02:49:48 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrwKm3cMSz30M3
 for <openbmc@lists.ozlabs.org>; Fri,  5 Mar 2021 02:49:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1614872984;
 bh=VPzS3XtaV2jscfNrk2ckzZDmYf8qCvklrXC7Xl+tdY8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=gGQfHTPBOkyvvUgThgguY82/3w58geLqNHdLTAiZ+sGNw0zonSCERkoZoL8MaLluc
 CtJ4NrKblbf00yoQLb+LYdRB8k1vVRh26ylCtwfYne29IP2GiHp/T8RgumIM15790E
 Ga7DtuFOptoRLHjpUEpAB/nioJfNK3RYFfYcZ5A8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1wlv-1lkSgz3l9N-012I0C; Thu, 04
 Mar 2021 16:42:09 +0100
Date: Thu, 4 Mar 2021 16:42:07 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 RESEND 2/2] ARM: dts: Add board-specific compatible
 string to npcm750-evb devicetree
Message-ID: <YED/zzV5kb35k2vb@latitude>
References: <20210303154622.3018839-1-j.neuschaefer@gmx.net>
 <20210303154622.3018839-2-j.neuschaefer@gmx.net>
 <CAP6Zq1hwp+wJpbN496096q8izRRoU2Jg+OKugcSk+BcXWfME9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jauI0NPFqHr1tpGx"
Content-Disposition: inline
In-Reply-To: <CAP6Zq1hwp+wJpbN496096q8izRRoU2Jg+OKugcSk+BcXWfME9A@mail.gmail.com>
X-Provags-ID: V03:K1:dX47pp6N1kFMXQkOQn8hUd6L0alawbDNcXiMH+vHmgaY+iWFk6b
 e9jGTEDQojWW+hCidvV93nYTNvj530fL/7wFR89fsleK1WFtHenjtYOGBnSd51jStjCACoP
 D0XXKulJ3Nk4cOYuDb+MYWd9VFf98uc1IuWiwbh588VsLWUZLtmQ2epsJGSh1LpFMwA/38b
 vCHD1fhYpAd3+GOSM1pgw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UpfOGr5ZjNE=:ZlW2wK3sI2APho3ekE/LHP
 AqR0Cgj4wG4/Fb98KYlR0B2V2ZZWMxRVfpuk/vi+FW931YbeEB0c56VVHUl1Yk7rCdHjHwKe6
 PJtYqfjk9iKKuJNWUODRINWZMkLT74Cht8EAaSuZnW6x41X4P375mhdZ7gT5ujpCOSWq957GL
 PCuIjda9ISX3oYSCgv6jDe4dOncpKytOVUnwhAH+6CSIbBy1gmJD/whC8dIo+KbHuP6cXiFFv
 Q1Jin3KVydwMj6/0UjIiQgZBKlFtvW0boVLQZi+1tK3os5GZ9QROnlp4o4LlQ0aoUToPhPRqr
 uFSZxVwFE5e+bEYIbok74HNHYb7bIJbYEQfTmxpnj40rWdlFgcMut/1o1iLbOr0FQJVjFBwz9
 qMf8X2VT/xe17NcoH9ndP+vSjFsndwsTc/DjGFoeH+ZPkDilF7pALyXCbOCoR6ey7kjBMUBGh
 yAo2T18ykAuT8e1raxxELqppBot+mLNgt8B+IcADLQXwbaSgRl+WFRtqsI/e4VPlCGHkD8coP
 jXNYYINin0F2xEtdLSxpIoRRxhePC4/TW2CuBkrquVAXv79aUmrz4Ez2WRpmK0mliJ1RaMjpC
 ujTxmswFfbLxCoazdLZ9n/Y9kuU+sfQ7jsira9XbZYap01Hr69DYDmXPw2W+Nb+gMex6KkLfw
 wNnM3YtthEpamAsUg75gMWyUar2p1rNHFPmMr7TvAggv77n7OV080pZDnBKCTjVfspOE8KSSq
 dt5tOyLT9I779pgjiZJdcJyAqBzBJ36LPU0/QYodq5pK/dkcG/jD8iH17JMiRtvM0ltMulfPQ
 ywCvdjl8+PFZrgCuCNS4TMdxqI6a7DbhX7CtrVzyO4Jkw9aoeU5ZVEroWdnZayAiCEKSbNgEj
 wnpmHVk3wmVjuclDgCww==
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--jauI0NPFqHr1tpGx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 04, 2021 at 05:21:36PM +0200, Tomer Maimon wrote:
> Hi Jonathan,
>=20
> Thanks a lot for sending the patch,
>=20
> I think that when it related to the SoC EVB it can stay with the
> genral compatible name nuvoton,npcm750
>=20
> you can see it also in,
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-as=
t2500-evb.dts#L8

To make the single compatible string match the DT binding, I'll have to
write the binding a little differently. I wrote it like this:

  compatible:
    oneOf:
      - description: NPCM750 based boards
        items:
          - enum:
              - nuvoton,npcm750-evb         # NPCM750 evaluation board
          - const: nuvoton,npcm750


I guess I could do something like this:

  compatible:
    oneOf:
      - description: NPCM750 development board
        const: nuvoton,npcm750


And later add this part, when needed:

      - description: NPCM750 based boards
        items:
          - enum:
              - vendor,foo-bar-bmc
          - const: nuvoton,npcm750


What do you think?


Thanks,
Jonathan Neusch=C3=A4fer


> On Wed, 3 Mar 2021 at 17:47, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.=
net>
> wrote:
[...]
> >  / {
> >         model =3D "Nuvoton npcm750 Development Board (Device Tree)";
> > -       compatible =3D "nuvoton,npcm750";
> > +       compatible =3D "nuvoton,npcm750-evb", "nuvoton,npcm750";

--jauI0NPFqHr1tpGx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmBA/8UACgkQCDBEmo7z
X9uThA//c7olZ+Kqwd7U6t2kYlBKyTffPaezxpMzoBRm279l3m6K766RRCLYoeQL
wnAM/m6lvU3OXGiQwGxGyruFjDWxXo5p8UNFW+dI3JLzpkty7Jl7gu/EH7e/nWad
ftV4REogYqABKD8WL6LXk9cEf/8nnyVJX2PAlNjcNIGRcYusQ66Y75gQRm6JtBjN
QTImrmP1FySoS/Gea8CmKfFWYjSpccMYgG7aObHc+7SbtArJ6inBT15kbKba53k5
F047NDjZslQk/h+j0JxDWwef70KwtDT2S63DdJfTHUbW52Z6xuwd0xfSMk1rTun1
Gg1oBiQLXg5554IYB9d773X03uOeGJasT4et33obA0vdaDsYd6AAHcSMX80rZaiZ
fyRbFRjHM08Q6XZ+VayvUkxkN6of5ZpM+wBlGAPHJuAyXGfbCoHnHRLJd1c2XXjT
C5duUdTEF2pWGyBc/C4UrnTy8AUKenPDy4Zm0ZA2m6OvX1LQ2WF9pwynnDb1OZaT
a3HsfNDyMoU1I41MRs1QsXdiUOplX78PDS008incEHgryOdw/3g0JEYeMls442oU
pbleWoWzObbrroZ/fU0qe08zvY/ZG4XJcys+CIkpElyx3uDQhKzlpP6Z8RHprPyh
KXqF0RRUZtbvNeoS1sstiw+LGbDjRrdzdQ8gAHxRxiZNSuil66I=
=l5TV
-----END PGP SIGNATURE-----

--jauI0NPFqHr1tpGx--
