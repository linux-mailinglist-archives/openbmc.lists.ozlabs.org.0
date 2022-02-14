Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 501254B5E09
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 00:05:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyKYm3hw5z3bbQ
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 10:05:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=fV0Xdy20;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=K3JR2sId;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=fV0Xdy20; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=K3JR2sId; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyKVP27DJz3cHN
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 10:02:04 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7B3C55C027C
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 18:02:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 14 Feb 2022 18:02:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=k1htBV27WJ406S5iFWhSOqW/tuXlhc6qCDD4HI
 yjbNo=; b=fV0Xdy202ZhPqzVKblMcsX+kZgIyxC8kbVchu7gSMijGx6wS5HD89r
 uW9qIKdKKZgluEVxRaNZzIrT9ylfHsrEAiU4pGatll3avLRLaqD3KwCnr61sD+dS
 49J+ayOkJvVAM7VrB7iaZrAn9C6Cw1Qa8RLKC3TCa0AwN9xBI7yH1Kag6HIMqHMx
 ClE57VmLym3KE3aMcOkGAVsX5gx6JViRLPHh04pxUw1pnMgbieZDqdqxDN1vaOmx
 RO+I+otVbAKW7HhEtU1TmEaTgIfVBoxoN+lTllrcnBe3DDwHBOF3+ORZyF5bhWil
 bsPhUhUnvPwKtjflO2e3QRGrBshQn2QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=k1htBV27WJ406S5iF
 WhSOqW/tuXlhc6qCDD4HIyjbNo=; b=K3JR2sId34jrfA9jb4L+5vh9Qs7WajiLI
 OO8Xui3GamYUzWsCYS8fu05/q6IJTVn1+rDbHmtIgiee7K4aIZ0ObnmrmtcXoge8
 idZWIG6DIcfaZ+wFzn7+GjDG3hpNaKpUX6f43TX+EVsgKsV3r2DTE+dRJI4T0LoB
 ilJYkmwIA/k/wtLnpEWqqa3EnQQLwvrQea0n+JgdaO10FbPLSZ5BjQ0Pd9Zp5jbX
 xyP5xBJYHEXwXzIkGBYFNfo5NkZBe//Yp96J7qjnczxpBvVW0PS0OTmMWeTnGWDH
 fcREvKgcvPEOPHO0+rX3LHdSrYzkXsUZXE9096MpaIVGmZBwlumYw==
X-ME-Sender: <xms:ad8KYuxUjIrMeNNxBiIOAn_ZiCyTNNUC92mgt6hJwd3gmxJSiVty-Q>
 <xme:ad8KYqRMkku6Vf2Dry1QWV64Lz-53v9fNTSPH0vYg0Ba65p5g9sE2aEuFKxSKhYpf
 Ch-LpKR3ize9GmbTyc>
X-ME-Received: <xmr:ad8KYgVStnS9-wA1h0pCOJt8t4zyWtNIRinhsMBOPEveuy5a7h6ccvPwX4L04oz5AkkKD1VF9uCuvuncgVYjhdUVJ9XKykP8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeefgddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeeludejuddtveektdfhffejhedtvdei
 uedtvedvffdugeegjeeiieevudekheehvdenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmpdhmvghmsggvrhhshhhiphdqrghnugdqvhhothhinhhgrdhmugdpkhgvrhhnvghlrdho
 rhhgpdgtohhnthhrrggtthdrmhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:ad8KYkjW0LZR5l52X82eRJ0HL6q-HlNeWRlViwZ7ImK7i-ZPGzyU8g>
 <xmx:ad8KYgCxE648oi-oDtlt87XxkcnAuhnkkgBeH3ePQ_v45laHGeN3zg>
 <xmx:ad8KYlL5Tnxb7Pjr9k_iV5vGzGx5XezrVGHFAwGNZXI9doIAnZsRGQ>
 <xmx:ad8KYv_v7frHYU0gSQicZgMaIYZxyGwBr6ht1xDI8JtgZVI3HBjgkg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 18:02:00 -0500 (EST)
