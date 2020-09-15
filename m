Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D605126ACE7
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 21:03:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrXgd1p6GzDqTM
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 05:03:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=ciKYM57C; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=rKj/xXr5; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrXfl2NlbzDqP9
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 05:02:38 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 629C9CC4
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 15:02:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 15 Sep 2020 15:02:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm2; bh=RJJ9XSWuY5Kl5r9OY0VkG1QWUDUK/RBmDF8/KiNA5vo=; b=ciKYM57C
 jKJ3uF4GMjAjJ2jwXZoyVMhwXHlv/+DabvVMOg20VUMIhCypWpJwG7/VMpJHYSSi
 wmk9Z3dWHBGZ3fQPTSkTWWyITsvjlaqPH9kxz+5GU+pI83at537wS6qLgVAx69yh
 igribNWmWVI9fRSvGQBksYCNt9qtIa0SQvsjI6RiS9rNFXA+iGNT/N6HGymRcckW
 M89X9tABqEbCiq9J/Cpjc+CvmVUCO0de3Qe7oaJpCqVBncyMyGyGw2J4NIF7SVkN
 dVmP8naLwaSQ+sZcoJWC0QrBxvxepzuCXiJa4uZoqdbIKXqmk/IxIx4NSbu793d8
 vEefRRkHx+jZhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=RJJ9XSWuY5Kl5r9OY0VkG1QWUDUK/
 RBmDF8/KiNA5vo=; b=rKj/xXr5JKdzwuqqVlsm9A4xsJEtZxF1hZJhP5YGk27c2
 kImHHZ2514+ZpOYQbJsNTx+9NcwQpUIuBJnSE+Wlj+w01MfqEkzYJndWqMnI5vv8
 ISBSpCIO0H9eIaeKaIVWI/tu2dRWN9beGaqnpY2J+1PRUj3BRf2wpsVzfg6dA+0l
 uEO4aYfSsMT5rPlPekCV3wRwv7I2RhhubMqoOsD/+d2PkoOUZbYOlK87zAnBMba8
 QvkWhCusuHnwCTCvUinI2R/ljBqfl8O5IYw/PDNYWTMSBA2OrfFhiLSi0FRrYaKC
 uY+ehR0zB7JUivAEnzVMwfkuNq2q+ZrWH6RL2029Q==
X-ME-Sender: <xms:xw9hX0Zit8mI5gT-LEz2pt9TYOQHxe5gAwQZ_0lVHl0S-bnlj_AGDw>
 <xme:xw9hX_bX3Tmp0vWIH_nJNPNeuHnaWZTT_ZoGiljVYEDJv5LQfa9Z3zE-F7FGPzuV0
 2oY62EFIlf-T_8dBKc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtddtgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnhepudeuvdeftddvveejudeuleelkeeiudev
 jeffffffvdffvdejkeeujeevteeifeefnecuffhomhgrihhnpehgihhthhhusgdrtghomh
 enucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:xw9hX-9PpFVvb37EOAouk2HXPb1ooOOtmU8SS-T5jYFXEwQiYtBhvg>
 <xmx:xw9hX-ou_k1jsv62f0OIRcrFW81Ex9OIE9uDrRmK8xOUaYJlmSvQSw>
 <xmx:xw9hX_r5W_vOU0ff6kgHQRUPMoElRZzO5FonKUPi-VI9fkdRsEZ_Tg>
 <xmx:yQ9hX82PGyE_Jc3cvzxUAeEElWe7lrQSxmYsV2eGXhk99j-9UBJ88g>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 74F163064674
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 15:02:31 -0400 (EDT)
Date: Tue, 15 Sep 2020 14:02:30 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: sdbusplus: size/ssize types and 'object_path' type.
Message-ID: <20200915190230.GB6152@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

For the sdbus++ interface YAML files we use in phosphor-dbus-interfaces,
I recently added support for 'size' and 'ssize' types[1].  I did this
because I've seen many cases where there was some discussion on
appropriate integer sizes for countable items (ex. uint8 vs uint32 vs
uint64).  Generally, in C++ we recommend size_t/ssize_t as the most
appropriate type for countable items (and anything else is likely a
premature optimization).  We should now take this same approach in PDI
interfaces.

Another minor change[2] is I added 'object_path' as a type alias to what
was previously just 'path'.  The name 'object_path' is what the DBus
specification calls this type, so I think that name is more obvious for
sdbus++ to also use.  Both 'path' and 'object_path' currently resolve to
the same type, but I'll probably also start switching PDI interfaces
over to the longer 'object_path' type name.

1. https://github.com/openbmc/sdbusplus/commit/4ac7e56e8e18202fad3b2734346c=
6d4c7a6957fc
2. https://github.com/openbmc/sdbusplus/commit/d5ce346c434705180d0cbe25686d=
51630681ba4b

--=20
Patrick Williams

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9hD8QACgkQqwNHzC0A
wRlSvA/+PIJOP8vd6adBdpAevHEBAknuzfCL45fOjzjTsy0APrchDPlfwP0i362O
ySEjTTCNx+6lyXrwhmZhnAAclY3QThI9QamBcjePKMH5jkfbNGLE9qMIVxniJiXp
b5HQ0sdSHTIAmvSwunB2SuA1byltzTKUF8Khpb+sxaMwikNlsNr4c5n6fm+Ax5Rg
B4l+CbUjL1NeCYHveOAHfNM6FKX3J0pswBfFx0RR2o5IVmZv8O4sXDIuWtwwmAqb
4p8Rz205vnh4BLycJSlqZVhy13tp1l3KJVxqbVZfzbfTCwDe+idAonNT8qtopRel
jCwQgySOmgJ83lYY9oFx0NldiULTWgzsE/08GxzG4stldlt8XuKq4flGEAHxl1rZ
d3nCxJEm6zwuwykf+oGstbPUMEiFJFRQPn6clRRSV7mQpfz+jmi+VTxqOHPDdB0/
eajlqesJypHTjWOsiqjyvwC3EJz5Y+nJtYDsZLXsNWr0jK4wkgu35ISJawdHJnuq
bGN5aG3pBBwVzu0/MFB/d731XkH8irS/twjX1r9yFg+Q+owoljshlKh3cJbCXtry
WHr0XQcAUI1QVjLB4TrJGfMvxMy0wZjYC4jCjzVUcGNWK9ZvZZ3f3tZgI3uRtclz
oxUPYfoOAYTgBPr33zv8wRD0JLGoYr5riAWUYJVx/i74IhL13TQ=
=8jie
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
