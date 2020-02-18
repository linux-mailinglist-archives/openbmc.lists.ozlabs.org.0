Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1FB163384
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 21:53:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MY3R5SxlzDqbg
	for <lists+openbmc@lfdr.de>; Wed, 19 Feb 2020 07:53:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.17;
 helo=wnew3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=pGjvrli6; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=CibKAbGa; 
 dkim-atps=neutral
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MY2Y2b3lzDqSk
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 07:52:37 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id C6A875BF;
 Tue, 18 Feb 2020 15:52:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 18 Feb 2020 15:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=2VhQBkgOAWvnJ4p6zCvworkNsV8
 Xn5kN/ZO8o3CVl2M=; b=pGjvrli6wMNLqcjjq/bKnRZLfyD6GLybkgnNJ7+FBma
 LPgsu+eSo6TqEy9m6a/XxpQaU3TmPv/o8wHaQ46NUeSUzZDA4JE+BerYRuFWmxQh
 eZLq02zQIAHaHrBeFA2hJPT55nJDT6t/zq3cARx1GDlY9VStRq4MqKS90OEet8Ez
 IkHRyhuX58Bj1fJtAslAbymaZnNn8w4nsy3vNXLAZBHMTdJwA8O5CM09Aksvvs8K
 Hota0wGsHnxRt12iaPj4w6le5P3QG6/b854HME+lbZaDfs4xGKP5qkNWzifOo9HF
 LlijpqMUyrc3HoI45QceVPoaOy28Y08QEq4+Avaie5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2VhQBk
 gOAWvnJ4p6zCvworkNsV8Xn5kN/ZO8o3CVl2M=; b=CibKAbGaJJN8vV6TkCmcp1
 /A6gaHjGR23ygO4OIysDQsUmHYahjofGtsKAZYrRytxt8aFSD4/E5EZ0n7uVlYgy
 WhWMoTN2bX9QaX2scopdpWlEFzU2s3F6jTqqCedkTaHnCgG8lT3wmMqwhG7yfeZT
 AQEDYNSPQqj4O1FcSCwB9AZOJvx7wI+gcZZDlMca6Nodll7zYpQ0IosT5VYoLXF6
 JTyjvvjnzdh3MiwGWFpBv0H4MoCt8SYGad10f/cwzFduwA/77SZ/IwImlLvdymu+
 tSkVuFJKAn8WaxF2ERtha+GsD+C5m3lKj7QN8G+deSVlduvHZ3Dtduh+fJNEkIEA
 ==
X-ME-Sender: <xms:kU5MXrWaY8NFfYbOS4adDYf_KkOJCHQJXN_dOCviJM1rb5QjqUT3UQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeekgddugeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecukfhppeduieefrdduudegrddufedvrdefnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfi
 gtgidrgiihii
X-ME-Proxy: <xmx:kU5MXn1yaORjT3papzJLJRNgRmj-SA_IzdYfG7GZHv95TiUOj5Gqsg>
 <xmx:kU5MXib6O8r4YgjiT513lwO7aWtS8bIIURvOcy2_iPdutHfllJK2kQ>
 <xmx:kU5MXqqvTpx7M57R2B_ZwCssdgW6rWEAvOS0o5209PiY49fo1uyF5Q>
 <xmx:kU5MXsqlB_le3P64lEn6CJPe34q7XRi8kp6XUEDWymf7KXQ8E0XVesH9fv0>
Received: from localhost (unknown [163.114.132.3])
 by mail.messagingengine.com (Postfix) with ESMTPA id EECD9328005A;
 Tue, 18 Feb 2020 15:52:32 -0500 (EST)
Date: Tue, 18 Feb 2020 14:52:31 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Request for Feedback :: Time Mode setting in timemanager
Message-ID: <20200218205231.GD2219@patrickw3-mbp.lan.stwcx.xyz>
References: <68732B2D-EB7D-418A-86D9-3095223A31FB@linux.vnet.ibm.com>
 <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
 <20200218202507.GA2219@patrickw3-mbp.lan.stwcx.xyz>
 <25B4F046-9688-4F23-909E-A5D929349E84@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oJ71EGRlYNjSvfq7"
Content-Disposition: inline
In-Reply-To: <25B4F046-9688-4F23-909E-A5D929349E84@fuzziesquirrel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--oJ71EGRlYNjSvfq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2020 at 03:34:02PM -0500, Brad Bishop wrote:
> > On Feb 18, 2020, at 3:25 PM, Patrick Williams <patrick@stwcx.xyz> wrote:

> > Most of these design points came from considering how it might be best
> > for a cloud provider, like Rackspace, we were originally designing some
> > of this code for.
> >=20
> > If I'm leasing the host processor from you, I don't necessarily trust
> > your time infrastructure and might want to use my own.
>=20
> Agreed but what does this have to do with what is going on, on the BMC?

When the BMC owns the hardware RTC, { Manual , Host } is the only mode
that allows the Host to utilize the RTC hardware without being subject
to the provider's time infrastructure.

What we talked about way back when this was implemented is that someone
super paranoid could use an inband IPMI call to get these settings,
confirm it was in { Manual , Host } mode, and know by design that it
won't ever change out from underneath without a reboot.  If it isn't
part of the design, I have no way of knowing if the provider (or someone
who has compromised their management infrastructure) has reverted time
control back to the BMC while I'm running.

--=20
Patrick Williams

--oJ71EGRlYNjSvfq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5MTo0ACgkQqwNHzC0A
wRnVUQ//WLszgGIrN+b/v0aDmM9OPIs7oNAZAuvJ0I3Hwd9nUQrShKHLK2LGGE64
hrlxe7NRtZDINrSYDMWzNUtMwrMyx+onD2BnCK44j2wm5+fc4Iefv0F5MrsHjChW
orMM2It+RZ75jA7CRygObPEE98f3/VWE2grASRcGDt5SPWGt+Y8hg4x2pLknAO9d
jq37csIcninbprfIYNJFzWSm9u++aihW8LSCdncTUFj2AOjOnBgyMWaPSDY97Fmb
XQiUewsdqWYn0EH5NQG/s1HyCZ3gcV2JCvQ1549ojfsrY31IbjMSPeUovATobRVu
Xz47kKfJI/oo9SrI4ztY5nhbrZHAjdIbs6aIKd4w16DDBeHqgImPjot3WOlT1P3u
T67U+Zv2yoz2ebFs9gWHKA0naj2oP9PcWJY/PlOfMIyO3uGW4iLWUYNYPHFVXkh/
EesB9HtKv044rmVQqwNgRQcr/QRl1dHmdQIOsXTlsF2ovqnFMXHj00O2CEOjZSoC
8hdaZvO0aKFm+Eck5FoO2dBCQY0TXs4T6FTncgoDZRLTnymLMDQeQDKbgkIziV77
1g6SHPVRMhH/ecBw8ynEMhlcul1PwaNrFGj0X3ZHX/uiSn0aWboRg/eBM77wyJfR
dqbiRJmnElFQOdzIXIb+St6VcSNjwrfpqb0uOwxoGA+imU+FTbQ=
=0b8u
-----END PGP SIGNATURE-----

--oJ71EGRlYNjSvfq7--
