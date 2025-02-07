Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DA6A2C9DE
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2025 18:11:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqL9458Cbz3c5t
	for <lists+openbmc@lfdr.de>; Sat,  8 Feb 2025 04:11:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738948278;
	cv=none; b=POGTdP4s6RhmR47UC1JbI0YOqwA9YrjW7qXd3srUZLthaH/WMMQDCBlmvJYDq/cdlFDs/ELxiGxP4lE1jFI4arggDGR1I2RCM4Ua0pi8dpV6kiqmah8djNmv6+rYVDa7BF7vc+ZTheqmsTrhT2CazQD5x97V+8ksng5PXMFyzfp3qnm0eSdg5RCs/Vd3nqJxvyWquZO/MKl/qWOEG2Iverv8LeYGfY/BLhkbKXTKCkRGoSy7WcZCT22Ag/6E9srbH9vHU4r9pM6SQ7GaZYbaCa38nAbt+vSVK52GvfLFfAiWQENXFW2t2o6mF5/xu63EXsoIwcnXCqzWZ27BtVMypg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738948278; c=relaxed/relaxed;
	bh=uVncumWkxNtXtHPRZFY5DTWYK7BH80jTuX7kM4yvDXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=La2mC+Uyut3uuQ4EJWAlJd45Io0hySWUP/whs6wQGJ5So+/pwc5P8Vr5Pjesf6D+MXlV3Z1Xm0bZpvRNHPUMFEocfLVA7+nsGgKk73AkvqOEk5LGLW2C/XdsHUOEjDvCo67vS+NC3NGznCymlMma1JEOT6qcNQP9HRYRGv8Ixm8a8jkxUE8O2SONohWBrmyET1L+PthQV3S82EeDxlr+Z+mRSece+2UXJtMU6oU5CWGW6Q2umsWGB0TfSwUKKyXu5+aKknmGhNTZ6KQu5IW+ReP36fjOpta2JzkmqjyXtDSQZH8/2Up3BxJXwGPNojS+P7B+DKCajWfkftmRxLXxig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=q2MiWH9L; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yIkKMnyf; dkim-atps=neutral; spf=pass (client-ip=202.12.124.149; helo=fout-b6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=q2MiWH9L;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=yIkKMnyf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=202.12.124.149; helo=fout-b6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 417 seconds by postgrey-1.37 at boromir; Sat, 08 Feb 2025 04:11:13 AEDT
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqL8x5Tx6z30VX
	for <openbmc@lists.ozlabs.org>; Sat,  8 Feb 2025 04:11:13 +1100 (AEDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 782AB114019F;
	Fri,  7 Feb 2025 12:04:11 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 07 Feb 2025 12:04:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1738947851; x=1739034251; bh=uVncumWkxN
	tXtHPRZFY5DTWYK7BH80jTuX7kM4yvDXo=; b=q2MiWH9LJVuXmY3OMh8g2KyMdh
	FhRZpm/tCA600IZv7yul9m9pndvFFAX0stQwLkwI49t+7ur6Po3g/c1Z33x6GSeH
	fSff8fyI/eaQnPpUIB53xQC3XZljgfQkwkimHKh61igeh9FTMpe+EYNiYR9EkCBx
	qW+ErtALVPnlSVefmvK8Q/vidypuYYTTjdqFTPgXlwFefmlwQbOhr4GLWDfc3+Wx
	QSVubGR9r+tM5Cq4OVrPPeKQaRQOQQo01XR8RLQ18vcOQJBZoOv3rt12xfFj2LYt
	RDNa20nuaWeNMhx62/WH06qX0rQJ1KR5jhnZVqojBycuHwTdomqnJps9LerA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1738947851; x=1739034251; bh=uVncumWkxNtXtHPRZFY5DTWYK7BH80jTuX7
	kM4yvDXo=; b=yIkKMnyfdWrdU9aMhEsSLV56/MiVwQ9N2+YyzqFTl2Zn2AyyL+9
	kZveeSlyW5acOKFdYyY3CzfpDe7+XNKJ2HpEsN2Tq8CLeWBx+SU4zbAWLvkBLNy0
	ft93HsDp8zf2jl1PnPsTTWJAVgzL6pymdP4NStm/Q6F28/UWsKpffxq4MFB1fGEd
	3+vjID5EMOGKuOhdAQb6Ea8mt48TzPCzjv2t4k057nmREDd6HZcTwxTdEU+wppfx
	MSrrIPYrt7EE7O74iwzwl5nGFpCf3CF3eglYbMGU74U12maPo+qi7qjHgo8j5UAH
	jqCaL8aGggRPvwOdpmSogKhn+aa6RyFgLDg==
X-ME-Sender: <xms:Cj2mZ-0IFgInAkXKXGHKAfUTAR1Gd3t97ONZ4VXcr2vu1VRYsyPTXg>
    <xme:Cj2mZxHX2LdopNCIJNZ7VoMlqVHMObTODdjiBXIiqhvc2L0nAg_bDQ8tyTinExEKI
    BLWTLSfbA1bUUhfxTg>
X-ME-Received: <xmr:Cj2mZ24wmRGtQobIR9Zau2ZQ2sd1CklIPm1ed3UM3CM6PO4jhn2DBVrjf-M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenfghrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffk
    fhggtggujgesghdtreertddtjeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmh
    hsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepleff
    ieduueeggffhleehjeduvdeihfevhfdtffeifeeufeeiffdvleelgfehtdfgnecuffhomh
    grihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgi
    drgiihiidpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepiihhrghnghhjihgrnhdrfedtfedvsegshihtvggurghntggvrdgtohhmpdhrtghpth
    htohepjhgvfhhflegptghhrghnsegrshhrohgtkhhrrggtkhdrtghomhdprhgtphhtthho
    pehophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:Cj2mZ_3eB27aLTTuWpxD0At1RDLgVdGRjq9WQ9mSoI8tjQ_PWenCyw>
    <xmx:Cj2mZxEEMR9LJCHj2mgzgqVshdUuYd3o3TD6YHyYihzumAKBmXMZXg>
    <xmx:Cj2mZ4-dGFBWUFpWbO_TmuzWK00tcgkuUakGgzlU0bGd2Y1DT2utuQ>
    <xmx:Cj2mZ2khe-x_CyVyyfSkZZzQB-CSB2XhiWM9Vytnv0guVZ7nMNgoKA>
    <xmx:Cz2mZxCGWxkjn_L2LXdty-fUEU5i8P3AMi4p-Fy9Y-kO2z58nbCnpbq_>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Feb 2025 12:04:09 -0500 (EST)
Date: Fri, 7 Feb 2025 12:04:09 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jian Zhang <zhangjian.3032@bytedance.com>
Subject: Re: [External] dbus-sensors issue
Message-ID: <Z6Y9CSIl8PhvV8KZ@heinlein>
References: <3e85a9834ada4944a629c50cd6389630@asrockrack.com>
 <51dd8bf76aa056fbc966e48132cac2607d2326ca.a3a848b5.1084.42df.ae2f.330bbfd1cd95@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8RhwHC4lZVacehOd"
Content-Disposition: inline
In-Reply-To: <51dd8bf76aa056fbc966e48132cac2607d2326ca.a3a848b5.1084.42df.ae2f.330bbfd1cd95@bytedance.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Jeff9 =?utf-8?B?Q2hhbijpmbPmnb7lhIlfQVNSb2NrUmFjayk=?= <Jeff9_Chan@asrockrack.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--8RhwHC4lZVacehOd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2025 at 07:54:28PM +0800, Jian Zhang wrote:
> See:
> https://lore.kernel.org/lkml/20230716195007.731909670@linuxfoundation.org/
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217699
> For services utilizing io_uring, when waiting for I/O, CPU time is counte=
d as I/O rather than idle time.

Yep.  So to be clear, this is just an accounting difference.  It has no
real measurement of a performance difference.  "io_wait" is effectively
"idle" now.

For similar reasons, phosphor-health-monitor doesn't consider 'iowait'
part of the CPU utilization for determining if the CPU has been too busy
for too long:

https://github.com/openbmc/phosphor-health-monitor/blob/ba29dbdd04a96a46e19=
72641c20bf5a8e930ed8f/health_metric_collection.cpp#L73

>=20
> Jian.
> > From: "Jeff9 Chan(=E9=99=B3=E6=9D=BE=E5=84=89_ASRockRack)"<Jeff9_Chan@a=
srockrack.com>
> > Date:=C2=A0 Fri, Feb 7, 2025, 19:42
> > Subject:=C2=A0 [External] dbus-sensors issue
> > To: "openbmc@lists.ozlabs.org"<openbmc@lists.ozlabs.org>
> > Hi all,
> > It appears that IO wait is very high all the time. This can be viewed b=
y running `top`. It was traced down to dbus-sensors systemd units. When the=
 units are running, IO
> =C2=A0wait is >90%. This can impact system performance and also impacts C=
PU utilization telemetry, since the idle task never runs, which normally me=
ans CPU is being completely utilized.
> > =C2=A0
> > My platform uses below services, stop them will free the IO usage, any =
idea?
> > =C2=A0
> > xyz.openbmc_project.hwmontempsensor.service
> > xyz.openbmc_project.fansensor.service
> > xyz.openbmc_project.adcsensor.service
> > xyz.openbmc_project.psusensor.service
> > =C2=A0
> > =C2=A0
> > best regards
> > =C2=A0
> > Jeff Chan

--=20
Patrick Williams

--8RhwHC4lZVacehOd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmemPQcACgkQqwNHzC0A
wRmPjg/+MEmuwtsVt7lWQ8SSMXP5A8lZjnYmRAHTH7d346RNutnmqqCPUvzWeVCA
dvhkOUdQ7fMrK1FRIM6BHA2PAwHwvH9iWHQIlN/9SZltTLPAdn1PItXoVac8Igh+
aXfP12gEbK09kR6aPfVBszNIYBoMqNdOWMkwa9nPPNlEtOgl4pKSa/8x4WqQjaTh
hE+x7oe+neibX14M86aF82wo1e/0scMi175HhDUX2wAe/yHrWZ5+p+QhVT42N94R
EfSrq1Cp5bWPRayTa6IuHCTTG0I0MvCqhZocqByPT+pNnZlhmBnoZPCIbvpDb+tw
1FpsDtNgdKDfiDanZYresVtfhmw5qxbGZGaeWfhd39c2RhagtFM0D2i2IOwU17Ry
lNWx4j0QOaL3mWJYH02+BG59YFL2PAPAYcQhNyyK/U/AcsmJI3Bg7UV7P0v5aq96
di8oTRatUCVxPLMWArFdDvgYl7iBwlMxcTUJRWL9A1ouLGNuRDR4qeEoazJyoGyK
u1fxxMWj/jqAF6ZoyrcCjadE0Ejex0pu07AYcBcmd+IwO33gqcG4p80b4bQKV9KZ
PQGzpkGR7KdQFkgqPqNNaDiWp2qY4avP9fITCU9ybNESNXEYZy8uj/bIZ0F4OOTw
k89ZyaUzHkXDXsSwrTphwaIKrs91sN4Xy74OduC07JAsgqfBlfc=
=JEym
-----END PGP SIGNATURE-----

--8RhwHC4lZVacehOd--
