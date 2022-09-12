Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 899045B632A
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 23:57:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRL6Q6N3nz3bZg
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 07:57:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ogerpBNW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MZkZavsl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ogerpBNW;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MZkZavsl;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRL5w70vmz3035
	for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2022 07:56:35 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 330C55C00D3;
	Mon, 12 Sep 2022 17:56:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 12 Sep 2022 17:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663019792; x=1663106192; bh=Jh9wb0MLfM
	4CrkFOTZ10M6tCOQ4H6N1nW8tgjalWGzs=; b=ogerpBNWPRLOvls+dtIasN5mn/
	tigj+lCY5xaR5GB27k5XhMOHiESh8f0WRgUMFjYPUblGF+fS+277etKgHF6stK11
	LkfBCxA/OxxVB59RLNYisg6S7X6U6ogTRsJWODA435f1+UDHCyvwX9U2+jRav4Sa
	v6hpCSxDNP5+IHaJ9TzUhqz2UPPtYLzhvX5u3buKmVSEYFBMi9HXlOL0RGMlZPb0
	IOFvIjzTReL2PGbv+U/XNdortRSq59ZPxTmgkVzDej5qvymnqDFakKZnBHMEiaoU
	x6WawTlkARkVmwH71s5DPUFEqZGW9H3P2xa38Ped9OBfse+azMDspa1Fiu0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663019792; x=1663106192; bh=Jh9wb0MLfM4CrkFOTZ10M6tCOQ4H
	6N1nW8tgjalWGzs=; b=MZkZavslHC32OMHBeS/wj8tGCSKH7TSe+qXg7L9o53fq
	Vhlv4Q4Tq7yFaRVVB7aJzKEy1eeUSLRIsj9mz5zxsU43gJFoGEOFkpv+CUYV/Jjs
	K2y696Gg4ruydSqVFEWwNU+SW+oZ6TL0qMYssrRvA2FTfVvxaGr+Hwpx0sfNS5ns
	HTXgr9TG77qIFhH8f0EzmFKYZISMe7KfrnBZehwwY+dS36ZW58fiIWvCbhfXugpX
	w3I4fITPSZLRyBkAj5bxYlPzlmYmxByGSL/SO2DtpesSEGX50BjsVoQjzkyQvXcN
	ik2tjhLf5dePrrrpejrjMHzmgL6xSKnlDzDtVkzDRg==
X-ME-Sender: <xms:EKsfY7Tsa-N_vDsN6Bf311cE1HKB5fCUzZ4MSgL3DgbqQ_KHUa2M_g>
    <xme:EKsfY8ycg2FB6y-htAUI-QozPKhmUc9rONFHECznGA1OlV4W5iNN3KGfn5TH0FMvh
    6_4QIOhUeGKer5RnYA>
X-ME-Received: <xmr:EKsfYw1jWS8J6auWTW08Bzv9JeW2Xk1-2J3RqPKLAOE5xYeLypUg2xxE8Y13JVD8BYmAP0pjlS03-UQ1M__J7upJRPrHQtcE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedufedgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:EKsfY7BG7FIso-wHof5UBdzfJIBeCcxUR9GtliBD2bi5itP_7Kv1nw>
    <xmx:EKsfY0j9n5zbq4Bgqx1TUoEpxXQsQRUJtLfN83kwy1t_y_pkuL7XZA>
    <xmx:EKsfY_oj9NyzPRf0YEla8Qtk1oACDzqYJ3Z4_WOlJ71oTsaD2RK_9w>
    <xmx:EKsfY8L0OCtGpZsMaZoxw5-iTy0KDC4sSOtFzAnLHbk48x_og-Y8kQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Sep 2022 17:56:31 -0400 (EDT)
Date: Mon, 12 Sep 2022 16:56:30 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <edtanous@google.com>
Subject: Re: OpenBMC Boot time improvements
Message-ID: <Yx+rDhB4v8qDkGrU@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAH2-KxCPOjWm8KeLFJTa7ZdTD-yZ5Bit_Ua3Hb=0X+O+89t3+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="asXlejcXOxsWkU+I"
Content-Disposition: inline
In-Reply-To: <CAH2-KxCPOjWm8KeLFJTa7ZdTD-yZ5Bit_Ua3Hb=0X+O+89t3+w@mail.gmail.com>
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


--asXlejcXOxsWkU+I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 12, 2022 at 01:32:19PM -0700, Ed Tanous wrote:

> Decompressing the dtb, initramfs, and kernel images is seconds 5-14.  If
> there's a way to optimize that better that u-bmc has implemented ahead of
> us, that seems like an area for improvement that we could pull in.

I switched some systems to use zstd instead of xz.  I'm not sure if that
was done as a default or not, but it is significantly faster for
decompression.

> Kernel starts at ~20 seconds, then 3.5 seconds of dead air... not sure
> what's going on there.

This is probably the kernel self-decompression.

--=20
Patrick Williams

--asXlejcXOxsWkU+I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmMfqwwACgkQqwNHzC0A
wRkEFw/+KL5WgIjmxYbD+TgZLEN8zWMYCOWEs7xOdwVKsh3+0iewa8fQZ6xaaIsE
RBeZfkq6n6qukfwz1mQA0COvuzCMJVbzEt4SvLhzHHgd2MEAOjAhlxSSoGU3N5An
6rEXIkWE1sf0Yc6OUEmIHNbLfkslWtZzLIa+xRvRfKVMs7Glcb7zj/h6ZUZbry24
5I2elUhFja4ClmeVdxnNVXq0f4p0A+/teRZbAUgLFoiB3Tp9Dxu6MF+tMcnOBX+H
Gy32wBW+0pbTrAqOSpHhhKxKUn9gGB/h9CFc+TKj4+nJhEHAThauiN4u1mJs2Gcf
3zPlieH5VO75+HzoC7LTeh2x6oG6ess5S5Tv64C2/LpYhW8N9oyGGkQIEU7s/P5m
dQZoNWGsSs3yWlPT2rQ+n3630qqYDTmyKckv2qcsNmIGUJScBImcO7dy831zliaf
frtox9nqo48xMTPtEHYijsHzZHW4C7Nt4fahU/8uulSxWoZ/2zPId41ssu+b7Km+
FDIGpDTJinLrMZU39GfQIklX5ttzMgiZV1MQspPtE5FGMLBMXJGOhXLXeBwf1EWH
jgczLJl9uGh3JqDKCXp+4KylUctT6l8BeqCgUsGWjp/eS0nbDgzhaflfvZ6DifLg
4tgGAN/cFnXJcjCBf3gjlFY4IJcQHgAyQSmF1FC+aWzerQDx2ps=
=A4Qn
-----END PGP SIGNATURE-----

--asXlejcXOxsWkU+I--
