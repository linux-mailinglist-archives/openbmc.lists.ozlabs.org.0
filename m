Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B702D14E69E
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 01:32:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487ypP3lwSzDqc2
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 11:31:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=HqSoqrN7; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=V9IWcrvn; 
 dkim-atps=neutral
X-Greylist: delayed 532 seconds by postgrey-1.36 at bilbo;
 Fri, 31 Jan 2020 11:31:17 AEDT
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487ynd442rzDqbq
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jan 2020 11:31:17 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id CDB713355;
 Thu, 30 Jan 2020 19:22:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 30 Jan 2020 19:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=UaPBniXHw1N/31aO3swS33tD9lm
 OxuANikPUAjzmFtc=; b=HqSoqrN7q3J7PlIw/kn6dM2g6J9F5UaVcpLWdOMhSFn
 G4izQeuT/J7aMSRJzsmfMNCP+T5ZUQUqHMTqtnwxyQIiny2dsCCZtQZouiCaGTnk
 eEv9pszk5wHRdGukjBnme/41NKOloI/2K9kn7/iuW929oUBaqcr09SdohqHlQ3wV
 2Wkuey+Et5jcNQkadoaDveoO/F9mJWaisyeNWAXhXg9eb70drh5BHPLOFmu2LzUy
 sDA8WuHfvRv16n5PynvXlayes0PLFlTkg5R8RTD8HvA1qp8weg5VrkDeVXgsE1D7
 9TzS35+hjHahCuTTRh+XMoWQTRNG9ed1ejgVBOmgDvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UaPBni
 XHw1N/31aO3swS33tD9lmOxuANikPUAjzmFtc=; b=V9IWcrvnLU5PN5bk0TptMl
 +0kQUm+96/oSHlOiIaetvg9H3p9zPe5BwdQhPDM09e1DNa72A0eIFBmttR28GUCi
 VIIcYCw9kN3DTzdKNWcIofgBE+KG2U9PGEao4vjjhhEAU4YQhj4SsmhfIhYiO4tu
 jaHC7HZIhmk1t/Uf4tpX0BImwhhND9xn5sg048nY6sB900sM2fLMALxIUhyhKbvR
 FP/QWHRrn+sM/gQBenRKPN//aTtx0NXo+kuNhGpU+QbG1TS8Kn/iKM+4VR+K6KTd
 uw1fy/Sp7VexnRrFwz8P5GNhKKgegT1HvcvKI5CtnFlSgCmJjQqtytwkLVMQDoTA
 ==
X-ME-Sender: <xms:PHMzXrLGlfS9Hdj9yBAyvSpB0LGL4nQkwpyuL-FnX-vX62773qKlgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeelgddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucffohhmrghinhepshhtrggtkhgvgigthhgrnhhgvgdrtghomhen
 ucfkphepudelledrvddtuddrieegrddugedtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:PHMzXml9M-7Ys_j-u-G46JMzI8JTc2ISavS1EMPY8aNJE1n3Kwsf1g>
 <xmx:PHMzXhHE4o3effjgh-OH8lpHEOx6MDUmNVBBCKQOQnzX17vPQj_ioQ>
 <xmx:PHMzXuFEK4xRaFmnn-pzzUWgYTrRJpDPeIYOtprH7AjQIPeA_xOLuQ>
 <xmx:PHMzXglTeWd5B-TleDsQE84YKk832CzoTreUEAUbcvPwIQK5CiCNcbIFmvQ>
Received: from localhost (unknown [199.201.64.140])
 by mail.messagingengine.com (Postfix) with ESMTPA id E64343280066;
 Thu, 30 Jan 2020 19:22:19 -0500 (EST)
