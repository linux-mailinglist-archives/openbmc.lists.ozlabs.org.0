Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE66B1C4B02
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 02:21:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GL4L3tK4zDqXt
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 10:21:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=2607:f0b0:f:3:216:3eff:fe7c:d1f3;
 helo=tuna.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
X-Greylist: delayed 10759 seconds by postgrey-1.36 at bilbo;
 Tue, 05 May 2020 10:20:36 AEST
Received: from tuna.sandelman.ca (tuna.sandelman.ca
 [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GL3S4TLPzDqQS
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 10:20:33 +1000 (AEST)
Received: from sandelman.ca (obiwan.sandelman.ca [209.87.249.21])
 by tuna.sandelman.ca (Postfix) with ESMTP id 1AC153818F;
 Mon,  4 May 2020 20:18:27 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id E4EF726;
 Mon,  4 May 2020 20:20:24 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Richard Hanley <rhanley@google.com>
Subject: Re: Survey for Certificate Management Needs
In-Reply-To: <CAH1kD+bKnGtca3SzAyaSwz4pQHG9EMWJfKHLtGHXMh=_jOTCtw@mail.gmail.com>
References: <CAH1kD+Y1u0CHZ_6PRV8GKmzSq49sg24QD1X99KZRZK=GN-Aedw@mail.gmail.com>
 <11791.1588627267@localhost>
 <CAH1kD+bKnGtca3SzAyaSwz4pQHG9EMWJfKHLtGHXMh=_jOTCtw@mail.gmail.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 25.1.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 04 May 2020 20:20:24 -0400
Message-ID: <26047.1588638024@localhost>
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


Richard Hanley <rhanley@google.com> wrote:
    > I think that CRL becomes more of an issue when communication is
    > mutually authenticated.  If a client is given a certificate from the
    > CA, then there should be a way for that client's cert to be revoked on
    > a BMC.

Again, it's the CA that issues the CRL.
If you want to revoke authorization, then you need to do that.
I'm unware of client-certificate based authorization in bmcweb at this time.

If your authorization process if just "signed by CA foo"
(i.e. authentication), then you would have to rely on the CA to revoke the
certificate.

If your authorization process consists of a list of pinned EE certificates,
then you could delete/mark-inactive the broken certificate.

If you combine both methods, then in theory, you could have a "anything
signed by CA foo, unless it is on blacklist X".  But that's not a CRL, that's
a blacklist.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl6wsUgACgkQgItw+93Q
3WWfSQf/fSHBHfIZGPZjaV/gUZ4Kn321ABlExk+0MXBEOJewh6qvSkd3UDkxRYCj
4FQnAb21/1Ljg3C1bzVGlKWnJx2x1s7jdFTuhVS2sCsoBpVwYYBw2PjCUSAlUZyq
w69KZsOHzCwO6h26KSBJRKcFfBPEzcGXPBKDgnbrMAZ3XTOA4aQ75Sq8TuAsuT7a
CxGRp0YPEtE6WJQ21d/BT5jF7te0sHRTEXsTuiEir8SwY2iwvo1rLjms0U9gJum+
lVv3EGI75iupzK0sHwO8OtLDexh+9YfK98GDKLmR768WYORuAw7x9XdGNQn40bHu
zFg7im2U7m1Mfxav2SxXsxlMAxHGuw==
=OsAq
-----END PGP SIGNATURE-----
--=-=-=--
