Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B90C3BF940
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 13:42:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLDtD6JyTz3bNn
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 21:42:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=PNCBISvU;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=iUjJkLkI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=PNCBISvU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=iUjJkLkI; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLDst4BJ6z2yNw
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jul 2021 21:42:09 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 2C12F5C0138;
 Thu,  8 Jul 2021 07:42:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 08 Jul 2021 07:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=COLA8ccmq9fHptCDBnrUE+WvYoe
 qxwm6E3/munzslZc=; b=PNCBISvUekbBjsHWiH3GHFXTG0RsX75wAkiWgIWTDmA
 nk218ZQkSM+BXa0HyIkFAHe2nZEee675h+L1RNUz5EaHVRrSV6edo2lQObEcecpn
 7qWWHEsHJtzxkbrFxEc5uQ6/hzpV1WRDHfkDM9X1teK3XY9Faa+/aCCyNwY72Xoc
 O6H+iExFVKZoeFUjs3T+4xWTjcnRhSkajgRz5HjTUCCen5fpP404rie4SqvCfGXs
 LNNEXVq4xOMX03dTxiGziUP2XELCS46VZ+1PoeczScw/oiHcA2jt10Boh3eOF/R8
 tyj9cMebUwJvXozv8+iyYDDDDGE2ovE3DzEy3VPpvPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=COLA8c
 cmq9fHptCDBnrUE+WvYoeqxwm6E3/munzslZc=; b=iUjJkLkIzBiEhf9lUaLss0
 XhFKaxxpYXXQXxHDtO3cTNj8uZKIS56bWmQM5qgRCB3PADX8WLkTjm5oH1ZLFrCB
 8UP/qlmn4VxPqM1Awu/9SR3JNLPpHbsPBNrxPar0lnax1ZJ19+rOlwrgLUn5y9kj
 fy0/GHQuRfFQefBdVYZq2rU6jyvlIuQn5Y/nMxH+KwkmkjcwXyVifh7q6opc4Yv4
 rNK63JaHtOLwIHoP4iiI6CZfi4oo1+k7xax+4Exk3ONhod8dqeM87sFOYh/KuIOm
 +7BI0PUJNhhIrkmAA3VQSy1Emla1mrWS/2F4lkJcwuQqrw40XUfij0f7WEFmGQZQ
 ==
X-ME-Sender: <xms:i-TmYKIsuCqDqodd5nU1bsBhnGAmxRz7RHHG4q8neAawxz5coCeVtQ>
 <xme:i-TmYCKp0pFcrjwPnX6rDG0dCt3XL25Ui6EhwokU2OD81_LP10eTvr5PjdX-hrsxm
 xMuNa4jGgayZzXLaz8>
X-ME-Received: <xmr:i-TmYKvnXrnDC052-Dd-n2ErHXhYLF7OJ9OPALkuHoH2VW9XFQk7CizB_6J-lZm0uyME6SlbyYgw7IMGtvc-5YI25TUoMuzMRmdwgBn_lZk1Gw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtdorredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeejgeehgeehffeugfehieduheehtdff
 tdevheethfduleeuvdduvdffiefgjeeftdenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmpdhrvggrughmvgdrmhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:i-TmYPaxE1L97vwetLZAq_1mFYl5vRflNUKhxyo80iQ0kWS3Agghzg>
 <xmx:i-TmYBaOUUNNvgW4X8a6Y_dJqyOpJTQlwsCPtIQB8-mVG6T3spu7xA>
 <xmx:i-TmYLDfj4DFvjFYczrklsEOmJfp7ZpSt2TBnnGUfRea1qxy0jQHYQ>
 <xmx:jOTmYCAvI7CsxSE5baeMU-bOtUBYw6mvecV5lX4L8HW3sureQDKuwA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 07:42:03 -0400 (EDT)
Date: Thu, 8 Jul 2021 06:42:01 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Subject: Re: Standard FW update package structure - use PLDM?
Message-ID: <YObkiUGRFzvqRGkX@heinlein>
References: <CAM=TmwX7VjvmaE0dMDvVfdOJ0dRCjXDu2-TcoUdGFSMsLWm81g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="apfAWn2MvZlYU7Jl"
Content-Disposition: inline
In-Reply-To: <CAM=TmwX7VjvmaE0dMDvVfdOJ0dRCjXDu2-TcoUdGFSMsLWm81g@mail.gmail.com>
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


--apfAWn2MvZlYU7Jl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 02, 2021 at 09:48:18AM +0530, Deepak Kodihalli wrote:
> The PLDM FW update spec [1] defines a structure to package firmware
> images - primarily to identify target devices and to associate them
> with software versions. This is done via metadata in the package, and
> the metadata itself is defined in terms of generic concepts (like
> UUIDs, PCI vendor IDs, version strings etc). For devices that do
> support PLDM, the 'UpdateAgent' (typically the BMC) uses this package
> structure plus a set of standard PLDM commands to talk to the devices
> to perform FW update.

