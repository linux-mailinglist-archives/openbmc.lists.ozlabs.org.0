Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAA7275BE0
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 17:32:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxMc52VG7zDqYC
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 01:32:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=rMVQvCqC; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=J+pyzoca; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxMZW2c2tzDqQS
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 01:30:41 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 1A7C55C0224;
 Wed, 23 Sep 2020 11:30:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 23 Sep 2020 11:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=nEUJjFFEwRqlLSam3IUhmqWArQ8
 RLQxBzpYoSHOrJ6k=; b=rMVQvCqCBGHeY8eR1+U0QxayaahRnnwlTVvuYlmztqT
 kHVFLdB33r/l4oPzcUOS9iFY0IAHDkhXgknHxrA1zvL0i8VuYZvKy/cLhelXnyhy
 xTz1uQx5yrtJ/acBJ3NjTkCyRDP5zqHAnoaGRWVGfCUAAQ6T+VT2daDnCB1vW0fC
 jclufBHaJSQ00V/PTd0xx33d/yhJxzB5YJIS1Nn1SBONbBOI3nsGSE0PywWhFA7Y
 Oc2M9Nym9sjuI5PeaqTSpINautk+wKlpkZrnL9otj8k0/Gg42eIx43JrusYIuqCr
 D8fBh/IFqx03oJ2o0mp+blAbJV7nPuAa/VZAzZOs+DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nEUJjF
 FEwRqlLSam3IUhmqWArQ8RLQxBzpYoSHOrJ6k=; b=J+pyzocaRbvewnqfrA2S2k
 5p3q16Kv83rkk2pDze7vH3qcr36wkMedNRvJofLI1CXPOF/1nrAWVZThEkC62Omq
 MrJkoSb5p7XnLgssMz2aNvkttjUmk0ulY+vbQYcEgWfCCooeDz4xKpq8Bl8ZAUQp
 pySZYaMILaBC4hxBwfn0mDWNNZZWQrGtYQnGhqirqReGbOTf1+iINhOo5qVMN11Z
 BdIkcz1zC+KFzDKkm88NAx7GolPMeHpezc99GBpgUE+bw4lkLN9kpNlEBlZ/kq8R
 dO+294IU0LDXshQRycHU4wihUbi+5BcPEkm3MSK/MqAXdIxzxeRPnf3HrcDofWbA
 ==
X-ME-Sender: <xms:HWprX_LNLA9Dd2OnnSK1B38ZpbogDxIqc7XrCCPxb4RrnYcYtvq96Q>
 <xme:HWprXzI4KbbSRK8Lh6CAIvuXnrCDe9nTsgBGUaYXhyR7E0NfGpZTJXhnsqNoaal3y
 RWLcFY5xPFKCi44i2k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeigdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:HWprX3sxgrkmRjJQxTqsSxrN0qPQdx-usrefZxcLo4UkoeQ8QEcpDg>
 <xmx:HWprX4b_KoFjHdb-_4CEs84BCcno2wPvJXiOoBw4ERAL0R4pu71UqQ>
 <xmx:HWprX2b0rKA_pVeey_E7QyxTgaR_Td83ENeec65zQJFEayJimnc3cw>
 <xmx:HmprX_Dil3qItdNDXgug4256-dHx8twLOcCQ_iTB2EMEgS2yhjLF3A>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id D43A13280065;
 Wed, 23 Sep 2020 11:30:36 -0400 (EDT)
Date: Wed, 23 Sep 2020 10:30:34 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "i.kononenko" <i.kononenko@yadro.com>
Subject: Re: Naming DBus paths of CPU objects
Message-ID: <20200923153034.GO6152@heinlein>
References: <65194bdf-93e7-0cf5-6fce-2b5b0aee5c9c@yadro.com>
 <CACWQX80Fj2fiF9fW56meL0kQucKfkQc4QbL5-nC-_amRb8O-zg@mail.gmail.com>
 <31453c1b-def5-145a-9bc9-6d621fb9fe1e@yadro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oJAv8lSwuaQsYd0G"
Content-Disposition: inline
In-Reply-To: <31453c1b-def5-145a-9bc9-6d621fb9fe1e@yadro.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--oJAv8lSwuaQsYd0G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2020 at 01:35:26PM +0300, i.kononenko wrote:

> The CPUSensors takes the DBus configuration object which is defined at th=
e EntityManager.
> This object impls the `xyz.openbmc_project.Configuration.XeonCPU` and `xy=
z.openbmc_project.Inventory.Item`.
> The last one adjust `Present` and `PrettyName` properties. So, known that=
 at least, we can adjust Processor's=20
> schema fields "Status": "Healf" And "State".=20
>=20
> Moreover, the CPUSensors using data of `xyz.openbmc_project.Configuration=
=2EXeonCPU` retrieve the sensors target values from `hwmon`

Is it possible we could start to get some of these interfaces defined in=20
phosphor-dbus-interfaces?  There has been some work lately under
Inventory to contain some of the CPU and Thermal properties you
mentioned.

If something really is Xeon specific, I'd prefer we use com.intel.'s
namespace rather than xyz.openbmc_project.

--=20
Patrick Williams

--oJAv8lSwuaQsYd0G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9rahoACgkQqwNHzC0A
wRmrZhAAoCJf87pPYUjd47ShfqnQBxcwMU4++EIKBYylJGt/xnzVfNZrPE70kGTg
Q/CJs/xBXa3aVgMsqFWERGtbBRg45wylzlDP0IWEVrRLkERVklX+WpOn0S06E7DF
aGkQcFfIDygci4kX+PJ+TNpnN3eAR5MYN4Gp+WCiARGWVa/HSdzM6kgTkCBU3krx
j8Hi7yBpPUivGMfs2xuM75QEi5g08Nm79Qz9sgxREmUXI6zOOprAMHax10IGiCZB
8OSITQ5E+/9sWbmsL5iebFcb1EMmHTYYYX7Q15d8yJp69hzZr7o9UxQylJ31nIPh
nvDxTMaT4gO3XaBqWv1jkLz5tGMcKo6BEo4cOnkBAGfh3G4Mq0AELYxDZBD8/cgj
p+UaFDzzonu7r28fWXlduHRv11+fzIhzqzr7g5qH4QaTS/TEFSaQgfN27sFVEAQf
AjuoaDswXXhwiIrPDdyoDQVvkxOd1nJkjhAnEgtC62PFl1aj1Q3c7Ajgm/KJ/oFN
gZDrr2mxabL4DWxo8OCoXIGuLuGeVS744BbsebcNEy3BJmahyUfESprLeCO8Mpq0
PkWYImr+JJ/ZzTGvgsUl7biwnC5Bg7ARAmw7A1YxInzyiTpCabF2OHcukOmpVGuN
qkjxzceovslKiNw7lKe4fWAfNG5jpOlsVdCqax/WmV9Qw2p3cgU=
=Sluj
-----END PGP SIGNATURE-----

--oJAv8lSwuaQsYd0G--
