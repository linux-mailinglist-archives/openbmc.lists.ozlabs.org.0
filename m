Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21619392E72
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 14:56:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrSWV1RFhz302y
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 22:56:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=eczt+PZg;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=GBKxQz9Q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=eczt+PZg; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=GBKxQz9Q; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrSWC5F1gz2yYn
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 22:56:39 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B9575C00C3;
 Thu, 27 May 2021 08:56:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 27 May 2021 08:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=mJ95/qzR7GQhbaiidVZvpFnBzTW
 zr+YDgRgCdZFiIW0=; b=eczt+PZgafxJfoTocs8ms23URAhnYVcuTwRaF9J9cbm
 onuB1f9Dnn0NIv/7dBriQFJedzuZIJcUxIm2sy3Ey1XTYjfj3j4T29rLJ8iBpc+9
 gms3owBNmjhzTAC70H/TXLi6ZwyQCnh7hkxeimjEOdgHofqpcPRohvkGYrKXmfrb
 DcgOVxTLYCUbn/fiI3SluFmxRtRIx0cX0XDmJRYma57LsrLHMreBFkPXvEdKd10X
 uFKFQYNwLXzrNFpGOhQ3QIpGblVeyUP9/WBMT2GFh/PS06NaW7oG5vR9EqWF6SlS
 XQVVO9U6JNvKvoTeM238sSL71wu3Z+fZsHzPZWUP1ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mJ95/q
 zR7GQhbaiidVZvpFnBzTWzr+YDgRgCdZFiIW0=; b=GBKxQz9QPZFD+qNVaJ4veX
 By5sumlVhmLIBXrFXj0NTURcjLcKzsjjKKtbQs0Q+r1mBnruFxiC6hRWNy/QLGbi
 4OkUATZgGr9HsZz/Eew/EJ6DoxMUMGNuxWnwGpibxQGYMVjiybrDk0psyhybBiBP
 2CLCX9u1z8IH0fjDc+vg97wMXaZeCbVfDv2PDQUFvP/gQmrn/P8+glfKPeMTEIvU
 k7Bi6DNJtplWEZaLfMXYk58BZVjl7vfPLsltD51v5V1LxOn8yOwlU2XpVSMgHvIk
 tH4A5EWwevotKGgGAxK+t8frLiEHwmVZI0r/O2gAJr9AIi5q/AjRig2lfpsogFtA
 ==
X-ME-Sender: <xms:BZevYDEtmVLi0bLAUQsW8BeCz0riBmMMoPj1Q1n8ys2sfWCwySEBmA>
 <xme:BZevYAVg9DjHUBi_hofjQAFiRSnEBBxR5BnxeNYBGN7xY828Bvov8Giz5C9sOWLCe
 oLFH5CyDo9Bdhd6GJo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekhedgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepkeduuedtfeeihfehfeehfedvjeeu
 jeeikedtteehledvhfelheekgedvieevkefhnecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:BZevYFK4TaA_k_0F0tbxkf0bG3JXRBQQw4tWoZFWUycDG6tZA_3sFQ>
 <xmx:BZevYBGTLGEGBCZTKRjbu7ZhafPaW0QvSPsH_vw8j4S1seW99aiyQA>
 <xmx:BZevYJWoC_qQ82tRZqMrzrLH1UmRWHjG9t1vQkDJaocBk-QASQHYNg>
 <xmx:BZevYICuoIpyK3oYtO0nDsvruyy2TNfpGWpXgy-0zSYM63YwDCGK2A>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 27 May 2021 08:56:36 -0400 (EDT)
Date: Thu, 27 May 2021 07:56:35 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group - Wednesday May 26 - results
Message-ID: <YK+XA0umnkj1EveY@heinlein>
References: <8b3c88c2-cc9f-3ebe-2e4d-61974ae27519@linux.ibm.com>
 <30dde28a-38ff-6c59-57f4-23ed3fb46130@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tMyqmagU8BQWdKlm"
