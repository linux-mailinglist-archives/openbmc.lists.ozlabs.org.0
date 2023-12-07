Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73850808776
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 13:17:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ecOZV8uY;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=mH93CywK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmCvY6Rnpz3cYG
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 23:17:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ecOZV8uY;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=mH93CywK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmCtt0vrvz3cR9
	for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2023 23:16:52 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 9E60D5C00E6;
	Thu,  7 Dec 2023 07:16:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 07 Dec 2023 07:16:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1701951408; x=1702037808; bh=aA
	+y1KFLEumBvjJ0gL2gJywKEEpJjP23MtDHvzEQ70s=; b=ecOZV8uYupquT22SOH
	XgNyPvRrSotIz1bXQ98yBNYqCv+Hp6C+CYyHqwn1FFqm0tJhKQCl9DACEVJMV2Sb
	lDOipPCaPYe3payxohdWewwDm6C8/rWvACr9yeS+RgzzKRkYco7Ei36HGBM45SfY
	XwuT22x2Odn53/bnisP8SElIHi4e6cYyPPFhLqui1O3s+L8b29C6VXxW4SgGKqEj
	LWgYtx17DnuRgqg+dH0wjvY8S2ZB0OdDG3iVHP3MMH1KZheg+3Z7MWW+0acUGNBv
	NSlnA6oObHSdCUc/ZaIh2aiHNzaFOdhHAGOo8eN8OzglNWVhE0ytndfGuFhfypn6
	ISyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701951408; x=1702037808; bh=aA+y1KFLEumBv
	jJ0gL2gJywKEEpJjP23MtDHvzEQ70s=; b=mH93CywKdZoAfEjcDolzTYX1oi7so
	PmD39hMFan78sKou/C1373SieViJLYslBl7VbfOIb5LvjytPYHIXljgsFHr/QeGD
	yPT4vW6Bxmjwl4sH6gbUxooog42Jjme9oYMVWglC5uJvsP4QP3tekyD0hCOTP68F
	l8D9PyLM3n2aIp3xfAil768WoJ1XQzea6xYsC2kIcf3DLT2/Lnc1q6tNf6vRfvwO
	JfmaCrXCLO3ulCJ8zhHKK8TBpb+jv1D/9Atc4NrDW0KxO7hg554abcyQvlwaFtbw
	ZCSWsr8Zxt/0hLTbgc58ylHRfTWHKaXvrGXVgUJEHqg7Kp9B7k1LZiusQ==
X-ME-Sender: <xms:sLdxZfPcc3_GI5FgH7fWRXfRQuS7lDvFBBX6smeVjAI81jvmgcWS0A>
    <xme:sLdxZZ-B0Q4-YzXsy-81maqZzAc0kEowbHdG-C8xtTGe7GJ-xuh1V9avxFXKioYk-
    e8a5oGc4bq6OKYt7Nc>
X-ME-Received: <xmr:sLdxZeRineEB4kSyqCk43SVW1Gf-ScloM2zceScYLSr8IC46QGjFriy-7s1YXATHFVvRr_FFbgfQZNy_9AmzTBFMWd2cdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudekvddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeeltdejhfeutdekvedvkeeuuefg
    vdeltddvhffffeegheejueeljeeitedtleefudenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:sLdxZTtf750mIN5JK_3B2E6CEG0925v6bIDVaExYYINtEkCqlnZkAg>
    <xmx:sLdxZXdSIn9cREZG7X797_sHyyCir41iiLFAjCvo0gFbwR_OwYmmVQ>
    <xmx:sLdxZf2iTrC19kxKQ2VM5sKJ3TfbQsqivnspTvifJUhThwl2BjbPEg>
    <xmx:sLdxZYqXokXgYZKwr1BZ3qKbyccg8IAVME54LeUcibczwQSTE62bjQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Dec 2023 07:16:47 -0500 (EST)
Date: Thu, 7 Dec 2023 06:16:46 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Ivan Mikhaylov <fr0st61te@gmail.com>
Subject: Re: [PATCH dev-5.6 3/3] net/ncsi: Add NC-SI 1.2 Get MC MAC Address
 command
