Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EB83FF052
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 17:37:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0lQy6HTLz2yK3
	for <lists+openbmc@lfdr.de>; Fri,  3 Sep 2021 01:36:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=npJdoRq8;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UiAD0I15;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=npJdoRq8; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=UiAD0I15; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0lQV328Bz2xfP
 for <openbmc@lists.ozlabs.org>; Fri,  3 Sep 2021 01:36:34 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 75E983200930
 for <openbmc@lists.ozlabs.org>; Thu,  2 Sep 2021 11:36:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 02 Sep 2021 11:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm2; bh=V3DMt5i0Ts5krKVg+O0OrfSi6sm8odW13HUAmbR6H8Y=; b=npJdoRq8
 YYqYinS7CKFwqyS1Y5yMgGsTjuwMQTZMAO6AZTcTId8leJUaFLJBa36lCaV44AOe
 g2xh7BskdJsNHzJ6m5CSg5vIcJ/mSeEEhgwIKopjZTjj1bOiH+l7VXaGWl8NrS68
 UXa26PY8yiHXNqvsSbR3KocfizAz64MT77Belg2s/OpTY41CYKOiMAse/7II870q
 9phuzcF1+sCzzY9GtzU/tXtVdLFv3Rs7zTtL9Jz3/R+KGiLXYcxbivocx3v25sso
 0Ld6z1Khj+BHs4nKfcCnYQKaI7Y9Uw4K5oL1O549/MXTzGr55mL9y9pgdZwdYRa7
 hNPokJ97YDafCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=V3DMt5i0Ts5krKVg+O0OrfSi6sm8o
 dW13HUAmbR6H8Y=; b=UiAD0I15Wd72/AkHiBxYW/YCQyGuOaOGuRa+AA4bvz14W
 F+Us5BN+Jz3Wo4h4GFiCiXJ5hTi7FR1icliLqs0nOjgKNrcj3bDdJX1W2cLESEHD
 Bklt4j9RBmpvRLCAeaDChnRdaDqDwr+ckr/azGa4BL1IuAJPGO0ec5WgHZQYbO3f
 qWD7o0S/jbKpB3pFkxuSZn7eJ26Nc+Tnxk1GTu8NCKmOORx8U+wY73Z6FMb+dbFE
 40wQsUT/wxb7JRTFExLBwU4ieuQ3FQpWoj4/ikXiPJnSZ2cQ3rafcMJtKbDcWdlx
 ZXypVkVoWkpZOIbR08v5HdUrDQf+7I/JT7emxucbw==
X-ME-Sender: <xms:fu8wYS6hoiQ7Ux-rI1y22Uzj-_1OK1qRQhxLNb3bplB-6wdrzzH3jw>
 <xme:fu8wYb4QbHg88aJVRfkx-f1a93ZxHGALlHU03zP5bVdle-H1CeYYoRo_3s3cIwge-
 OP9JktUN0inwn-NLrw>
X-ME-Received: <xmr:fu8wYRctlofO2DGxHHMjcCg2E_cBQiaJmWILw3L46W3PJ_X52KXIyayIa5SnVKzB4an7KgYdiC6v-jcRrIe8xonFdaNj6anDLeWWSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvhedgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnhepjeffueelheelvdefveejueffjeejveeu
 veehtdduffdtgeelkedvtdevveetgfetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:fu8wYfJIi2_g1IVoCRQaF_6hooXxLG_TVtcsPRAwO8up0CXsBwPOIA>
 <xmx:fu8wYWI_M_nKrhe5VLWziEtSeufMhwdjeWGVM5-SXATjcqdMJjwI7w>
 <xmx:fu8wYQylAhGe0q5D8Q3286fs14DcPVqGTY3I9iDXVBrg8EbTrD2vtg>
 <xmx:gO8wYVldjoEvk2yPb-i0wRFqjvCfaLYQ2mUw59sjNSlAItTuaC3rfw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Thu, 2 Sep 2021 11:36:30 -0400 (EDT)
Date: Thu, 2 Sep 2021 10:36:28 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: sdbusplus exception type SdBusError
Message-ID: <YTDvfIn4Z05mGdCx@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GCqrf7nYJ0pmeOv8"
Content-Disposition: inline
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