Content-Disposition: inline
In-Reply-To: <30dde28a-38ff-6c59-57f4-23ed3fb46130@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--tMyqmagU8BQWdKlm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 01:59:57PM -0500, Joseph Reynolds wrote:
> On 5/26/21 8:43 AM, Joseph Reynolds wrote:
=20
> > 1. Followup from last meeting re uboot, kexec, sysrq-trigger on ARM=20
> > architecture.
> We re-hashed the discussion, added new information, and added new concern=
s.

Could you paste the minutes here when you reply to these?  It is kind of
hard to have any discussion with the rest of the community when you have
2-3 levels of indirection to get at the words.

> We think there are cultural differences between Linux and open source
> with respect to how we handle security items (but we didn't get into any
> details).

It is really hard to know what this is referring to or means or how it
might impact us.  There is no such thing as "open source" as something
different and separate from "Linux".  Certainly many sub-communities
within the OSS world have different priorities and approaches when it
comes to security.  This sounds like it was just idle chatter.

> Kernel's modules expect BMC hardware to be in a particular state. Kernel
> kexec=E2=80=99ing might lead to undefined behavior for such modules.

I think we're just talking about normal bugs here.  Those would be
caught and fixed in testing, wouldn't they?

> Worried about interactions with secure boot.
> Scenario: kernel 1 boots, then the BMC gets compromised, then kernel 2
> is kexec=E2=80=99d.

What is the "worry" here?  This isn't an unsolved problem as servers
have to deal with this all the time.

This is why secureboot itself isn't really all that useful without
attestation.  There are going to be compromised images.  You put them in
a block list.  When you kexec, since you haven't gone through a reset,
the TPM still contains the measurements from the compromised / blocked
image (which have now been extende with the kexec measurements as well).
So any system running code that is in your block list is still blocked
because you can't trust that it wasn't compromised.

> Kexec does not significantly improve the boot time of BMC.

And?  Was someone suggesting it would?  Not sure the context.

It seems like whoever is involved in these discussions is missing the
purpose of enabling kexec.  I don't think anyone is talking about using
kexec as a way to make some minor improvement in a once-in-a-while
OpenBMC upgrade + reboot path.

Kexec is being talked about because it is *the way you get kernel debug*
now.  Kdump requires kexec.  When the kernel crashes, you kexec to the
kdump kernel, it garthers a bunch of data, hopefully stores it in flash,
and then you can do a proper reboot back to your buggy-crashing kernel.

--=20
Patrick Williams

--tMyqmagU8BQWdKlm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCvlwEACgkQqwNHzC0A
wRlnsg//Wv9dJc7KmJNFCpi/EEr1IcI+qhWYoN9ebQ07b3ujpVk0NQerQJVLtl5V
d99BaJyeWbvBTqMiGHOewTC3zn2wXK/YziCpunujiuQogR9EZ5iSE0FZ+l7i+8bJ
Z3RN7YCvS1U7ci4MzIRrIHfhF946ONQOM/e1LcTvTtoznFGgIheKrVkSiHOV+7B8
u1LIpdH7SIGYlurNQpKeDRNnlF8nLE7ZC0/q0REjB98igiaUTAw0eqZm+0CnvRPD
BnBeEJ5xo9p5fjfmPzEZNLlxYeoK1f3zBU7DWL0TaJSjjaEWT3/qqtlQoBfSJlie
jlZovj+C4rKxVQo0ZEM+Qz+SqS7tnZy+lZ2M3K+Fk2PJsFEJoH5QWjWdhj+Bte7i
ZE15iXz5IWTDkX96OwAgTLFFDiF74c2NcWSxLKUCMfjl+q61ntD/hizt2bdjNSnI
x2n18IfCJguVESU4Uha3x9sE9065XxKX4vEsEouist2vTRFUwRdZ457CInJ7T/jp
tP78T3ljNd79x/oV/JxZMkFr4/0w79HMQ7F5jZi17h49I/5P1+y4xYncOt4SDrsY
mOeMH02yNEgFEGqp3l8p9nO+EM3PfkGvyExwMK1dZkTkDPY0XR9Ao9mG0qLgaQhX
TYznfrMcxBWvRDsa59qGCxb1LSsWdmQopcQ3BvHRh6CRpBnxv3Q=
=3ysq
-----END PGP SIGNATURE-----

--tMyqmagU8BQWdKlm--
