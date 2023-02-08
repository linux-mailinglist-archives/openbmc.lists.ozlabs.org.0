Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2618E68F020
	for <lists+openbmc@lfdr.de>; Wed,  8 Feb 2023 14:47:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBhC74rL0z3cdZ
	for <lists+openbmc@lfdr.de>; Thu,  9 Feb 2023 00:47:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=d1mSJ1FG;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=aWEqPO3e;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=d1mSJ1FG;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=aWEqPO3e;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBhBY2mxtz3bZj
	for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2023 00:47:17 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 637125C02A9;
	Wed,  8 Feb 2023 08:47:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 08 Feb 2023 08:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1675864035; x=1675950435; bh=k/TQ56AkxV
	9+xej21+zasyNryLNlYHYPeBpnLjPeO4I=; b=d1mSJ1FGGFp53QfZc1Fxqqsmeo
	Gwa4nnPLG4Q2vwVDO1W5MZ/LtA396ftg07lZI49PPU7bDc4D8Zo8YawA93zQnnpQ
	3/OchenKL+NvI7aEH1zULid66SgRrtDi8CUntJjPXgqvC0LuFAAfwrv2TPiWuiJs
	jDlsiM1pBLmdriCYrCr6+cX3yYdHl6Qis/XkU1EbJFNOvwxwa4FLj9Pf1CgvUcuH
	qAm69zwfRL6NQ2w36mfRMTGDZzfVFTgaevh+UScdAxhZlpSleQ1b9UmRxWqUOXsj
	4j8Q5M554HcVLBLZQZw2cmHuWcLhgFrbnOawC3dNGpSnVMnG7rtTOWqn9yXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1675864035; x=1675950435; bh=k/TQ56AkxV9+xej21+zasyNryLNl
	YHYPeBpnLjPeO4I=; b=aWEqPO3eGXy0bPDQpC8zBfFdKVB7t3f7CiJqMUCS+v24
	AEvvflxsQzAJ+rcOgP6iM59vco6XpYl9q+Da3K/VnAXFsdRtpICmFlXAbrB4kzbg
	cpSB3VvovZDY699Owc1OTm0fg9k9CD6pBii3grnJ7iskqNzlmP1Ht+Ovnc6Tm/nj
	NPmP3nRy2gYoYSdIVlUiuijGDTyvCXrCY0u6FouCRXu+eehtUK1jV8BQbUErIYeI
	d3D8ySRN9jfrCuO2ZmiXujEg9qAAIzOX57kK/IbWxWfhXad+l79D8lLGSDS95dMc
	Nce6hsjUrebrjyy4Osbk0wxVO5efEo0QaIB5E+Wvbg==
X-ME-Sender: <xms:46fjYw-hyObtb5PT59v_vWbth_YBkeHuguDexIfoH1ZmE0ZQY92qvA>
    <xme:46fjY4sp6kfXyNBUD9C5SD077W_YyYeZcTdMC1Pz2Hc17aZ-xjR-RpqnWqGBkkxr6
    MYGjJWiFGNqEF-92aE>
X-ME-Received: <xmr:46fjY2Dqis1RIGQ9EHz1p6VIG5Xnf9TnDejGmbr_asKwtAHM_yMkwOEEk8br35VSMNJ5EP-bvjQZzjOQqiwAJOYR6jPKWoT2pV8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehtddgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeejjeetleehleeijedutddufffh
    ueeufefhfeelheevgedviefgffehudelheelhfenucffohhmrghinhepghhithhhuhgsrd
    gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:46fjYwd3G-hOP52E1QRMt0hHg154ofefuHIjHRzdh9Iet10Y1g7Szw>
    <xmx:46fjY1O8WYkTV0QGW7_cWtlPctmX0BalskFdv97G7xhAOMe7oEGytw>
    <xmx:46fjY6ld0jHg5ThEA67unloTy7oUAY000q0-eDT-g5FjTxvif7RiHg>
    <xmx:46fjY3Xzpm4Xjy-t0rtitOoWRHz7WnOTN6hO8FOjbXU6Uie9Zlj6WQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Feb 2023 08:47:14 -0500 (EST)
