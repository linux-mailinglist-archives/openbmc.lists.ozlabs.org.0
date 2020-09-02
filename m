Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC14D25B098
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 18:03:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhTJ54ZVczDr1g
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 02:03:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=dDdEzV6p; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=JEAEnfBx; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhT9r0T5yzDqxB
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 01:58:06 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0C1DA5C020E;
 Wed,  2 Sep 2020 11:58:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 02 Sep 2020 11:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Rr18BvXY3mVG0ydjuS5OHXQLOMI
 sjwXdD9Ikg0cD7V8=; b=dDdEzV6pvNlS1c2RJARHHvo4+aA+3aPWHEvJnQ4Q7PI
 Secs9siwAQmeeXGAzVaucRbPv8u5zEznQF8/Qm13qpNhvXNw3X/co6bph0IBKZmy
 puH4hgrF13XEJ6WA5yD0XXxm1TiLgcV4LR0pprbMWE30nBSwL6Xz3iDq/cOwXXvU
 5S5yXWZKuIZFUbfG56Fmd8TCafjCvqZZxz6oW/fBdO9uNggxBNXxWS+Okl3S1XIf
 rwPtoW3G1rQdqhl/7Crve7LIFG2pumO0Fh36W2FXHdabKKBJBWH6ZltV+/nWIZAY
 OFua6EX27yrkvs+DKhMNH3XoYwbrIJb/yJDGQZVSQzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Rr18Bv
 XY3mVG0ydjuS5OHXQLOMIsjwXdD9Ikg0cD7V8=; b=JEAEnfBxPIBEaBz5OFMIg3
 enfVkxCE38nOoG3nOl82r8+sMD/qnmSM18Ustk0nGAoKtZGtvDCJgq2YgH1e3cH1
 f6eQR2JJdZsImOv1CAAOZs0iayEeX5y5JeCsQhPEKAXMwqbH5q1ct5B6I1b7ONOq
 ntHHhgg2qpW5tWPQc9OFHLtQ1wg6fI7r79YoCXPyV05pDpGL7sCPm3QY42FhKiIT
 4/cSqyl8Hxs2U5QLwuOXdoztpjXj/mDi/5f06+6xoDhJqJEjOMDuWFWdEsfLK+dS
 NZRhVIuBE1XSO7CzklSpGm+1wTeSlBhB8Ej0EGSdYnmt8ahIvqEPbRSuIi/Cvt8Q
 ==
X-ME-Sender: <xms:CsFPX3h4CUP_xLDce5nxv885vK00_Z3gc-Ai8D7-as9_gcDa8AJ7Zg>
 <xme:CsFPX0A32nO1qhEnKAPRoKyFQz586A50zXXBfmwzEqPX_2pGlvQrmaxj0906kFAAK
 wA9i7ekYkkLft6ldXc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefledgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppedutdejrdelvddrheelrdduje
 ehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:CsFPX3Fe7ccUYkrdml_-821HQ95xwQys1tKYynhdHxj8dQS5Wpi0Ug>
 <xmx:CsFPX0Qo-rVi6sXR0d4PRDChylIi_9uTKK0fW4qJOAPJEcpOJB76XA>
 <xmx:CsFPX0wBpI7uxp2lwkuvaWVJA_LJeIOdRX9taYa-pZiTH5kA7nf4Eg>
 <xmx:C8FPXxsSdqMguLoLYd5OcF87ZRpGt92fz5FK9kJgxQcCeJQeNAfpyg>
Received: from localhost (mobile-107-92-59-175.mycingular.net [107.92.59.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7E8F430600B7;
 Wed,  2 Sep 2020 11:58:02 -0400 (EDT)
Date: Wed, 2 Sep 2020 10:58:01 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Asmitha Karunanithi <asmithakarun@gmail.com>
Subject: Re: Resolving service name conflicts
Message-ID: <20200902155801.GX3532@heinlein>
References: <CANGK-S5k=Dy+nf9cDPwNxcU_DELyaAkbmXjsotgpunQscaQ9Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8MA55IEjTDEadc2f"
Content-Disposition: inline
In-Reply-To: <CANGK-S5k=Dy+nf9cDPwNxcU_DELyaAkbmXjsotgpunQscaQ9Bw@mail.gmail.com>
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


--8MA55IEjTDEadc2f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 10:38:55AM +0530, Asmitha Karunanithi wrote:
> Hi All,
>=20
> Hope all are doing good.
>=20
> When I was trying to do 'avahi-browse', I was able to see service name
> conflicts (since the service with the same name would be published by
> various clients in the network and I could see <servicename>#100, after
> trying for 99 times).
>=20
> To resolve this, the idea is to append the hostname of the client with the
> service name (whenever the service is being published), given that the
> hostname will always be unique in my case.
>=20
> So, the service file would look like: (example.service)
>=20
> <service-group>
>=20
>        <name>example-hostname</name>
>=20
>        <service>
>=20
>                <type>...</type>
>=20
>                <port>...</port>
>=20
>        </service>
>=20
> </service-group>

Can you give an example of what a service name would be in this context?
Is it like 'ssh'?  I don't think you should be advertising services as
'ssh-hostname' in that case.

--=20
Patrick Williams

--8MA55IEjTDEadc2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9PwQgACgkQqwNHzC0A
wRkHpxAAhluROXxI/f7ND1vpDQCo8OXrRfPSzn7qj7quLcuxhLO71VAGFfhbGX5R
fE2h/t2NtHvU8L3cPnZmHUiA858fagVih0zZ0xu4btg4gqMzeHYGn1LZwdGhr4RX
XOKfYJGUUEwL2fICuvqESuMF2iSaf0bFSCt2mPDNUEaqfNOjIA9ZOKFnDlKaqfuz
snvq3c2yo9oYQ4ryvHf/GscwuAcJ4In5DGYRnBhYnEXKQdg4dXKsEEUwK9mP+Hh4
uNjCDNM678IoSoj6Px/DvOlJ60gg24GdNPiTCCiyCrd3Dvj1odY7Ae5skLAHwTbO
t3hZQI994WUUoBb+0X68CZDPlP0LQVy18trfqqP6SMQyeVI/sf/QKjrmZJjrMtWU
sBqlewfjwFl5ECvW2F5JZeoiMS5ZXUPDBXCss+qZc6Nfsl3cuTpiYb69pxonN5ib
oEP8ULWr5t1+JGJrFgYocLqC5cJzrOWx4nRj6P8XRK/MO9jip9zZ6jPTwf0DvJf4
dd+/w11BLLC/2su7cmbcbDpUfwIjBSKZdtfdOsQjG6NO/idLAFj+zzopOK0bUeku
ojLG1l2MsaForSWHfET1mwrn7TqVOLH/0nGRvGdOEMsLQAoFw2MQm0KNe0AVuuzh
HGyD/wRt0Oybae/cC4o7vew/d2KfxjGfA5/lij3lmMfWCUuZ1UE=
=KPiO
-----END PGP SIGNATURE-----

--8MA55IEjTDEadc2f--
