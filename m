Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5874DD0A5
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 23:21:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKM7D167yz30QD
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 09:21:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=lfJfZ53w;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TC4i0rGI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=lfJfZ53w; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=TC4i0rGI; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKM6d564Kz2xTd
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 09:20:56 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 2F3083200583;
 Thu, 17 Mar 2022 18:20:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 17 Mar 2022 18:20:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=lrYhJttfXHBnKiPOuhqtCc7+fLE+Ect2KGHheU
 J/h2A=; b=lfJfZ53ws81Vc1iQNBh1zOqEHZ/deW6ZpSYF/0ZouEYt8o3Rxti9Hw
 bcZHj038ITt+oF8l5BjSjjAPp/8sbScwzjHCo2Qz+oMceebdw9TjwmRYoOPayIRd
 20VOgzFs7eU6isf0yELTgAkaFmRD0ZWlyxSCkTZp7kwYGCnjZXiw8hLKt981QXHi
 BWnSeOgYrzyvkUD7Xb1gjsTXjEtwzqCxgAgS/ElZVLIOIkWEPfti5fwnoK/GM+lQ
 GF1beTRCK55H/VCZOfkUnJsQePalZLVxMF8Pzypc45mBp8b6McXw73vlnlTlqqqh
 dHs62AQLqjuCQQZBDIjhWJcQOdb6S+hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lrYhJttfXHBnKiPOu
 hqtCc7+fLE+Ect2KGHheUJ/h2A=; b=TC4i0rGI/kZpp0Pz08kL7oQxVu9OJl92Q
 k2dbPjh4ZKPhdKGi8nYl5r6QK63LtQxecDEG8iVRICg5ZQDmu/z9NHtPz+XrZGcP
 yTVmwjHvj3n7LX87PqovShPODu7wJ59h6IvnRGFkkzJOMHfkfgiPxQAIhhJRXs7X
 lxwRVOZSC5GlSn79GLeGT+3Yk9b/S+hWPIWSfxQ8+0iIfTayG2hMIqzQJlrRAcPc
 /EUPcojbkqkIRLukqUcfuToUPMFYkr6HpEz4JSN7n4DJ3+aFOPNFFZ5borlo2sji
 b8yCvYhkTnMN22c7PpKVzjOFquQiK84+PQKK54v+V3u8db9bn4eFQ==
X-ME-Sender: <xms:Q7QzYhHejLxsUNX7DBi92hTruICDxZEEXG06k0mLftRLaU19W7yxcw>
 <xme:Q7QzYmXvH5Vr1HvjZk6EiAoGoEW6-Vrkjzs5RSaQMi-AwQsL6TSVq_k4FmHlj0Aqs
 AWB--kaE9vUb8hDzn4>
X-ME-Received: <xmr:Q7QzYjIEKm5uWMBqwu_zR27NNZorNJKA29gFziMVvPepZkybxG_smKFTngGY7o5YuNrYXGEhb5rXMBH0utrleV0wxYXOmc-14PI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefgedgudehjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tdejnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekudeutdefiefhheefheefvdej
 ueejieektdetheelvdfhleehkeegvdeiveekhfenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:Q7QzYnEhpCYAATPUFVstGJhd74XcNwxGUDUHp-f5krswrihVIAsP8g>
 <xmx:Q7QzYnWHXfgdDL6jhn5EpVlSGAOfDZk45MW6ek9Y_PpjQVe6R7j0RQ>
 <xmx:Q7QzYiNnSJ4_2E4ZVKumnBZ67c4DsXQ70EZRPLVcTqrhl-edAsUskA>
 <xmx:Q7QzYoe1jB0P0HgFKCEYb7SlrJ4Wk6rR6ygUIOWSYAUZ7yF7ZSHJ7Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Mar 2022 18:20:51 -0400 (EDT)
Date: Thu, 17 Mar 2022 17:20:50 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Richard Hughes <hughsient@gmail.com>
Subject: Re: Software Bill of Materials
Message-ID: <YjO0QqLKbNned7dk@heinlein>
References: <CAD2FfiEKfS-=ER9qJ9mftjCsiAiseytrDCcbiCn+EcyKOLd9Mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qB0CHBSWs2Qa2K7L"
Content-Disposition: inline
In-Reply-To: <CAD2FfiEKfS-=ER9qJ9mftjCsiAiseytrDCcbiCn+EcyKOLd9Mg@mail.gmail.com>
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
Cc: openBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--qB0CHBSWs2Qa2K7L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2022 at 04:26:08PM +0000, Richard Hughes wrote:
> Hi all,

Hello Richard,

Thanks for pointing this topic out to us.  I'm not sure we've done a lot of
thinking on it and there appears to be a good amount to digest.

> I've been thinking this about the SBoM problem from a firmware point
> of view, but in a "BMC image" it's often lumped together as one thing,
> but in reality a single BMC image might contain a BSP/FSP, microcode
> blob, an EC, a root filesystem and a lot more. Even something as
> seemingly-monolithic as a USB controller might contain a HAL from the
> silicon vendor, an ISV-supplied bootloader and an ODM-provided runtime
> firmware all built together.

I believe most of our BMC images actually are much simpler than you've laid=
 out
here.  Typically it really is just the BMC code and images for any other de=
vices
are updated independently.  For the BMC that means u-boot, kernel, rootfs.

> I=E2=80=99ve been spending the last few months putting all the pieces tog=
ether
> to make a firmware SBoM not just possible, but super easy for ISVs,
> OEMs, ODMs and IBVs to generate. This is so that vendors can make some
> plans on how to be in compliance with any future requirement from the
> US government, rather than reacting reactively. I was asked today if
> I'd considered "the BMC blob" and the answer until just now was "no"
> -- apologies if I'm coming across like a 800-pound gorilla but I
> figured I'd get some discussion started.

