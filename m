Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B954A141598
	for <lists+openbmc@lfdr.de>; Sat, 18 Jan 2020 03:39:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4802Fz1KP9zDr1F
	for <lists+openbmc@lfdr.de>; Sat, 18 Jan 2020 13:39:51 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4802FG1c08zDqj4
 for <openbmc@lists.ozlabs.org>; Sat, 18 Jan 2020 13:39:10 +1100 (AEDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id A24D13897D
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 21:38:36 -0500 (EST)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 5019910FC
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 21:39:05 -0500 (EST)
From: Michael Richardson <mcr@sandelman.ca>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Summarizing Meeting on BMC Aggregation
In-Reply-To: <CAH1kD+ZLYHqc8jVWVYjCPCRC3eanb4EZ7xgW_-sOLm2GhnSfzg@mail.gmail.com>
References: <CAH1kD+ZLYHqc8jVWVYjCPCRC3eanb4EZ7xgW_-sOLm2GhnSfzg@mail.gmail.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 24.5.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Fri, 17 Jan 2020 21:39:05 -0500
Message-ID: <23327.1579315145@localhost>
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


Thank for the interesting call yesterday.
I don't think I will have the time to attend regularly, but we'll see.
I have code to write, ya know :-)

Richard Hanley <rhanley@google.com> wrote:
    > The definition of a machine here is relatively opaque, but it can be
    > thought of as an atomic physical unit for management. A machine is
    > then split into multiple domains, each of which is managed by some
    > management controller (most cases it would be a BMC). There may be
    > some cases where a domain has multiple BMCs for redundancy.

    > Domains are relatively close to each other physically. Sometimes they
    > will be in the same chassis/enclosure, while other cases they will be
    > in an adjacent tray.

    > One key point that was discussed in this meeting was that the data and
    > transport of these domains is relatively unconstrained. Domains may be
    > connected to the aggregator via a LAN, but there is a community need
    > to support other transports like SMBus and PCIe.

If I were designing this, I would define standard way to transport IPv6 over
SMBus and PCIe, and then use IPv6 Link-Local addresses, and call it all a
LAN.  This has three effects in my opinion:
1) all transports need and get security resulting in fewer bugs
2) no need to re-invent TCP or HTTPS
3) directly connected hosts have less inherent privilege.

The IETF ANIMA working group
    https://datatracker.ietf.org/wg/anima/documents/
has created an O&M mechanism called the Autonomic Control Plane.
It has a discovery and negotiation protocol (GRASP), and as well as
onboarding (BRSKI).  It is designed for exactly this kind of use.
https://datatracker.ietf.org/doc/rfc8368/  describes some of the high-level
design goals.  The documents are stuck in the RFC-EDITOR queue due to
cross-references, but will get RFC-numbers very soon.
I am one of the authors of BRSKI.

In addition, the IETF Remote Attestation WG (RATS), at:
   https://datatracker.ietf.org/wg/rats/documents/

has been working on an architectural document.   (We have people from TCG,
FIDO, Android, Global Platform, ...)   Actually, we have a few such
documents, and we are merging them, the live process visible at:
   https://github.com/ietf-rats-wg/architecture

In particular, I point you to this pull request which was discussed this past
Tuesday:
  https://github.com/ietf-rats-wg/architecture/pull/13/files#diff-daea007baaef3c42f94e996f540dcd76

Doesn't the composite device use case look very much like the aggregator
situation you are trying to create?  If you care about attestation (and I
think you said you did), then it seems like there are significant synergies
here.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [



--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl4ib8kACgkQgItw+93Q
3WVTlAf9HGW17IuLTWc+Cn4B7QUvbS0i0yD1z6NyB83Fvb6Q72g3MhU+343QE678
5VrAnbOutzl4JDqmbYX09LkYKPO2spReSxzQ/9gqOJgsJMfgQDmXziKyN9MQhjWN
nYWfnbRVp2eFYIRoIuoOP/BDsU94BDxjCI/SAgss6WoN3W9f6hbgyHCQKfbmkc0Z
2SDkyYTaI9Mrc7ILt5XNcCpcjyzE50gI8NCIQ1WGQ3BXc/QSH4pdX41TtSkmLX22
fDgvREySoqblARHZ20VWXWO4VNXh+Mb3gSMX3PbIo+ddWOSyC6qp1fF23KjYObb4
kqu53UoxhV3XJJuzNEFMG9RP6of45w==
=N5jw
-----END PGP SIGNATURE-----
--=-=-=--
