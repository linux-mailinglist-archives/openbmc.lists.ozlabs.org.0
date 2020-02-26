Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C85C5170029
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 14:36:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SH056Mw6zDqVK
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 00:36:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SGy13m5FzDqgP
 for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2020 00:35:02 +1100 (AEDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id CCB9538982;
 Wed, 26 Feb 2020 08:33:56 -0500 (EST)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id E67C768B;
 Wed, 26 Feb 2020 08:34:57 -0500 (EST)
From: Michael Richardson <mcr@sandelman.ca>
To: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Subject: Re: Security Working Group meeting - this Wednesday February 19 -
 summary results
In-Reply-To: <817a0984-4928-17c5-d6a5-1f2a5b2ccb1b@linux.intel.com>
References: <b9170918-0937-714a-470e-cb41e1e74b63@linux.ibm.com>
 <f4d9d6f6-277e-8c8b-6b5c-d0577eaa82cc@linux.ibm.com>
 <20200220162633.GB41328@patrickw3-mbp.dhcp.thefacebook.com>
 <2b30dde7-3415-8c7a-2001-28793e938339@linux.intel.com>
 <20200221201022.GA67957@patrickw3-mbp.dhcp.thefacebook.com>
 <2c409610c4544e0187e37a5322c6a313@SCL-EXCHMB-13.phoenix.com>
 <18a2f2f6-7281-8884-20c2-eceee87c3bea@linux.intel.com>
 <21543.1582561154@localhost>
 <817a0984-4928-17c5-d6a5-1f2a5b2ccb1b@linux.intel.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 25.1.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="==-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Wed, 26 Feb 2020 08:34:57 -0500
Message-ID: <25109.1582724097@localhost>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain


Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com> wrote:
    >> James Feist <james.feist@linux.intel.com> wrote: > I think the
    >> original motivation of 10 years was something above the average >
    >> support cycle of a server, so on first boot the user has something
    >> they can > use to login to the server with.
    >>
    mcr> That's not a crazy consideration to me.

    > James, do you imply that the certificate would be generated during
    > server manufacturing, not at the first boot at the "end owner's"
    > premise?  If so, that indeed changes the perspective, I personally and
    > I think everyone in our discussion during the meeting thought of the
    > generation as happening at the latter moment, not the former.

Looking at the mechanism, it would seem that the certificate would be
generated upon first power on after the BMC was flashed.  If the VAR receives
the machine (or the shipping dock receiver), powers it on to make sure it's
not a dud, and ships it/puts-it-into-inventory, then the  30-day timer starts
then.

That's why 30 days is too short.
(If the manufacturer can put a proper IDevID into the BMC, that would be
better all around)

    mcr> 1) it would be good to clarify what browsers are really going to do.

    > Indeed - especially given that the recommendation mentioned [1] is a
    > CA-side one (used for _issuing_ certs) and the respective RFC section
    > for X.509 [2] is unchanged - so I'd expect browsers to continue
    > sticking to that. Unless, of course, someone decides to go the "let's
    > make it more secure for people based on that CA/Browser forum
    > recommendation" way and adds some logic that would do
    > otherwise...

I believe that the browsers will do this, because the CAFORUM rules would be
meaningless of nobody checked :-)

    > However imagine how would that look like - the browser is
    > at the receiving end (i.e. browser's user typically has no control over
    > the cert), what does it do when getting such a cert? Throw a warning
    > like "this server's certificate is valid for more than two years,
    > beware" or something? That's bad UX, [very likely] can't be acted upon
    > by the user anyway and actually FUD - the certificate is perfectly
    > valid.

The warning boxes are going away as fast the browser people can convince
people like us to do something different.

I have sent some emails to some contacts at Chrome and Firefox that deal with
CAForum questions, and I hope to get some guidance.

    > I was more concerned with the general fact that the self-signed cert we
    > generate doesn't provide full protection and what _gentle_ nudges could
    > be used for them to change that. In that context those 30 days looked
    > ok (don't break anything, but provide additional warning for an admin).

    > BTW, that MiTM may not only be happening at the network level -
    > e.g. admin's computer may be compromised and some process there could
    > MitM the connections without tapping the network infra proper.

Sure, there are about a hundred other issues that could occur.
The admin's out-of-warantee windows-XP desktop can be removed from the
equation if the enterprise has some automation, so let's just assume that
the other end is secure, okay?

    > All in all, it actually sounds to me like we may as well be not doing
    > anything here :) If admin's threat model allows for using the
    > self-generated self-signed cert, early expiration may be worse UX than
    > today - and if the threat model doesn't allow for that, the cert will
    > be replaced anyway.

+1
Changing from 10 years to 825 days is probably an acceptable move.
Maybe it should be a yocto-build-time configuration option.


--=-=-=
Content-Type: text/plain
Content-Disposition: inline
Content-Description: Signature

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [




--=-=-=--

--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl5WdAEACgkQgItw+93Q
3WXU9gf/SbQ73K4LzD1noKxQowqSDBMLPakvtWZOsOJ3mDphUoe4+pTIVtphKdj1
1OTrG/1FtD4BGmK9JB+GuoCONM9B/fsUMmcfLWEdPKjlHZSgA9cI54lkx3wz+Z2+
IevZTjxNWRBSoIeRluf+kuJA9KMi+Kn9aZaB8QrE6Mo3mNXFibS7sPVYByNikjV1
pFbhSpeSxLKAQBd2Y050FCV6o665XjvG+Db6pD4OL3H9BQMS+7sOJ9GlpkznGIHZ
AlaUcQ5t0cfZtFRcRf3EWvd7ZYurxS5pzXZjNlx2dK86aVWZDbZ1wKI4ttb7cAe5
Jfx8E17xOzoODzvlnt9GSrOTzdrQUQ==
=269P
-----END PGP SIGNATURE-----
--==-=-=--
