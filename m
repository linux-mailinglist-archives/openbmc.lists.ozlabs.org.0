Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4244F320781
	for <lists+openbmc@lfdr.de>; Sat, 20 Feb 2021 23:30:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DjjnF0rjZz3cK4
	for <lists+openbmc@lfdr.de>; Sun, 21 Feb 2021 09:30:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=2607:f0b0:f:3:216:3eff:fe7c:d1f3;
 helo=tuna.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Received: from tuna.sandelman.ca (tuna.sandelman.ca
 [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Djjn00S0Zz30L4
 for <openbmc@lists.ozlabs.org>; Sun, 21 Feb 2021 09:29:55 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id A6249389FF
 for <openbmc@lists.ozlabs.org>; Sat, 20 Feb 2021 17:33:37 -0500 (EST)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 7XlJUydOuHta for <openbmc@lists.ozlabs.org>;
 Sat, 20 Feb 2021 17:33:36 -0500 (EST)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id 8E52B3899C
 for <openbmc@lists.ozlabs.org>; Sat, 20 Feb 2021 17:33:36 -0500 (EST)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 556FC50
 for <openbmc@lists.ozlabs.org>; Sat, 20 Feb 2021 17:29:39 -0500 (EST)
From: Michael Richardson <mcr@sandelman.ca>
To: "openbmc\@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: overlayFS security concern
In-Reply-To: <YDE90CWoSXCHjgYK@heinlein>
References: <BYAPR14MB23420BA1183F22A48EF8B97ACF839@BYAPR14MB2342.namprd14.prod.outlook.com>
 <3803c1a3-bee8-4e78-a23f-7e50858eda1a@beta.fastmail.com>
 <YDE90CWoSXCHjgYK@heinlein>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 20 Feb 2021 17:29:39 -0500
Message-ID: <19011.1613860179@localhost>
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

--=-=-=
Content-Type: text/plain


Patrick Williams <patrick@stwcx.xyz> wrote:
    > A protection we could do which would make attacks slightly harder than
    > they are today would be to change how we mount OverlayFS.  Right now we
    > mount it on top of root, but we could be more explicit about mounting

I was going to ask about that.  Could we just overlay less?
The second question is: would a non-persistent overlay be useful?

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmAxjVIACgkQgItw+93Q
3WV+MAgAj4ZycdCwm5kk5WNaHa95bLl807uFmREkz9HO2cSZufLlbCPfWUxBAIUn
SFVgFJJS5m6tTepadr/1EfST6qGtRKagZKBgyp8XwTTwkZJVAytmQuUr0hgMyRQU
18SLJVp977U5NU0AqJzDK+bssnkw5geYDGoE/0Bgy4ulHE7IUTu4ODqLJe44VRYY
nhW8Uqgfh9ToyIJ3kvC0zW2J8d8CiiNp0pfq0dG5V3iowZfa7Fl/JkJFQYJBjKS8
u8nNZ0/jNcdQ3KhlAIlbm/qy4NA8rtuMI5hM+LIM2dTZppMGTRcGxzJw/hd6dlr3
TTVOaBHlBZP8x6LqQjYH5M3WQk0U7w==
=Djm0
-----END PGP SIGNATURE-----
--=-=-=--
