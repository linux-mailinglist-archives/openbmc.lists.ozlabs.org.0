Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A57A132F3BB
	for <lists+openbmc@lfdr.de>; Fri,  5 Mar 2021 20:21:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsczD4nDFz3dCs
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 06:21:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=GVxpXTFp;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KFAp7fb6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=GVxpXTFp; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=KFAp7fb6; 
 dkim-atps=neutral
X-Greylist: delayed 303 seconds by postgrey-1.36 at boromir;
 Sat, 06 Mar 2021 06:20:57 AEDT
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dscyx0SLlz3cKQ
 for <openbmc@lists.ozlabs.org>; Sat,  6 Mar 2021 06:20:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 74A052B15;
 Fri,  5 Mar 2021 14:15:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 05 Mar 2021 14:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=S95s2QCES1ydLDRUD8sJqrmfb7q
 w0T3IygFmGVYAdY8=; b=GVxpXTFphTzJvaGVqW1Om89DGJLWaXrbkrdEITM21kO
 Hg+TmTJBQRUhnVkOUHHJL3tD8UPVnVa+T58OQK97JW6naa4jTbBFGJQM80hFGfVv
 0giR0tCP3KRpxH41sf9ihSOOUTSzY3KBCJwkVptJAF2WXay+aonyIxpW3Wi3LUh3
 jCN2b84GTfwz+Wz3UdA6hB56YrYCY5xNZ9Gum9URDlHVqrFXbF6QqMJAjT5jvS9Q
 3hTlrKZ39lT4f0FCA5m0SJ/3sxl0lbh8hyPDLisk6OUYbRw1o06vWCp3DgSv8IJr
 +BjMghfUXLKaI9tL/6noDO2psMSXE2XLBpibrYSXBDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=S95s2Q
 CES1ydLDRUD8sJqrmfb7qw0T3IygFmGVYAdY8=; b=KFAp7fb6mUwa40E/rHwY5F
 Ya81zw2gtEncFv5gorw9yw1USWaNu0ibfQxl4UtaA77YfGt00HaIzD47RrB0l/PJ
 8VjwV5lVJ1GIp5244adluODSiG4o5lS+KRYUXuB8Y6+XfNb3aLLS9/V3uhOx8Her
 /z9vOetbHb3eWJ+bjPa+haYj62MxBr6FzzHAj/e7Tth/kQGSGf4D50XwgoKddE7x
 3zbMzCq+iNc05RPHF/oWbh27EHzLbN16UJkvW51DN4ZxR4RDk8djZK0cWoXQJwVT
 OVWvOItbvsTMSH0tfFNVpzlyw3bV6URUtRentQIoFp68T6GkdoKFlSJjJH4/Rffg
 ==
X-ME-Sender: <xms:ZYNCYHF10xTyBEFgXoqrH8QONmZ2LY_DD4HN_2gXMwXas2KwnRHqwg>
 <xme:ZYNCYJuao6ODdl_3-SBLOU2JhkAbenWjn3iggNagDXUb9mN8jUurDfNFPvUFXa9tq
 d-4MGGunOFtMJy0rvE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeefffffvdfgtdeludefleefvdff
 kedvfeefueelveduiedtgeeuvefgtdeiueeuveenucffohhmrghinhepghhithhhuhgsrd
 gtohhmnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:ZYNCYJX8oLV_A6qeE05nndoXTaJYiitQa-KiRWhyi2ShxgX4jief8g>
 <xmx:ZYNCYFH856ph0VBqNtOJBo2FpzFgDqiIAJAgL9rXTT1i9rdC-Jwh7Q>
 <xmx:ZYNCYL1exI9TjBSSPGk2zyp8Kz1AG5oSQwcAfHGbbSiLUlHlxkBQog>
 <xmx:ZoNCYLskZ7Q0jd9GWO9WP2cVLZTivgc_uoFtYixQoEbfRhJRDafiDw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0416624005B;
 Fri,  5 Mar 2021 14:15:48 -0500 (EST)
