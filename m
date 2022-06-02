Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1AB53B7A4
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 13:12:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDNf82whDz3blm
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 21:12:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=hrMY36s9;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=NrMKOMu2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=hrMY36s9;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=NrMKOMu2;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDNdd0Knyz3bkY
	for <openbmc@lists.ozlabs.org>; Thu,  2 Jun 2022 21:12:19 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id DD2F2320092A;
	Thu,  2 Jun 2022 07:12:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 02 Jun 2022 07:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1654168333; x=1654254733; bh=dDHY8Uc64r
	Xba+8CvtEuhVli0G1FCDqOgYSR+W0nkJw=; b=hrMY36s9ijwUwTkn2DgYgkzxti
	6pPXJUfhYlKFO9vNT39/KdRmqhtDgLmOQkkmFNsRa9qj3QroeEAougon9/gRmnbF
	JwY6AfvFmGUBr4lcN0ksLrMI6No7YDSjmRm6m48+nizH2eUuwJkIL/6rMdheRKUQ
	FbAExL8KrTQchsTGCwQ9pwVFqvU+TaXFwF/SIA6weEcOYrgwv/rnwJW4qnAuSBK4
	zPIqIhcZy+x9WZJ3UFIrE8EW5AG1syyZ3xjNo7SHmm4fz6+KWWmKsTxLL3GoD0U+
	DEm+yxf4YDrYyQeJHCELulRBig7gwCbhkugDbQD9LoK13jR2cW1TK+o7I8Hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1654168333; x=1654254733; bh=dDHY8Uc64rXba+8CvtEuhVli0G1F
	CDqOgYSR+W0nkJw=; b=NrMKOMu2On9ZNmZoj7/oVwB3FvuMXG1IYJAzb/Qb2fet
	Fv87hhxWEkWNR+09ZwXEDHL9CifoPn1jhbPFiAqXkXJLNlMgULbEufCSOwZFjlLr
	WBWZF7h7YfHRW1GvX7rh9mVkw7cva3ma1oNSRzsBpXCDPIH+JKjKL8Q/ACyGgyum
	N3Gy+SZbcISUMx8+Vx7LjrHS7CmUv+nTpEqru0SF+levZh2MRjWQaiin+XqxF9tf
	ucklAajr8+wBViPdDMVuS3d89+t1IhV/6SMVkpIKDi8PPqB/dhB3134cEMX8mIyY
	fsoSSuq3kY6Q1jLESPdNk9TYabf+jcpTnOTXsOQk3Q==
X-ME-Sender: <xms:DJuYYu1UJSEkmsduHnVvjRaaJfuPI6Fwx9irjKux7TQPHXKkGwnfRw>
    <xme:DJuYYhEzpL9XMcAE1zFUCcCpsoo65Lg0xJH3-hVd-3BQ97szpbE2TqRZqyJPp6Bwj
    08C2udVwYOWk9C_6zs>
X-ME-Received: <xmr:DJuYYm5c1-cJF-nhUYGbrLq7gVPGCJrNcPRGkIDdTPtsn1Xgb-3n0h6_zO6_A7R_9f8lDsdFSiYH_vMD0inkVwjgBoEdYf1IdHE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledvgdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhepfffhvf
    evuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
    ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
    epheefjeehfedtjeeivdefkeffheeludekudelleffkefgtdeludelvddtgedtheeknecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
    gtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:DJuYYv2aCBIn-irG4KGOCDDXX8JKgYo3n6hFXlRzJltMXXCcOIMtrQ>
    <xmx:DJuYYhEQaew8GM8YlscWrBlX_gG5mV6xrmvgGq7IsO8-motyMAr0aw>
    <xmx:DJuYYo-5vRsOYm5G86IN1j1KzDeqzsvOwql32cdIV6ZCf11UiQlwEw>
    <xmx:DZuYYkNZXnsfBuJK4KlQPDgJe1y-1J60uhskE8bSm0kNuIbG_-7RHw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jun 2022 07:12:12 -0400 (EDT)
Date: Thu, 2 Jun 2022 06:12:11 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Gangadhar N <gangadhar.ubuntu@gmail.com>
Subject: Re: Usage of SHA384 signature for FIT image instead of SHA256
Message-ID: <YpibC6xDK81LVOSd@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAKxnL=hnWt8ZYL2eU8yaYMRTF7wMO8asb_YLmY2361CWddMkXg@mail.gmail.com>
 <YpYbwIAec+Fc+iaw@heinlein.stwcx.org.github.beta.tailscale.net>
 <CAKxnL=gZNCxTuQr3xvfxox1kuUq94j1cAbhsFgu0PDfdXqBfOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t68ONLX6uzRdz3of"
Content-Disposition: inline
In-Reply-To: <CAKxnL=gZNCxTuQr3xvfxox1kuUq94j1cAbhsFgu0PDfdXqBfOQ@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--t68ONLX6uzRdz3of
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 01, 2022 at 01:21:59PM +0530, Gangadhar N wrote:
> ERROR: linux-obmc-5.8.17+gitAUTOINC+c26e1233f9-r0
> do_assemble_fitimage:

=2E..

> I am using 2020.10 uboot

I don't really understand what you're trying to accomplish.  Neither
linux-5.8 nor u-boot 2020.10 are something we've supported in OpenBMC
for any hardware I am aware of.  What are you trying to build?  Which
code are you using as the base?

--=20
Patrick Williams

--t68ONLX6uzRdz3of
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmKYmwkACgkQqwNHzC0A
wRlcxg/+Lv6V8f93AtQIgN6q00XyBKYn/Jt4WiS13JGf9du6IsFbpsYvlXDhgw0w
pz2Imw97Z/j71mlryzVL1f8xV1FyTHhBzC1s34ZuWiFZrz3JiqBObl8MB7dO7PSi
tUKxEC2q880jGnqUL0gLCsHqjH0wgcc3aLQNGXS8Yoc0xnqUjy5ednekZp0VeWiT
Vgcw1V3FCXxcKPiJ6Lbr+8f5H1EyYSSMU+yD99kWdKrfI+4WydqIj+8iNsl6NlMM
ax8Z3F8UzPpju1nIio2VnI5RlBQy+RmkHnD8tZeOseT0Tdq4VX5XWQWh/Udk+V/7
rYxwmeSNQg49hvmko2oO18z4rMnQLu11BkzRvHyOmwQL+jqE77lkOt0dBB2VkKIK
mdU+vmmouw73demUleTE/LaEWFA2tRuKhJRuhOqSK0eeNu1NlzMjt0T0zavM7RmA
3Ue0XUi4h1n1+e5pceIx9Dg+dMMJApyOkQocIbHPSVD8kfgTWK5afPy5eQzFsmMy
0huZFQqNW56xlzp2x+M/bNB8r6XgN6m3xAALh0JC5SZ+Ub5Wg4zaQHM7sD9Qrazv
f2ChwqrWxsvDWZ4NHZoOg5cvydRdB1Z9CFMGArZIELls4lacPnSvDxqnVBBnmAlL
QSLcuBxI/vl/fFqkTMoN9fbhG3Sijn52VvUDtVEZ3onLqmp3vEE=
=xrKY
-----END PGP SIGNATURE-----

--t68ONLX6uzRdz3of--
