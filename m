Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B72821E6092
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 14:20:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Xmx40ScwzDqQH
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 22:20:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=LbBOno0J; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=3HoskGYV; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Xmj647ymzDqFF
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 22:09:46 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6EACF5C01A5;
 Thu, 28 May 2020 08:09:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 28 May 2020 08:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=g5XaeQvJVGnH04rsnIPn5Umivqs
 LXvHCfUiVIaXKjBE=; b=LbBOno0JgIa4US5e29alqNl+q0scT1scPARx8v2jtUU
 1UkO7lsxIC8CZliPfprLTHDBiPZU/aslvr2TvG0334sToDr/8nb0K2gYQm/fdVa1
 hCuH+/d5c6oxGp+o0Ky5MjpgMsoM1DZdgFn778FxGwNJAdmafI3AGPGs2lUGoUeD
 QANNGgCr527KNsgMleRkMxNipUG02vos1mo9TeTSVuLtJT//e22zT84e2w1Y6BGq
 6fRqDLteyYZjkriPsXo/shpI+UeeW7VqNgnt0BTLBei+sq7eK9xxCpvFH6YjIjLF
 nR8ASjPfgxGRABT+c03bDwieWGoNu+ntNXCOszPLLSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=g5XaeQ
 vJVGnH04rsnIPn5UmivqsLXvHCfUiVIaXKjBE=; b=3HoskGYVf4SwlEhGje+V7P
 Hwsc+sbVwSwzyzEVNKuqcCpxlJvsdzHEIgoMgLszM3C+4v3WEFzKca4zokN856RH
 HHnGBxYtYpOWC0wT34oPsdAtZNu4qnoWDRh3IkrN82g10YXdFFNheFZzvlboqAJV
 XHm6OQLXPBB0t+l8r2vRv3KisEJ272+dGzYphMPWZbzBGXUafH/xvzLrQVk3e57+
 N/vKnSdUWFHFtcFlyHO+FOUUuFzYUhLPyE1Lux94cVOw3zBM/hASSu3HVQ6bqKVh
 LnnbcKBTaau/bvms7ybAA/YirF2eK+1v2a+BDiQGokrzZQVvXSHHdUA9W3YrJtXQ
 ==
X-ME-Sender: <xms:B6rPXj9lj_mQYqZL4LLJPHu8f40TGIcGiJ_JlGKX7vWt8-j4b6zlNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddviedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:B6rPXvvRDle3I0aOT_YC-ZoUz5pEebvH_L6ao_hlUiZyrPhH5tGMdg>
 <xmx:B6rPXhBCu5Z89RXrRd5Gy0uo9Z7-byJTVoONOum1nznOC7gbvh5ncg>
 <xmx:B6rPXvfsuHbyzozbuRf99r5vKuhNnJ3ASdZrdPoZAQ-HZVM-q3cejA>
 <xmx:CKrPXhZuRXQGJa_sOgBzndXDKMev6sbodCa0mBbkmyitLFLB725AOQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id AFA903060FE7;
 Thu, 28 May 2020 08:09:43 -0400 (EDT)
Date: Thu, 28 May 2020 07:09:42 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Subject: Re: D-Bus interface to provide data to entity manager
Message-ID: <20200528120942.GD17541@heinlein>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
 <5fc67500-b0f4-c964-fc9a-d3f5346e47ab@linux.vnet.ibm.com>
 <0a9b8934-a3be-aaa0-90c0-134f286df951@linux.intel.com>
 <c2872079-ffba-1788-69b5-50350e21f1a3@linux.vnet.ibm.com>
 <55702d05-66c0-275e-880b-06e6c7c1203e@linux.intel.com>
 <531a5ace-1537-dcc1-33c7-427470dada8b@linux.vnet.ibm.com>
 <5633c1da-1ca7-7913-6bcc-321b7663528b@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3Gf/FFewwPeBMqCJ"
Content-Disposition: inline
In-Reply-To: <5633c1da-1ca7-7913-6bcc-321b7663528b@linux.intel.com>
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
Cc: "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--3Gf/FFewwPeBMqCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I already responded with my overall design preference but had one point
in the chain I wanted to discuss a bit more.

On Wed, May 27, 2020 at 10:49:38PM +0530, Thomaiyar, Richard Marian wrote:
>=20
> [Richard]: If we are choosing this option, then we can use the existing=
=20
> Frudevice interface and use the PRODUCT_XYZ which is currently exposed.=
=20
> Almost all the PLDM Fru content will match the IPMI FRU, except few like=
=20
> SKU, version, description, Engineering_change_level & Vendor IANA (which=
=20
> we can expose as new properties in the same interface) ??
>=20
> i.e. PLDM PartNumber is nothing but PRODUCT_PART_NUMBER in IPMI Fru etc.

The current FruDevice interface is effectively a private dbus API
between EM and `fru-device` (which is also in the EM repo anyhow) and it
doesn't follow either our dbus practices nor widely accepted ones.  Here
are a few reasons:

    - FruDevice instances do not have the same properties.  Two
      different IPMI FRU types create a different set of properties, so
      you end up with dbus objects with a variety of interface layouts.

    - The properties exposed are not documented and differ stylistically
      from our existing, documented dbus objects.

Right now, if we need to implement another FruDevice provider, such as
will likely happen as Facebook implements our multi-host system, we have
to reverse engineer the code in `fru-device`.  Ideally this would be
refactored into a set of documented dbus interfaces under
`Inventory/Source/IPMI` (or some equally reasonable name) so others
could implement as needed.

--=20
Patrick Williams

--3Gf/FFewwPeBMqCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7PqgYACgkQqwNHzC0A
wRmaGQ/4gwc7000lckBWjS3tZjKLuAaUw8wo0X50dzFh/kr6wAiH3Eum67U71zyr
F9qYQJzjUsRs9jN5fq/HgyYzuapeeyEomi48rjq3aIk9LLv39zR/S0vdEEWNpnuO
QHT7tkeFzClZ+DGgwa6SO8S6+J6wFXaP/rwcKOiRunD/OEN1Xl3kUNYyKGwUZ8Kn
A96PuF4yDsB3l85G2B/SRdqrmzpdWjgrOgDAUCXSwlbmRXk0fdI5gtz7YiziD/5w
tDDnIpSyvbG7ug+SkVmzuffRT/pEzicy3/nbDAR3OypKAe96U2Z4VOH1KfkJrPzc
1PschAqkNt64nf4WIfMWtg2OoqhdmYXXcBWpZPKb0iKjY+oi+AtPZK6OlktYdeOm
NdB0Xj8SO7tuvKJK8cSj0uV9uxrDmP+8mbj2UcS1TYKNPanRd1BGrKEptVWaVCx4
RqAlD7dkk23V+x4eZLZj0cPyQZQmZkoS4QjJBaIg2DONrInBpw7LyZjvzSLky5IT
oT5Uslk2AwpitHPcBSHmPML8Dip/GZu5bB3RHImzpmRkzkxZGQNtCK9DcG0pBLW/
bo8Y5/oYI41UpyghUPyLEOZZ6403NGAXRAlOsKaMEwDc3AUW7XKV/iMj10eHPEz5
Crpx3pweM3bV1YJ/6VYewACokbZuQEihkszfKx/WJdiNFOD23A==
=Tdyh
-----END PGP SIGNATURE-----

--3Gf/FFewwPeBMqCJ--
