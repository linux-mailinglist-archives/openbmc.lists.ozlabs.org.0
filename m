Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8900937D46E
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 23:35:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgSl51vGTz306k
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 07:35:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=209.87.249.19; helo=tuna.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgSkr03cCz2xv6
 for <openbmc@lists.ozlabs.org>; Thu, 13 May 2021 07:35:30 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id 7FDEF39088;
 Wed, 12 May 2021 17:44:28 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 3PofTq0rgVuc; Wed, 12 May 2021 17:44:23 -0400 (EDT)
Received: from sandelman.ca (unknown [IPv6:2607:f0b0:f:2:56b2:3ff:fe0b:d84])
 by tuna.sandelman.ca (Postfix) with ESMTP id 959CE39057;
 Wed, 12 May 2021 17:44:23 -0400 (EDT)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 4D664899;
 Wed, 12 May 2021 17:35:21 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: Security Working Group - Wednesday May 12 - results
In-Reply-To: <8febdc9d-08bb-4094-9cad-7e6035c5bd71@linux.ibm.com>
References: <35156c27-e195-c238-1bb9-d20a30db3c63@linux.ibm.com>
 <8febdc9d-08bb-4094-9cad-7e6035c5bd71@linux.ibm.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 12 May 2021 17:35:21 -0400
Message-ID: <4508.1620855321@localhost>
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
    > 1. Security impacts of enabling kexec (load and optionally execute new
    > kernel) in the BMC's production kernel.=C2=A0 How does this work and =
play
    > with secure boot and with IMA?

    > 2. What are the security impacts of having the proc file system file
    > /proc/sysrq-triggerwhich can cause kernel panics which can cause the
    > BMC to terminate processing?

    > 3. In general, how can you (an operator or the BMC's host system)
    > recover a BMC which has become unresponsive, for example, because its
    > kernel processing has failed.=C2=A0 A design introduces using
    > /proc/sysrq-triggertogether with a recovery kernel installed by kexec.

This tussle between locking down the system against all intrusions, vs being
able to fix stuff when in trouble is a serious debate.

(Based upon how easily random alien technology takes over the Enterprise, we
know which way Starfleet engineers went.)

So I suggest that in most cases, the secure boot process should disable
kexec (and sysrq-trigger!), but that this should be an tunable attribute
under control of the secure boot process.

For the majority of data center, business and home users of systems, the ri=
sk
of malware in the bootpath of the BMC exceeds the risk of BMC failures, and
the cost remediation (taking a machine out of commission when there is a BM=
C problem).
Having said that, there is a Right-to-Repair concern, and I really hope that
manufacturers will provide for a hardware jumper, and for installation of n=
ew
trust anchors.

But, there is a variety of ways to do that from kernel cmdlines, to being a=
ble to
boot alternate kernels, and perhaps this could be punted down the road for
the operator that needs (#3).  Perhaps, coming back to my (humour) above, it
will in fact be Mars Rover missions or Starlink satellites that need it, and
probably, they can afford to do that work.

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

iQEzBAEBCgAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmCcShgACgkQgItw+93Q
3WXmJwf9Fa0LwJquylQh+J9AbzlorvInot/mp4b2B1+zKQ/04HNOAKpOXQjS6yIM
m7taDpnCMtb8KH0NcMniJxtCuBNmQ3fAabGrAVXUg57waBRuHjD7Z8PG55PsZWrV
L0i1yWgzzFqHYNL6gUz5J1tr9lGZnEBMZU6JM8tV114yENOhvd1yEuAgFfEhWsZw
OjBkw7itSTkQiQveAA08Ckf0YVO8bvsBxYgFuiXD4TZF6udoztlNff2UIyti9Vwx
GL3O3toK904NPAh81KMcTIaxOUe7AaY8GeFhB7zvHlRt3OOX8foTDpdWqhLCCLEF
isnWTx50ZUApk5HbUmrKxuqpMJvC9g==
=KF7y
-----END PGP SIGNATURE-----
--=-=-=--
