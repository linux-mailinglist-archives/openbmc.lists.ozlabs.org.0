Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CC134B777
	for <lists+openbmc@lfdr.de>; Sat, 27 Mar 2021 15:07:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F70yW4gqnz3046
	for <lists+openbmc@lfdr.de>; Sun, 28 Mar 2021 01:06:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=bzesT5AH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=LnTQaF3n;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=bzesT5AH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=LnTQaF3n; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F70yH3KJlz2xYm
 for <openbmc@lists.ozlabs.org>; Sun, 28 Mar 2021 01:06:47 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3B4B55C0099;
 Sat, 27 Mar 2021 10:06:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 27 Mar 2021 10:06:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=O7aoIgQFDjv+ufiGdUfXdIF3coq
 YIC8RxWjMwEJL5LM=; b=bzesT5AHEXJguuXwLHjCqR1j9xw7fJhBrOsrVZoPcnj
 cJX2PthXqnBIygcoigzP5abmsMjFcsLXl43+JEcNL6ys5YDc0iPrgfzupl9zNifI
 r0gqkPUBqzNp82VGUZPgdG/6awTy3eirNRhhmY5VSAtuFlWDyfTeJZa0uIUOrtQ0
 Tm7RL4CkOytvvUrSrbJmzQHe97WwyXDS+/3oJytMjlkbBpNv8sisWcpTYMzhW0n8
 +1gJfwQ0LECe/4nBrEFwq/hciJfTBwz3QQ2GnLdAqgl2mVG16u0SpyOsDnGcgSjO
 E4F4RLheDQHeXrKd/xxgxHrBY4y+/V0j0DnoqIAzhSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=O7aoIg
 QFDjv+ufiGdUfXdIF3coqYIC8RxWjMwEJL5LM=; b=LnTQaF3nqPolBdJLTBZjMe
 GEZQbmuswoNguc5FZBpTD0aKrdje4KvfBBRWyKESOsnasKswbY0mpXRgTVye9QhY
 J2KwKcN3EQsL3XVal7IErexKfmJtGqmFij6DhTgckutK0TgpgO0FhnOc0gJOY0k3
 BnoNzn94BDyvdUWlJylN9A1ADuqIGMZdsBkCPC8lB5Blxw6Rccl50USAaIhn2EPI
 ELkKEnIHBBpLtuo20dbZeq+gkSLfkSMlNBhzbaqiEUV2Q7MlaBQU2L/cuxJPE9AL
 8sdXA1eNou7v8OKMyFJo7gNVdpWZHfW2n/TWCd6tRlO3A26RMNSeRtGHd2sJgJdg
 ==
X-ME-Sender: <xms:9DtfYJJDdrxmLZNpxyg6rDkUySx_Qn0A0llOoUoSC2P8S_6eXECE5g>
 <xme:9DtfYFINnq0VK09daxXhdSgS_kMUY-X4nFvlvHepWxQ9jIDHBzSgT67a3RmJTvPh_
 dU1YI0faHTDMHuWHuc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehgedgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvdekueevuedulefggfefleetfeef
 heejhfdtffduteetudejvdfhieekhffhueehnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhdpohhpvghnsghmtgdqphhrohhjvggtthdrgiihiienucfkphepjeeirddvhedtrdek
 gedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:9DtfYBuwO0d_LxwcclqToKki66znOwX6mje8Xdc1ECj1npd6BHRIRw>
 <xmx:9DtfYKapafypH6BipBim-2iba51Oe_2Sx7xWvJyCYAWxWexXYjlvcw>
 <xmx:9DtfYAYktPwGYU7HGObLw3WaNVEOY3IiZEDHP8QbAW1Y1sfDLg2V2w>
 <xmx:9TtfYPlrQSFbF0_8Cmfu6N3XEUe-7SEwtLmFTg0WVuTxEUp3CRwbBQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 59345108005C;
 Sat, 27 Mar 2021 10:06:44 -0400 (EDT)
Date: Sat, 27 Mar 2021 09:06:43 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: group for foxconn CI  / fii oem repo
Message-ID: <YF878+wP5rWnAs9m@heinlein>
References: <DM6PR08MB58838020F8543D03C6235064B2929@DM6PR08MB5883.namprd08.prod.outlook.com>
 <DM6PR08MB58834FC516032C1D11C9F9F9B26F9@DM6PR08MB5883.namprd08.prod.outlook.com>
 <20210315205148.z6mcrx32kxr56lm2@thinkpad.fuzziesquirrel.com>
 <20210316125616.qnu4bxjzh5ub2fzs@thinkpad.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qVd0p4wHv8BfgSsc"
Content-Disposition: inline
In-Reply-To: <20210316125616.qnu4bxjzh5ub2fzs@thinkpad.fuzziesquirrel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>,
 Lancelot Kao <lancelot.cy.kao@fii-na.com>,
 "vveerach@google.com" <vveerach@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--qVd0p4wHv8BfgSsc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 08:56:16AM -0400, Brad Bishop wrote:
> On Mon, Mar 15, 2021 at 04:51:50PM -0400, Brad Bishop wrote:
> >On Fri, Mar 12, 2021 at 07:25:42PM +0000, Mohaimen Alsamarai wrote:
> Yesterday I learned there is an additional step to get automatic CI=20
> validation working.  There is a script here that needs updating with=20
> your fii/ci-authorized group:
>=20
> https://github.com/openbmc/openbmc-build-scripts/blob/master/jenkins/user=
id-validation#L42
>=20
> Can you please add a line similar to all the others but with=20
> fii/ci-authorized and then submit that for review to=20
> openbmc-build-scripts on our Gerrit instance?

I don't see this having been done yet so I made the commit:
    https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/41=
658

--=20
Patrick Williams

--qVd0p4wHv8BfgSsc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmBfO/MACgkQqwNHzC0A
wRn+1Q//VF2/EV6gKYnW7S1Y/68hqN5TVZLLCJBVmm892HxpzLBABBoNnaTgZMb6
Y3Gdhf9caWBBYsq7tHzPzX4YXuOBEmgclTNfYVd4O7d/u6Ah3FTSyksEnuqPS2W8
Lm/MTXBkUvQ+Li5TCAvTG3sxCQgD3DV5sYBL9ZjC4KarUCfQlP2hnm9l9ykpkNnM
dWAnE3r8vDLHDu0YXVn9ka/CK83O7GF2c39k9ZK3xsWDmbehrU2jxtvZt0bSgqnx
h5Zo5sz0LU1HOoL6bRbgo/CmSxbrDRinbvKPonYbl/f0UcrbwTzzYwxqt+plBYLS
Y3+waqURxOi9O5MjaWDQcH8ffEhj+F4/PVrd9bQpkxoCUOZkFRuwq29EMrYIrN+s
zDOuUVpUfCai9xoa6IQ8XRy+Rw6+NZfqErkBBwH2o/5MN+cZXrjnANJN/H5jOdBq
dAMzTbU5+ibjQax0eIj7+9tUQRZob0Aff1usraUstjQVgKv6n7mHGENrXGkYW2Zk
eXHd1PLbJ1gUY02c9go65OYoNFdo134RjF1gjEjKct5byD04U3GyrFImBc6fyBoG
a2zFjM3Vvs76VOMjeWk8OeFpCf8aTkPqWxvNVoj67aOmH7x2vb/cicB1dQYKuqeq
cRQsyIby6KculA5hbuhBNNi1tI0TcKs6eLynExCBA+gk13l8Qfk=
=gXDS
-----END PGP SIGNATURE-----

--qVd0p4wHv8BfgSsc--
