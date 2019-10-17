Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE412DA96B
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 11:56:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46v4M46RYtzDqnB
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 20:56:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=176.58.120.209; helo=relay.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
X-Greylist: delayed 5781 seconds by postgrey-1.36 at bilbo;
 Thu, 17 Oct 2019 20:56:09 AEDT
Received: from relay.sandelman.ca (relay.cooperix.net [176.58.120.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46v4LK0WgFzDqHg
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 20:56:05 +1100 (AEDT)
Received: from dooku.sandelman.ca (dhcp-25-21.mtg.ripe.net [193.0.25.21])
 by relay.sandelman.ca (Postfix) with ESMTPS id 417671F455
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 09:56:02 +0000 (UTC)
Received: by dooku.sandelman.ca (Postfix, from userid 179)
 id 386D410B6; Thu, 17 Oct 2019 11:56:56 +0200 (CEST)
From: Michael Richardson <mcr@sandelman.ca>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: x86-power-control
In-reply-to: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
Comments: In-reply-to Vijay Khemka <vijaykhemka@fb.com>
 message dated "Thu, 17 Oct 2019 01:13:53 -0000."
X-Mailer: MH-E 8.6; nmh 1.6; GNU Emacs 24.5.1
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Thu, 17 Oct 2019 11:56:56 +0200
Message-ID: <21807.1571306216@dooku.sandelman.ca>
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


Vijay Khemka <vijaykhemka@fb.com> wrote:
    > 1.  Name of GPIO line, this should be configurable and should also
    > support GPIO number if user doesn=E2=80=99t want to define line name =
in DTS.

Why in a target system wouldn't naming it in DTS be the most reliable and
most easily accessible mechanism?  I can see that in development being able=
 to define
things helps, but it is not like the production systems would have wire-wrap
where the GPIO pin might change.

    > 2.  All delay time as it varies for us per platform like
    > powerPulseTimeMs is 1 sec instead of 200 ms and powerPulseTimeMs is 6
    > sec instead of 15 sec and these varies for different FB platforms.

    > 3.  GPIO lines to be monitored, not everyone needs SIO_S5 monitoring =
or NMI_OUT etc.
    > 4.  Enable/disable passthrough

    > Please suggest what is the best way to make these changes. I am ready
    > to work on this to make required change. We can have these config
    > option defined in entity manager or we can accept a new json file for
    > this configuration.

I take it that this isn't a configuration that should be visible to
operators, just to integrators.

=2D-
]               Never tell me the odds!                 | ipv6 mesh network=
s [
]   Michael Richardson, Sandelman Software Works        | network architect=
  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails  =
  [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEERK+9HEcJHTJ9UqTMlUzhVv38QpAFAl2oOucACgkQlUzhVv38
QpCcOgf/Xh5erKU7lZT1Om0adxEDz01RG2pwSiHg4XMd6VBFtuk048mO0/rhAkc/
R0Za3o8yTEVBk7lu/CszHdiAbIt+hTE/KmUpiOKBVTqSjTZJamRWZ3Al+jc+srwj
4ax3/sRhBbTi4hbLFQp6X3nUTXa9Uq39CgBZ+55TopzTs+C6G8GZ0kmvDo+1hY6i
B3eBYOgfj5TS5K8V6HcbuDW6vMi+LbrxYTnnGC3G5d6SfULGEeO3YsarHRYOOzb2
gZKD4oLVDW6oTLI8ySD6jJzxInMwiJWMx8QMFiPFCVW5GYktt6OKKYY8v+HDlI3O
I57NHiYkwYd4kynctvvYteSnTklAwQ==
=4mN7
-----END PGP SIGNATURE-----
--=-=-=--
