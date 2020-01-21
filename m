Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 412E814D1CE
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 21:18:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487FDH221jzDqTW
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 07:18:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.27;
 helo=wnew2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=TUYRKAta; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ZemtPNPs; 
 dkim-atps=neutral
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487FC53rzDzDqTb
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 07:17:21 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 2F12461B;
 Wed, 29 Jan 2020 15:17:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jan 2020 15:17:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=zmat8vdpFFHPO6osY/tgKPibX0f
 BqgBion6sx2zqYmE=; b=TUYRKAtaIWjixZ/2Tptey6zl6fOTCKxk9CLowK5CJC1
 pXkZ1jhLidHOI3Qb/3o+IABVKCiWsLxOPF6QMhmI/3M73EqOCjo5CnekQ150pxbQ
 +k8bHl/OPet8hZP1A10bJX1HredYWVa7qyF+Y6gKhQs/yegot+yjCs5w0aQZxGQV
 ySxPjvqQVLZ3JEwiSBKyIGTCydeBZHg7cFNYaWZFvaKEq5XuvSQaGsBtHyhpF85p
 0K6v6R0/7L5IRq1SCmmL3NIYu/07UO9AhcyPHvFkvuZUz1xk6CA6+TJibFrhA49S
 PpDdc4gR3X4EXRbr28y8WmBZbBXpc9JZCT4HJMMkALA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zmat8v
 dpFFHPO6osY/tgKPibX0fBqgBion6sx2zqYmE=; b=ZemtPNPs5wHTDaVO84jpdB
 ptzFXsKqp0lm/MlRW0sb66ru6D7hqim1tYvd8FFCzDONoRPAUgYn3VHRvcC313bn
 dRqy4dEp1AjKueFZbG1fdPUm2b1Yi06IUGcijEQnUvtExFoB8Ievj+vf8lCwzBhv
 DonEDNWri3wkwhLw0SbhicUonllNMQfJYl3HVJ1t4ctQdmnQmyc6nLvBnFT2JU2g
 8kNypslLLXfaRf3w/ql7mR4hAFXE82387RGFMJ9ZX9xfscCx/IgEC5IgCI1tbGcI
 voCIQciKbSzbNIGagyeeOGSvPqMrmv/itSae3DgYpxLbPcuswBNxwavLhLDd6EOA
 ==
X-ME-Sender: <xms:TugxXtDtrtQtnfUKhqAcS-p1EQWpFC2ioZpd7WWnKdl9NkHpt2YEuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeeigddufeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepudel
 ledrvddtuddrieegrddufedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:TugxXvwWCfUhj9VglrGTQVDhZ-4oFj0AiWNoQuSjTVFpy3T0Xyn-Mg>
 <xmx:TugxXjkegPkClmRfNbPAxR6NVtGv8vcztZOaWVAifqMw8w5yYnpGGA>
 <xmx:TugxXsEdP7C1qlVW2cwtZNam0aSo0_P3EnH6QpS5-2K3oLRm8EknoQ>
 <xmx:TugxXqP19YAWm0VBqV5l47ze5bVgPOUirb3DSHzMUX6DyeJftEc-_mX3sQmhQ3vs>
Received: from localhost (unknown [199.201.64.132])
 by mail.messagingengine.com (Postfix) with ESMTPA id 534FD3060C1B;
 Wed, 29 Jan 2020 15:17:18 -0500 (EST)
Date: Tue, 21 Jan 2020 15:50:58 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: Bios upgrade from BMC
Message-ID: <20200121215056.GA59535@patrickw3-mbp.dhcp.thefacebook.com>
References: <8AA9282E-0D5B-4B99-BAC6-0F9E84CC5A85@fb.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <8AA9282E-0D5B-4B99-BAC6-0F9E84CC5A85@fb.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vijay,

On Fri, Jan 17, 2020 at 07:04:51PM +0000, Vijay Khemka wrote:
> Hi,
> I am writing an application for Bios upgrade. Currently I have created a =
hook to our bmc updater which expects a systemd unit file to be run at the =
time of activating update. But I am thinking of adding some of this unit fi=
le functionality in updater itself and wanted to run by you all if it is co=
mmon procedure used by every platform. Below are the process we use in our =
platform as a part of bios upgrade.
>=20
>=20
>   1.  Power off host server.

