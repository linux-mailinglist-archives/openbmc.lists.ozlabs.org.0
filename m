Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E46734AD1F8
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 08:12:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtDhy4fsJz3bV1
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 18:12:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=wy3U7rZf;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=g2YArebA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=wy3U7rZf; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=g2YArebA; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtDhT19gnz2xDD
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 18:11:36 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 21C0232008FA;
 Tue,  8 Feb 2022 02:11:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 08 Feb 2022 02:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=HuEC5AHq50mdYLWWN43XYmtUsKEb6ThdZj2c8A
 NaTtY=; b=wy3U7rZfXGzUigdkarbQWRVE48c5OPbjqTLLKqQU2RaDIm5WGFRt0T
 9qDf5GZ8T4qGHUJJ2qdsxITvyUgbkeyh9ozKx5rUgB8STFi0OD9KdoEGNV+4NAAc
 naZu/7ZHtb6CrQFIwck/XFbmAfCgQqaid3G7X7dGPJMkFj+t9zfVl8/0vJCWNY2p
 03iFj8BP9J2EGiI0v0qXlijDM8i9SubrcojF0iVWOu6gN1wnXJx21J+1EvVpWzMj
 XtcykFNJsuypBklQvPWxg9VsAOyya3CIeXDnfTkrhWOJDIEmY2eGedpK5kPMGXGp
 sGw5RkMFKM+GwEDmVMbLwuBba7cu85Qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HuEC5AHq50mdYLWWN
 43XYmtUsKEb6ThdZj2c8ANaTtY=; b=g2YArebAHx0BgzKgmZS1V6GH3GdSKAObu
 35zzap6kqUk3qDPBI6jLDm/ZN0xFUc+hLzSmUdSN5/rs75584eSmHD5aMzyBXS7R
 4YfMS/z1BILLNYLU/QOAl+HtfrTv7zFPqtHr0ud+DCnNb1dueJ/k4+S1JUriTmWi
 ombHPg+zFMWdUQdSoZmmuJ6XyBRjVLwAgzkpb+KtmOZ257/G78ASL2tBMFvu+5po
 H1dznaHMW+QK+L0Lxpa7GQpYMylE9Sn5H5a6cUZMDOg3ZXEe0t0vAaxfs8bGIFQt
 cQRnj/sdIhGsk9apvaDWLD7oC4n0zGpE2xnJSmDS3RYBiTbcn5iaw==
X-ME-Sender: <xms:oxcCYmAd3PVF3IR-TDnxaD4BR-oZFpzVEE92NuWO5msFfvUZsd_Cqg>
 <xme:oxcCYgjekg3Kbpe3K88t6WScsW3ywZ5FK8ZHfa9e3i2VqMRx8CWqE1Zk-IaWD55xJ
 fv0r8DkQVDmE7WdafM>
X-ME-Received: <xmr:oxcCYpkRxFGJ9NMOro1A_uIbwaEMEnSKeToZGUkBO-bg7nBHXsTugW3OjuWLcBlZoRWQrnVXZmTeM5lS8e2UUHsG3HUNASkG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheeigddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
 gtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:oxcCYkxgOiSE87x0KRi3kqFQ9HPIbQW9nsOlI21K-jD2ycb1f1W7ng>
 <xmx:oxcCYrQMs8l1nZD4SuVKpjs9CXaoMRQYeUMF5kkfSsRFePG8EaMVMQ>
 <xmx:oxcCYva8fA1r0z0NQA3yTnVZB9-LHCu4acr2-pJDx18670IgWXtrmw>
 <xmx:oxcCYs5ongsbEG6bGXiMN50SgU_sQpC2mCO2T_V7CYW9jbYBiKuoUw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Feb 2022 02:11:30 -0500 (EST)
Date: Tue, 8 Feb 2022 01:11:29 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Michael Shen <gpgpgp@google.com>
Subject: Re: Propose a new application for reading DIMM SPD directly
Message-ID: <YgIXodbEP9hmae6Q@heinlein>
References: <CAD1rtg8sa2OG4jUL8x7Gr9ExzH-tEswhHwSDaZtWhcAN4sAvuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8WI4CJN/1CmqA8yt"
Content-Disposition: inline
In-Reply-To: <CAD1rtg8sa2OG4jUL8x7Gr9ExzH-tEswhHwSDaZtWhcAN4sAvuw@mail.gmail.com>
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


