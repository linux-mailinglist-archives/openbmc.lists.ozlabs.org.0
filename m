Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB67F532F3F
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 18:54:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L70fY5Khqz3blk
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 02:54:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=fua2rLHn;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=H33uNv/G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=fua2rLHn; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=H33uNv/G; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L70f90275z3bfH
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 02:54:08 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 166C45C0405;
 Tue, 24 May 2022 12:54:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 24 May 2022 12:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1653411247; x=1653497647; bh=d9uXTYxaXR
 8K+h2XLFPInkE4DzyTLebkxEK7doI5kUs=; b=fua2rLHnxfFQ0/+54HvdW//54F
 ohecXE2pc1n3EpdUvR/JNKP8ZaMHVreVxbjM6o1Utt2gtEXf/vbsiapaZ/Oz/xRD
 O+lId+BEZTpWSjJC6TQjqLcHdGIlXLEfOP666rzojtP0ZBvH8psQjX8M4Ij72PFQ
 TiSNdgrCfKzPpfRQEBB2+omz73zGP0R6aM2F8YamydUX40oRJHZnJy3linRDlfB8
 jcFs5Rfq3m2jyGjmqTiBCJ3wXloBnDOC3/4V5SjQpsLm3DvetVSsn3/H3pnRlkaQ
 fxgvsygrSXvVWoQqdZnmoyRQnJLFCr2SQJjo16tQ1v76ngzCHvbkFxfF84JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653411247; x=1653497647; bh=d9uXTYxaXR8K+h2XLFPInkE4DzyT
 LebkxEK7doI5kUs=; b=H33uNv/G0bMXoSkcRiaKdXwjxr2mmwJVgRc3MxCCKaXP
 r06Y3/Rf3ICxExHjU6RGfociP7GQBgCO2muYjNUnrz/0i7JUQ7ef5sbjRhKWkBlJ
 YVOtoTCB0ZPsVH3zeFX8sWeCvK0xZaATH/4EZWybLf1saJJogoq3++dOCOc4Aiar
 JjFxd7AzJ28ndJHndV1OQfcAHdN31EpkTPdh56W2mWDA2VPMypalr86KoiH7/fEp
 zBezrHofLQ/Urq7vAh5SA76weDr+ga0oPvJdM+O7cVDGxW3rzixLsZBUlH+tVmsA
 pOUUU0d/YhVVCLWd1l6Ohs78p+3GjvsP51yffXK0Rw==
X-ME-Sender: <xms:rg2NYrJOvN9iYvVw1h0eLzJWACm_8FOIS-9_d83yzMuw8AeWjvypKQ>
 <xme:rg2NYvKJ76Hj7JEMTfV5f7RM7eZadehA55xOjKci_dSdYl-Z54TOXKBwSz1IkZrWu
 8bGbIzdK84MUS_2QnE>
X-ME-Received: <xmr:rg2NYjuAZSe4Nih-6p4OezIlM8R8aWUf-g1irY-DqAFamGlTav3Lx2GmW-DdG92wbmy5ph-ja2iuBYqWcKi_OhBv4dCcyegu1Dc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeefgddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegieevuedufedvgeetleekkefh
 jefgieeilefhtdegvdehkeffkeduvdfhfffhheenucffohhmrghinhepohhpvghnsghmtg
 drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:rg2NYkYHtJzQbxeNTCzPy3zWudK_Oy0rAo7Zc90FThvPU056d6jnXg>
 <xmx:rg2NYibB-xu0RpdZJ0VPmJHsnVbiRkUA7spghBXmuPF-IUuhuwUX4A>
 <xmx:rg2NYoD9p53oXvqX9fuVMYeTSR27jPU3v0j2aOEGIM_Z5e9f8Ry1kQ>
 <xmx:rw2NYiGTQrKUiC0_ApP6305yf4i3MblYDDg5rqL8cxZeTk8WI3z09A>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 May 2022 12:54:06 -0400 (EDT)
Date: Tue, 24 May 2022 11:54:05 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: Re: Updated CCLA for Qualcomm Inovation Center Inc
Message-ID: <Yo0NrXEOm1/cmehS@heinlein.stwcx.org.github.beta.tailscale.net>
References: <9c5a07b1-99a4-3eae-6cea-973d96bb14f1@quicinc.com>
 <228c6f6d-51aa-41c9-bd34-9ce27766761e@www.fastmail.com>
 <f9364e8a-6183-3306-fc28-5874821cd918@quicinc.com>
 <YlciUMACC3Nv3Lht@heinlein.stwcx.org.github.beta.tailscale.net>
 <b8e85f57-3846-7cd6-c1f8-e9e13e7b542c@quicinc.com>
 <YlcyTpAB7j2mLhh5@heinlein.stwcx.org.github.beta.tailscale.net>
 <cb68c4a1-f3da-a3fe-5e56-4646ed083396@quicinc.com>
 <20220414083338.7mfc5ql35kl253fr@ggregory-linuxws>
 <Yo0MKXgiWUP8QCYk@heinlein.stwcx.org.github.beta.tailscale.net>
 <b9c41541-dec9-9b3b-966e-c31070d8d3de@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UyE/bNeorBD0iLnp"
Content-Disposition: inline
In-Reply-To: <b9c41541-dec9-9b3b-966e-c31070d8d3de@quicinc.com>
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
Cc: openbmc@lists.ozlabs.org, Graeme Gregory <quic_ggregory@quicinc.com>,
 quic_mkurapat@quicinc.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--UyE/bNeorBD0iLnp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2022 at 09:52:16AM -0700, Jae Hyun Yoo wrote:

> That is completed by=20
> https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+/52930

Great!  I had forgotten.

I think everything is resolved then for QUIC?

--=20
Patrick Williams

--UyE/bNeorBD0iLnp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmKNDa0ACgkQqwNHzC0A
wRkKuA//ZjZwU4oZ89uQw3CzZ+rZ6QEO++AKMSl/nK/VtKHkAANpnxC7Do2ZN//5
t9rhnPuqTbOPfslvg30l3I+Uze7E36U6Wq4zeqobCXnNMXQN45XOeHiRomzss0uo
VWANgyBObEBs0dG/UxKxl6LREDF3yXy6sgy+Cgq8S2QN+3nKp6uPqKF3lFdqtTIy
ijhtvYI4yspLxGctK30QaSeI/xBykN72zHVOLc49eyN1ddS2/laPMV9dZ/xEESCX
F1OjonpdKORPuzAhyorjvGtTozFF+OnO8pU4rnc4W1G0+ea67OO6mgfLSC5AlxJk
runK2r9Cp1wqwQ3/+7rcM7T3kEfCkWcMH/AYDnBI8LJIdTv1cm9x0F2gcsaohtcv
BoHFK1I2PajmBgL0OjFyudFHD4238zRRj9NFSwR1cWWLEVF7nuzzGafcBCRN6MbQ
VvgIcgsjHY1Mu4gzKBz0GEmT8GssdLP+FHhscUAxKBOPRkEGKodFA2AC5E2pjpeS
YvauG6bfjatm/Owd7Nt7hrThT9FVkMQ85FI3VtJPCwPKU6sEXo2K6LseAGOdbA/R
XLsdy5PHc3UMCjq4k1G98Szzqvu5NYR70iwpmaOtafMHlTC6wczziMsfxNwZsb+Q
r2b1rJUIEYwIfBg7ESQeosoWDabE5wOSzZRm0prJadoENTWvlPs=
=hbfQ
-----END PGP SIGNATURE-----

--UyE/bNeorBD0iLnp--
