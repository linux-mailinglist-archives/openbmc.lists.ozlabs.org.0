Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F76516B7B9
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 03:26:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RN99351GzDqT1
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 13:26:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=B/GjZVdb; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=AEhaMHhY; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RN8b2x9VzDqN3
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 13:26:07 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id EEAAF66E8;
 Mon, 24 Feb 2020 21:26:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 24 Feb 2020 21:26:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=eSJnXXMvJyD++EDg3ImBCCfAweY
 6kOZJU4tcVP8sg0A=; b=B/GjZVdbjtl+1uvUJ/xBO3emJBdSput/+cflWpI1d5f
 /YCnahkaZJRKCbBil1Ui1pOvPRDxz+Z/QAojX3FhuCGf1zDsh3WxA2WAZ+1nLSkb
 LjipRccICaBXHEpU26oODYbE8GcYkt4myaH73tRFIm3NVyK/U3dHgj3ReUtz+ffN
 h+Q8RKZod8k7gvO2UEA24bUyQ5njhxfoqnYNfCAe9Cd/ziC/Y2m44xZEaKGBWmE0
 xmpJawoHR7naCK2AeImP40wO5lbPKaz0a6ZNPW3xx/4t6FfR+uPMDBOLUkSwTmCB
 uzQgUFJI2oV4nyiN+SM3h4gdih8DiUpgZMSQ7+nL91Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eSJnXX
 MvJyD++EDg3ImBCCfAweY6kOZJU4tcVP8sg0A=; b=AEhaMHhYqukN5iYRdb0LJp
 T2kpt5+Xni7J0LivNpvJWj8KhOi4Ndy66SzSf+Lxqe66xizvfwq/EFPJ2PvDC+xE
 SfsznfpFZYx8Y8o91vM4irxjVX93dsHf8ODwz+/UNndhWbb5grwgBczMOLyhgpgh
 ETaCFrgfn6SdbRLjQa/yeKHETf10PAfcfpAMpNmKDECZrGLilc//55zD8QGQRxT3
 X2KgerKDHJLc+KNeGi2/a3iF1YjjoyEtk2Yrq9XmF033zaNQY9tHrkE5iHZSvAx4
 2sOveVwjkOQV9vULEefFbZ8JsmogodKaC+GmynnGcH+YIh56/Oxtzl9MCXXO/xqg
 ==
X-ME-Sender: <xms:vIVUXo4qOj2uQwwJwkvIWnuag39yqxzGTO75RWQrc5ErVLgHmLZWXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledugdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeejiedr
 vdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:vIVUXo4TcTOaD340DJir2-1zTWzR8-aI-mGcCIgTEzoCFefA_WIduA>
 <xmx:vIVUXvt-RdmkOENOi22UIbjHDjc1GNHvG2Gx3J4UoBqUrlmITAvxDg>
 <xmx:vIVUXpiogtFsqPOy93NM0Oi0zoEJk4iA3H8sieXb_uPbaKIlXGn-ZA>
 <xmx:vIVUXlKFQznohJugo1-9p8n6Wc7DjX-KirjtSx5rzaByubv_Fxk0fA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id BDAF63060D1A;
 Mon, 24 Feb 2020 21:26:03 -0500 (EST)
Date: Mon, 24 Feb 2020 20:26:03 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Xiang Liu <xiangliu@google.com>
Subject: Re: Possibility to move microsemi switchtec-user support from
 meta-facebook to a shared meta-layer
Message-ID: <20200225022603.GI67957@patrickw3-mbp.dhcp.thefacebook.com>
References: <CAH57Xkz0BDp9NY7QdB0i329t=YS7Vk4TQccv8bg6DSXknYVsUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MPkR1dXiUZqK+927"
Content-Disposition: inline
In-Reply-To: <CAH57Xkz0BDp9NY7QdB0i329t=YS7Vk4TQccv8bg6DSXknYVsUg@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org, amithash@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--MPkR1dXiUZqK+927
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 01:54:27PM -0800, Xiang Liu wrote:
> Hi Amithash and other openbmc contributors,
>=20
> It seems the Microsemi switchtec-user tool has been integrated to
> meta-facebook, the recipe is currently located at:
> https://github.com/facebook/openbmc/blob/eaf4d364e55f96a5b37331049db1a718=
d8667e5a/meta-facebook/meta-fbep/recipes-fbep/plat-libs/switchtec-user_2.2-=
rc1.bb
>=20
> I am wondering if this recipe could be moved to a shared meta-layer, like
> meta-phosphor or an upstream layer? As our team at Google will also need
> this tool.

Xiang,

Glad to hear you find this useful.  We won't ever import the meta-tree
at facebook/openbmc directly into openbmc/openbmc.  We've started a new
openbmc/meta-facebook for our machine specific support here.

If there are recipes under facebook/openbmc that you find useful and we
haven't already ported them to some openbmc/meta-* layer, feel free to
do so.  Off the top of my head I'm not sure the best place for this
particular recipe.

--=20
Patrick Williams

--MPkR1dXiUZqK+927
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5UhboACgkQqwNHzC0A
wRnhJw//QeNiN2lj4/Rb5wsJ+5j76FrvjGmfqqEKMlggxJpHheqLfyXSrO1lgWi7
oUX9tAfnItTS2qzeIpzPO6T3guUg7hIbI//i+2z3NtzbuTaAbAywYeTRzyuVo8pH
12SohYsAIDVmNP+LUyjsdS7f9GHeRSNEYPKPNd1q2r5akbwPUt7JEmB5ApgfRFdW
jbRjefDAVnmjbLZNUkjnbGcNDLQ3CDaemdUx0J1xDZE2vJ1tlekkhRuDAcUm53hF
DQQRZTW6/dl5XWRilu4NpAvNtM/yTiuRYF86qTlJS3h1leUyxWrcqof3QjOlQmxN
FJ8UItlYxEf7eObCNcdbYWJqPGQi2tYMtkYKnTFl9N/ggrkVNoVjR0e5ITake4o7
w+B6fsEEqON6NNIHugFMh880XridpKMLsvRu+lIBx8Mp+DBy4jcbBbDPDJaY5/MF
+y5A3p1W1W+7yay7GELYiEd9Fmtp7/RNKx1Y0puVguAO8IxaRhMm0h2jeQBlMW2/
ULWZbAD3YLh25I9JOxDaSDL/DYGqEUPZRAz0wOp82PAVEjkF2dRctUHLgsnh1RZw
9L6F+kwB6U2ACpsYcuUIZicCXmep+bUhVzTUo3vPY5GsjEZQEzCXtp4DqVE0aKy1
VOqHJLFzZnY7dlIsjVm78fnZgjBN9f2ETrdwgp647TZSOKlB9Xg=
=6PlS
-----END PGP SIGNATURE-----

--MPkR1dXiUZqK+927--
