Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E72231065
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 19:05:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGNNK1YJ9zDqLR
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 03:05:37 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGNMS1SGSzDqDW
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 03:04:51 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id 9819738A2F;
 Tue, 28 Jul 2020 12:44:16 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id e_zyhw5WJwFB; Tue, 28 Jul 2020 12:44:16 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id CF06C38A0C;
 Tue, 28 Jul 2020 12:44:15 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 939761AA;
 Tue, 28 Jul 2020 13:04:47 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Patrick Williams <patrick@stwcx.xyz>, Joseph Reynolds <jrey@linux.ibm.com>,
 openbmc <openbmc@lists.ozlabs.org>
Subject: Re: BMCWeb policy for HTTPS site identity certificate
In-Reply-To: <20200727173258.GQ3922@heinlein>
References: <d50417a7-3cc2-1674-b4d1-09283c4ddaf5@linux.ibm.com>
 <20200727173258.GQ3922@heinlein>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 28 Jul 2020 13:04:47 -0400
Message-ID: <18129.1595955887@localhost>
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
    > On Thu, Jul 23, 2020 at 10:25:40AM -0500, Joseph Reynolds wrote:
    >> 2. certificate is good but expired or not yet valid - Use the
    >> certificate and log a warning.

    > I suspect that "not yet valid" is a more common case than might be
    > assumed on the surface.  I agree with the recommended action.

    > Many of the Facebook server designs do not have a hardware RTC available
    > to the BMC.  We have an RTC accessible by the BIOS and we also sync with
    > NTP.  That means there is always a period of time after we first plug in
    > the rack where the servers in the rack have a date that is way wrong.

    > It is reasonable to assume the date is just wrong and the certificate is
    > valid.  The clients can validate a certificate which is actually out of
    > date.

An additional design idea if you think you have no valid time, is to set the
time to be the notBefore of the certificate you have.  It's probably at least
that date :-)

    > I'm less settled on using a certificate which is clearly expired, but it
    > is still likely better than using a newly-generated self-signed
    > certificate.

+1.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl8gWq8ACgkQgItw+93Q
3WVmGQf7BFlLyXSwge8Lj/EpQjmvPQ2EF8osLGRez53xxWFmErdk3U1SZRaSJPFt
j83zijwiXo7FY2tNcFgqspbz/6W1grQrjXSXsggRejMhBgPrp2Y6GhoFzRUZD6vP
+XIAmJKm+AZVbyfr2Im844n94vzhL2Mv6gkY5DHyNnPFMx4+UhBT2Kb8DmhIn6YF
c0SXuNxafFPicql37pedMsk95RL+0Jkx95PHq115vfNCcGckOTM1ppsvv1G1BDe/
UCf6thYhzo+UeHmyFLYgnB5WVOxdEv8OZPHXpUKvDk5mj1mw1DiA4kiSquHscM60
cPMVWIogQkFN4y838Hj/9jlOEEECyg==
=a0VH
-----END PGP SIGNATURE-----
--=-=-=--
