Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 669B3DF4F5
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 20:20:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xlLT6zfLzDqJS
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 05:20:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xlKb4PTfzDqJK
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 05:19:47 +1100 (AEDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id 765B23897A;
 Mon, 21 Oct 2019 14:17:01 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id C189F612;
 Mon, 21 Oct 2019 14:19:32 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Deng Tyler <tyler.sabdon@gmail.com>
Subject: Re: run ikvm in qemu
In-Reply-To: <CAO9PYR+FgeBr1su+xWy22kjAzPY7sEYreA4f2xCcMrgzHm3avw@mail.gmail.com>
References: <CAO9PYR+FgeBr1su+xWy22kjAzPY7sEYreA4f2xCcMrgzHm3avw@mail.gmail.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 24.5.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 21 Oct 2019 14:19:32 -0400
Message-ID: <9390.1571681972@localhost>
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


Deng Tyler <tyler.sabdon@gmail.com> wrote:
    > I know openbmc release KVM over IP but I did't have any bmc board yet.
    > Is it possible run ikvm function in qemu which simulated ast2500?

Are you asking if it is possible to have an ikvm to an (emulated) x86 machine
via an emulated ast2500?

It is my understanding that the emulator only does a single system at
present.


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl2t9rQACgkQgItw+93Q
3WUJfggAtYNnzwlD2O4ZBOim/O4QBst6zWnp8/odwbbsfUot4K58FeVYcQ9RZHwv
R0eONvqr5qe3QLxvIdf2tYbGPOgWLWUJ6ChkIxFlQ6/B3FOfpbKugWDUk49IiBSx
Jo6TdRYVSOjWwrYp3U9A/5/g6u9UJcTVSQTJ0xGasNacak/CFNJU07Ez92/bulMD
f9Qr0I3t0ZWAViybwtcIzfIfFAncOePwz+x3Y50CbhO9UT9oh6rquaz2gJ/9IYug
s2D9MVcXnkNNdHWM+Zx3twM4lCaOS6syjfhyxwB6Ml4WuYlAyWnaWl/bFZQCrZfX
yptOWwVnqdpgJFCwXeGlxYVLTpsfLQ==
=a7PY
-----END PGP SIGNATURE-----
--=-=-=--
