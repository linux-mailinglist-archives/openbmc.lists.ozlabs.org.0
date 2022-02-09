Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 455164AFDCB
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 20:57:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jv9d66VmFz3bb0
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 06:56:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=MwIR46L3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KxpL3R9Q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=MwIR46L3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=KxpL3R9Q; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jv9cc1smfz2xD7
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 06:56:31 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 1ECEF3200D98;
 Wed,  9 Feb 2022 14:56:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 09 Feb 2022 14:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=Wet6U1ruCMSP5TdURN4UEIj+U1rNNbPTG6lLQZ
 /8+WU=; b=MwIR46L38GnNP69GUB5mmF02zeHhoPiTSrqamrRfv3WLUTTYh/kaVR
 RTnY6Qtj2j88nW3ZLY+0HKnmtGReE8gjiMa+hzzetMKhpzZ41YfXEwXSJU9h0dX1
 3MAcMYFp9LE/i09MVTXZWP6OqKLpMngAnwyrN92nwiuXW4nAzI1lFq8R5wMlr7CF
 o7nM+vigmijGzMegSO0D/4cypWM7iyBDsR0xAHuYe05KFLH3twnKVN2Wy9Q9nirh
 F6s+zHDian6B8IFhLRH02ce+3NqfFPzWmD0QVdLo2jeY2CSNxe90lK/p1FyQ16ZQ
 K2FbtYgE7RnYlhNypj4TVEGLeehQDyqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Wet6U1ruCMSP5TdUR
 N4UEIj+U1rNNbPTG6lLQZ/8+WU=; b=KxpL3R9QNxLn0jqdapgRft24NLLOUNs+I
 y136lvRjNWXBHBb3ajIeeCt7IF91KzLgh/gbkm89xdh0SBYOm6JDK6WAMkJfWkzM
 pGwX+N3Rsxy1RDXEp6eGFyvfYgTvwRXHXIFTJM8DUF34lJbrfxioH4HDp/crJMJi
 zqAsJ3dRXttxaIuf+GsuWCOB8P8n9ek4vy/5mLgoMNxlhbhgErXaSOpGONymNhhL
 D5KfCbdtHMrEP7HQ8tNJ6iaVt8zxbiUrfHqjqBIsC+UIUHty12EkB/nFJqr14SfB
 anrKRRUtp8cVX5sxbSbT5U26bQNbG7GNBUNPUiUg7bWqI056tvq+g==
X-ME-Sender: <xms:ahwEYiEutFX28L-Nec_Ly8-aTobniGlD3IJsJkHTqL0RB8I7JG8JNA>
 <xme:ahwEYjVmi8sTp6qy4kOLqSd7DMcf5PvL1by-MkYng1RlafUYcpP4ayCoRDuqtpa8x
 T7iGan-g7lxVXg7tcc>
X-ME-Received: <xmr:ahwEYsJ6ag6TVri8AQYnOykijFcrGsUqObe_sri0aDFCutj4EfQU4SXe4N5iqDYLcO1SuZPM2Wvaa9Yb13x4HRbC-KCLzJId>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheelgdduvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:ahwEYsH8W3nfkKMdrKk61soyFxI7nhCKi4HrO-VAWB5EiVljOkiKxQ>
 <xmx:ahwEYoXIb-2fc0KQ9jTZ2Issx2upXiHf9NYLImCBsHeESHP5ySXn_Q>
 <xmx:ahwEYvN6QjiX1Yhl58KJbh_DPPPmgqzxirhHIUVcWwLTepRMG78yFw>
 <xmx:ahwEYjd_E0kkdOpkBrzKdkUkXIogizfmIP0jkGPi8kz9ZZ1dyGyVUg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Feb 2022 14:56:26 -0500 (EST)
Date: Wed, 9 Feb 2022 13:56:24 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Michael Shen <gpgpgp@google.com>
Subject: Re: Propose a new application for reading DIMM SPD directly
Message-ID: <YgQcaInEBq8ZBlIm@heinlein>
References: <CAD1rtg8sa2OG4jUL8x7Gr9ExzH-tEswhHwSDaZtWhcAN4sAvuw@mail.gmail.com>
 <YgIXodbEP9hmae6Q@heinlein>
 <CAD1rtg-tTrbjiL76NRDGnAfx36JBM4Rcb2gyUYjROR-2=H+Uqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2L5QQTfvtP0WgKxQ"
