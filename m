Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FC8508F94
	for <lists+openbmc@lfdr.de>; Wed, 20 Apr 2022 20:37:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kk8YB1C9Zz3bcC
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 04:37:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=176.58.120.209; helo=relay.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Received: from relay.sandelman.ca (relay.cooperix.net [176.58.120.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kk8Xr3YPNz2yRX
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 04:37:11 +1000 (AEST)
Received: from dooku.sandelman.ca (unknown [142.169.78.9])
 by relay.sandelman.ca (Postfix) with ESMTPS id 33C651F456;
 Wed, 20 Apr 2022 18:37:04 +0000 (UTC)
Received: by dooku.sandelman.ca (Postfix, from userid 179)
 id 1ECAF1A03B8; Wed, 20 Apr 2022 14:37:02 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: preventing chassis power-on until bmc Ready
In-reply-to: <FE2B7C36-070C-4DCF-84C0-FB3A53EC0837@gmail.com>
References: <FE2B7C36-070C-4DCF-84C0-FB3A53EC0837@gmail.com>
Comments: In-reply-to Andrew Geissler <geissonator@gmail.com>
 message dated "Tue, 19 Apr 2022 17:02:58 -0400."
X-Mailer: MH-E 8.6+git; nmh 1.7.1; GNU Emacs 26.3
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 20 Apr 2022 14:37:02 -0400
Message-ID: <820955.1650479822@dooku>
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

--=-=-=
Content-Type: text/plain


Andrew Geissler <geissonator@gmail.com> wrote:
    > I know in the past I've heard of servers that allow both the BMC and
    > Host to boot in parallel (which sounds awesome) but we're not there
    > yet.

That would really be awesome... server boot times have become ridiculous,
with the time amount of Black Screen (BMC boot time I think) time seeming to
be increasing...
I think that Dell had to tweak some things a decade ago when people started
putting multiple hundred Gb of ram in; I have old servers that take 10+
minutes to POST.

I do wonder if, as you say, the whack-a-mole should continue, or if the host
should just be able to inquire (and wait) for the BMC to finish booting.
So, don't prevent the host from booting, but allow the host to synchronize
with the BMC before it continues.
That would be in the BIOS, and perhaps could even be a prototyped as a (host) grub module.

It seems like there is a lot of mechanism in the BMC that affects the host
booting. (Like virtual USB bootable media)
It would also be very very annoying if one never could get boot console
capture after a cold boot, but only after a warm boot.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        | network architect  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [



--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEow/1qDVgAbWL2zxYcAKuwszYgEMFAmJgUs0ACgkQcAKuwszY
gEM2fwv/dr7vsriJVvMa5EWGh+KLc93r+FFSGTehLpxqWsUlgckNkT/SqFhWXWki
yOiokpaEyLoArW2jNmB3Kx01a6zM6qkY1PFd1cHTkS/5kansYY+nMBokc163XSI6
N+b0mOqZLm8WbIhqGo0Q19eM4WXaQ83V1T1MmOgKNlzRiic6vx15YRx1iq/bNemN
l3BRHQZS5pfWI5FqS4lGQ4G3Z86AQLLBkcCw781ajFhJxxfWyBvXB32iQHIT9+/y
iKXjO7DSOAAH3g2uMDQZzdJCVEBuBcCNoz3p5cgB5S0b7rp47p+TEilK8hKbEc8I
LEGKVhOahX4kcbZCP83Kre08rPq5TMBgNv2V/6TpWFfkjUG43rvu/2F05VonNzI9
ji3j/g2DYdq0bN+QIPIMVtG9eA99B43gPe2Njo6ppEceqUoy3P9oiMqhJQYgkwQy
SLAwUbyz76MSY5ZohkJrpluLClwR8ReZ1lWtwf3+VTuQ/P6GXQHOObGLr3aA91ix
ozcCvNZy
=iC2A
-----END PGP SIGNATURE-----
--=-=-=--
