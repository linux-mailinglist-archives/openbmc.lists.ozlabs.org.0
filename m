Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE50916AB1F
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 17:15:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48R6bx2f4NzDqCg
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 03:15:25 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48R6Zx2sT5zDqRy
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 03:14:33 +1100 (AEDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id 9262D3897C
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 11:13:20 -0500 (EST)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 16A585A4
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 11:14:20 -0500 (EST)
From: Michael Richardson <mcr@sandelman.ca>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Security Working Group meeting - this Wednesday February 19 -
 summary results
In-Reply-To: <20200220162633.GB41328@patrickw3-mbp.dhcp.thefacebook.com>
References: <b9170918-0937-714a-470e-cb41e1e74b63@linux.ibm.com>
 <f4d9d6f6-277e-8c8b-6b5c-d0577eaa82cc@linux.ibm.com>
 <20200220162633.GB41328@patrickw3-mbp.dhcp.thefacebook.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 25.1.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 24 Feb 2020 11:14:20 -0500
Message-ID: <20306.1582560860@localhost>
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


Patrick Williams <patrick@stwcx.xyz> wrote:
    >> > 6. (Bruce via email):=C2=A0 BMCWeb Cert valid for 10 years -
    >> > https://lists.ozlabs.org/pipermail/openbmc/2020-February/020488.ht=
ml=C2=A0=E2=80=A8
    >>
    >> Change BMCweb=E2=80=99s default self-signed cert to a maximum of 825=
 days.=C2=A0
    >> Recommend 30 days.
    >>
    >> When this is done, if BMCWeb generates a self-signed cert, and it is=
 not
    >> replaced, and the BMC=E2=80=99s time is sane, then browsers that con=
nect to BMCWeb
    >> will start to complain after 30 days.
    >>
    >> The recovery is: The BMC admin should install a valid BMCWeb site id=
entity
    >> cert, then clients can re-connect to the BMC. (This will serve the u=
pdated
    >> cert and make the browser happy.)
    >>
    >> The =E2=80=9CBMC Admin guide=E2=80=9D should talk about installing y=
our own cert.
    >>
    >> See docs here: https://github.com/openbmc/bmcweb/#configuration
    >>
    >> Ass code here: https://github.com/openbmc/bmcweb/blob/91243c3b28b1df=
66e682f5a3ee96341fdc516b5a/include/ssl_key_handler.hpp#L205
    >>
    >> Will there be a warning for the BMC admin (that the BMCWeb site cert=
 will
    >> expire soon)?=C2=A0 (And don=E2=80=99t rely on a warning from the br=
owser itself.)

    > If I read this correctly, the side-effect of this proposed change is:

    > - If I leave my BMC running for 30 days without it crashing, the
    > certificate it presents will have become expired and no longer
    > valid.

My reading of the code says is that in ensureOpensslKeyPresentAndValid() th=
at
if the certificate is invalid, according to X509_verify_cert() that a new
self-signed certificate will be generated.
So, I agree that if the BMC does not reboot within the self-signed
certificate time, then it will expire, and this will be surprising.

{A system could *easily* get turned on within a group of several hundred, a=
nd
nobody gets around to noticing that it wasn't cabled correctly for 30 days
until one gets to the end of the onboarding process and asks why we bought
746 servers, and only onboarded 745 machines.}

So, this is probably rather wrong to limit to 30 days.

a) Only a self-signed certificate that was locally generated should be repl=
aced.
   Replacing an administrator installed certificate because the clock was w=
rong
   is most likely wrong.

b) As long as we have this logic, we might as well do this check before
   accepting any HTTPS connection, perhaps with a do this at most once a day
   logic.     There is no advantage of expiring a self-signed certificate
   quickly in my opinion.


The concern about the CAB rules about 825 days is probably not important for
several reasons, but if one wants to limit it to that period of time, that's
okay with me.  Changing to 30 days is not a good thing.

1) the browser is going require an exception for the certificate anyway.
   Once the self-signed certificate is pinned in the browser, keeping it for
   as long as possible is better.  Expiring after 30 days makes no sense
   here.

2) it could be that browsers will reject longer-lived certificates when
   validated by a trust anchor, but the exception likely pins whatever comes
   down, period.

3) If a BMC is any kind of vulnerable environment where certificates are
   important, then the BMC needs an automated onboarding system.
   (I have one, and I'm working on code, but it's an unfunded best effort s=
o far)

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

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl5T9lsACgkQgItw+93Q
3WWNTQgAnuXEXq2iDTxd6h8jguWemoL85s5GTiQa0XJbnmjsI/3f8SZAMpNxeF9B
OhU5UeaExD9uFRx0fRHzNyI4fiLRuYfa821sAuLocy0fBIdHUvWXSj09i42PKX5c
48/ClqfdlXO/bfkHvnw5UOkVb0qtsMeX0FCuM32Ur6Nu+0fVHzXbablETIRyzWbs
xOsT/Blrr1Fr0zOBBJ0PKLJGEMRJbN7FZndfEmQqtl+hmoM2yDv4DPAo6hGbMkpS
mtWNP0hrx9856zMwM6GN8o1wkD4afq0ja3G5vQXSXbgU+m8vnOLPJqO+lWFxdP1K
C4hgkssvvzLlBCqSluxgqlZAWybW+A==
=NPQr
-----END PGP SIGNATURE-----
--=-=-=--
