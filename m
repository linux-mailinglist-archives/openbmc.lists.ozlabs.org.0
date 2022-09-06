Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAA45B5A74
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 14:50:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR5zm2R3Jz30Ly
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 22:50:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sandelman.ca (client-ip=2a01:7e00:e000:2bb::1; helo=relay.sandelman.ca; envelope-from=mcr+ietf@sandelman.ca; receiver=<UNKNOWN>)
X-Greylist: delayed 388 seconds by postgrey-1.36 at boromir; Tue, 06 Sep 2022 18:12:10 AEST
Received: from relay.sandelman.ca (relay.cooperix.net [IPv6:2a01:7e00:e000:2bb::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMJ5Q1KZBz2xKV
	for <openbmc@lists.ozlabs.org>; Tue,  6 Sep 2022 18:12:08 +1000 (AEST)
Received: from dooku.sandelman.ca (ws117.exhibition.haw-hamburg.de [141.22.222.117])
	by relay.sandelman.ca (Postfix) with ESMTPS id 472191F47B;
	Tue,  6 Sep 2022 08:05:29 +0000 (UTC)
Received: by dooku.sandelman.ca (Postfix, from userid 179)
	id 196A01A0246; Tue,  6 Sep 2022 04:05:19 -0400 (EDT)
Received: from dooku (localhost [127.0.0.1])
	by dooku.sandelman.ca (Postfix) with ESMTP id 17AC61A0245;
	Tue,  6 Sep 2022 04:05:19 -0400 (EDT)
From: Michael Richardson <mcr+ietf@sandelman.ca>
To: Joseph Reynolds <jrey@linux.ibm.com>,
    Patrick Williams <patrick@stwcx.xyz>,
    openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
In-reply-to: <5723faf6-66c3-1793-699d-ffbf61bf3268@linux.ibm.com>
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com> <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com> <YxCWpNZ+O89B+ulA@heinlein.stwcx.org.github.beta.tailscale.net> <5723faf6-66c3-1793-699d-ffbf61bf3268@linux.ibm.com>
Comments: In-reply-to Joseph Reynolds <jrey@linux.ibm.com>
   message dated "Mon, 05 Sep 2022 13:56:39 -0500."
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 27.1
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 06 Sep 2022 04:05:19 -0400
Message-ID: <32094.1662451519@dooku>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Joseph Reynolds <jrey@linux.ibm.com> wrote:
    > In my limited comprehension, the end-to-end flow is:
    > 1. The BMC boots up and extends measurements into its TPM.
=20=20=20=20
    > 2. the BMC admin configures the BMC's Keylime Agent.=C2=A0 That is, s=
tarts the
    > "Keylime Agent service", and provisions certificates, etc.

Number 2 has to occur, but only once, while you have put it into a regular =
flow.

    > 3. A network agent (a "Keylime Verifier") contacts the BMC's Keylime =
Agent
    > and asks for the measurements.=C2=A0 The Agent that queries the TPM a=
nd provides
    > the measurements.

Yes, but maybe not for anyone that asks.
The measurement (Evidence) needs to be signed by the TPM (that's part of th=
e protocol).
There is a freshness requirement, for instance the Verifier can provide a
nonce through the protocol to be included in the signed Evidence.  Another
way is to use a TLS Extractor (TLS-Unique in TLS <1.3) to get a key.

You can read more about the architecture at:
    https://www.ietf.org/archive/id/draft-ietf-rats-architecture-21.html#na=
me-architectural-overview
(Yes, I'm a lead author)
I've been really busy on Wednesdays, so I haven't joined lately, but I could
if you want to talk more about this stuff.

    > Redfish has specs for getting server TPM measurements, but does not h=
ave any
    > specs for getting BMC TPM measurements.
    > Because of this, the group doing the work is proposing for the BMC's =
Keylime
    > Agent service to open a separate port, and to not use Redfish to get =
the
    > actual measurements.=C2=A0 In support of this view: there are Keylime=
 verifiers
    > already available to use this new port, but there are no Keylime veri=
fiers to
    > use Redfish.

Sounds accurate, but it seems like doing it through redfish is entirely
reasonable to me.

    > It should be clear from the paragraphs above that the intended use ca=
se is
    > for a client server model, not a network of peers.=C2=A0 The Keylime =
Verifier
    > client running on the BMC's management network contacts the Keylime A=
gent
    > running on the BMC.=C2=A0 The mutual-TLS method is used for authentic=
ation.

    > Keylime is written in Python.=C2=A0 I think the the idea was to eithe=
r port that
    > version, or to use the new implementation in Rust.=C2=A0 We did not d=
iscuss any
    > difficulties in image size increase due to Python or in getting the R=
ust
    > language environment ported to bitbake.

I imagine that the bitbake recipe is probably the critical path, but I also
suspect that Rust is being used somewhere with bitbake.



=2D-=20
Michael Richardson <mcr+IETF@sandelman.ca>, Sandelman Software Works
 -=3D IPv6 IoT consulting =3D-




--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEERK+9HEcJHTJ9UqTMlUzhVv38QpAFAmMW/z4ACgkQlUzhVv38
QpCuFggAmS48XLxFEmjzXa21lICGOe20eMQBVV9cCSOgY4ukrcd8a1XvXbtaAu49
QmLfejthiy+Yxu07KVcnqdyOzTL4GyU6NlJfaere5mB9MuiQb6qDa84nRflqGHWt
5ZPzLR1NBaCOmMW8NYXn0xUNOkFV2UURk9UEtSM+H44ep5VWJWEIaNNqeFPYNqCs
TLe5HknwriTxu6nlXoaIQzJmsF9PL2F9pYhf0TgCW2SLMH42j80j5NyfOWdUkl4S
j/12Am0JMMbz/SrA1rn8ytaeEfrbYhc+lD6w2fm1L+KpVQoZiAVrvRrl9EvPvhBz
RIKDaQtwXE+BPw/+gQLFwGFq+Cz12A==
=BUso
-----END PGP SIGNATURE-----
--=-=-=--
