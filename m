Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78153963943
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 06:15:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvScq3kMMz30VY
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 14:15:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.142
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724904934;
	cv=none; b=Z2Lg0/ZCITINjpCGCV0ceeDDasyVJSWQOBGpfNG7GU6wboXOujrqM2kQcPJjkmoSnasZMPjYp81QxymWIKNLJel0rr7DG92HxqLYy7q8BQ1ePkDMKB2VMqRjDTyCiLWfdRxu3MLsnlmc2bY0yabYQkdaeibxJ+v3B6w2VO+45h2TGpijigMepP2A3GHMmFUSSxalwx59q6JFC9unEdwhtz/KUJ7rBDLyQ8IuAeHSnvllPyczP7zrv2eF1zw65wZbDAUrR/VsLBYqxQ1onQyX7N2h8p/CtzTj3UY7f/Rjq5hqgOlxD72Pb92Jt07Q6jtLSoLYFQFE9PINTlV7BgcR5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724904934; c=relaxed/relaxed;
	bh=as1mTBjYGNBZVfHF9b6jeKf/jUMlm0I+hMN+luRmYqI=;
	h=Received:Received:DKIM-Signature:DKIM-Signature:X-ME-Sender:
	 X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFy21SK3cNDNj7dSx6pvki8ebeX7PNM6lRd+Vpg+hvmCBFwzfNc9oTQeyrrwoTacYImQqpwXBONVSE3yWcZNT4rfgubuzOtsu7t7lNbuuV+OKRIAhSZDTNxhShlx5SiO2z1jTFwJ4TXMuzchbctA5Xw0Oso6zGQnoq9wVlLTyf5tO0WSYv497i/cBkdSRMr7oNY9SkqFWVXka2ZRe0BBsxkrnzjfQ+wne6RikxjEUS7Wl0wfVywc3nfkTGdjuOWeIJKn3pno7zLALXHqk1hQ5/JrXSGcklDgrCurfj5Cr2dT1//QLfyB7Kp2f4YQMaAmlL7fgJtuBvKMuRiWP3X4BQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=RMntxOPl; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=e5Vfpmrm; dkim-atps=neutral; spf=pass (client-ip=103.168.172.142; helo=flow7-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=RMntxOPl;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=e5Vfpmrm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.142; helo=flow7-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from flow7-smtp.messagingengine.com (flow7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvScc5Zttz2yYK
	for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 14:15:27 +1000 (AEST)
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailflow.nyi.internal (Postfix) with ESMTP id E4A392018F1;
	Wed, 28 Aug 2024 23:16:43 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 28 Aug 2024 23:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1724901403; x=1724908603; bh=as1mTBjYGN
	BZVfHF9b6jeKf/jUMlm0I+hMN+luRmYqI=; b=RMntxOPlV954vyFTzuLvlf+ddv
	f35cfCa6+EqkJODnhu//uHTs9sNEH/5/m5lAofN7vBAr+klzwMShBQjzgDcMeEIa
	F34wD01O4qO75Bi96sJA+Mf8hUgcbSdGJWJHP2hewDkewyGiVU/g6rapv+t/Xa1B
	gDjiiCiXkYZ5yg1XjtWmePdpv/khs3BWaFjPF20LKAQSN8i2T5Lpj0PbSbSd7DuL
	zyvFfJC4Z0ruUbVOyV6XHKb6H4pwAKzSCCIs428jeQiXtMbXwk79nrsMCHY6D695
	nku/r+wLlklnGHn6B6ooAtDFykPsC2Qb2W4NpXa1vYQH0pFmUqRfRsGnQITg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1724901403; x=1724908603; bh=as1mTBjYGNBZVfHF9b6jeKf/jUMl
	m0I+hMN+luRmYqI=; b=e5Vfpmrm734naCBfSjJ/6lmosxvH5CZR9hP2nUhh599U
	W1NXuOkSg7dSRzRndgsitlgHCXbiFOA5FAGKn0MJFgdLZXYslVYZORv3TD1Snt5E
	soIyAvw/VHptWXvCOUi3iW5FWDkcx4rjjBJt5V3ig81ld31EdlG+8fuNRQbughg8
	V30UkGS9lvunS2/VIDuunw/9jReqR3K9g+w4fbOBEg0hLhCuR+pAYDBbAVGVNt9w
	oPPmjRFo4g7SpXNEQLUBrs9bbEqSGDrZeRla0cVr2MGl0HOn9WnmxWGlRJSAlaZk
	Oya+4NTRW6dTcbJnnC+Gvp20Vf14AsxswA0poz8bfA==
X-ME-Sender: <xms:EujPZs-7nkCKVCgdtjyp4pgnKRGRZu2TngFT9wR8LHKNBligvwmrig>
    <xme:EujPZksNHA0Xmu3rdz6bzbHBxls9N4oxddecZ7NI_TbptJxWg5QQSlhnPhCONMgDw
    oWvNuVCPC9FMlIG8Fo>
