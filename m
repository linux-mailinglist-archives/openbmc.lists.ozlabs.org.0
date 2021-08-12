Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 364103EA6F0
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 16:56:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlqX206xnz3bVC
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 00:56:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=GkDi5Opi;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=aFfH6R93;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=GkDi5Opi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=aFfH6R93; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlqWV4D8Xz308Z
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 00:56:06 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 858473200910;
 Thu, 12 Aug 2021 10:56:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 12 Aug 2021 10:56:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=ByCm6K13LvBswdbfk9ErQqZ0UBe
 lODwwtIGkhrvP8eo=; b=GkDi5Opi+r3fED5ysfIh48Y7L97deCUUxWaGWp86uxB
 iADEubK7MDf3GV6Nb6FnJWyAXYsvj2oegn5ySFh6Wa5cfoNG6Alx8wEuguEoK6JO
 wGVhqF7mHvUvUZTvK1eWQzvOFKahmlwHiASIv2/2NJckNR8ud1n0rdIK3SOy8q7N
 SGupmO52rkFXz4SfmS5OnAF6qCF4UUXHSIPgSrImA4Jd5ykKjOyhFLhmWw01tBVN
 ihE0dJmFeNHpZDg3pCNkrUInH0/v3bGEYuApG38HpubSAyTBBdykNyPIQB+HmMIt
 1R/V31FJXxvOn8yE+T1kWKsahkE2BABp6yfovvxFIlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ByCm6K
 13LvBswdbfk9ErQqZ0UBelODwwtIGkhrvP8eo=; b=aFfH6R93/gzejcMKfcWgHZ
 ziRx/e2si/VINzzktxkhVGae1EutoXIFn/EUaWKPSMGtRodNFEFWOsNBz3p2q7uX
 5C5ydwdH4KqlcFfx7MuhQypCEDMg+hExIHQgodUyJ4S3SuVX+UAt4tuuFwUu5VqL
 7L4tYL58ms+How1WZf0duw/dSzFlo3SsekckrO9RxBrUWilVBlAf2H7Yb0lZ9gWB
 uaX4GKLCmmPbbSjxwfK356NwopooORTqSlcXH+2f6ujRBqExiT5Pq9zTuwyJ8Jxv
 Dmd9H7xeQSqqkBaAiafSBoNVSFBTe0UFv4vWD3wIsCqZw1Qggi3CH4mRi7wzbBrw
 ==
X-ME-Sender: <xms:gTYVYZTjq1dGWAx0o6FOBkff1c3rwf-YwPptNnSzGAHW7cLt_iJ2mA>
 <xme:gTYVYSz6DC-dAnZ3PcLxhThl7PQfRPFqhxdZQSWU9LenMLVSytIsIh4ga4FTGjpry
 tBZ0-eZ3MpCev_wiic>
X-ME-Received: <xmr:gTYVYe1kOnEOPp7_ucQMTb3kYxCJt5Rcjm7CzE2QdIf27XTMl74IyO6ylqFk4JHlma5ENwFFI6afPFwTEF6jwBgjeQivw9JBVw_lswH7yS0-_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkeefgdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhepfffhvf
 fukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
 rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpe
 duudefleeuhefhleehjeejgfeujeehhfdtledufeehkeduudevkeeiuddugfegkeenucff
 ohhmrghinhepohhpvghnsghmtgdqphhrohhjvggtthdrgiihiienucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgig
 rdighiii
X-ME-Proxy: <xmx:gTYVYRBT6YF_0Paq2vfX1KRJ-CZPbSTIc-i4EkBfA2nBtjLWYpSHgw>
 <xmx:gTYVYSiC_J9aYk8Ti-CQNagrlBcAzp-1VHahSo2_3V7pHaxQWRN0MA>
 <xmx:gTYVYVr3OSk0B6Vm5rX8dAbrZ5VBPr49ZQoHyTeJRPRkjqc9sYtvEw>
 <xmx:gjYVYaJSxM7Y9Cy4n273DiFlVFs-kgkPD-6ZeK6YcKS3RhSg6rKdcw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Aug 2021 10:56:01 -0400 (EDT)
Date: Thu, 12 Aug 2021 09:55:59 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ali Ahmed <ama213000@gmail.com>
Subject: Re: Turning off the D-Bus REST API by default
Message-ID: <YRU2f8s4T+fBGrE9@heinlein>
References: <CAKJqRLVQYxzFEUOe=jF93dVvR86JJWk_uO9KnVLriJ+jDdkDVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BCn9Ntifd2YrbQlt"
Content-Disposition: inline
In-Reply-To: <CAKJqRLVQYxzFEUOe=jF93dVvR86JJWk_uO9KnVLriJ+jDdkDVA@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--BCn9Ntifd2YrbQlt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 12, 2021 at 09:10:01AM -0500, Ali Ahmed wrote:
> I know there was some previous discussion on this.
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29344 is making
> the default setting for D-BUS REST API disabled. The D-Bus REST allows
> authenticated users access to privileged information that may be above
> their permission level.
>=20
> After this commit to use phosphor-webui or D-Bus REST, you will need
> to set -Drest=3Denabled in your bbappend. Note: webui-vue uses Redfish
> and will not be impacted. Let me know if you have any concerns.
>=20
> -Ali Ahmed