--GCqrf7nYJ0pmeOv8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I am going to start on some changes to sdbusplus which make it so that some
errors which previously threw an 'SdBusError' now throw a more specialized =
type.

In the process of getting started on this I'm observing a few existing issu=
es
across the codebase.

   1. Many repositories were catching 'SdBusError'.  This type was always
      intended to be internal to sdbusplus (in fact, it inherits from an er=
ror
      called 'internal_error').  Quite likely, by catching this exception, =
you
      are missing other exceptions that sdbusplus can throw.  Certainly you=
 are
      missing exceptions that sdbusplus will start throwing with my upcoming
      changes.

   2. I see a handful of repositories *throwing* SdBusErrors.  Again, this =
was
      intended to be an internal exception to sdbusplus itself and not a ge=
neric
      exception type that any arbitrary string could be wrapped with.  I'm =
going
      to leave this alone for the time being, but in the future it is quite
      likely that I'll force a compile break with this.  If you need to thr=
ow
      something that is of type sdbusplus::exception::exception and can't f=
igure
      out what is better, please reach out to me with some context.

   3. Along the lines of #2, *some* of the cases where an SdBusError is thr=
own
      is entirely invalid error path handling and your application is _GOIN=
G_
      _TO_ _CRASH_ whenever you have a dbus client that pushes you down the=
se
      paths!  Almost all of these I see are using the ASIO bindings.  In ma=
ny
      cases the ASIO bindings *DO NOT* catch any exceptions and magically t=
urn
      them into sd_bus_error's.  By throwing an exception, you're not makin=
g an
      error return to the calling client, but instead blowing through all o=
f the
      sd_bus C code with your C++ exception and putting your application in=
to an
      invalid state.  At a minimum you are leaking memory.

*(3): the phosphor-dbus-interface bindings *DO* turn exceptions into
      sd_bus_error responses but typically this requires you to throw a PDI
      error type.

I have put up a large number of commits to fix #1, so if all you are doing =
is
catching SdBusError you probably have no change necessary.  If you see a=20
`catch (SdBusError&)` being added to the codebase, know it is probably wron=
g and
should be fixed in review.

--=20
Patrick Williams

--GCqrf7nYJ0pmeOv8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEw73sACgkQqwNHzC0A
wRlMCg//ep2r61r6Wss70DMIam4NOW94bPX+kSKhYOqEqduV+Z3cKXO7eAGFYXie
K4Cf0E+htlLQeC7s5SHByVrsqtRPMTpXGmu8fjHBm+RtxBUGHSUIfcqY5RIuT1B2
mruyG6FQ3NWirQAgVkkf2AwIgr6oiwXBOdjvXw2JG2AeILphwWcv0fS+4JIFFF3y
fiLBrbxr/+YSENwXENUSAFuiuaXtlgDaVJJtYG1vW0DpGPQMSzXGfaA/k+RHu3+8
9lcnpGH1Qa9Ri1G06pqN3jMpFirFKcnLaj0OqxVvasHAe8iqw5liQgCHzdaqfG6c
XYEz91fy8LjfLpjEFHlXyqKlztCY8mjIb+n99CucV8NhiqjE4evW10uX0PUSd7lK
ZOi8mzarRYmvMl/uQzD5FEbg4PjV9hVpAKFysiOKqIiP7RxUHgrqL8rE6T828qM4
+AbOIJXyQZsZuLcMdL1SNCvIhX4T3r26hzZnYZ0ZBj3X+OGKRJEEH39Ju3aFk5la
UQh01CeOvs3AQqjXVcHxKXF91dH0ZbQ3tBz/em6icetzc4oai7rrtczCiClMRoZN
hCu3G2GXEkgctu4+f9RoPM7fz4xDG/9oQv64X7TT4uG25EEqjwgoJIwcPJqucbzb
4JHXnZrwNMkGFFg5p5EwKl9DK89ilEphOCqNe6uEYsymnlT1URo=
=lxyV
-----END PGP SIGNATURE-----

--GCqrf7nYJ0pmeOv8--
