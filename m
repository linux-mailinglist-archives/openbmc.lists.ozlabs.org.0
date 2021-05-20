Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1AB389B73
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 04:37:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Flv5h6l2mz301k
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 12:37:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=HnGfrO6i;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=uEP8azzX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=HnGfrO6i; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=uEP8azzX; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Flv5M3ZYJz2yRJ
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 12:36:54 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 634EC5C00F3;
 Wed, 19 May 2021 22:36:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 19 May 2021 22:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=DzTMzmPwW4nF09ojcLiFQgWPOwM
 ADII+pKg+4FRar3k=; b=HnGfrO6i2+YTrJUr5nO1jZul8bx84NW4mCbtqTsOCDQ
 Qyc11Wth8K1PuxO7BOS+nCmHI9qTlzxl9N3erRzJZ1oRwuw/vPQtXswxqwvXH2EZ
 ved3CGOKXYeislRtOjGieVpSeu+zCaX56ppzqEbUF2RyrCWNptjSUtRGbj9j5b7H
 n/E9Cj5rvBcm0EdweizGYJu8ExjkZi+63d6j2gVWSS5uZYTfI85Re4YuKgKPw4oh
 ZFlyQ4VUQkJjGBJtyldXkmQVUHEhlbjj+bFmXl7OTTGlxxcbrg2SVvgmz58REyaz
 EzFgayKL2tcAvm8rsO3rclhPMyeZVmWb84yBJrxeF/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DzTMzm
 PwW4nF09ojcLiFQgWPOwMADII+pKg+4FRar3k=; b=uEP8azzX14Y78L1li6/M3T
 foVAlV4L+F1DOkv9xNUOQ9yN6/hMDbV8cpP32oNXdlDNoSMRNcf4OLUR9UpbNSxQ
 Ga2VpvLgGhVvVZ0IfBWCbFOZycIO8DGN00PibwH08tr8GNhykqh6f/ebqWplKJt7
 1yzOQtcx/0bfbF3+ZjYFqYN/u3lrODHfgCZ6xnoBHXpdvP6DL8toUAz/q76XAYpZ
 /8HI8OGOQVOzek3magz8SghNLykjdiGupPRC7uZ4e33bB/3qrauIP+As/2z5nouY
 KS8zPRX3zxIfgm4BCQZ2KWzf+Djv5MkYQj3G5+UPBuH9n2xygpvzVOUoCeNQSiZA
 ==
X-ME-Sender: <xms:Q8ulYNR2zufhN1_sDuG4cHTEcY8u08lyLIzUqY888fFiydRu0nfQog>
 <xme:Q8ulYGwsEd3UXSo7c66-HBDEtXpFJ433PL4mZw08H19L2xpAiGpctHLz3pGZEDWj2
 EPJ_R6EVs24i58HwjM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejtddgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:Q8ulYC1KKSFsCuegOGYg667g0l011hLtwAGeDrqsYSCrTWIr6BNyeg>
 <xmx:Q8ulYFBvmOOKX7TUTTTp8_xA4q4KhvYN6UFqJoJijj_Q-Imw9dZKJw>
 <xmx:Q8ulYGgJ7RWlgYCmQ4zaq3h1_Tsw_IXRoC-MoEu_s5kh43929j05KQ>
 <xmx:RMulYMcALhnZKtRqbIPNC3ynf1VffVsoS8SUqEHMxMjwE-rRfkE0DA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Wed, 19 May 2021 22:36:51 -0400 (EDT)
Date: Wed, 19 May 2021 21:36:46 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: CS20 CTCchien <CTCCHIEN@nuvoton.com>
Subject: Re: phosphor-host-ipmid will crash on aarch64
Message-ID: <YKXLPghzZKn+GV7r@heinlein>
References: <HK0PR03MB3954243C26C79A3E8586CFFCDF2D9@HK0PR03MB3954.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="esvk+VB4uvYZzkxA"
Content-Disposition: inline
In-Reply-To: <HK0PR03MB3954243C26C79A3E8586CFFCDF2D9@HK0PR03MB3954.apcprd03.prod.outlook.com>
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


--esvk+VB4uvYZzkxA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 03:21:14AM +0000, CS20 CTCchien wrote:
> Hi Rthomaiy,  Vmauery,  Pstrinkle, Jayaprakashmutyala,
>=20
> When I build phosphor-host-ipmid for aarch64 platform, size_t will be 8 b=
ytes, but in aarch32 sizte_t will be 4 bytes, so ipmid will crash at https:=
//github.com/openbmc/phosphor-host-ipmid/blob/master/user_channel/passwd_mg=
r.cpp#L323, due to the data size of hashsize and ivsize and padsize and mac=
size is 4 bytes in /etc/ipmi_pass, but ipmid will read those data as 8 byte=
s.

Why does the data end up being only 4 bytes in the file?  As best I can
tell line 538 is where the data is written and it also uses
sizeof(MetaPassStruct) to determine the amount to write.

> /*
> * Meta data struct for encrypted password file
> */
> struct MetaPassStruct
> {
>     char signature[10];
>     unsigned char reseved[2];
>     size_t hashSize;
>     size_t ivSize;
>     size_t dataSize;
>     size_t padSize;
>     size_t macSize;
> };
>=20
> If I replace size_t in this structure with unsigned int, then ipmid will =
not crash at this point.

We generally want to use 'size_t' for things which are sizes.  The code
here is a little dangerous in that it is doing a raw cast to/from the
in-memory structure rather than doing a real serialization.

I'm not really seeing where the code is inconsistent with itself though
that would contribut to a crash.

> But those fields in this structure are also used to store the return valu=
e from other functions, like EVP_MD_block_size(),
> And the return type is also size_t.
>=20
--=20
Patrick Williams

--esvk+VB4uvYZzkxA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmClyz0ACgkQqwNHzC0A
wRkJcxAAiqwWteDHHw5qfor9+M6bPFuFJN7i53Lfc7cOUKiFrbcnF4f4/KoVbTi4
HiXa30/VHlL86yhPzhkESU7Y9td+0UQElB3Sjl1VEc6SES1+7Lo58xrLob7qT5mt
yNlWhRM1jL89Lhji7IGhjiP2rX2fRRKn7a906UbHRIKjjcF8dQpzyyDvnkU1IO4x
bE8o+oWqfiINhqa5uoxQi0XARWk9Vz9CdGIkOwDc2rSW8meBFV1eQl9DWV6pAT18
PE9xEqzwacrSb7yaL+3h0rKfduz98T4lZwaQr6RnH9GU4QDkoA+7LG1zhpTTeTPd
bAsJ7Z6bCGubxFKsWdTPxBmBxO+KJ2/Zp5PheNZ9IxUcA1sAJ0JlRiOO9gbjONFo
9NS5rVjeEKQEjCWN4zldWEehx7FPo4ai8xY7QannXqH10jjRuMxh5dHfCAMBj8T0
WvhQOqFXxvDyw7RoAonaACXnQxUBoQc6HrdznhoysrKfYzQEBZGl7Gu1fuKG5+BC
FdWwCRQxRst6igwmoqw4krxqzXrlHCHwmETge4tc5fT1PTJEpV1s1gAw+zxPZB6y
M3DlTZ1EHrZdD+Q6QgrvlG7HHwnZMsSNWvHASD+0BeSuQsiH2IgYuapL20VQzL7/
AgPyvcVU60ETzMplnSv25XheZ7KNqJmgUFpjW5ajw2F+fAFLjMg=
=oWCX
-----END PGP SIGNATURE-----

--esvk+VB4uvYZzkxA--
