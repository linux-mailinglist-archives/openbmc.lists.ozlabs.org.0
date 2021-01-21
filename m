Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8772FEA7E
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 13:45:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DM2DL5cdbzDr5D
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 23:45:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=OBXFPLlP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=kuseNo6r; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DM27r3brwzDqnv
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2021 23:41:25 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4F5AD5C0037;
 Thu, 21 Jan 2021 07:41:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 21 Jan 2021 07:41:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=fK5RhdIvNbaEVeKHHKYPYwCOPKX
 FUGSqN2ws1oAPI5E=; b=OBXFPLlPoa5v4vTJVm2WrsxRrxX5ndE0VomIeTwX1iR
 c1xnryhXDkbQLFIkPRCjzdoW8iGJhr8s4oJKKH2DbF7x65BTaPWyO2epfoBy7BmN
 SI5CT0HIRfwKjJdbpC9Ot2l2ThqMzsJL2Ow314u4wAVLUyWpV48ivzr84XNZbarv
 hL1JGUxBLwVS0uR0Hnly5ipPUhV97bWbryyvvkqp8T3wHdtdOJHQ3ZiLyFsz6Z7O
 TICgWqo0YFaCEhoUUFm6SO/B1qCCJVxn3sHr/TlHG15iCVO9eoQtRivTjpDTuQ5f
 B0tR+tLYdk5LVz9WWJhMkYzV6Pv9w7DtTP8zWODWwPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=fK5Rhd
 IvNbaEVeKHHKYPYwCOPKXFUGSqN2ws1oAPI5E=; b=kuseNo6r7xIl4kKIb6LyJo
 XEnJnbi0GTJINJ5c9I/I5QPdyhuo1TwNuBOkno5ZRYo1t34jsQaSccD/ALr7jycD
 n3A9CMhvAERfyM9FS+/vW04SGp/QcC/qfaZJnAOZdapc/E4oZ4wAjfzzvM+S9i6p
 RCsp8Mh0qJTZ1t64HVtkOu8dnAMY+zc0DSVRaKPP1Y6LaVvSgLDw5pyQd9DQPUj0
 ql93nFDxKDmZIBtXsjlqfgzE5bNsjKRlgwCt3S+8HcmjFvbzp3jQKhnHC30W6hM7
 Flh79UGDJFZvMxLJdcVrQWwAHLodER442thuYQgz5JCLh+QFbGfEkE/yxLz2gxJw
 ==
X-ME-Sender: <xms:cHYJYP6ZXJZi9xZTfkC8vyFp69RvZONLxCdBSf0ZFUyPF_Aa0Uq0nA>
 <xme:cHYJYE7h5blCLQBGNbRPw7hRrNe-2D6QbzRBvFdmLapViP4F54PMeV5eKXzOOvp_l
 N6RySdki_t90Ha3MWE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhepfffhvf
 fukfhfgggtuggjsehgtderredttddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
 rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpe
 ffgeejffeuueetuddtlefgjeeihffgtdejfeeutefhfeehhffgvdfhfeeivdfhtdenucff
 ohhmrghinhepohhpvghnsghmtgdqphhrohhjvggtthdrgiihiienucfkphepjeeirddvhe
 dtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:cHYJYGdalf7hH900mvm1I6iKwnH3P13iyNZq5NUBHxdSL7by06VHBQ>
 <xmx:cHYJYAJ0p4Iv88omiJvVLd3qwM461PY82c2s052JlKtd49c_avbZdg>
 <xmx:cHYJYDL1of3ihnCmrEIFUfzcKU1VcqufheSGhHKlHzzoZXisXXgDug>
 <xmx:cXYJYFy9lsau8peU50T7qP9FZqnDc6xxA1NibGtcLMcJPq_UElAMog>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 94956108006C;
 Thu, 21 Jan 2021 07:41:20 -0500 (EST)
Date: Thu, 21 Jan 2021 06:41:19 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Jinu Thomas <jinujoy@linux.vnet.ibm.com>
Subject: Re: Control / Operator panel support in systems
Message-ID: <YAl2b2xaXDV+GQwG@heinlein>
References: <8402e577-410a-cf27-9b3e-f2774f086d00@linux.vnet.ibm.com>
 <0745cd96-76d3-2075-4f04-afa4ae560689@linux.vnet.ibm.com>
 <76d7d22c-43a6-f144-9e1d-3b499d3a2309@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lJsffy4T8dvqOpuw"