Date: Thu, 30 Jan 2020 16:22:18 -0800
From: Patrick Williams <patrick@stwcx.xyz>
To: Oskar Senft <osk@google.com>
Subject: Re: Bios upgrade from BMC
Message-ID: <20200131002218.GC92818@patrickw3-mbp.dhcp.thefacebook.com>
References: <8AA9282E-0D5B-4B99-BAC6-0F9E84CC5A85@fb.com>
 <20200121215056.GA59535@patrickw3-mbp.dhcp.thefacebook.com>
 <CABoTLcTnVhVeVZ3-7=g8ezd=keww7ufKSYy1Z4Wk-HRCeihpZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline
In-Reply-To: <CABoTLcTnVhVeVZ3-7=g8ezd=keww7ufKSYy1Z4Wk-HRCeihpZw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2020 at 11:30:10AM -0500, Oskar Senft wrote:
> Hi Patrick
>=20
> Here some thoughts:
>=20
> >   1.  Power off host server.
> >
> > I will admit I don't know the Intel architecture well enough yet, but is
> > powering off the server prior to BIOS update actually required?  Is the
> > BIOS NOR chip always mapped into a physical address and used, or is the
> > BIOS at some point loaded and resident?  Are there stable points where
> > it is safe to perform an update?  Can we monitor POST code to know when
> > the BIOS is completed?
> >
> There are two issues:
>=20
>    - The host may access the BIOS SPI flash at any time by making BIOS
>    calls. UEFI variables are such an example. The problem is that the BIOS
>    code that executes these requests does not handle cases at all where t=
he
>    BIOS SPI flash becomes inaccessible. This results in an immediate cras=
h of
>    the host.
>    - With ME in operational mode, we cannot guarantee that ME would not
>    attempt to read/write from the SPI flash while the host is running. I'=
m not
>    sure if it's possible to put ME into recovery mode WHILE the host is
>    running or if the host needs to be shut down for that.
>=20
> My understanding is that the only way to safely write the BIOS SPI flash
> from the BMC is to shut the host down and put ME into recovery mode.
> Alternatively, hold the host in full reset via RSMRST.

Good to know, thanks.

> > >   2.  Set ME/NM (Management engine or Node manager in x86) to recovery
> > mode
> >
> > Is this specific to the BIOS update path or is this something we should
> > do whenever the Host is powered off?  In either case I guess you can
> > make it a dependency on the systemd unit file, but it seems like it
> > would be nice if it were able to be generically applied to all power
> > on/off paths.
> >
> This question opens a can of worms. There are people who say that ME shou=
ld
> always be run in recovery mode ...

Hah.  I think it is worth answering if the ME provides any useful
function when the server is powered off though.  I don't know, but it
would potentially simplify the BIOS update flow if Host Off =3D> ME in
Recovery.

> > >   3.  Flip GPIO to access SPI flash used by host.
> > >   4.  Bind spi driver to access flash
> >
> > This is another thing that seems like we could do generically on all
> > power on / power off paths?  Any time the host isn't running we can hit
> > the GPIO to put ownership at the BMC.  Is there any disadvantage to
> > that?
> >
> Yes. You cannot turn the host on via a power button if the PCH cannot
> access the SPI flash. You'd have to catch that signal in the BMC and do t=
he
> right thing.
>=20
> What's the advantage of having the BIOS SPI flash always connected to the
> BMC when the host is off? That seems to be making things more complicated
> to me.

It was just another simplification.  Usually we have special user
utilities to steal the flash to the BMC and we have this logic in BIOS
update path.  Again, if Host Off =3D> BIOS SPI owned by BMC, it simplifies
/ eliminates logic.

> > Is the GPIO something unique to Facebook's machines or do most other
> > Intel machines have the same requirements?
> >
>=20
> I'm not sure if it was explained what the GPIO does:
> Since the SPI flash can only have one master, a "mux" (it's really a
> digital switch, or a pair of digital switches) connect the SPI flash eith=
er
> to the PCH for access by the ME / host or to the BMC. The GPIO or pair of
> GPIOs is used to control the mux / bus switches.
>=20
> If the SPI flash is connected to the BMC, the ME / host cannot access it =
at
> all. As it turns out, the PCH needs to be able to read the SPI flash to be
> able to "turn on" the host.

