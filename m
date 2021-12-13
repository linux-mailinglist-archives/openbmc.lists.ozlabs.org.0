Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 018B747310D
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 17:01:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCR865qLKz3052
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 03:01:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=VpIvEphh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=M0Zsz7eI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=VpIvEphh; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=M0Zsz7eI; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCR7Z1RGJz2ymg
 for <openbmc@lists.ozlabs.org>; Tue, 14 Dec 2021 03:00:57 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0B40C32015ED;
 Mon, 13 Dec 2021 11:00:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 13 Dec 2021 11:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=XL4KzT31lGmtKntPqw6M1G3fDpA
 uHjPrcGPDkgWvn9w=; b=VpIvEphhQkd3jTv3ojMPlZ/V057IO/jjRD3swjcpfYV
 5rXVq4oQ0Plw0R8jQt/tOMdIYiyEOTQa2Ii8iXjyPW9eWb87jjKR6TGtFVTlsNGk
 WWuWh6h1qOyA20KAsNmhD/1/6pe98ibztorQRP2TGCSAo5kkR2FCfgwa3fo6CdJV
 ypGQbWQUQRHnkfDYQix+lBxCL+tWroq8XZ+6v3xZ4oxksfewYFDHSW6CEvPVNWqa
 iAecGPtjDvcl186+B46SfLtzfje/WGRaBm6JoP5xhMO8QDX5jbo2MV/yW1ljBtQa
 pBLLC7nQ/cYQLAAV5ysdg4Fa7Wl2N5KBrq7aInvGRjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XL4KzT
 31lGmtKntPqw6M1G3fDpAuHjPrcGPDkgWvn9w=; b=M0Zsz7eIqWDihqBkcq1wRE
 R1JfyCK6SEf70rgGlhMxP/UwinEM0u+ftgCie6UOYeLL6rK4cNRMmMxP/N9elDzq
 cFhBwal1raorAbSE7W/Lu05ZvjW+tliEE+zTIttTf44mS+G+5pz0Q2tBhhkQbzT0
 8CrahGjnyiGepU2TC0iivG8fbjBS0Xv67kbbRkG3S7C8QwhT/xNkjQ6kjPXP1obq
 0G7EbM1b+6TEibxaMdJyliBVXTDxKN0JmizpJrm0VvuptTHKuKjvh4Gf9W7IDKFh
 wy9cuCs6mrlp+qOIhclqf+iydyH+TTf3PXl00DHli/H7spn1v23lLl1Ozcxs82UQ
 ==
X-ME-Sender: <xms:M263YVyYqgPYvqn23ReicmloXDAak2x3zH-PtkSieyG-WWlRZeR65A>
 <xme:M263YVSjS1n4UBL9ENcdAUkwKd1uWu-R84HFWBWNj1-_N3nf6utNlnZ2urKz1j-M_
 REE-D2KEGmQ9VrGLvU>
X-ME-Received: <xmr:M263YfVawlobWIGWbrgsD-T2VnmXO7_R2LqNE51_UscyZzR6OngM0PZMg1R65uoN5gzM9RpLeBMiDHqw2tIFk0YsTlwBaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpefhkeffhfelvedvvdefledvgeefgfej
 leefjeettdegteehhedvudffhfevgeegtdenucffohhmrghinheprhhunhdquhhnihhtqd
 htvghsthdqughotghkvghrrdhshhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:M263YXhEONfR6BV8h4az-HLHV-DYW8yuJXfn5p5_RzLOO0kKxAr6TA>
 <xmx:M263YXC7XJu90iow6dwZHsird2o2-ADturu1oaTc7l4A4A3qdjedTA>
 <xmx:M263YQILCeMsJfATKsm8zRzedOJRs_cb7uFAqLC70cTbyf1yLbhUFg>
 <xmx:M263YaoBQuIu_cB4QQTt9VQj-w1Fz9-FcE0nw39ZNc6NXCxq1UetiQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 11:00:50 -0500 (EST)
Date: Mon, 13 Dec 2021 10:00:49 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Deng Tyler <tyler.sabdon@gmail.com>
Subject: Re: Run unit-test during development
Message-ID: <YbduMfjuc7TXT6Rw@heinlein>
References: <CAO9PYRKmup17BSTLNLdBMO=-HjQ2Lxw+Gcw7+0VY8DKVMed9GA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2JICsAFnVtkPB5Fx"
Content-Disposition: inline
In-Reply-To: <CAO9PYRKmup17BSTLNLdBMO=-HjQ2Lxw+Gcw7+0VY8DKVMed9GA@mail.gmail.com>
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