Message-ID: <ZXG3ru0LmEveGqEA@heinlein.vulture-banana.ts.net>
References: <20231205234843.4013767-1-patrick@stwcx.xyz>
 <20231205234843.4013767-3-patrick@stwcx.xyz>
 <6abc879a2c29cc8b8044c5c483bff5a01750695b.camel@gmail.com>
 <ZXFHdtNDvBshKQap@heinlein.vulture-banana.ts.net>
 <e735c41f9eb2985a46fa63fb0d0b477513a227f0.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="caDnIJAIYfkb+1WF"
Content-Disposition: inline
In-Reply-To: <e735c41f9eb2985a46fa63fb0d0b477513a227f0.camel@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Peter Delevoryas <peter@pjd.dev>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--caDnIJAIYfkb+1WF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 10:44:05AM +0300, Ivan Mikhaylov wrote:
> On Wed, 2023-12-06 at 22:17 -0600, Patrick Williams wrote:
> > On Thu, Dec 07, 2023 at 12:23:38AM +0300, Ivan Mikhaylov wrote:
> > >=20
> > >=20
> > > Patrick, I've the fix about ndo_set_mac_address not so long in the
> > > past
> > > https://lore.kernel.org/all/20230828101151.684010399@linuxfoundation.=
org/
> > >=20
> > > ndo_set_mac_address do not notify network layer about mac change.
> >=20
> > Hello Ivan,
> >=20
> > I think you're suggesting there is a bug in the code that was applied
> > to
> > net-next here?=A0 If so, we'll need to get a fix into net-next.=A0 These
> > commits are just a backport request to the OpenBMC tree of the code
> > that
> > was already applied to net-next.
> >=20
>=20
> Patrick, yes, there is a bug, I'll write to the thread today/tomorrow
> with that commit about that problem. Need to think how to make a fix
> for this problem, reverting and make it right until it in net-next or
> fix above that commit.

Is this the fix?

diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index bee290d0f48b..b02e663e56dc 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -1115,7 +1115,9 @@ static int ncsi_rsp_handler_gmcma(struct ncsi_request=
 *nr)
=20
        for (i =3D 0; i < rsp->address_count; i++) {
                memcpy(saddr.sa_data, &rsp->addresses[i], ETH_ALEN);
-               ret =3D ndev->netdev_ops->ndo_set_mac_address(ndev, &saddr);
+               rtnl_lock();
+               ret =3D dev_set_mac_address(ndev, &saddr, NULL);
+               rtnl_unlock();
                if (ret < 0) {
                        netdev_warn(ndev, "NCSI: Unable to assign %pM to de=
vice\n",
                                    saddr.sa_data);

--=20
Patrick Williams

--caDnIJAIYfkb+1WF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmVxt60ACgkQqwNHzC0A
wRmIyw/+Pt1dRjFCtE9shpRB9LlRyJz+BsOTySdK/JACBhWkPSlr6blr0wxckdox
o2EQWpihuvojzn/2esv4NcUVZnZVz+VtllxZJ4UtEciiZJf+N957QGv2o8fMUTIS
WKStY56yUbRoc2zdXJ+y5P0CvfOLSj779dwb3W8e+sXYAcD0qZmP3fWQTRmE5XYQ
xhv8aa/HaVjbS9fmDzpIjSU4mKmNyMQVx8m86jEEK39I8N+YR4+RDRfZupi1rkP7
fBIY/2e7dswPFBQxzW2ci1wWl8rcjZ70f89YFZjYn9BVuwHOG2Asawa+TlNrywD4
BxjSn7PlZxtXfatv0hxj852NihC+4JNQbx0KHKM5P1kQrRJrU2dKVEBVQA9+frOm
1wsilzWeS7ZPn5KclqpY7DnxVKpMW3jjl4y3k+NuK7VPtCKxbQQ3LehTjhJ6qjlz
AgSuV5sZaBWD7ncRQuLHfcCkhgacn4maswokrfw4KtIok7+ihwe8SoVJPbBSS83K
HeEH162K9zrkpor2uWlDB73ls7lhiR4YfDiMLCUOP1U9HKig5MZfaQJfmmfypHcV
jM6NX7D+TAMJxRY8K3vlu5FQJN8eGyI5DCowMoyMYaY6RFmCv7LiJEW2nWsLHJWF
Uf5MxiBa3NsaxyfKbP9hssr0uG8fOwM7czYS0/R9qhwy21KNu3I=
=9VxX
-----END PGP SIGNATURE-----

--caDnIJAIYfkb+1WF--
