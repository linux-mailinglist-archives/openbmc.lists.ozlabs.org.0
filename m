Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E6622B696
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 21:14:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCMSj0p2RzDrPb
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 05:13:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=209.87.249.19; helo=tuna.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
X-Greylist: delayed 446 seconds by postgrey-1.36 at bilbo;
 Fri, 24 Jul 2020 05:13:13 AEST
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCMRs27M5zDrML
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 05:13:12 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id 2AF7B38A15;
 Thu, 23 Jul 2020 14:45:01 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id F_iqKbDda6O2; Thu, 23 Jul 2020 14:45:00 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [209.87.249.21])
 by tuna.sandelman.ca (Postfix) with ESMTP id 7829438A1A;
 Thu, 23 Jul 2020 14:44:59 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id A9C989A;
 Thu, 23 Jul 2020 15:05:26 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Ed Tanous <ed@tanous.net>, Joseph Reynolds <jrey@linux.ibm.com>,
 openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Security Working Group - Wednesday July 22 - results
In-Reply-To: <CACWQX80aD212+JKwqGJoowyb4S7wLcnUCyVLwOMko8T_86yunA@mail.gmail.com>
References: <b8ec220b-56ca-45f7-99be-5ab197c4d881@linux.ibm.com>
 <b5f1c04f-eb6c-7dac-2945-cff9815a7ca6@linux.ibm.com>
 <CACWQX80aD212+JKwqGJoowyb4S7wLcnUCyVLwOMko8T_86yunA@mail.gmail.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 23 Jul 2020 15:05:26 -0400
Message-ID: <8008.1595531126@localhost>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Ed Tanous <ed@tanous.net> wrote:
    > One thing to note;  At one point, I had talked through how to
    > prototype ACME protocol replacement of certificates automatically, so,
    > given an ACME server on the network, the BMC could essentially
    > automatically provision itself and keep its certs up to date.  If
    > someone wanted to run with that, it might reduce some of the pain here
    > (and be extremely cool).

I have running code, but to use ACME, requires some initial trust
relationship.  The manufacturer can do that if they want.

One can also use draft-ietf-anima-bootstrapping-keyinfra + EST (RFC7030).
These two are not mutually exclusive.

I hope to clear my plate enough before the end of the year to demonstrate
this on OpenBMC.

    > The above is all asking the wrong question: "Can we determine if the
    > certificate is valid?"  This is irrelevant, the question is: "Should
    > we ever be replacing a user provided certificate with one generated on
    > the BMC."  The answer previously has been no.  In almost all cases the
    > user provided certificate, even an expired one, will still be better
    > than one the BMC self signs.  Between having an invalid certificate
    > chain, and an invalid date, I'll take the invalid date every time.

I agree.

    > It should be noted, most browsers (in my testing) seem to ignore the
    > HTTP date header entirely, so the BMC doesn't even need the correct
    > time to set up a proper encryption channel.

That's very surprising and counter to my experience.
The more likely case is that the OpenBMC has the wrong date.

    >> Should =E2=80=9Cout of date=E2=80=9D not be part of the
    >> =E2=80=9Cunusable=E2=80=9D definition? =E2=87=92 Ideas: 1. If bmcweb=
 finds a usable cert but is
    >> out of date, that cert can still be used.  2. Leave the defective
    >> certificate (do not delete it) and log an error.

    > A lot of BMCs don't have a dedicated RTC, and rely on other systems
    > (like the PCH or NTP) to get the correct time.  bmcweb needs to come
    > up long before the PCH or NTP (both of which are also optional) so as
    > a general rule, using these for valid time is a non-starter.  I could
    > see logging an error _if_ you know time is valid, but I'm not sure how
    > a bmc could know that.

Agreed.

=2D-
]               Never tell me the odds!                 | ipv6 mesh network=
s [
]   Michael Richardson, Sandelman Software Works        |    IoT architect =
  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails  =
  [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl8Z33YACgkQgItw+93Q
3WVJfwf+MGIXkFJqJN6TQTQxrJuqLhgdV/IRViq/SAShYwDmeumrhI6TS7wqB8mq
koTpfsKBVYbQ8cfrkri52HY1Eb+snsG5hRRMogXP3JTEqb7DasZrXWUpItrIHIrA
b8Nh3xtAvvw77yqj69pwGrkeXeRzVkRyvT8Sxedr/0DyHAQvl2VF4APLke1c3Psd
8Kt+HAmHlo62V+l9hrl+0ejDnzScViER2G69rJ7xj/Hc2cwruAiJ+UExXHbi9BpS
Pp3IYESRFPavlBFdG68WWeabPzS1y2kWZpwbWe4AN1kHWvU9FPArUykwd+TQcy9G
spBFeilh4Zn59Y/xVlBVcXh4oGjtVA==
=ZhT5
-----END PGP SIGNATURE-----
--=-=-=--