--2JICsAFnVtkPB5Fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 13, 2021 at 04:46:13PM +0800, Deng Tyler wrote:
> Hi All:
>     Is there any easier way to run unit-test during development instead of
> running run-unit-test-docker.sh?

If the repository is built using autotools or CMake there probably aren't a=
 lot
of other options.  Yocto has something called 'ptest' which would, in theor=
y,
allow the package to build test-cases and deploy them onto the hardware to =
run
the unit tests.  We don't have many repositories configured to support ptest
though.

Any repository that is building using Meson should be able to run the unit =
tests
on a typical Linux development box.  Some of them have not fully implemented
this though.  What you want to look for is if the repository has a 'meson.b=
uild'
and 'subprojects' subdirectory that contains a number of 'foo.wrap' files. =
 If
it has this, you can probably build the repository outside of
`run-unit-test-docker.sh` or a Yocto OE-SDK environment.

In that case, simply `meson builddir && ninja -C builddir test`.

If you come across a repository that supports Meson (meson.build file) but
doesn't have correct wrap files, those can be added fairly easily.  I suspe=
ct
you could use these repositories as a reference:

```
$ ls */subprojects/phosphor-logging.wrap
dbus-sensors/subprojects/phosphor-logging.wrap
google-misc/subprojects/phosphor-logging.wrap
openpower-debug-collector/subprojects/phosphor-logging.wrap
openpower-occ-control/subprojects/phosphor-logging.wrap
openpower-vpd-parser/subprojects/phosphor-logging.wrap
phosphor-bmc-code-mgmt/subprojects/phosphor-logging.wrap
phosphor-certificate-manager/subprojects/phosphor-logging.wrap
phosphor-debug-collector/subprojects/phosphor-logging.wrap
phosphor-health-monitor/subprojects/phosphor-logging.wrap
phosphor-led-manager/subprojects/phosphor-logging.wrap
phosphor-networkd/subprojects/phosphor-logging.wrap
phosphor-objmgr/subprojects/phosphor-logging.wrap
phosphor-sel-logger/subprojects/phosphor-logging.wrap
phosphor-virtual-sensor/subprojects/phosphor-logging.wrap
phosphor-watchdog/subprojects/phosphor-logging.wrap
service-config-manager/subprojects/phosphor-logging.wrap
telemetry/subprojects/phosphor-logging.wrap
```

--=20
Patrick Williams

--2JICsAFnVtkPB5Fx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmG3bi8ACgkQqwNHzC0A
wRkM6w/9EP89x/+4ci2LhkyoqHAoeb14Fmc0i6cUhQhtZsQoxcTUb8afS6Aa/dit
t/sxUsM1xm2uukMvRyrdDe3UM9o3PfFbwZ9fjrtKChOkBK8PyV0FnwK+kkQp6g3L
R7QBo0FGHoW4Zq4PXYlPQvvlEoqxsFvSDkA3mb4MKsYMoQ3jsoErJP2MjPohRSey
X1MI8SYgDibhFM3wrNHvD/9SIRGrlKCt0h4pOXI7DP9GpIvtp2+IQgo1fnh0hSAC
xXHIm8uMNJCWen6RrX9ENJ6s1L+xGYvyKVXjENFZY3v6PumySDcaqezu08OPZRnm
Ihy1PCYCinyxYeebdSJGTUe6VUnWdLwgLzhseMlYxhos4U4nvoZdvBheHVwpxl+A
cBu9m/RMNvJsTc8TC/rPQwiLs+vZ5QrqWhTCb7wDy+YVIPl44qcwnyPhJ/hdC6YR
leVT35kLgeDVZ0yp7eodieu3rubDxXaMKAY1Z++9uoS6XOdQmlWYDQ8OMvO9DhsQ
gkhSKmh3fv4I5baO5s5caJNMuUZyADIThYz2HLDG5mDBovK9BuTyei9Zz/YL8uDS
d0lTTH2e+L4G53oDJzFC1JT8m46FHa52FqCdN/NQPeH6ehkM8GC1bgxCB7k2j24f
/7u+ZkdVQI/WGLlrb13zDnSG5Z/LLYZHRo5705M2UAEP06iCBWc=
=LbLy
-----END PGP SIGNATURE-----

--2JICsAFnVtkPB5Fx--