Date: Wed, 8 Feb 2023 07:47:14 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: John Broadbent <jebr@google.com>
Subject: Re: request for a repository
Message-ID: <Y+On4s73Ih1aPeHu@heinlein.taila677.ts.net>
References: <CAPw1Ef9GhcYJXdBs6pGPi5rjxs0+HE2ROV6HT1SVMEmknvVH=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+WXtW7jnsCH6cEIW"
Content-Disposition: inline
In-Reply-To: <CAPw1Ef9GhcYJXdBs6pGPi5rjxs0+HE2ROV6HT1SVMEmknvVH=A@mail.gmail.com>
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


--+WXtW7jnsCH6cEIW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 07, 2023 at 05:53:03PM -0800, John Broadbent wrote:
> We would like a new repository where we can share our upstream daemon that
> interfaces with our Root of Trust (rot). Ideally having a repository on
> openbmc would be a nice place to keep our source of truth for this daemon.

Generally the process is to open an issue to the TOF[1] to request new
repositories, but it is fine to also post here to bring awareness.

I don't think there is a lot of appetite for "we have a bunch of
existing code we'd like to dump on a community" in open source
generally or here specifically.  We've stated over and over that the
best approach is to be developing this stuff in the open with
opportunity for others to weigh in on the design.

I have a few questions on this specifically which speak to the value of
this code from the community's perspective:

    a) Is this ROT available for anyone else to purchase or is this your
       custom hardware?

    b) Does the ROT speak a standard management protocol, like SPDM, or
       is the interaction with the ROT entirely custom?

    c) Are you willing to accept contributions from others to expand
       support for other ROTs?

    d) Are you proposing dbus interfaces that can be generally
       applicable to all ROTs or is the interaction exclusive to your
       hardware?  Are you willing to accept feedback if what you've
       already come up with is _not_ generally applicable and make
       appropriate modifications?

    e) Are you working with any external standards bodies, such as
       DMTF-Redfish, to standardize remote management of ROTs (and
       implementing said work in this daemon)?

Unless the answer to a majority of these questions are yes, I'd like to
better understand what you see as the value to others in having the
community help maintain this code is.

1. https://github.com/openbmc/technical-oversight-forum/issues

Nit: "...share our upstream daemon" -- I think you mean downstream.

--=20
Patrick Williams

--+WXtW7jnsCH6cEIW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmPjp+AACgkQqwNHzC0A
wRksVQ//b5v0x63Q6P/Y5A1FMRa/qRYQ2bapKtUL42qVzuU/DWE3XXPky5WIsu2S
Plq5P/EO14gs3Jf2i3zOj46D0mbCC98y+Zscd4ETDcB6pwdbsRtaTdV6YqaXiMGh
N50ndBI9WFZVMjKE7SnTrgbZQqRohTMoM4yD3y+gePycJb/UL3O3mQet5ZQkc6br
9gRvB8l7kr6RLxr0gtZkN9RKMwsbMPOjEfTGx6k0+voIgPX9kF+sGnBYxXMvFd90
dsjFxTtXen0yLycDNahvLPRmuc3SZnLA7wjy3seZp4xPoOlhdvpAAvU/NkbR8Tx/
1QoRCIki6B/HAnnxdo4Bp3lbQuWBQUuza3xuR9bRrc50QqqSvxbWbQvHGBX+OS1C
EY2O9McbAMdWNUriBYRfE+Zo/NkbXcE2IS+QUOB41wIeunucs/Kt5k8n/4y3Cq/B
UXY3aKrkUfI0A2MdeJy/kLdYRQHIcwoYc8s1AB7JKha50PJ23EDfgfbSSpa4VTZF
6sguC8S59dz1QVeBB52gwIJIj/1lfW0VQptI0yZasxOuG+HfLy/RY6VmRhNOsqJS
9XD26/EL/kUa9I+R2gEi7pXZTivChuZ+Wdjvcmmbr38IU6BWvQXXhbETSETjHX45
rql3fMqGDFKEMp6sRM1haMMB3csPFKqsHx2ThcFGC5prEHBQeR8=
=/3Ej
-----END PGP SIGNATURE-----

--+WXtW7jnsCH6cEIW--