Content-Disposition: inline
In-Reply-To: <76d7d22c-43a6-f144-9e1d-3b499d3a2309@linux.vnet.ibm.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 bradleyb@fuzziesquirrel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--lJsffy4T8dvqOpuw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 06:58:25PM +0530, Jinu Thomas wrote:

Jinu, it seems like we still have a lot of discussion to work through on
the design[1].  Can we get that resolved before we determine what are
the appropriate repositories for this?

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/38904

>=20
> Hi Brad,
>=20
>   Can we get the repo created for the below?
>=20
> Regards,
> Jinu Joy
>=20
> On 12/01/21 8:17 pm, Jinu Thomas wrote:
> > Hi All,
> >=20
> >   I have been working on the design and this is what i have zeroed at.
> >=20
> >  The design aims to accommodate a panel that provides buttons used for =
navigation and selection of functionality and a display used for visual int=
eraction to the user.
> >=20
> >  The design is divided into two parts.
> >=20
> >   - First part is to have a navigational user select-able section. This=
 would mean the navigation coming from the hardware in terms of buttons. th=
ese will be used to perform the required functionality selected by the user.
> >=20
> >   - Second part is to have a display section. The display side will be =
common for all BMC apps, it will be done via Dbus API hosted by this app.=
=20
> >=20
> > @brad
> >  Need a Repository created.
> >  =20
> >    I don't think there is any hardware like this out there, so do not s=
ee or expect any overlap with the rest of the community, i will be thinking=
 of using ibm_misc or ibm_oem as the repository.=20
> >=20
> > Thoughts and suggestions are welcome.
> >=20
> > Regards,
> > Jinu Joy
> >=20
> >=20
> > On 27/08/19 11:06 pm, Jinu Thomas wrote:
> >> Hi All,
> >>
> >> =A0I was starting to explore on the design for the operator panel seen=
 on IBM systems, it is also called a control panel , which basically is a c=
ard unit which has an LCD and some buttons to navigate the display on the L=
CD. I wanted to check if there is any design or code out there, for such=A0=
 kind of usage. The design/code can be checked to see if it can be made gen=
eric for use, even though the hardware is only used by IBM.
> >>
> >>
> >> Thanks a lot
> >>
> >> Jinu Joy
> >>

--=20
Patrick Williams

--lJsffy4T8dvqOpuw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmAJdm0ACgkQqwNHzC0A
wRngEQ/+IVyvG2QDTHEDtKp+Ug6QSh+dLcnc+bq+qii2tZcC8GLTMKi3UHbW2DL1
SdNrMjdDe/ksxqjdwSVMIE9kUubXv5j/kp3DsH+SydbUPB10ItP2UNa7lBdO7zQE
oeyRUM8ynASrOlP68OWWgOBobAb5dXNMl8ivg2R8TlOOBDQ/+nZO2NlttPZ95haC
LSBckEXpDiIQpcTiZnd8wHDE89d4pXtgijFOZd7oCf4bLYuKMoLzVlz8hPfwgf18
LnDa1XQpBatR+SbZowb/WjM/j2ie7zsB8qT/ns6x3K49T4wfox2ei3+8YlibRJsX
syMJnjRXaWbt57Xv5V/RQoOJzfWzM9nrNEeDowCy0A598EpFDTqP9Tzrw7HDwE0s
sdw04E8Bux056I+HK+0vcms7GZKLEYajvGbA1E27xqGAZ05G9hHgMZHWIeRTFq9o
uUasw4aL14SzuA5BfrC4pYPM9vq9iurZy1TTjcQno/rHIf7OIkAWp/WMniY/bKNT
iu+ZN91U/rQDZFtwF2h7XwabTPa067717051O2iChYy3eCiIHnuNvfjwt/Ynh1k9
5+4yH8QjBFBWDRcHFCblXa5texDPalQ5obIEW7EaQMz8wbJ8Nsktabf+4XHn2fiR
qy9UD6T3dIbeH00FdKX4mHgzEwRBdGcFtmOKjGI4q8bd57nuows=
=cFYS
-----END PGP SIGNATURE-----

--lJsffy4T8dvqOpuw--