Yep, I'm aware of the mux (on Facebook systems).  I wasn't sure if this
was common or typical Intel architecture feature or something we
specifically had on our Facebook systems.

> >
> > >   5.  Flashcp image to device.
> >
> > I don't think `flashcp` is used today, or at least not in my
> > recollection of the previous Witherspoon implementation.  Is there any
> > advantage to it over `dd` to the raw mtdblock device?
> >
> I'm new to this, too, and found this explanation:
> https://unix.stackexchange.com/questions/274217/how-is-erasing-mtd-with-d=
d-if-dev-zero-different-from-flash-eraseall
>=20
> This question was asked in the context of erase, but it applies to writes,
> too.

The stackexchange here is referring to /dev/mtdN devices and not
/dev/mtdblockN devices (and I agree for plain-mtd).  mtdblock
specifically has the extra logic to deal with erasing and writing in
pages as appropriate.

> > >   9.  Power on server.
> >
> > Doesn't seem like "power on" should be a side-effect of a BIOS update.
> > Is this intended to be "go back to the previous power state"?
> >
> +1
>=20
> Having said all that, I was experimenting with pretty much the same flow
> but ended up with unreliable writes with individual bit flips. I'm pretty
> sure the HW is fine, since the original (AMI) stock firmware that comes
> with the board can do it just fine. This is with an Aspeed AST2500, a C620
> PCH and a Dediprog EM100 SPI flash emulator.
>=20
> I had even tried to change the SPI flash clock from the Aspeed down to the
> minimum, with no change :-/ I already hooked up a logic analyzer to see
> what's going on but haven't had a chance to investigate yet. Any ideas?

Sorry, I've got nothing except maybe the original code retries a bunch
to get past random flips?  If you are seeing bit-flips even with the
Dediprog, are you sure the bus is any good?  Did you solder on headers
to be able to affix the Dediprog?  That might have changed the
capacitance enough to affect SPI activity.

> Oskar.

--=20
Patrick Williams

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl4zczgACgkQqwNHzC0A
wRmULQ/5AcVSXHDml5tVmq5k1T6OZiGt7KxuD6WZHlkN1y1ySuTs3pKeragXyQWg
j0eMSCP1MrvcPC4qIwlqh/Te9GPQwhRh4fPBUOIH/EUKWzOAMV8ID2WIAWaE00LE
iVLuQqX0jz6AldBUxmvCZMPSVWfPyKLxaLxk7mppoSZ/t0Ru/Hn0FP7u8oIA3Uu8
xeJGQkBRLikqQ0XKkt4cU+REAncd+o73WUJC3NfqfaRjUXp6oZHK+wPX/n12nAaT
yvKuY1674y4Q+7vvrlQ0FywF+E0TnXpQGFjqN0i5p3/NOGQ7J/Y0scE4uqJoHz0H
AOfHPF5AML3CvjgXepzAsZDHSxsNJPCPpGP1L7AbIhTbf2PEYLaQhRI3U0ZzHtPQ
1lHhQFiz7ZYMW+vBkCXZHNOHaXwivw0TN6fr4AiXRRjVMzT/ijSz4j50ckdRpIEd
v+xMwle2Itx9Prr7QXOhSE7vcgchp81qJ9PjzVYK/cqMxygrppFNIwsMrjaPrO5J
2Dp0kHNZpv7nO/XTISLv0wYdkwMP+vqtyDVQQsrq1BrF6S1Zm1cV7uq0BWIt/g9t
/Z4eCodBSKy/TGNQ6gAzS7cB9rtx/UNau2eLMczKX5RV8QPn7QCRdG6ni6d63716
X0XoiIhBML3Y5xnzHslDfNTep98xu6uYXQpwPyLRI5+DHF4tmH8=
=sic3
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--