I think historically how we arrived at our own format was that the
predominant format at the time (I've even forgotten the name) required
you to buy a physical copy of the spec and there were only proprietary
tools available to build images in that format with.  Creating our own
[open source] tool was, in effect, a violation of the "buy a copy of the
spec" license being imposed by that organization.

Great that PLDM is now defining a spec in the open...

> For platforms that enable FW update of multiple entities through the
> BMC (this could be a mix of the BMC itself and other PLDM/non-PLDM
> devices), I think the current OpenBMC mechanism involves the use of a
> VersionPurpose [2] interface in order to map FW images to devices. A
> couple of problems with this approach:
> - Can this enumeration cover all possible device types?

I've discussed this in a few places, but maybe not the mailing list, and
it is something that needs to be solved in the near-term anyhow.

Summary of thoughts:

    1. I don't want to add any more devices to the enumeration list[1]
       and would like to deprecate at least PSU.

    2. I'd like to see something defined along the lines of device tree
       compatible strings, along with a well-defined schema, to indicate
       which devices an image can be applied to.

The current design of the enumerations is rather limited.  A specific
problem with it already is that a VersionPurpose=3DBMC doesn't actually
mean that the image is appropriate for *this* BMC.  Many vendors have
two models, and images signed by the same key, but want to be able to
prevent the image from Model A to be flashed onto Model B hardware.

I haven't read this spec, but it sounds like the PLDM spec is similarly
aligned with a Compatible concept in that PCIe IDs and/or IANA
identifiers can be used.  On the surface it seems to me like we could
create our existing Software.Version objects using a PLDM-format image
and derive the new Compatible objects from these identifiers.

> - How does this fit with PLDM?
>=20
> Instead of the VersionPurpose based approach, how about using the PLDM
> FW update package structure as the standard to target devices and to
> associate devices with versions, even for non-PLDM devices? This means
> FW images uploaded to the BMC will be packaged in the PLDM FW update
> format. I don't think this is a violation of the PLDM FW update spec
> (also checking with PMCI WG). For non-PLDM devices, this means using
> just the package structure, not PLDM commands.

I don't see anything wrong on the surface with enhancing our
`ImageManager` concept[2] implementation to support PLDM-format also.
Should this code go into phosphor-bmc-code-mgmt though rather than become
intrinsic to PLDM?  It seems to me like the `ItemUpdater` for PLDM
devices is the only part that needs to be in the PLDM codebase.

I do have questions on how PLDM handles digital signatures and image
verification.  I suspect that it would be insufficient for many users
such that we wouldn't want it to be the primary image packaging method.
Fundamentally, my feeling of insufficiency is around vendor-provided
images:

    If I have a FooCorp NIC installed in my system, which supports PLDM
    update, and FooCorp releases a new image on their website, do I:

        a. Want my user to be able to download FooCorp's image and
           install it directly using their PLDM update file?
        b. Want my user to only install an image that I've qualified
           on in our configuration and additionally signed with *my* keys?

For some vendors (a) is their designed answer and for some (b) is.
Allowing the BMC to take a raw PLDM update image and directly send it
to the NIC satisfies (a).  Using the OpenBMC signed tarball scheme
satisfies (b), since the BMC will reject the tarball if it isn't signed
with keys already trusted by the system and the NIC will reject the
embedded PLDM image if it wasn't signed with FooCorp's keys trusted by
the hardware.

1. https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz=
/openbmc_project/Software/Version.interface.yaml#L19
2. https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz=
/openbmc_project/Software/README.md#overview
--=20
Patrick Williams

--apfAWn2MvZlYU7Jl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmDm5IgACgkQqwNHzC0A
wRkeHw//f6N8To8P7nMcqcI1TP93r9ibpbXklX1OioSEwc5Oi5nvsGYH3oR8hZMo
sR+v9pjNHLoOHvg4P7kDocmvNAGYOY9vHmGlgOoOWg5W43MbZBOve1WusBuXsyRF
trC8hdT18fPlxBdfaFr6c4Uv587OCt5m/GutLIOheLUIrb8arID4j2SLjtQkW4yd
PTqeQtEGnB3QYaNytqEufZim/8Hm2DkfQeIVJkKYg7LynLdcm99MiDNAvX9bpGxg
R+lcX3TUlNaASm2+lB0k+77NKCCkl28HXWw2MVy9DARuocd1mUtnBuD6AbuvwBmo
SBcCkRQJjXHrhWn3ix0c5da0DalDWbfvw74iJWt4DP5D7lOLcPK97bwq8RaZeebJ
J6Y6n4qO7ApRXt5vTmF5E7zOc/SBRHb3FPeZGYX6Vg+Cnnp7r1WYmdmKPcC7vjUR
nix0ZsoBKYiCmWpDZIq8+ajP02ponlk9IoLdb+pF6yorTF51rWYWxSpKBkzHsogR
tEFLR2W/Urh5HAybc22EDq8X07lsVzLZ+t+WAPHzdYuwZWxlHQr6RP5fd7D6yCNx
L9hC+UBH3RbvJCqPyfzO6aAUD6SCM1mqAd16kVfnjJp9igOkxRywucgfbU+cGf4S
yWnVMZcsaICX0/Nh9mopElyyc3yQBc3EpPLcL02CzQ1km7Z53HA=
=PQ60
-----END PGP SIGNATURE-----

--apfAWn2MvZlYU7Jl--