In the current code-update implementations, I don't believe that
powering off the Host is ever done automatically, but the expectation is
that the user has put the system into the right state first.  Then the
code-update implementation blocks any power-on until the activation is
complete [1].

I know the facebook/openbmc implementation automatically powers off, but
I think this is dangerous for general purpose commercial server.
Customers tend to get angry if a server powered off and they weren't
expecting it.

I will admit I don't know the Intel architecture well enough yet, but is
powering off the server prior to BIOS update actually required?  Is the
BIOS NOR chip always mapped into a physical address and used, or is the
BIOS at some point loaded and resident?  Are there stable points where
it is safe to perform an update?  Can we monitor POST code to know when
the BIOS is completed?

>   2.  Set ME/NM (Management engine or Node manager in x86) to recovery mo=
de

Is this specific to the BIOS update path or is this something we should
do whenever the Host is powered off?  In either case I guess you can
make it a dependency on the systemd unit file, but it seems like it
would be nice if it were able to be generically applied to all power
on/off paths.

>   3.  Flip GPIO to access SPI flash used by host.
>   4.  Bind spi driver to access flash

This is another thing that seems like we could do generically on all
power on / power off paths?  Any time the host isn't running we can hit
the GPIO to put ownership at the BMC.  Is there any disadvantage to
that?

Is the GPIO something unique to Facebook's machines or do most other
Intel machines have the same requirements?

>   5.  Flashcp image to device.

I don't think `flashcp` is used today, or at least not in my
recollection of the previous Witherspoon implementation.  Is there any
advantage to it over `dd` to the raw mtdblock device?

>   6.  Unbind spi driver
>   7.  Flip GPIO back for host to access SPI flash
>   8.  Set ME/NM to operational mode
>   9.  Power on server.

Doesn't seem like "power on" should be a side-effect of a BIOS update.
Is this intended to be "go back to the previous power state"?

> I can have some flexibility in this sequence based on each platform confi=
guration. Looking forward to your suggestions.
>=20
> Regards
> -Vijay

[1] https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/ope=
nbmc_project/Software/ActivationBlocksTransition.interface.yaml

--=20
Patrick Williams

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl4ncj4ACgkQqwNHzC0A
wRmI4Q/9HOefxclhJHjmaxW2iS2xiVq/zdu0au4d/UY2M83Q/XHTvsouKtbVGsrJ
MN1RmKjTTGDI+IZK+zZ/PwQgh8W8QNdGtu3qj2a+JtdCT61NqhhvJPgjNzVdqpBX
Ttp4zwwtm5QqmmbSopbHPgEAoO0oTg2Ad0rXvdjDaDReAKLYQ6Q98bkLOcBFHmDP
Nnb06afSMMrwdBS4zMZI9de/Ko3TwYtvO+3Nln3njR/heY3gMPH85E30v6d7nzM+
p4ikTZdu1Hu41+95Jthp0/hozo2vKjAf/KXBrCK39O2Ik1BJkciJLX4cW6/fUmw6
agNDWgGy3GnLz0w/EImVtH37ED48He1QCGE0eaS+4V/uNjxNF1Kicw1v6HhLcTEX
t+47eMYkfxYn+mMdkh3co72qtwYd3jCWu3OPl40r/mjQ32VG7rJkPQq7IjlK/2K4
31DM+0n//s39BCW2fc9ByG/Jk58ipAwXRoUPvrTjaolcHkcw+XtBApsWxSZToe8b
PqrL6kA9VG5yih0R+1MqayJhAxEzgUe2i71pNWPgmywemKJLjIsNj6jGiwjzc24O
+Q0j3BVj74PfpO8g68m1WzGd4lT1e7JfprFICD0QFWBwRlK3OsRdh3fyaOaKi9ky
GnkwNBHcjH4y1fxx9fWbMlbeHNRI1f2bwjrWxBvxanYp62jefGE=
=Lh58
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