Date: Fri, 5 Mar 2021 13:15:47 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Request new repo for IBM-specific code
Message-ID: <YEKDY6+zfW5Uuqkl@heinlein>
References: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SU3XhomAPxkPWtaT"
Content-Disposition: inline
In-Reply-To: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--SU3XhomAPxkPWtaT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 04, 2021 at 09:14:47PM -0600, Joseph Reynolds wrote:
> What is the right repository for a new Linux-PAM module to implement an=
=20
> IBM-specific ACF authentication?
>=20
> The access control file (ACF) design was introduced to the OpenBMC=20
> security working group and is described in [IBM issue 1737][] and=20
> further explained in [IBM issue 2562][].

I'm not really seeing much documentation on this in either issue.  Do
you have a document describing your requirements and how you're planning
to accomplish it?

My first reading of what is there, I'm not sure why typical certificate
based authentication couldn't solve your needs (but I'm just guessing
what your needs are).  It seems like you have a root-authority (IBM), a
a daily expiring certificate, and some fields in the certificate you
want to confirm (ex. serial number).  I've seen other production-level
systems doing similar for SSH/HTTPS without additional PAM modules.

> Note the [pam-ipmi modules][] are scoped to the OpenBMC project because=
=20
> the IPMI implementation is shared by all of OpenBMC.=A0 By comparison, th=
e=20
> proposed ibm-pam-acf module is intended only for IBM Enterprise=20
> systems.=A0 The intended implementation is based on standard cryptography=
=20
> techniques and could be developed into a general authentication=20
> solution, but the ACF is specific to IBM in terms of its exact format=20
> and content, and I expect it will only be used by IBM and its partners.

Are you planning to open up the tools necessary to create these ACFs?

> Can we create a new OpenBMC repo for this?=A0 Perhaps ibm-pam-acf?=A0 Or=
=20
> should this go into some other repo?
>=20
> - Joseph
>=20
> [IBM issue 1737]: https://github.com/ibm-openbmc/dev/issues/1737
> [IBM issue 2562]: https://github.com/ibm-openbmc/dev/issues/2562
> [pam-ipmi modules]: https://github.com/openbmc/pam-ipmi

--=20
Patrick Williams

--SU3XhomAPxkPWtaT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmBCg2EACgkQqwNHzC0A
wRnHkg/+OjdOQGb4rPkuk8rAFFXs6MGML+a08KhQhbrlpsmVgqMQoFuqoMXgDl93
TZY7QDlVn/v69uto8T2/OZ4uoLnqxagfY7whEddtH5jFhLKfwq0G7ooCthZH74aL
6p3rL701y4EJaONgmSnJ2IxJTGvHdqjy1jIjj8jzELGaFKqYDNUoCJ+eyzfi08Ij
xlSWOMdgAk7UcfNi+NxxOxSbOJwtqmW5koUfwg/OIqxo4UidLXxOIROQLN5VAFau
2srhxDXSferSooxgByOYE5Z1+3Gr2VUYgpDWENw2Q5oHRUqJC9UAvXBtIkgSOxZz
U6IrA9Dp4+dFPG6sKTG/VqQ7gd+NZgrAZsYaCrwlxjBHarMAfa9l+oPn1bydFtvU
6OIItAvyvbrCB4SaY+Ey6jl88pwZ9cyY/CoSH+BaE4/NSCe9VEZew/Y6JcmALQUu
UOs9awGQ5ynX/TPuQg6+iZTbEycClS+MkAWcbrKrfZYFSmUk96EF9SvyqUyclMfy
MTOtBsfe+bY+nzG7niAgT3OHPM9TPN/nvazr5Z8ewGoYsuIQavYCdUBycZ734jBJ
Ervv9wD5l3FqoX0q0uesUu8jreCwJ56sCiNhLVrEXdzcG7oRUjnlJQ5IpAZqeTfS
Ehq0RHqPcH7tiNpVpYCAOOBWX8kFHNufEoZp5JgowFJlPUbETbk=
=5K9t
-----END PGP SIGNATURE-----

--SU3XhomAPxkPWtaT--
