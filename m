Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E4A1705EA
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 18:21:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SMyx6kgzzDqkB
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 04:21:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.26;
 helo=wnew1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=GJ2mnOwr; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=YAunZC5T; 
 dkim-atps=neutral
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SMxp65WszDqWR
 for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2020 04:20:13 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id CE67C54F;
 Wed, 26 Feb 2020 12:20:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 26 Feb 2020 12:20:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Dic8TIe097jW+xRGIB0mTyOBD4s
 tRzTK3Y5OAQSLnIM=; b=GJ2mnOwr+PTm3l0U4zqxy8t0exSFw55i5ivzUlY8qwY
 exCHfX9xkUJgaocpFdWgdqo7UyGbnGyZfK4wxfxsJcXob0HcSJjUoufBb31AH/y1
 80tEthf/em5R3APot6DKYlwzRvqN2ENbmh2RnnVHzOKcNq5R9n22lpnAqL3hDD96
 Vxcc7sspHE70aNPSG7FPXI3eZpqL5iTSwcemQCUpMqT/cpArIgG7QlRYJ0d/WLna
 8WKheWbflfltkaPTUM8NSugMsB236kuWwUetY1q+hqqBrL9VoRXZ/72M58Y5P3Ab
 8P7lF34vVwMpI+1fBQeQ5e1ZEyXF/QmB/b2IKsr/WRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Dic8TI
 e097jW+xRGIB0mTyOBD4stRzTK3Y5OAQSLnIM=; b=YAunZC5TO2haiQT7L7zApp
 3N2FKvNIVZHwB7uIms7EQK5HVNZzP+ebuBphCfVYF+AaG1mOg8Z3ZK0uXzjjvbhy
 dUkXxpGobcG8Icb1tZGqzYrRmhaGwjKR/ZnrmYMyhTFr8FP4l9SLhvkiKYMkDmaj
 PXoR2SVlNg4zFT/X99nKk26V0+Nn/uCdWPGyDbketMYiSxQowPIsJzg2YAOMs+Kq
 vh3CGtHgRBd1ZU768sB2AvBCVIRSOL8HPKEL0op8uIXffh65FfiUVMSiR0PxaXhn
 P08PIW0a2dBDxG61IkNDHUS5iT1HKMDpphEvThHdmUgJYxSJ3zz6CcQIHjqO9h0w
 ==
X-ME-Sender: <xms:x6hWXuBP2MkfOm0QBlCncTFV3IxgW3FlVZnnrc3hhRjkkY09-fg-8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleeggddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuffhomhgrihhnpehgnhhurdhorhhgnecukfhppeduieefrddu
 udegrddufedtrdduvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:x6hWXmVQfQQvaia_NGCO22dXalmysfRmyqkGTIfonGJAi-g9pjTHug>
 <xmx:x6hWXsAu89935bPLHzluRyJtb6hkXc-IRu3ComI04V0zX7H8c-FDNw>
 <xmx:x6hWXp-1Ib4dFm3f0sEnmnxK_cfwt5Ox6eH2A7piQINjkapyIerSTw>
 <xmx:yKhWXmmskdFKc_TFghlAe75jcbEEYfuFFKDhPX6qOMurRClkQRodcwpbLJ0>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id B5B5F3060FD3;
 Wed, 26 Feb 2020 12:20:07 -0500 (EST)
Date: Wed, 26 Feb 2020 11:20:06 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: command line interface conventions and best practices
Message-ID: <20200226172006.GO67957@patrickw3-mbp.dhcp.thefacebook.com>
References: <EDBB9002-FDA0-4951-9671-5C01D9C34EE6@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R+Rs1qz93vBJxC1z"
Content-Disposition: inline
In-Reply-To: <EDBB9002-FDA0-4951-9671-5C01D9C34EE6@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--R+Rs1qz93vBJxC1z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 10:56:54AM -0500, Brad Bishop wrote:
> Does anyone have a favorite reference that outlines de-facto command line
> interface conventions and best practices?  Things like e.g. long options
> should have two dashes, options should not have capital letters, etc?
>=20
> thanks!
>=20
> -brad

https://www.gnu.org/software/libc/manual/html_node/Argument-Syntax.html
https://www.gnu.org/prep/standards/html_node/Command_002dLine-Interfaces.ht=
ml
https://www.gnu.org/software/libc/manual/html_node/Getopt.html

I will say one pet peeve of mine is when a multi-word option is
--long_option but I don't see that discussed in any of these.

--=20
Patrick Williams

--R+Rs1qz93vBJxC1z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5WqMQACgkQqwNHzC0A
wRnAVhAAlFlWI3OYQ0ag7RsUxQl/aHlfDQ+2Nekcv5PDrkBX3hNBCLyBhSUGQUoY
3QLhAxyU0FrrRJHB2CRweHQIT23JNG6WgbSyHOoU9pr3v6RwYwBzUN3jcA6tg6j/
g4wIXZWjtAy6ByZayf92smbyA09VyYqWWAlqDkVRMhXFc6TpLzBdp6qOaPEUaY5P
asgcOIjN5a1tVAPhp7UqbQNEv6C7rGB2lA8p71d1dx/60b9KFtjSKg47tDNwrH6U
oq4fWjsAWGcENXLmrJ+Yf4YamGk1Fos86yUN8K+ivFewCiXNvEPLAAnuCi/yzsIx
GZIfQkNDKo2exzz/sEb9zZHcH3eBVdoAdAgEcU1AP/3UedIn8/wMyXfeh6O5FN9e
uGW2bPKVfD9mFqapWxypyFLXl/HVrIzmqdjNxRYuLPfgOWvrmvmtp146VHD/FzN+
a4rAkw2DInWucmDKQbQ2cZtWWhSB3NopS8j8qLdrfK7K39t0sNdTH4ikZR4f9FFw
GuyKWTEgqkues6SdHULzPjsfvmOJxaN96AzMHRa/TmxmSvpPzZKspE9dssB2oB8J
Wc6eEZb3mAqSR3TT+Eq+i8gF0G732Brs3YbbAVdQu2NgtZ59Ppp/2KYvhb4Wiytm
6TPyRDp2UYp+2A2WfND6Ubk25fJ8OIPIWy/gcFeKRTB708tkce4=
=MliP
-----END PGP SIGNATURE-----

--R+Rs1qz93vBJxC1z--