The following machines/meta-layers seem to still be relying on phosphor-web=
ui.
Is anyone signed up to either switch these to webui-vue or do the bbappend?

```
meta-hpe/meta-common/recipes-phosphor/packagegroups/packagegroup-hpe-apps.b=
b:        phosphor-webui \
meta-hpe/meta-common/recipes-phosphor/packagegroups/packagegroup-obmc-apps.=
bbappend:                           phosphor-webui \
meta-ibm/meta-palmetto/recipes-phosphor/packagegroups/packagegroup-obmc-app=
s.bbappend:RDEPENDS:${PN}-inventory:append:palmetto =3D " openpower-occ-con=
trol phosphor-webui"
meta-ibm/meta-romulus/recipes-phosphor/packagegroups/packagegroup-obmc-apps=
=2Ebbappend:RDEPENDS:${PN}-extras:append:romulus =3D " phosphor-webui phosp=
hor-image-signing"
meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend:RDE=
PENDS:${PN}-extras:append:ibm-ac-server =3D " ${POWER_SERVICE_PACKAGES_AC_S=
ERVER} witherspoon-power-supply-sync phosphor-webui"
meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend:RDE=
PENDS:${PN}-extras:append:mihawk =3D " phosphor-webui phosphor-image-signin=
g wistron-ipmi-oem ${POWER_SERVICE_PACKAGES_AC_SERVER}"
meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bbappend:RDE=
PENDS:${PN}-extras:remove:witherspoon-tacoma =3D "obmc-ikvm liberation-font=
s uart-render-controller phosphor-webui"
meta-inspur/meta-on5263m5/recipes-inspur/packagegroups/packagegroup-inspur-=
apps.bb:        phosphor-webui \
meta-intel-openbmc/meta-common/recipes-intel/packagegroups/packagegroup-int=
el-apps.bb:        phosphor-webui \
meta-lenovo/meta-common/recipes-lenovo/packagegroups/packagegroup-lenovo-ap=
ps.bb:        phosphor-webui \
meta-quanta/meta-olympus-nuvoton/recipes-olympus-nuvoton/packagegroups/pack=
agegroup-olympus-nuvoton-apps.bb:        phosphor-webui \
meta-supermicro/meta-common/recipes-supermicro/packagegroups/packagegroup-s=
upermicro-apps.bb:        phosphor-webui \
```

Romulus and Palmetto at least are ones we utilize in CI.

Is whatever hardware testing we do on Witherspoon now moved over to the Red=
fish
APIs?  Everything in openbmc-test-automation.

--=20
Patrick Williams

--BCn9Ntifd2YrbQlt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEVNn0ACgkQqwNHzC0A
wRl5SRAAmLstXHlgjPkMSMjYtmigDiQmT930cZJdjwd28NtNsacTksCSVidKINVl
FbjE1uoIrQ6ibKsg+dxHd/Gm1AqplmwULAT+1jvkiOnK60L+jqbEFncEW3IUF3df
q3G1bMtsMC1LsLrnLXgCJaGT61G0YkwSaUS+UgMSL7/iJzeAU0O0rHNlECCPim0a
cGiKl/InoBO/aY8EixHdf1ML5sn41xAABPUWSdiOO8pZdQ7XHcPIZu3iIUFcfS4Q
FO/9EN1KLKdsHH2CQuED2eBt0raQaTfCvxG/rgsbOxxLq+bOY8gC3RIOXiTAZMBH
vItbm8kwwtIo8bOWj1nYXJLRPjoT6ZmignXkIHtJQYct4sUrrkQfZeYf09QkHDCF
iD2hAbbXqofdOLCBxr9n5xT6FqwonhJ/U1F4+sHmVW34/mp6VW5qinnC93xoHD37
pSKoiir9OahyRYKMotyHykbXdtQemUqgZHD0ZpIaZ/rSTcZMEcBhvxDjtfUqf6uZ
b5dFfydMxDAvgj2WeZ3PqNw6Im+kt9XS4iEFX2Ns7/1m+5QFaYv4TxC6h2h9uy9j
iLFm8XpHLlnSd8IX8QPFtI4mZVTn1Bu/kFppvrJhwqpdBr341bbyHdetOOcEVaQ2
Nkj87RkonuOzbpbqi7W7WNjhoE4P05GjSCXNZbOM6ADdYePJ+q8=
=Ebt9
-----END PGP SIGNATURE-----

--BCn9Ntifd2YrbQlt--