--8WI4CJN/1CmqA8yt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 01:10:37PM +0800, Michael Shen wrote:
> Hi Openbmc,
>=20
> We would like to propose an application that directly reads the DIMM
> SPD over HW interface(mostly I2C/I3C).

Who is "we"?

> If I understand correctly, the main method for obtaining the SPD
> information in openbmc is from SMBIOS which is prepared by BIOS. And
> We are exploring another way that excludes the involvement of BIOS.

Unless you're proposing that the BIOS itself comes to the BMC to get the SPD
data, I'm somewhat surprised you could come up with a hardware design to ma=
ke
this work.  Due to the number of DIMM channels and the limited number of CS=
 pins
on JEDEC DIMMs, you're going to have muxes on the bus somewhere.  Mixing mu=
xes
and multi-master access is pretty problematic.  Either the BIOS and BMC are
fighting over the mux, which is going to mess with the mux driver's view of=
 the
world, or you've got one mux for each in which case you're switching masters
onto a bus, which violates a few i2c design rules.

> The architecture of this application will be similar to the
> openbmc/smbios-mdr (the dimm part). The main difference will be the
> data source (changed from SMBIOS to SPD).
>=20
> Currently the code is still being implemented, and we plan to support
> DDR5 SPD first, then expand to other DDR generation(if needed).

Hopefully you're leveraging the existing kernel drivers for reading SPD EEP=
ROMs.
This creates you a sysfs file containing the whole of the EEPROM content.  =
You'd
just need to write a parser for JEDEC SPD format data.

You should take a look at what is already existing in fru-device (part of
entity-manager repository).  This is already doing this for IPMI-format EEP=
ROM
data.  We should be able to replicate/enhance this code, in the same reposi=
tory,
to handle SPD format.

> If this proposal looks good to you, please help to create a repo for
> this application.
>=20
> Best,
> Michael

--=20
Patrick Williams

--8WI4CJN/1CmqA8yt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmICF58ACgkQqwNHzC0A
wRnggA//RmYGsgoN1vzpyYc3+us5cMFFErgvZS1Iv9Z6zO52TbBrbK2B23gnYCZN
Ly592Pm8W3HX2ymoAYVdZEoYH5Moei42VV+aW9YOn3iWnwUxWVv6cj+fKCQpU/Px
PEUxmiMYJg7uXGnTPSZ2EfiPT2gljoi8uesibwszpzi7tmWR5iYzk/McxsyNpzqO
moMFYaGZlv7B/c0OQogpgZTWF1SkpVJQLqq5u9euRQVLLTJIXABzGDRvZSo6CDeX
sk+CQ6TcTw3bj+5XNZ0S2fhJeV6L2gwd0yKnGD+ouMXpB+VnUB2Ym/Ux9eocsIWZ
NkrWczhfwvtrDxMvarMeYbn0KZm9Ua54+LdQSsBxi8TU01Y++tNtwVjThtd/DbRt
EXw6x0PtTTvsp/tAZI3vY4V9pER1i5sPDwXE1OmiMTnDtCQ1D05n5wFm+ug9oBQS
gnnihdowdt22JEFOVn+iYTNXiztRMo4TvJHPxTF7MV8z91mSVrBlc69uOSbjBjDz
v2hre+/a8ZqbGkv642efzZSRBl8mjcgWGhH7j9njvm3cxskvduiqEwMm+wZ4Fm78
/slav8oC0cGBbTAQrLNxkBCfLESabDKhdDvFUjDp0miMAJCEVMNzsjSOPEEtw7cA
WdwdrddA+iejQulBBG5NqNCl2niGOIOj+xcPuhmU/SGo3yJ4PBI=
=DjQ2
-----END PGP SIGNATURE-----

--8WI4CJN/1CmqA8yt--