X-ME-Received: <xmr:EujPZiBjZwsaRnHPsCb8wUbFua_cJI7chTKoUDFNiLqs7q-ze9IXd-h0v2E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeffedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnegfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmsh
    cuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeeukeel
    gffhtdehtdevgeekvdfggeekhedtueeiffevjedvffekvefguefhkeelieenucffohhmrg
    hinhephihotghtohhprhhojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihiidpnh
    gspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepvhhinhgt
    vggptghhrghnghesrghsphgvvgguthgvtghhrdgtohhmpdhrtghpthhtohepohhpvghnsg
    hmtgeslhhishhtshdrohiilhgrsghsrdhorhhg
X-ME-Proxy: <xmx:EujPZsdgdyTMcrsdsJBuE5X8XdEC5NNR7yEmhA2nDiKFTf_4YZB37w>
    <xmx:EujPZhPDfs2il_ImdD-FT-HqsaWecsVUoiH8bSqx-9FkrliCVStUZA>
    <xmx:EujPZmm9pjLtKY8CYMHMrPZooAXL4j0ZgNWXlPWmQyWoBssX4LtQOw>
    <xmx:EujPZjuNlHyUMRuHea_iCtcjErpKjhI-f1ZahyyN5lrnH9TeI-DwvQ>
    <xmx:G-jPZjXE0QrCYIZJAiRVwaiFnKkEsJDH2CKYRmlPAiYqiQRqxWjpMksY>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Aug 2024 23:16:34 -0400 (EDT)
Date: Wed, 28 Aug 2024 23:16:31 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Vince Chang <vince_chang@aspeedtech.com>
Subject: Re: build meta-zephyr or prebuild image
Message-ID: <Zs_oD6ij39m_DhqP@heinlein.vulture-banana.ts.net>
References: <TY0PR06MB5707DEB13FCB8F7A30528E25E2952@TY0PR06MB5707.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N/EWtTc6zECuoNqg"
Content-Disposition: inline
In-Reply-To: <TY0PR06MB5707DEB13FCB8F7A30528E25E2952@TY0PR06MB5707.apcprd06.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--N/EWtTc6zECuoNqg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vince,

On Wed, Aug 28, 2024 at 08:09:56AM +0000, Vince Chang wrote:
> The next generation ASPEED BMC AST2700 will integrate a RISC-V MCU (BootM=
CU) as the first stage bootloader, and the firmware will be written with Ze=
phyr RTOS.
> We'd like to seek your guidance on the best approach for this integration.
> I am considering two options:
>=20
>=20
>   1.  Using a prebuilt image:
> This approach would use a prebuilt image in the build process, which is s=
imple. However, I am concerned about the flexibility and customization opti=
ons that might be limited with this approach.

We went through similar with Nuvoton's chip and their bootloader.  We do
not prefer the binary prebuilt image, because different companies often
want to be able to customize aspects of it anyhow.  We would like to
have all the code available for them to be able to modify and aware of
what is inside.

>   1.  Adding the meta-zephyr layer:
> This approach would involve adding meta-zephyr. I am considering using "g=
it subtree add meta-zephyr" to integrate it into OpenBMC.
> https://git.yoctoproject.org/meta-zephyr/

If we need to add the meta-zephyr subtree to openbmc, I can help get that
done.  You shouldn't provide instructions like this (using git-subtree).
We have a tool that we use to keep our subtrees in sync with upstream
and I'll have to add it there.

--=20
Patrick Williams

--N/EWtTc6zECuoNqg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmbP6A0ACgkQqwNHzC0A
wRnnvxAAqXM5Lp8QO6aGNqtKpmw0Zu/vq65euR/unnX0gUUStFJsHMk+hesTq/rF
W6rtqRhav9vL9WGG5b99weoazNCW0KYAPbgpMVa6rmur2tHv3sn+bUdObvk8Es8Z
ZbI9gci4F1Cn3g8KwfSMW+hOcqwx5IAxGwwCr9nQaOTJgagbm2Dd9G+f0GlV1us0
DF0zEl9dvJB2lcneP90fKzl7YXB91zB/MvguLKQYaJCB4fl7gzwvBRWxcP7YhATL
zgh5NJXIU/LEh20FrIt+2Hw4WeCEEd8MlIC21/7xZ0dQG+kCu4LPVgYCjep7sE16
fJ75bXvicp038v4TPFblQiJDJir67NMLF/UiXeGOCGBDkPKlxIrvoYCtn37Uf7L3
srM0M7jZlucxJrYA4qBof7qfKcsIuSXt2USuJG+2XyC5yIi2E8aYE9BByNu0rrSO
Vu7N/BnCAtYUeLmzC9EN6owFVYlwhJDsIWx67sP2nXGvWpbPkJvXVT1OK6VBAawx
eGUK0XcBO++kO0bsTLJTJv9/ItUBr1OwwOk4wite6ig/w9uy8EMnIMThbhr4UKAK
3wUrAbo+6ULvQXjI6RbG7qPRzKwqTe7VInJ0ucviQNrJkzd2fsOz368CkdLpEqDk
n6hvlxoFlgu0ShWHm2zieVVPppL2S6bKiTexEfaT9KVuwev9jw8=
=b2CL
-----END PGP SIGNATURE-----

--N/EWtTc6zECuoNqg--
