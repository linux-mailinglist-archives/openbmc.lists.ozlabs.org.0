Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5012513717D
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 16:39:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vRx73GqKzDqhN
	for <lists+openbmc@lfdr.de>; Sat, 11 Jan 2020 02:39:23 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vRwH5sKTzDqcl
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jan 2020 02:38:36 +1100 (AEDT)
Received: from sandelman.ca (obiwan.sandelman.ca [209.87.249.21])
 by tuna.sandelman.ca (Postfix) with ESMTP id D7FDD3897D;
 Fri, 10 Jan 2020 10:37:45 -0500 (EST)
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id 6BE693D2;
 Fri, 10 Jan 2020 10:38:08 -0500 (EST)
From: Michael Richardson <mcr@sandelman.ca>
To: "Andrew Jeffery" <andrew@aj.id.au>
Subject: Re: MCTP over PCI on AST2500
In-Reply-To: <a21918d0-d5ba-4959-82b9-3193748fcf72@www.fastmail.com>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
 <29717.1578627606@localhost>
 <a21918d0-d5ba-4959-82b9-3193748fcf72@www.fastmail.com>
X-Mailer: MH-E 8.6; nmh 1.7+dev; GNU Emacs 24.5.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Fri, 10 Jan 2020 10:38:08 -0500
Message-ID: <27265.1578670688@localhost>
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
    >> I have read through a few MCTP documents on dtmf.org, but they either dealt
    >> with too highlevel (SMBIOS tables), or too low-level (MCTP over UART).
    >>
    >> Is there something that I can read that explains the underlying PCI
    >> relationships between the BMC and the host CPU's PCI/bridges?
    >> Maybe I just need to read the AST2500 datasheet?

    > Beware that I brainfarted in my reply above, so before I go further:

    > https://lists.ozlabs.org/pipermail/openbmc/2020-January/020141.html

yes, I got that part :-)

    > But to answer your questions, you should read the MCTP Base Specification
    > (DSP0236)[1] and MCTP PCIe VDM Transport Binding Specification (DSP0238)[2]
    > and reference the MCTP Controller section of the ASPEED datasheets.

    > [1] https://www.dmtf.org/sites/default/files/standards/documents/DSP0236_1.3.0.pdf
    > [2] https://www.dmtf.org/sites/default/files/standards/documents/DSP0238_1.1.0.pdf

Thank you, this is what I was looking for.

    >> (I was at one point quite knowledgeable about PCI, having designed adapter
    >> cards with multiple targets and dealt with swizzling, and BARs, etc.)
    >>
    >> What I heard is that for typical AST2500 based BMCs, the host CPU can map the
    >> entire address space of the AST2500, and this rather concerns me.

    > Yes, this is indeed concerning. It has its own CVE:

    > https://nvd.nist.gov/vuln/detail/CVE-2019-6260

I was concerned that it really was this bad.

    > OpenBMC provides mitigations through the `phosphor-isolation` distro feature.
    > The feature enables this u-boot patch that disables all of the backdoors early in
    > u-boot:

    > https://github.com/openbmc/meta-phosphor/blob/master/aspeed-layer/recipes-bsp/u-boot/files/0001-aspeed-Disable-unnecessary-features.patch

    > The distro feature is opt-in as it has impacts beyond simply disabling the backdoors
    > (there are some unfortunate side-effects to enforcing confidentiality of the BMC's
    > address space.

okay, so the bridge gets turned off, and it has some other effects.
What are the side effects?  I'm guessing by the inclusion of the VGA defines
in that board init that they are video related.

I can see that doing this in uboot is the earliest possible; but in most
cases the main CPU has no power until the BMC boots, so it can't attack until
the BMC is running.  Are there some situations in which the BMC (or the P2A
bridge) could get reset without the host CPU also being reset?

    >> I had rather expected some kind of mailbox system in a specialized ram that
    >> both systems could use to exchange data.

    > Well, a few of us at IBM have cooked up an LPC binding that is not yet standardised
    > but does exactly this. We use a KCS device to send byte-sized control commands
    > and interrupts between the host and the BMC, and use a reserved memory region
    > mapped to the LPC firmware space to transfer message data. I don't think we've
    > published the spec yet, but I can put the work in to get it onto the list.

That's cool, I'm glad that you've gone this way.


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAl4YmmAACgkQgItw+93Q
3WVuuwf/SwZJXJelVdun+SdrR8KUlMrs58uyIwSjBEkSx0khKHjieSUtXp9Unv6u
R90a7zGNjfqZbuW/e96VKPnPqs/6bsp/MS5HNgW0WHWuZyHM9eApTFOIkYeIlV5j
HmcrVOnTk7I3L1YFhViuYlNo+aLj+UNqEGFLsxd8Ery5IN9DNRO3QCyGCke5svOq
M2qSUmzraSEkAmXxElRthJD6vkoACTjlV3ckGh/zLOrJlYeEXzPROAMwjO7KKjZR
3ZWR0BU9Tg1GiPHar87PEAeASRIa1hPJqa895eG6qCybhjT3M1xW9mG+9glqMmRc
EaJ1KD0TpGAiVwgacpHBpz58hCXh5g==
=sxyS
-----END PGP SIGNATURE-----
--=-=-=--
