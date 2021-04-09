Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6D63596FF
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 09:58:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGr994jfqz3bV0
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 17:58:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=l6f6vRRI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=l6f6vRRI; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGr8w6zFPz2xxt
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 17:58:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1617955071;
 bh=smjLIm7knnsXp8d7wIS7Om6/WhYBP35uRkxwx5zCsgo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=l6f6vRRIbl0KGiksFvnQxTBF8rvuVJdM3qT9CNcETpBUUFt8ZKGHsx2LQLAfHmchV
 cO+vrLZASh8kt67+tAF0thsuS3Xj98PX/+vPAW/sTPtrsI7uRhXEBResHEwMar+GR6
 EHdRCbv6A7Dk7BVQeMnykcFW+5R9fGZn5BsAIc+g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49hB-1le5Z14481-0103lK; Fri, 09
 Apr 2021 09:57:51 +0200
Date: Fri, 9 Apr 2021 09:57:47 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 00/10] Initial support for Nuvoton WPCM450 BMC SoC
Message-ID: <YHAI+x4OXBKvJkUH@latitude>
References: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
 <CAK8P3a0VfnUucvZNkA9PdxrWiYUOkisV00v-375PmgQYp4aXoQ@mail.gmail.com>
 <YGzZofPvT80b5gS5@latitude>
 <CACPK8XdbwbsbJuZmvsFqJ+x5viu652vpfR1kwB4Gu+khRHNt_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KGb1lnLxRAL4SeVN"
Content-Disposition: inline
In-Reply-To: <CACPK8XdbwbsbJuZmvsFqJ+x5viu652vpfR1kwB4Gu+khRHNt_g@mail.gmail.com>
X-Provags-ID: V03:K1:f3r2GSb6GMPKvoGNriNI6mCXtrrYQnwQdV89ZhNwAqRBM/7Rj7u
 8uxcUEkMASoH45OKWD1fvw7FcGG0TV6LsJ8in5uloKs/ZQg6VVya9Iu222VGF/VQQvxgER5
 Z10m2THIWp0ML9WZ9TeRMlAGtazJBn1Kn/kXffVGbK2jcDpuyUOYk4Bt/TrvUL+su4LejDq
 CZxZ6CHBtW2w4TVGEWppA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:z8m6XhpTG7M=:TJ205MO4O6DWL/mCxByEUq
 mcXH7yK7/RXf0gVxmfNUAr1d4lW1MNWbaj2w53Nz5ils6eZg3zL3Qik25uVOccJPn2Cki3QXi
 xyMqV5D0emlzIGBG50MUJpelaZGI3OR4O+uJ46m1qLY63T4Gtl6WxPxeg0/LTKe347aicFApj
 6rPH2CQA14Ko4O4LKQnVtgq+N1AxyLtNpoaB05msET8IN1h6ForU4/2zrmf0qAoPmCDCWm6Wy
 /EAQPZxuC1oO6pJIMFsFMbBvHop/WsJOlOfxyzGW/MA2OxlNnGQWwt/SNrJsXwDDk1u2pdiDO
 ZYHKq+uJW9XX+wlDmYcMse6bwYa53T1f/EzbXc/ij2AQqmLBBEzdwVy1mNlf7vEEVEZi6E5p/
 w6Vq2f68l5hmjRuYOVf9HuI4hbsgLIi3wwun+NjPy6ZKXJ5iUQWy/2+4SFVixVDZNZBnWFgsA
 IBfhZmcjeR6+hDmNLDa3LjhD39ZFey2i4vjow9cStGCMobpzWkhMV7Q62c3v7pzJYp6GuAQLb
 PvjXwB9Y4hAkfwGrBdbLI5q5u/YIlPNVs8gzGKxALG794jhGkukUAE4Z7sDwb0N8dHws7osNe
 OLU7nCU8TBO5o9ZrGBJUsstl19SB8Ea6VfJC5UM5Djh+/u6eaz23J9TJGSzD+YelYJVSjSAhK
 3/Fjr/2+//dljKA9IioOlHJnBC5kIhAe+yzitbQ1E2mOuT+PMwTvziCbFiV5pqoXeFGtPg1TH
 Bovq87+VzPjd4KNiX9EQufXweAjlw4VAUjbI4amNxO8p4At23RkuJnJ7Vn6BXTtHf9SMHcV3G
 hiKIcOwLlY8+dPWLpdtzHx/ThcTcfRzvrsCWvVvUBuO7JoAsurfYonyapIQCNAXXJLP22Rywp
 ZwWvpHlFiA0i7f6QZvCn0EkxupLerrXoSp3Jz1c8E/BtLT22y9bs1DZX3HzYQMwrDtaf17LnA
 Y3uY4KWJAeCjHQF5b70f1h5WejJfbFmzh7XSa2j3VxpekOsyxHOWAXjYNyhPjr1CKH6Vl5RYw
 Q3BamvSq9hHOb6aEVjt2lPBwli27AeG+EYe8wSs5f+0drz/uGe+h4tiPr14G8bEu10+VMEK6J
 6mtvjTNR/tGQEZPq4X46lkMuEy6PFZgkH1oajGI5iR9hlG11wQy3iXOo8ih68eAwFt1Pbr3b6
 NAfaJoWrxOiW+7jrquVbLglOQiKzLXj930AukAY8Mbr1S5JCVOzvEW9gzb0AMsQstKMbPyLtm
 ynyjIhNa+lgY3I+d9
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
Cc: DTML <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--KGb1lnLxRAL4SeVN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 09, 2021 at 04:37:34AM +0000, Joel Stanley wrote:
> On Tue, 6 Apr 2021 at 21:59, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.=
net> wrote:
> >
> > On Tue, Apr 06, 2021 at 05:15:01PM +0200, Arnd Bergmann wrote:
> > > On Tue, Apr 6, 2021 at 2:09 PM Jonathan Neusch=C3=A4fer
> > > <j.neuschaefer@gmx.net> wrote:
> > > >
> > > > This series adds basic support for the Nuvoton WPCM450 BMC SoC. It'=
s an older
> > > > SoC but still commonly found on eBay, mostly in Supermicro X9 serve=
r boards.
> > > >
> > > > Third-party documentation is available at: https://github.com/neusc=
haefer/wpcm450/wiki
> > > >
> > > > Patches 1-4 add devicetree bindings for the WPCM450 SoC and its var=
ious parts.
> > > > Patches 5-7 add arch and driver support. Patches 8 and 9 add a devi=
cetree for
> > > > the SoC and a board based on it. Patch 10 finally updates the MAINT=
AINERS file.
> > > >
> > > > Patch 2 requires "dt-bindings: arm: Convert nuvoton,npcm750 binding=
 to YAML"
