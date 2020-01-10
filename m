Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0421E1365E2
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 04:48:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47v88Y1JCQzDqc7
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 14:48:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=209.87.249.19; helo=tuna.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sandelman.ca
X-Greylist: delayed 408 seconds by postgrey-1.36 at bilbo;
 Fri, 10 Jan 2020 14:47:33 AEDT
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47v87n4bV9zDqbG
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 14:47:31 +1100 (AEDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id DC6BC3897D;
 Thu,  9 Jan 2020 22:39:43 -0500 (EST)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 06A3E104F;
 Thu,  9 Jan 2020 22:40:06 -0500 (EST)
From: Michael Richardson <mcr@sandelman.ca>
To: "Andrew Jeffery" <andrew@aj.id.au>
Subject: Re: MCTP over PCI on AST2500
In-Reply-To: <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 24.5.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Thu, 09 Jan 2020 22:40:06 -0500
Message-ID: <29717.1578627606@localhost>
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


Andrew Jeffery <andrew@aj.id.au> wrote:
    > On Sat, 21 Dec 2019, at 10:45, Khetan, Sharad wrote:
    >> Hi Andrew,
    >> Sorry for late response.
    >> The plan is to have MCTP in user space.
    >>

    > How are you handling this then? mmap()'ing the BAR from sysfs?

    > I plan to get back to implementing in-kernel socket-based MCTP shortly.
    > Unfortunately it slipped back a little in my priority list late last year. I'd be
    > interested in your feedback on the proposal when I get something written
    > down.

I have read through a few MCTP documents on dtmf.org, but they either dealt
with too highlevel (SMBIOS tables), or too low-level (MCTP over UART).

Is there something that I can read that explains the underlying PCI
relationships between the BMC and the host CPU's PCI/bridges?
Maybe I just need to read the AST2500 datasheet?

(I was at one point quite knowledgeable about PCI, having designed adapter
cards with multiple targets and dealt with swizzling, and BARs, etc.)

What I heard is that for typical AST2500 based BMCs, the host CPU can map the
entire address space of the AST2500, and this rather concerns me.
I had rather expected some kind of mailbox system in a specialized ram that
both systems could use to exchange data.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [



--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl4X8hUACgkQgItw+93Q
3WXKLgf+Pmgu9jVdkV+wD7Al5VRMM5o6xM3C1vD/b1hxPkEefGy77h0x3xVijYhe
zl1iBAxbwUgP73TkYSrzSbWMVh8BZ25nJ2NZhrKUqtcB2QWkT5gCGqhPO2BLqEyz
MCMAwKYO5xAjya3F/cIJgZRJ0LDOw6huFF7+XqvJQbzYWcHsvxGGFHnqVRf+qRK2
l87o0o/qc0H7G4YuTCo6/M5rOTQvHPw74MR38yb4sNXoqEZ9/Q6xlGka0pyFYFkt
7dX64fXHioV4xCoZmlyo9p+SdiaivUtuEX8NtRw55iX+lfGwGDp8f+mjLZtAi7T1
5EldMGipN1Zp2MDgIALHtfyHyftXRw==
=nfy3
-----END PGP SIGNATURE-----
--=-=-=--
