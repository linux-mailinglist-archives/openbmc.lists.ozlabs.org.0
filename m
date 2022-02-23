Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4904C1B35
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 19:56:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3lcx4NmSz3c9t
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 05:56:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=SiVrde6G;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=UzIuzAMr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=SiVrde6G; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=UzIuzAMr; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3lcS0n7Tz30RR
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 05:56:07 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 9C30A3201E3E;
 Wed, 23 Feb 2022 13:56:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 23 Feb 2022 13:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=uOYcjogL7c69MzkNqcyDO32EQjjfupyQr/OsP3
 GCZD0=; b=SiVrde6GBAiLZ2UCND/2tpBQHOx/gnMMzrB3PS1YTY9A7VkgGG2nZO
 aquel9jVPAsujPEad2nQsh3wAJ3AsvHZPAMVD+NrpYBDLZobid1KtKd754OX3s53
 IvmsszalBb/ZLDWJDWHq7oYZrE1axhVtfpNb2g+5ssYbHCFlTlmfzZmTcsM7DgWy
 FVQODWM4hlUIvdSbM3HVbfd1x3/DyR8KPK2VCiacKx3cd9nvkr3Gf9QOVQvFJeLQ
 dgGtiW9aC1fOJBomqrhZdoZlKqUpKoRaDgw4ymiqy+0ChPMIV6QUZ+kz+p85MpYr
 YJTIrKWAZX2evb0AAO9psjt926HJCS/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uOYcjogL7c69MzkNq
 cyDO32EQjjfupyQr/OsP3GCZD0=; b=UzIuzAMrwIvuzzFxRzd33IlOXDKyIKNHy
 tN6M72uFFbaP4wqoQIIe/b8dJOYBHkGPQI2pN+RAoy4aTxz4M9r3U0Bty9Te4cNF
 nAkYZ7imjR5saMtjtwKvHB0tdU8Jr0/RZ4LgXIIYAsuY4cWot6Vsw5mnMb7E3pOP
 peaYnGnfACXqk1LU6Dj3qZZ7PLGxqHjtYvnuMwYyDBq3BASkWp6d8JpPKIGI+fXZ
 9g1KiGOy1alJMoAG7XOY1bnPBX2L5+7MaeRGZqG7XZGba6fhG7W590c8b/z6et27
 4pSg4K9iOzx4TV2VGjDtWKkbImNzs44CkpeKFGNgLQsvx1crOpSoQ==
X-ME-Sender: <xms:QYMWYvL5kBU6AjFcxxsLGPebwMedONiSqif2Cx9GEsc7GUXbviVv2A>
 <xme:QYMWYjL0V_6VpHQVqeXTW_lUG7v0aB1qfH_NzcJ9Vl0k5jwqzk1TM4rVo6_vp0ekg
 _e8dNVYUgbTVW3ovQ0>
X-ME-Received: <xmr:QYMWYns9UMLwDTdRmJSqnF3Nbwugjrp0ZPe9_G1v3KNQAOqjZUMsSoWXjtm0rGGTm_31dSQQ2JhDxTJDMO7cbOEj-UD18oGp0j27oA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeejheejteeggfeukeduiedvhefg
 heeigeelfeevgfeliedtieffhedtheetieeunecuffhomhgrihhnpehfrhgvvgguvghskh
 htohhprdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:QYMWYoYbrm-RiOkOM_AXI-mIBjjnhaE-QBz36YRnUBAKoeQyZEZC6g>
 <xmx:QYMWYmbgp8kz_jsfzrVB5wnuuFibYMzaSnmDKeoRykuJF-QEh8U5og>
 <xmx:QYMWYsDLBIOoBpYRehJV03zE0-N0xcLFbXMXbujuUVKqV19wV8Lo5Q>
 <xmx:QoMWYmHpknaCWfaXoRo_O8PaGauHyWZ_bEH0HUKLXvlWS9A5NzxKhA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 13:56:00 -0500 (EST)