> > > > (https://lore.kernel.org/lkml/20210320164023.614059-1-j.neuschaefer=
@gmx.net/)
> > >
> > > Hi Jonathan,
> > >
> > > It appears these patches are doing roughly the right thing, and we ma=
y still
> > > be able to get them into v5.13, but I'm not sure what your plan for m=
aintaining
> > > them is. The two options are that you either send your patches to be =
picked up
> > > by Joel, or you send everything directly to soc@kernel.org once it's =
fully
> > > reviewed.
> >
> > The route via Joel sounds alright with me. I've Cc'd him on this version
> > of the series.
>=20
> I've had a look at the series and it looks good to me:
>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>=20
> Nice work Jonathan.
>=20
> I'll put this in it's own branch along with the bindings change it
> depends on and send a pull request to Arnd for v5.13.

Thanks a bunch!

A few patches are going through other branches (IRQ bindings+driver;
watchdog bindings+driver probably, I guess). That leaves the following
patches to go into your branch, AFAIUI:

[PATCH v2 01/10] dt-bindings: vendor-prefixes: Add Supermicro
[PATCH v2 02/10] dt-bindings: arm: npcm: Add nuvoton,wpcm450 compatible str=
ing
[PATCH v2 05/10] ARM: npcm: Introduce Nuvoton WPCM450 SoC
[PATCH v2 08/10] ARM: dts: Add devicetree for Nuvoton WPCM450 BMC chip
[PATCH v2 09/10] ARM: dts: Add devicetree for Supermicro X9SCi-LN4F based o=
n WPCM450
[PATCH v2 10/10] MAINTAINERS: Add entry for Nuvoton WPCM450


Jonathan

--KGb1lnLxRAL4SeVN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmBwCPQACgkQCDBEmo7z
X9vCBhAAuvSxsiCvVBLtKDkH6L/UNXQGInDlYyuajHLLU1vSBJCbqk1YyW0LEfHf
q2rf5lRHc9sLIzruC671RIwt2800GdjuzHAre/NAGPvDq4UAzlyrIg8HJY9MMAZF
sLjTE7YsNsgc2oCjPJY5+O7kB0rCWP1Xna8tYcgcj2uUcjT9NUd8PZ+sgasxR3fI
t/YOdJflfOQ6Ce+4pK8wnnvZYCz97JRu+RTnjafHVfnNur93T7KC+BHq/OW2FeFk
VvH9m86I6xl3KEuYSeO6nQEwJufp4ciPMxlmVOfOo8/+7jgM0ldjohGFbzHBqQTU
noXEMhjpkDTa8zSv6e7RhTyS3OPR2j3kcTbACF3/oz7eLCvflmtT0Dlk2NmqDm+T
bICh/kqe6MsQXGAYRTG86xoDRcbjYTQvCNIeP9Uv0rBFJ8cpJaJoi31qadH3G57h
Ql2Wd9MnNLjtMDZqWBTYlBxjTdOw89g7D8twqXX6o8gLtJPsObuOUEbG6La7FAAb
/c8YkjNTAqSgwkgnvpK6isdP1p8ZogWqb/WFwHUtH0y47gGKOTzRvZK9yglkp9VJ
f5YYpYsUNwep5XvdOAWUT2RlvQconATZeZWir8bZO2gX0Ub4YvXH3q9iWFvlEg0p
Z0BnAay6IHfaQ+jxqR03jwpIoGWAH51o8sSEcOO3E0OGjsjfIDE=
=1DTD
-----END PGP SIGNATURE-----

--KGb1lnLxRAL4SeVN--
