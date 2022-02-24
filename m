Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0134C3693
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 21:09:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4PC05k5Kz3bZY
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 07:09:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=eQtVCrbm;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Zv0QTw8b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=eQtVCrbm; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Zv0QTw8b; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4PBV0XDSz30DX
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 07:09:20 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 78DEB3200B23;
 Thu, 24 Feb 2022 15:09:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 24 Feb 2022 15:09:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=JdJazFggtXA0w3cUXm97VFOSZdklElguwNdpb/
 174KY=; b=eQtVCrbm6mmcIp91jw6qX3QMy5WdpfWGIBYQQt0XXF8BbcP/Q8bs5J
 YwNcTFQVOC1V07RuGHXmUW/MwoQdf2FUi123EY/wRMJqLL8plAdqdyw2QVSDVIIE
 LTANYU1ctsAZBNq/8i/xnGRKwHBAHY2s8ly8fH0QC3mdFE/nyqNMqr3lZLWwRJYv
 WjXGSr3OryNK2nFhZn8DA1ImLaWL/SvPQgs8jh2Lvr8GzTX7MT5c6mtKXefJtPm3
 VkzSv28XrV/mkPDkyQ+nzfG2GgVHj2G7AP2w9v0bhoo2Y5eHmbVMzV2QV/ohl3o3
 vWWNdr3f0CrTZtcB2tMzADznuAJRZV6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JdJazFggtXA0w3cUX
 m97VFOSZdklElguwNdpb/174KY=; b=Zv0QTw8bPxkQAat1BUTX3pw9OD5Y1pt6u
 GjU/V4xvhj67V/hsOeUrVSwgPdKuSDjv1TNfCk6K/b5Q6Ieqvb2CiLBP0bB1eXOT
 crm/dtMmsdWO20D70ywUxD3hj+i6xI1fv9sBGamqKrJYYUmPlFBnLGB5pkq5Bh1q
 Ee7T2nIMukVPhlJB+e0P7vCeIi5YHHMYladkWajHvWSpxfek+E6zld7xwyr0cd3J
 TjLnHZAdSI0dxjHtdWyij8KZGR6did7VxzAQO+1r8xo3p6ztJaLX4G3sKOl2TwuG
 lHJEJzAImqrRqTnbdo48PnyybEojTcH+aofLrdz6rUGUUNbGvabkg==
X-ME-Sender: <xms:6eUXYgwZrzHDkjN4b6R1DVtQVdpDdBxtpThFZIyz0qU_oMBVqqNV2g>
 <xme:6eUXYkSOFD-WND5JxiDCuF31jT9Cb4vr1IW5bw5psJQv15qwgsqWoilMKnCGAWzgC
 MJEmP4y9s-XrqvNUOY>
X-ME-Received: <xmr:6eUXYiUDomnKTKgPRAo1bYL7G0k4Nfg4UVHAXcPiioOWh0ExnaKprcbnuVPkTDIOZIpbUsxgeDLUt68fXoEikpd_ZJ8o2EAwQU8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledvgddufeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:6eUXYugAzsmYtZ1hlxqUpSVXsMN9OzyE5zCPRO72VYhfniWfXyIPSw>
 <xmx:6eUXYiCXqkPc61rbORvuut394Iurluy-ieox-FyOtpDPYTzV4ivuYQ>
 <xmx:6eUXYvK0z6XXgJ-ldleDWgHItkpOvQaGyMo_W_YSztZ_TUqCiptzow>
 <xmx:6-UXYtMGy7tv0qcpBGKLRhmbe2jrPJaAeFtvzUOYzAoqP-V2SrOrBQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Feb 2022 15:09:13 -0500 (EST)
Date: Thu, 24 Feb 2022 14:09:11 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: Checking for network online
Message-ID: <Yhfl589tw2oeLJ9C@heinlein>
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
 <bb39999e8f9638da3d29b865d85fb54d51da9797.camel@codeconstruct.com.au>
 <CAGm54UE1bFeLF9PHUuj__E0m_+CxLRtA4Htrjm4y5M3SnbOhLA@mail.gmail.com>
 <37a29642-788c-b966-3b58-214c3d44c8f4@intel.com>
 <64727f8e-cca3-b04d-e4cf-709ceb60f37f@linux.intel.com>
 <YhY7Kxgg6ew0HdUR@heinlein>
 <112c8819-24bc-2a24-45a3-9c919088f43a@linux.intel.com>
 <3f4f0cc0-7967-66f9-a085-a6b2ae978a01@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LPSpJvftoYwhB0R+"
Content-Disposition: inline
In-Reply-To: <3f4f0cc0-7967-66f9-a085-a6b2ae978a01@intel.com>
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
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lei Yu <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--LPSpJvftoYwhB0R+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 12:04:12PM -0800, Johnathan Mantey wrote:
> On 2/23/22 09:44, Jiaqing Zhao wrote:
> > On 2022-02-23 21:48, Patrick Williams wrote:
> >> On Wed, Feb 23, 2022 at 10:09:19AM +0800, Jiaqing Zhao wrote:

> There may be openbmc powered servers that do use the distributed logging=
=20
> provided by rsyslogd. If there are then globally removing network-online=
=20
> from the rsyslog service file is undesirable. I consider the same to be=
=20
> true of assigning a default RequiredForOnline=3Dfalse.
>=20
> Based on the above, it's my opinion this is a vendor based decision for=
=20
> how to configure rsyslog/systemd-networkd-wait-online.

I agree we shouldn't enable this globally, but that doesn't mean we can't a=
dd
a simple PKGCONFIG that allows it to be enabled/disabled as needed.  That w=
ay
we only have the single `PKGCONFIG:append` line in vendor layers and vendors
that have a problem with it can leave it same as upstream.

--=20
Patrick Williams

--LPSpJvftoYwhB0R+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIX5eYACgkQqwNHzC0A
wRlWWBAAo2/PX07wC7jihoQzmB9ywRvRwPRncFPC4ZP78GbEXzBgwycXh+ADkdIu
gtwqI44zVlxfvda6mANBPbFQ8w3t3BFMDaekzthv59U6a7TfccwLrs48JREwqxTk
uR8Tr/lwDKOON1qVb/4l+96//txQN5VWwCpsm6yUTvuMOt/qnvWSqW/yoJr0Hz2n
8cbdxXQbPkvrNJCx/w3U634S5g6sZFpTOw1RLXm9aPJ57Aju+wC/yaFkX6gCYBzu
4ERo1xYTq+Kv2zO46MFIR/7sna1v2Vch/9q+pihZ1ex4s7BZlv7w0hhAbWeTIXHx
gic270TTWft8T0CRiRHCaYFVanzLasN0HOm/VpLonWUmE4i2JgOFS8DyBfsoc1us
fqYOf7Q5/BuX9FiWU/m8KuQgXTw5xnpYWE478tiOgWVQbIx/ZIusDd6Uppim516P
UkzQF0p+6ZcDYYKK8xhqZ5nrllMLvGOPOAf9hnpca3frl9aPsQ+tsl7XBob4XSWN
pTXw7XXKeeXuSxhEeZ/LdwJomQA5mSKSteIqmr6USQ08/UF7xsrgBE7g9T1z+xk0
9pkCzoiH84f7uyTWgIXswS2XwtLZivTNABsO6PDZIpaNbE8LijoiAUyxyiKJXwNs
ieL/iKDiTtpp9Ic0wcBAhkAmiM7xslxsQ3osiGSboS64bFLWQ60=
=SCFS
-----END PGP SIGNATURE-----

--LPSpJvftoYwhB0R+--
