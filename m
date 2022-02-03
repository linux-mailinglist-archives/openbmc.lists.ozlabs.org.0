Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F774A8C63
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 20:23:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqT8j1CHxz3cCJ
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 06:23:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=2a01:7e00:e000:2bb::1;
 helo=relay.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
X-Greylist: delayed 556 seconds by postgrey-1.36 at boromir;
 Fri, 04 Feb 2022 06:22:48 AEDT
Received: from relay.sandelman.ca (relay.cooperix.net
 [IPv6:2a01:7e00:e000:2bb::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqT8S622Nz2xC6
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 06:22:47 +1100 (AEDT)
Received: from dooku.sandelman.ca (ipv6.dooku.sandelman.ca
 [IPv6:2607:f0b0:f:6::1])
 by relay.sandelman.ca (Postfix) with ESMTPS id E52D01F44B
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 19:13:20 +0000 (UTC)
Received: by dooku.sandelman.ca (Postfix, from userid 179)
 id 9F0EE1A0406; Thu,  3 Feb 2022 14:13:17 -0500 (EST)
From: Michael Richardson <mcr@sandelman.ca>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Security Working Group meeting - Wednesday February 2
In-reply-to: <de58b515-0f0b-4e49-4955-f9144896d313@linux.ibm.com>
References: <5516f17c-5fb4-875f-fae1-00d86923bdae@linux.ibm.com>
 <de58b515-0f0b-4e49-4955-f9144896d313@linux.ibm.com>
Comments: In-reply-to Joseph Reynolds <jrey@linux.ibm.com>
 message dated "Wed, 02 Feb 2022 15:21:21 -0600."
X-Mailer: MH-E 8.6+git; nmh 1.7.1; GNU Emacs 26.3
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 03 Feb 2022 14:13:17 -0500
Message-ID: <231809.1643915597@dooku>
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


Thanks for the great notes!

It would be good if this commit noted that socsec-sign is a tool that comes from AST.
Perhaps I can figure out how to do the gerrit dance and make the comments there.

It would also be good if the document which contains the details was noted in
the commit by name and/or document ID.  Yes, as I understand it's under NDA
but at least, if someone comes along and wants details, they'll know
exactly what they want details on.

In order to support signing the uboot images, and for the uboot image to
verify the flatenned image tree https://elinux.org/images/f/f4/Elc2013_Fernandes.pdf
then the manufacturer needs to maintain some set of signing keys.
There are many ways to do this.  Some time ago, I started an ontology
document about how to describe the different ways.

Your comments would be welcome on:
   https://github.com/mcr/idevid-security-considerations
and:
   https://datatracker.ietf.org/doc/draft-richardson-t2trg-idevid-considerations/

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        | network architect  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [





--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEow/1qDVgAbWL2zxYcAKuwszYgEMFAmH8KU0ACgkQcAKuwszY
gENLqQv/Zh9ozOK4ssjoYTKJOB4KTVoNLQ0Z8EwPIXjQf137ungja0CL7GsgIqvj
57YBTHBco22oa/aneiiDTrX/tRfF8nixhNm9hhWVrfc5PwGy2ibaelboYim6RX5+
z9RIyD1tB7atBjTpCsnMDDTP7MBYnAqZTlmwCrjlJ8C5vGAigYrQpucbihumq/7F
cktPMBuU8LUKTochuTnK+OrjWDBe73b9Pe411GhyM2HCyQWi/BbJyN6UxVjnHSyx
Q3iIqx/+9OVB4nZes+sG0tDYYKY69XNAUcaDTaF/UVfPm+kcwEw7p4fvCwHUTzJ+
sN75aWT0OnRI+T0TQoVvcbNs0EbYDb29IQ0brOiyV2Y652I7I+Akrk5OU436piN0
71UxMrKmaLo4OJS4deFQ1VlFtXqdNgfcibwcvKRGZGYfJZxDRzD80pBsgfYjtdvM
FuIk/H0YlLPAPBMDkn/zuRFdwMCueWa5hNbU7kED7le0z6MQ6BRItohmgeiLz0vl
g1MHTRBc
=n3iN
-----END PGP SIGNATURE-----
--=-=-=--