Date: Wed, 23 Feb 2022 12:55:59 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: Re: Checking for network online
Message-ID: <YhaDP7L8z9NhRwyk@heinlein>
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
 <bb39999e8f9638da3d29b865d85fb54d51da9797.camel@codeconstruct.com.au>
 <CAGm54UE1bFeLF9PHUuj__E0m_+CxLRtA4Htrjm4y5M3SnbOhLA@mail.gmail.com>
 <37a29642-788c-b966-3b58-214c3d44c8f4@intel.com>
 <64727f8e-cca3-b04d-e4cf-709ceb60f37f@linux.intel.com>
 <YhY7Kxgg6ew0HdUR@heinlein>
 <112c8819-24bc-2a24-45a3-9c919088f43a@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VKAwLeAJlKvfLjLf"
Content-Disposition: inline
In-Reply-To: <112c8819-24bc-2a24-45a3-9c919088f43a@linux.intel.com>
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
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lei Yu <yulei.sh@bytedance.com>,
 Johnathan Mantey <johnathanx.mantey@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--VKAwLeAJlKvfLjLf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2022 at 01:44:18AM +0800, Jiaqing Zhao wrote:
> On 2022-02-23 21:48, Patrick Williams wrote:
> > On Wed, Feb 23, 2022 at 10:09:19AM +0800, Jiaqing Zhao wrote:
> >> I think a solution is to set RequiredForOnline=3Dno (https://www.freed=
esktop.org/software/systemd/man/systemd.network.html#RequiredForOnline=3D) =
in all network interface config. This option skips the interface when runni=
ng systemd-networkd-wait-online.service. Canonical netplan (used in ubuntu =
server) also uses this option to skip the online check for given interface =
(https://github.com/canonical/netplan/blob/main/src/networkd.c#L636-L639).
> >>
> >> I'll submit a patch to phosphor-networkd later.
> >=20
> > I really don't think this is appropriate for all systems.  Services have
> > dependencies on network-online.target for a reason.  If the side-effect=
 of
> > having the BMC network cable unplugged is that the host doesn't boot, t=
hat might
> > be entirely reasonable behavior in some environments.
> >=20
> > We use rsyslog as the mechanism to offload our BMC logging data to an
> > aggregation point.  When you have a very large scale deployment, it is =
actually
> > better for the system to not come online than for us to lose out on tha=
t data,
> > since we have spare capacity to take its place.
>=20
> My understanding is that in OpenBMC, the propose to use rsyslog is to for=
mat the Redfish and IPMI SEL logs from system journal. The "r" of rsyslogd =
is not used in most cases.=20

I might have left some ambiguity in 'we' in this context.  I meant 'the
deployments I am working on'.  I believe at least one other company leverag=
es
this as well.

> I think the "network not available" can be handled same as "server miscon=
figured" in rsyslogd, as in both cases it fails to connect to the server, a=
nd may exit or print some error messages? (not tried yet)

That is probably true, but it means that I can't offload any data about the
system in the meantime.  Like I said, I'd rather leave the system out of my
deployment if it is degraded.

>=20
> Jonathan mentions that the 120s wait blocks multi-user.target in his init=
ial email. Considering that there is no BMC serial port in most production =
hardware, when BMC has no network connection, the only way to interact with=
 BMC is to use IPMI in host.

Your assertion "no BMC serial port in most production hardware" might be tr=
ue
globally speaking.  It isn't necessarily true for any particular deployment.

With the 120s wait time, is rsyslog actually running after that? Or is it
failed?  I guess since it has a Wants and not a Requires on network-online,
it'll still start up after the 120s timeout of systemd-networkd-wait-online.

My understanding of systemd-networkd's defaults here is that it waits for D=
HCP
in order for network-online.target to pass.  You can have the IPv6-LL addre=
ss
configured still, which can allow remote access, even if the IPv6-DHCP addr=
ess
is not assigned.

> However, IPMI services are started in multi-user.target, if BMC infinitel=
y waits network online, there would be no way to debug the issue.=20

Sure, but the BMC doesn't wait forever, does it?  It just waits 120s.

I'm not suggesting this isn't the right solution for your systems, or even =
that
it might not be the right solution for most systems, but I don't think it i=
s the
right solution for _all_ systems so we need to ensure it can be opt-out.

>=20
> > Note that the Canonical netplan only applies this option if the configu=
ration
> > indicates that the interface is optional, which is entirely appropriate=
=2E  The
> > way you wrote it could have been interpreted that they set this on *eve=
ry*
> > interface, which is what it seems like you're proposing to do to
> > phosphor-networkd
> >
> > If this is desired behavior for someone, can't you supply a wildcard .n=
etwork
> > file that adds this option, rather than modifying phosphor-networkd to =
manually
> > add it to each network interface that it is managing?
>=20
> Maybe we can add a similar DBus property like how netplan does? Reading/w=
riting systemd-networkd config files is feasible in phosphor-networkd. Defa=
ult value can be assigned via build option.

I'm not sure if it belongs as a DBus property or not.  I'd have to see what
you're proposing and think about it.  I think this is a system design const=
raint
and not really configurable by users (hence why exposing a DBus property mi=
ght
not make sense) but maybe I'm wrong on this.

> > I believe some designs use a USB network device to connect two internal=
 pieces
> > of the system and those interfaces are not necessarily managed by
> > phosphor-networkd (interfaces that, for example connect BMC-to-BMC or
> > BMC-to-Host).  While it is obviously up to the system designer to work =
through
> > this bug, by applying this configuration as you proposed you are causing
> > unusual default behavior in that networkd is going to start waiting for=
 these
> > internal connections to come online instead of the external interface.
>=20
> I think this is a extremely rare case, internal interfaces should be conf=
igurable. For example, host OS can change the IP of its BMC-Host virtual in=
terface, BMC should also be able to change its, and for BMC-to-BMC interfac=
es, it is impossible to assign a fixed LAN IP without conflicts in manufact=
uring.=20

I don't follow your concern here.  We can (and do) easily assign a static IP
address for the BMC-to-BMC interfaces based on position information fed int=
o the
BMC via GPIO signals.

> The easiest way to configure it is to utilize the phosphor-networkd.
>=20
> Even it is not managed by phosphor-networkd, keeping default RequiredForO=
nline=3Dyes will cause the 120s wait on BMC boot. Developers can simply sea=
rch it and find out the solution. I remember it will show a timer with mess=
age on BMC serial console, that's how I found I should set the "optional" o=
n my ubuntu server.

Agreed.  Someone _can_ find it and debug it.  It is to me not an obvious or=
 easy
thing to work out though because automated "network down" test cases are not
often done in my experience.

--=20
Patrick Williams

--VKAwLeAJlKvfLjLf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIWgz0ACgkQqwNHzC0A
wRn4pQ/9GPOLWDrfxntnAdnlyYHoNRwqtFZyphhS4ji/Cb2b9njUOlFhdi8g7UEh
oKFI3COcSKo8ASJCqEIh3BxCRc3iPHccF2cVNN2tmXL6f2abkwqehirAS6/lVypN
k8GWvLF97NuTwhtpI4V7KsCLYyyd2zvRJFi03+aJcJnjpfarJ8JyukieEbLkkNYz
Aj+1umX1pQSkMmpgvwkrFrzgt9wTueP7/WBNRs1kwqYivn1r7BxpIQR70HiuVqqm
cujaJvFTvHZwGG84BTXzCJ9gbKsLAxv5W7ivJ6XbhVjSu8dXknPh3s0RByDLRce5
rFko1ka44uLHTayd8spcFq6aw9L0BRQfwcov0uAk85WkC3bx8bPQ8ztvW6u9qUFx
RD8TOG1YKpWAy8BrdrD2zFqQr/LVnuaKv71dPOAviW2+5MhQ6TtJGimwKmVwcOoc
H3ZCmZvp7ijiV15BGCvA1PDDXiw/gD68yvrICqNGcZ5LWd2fSOoo7liM37B3x5Xw
nzs6YYIVphObuRTzumOLU3ns7xd84ZpakLQmYTpdgXZHLLi2tCH1p5jgtDQiQ0nj
jIfTq/PTURYrV8jULy555CIH4DfqezhHbzvQIJqEBI3oMOmBCbl2tVK2K1UFzdFT
PapIv647wp7OCxWAq3lHKRE40FPQsCjL5ycy3gsJNLt+QXkn62g=
=O8gV
-----END PGP SIGNATURE-----

--VKAwLeAJlKvfLjLf--
