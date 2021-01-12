Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5861B2F3C80
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 00:02:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFmLC06PhzDrQl
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 10:02:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=avENJsOj; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=mQdj0Mf+; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFmJy0gcqzDqsN
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 10:01:04 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1F3281C12;
 Tue, 12 Jan 2021 16:07:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 12 Jan 2021 16:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=OP1bvpNj/vcFAYx5rY6DVqWZJwN
 TSdyAlzDvGoxl7dU=; b=avENJsOjLN/EDLOd6UbqdH5vYzVDAmIg/I1yWN2rMQn
 0z0nY/3RfpUVQCFU7BC4A7y0nZ5xCb6A4Fz0FEptmiDdQKEVB2cfG7HIzSX6QjOi
 09Uzigtoo76q0OD3U+bfhX0L4O+tNR9ePewmFl143j6SX0JF3D2FzSr4RbCBjn2c
 3Rzy5SATQbxmksFMnMo3UemGGxOR7S6G8SCFgLE82G+6O1ckQMw0YToUp3xICLul
 K8wYz2f/73sDheQDPHkT7MmEEYBy/5iPcUS8mSKCCSoT9B5GSOwt8w3K/fBkqsaw
 v1qNgX6I3SbgvBTewUy98Kc2VdYdR2YqHQNUMM57cSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=OP1bvp
 Nj/vcFAYx5rY6DVqWZJwNTSdyAlzDvGoxl7dU=; b=mQdj0Mf+/Yyw0c5UMTpzwg
 9hYSPyJHL07184hZme53+hb40ZqFbCr4EXw9H82skfRzJjgY27oPhdxJz/JAsrC8
 y3oe0NPymSTYiXHQotxU3aDYz1K6U88oS0FRXHgcw9gKOgOiRheL4xw4VRCl0yRv
 noV4wRsg60d03okZnfSGoYCxxVx9TOuZU9CqP97Z7p9Dw/1XfgaAn7SImkYe0BiS
 xURSRRuLS3hqEyPGOtHQTo7AN5wSswV9JIKu6/oerYdEHr21PhPmcErXxECe6W14
 wahucborblfgJhqA1LWkASYj+dSE2Ajdo064q+lf4iBr71e8YSWt7infOhIF1aZA
 ==
X-ME-Sender: <xms:og_-X_yQgVHvVGJ0JwwDblTsW37OfjH_HLu-LtdZ3pLBLwkvD3IoYw>
 <xme:og_-X3Q_s5TkgC22Egqipufdes2cgEW12y09Hd0eudg_PfvSG-56tW0xhtkNh9CZv
 -4Pc6B8DpFUFo4Si20>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddtgdduudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 kfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:og_-X5WUpGnhrWDo-eCgJtp7wzwrx3E3_9Pec21_IqqUtHy4XpoiCg>
 <xmx:og_-X5iN0Ex2Nt38b1Uosv5MESJkYECL3pg7FOLRi4_jlZ67felv7A>
 <xmx:og_-XxCeZqh4R5KjLDROW3SNIdfVBe1rFzoU08znhPMfUDpREoemTw>
 <xmx:og_-X89sDCd-am8Rd9OrojmaNx6vrxydfaHv5aFKRqgIA2Xxldp_Ww>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id D04C3240057;
 Tue, 12 Jan 2021 16:07:45 -0500 (EST)
Date: Tue, 12 Jan 2021 15:07:44 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Call for volunteers
Message-ID: <X/4PoDzXRroPPANc@heinlein>
References: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="M4dcHmfP5kDaIS/7"
Content-Disposition: inline
In-Reply-To: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
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


--M4dcHmfP5kDaIS/7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 11, 2021 at 04:09:19PM -0600, Brad Bishop wrote:
> If you are interested in serving the project in this manner, please reply=
 to
> submit yourself as a candidate.
>=20
> -brad, on the behalf of the OpenBMC TSC

I'll volunteer to help on this.

--=20
Patrick Williams

--M4dcHmfP5kDaIS/7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl/+D54ACgkQqwNHzC0A
wRkh0hAAgt61DUwjcHtRCmMtKkIXLK28Jey/KKJ+h/JELaUUly1uMWZWycUCaJ1+
cxhcTNp+HxI40b0WtD8BVl5/goiDJTMD8vIeZQ4KNje0R+nyi3rNwTjl9rPvv5A5
qee7d8XZe1ENnx82g2l84YAKT+45Ktd84oimwcNVpt1Pu1oUgwBOa3uJRT0oQeeH
OIaoW3wbPoVEuWcoxg68QapHewbawiNgbEUSR4TbinmYHalh/xJevmqRksbaL8Wi
WipH4dr/Dye9zCryWoGX8CaT56yR0zxF19aBXXsAQL9IrdYXw51pUQuz2LpVWeHY
gJmUgMgnjLhzI45aQUwkdvtCDEXgqbmPyQzkQjWdllxl49Ce+Hp1xMqGNG5AJ5rz
UjKuN0UrlGKrO94qi5wL/9Z4zpDpl8N7lIICrCB2zAzvU3S+NrskJ6lYUvHbPnQS
FGaduSi5yH1N5cQcQ+E8j76RLdSJHxKBY4GPn8SqcoXDpfL4X+8ns1CiCjQCN1FX
p46cSr5ixmQIoTncqkN0iC5RhZUxpgvCs4+aUEurpW2Lr8CuhUkUgjwENTf+oPTk
6nzhImKTBgMjERuZmJsKRuPY1uGTbjT2AQobPCaCEBdY/Nv0J52iHK4b4/azesSb
xod9Z/jW3b8rQZmtm4swGuOcMmO0/qc9h/P5WJl97ASicdUT1T8=
=cSJw
-----END PGP SIGNATURE-----

--M4dcHmfP5kDaIS/7--
