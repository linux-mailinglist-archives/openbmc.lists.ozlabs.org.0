Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D7B22B8C3
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 23:35:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCQbr2jsKzDrYb
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 07:35:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCQZw1pWGzDqy9
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 07:34:30 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id 299D738A30;
 Thu, 23 Jul 2020 17:13:58 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id HXA4fZPyaHn5; Thu, 23 Jul 2020 17:13:57 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id 1A6CB38A1A;
 Thu, 23 Jul 2020 17:13:57 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 66E821CB;
 Thu, 23 Jul 2020 17:34:24 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Ed Tanous <ed@tanous.net>, openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Security Working Group - Wednesday July 22 - results
In-Reply-To: <CACWQX83HPvOTRkf=K8BfBjAgJGaDi2_UEi3GvWMO8j3kNJ2Tqg@mail.gmail.com>
References: <b8ec220b-56ca-45f7-99be-5ab197c4d881@linux.ibm.com>
 <b5f1c04f-eb6c-7dac-2945-cff9815a7ca6@linux.ibm.com>
 <CACWQX80aD212+JKwqGJoowyb4S7wLcnUCyVLwOMko8T_86yunA@mail.gmail.com>
 <8008.1595531126@localhost>
 <CACWQX83HPvOTRkf=K8BfBjAgJGaDi2_UEi3GvWMO8j3kNJ2Tqg@mail.gmail.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 23 Jul 2020 17:34:24 -0400
Message-ID: <13663.1595540064@localhost>
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


Ed Tanous <ed@tanous.net> wrote:
    >> Ed Tanous <ed@tanous.net> wrote:
    >> > One thing to note;  At one point, I had talked through how to
    >> > prototype ACME protocol replacement of certificates automatically, so,
    >> > given an ACME server on the network, the BMC could essentially
    >> > automatically provision itself and keep its certs up to date.  If
    >> > someone wanted to run with that, it might reduce some of the pain here
    >> > (and be extremely cool).
    >>
    >> I have running code, but to use ACME, requires some initial trust
    >> relationship.  The manufacturer can do that if they want.

    > Lots of (mostly private) meta layers have this set up already for
    > internal use and add the relevant CA cert to the build.  Also, I think
    > (I could be wrong) the ca-certificates package is included in most
    > builds already so we can handle trust with foreign servers (for things
    > like HTTP event push).  Presumably ACME uses the same trust
    > relationship, or does it have a specific mechanism that's unique?

yes, the ca-certificate package provides CABForum listed keys, but that won't
include my local private-CA, unless I put a custom build in.

ACME requires that the machine that wants a certificate has to prove it's
name somehow.  The tools are https-01 or dns-01 challenge.

https-01 trust requires that the ACME server be able to reach the server (the
BMC) on port-443 to see the challenge.  And do so by DNS name!
The public LetsEncrypt systems need this to be a public name, and there must
be public port-443 connectivity.
But, if you run your own ACME servers, then you can do something different.
(but, you'd have to configure OpenBMC to talk to your servers, so you'd need
a way to tell it do that, so you'd already need admin access...)

If this is done by dns-01 challenge, then the ACME server needs to be able to
do a Dynamic DNS Update.

    >> One can also use draft-ietf-anima-bootstrapping-keyinfra + EST (RFC7030).

    > ... has been added to my nightly reading list.

waiting on a MISREF to become RFC.
https://www.sandelman.ca/SSW/ietf/brski-links/ contains a few videos that
might lighten your load.

    >> > It should be noted, most browsers (in my testing) seem to ignore the
    >> > HTTP date header entirely, so the BMC doesn't even need the correct
    >> > time to set up a proper encryption channel.
    >>
    >> That's very surprising and counter to my experience.
    >> The more likely case is that the OpenBMC has the wrong date.
    >>

    > IIIIInteresting.  Clearly I need to do more testing.  Just to be
    > clear, I'm talking about the HTTP response date:
    > https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Date

    > Not the validity dates in the TLS certificate.  There were a couple
    > versions of bmcweb where the Date field was broken as well as systems
    > with a reset CMOS where the date is incorrectly set to epoch.  In both
    > cases, no browsers threw any kind of warning that I recall, we just
    > happened to notice it on the debug output.

So, the BMC has the wrong date, but the certificate was still valid.
(Browser time >= notBefore, browser time <= notAfter)
I don't expect the browser to care about the date the server thinks it is,
only if the certificate has become invalid.

The proposed code to kill the certificate if it was invalid would have
rendered the certificate unuseable in this context.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [



--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl8aAmAACgkQgItw+93Q
3WVy7Qf/UM1dCGKcA7H4rzsVV1m7nUfOl+fkS7Cm5+CCcZQS+6yRuqYfjBeBzZBR
Bkyie8ftx/hslr/VeHR9QKA6w/17HngO5kEmp/wjn5iHETMa0mBEr6O/E9CsI7sx
H4/4wjZcE7o8Muap0tL2coiFgOfMibZoIvGPhrjB+qNMUJc9DOpo/+PQtOjhwfpR
N8pzNjpKQ9MXSdUhqf+rYTC+WIcz8gFnkvRQNBSG4tfvci9ah6bm2HNh4utiGMRr
wK8ycsCGBBTPouiyOpav/QZ8FyQiOWtQNhdz5weXWYENrdoPoGQF6hhm3nF0kldz
QV5oZcX6o4+jnSOA+fB1c8bKGsnPmQ==
=O9W2
-----END PGP SIGNATURE-----
--=-=-=--
