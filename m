Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8EB13AD7E
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 16:21:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xvLK2ptlzDqQT
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 02:21:13 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xvKK4MkczDqMM
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2020 02:20:15 +1100 (AEDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id 5AAF53897B;
 Tue, 14 Jan 2020 10:19:21 -0500 (EST)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 30C9B108F;
 Tue, 14 Jan 2020 10:19:47 -0500 (EST)
From: Michael Richardson <mcr@sandelman.ca>
To: Deng Tyler <tyler.sabdon@gmail.com>
Subject: Re: Dose OpenBMC support UPnP
In-Reply-To: <CAO9PYRKzfWXx4iOOxoGmi_EFb2rdSBmHxVzh-6mzUf-NBoEajA@mail.gmail.com>
References: <CAO9PYRKzfWXx4iOOxoGmi_EFb2rdSBmHxVzh-6mzUf-NBoEajA@mail.gmail.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 24.5.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Tue, 14 Jan 2020 10:19:47 -0500
Message-ID: <19711.1579015187@localhost>
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
    > Hi all: UPnP is well-known and widely used network protocol. Does
    > openbmc support it or plan to support? Thanks.

Troy Lee <leetroy@gmail.com> wrote:
    > OpenBMC supports mDNS/DNS-SD(Avahi).

UPnP is not just mDNS (and originally wasn't mDNS at all)
UPnP is a collection of services, that includes being able to open ports on routers
for incoming traffic, route AV material, etc.

Which part of UPnP are you asking about?

    > Thanks, Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>

    > On Tue, Jan 14, 2020 at 11:32 AM Deng Tyler <tyler.sabdon@gmail.com>
    > wrote:
    >>
    >> Hi all: UPnP is well-known and widely used network protocol. Does
    >> openbmc support it or plan to support? Thanks.
    >>
    >> Tyler


    > Tyler


    > ----------------------------------------------------
    > Alternatives:

    > ----------------------------------------------------

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl4d3BIACgkQgItw+93Q
3WW8Lgf7BYBZdjMdsTMBc6ICzjDvY8M8cLTt3NrExELaJUHA1n0RTTQpZX35XRRP
sEjop2KfoYIxawhRUcQL39PpZnvFwEkZRVYdk34XL/XR/ktTELn7spX2FYlBRKtn
MykUi/uUIie23t21Fhr70VFGYfStnHOejdSEGZfQolBLcVyybeEpoQxJ9FbCVhNG
WizXl0Gt0KbhZ7ZPQLRUcw5wia06IvL0O5elI1+vxbnjI+yNbS/IYHlClNi4XsU0
flo6XCEXgrOeEoI2bGTfG4kY1IJXiDH1hn5dkSVOup8kCBRmfF7mpvAmwluQQ9mc
x0L46GAlejs8WecZqubiiAsg/1lFRA==
=+W7T
-----END PGP SIGNATURE-----
--=-=-=--