Content-Disposition: inline
In-Reply-To: <CAD1rtg-tTrbjiL76NRDGnAfx36JBM4Rcb2gyUYjROR-2=H+Uqg@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--2L5QQTfvtP0WgKxQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 04:23:12PM +0800, Michael Shen wrote:
> On Tue, Feb 8, 2022 at 3:11 PM Patrick Williams <patrick@stwcx.xyz> wrote:
> > On Tue, Feb 08, 2022 at 01:10:37PM +0800, Michael Shen wrote:
> > > If I understand correctly, the main method for obtaining the SPD
> > > information in openbmc is from SMBIOS which is prepared by BIOS. And
> > > We are exploring another way that excludes the involvement of BIOS.
> >
> > Unless you're proposing that the BIOS itself comes to the BMC to get th=
e SPD
> > data, I'm somewhat surprised you could come up with a hardware design t=
o make
> > this work.  Due to the number of DIMM channels and the limited number o=
f CS pins
> > on JEDEC DIMMs, you're going to have muxes on the bus somewhere.  Mixin=
g muxes
> > and multi-master access is pretty problematic.
>=20
> Yes, we need an additional MUX for switching the master(between BIOS or B=
MC).
> However, compared to the single-master(BIOS only) design, this MUX is
> the only hardware difference.
>=20
> > Either the BIOS and BMC are
> > fighting over the mux, which is going to mess with the mux driver's vie=
w of the
> > world, or you've got one mux for each in which case you're switching ma=
sters
> > onto a bus, which violates a few i2c design rules.
>=20
> BIOS owns the MUX select pin and it can decide who owns the SPD(I2C/I3C) =
bus.
> From my understanding, BIOS only needs to read SPD during the POST stage.
> For the rest of time, BIOS will hand over the SPD bus to BMC.

That seems like it might work.  You'll have to deal with the time when the =
BIOS
has the mux in the BMC code somehow.  Ideally I'd ask for the mux select to=
 also
be fed to the BMC as an input GPIO so that you can differentiate between "we
don't own the mux" and "all the devices are NAKing us".

> > You should take a look at what is already existing in fru-device (part =
of
> > entity-manager repository).  This is already doing this for IPMI-format=
 EEPROM
> > data.  We should be able to replicate/enhance this code, in the same re=
pository,
> > to handle SPD format.
>=20
> I am not sure if it's a good idea to put it into the entity-manager
> repo. As you said EM
> is designed for IPMI-format EEPROM. Adding another parser into that
> repo may violate
> EM's design.

I'm not sure why it would be an issue.  Hopefully one of the maintainers of=
 that
repo can weigh in.  I wouldn't expect "parsing only IPMI-format EEPROMs" is=
 a
design but just the current state of implementation.

--=20
Patrick Williams

--2L5QQTfvtP0WgKxQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIEHGUACgkQqwNHzC0A
wRk2Hw//UqGpzxlPrwvuEZ7dNJwu25syCoQEYbxizabELa1zG4JzZcwwW0Cm6Qkq
sDpZZN6z4wqjqN5EmqjWZF1347Q0RRR/i8GNJozOnl84NGyTANvrHQs5yIbji2hj
xp5vfABxK1EfDAvpkdSSYkjDAS++rinlCAGog6XLD1gQKWNHWwvFZZKpuYrEuakj
n2bEnabNRZBsub3rrJgZcK+UXfRETqGkQAynSVv1t76Um9R+nlMCpuUA8besbsp3
M9lJu+GLg24JkqjJt2+ELMftT4kS091HFAOKEjZ1S0DMSa0xmY3ekEfQLA1tRNEp
p38cP76B9RVwUg61UdXboRYYu2iZjPMoP+bGHv71J9yDkO4vyne/2Oh0ZQ2Sl4dS
lLju+yb64KS9a9IYNb39HW+blXb0aK2O46V9tKFa9KwyA2Z4h/QMUjF1Yk4BYmvK
0omVF+b6Pgu4yEP4YcQgyT8Se6FDSqEujHAECFRuh37TCEfWl5HmGVOq1C27+57m
+f3XyawKQXyHh2Het8CxWNpSXCSjPY+Ta6KbiCSEH5Uth6PwkECVdXE/sYtuzA53
7cowVku7zEpKd1eTOayokNaWwuSJ7bPQwcg3WQrtURVwXnYkEi7dM+3dQyGjvjLC
/NVzgxQ+CRI6YxMK2gx7AXGg6R4Pd6iJoKEhFFgfEQ1IAwAjl0k=
=kznT
-----END PGP SIGNATURE-----

--2L5QQTfvtP0WgKxQ--
