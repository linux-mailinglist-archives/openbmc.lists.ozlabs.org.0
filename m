Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EBC421973
	for <lists+openbmc@lfdr.de>; Mon,  4 Oct 2021 23:50:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNZC345Yyz2yw1
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 08:50:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=209.87.249.19; helo=tuna.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
X-Greylist: delayed 114 seconds by postgrey-1.36 at boromir;
 Tue, 05 Oct 2021 08:50:05 AEDT
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNZBj6c6Lz2yNq
 for <openbmc@lists.ozlabs.org>; Tue,  5 Oct 2021 08:50:05 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id EB049182BF;
 Mon,  4 Oct 2021 17:58:05 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Xvs1UQ8B2vmG; Mon,  4 Oct 2021 17:58:01 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id 4AE92180C7;
 Mon,  4 Oct 2021 17:58:01 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id B7DD758B;
 Mon,  4 Oct 2021 17:49:58 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday September 29
In-Reply-To: <e6dbbca0-e4f7-2e0f-146b-e57008a788e9@linux.ibm.com>
References: <bb3c031e-cbe3-36c5-0db6-d1ef454300fd@linux.ibm.com>
 <e6dbbca0-e4f7-2e0f-146b-e57008a788e9@linux.ibm.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 04 Oct 2021 17:49:58 -0400
Message-ID: <17785.1633384198@localhost>
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

--=-=-=
Content-Type: text/plain


Joseph Reynolds <jrey@linux.ibm.com> wrote:
    > Can we use consider SRP (dropped in OpenSSL 3.0 -- why?) or other
    > implementations such as GnuTLS?

I meant to add/ask:

I assume OpenSSL is part of the build process today.
Would switching to GnuTLS, WolfTLS or MbedTLS really be possible?

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmFbdwYACgkQgItw+93Q
3WVUqggAiYuMJNrsVFJ5XTaizKWfOmNzrgu7uO+F83eCha7uJ3Mc8SZ33smb12G2
I651hZFU3J7dBcHALNEF5l0xPlTKhWFBvU+OtR1SNtx1UJkSey5ng7o0zVJvrKDQ
50IwaVfdRzafsOR6eiNj/hCoPeZjl0l64XLMr9nw7ji48ra1V4bZGcggIMv8S9GG
XeuA2XO6iAe0Lyp/LMoGrVWjZddQ5iZwMDC/N1zeJTJaSR/pCdnR5GA5IxlhOwwS
YbHsV2oHDVn9yZhzK1saOutLFp9jZlQM1YJY/88OlGSQtDy/X1Hi1dF320r3ke8Z
0ih8g1Z7NGs7Y/FpN9IvPS/Jwgu/1w==
=oOTW
-----END PGP SIGNATURE-----
--=-=-=--