Date: Mon, 14 Feb 2022 17:01:59 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: Upcoming TOF elections
Message-ID: <YgrfZx6QzsuKr4ar@heinlein>
References: <YdiCUiwh1iD4ycr8@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nbFX/6ervw2LCop/"
Content-Disposition: inline
In-Reply-To: <YdiCUiwh1iD4ycr8@heinlein>
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


--nbFX/6ervw2LCop/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello OpenBMC Community members,

Per [1], the TOF was expected to take additional action regarding the upcom=
ing
elections by Feb 15th:

    Feb 15th - Current TOF must publish a final list of eligible voting mem=
bers
               and upcoming candidates for TOF seats.

TL;DR: The following 4 individuals were nominated for TOF terms and since t=
here
       were exactly 4 seats open there is no need for a formal election:

          - Andrew Jeffery
          - Jason Bills
          - Patrick Williams
          - William Kennington

----

The TOF voted on the following 4 motions today:

  a. Set "Highly-Productive" score to 100pts for 2021H2. **passed**

  b. Accept [2] as final voting membership for 2022H1 elections.  **passed**

  c. Accept the 4 on-time TOF nominations:  **passed**
        - Andrew Jeffery
        - Jason Bills
        - Patrick Williams
        - William Kennington

  d. Accept the late TOF nomination[3].  **failed**

All motions passed with unanimous support except for (d).  (d) received mul=
tiple
dissenting votes and therefore did not pass per the TOF process[4].

In light of this, the 4 individuals with accepted nominations from motion (=
c)
are considered to have run unopposed for the 4 open TOF seats and an electi=
on is
unnecessary.  Their terms will begin April 1st, 2022.

Thank you to Andrew, Jason and William for joining the TOF.  Much thanks al=
so
to the TOF members rolling off (Deepak, Lei Yu, and Richard) for volunteeri=
ng
to help get the TOF going and for your contributions in its establishment o=
ver
the last year.

1. https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.md
2. https://github.com/openbmc/tof-election/blob/a4f3dd64a0e19be3e88a0316f6b=
af7db76d91f07/2022H1/rollcall.json
3. https://lore.kernel.org/openbmc/MWHPR11MB0046A46CE1A96951234EAC65F12C9@M=
WHPR11MB0046.namprd11.prod.outlook.com/
4. https://github.com/openbmc/docs/blob/master/tof/contract.md#meetings

--=20
Patrick Williams

--nbFX/6ervw2LCop/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIK32UACgkQqwNHzC0A
wRm+hw/+PhUAVjSzzNKAoJC7Jv3fvso0R5yy0cw6SmUnqjMsrQr7jzDkASNO2L7F
sjZuHaq/OVm0+XYBgDIUbmDNeUtQlHn2lTWC+nF9DmXk5AGZmhL/jCzM6AUbVFQf
N5f/UXvjhCRmUXtKI39j25Y2haT7t7ODXMaO1oHW2v11seFgNX/Bn86C9VDamMhA
SODC09mPfzF0syVMSVcOWSNlL6EydBmygfwQ1jL9UFQGeLwdKEP3U0BYANueKV3v
i5MQJ97+GIXnX5jXe+R33cf4R6MBlh6VkLFF6dzUE8Js73+ZBqIiLtEAQrkl4ysH
cQunrQRjn+rMfFsUDtPSIe7B3+c802zsWfqXfhKyeQtvNzYOo2JSz9pdLC578s1M
ELBsBB8mDrtWZ52qeYRNboGZLndqob57ys2tzWvD2u2Gpm3tZo1qOqp4OigWLtm8
BIWjPhFZFZS6ahARtPMuZFLuBxW63zORI4KF2Pf2RmoNTtIstweHsLh1F2PfO7fL
pqGMDPq1FwTuDV80Y0ICBIXruDMFQUJGjhsEQpMA8dXLKcUF+xF6xKGggTaWmLZu
9fNuEUiWJgvKItzt/pBOO1sKMnpGpubnJUL00Z2chX9weELKLzjd7Ok5VMLle3V2
Sm8uzx9OQZ6WgVzNMU1rU41iMihwMfWVyalX1bbCmHnQTUkIluM=
=dbVi
-----END PGP SIGNATURE-----

--nbFX/6ervw2LCop/--