Do you know if there has been any effort put into this at a Yocto level?
bitbake already has all the source code used to build our image and all the
metadata about how it was built.  It seems like they could add the SBoM to =
their
build process, if you wanted it on each package in the rootfs. =20

Alternatively, would something as simple as the git-commit of the Yocto
metadata used to build the image be sufficient for a SBoM?  The Yocto metad=
ata
itself contains hashes (or git-commits) of the source for each package
bitbake built.  I don't know how far down into the onion you're expected to=
 peel
for whatever these SBoM hashes are.

> For UEFI firmware, one of the problems is how to embed the software ID
> (also known as SWID) metadata into each EFI binary. This is solved by
> putting coSWID metadata (a DTMF specification[2]) into a new COFF
> section called =E2=80=9CSBOM=E2=80=9D. This allows us to automatically ca=
pture at
> build time some data, for instance the tree hash, and the files that
> were used to build the binary, etc. This isn't so relevant for BCMs,
> although some things like file hashes and tree hashes for the rootfs
> probably are. The uSWID readme[3] explains how to do this manually.
>=20
> The second problem is how to include SWID metadata for the blobs we
> either don=E2=80=99t build, or we can=E2=80=99t modify in any way, e.g. t=
he BSP/FSP or
> microcode. For this there=E2=80=99s an =E2=80=9Cexternal=E2=80=9D version=
 of the same coSWID
> metadata which has a simple header we can find in the firmware image.
> This can either be included in the blob header, or just included as a
> file alongside the binary deliverable. The vendor can either use the
> [pip install] uswid command line (more examples in the uSWID readme)
> or more helpfully there=E2=80=99s also a web-generator[4] on the LVFS tha=
t can
> spit out the tiny coSWID blob with the correct header ready to be
> included anywhere in the binary image.
>=20
> Open source firmware like coreboot is also in the same boat of course,
> but here we have more flexibility in how to generate and include the
> SWID metadata in the image. Some vendors are planning to work on this
> really soon, so we can have feature parity for free firmware like
> coreboot =E2=80=93 even when non-free blobs are included into the image so
> that it can actually work on real hardware. For firmware like NVME
> drives, NAS adaptors and the like the uSWID+coSWID blob can be
> included anywhere in the image =E2=80=93 even in the
> 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF =E2=80=9Cspare=E2=80=9D space left at the e=
nd of the
> update image.

Depending on which pieces we need to have covered by coSWID it seems like t=
his
could likely be put in a "free area" of the BMC image as well.

> This means the firmware blob will soon have the metadata from the IBV,
> ODM and OEM all sprinkled around the update binary. The LVFS now
> decompresses all the shards of the firmware, and does all the usual
> checks. At this point we also look for coSWID metadata in the EFI
> binaries and also uSWID+coSWID metadata for the non-free microcode or
> SATA blobs. From this we can save any of the detected SWID metadata to
> the database, and make it available as a SBoM HTML page[5] and also
> .zip archive[6] containing the raw SWID XML data. We're also planning
> a standalone tool which is more useful for the BMC firmware that's not
> ever going to be uploaded to the LVFS.
>=20
> If you do think it's helpful to add uSWID metadata to the BMC image
> please let me know; I think this makes just as much sense for firmware
> that sits on a USB hub as it does your system firmware. Comments
> welcome. Thanks!

I'm not really sure where to go from here.  It seems like, since we've built
everything on top of Yocto, having someone go write a bbclass that creates
whatever coSWID data you want from existing information the bitbake recipes
already have would be the start.

--=20
Patrick Williams

--qB0CHBSWs2Qa2K7L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIztEAACgkQqwNHzC0A
wRl+eRAAhBclupVwO/wGD/9glbzk2gvq9cNjyldqkpPnx3U1puWhI5YUI5qv+mF7
FrqyD+BgXH7FKbFn3goscrFTOUoetfSEUoTk6qkexRyII9S0um1bA5OZoBRcOL8h
iscz+HAIH6WsaKDK0KAiQIsPcqAgjUTuTiCpd8OD2QhUAp0G2CJePBgIJuOOCiws
nnl1U2jOGdXIN6KczwNwj+mqUKI8ewZlqWZvBIcWaa3mGt6EmR1njz+s1VcIk1qa
h8DEZfOA4u4jGmXgQaYooyFnIJPpCphg99tyaIOLUEfflB3JYDxVGE9/DA2NrbcU
3Ov0vyoMRdWo9+eNXIJgFFna2NkS8dC5liNTyzqayxXspGFVkrtSj/unJffv13HR
oUqbvsH+5cjY26oyRHB7D5lfRbmQNPmcEpbtvjTruqTip/Zs5vm91CT/26+fZl1N
gHBRhDiYUxzgHYyF4b829yqpE21zb8DbyaTxOcwooqbnQ4z0iUv2LRXNehIrgOa0
Yy2OEEZdL8Pca31qf5a+9LGsmJ3QpQSjnADoQgZ3851kelPA8CEaNRUviItvBLBF
rm6gu2hZNJU51/RyYzsgDPZHmUvUtHdbbPnigm6+gdPgC4lqv1HulCeRqmpsELXv
irbSS4TykDZ7WQXsnl8ywcDB4mxsAdsEd9Qwm4dS2NFMkJPktOA=
=eWm+
-----END PGP SIGNATURE-----

--qB0CHBSWs2Qa2K7L--
