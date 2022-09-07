Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5686B5B5A76
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 14:50:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR60C1T4Tz3bWB
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 22:50:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sandelman.ca (client-ip=176.58.120.209; helo=relay.sandelman.ca; envelope-from=mcr+ietf@sandelman.ca; receiver=<UNKNOWN>)
X-Greylist: delayed 86164 seconds by postgrey-1.36 at boromir; Wed, 07 Sep 2022 18:01:40 AEST
Received: from relay.sandelman.ca (relay.cooperix.net [176.58.120.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMvpr41jzz2yn3
	for <openbmc@lists.ozlabs.org>; Wed,  7 Sep 2022 18:01:38 +1000 (AEST)
Received: from dooku.sandelman.ca (unknown [46.183.103.17])
	by relay.sandelman.ca (Postfix) with ESMTPS id 7FA0E1F47B;
	Wed,  7 Sep 2022 08:01:30 +0000 (UTC)
Received: by dooku.sandelman.ca (Postfix, from userid 179)
	id C70451A0245; Wed,  7 Sep 2022 04:01:30 -0400 (EDT)
Received: from dooku (localhost [127.0.0.1])
	by dooku.sandelman.ca (Postfix) with ESMTP id C54891A013F;
	Wed,  7 Sep 2022 04:01:30 -0400 (EDT)
From: Michael Richardson <mcr+ietf@sandelman.ca>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
In-reply-to: <YxdF9cXGRhOjbVu/@heinlein.stwcx.org.github.beta.tailscale.net>
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com> <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com> <YxCWpNZ+O89B+ulA@heinlein.stwcx.org.github.beta.tailscale.net> <5723faf6-66c3-1793-699d-ffbf61bf3268@linux.ibm.com> <YxdF9cXGRhOjbVu/@heinlein.stwcx.org.github.beta.tailscale.net>
Comments: In-reply-to Patrick Williams <patrick@stwcx.xyz>
   message dated "Tue, 06 Sep 2022 08:07:01 -0500."
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 27.1
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 07 Sep 2022 04:01:30 -0400
Message-ID: <37459.1662537690@dooku>
X-Mailman-Approved-At: Mon, 12 Sep 2022 22:41:54 +1000
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain


Patrick Williams <patrick@stwcx.xyz> wrote:
    > I could be wrong on Keylime.  My initial reaction is that it is going
    > to be difficult to get a broad install base on the Verifier side.

Presumably customer that want to have measured boot for their BMC have the
incentive to install such a system.  I know that IBM has sufficiently people
involved with TCG that they ought to already have product that can do this,
but I don't know the product names.

--
Michael Richardson <mcr+IETF@sandelman.ca>, Sandelman Software Works
 -= IPv6 IoT consulting =-




--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEERK+9HEcJHTJ9UqTMlUzhVv38QpAFAmMYT9oACgkQlUzhVv38
QpDutwf+JqPVX2LzXFNNkDN7O/15Dfdy2Z31BfcWm1PHKNZPdSBWTyy+ubHcXCnY
155LZ/MPU/TTkG8NDUhty8ybXZCrhrT996eNyHhppmQNqvpvrHWFJ9VzOa5K9pn4
r4CvJpIustafnFNm/+T7j5V+WwlwJJ6EhV50zmGjZMxhCjj5yRQ5lQjI4BLI0/2+
sJbxyU87oFtw7DnPP2xfdFL67yQoztPOG56zGFnt3klNaS8eEWOVJdVvfioU2QpL
ryWcB/rHeA6E00DFDCYD0fgI/z35dFaJdJbr3kuGmu5f+hFtDwWvoUUJkYbO0WNY
YccVdTwOiTGJrWcru5wJjbZEnBxssw==
=bZdR
-----END PGP SIGNATURE-----
--=-=-=--
