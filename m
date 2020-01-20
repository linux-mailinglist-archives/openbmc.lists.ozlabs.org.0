Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3F9142409
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2020 08:03:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481N183G35zDqN1
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2020 18:03:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=209.87.249.19; helo=tuna.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481Mt2087BzDqcH
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jan 2020 17:57:10 +1100 (AEDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id 4CF7C3897E;
 Mon, 20 Jan 2020 01:56:34 -0500 (EST)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id AC7863FB;
 Mon, 20 Jan 2020 01:57:04 -0500 (EST)
From: Michael Richardson <mcr@sandelman.ca>
To: Samuel Herts <sdherts@gmail.com>
Subject: Re: OpenBMC Starting Point
In-Reply-To: <CA+k9xxY2wfrzE=kQOM24wc5pgs+poqNEKyHooQNfxNfZrSsGFA@mail.gmail.com>
References: <CA+k9xxY2wfrzE=kQOM24wc5pgs+poqNEKyHooQNfxNfZrSsGFA@mail.gmail.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 24.5.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 20 Jan 2020 01:57:04 -0500
Message-ID: <5937.1579503424@localhost>
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
Cc: openbmc@lists.ozlabs.org, geissonator@yahoo.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain


Samuel Herts <sdherts@gmail.com> wrote:
    > I am currently working on getting a working OpenBMC test environment
    > up and running. I am using VirtualBox and the github Development
    > Environment tutorial. I had a couple questions regarding how to make
    > our own modules. Would it be possible to upload files to the bmc on
    > the virtual server?

You can do that.
The disk is rather small by default.
If you are using VirtualBox, you may be able to use the vboxfs file system to
mount the host. That might require adding modules to the kernel.

    > And would I be able to make a script which can read text off of that
    > file inside the bmc chip?

    > I have a physical server which I am not using yet, would I be able to
    > install openbmc and the scripts and insert the file onto the actual
    > bmc chip, and eventually read from that file?

Maybe. What server do you have?

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl4lT0AACgkQgItw+93Q
3WWHuwf/ZKRcEIk3CCLYDQmskkhOHySfhfGVaCT9vEZaRdqta0u3+a7iyJqeL3f/
uTqGs+wN5/VSmqR07aS/uAEtv7YrGw9iEM0QjiJWQjPInqs48EsE1+hGDYSyy3cO
X2eF4wLIdbWErXyJoGV0c0gIKEBw94H6o2RtXrlmCw6G9hQJv3d6qXAB6L/nJRfI
dq/wlTDqKFJCLbvr9aWwjmvPpFa8o/rpU6SU6JcZPNNOL2T1xGT+IcGptMG9KFBI
/LXCBj5Tdtmgn8jagwKCxAW9WXsctMYRva2OIKdmYxvKuvj2ia0ixhVeDPeZ1dZ0
2ojK31Q5wx2NSWfKwHV2Z3IJ2zEcbQ==
=lZ3X
-----END PGP SIGNATURE-----
--=-=-=--
