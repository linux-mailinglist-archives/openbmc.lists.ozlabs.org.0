Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A641397EC
	for <lists+openbmc@lfdr.de>; Mon, 13 Jan 2020 18:39:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xLRp3DlbzDqFs
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 04:39:02 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xKnS1TlbzDqDt
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 04:09:10 +1100 (AEDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id 482893897D;
 Mon, 13 Jan 2020 12:08:37 -0500 (EST)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 5AEEEA3B;
 Mon, 13 Jan 2020 12:09:02 -0500 (EST)
From: Michael Richardson <mcr@sandelman.ca>
To: "Andrew Jeffery" <andrew@aj.id.au>
Subject: Re: MCTP over PCI on AST2500
In-Reply-To: <b33a4247-e76d-46bb-9853-cf246f55d6bf@www.fastmail.com>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
 <29717.1578627606@localhost>
 <a21918d0-d5ba-4959-82b9-3193748fcf72@www.fastmail.com>
 <27265.1578670688@localhost>
 <b33a4247-e76d-46bb-9853-cf246f55d6bf@www.fastmail.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 24.5.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 13 Jan 2020 12:09:02 -0500
Message-ID: <21526.1578935342@localhost>
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
Cc: Sharad Khetan <sharad.khetan@intel.com>, rgrs <rgrs@protonmail.com>,
 Vijay Khemka <vijaykhemka@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Andrew Jeffery <andrew@aj.id.au> wrote:
    > On Sat, 11 Jan 2020, at 02:08, Michael Richardson wrote:
    >>=20
    >> Andrew Jeffery <andrew@aj.id.au> wrote:
    >> >=20
    >> https://github.com/openbmc/meta-phosphor/blob/master/aspeed-layer/re=
cipes-bsp/u-boot/files/0001-aspeed-Disable-unnecessary-features.patch
    >>=20
    >> > The distro feature is opt-in as it has impacts beyond simply
    >> disabling the backdoors > (there are some unfortunate side-effects to
    >> enforcing confidentiality of the BMC's > address space.
    >>=20
    >> okay, so the bridge gets turned off, and it has some other effects.
    >> What are the side effects?  I'm guessing by the inclusion of the VGA
    >> defines in that board init that they are video related.

    > We have a slightly more detailed description here:

    > https://github.com/openbmc/openbmc/issues/3475

    > With respect to PCIe, disabling the P2A causes the host kernel to fail
    > probing the AST DRM driver on kernels before 4.12 (from memory). This
    > impacts POWER more than other host architectures due to invalid
    > accesses triggering EEH.

Thanks, that description was very useful... very good job here.

    > With respect to LPC, the issue is largely that the bit in the LPC
    > controller to disable the iLPC2AHB bridge only disables write access,
    > the host can still continue to issues arbitrary reads of the BMC
    > address space.

That's an interesting challenge.
If it can read, then it can read crypto-secrets (private keys and session k=
eys).
Does the AST have any internal places which aren't visible externally?=20=20
I can see how this feature was really useful to debugging BMC code :-)
I wish I could answer this question myself, but I haven't found a public sp=
ec
for the AST yet.  Is the NDA process difficult, I wonder.

    > To prevent arbitrary reads the BMC must disable the
    > entire SuperIO controller, which knocks out the ability to configure
    > UARTs, GPIOs, and the LPC mailbox among other functionality. On some
    > platforms disabling SuperIO is feasible (POWER based), but others may
    > require some of this functionality be present.

Yes, I can see that seems like crippling functionality.

=2D-=20
]               Never tell me the odds!                 | ipv6 mesh network=
s [
]   Michael Richardson, Sandelman Software Works        |    IoT architect =
  [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails  =
  [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl4cpC4ACgkQgItw+93Q
3WXcUAf/QzIdRiRWyJ/H0xvYe9XF4Oab1BDbf+VDTzYkc+ykmYIoeKytsr+C3fVS
lG3Ay74MMdg/D3lOldsAROLWOefDxpu5tA004plKBxzWbw1YsR9Fr+wH1S5WWAlo
QZHEhDC8vs45aqtB/YFDr4Lf6Vsdq/tsZqLkALEWtT/aGJnePTrIwZ5KumyxN5Bh
M2VfeoNNuJtTt2/7PB4rkHVLu1+Beq/nGa9kOzjW04baimqx7If4eGCEkDOi6JZi
CDWcfHrBNkqi50PGNUWscn/WGltORzkFhWDW6mjT9i/XWW6vKQ+KL93ljM3sHKEb
oNHRnadfrCdcEPZB6oXH2Nd3xMhnDw==
=nzLE
-----END PGP SIGNATURE-----
--=-=-=--
