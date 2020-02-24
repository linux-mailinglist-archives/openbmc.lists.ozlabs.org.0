Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2787816AB32
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 17:19:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48R6j21Pn5zDqSg
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 03:19:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=2607:f0b0:f:3:216:3eff:fe7c:d1f3;
 helo=tuna.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
X-Greylist: delayed 289 seconds by postgrey-1.36 at bilbo;
 Tue, 25 Feb 2020 03:19:18 AEDT
Received: from tuna.sandelman.ca (tuna.sandelman.ca
 [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48R6hQ3dvgzDqSR
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 03:19:16 +1100 (AEDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id 27D783897C
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 11:18:15 -0500 (EST)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id AD1185A4
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 11:19:14 -0500 (EST)
From: Michael Richardson <mcr@sandelman.ca>
To: "openbmc\@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Security Working Group meeting - this Wednesday February 19 -
 summary results
In-Reply-To: <18a2f2f6-7281-8884-20c2-eceee87c3bea@linux.intel.com>
References: <b9170918-0937-714a-470e-cb41e1e74b63@linux.ibm.com>
 <f4d9d6f6-277e-8c8b-6b5c-d0577eaa82cc@linux.ibm.com>
 <20200220162633.GB41328@patrickw3-mbp.dhcp.thefacebook.com>
 <2b30dde7-3415-8c7a-2001-28793e938339@linux.intel.com>
 <20200221201022.GA67957@patrickw3-mbp.dhcp.thefacebook.com>
 <2c409610c4544e0187e37a5322c6a313@SCL-EXCHMB-13.phoenix.com>
 <18a2f2f6-7281-8884-20c2-eceee87c3bea@linux.intel.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 25.1.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 24 Feb 2020 11:19:14 -0500
Message-ID: <21543.1582561154@localhost>
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


James Feist <james.feist@linux.intel.com> wrote:
    > I think the original motivation of 10 years was something above the average
    > support cycle of a server, so on first boot the user has something they can
    > use to login to the server with.

That's not a crazy consideration to me.

    > That being said, if the browser wont let you
    > in, that is obviously more important. 30 days seems a bit too strict
    > considering shipping / unpacking times make it likely you'll have an expired
    > certificate upon arrival. But if we can't come to an agreement, we can always
    > make this configurable.

1) it would be good to clarify what browsers are really going to do.

2) it won't apply to CURL, etc. which might be used to onboard a system
   automatically.

3) you can't make it configurable, because you can't configure it if you
   can't connect :-)

825 days (27 months, so 2yr plus some wiggle room) is definitely what they
are going to for built-in trust anchors.  I'm not sure if this will apply
to trust anchors that are loaded into browsers by end users, or if that
configuration will somehow be attached to the trust anchor.

So, if 825 days is a good default, I'd make it 820 days, and after 410 days,
I'd have the self-signed certificate resigned, but not generate a new private
key.   This allows for mgmt stations to pin the public key of the BMC,
ignoring the actual certificate contents.

I will try to send a patch to do this.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl5T94IACgkQgItw+93Q
3WVIxAf+Oy0sCMrvTE0nx98cSKKFtVN0rZbUXZkBKue3uHct+eeICxya3/uTigGt
eNp5ujn5iBchaWPlk36d74Cmf9MC8ESmlO+sEypQCMfLVb+dc+p5dss5tFzFM+Ij
NH4/cepD2X8I/ykPrf0nc1sf9THPpjRgGZEwSHl2Qw8K1q5nYpmPQhDLwtdrisCt
XkTpkVMNSycDpS186W2aLilD/nfx0ER/HdFqR+8VPb9xK8+X9gY9q2AA89rMYv4z
57qSSuRmQY7d/JN+h2zTHhuUmGVf+vmTAeAEx04DFvbqyKcb1/UO7pJ4znbzOrvr
61zKDPXqNaOUHl6SxPtw32xcQk3Nyg==
=35Il
-----END PGP SIGNATURE-----
--=-=-=--
