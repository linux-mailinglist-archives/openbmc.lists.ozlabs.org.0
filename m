Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA7931ED79
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 18:45:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhMYL16Mlz30RR
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 04:45:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=2607:f0b0:f:3:216:3eff:fe7c:d1f3;
 helo=tuna.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
X-Greylist: delayed 421 seconds by postgrey-1.36 at boromir;
 Fri, 19 Feb 2021 04:44:57 AEDT
Received: from tuna.sandelman.ca (tuna.sandelman.ca
 [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhMY56qcxz30LG
 for <openbmc@lists.ozlabs.org>; Fri, 19 Feb 2021 04:44:56 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id 6D5E5389A8;
 Thu, 18 Feb 2021 12:41:37 -0500 (EST)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id yZAgoYV8htIp; Thu, 18 Feb 2021 12:41:36 -0500 (EST)
Received: from sandelman.ca (obiwan.sandelman.ca [209.87.249.21])
 by tuna.sandelman.ca (Postfix) with ESMTP id 6F791389A4;
 Thu, 18 Feb 2021 12:41:36 -0500 (EST)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 86F2612F;
 Thu, 18 Feb 2021 12:37:47 -0500 (EST)
From: Michael Richardson <mcr@sandelman.ca>
To: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: ANSI Escape sequence unexpected output
In-Reply-To: <47e7db9c-f07d-0b27-5e38-328fb6ba3d53@intel.com>
References: <HK0PR04MB2737A1AA6BFD979A359584D3C9859@HK0PR04MB2737.apcprd04.prod.outlook.com>
 <47e7db9c-f07d-0b27-5e38-328fb6ba3d53@intel.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 18 Feb 2021 12:37:47 -0500
Message-ID: <17303.1613669867@localhost>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?us-ascii?Q?=3D=3FUTF-8=3FB=3FRGF2aWQgV2FuZyAo546L5oyv5a6HKQ=3D=3D=3F?=
 =?us-ascii?Q?=3D?= <DavidWang@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain


Johnathan Mantey <johnathanx.mantey@intel.com> wrote:
    > David, I see a garbage sequence like this all the time.

    > I run an Expect script that controls my terminal emulator (kermit), and
    > I see a sequence like this: [[39;88R I have tried multiple times to

That's the result of a Device-Status Report.
https://en.wikipedia.org/wiki/ANSI_escape_code#CSIsection, see "DSR" or "CSI 6n"
39 88 is the size of your terminal, or the one that Kermit is emulating for you.
(I seem to recall think that kermit has a full-screen mode. So many different
versions of it over the decades)
You may be able to turn kermit responding off, or change it's terminal type
to dumb.

The shell is emitting ESC [ 6n to set the stty size of the terminal.
"resize" does this, but I think gnureadline does too.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [



--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmAupesACgkQgItw+93Q
3WWw0gf/SVRBU9XPLkn2qGwBHvQAUDGuzMpFPO2g+kH2mhp2LKmP7sgfkzEw3vMh
ZjwmrVSoAQ0QWVeUkWuy7X3vDnz3LSJpMw4xp0AbU7NogmIKxluqRXPrcBWC4GyG
WAY6p4Th/QbIaMCR1z6f1Fqi065ON9Nl6GpUVSi4T6PT10xNmuzMxNHMFpv2Ldrn
XAZlBvFeAIPQzAkVGXn9g8Q0Q1l93V5m8fImzmwKGd+rz0X95Sz8558wkXvB1FC+
xlYWFA4EYEQTS3upM3+VT37u/wRwtMIHw7tA5BO0ZDncMC5iZ5TmwvGqfkYhopsx
m/ls6SrvUjXfsIRYcQ1YBUUxjVbXZg==
=XLI+
-----END PGP SIGNATURE-----
--=-=-=--
