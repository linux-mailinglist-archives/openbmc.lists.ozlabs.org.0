Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A26EC9199B1
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2024 23:19:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=zAP9iAhl;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=R5JEhvLF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8ZMY11g8z30TX
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 07:19:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=zAP9iAhl;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=R5JEhvLF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.152; helo=fhigh1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8ZLw5958z2ysg
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 07:18:47 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 92CC7114016A
	for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 17:18:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 26 Jun 2024 17:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1719436725; x=1719523125; bh=O+FhKVgwYe4Uk6Oa43O1bCK87W9/+8Nh
	mzgT1itxWPI=; b=zAP9iAhlqFQ0jICWkBV2ugirDQiHbigZQ1cEbJJIXYzg+12v
	yQJ+w60JaOJzwDX6tkEs+Xviyrv4w9d4/Zs8s/JhSHjPuM2iyertKtutW5WmmPv0
	TuUEwUr2XLIzWLcafNY+DZDJ41bsekW5b52pf8pg+NubZ8XrSlfo+iTLGvbwYWjJ
	Iac4Sakcm5tvX8y/N4Rs5WVccWC7qQGIlabLg94BwAgfeYui2exIbrmurOsTx3G0
	GqVe92V0BDDrTMdcRQl6uyjbhyEGJZf/xq/0F14TB/EqFZO4iPUtmWIScDg0Ks4b
	gHL5F4xjMVRTbRG/AMBF1B5vbtm7ny6Jy8K2DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1719436725; x=1719523125; bh=O+FhKVgwYe4Uk6Oa43O1bCK87W9/+8Nhmzg
	T1itxWPI=; b=R5JEhvLFurm3WeMuf+dlqEdnd4r617m2Nm9fL88q8SEorg923Xi
	RQn02rJHYGt36EJVSTHnX19jQJ/2+WYa+Rx18ItAtZn1Ojniv03ubDMRlbQ1sfnq
	SuEdcuPL0J96sUo35Icbepl/GWyUSHw7sTbYSn1Ak8GNe7ROo/xSz+Ze1il8kvb6
	6x+L2AqTFlzdMiqJMaI3ZLo3jRLLhlkdU7zwOv5DvtFDEqlXBw6MNB1Z8ejlRV/l
	Rc624U5J1e/ubJXWi6pKe7/18gOwQOMlJJ2WOI//5V+7vNZRNGLchGGYaUa1Ufm0
	n5GuA+4sHuP8LuKMy0phB7sxtwCBRax8+iQ==
X-ME-Sender: <xms:tYV8Zj24yOpiXOaw6oySj1zNP49rou1cL-iZGPTsMapWsjDLkMPiig>
    <xme:tYV8ZiFcL1OgpRXVcEdPWpEp5orPnWPl1X3tUBE1SbpsM34k_kz3hx1AUmRi3aieW
    NdPShz_KWOE5cdztpY>
X-ME-Received: <xmr:tYV8Zj44vHsDLSpfng3Xu8isjhuFbAuwtoUlAEV6On0Ywhfti544IvzOU3sgmfGU4Y2heR8DCmR8q3Ofxeryl6oQRAt22EBLABc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtddvgdduieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnhepffehgfdtudektdetuddvkeetgeehlefh
    vddtieffueejffeiteekvefhjefhueeknecuffhomhgrihhnpehophgvnhgsmhgtrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
    thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:tYV8Zo0St6sdMoSjGmxGXkV8e4kkit69QM51JgwfBUqnpTpt9gn9tg>
    <xmx:tYV8ZmFY3TOiPIBrWF5-U7R4nUIjBEg18n3QRNMdXmoiYbnqUc7Llw>
    <xmx:tYV8Zp9j-ArsZn5Nlmh_ROlZ27HlM9uimyE-f-pv5tt-7_hkzMjnKQ>
    <xmx:tYV8ZjnWdADYg3k3L63chffQhEXWYuoJ3Iin_Zolb1TKwUmRcSUjqw>
    <xmx:tYV8ZoMC1zNvB6PFKlrfw1hgjiMcH4AgNM0L22E7B8DnKrE2eL0Ejj8I>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 17:18:45 -0400 (EDT)
Date: Wed, 26 Jun 2024 16:18:43 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Redfish multi-host hint in entity-manager
Message-ID: <ZnyFs6UV7naWgp0O@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ojR6c4R1MU1sf0dB"
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


--ojR6c4R1MU1sf0dB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I wanted to raise awareness of a proposed dbus interface to be used as a
hint in bmcweb to implement the multi-host Redfish support:

    https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/72414

Meta now has two systems upstream that are considered "multi-host":
Bletchley and Yosemite4.  This means that a single BMC manages multiple
host computer systems, which are usually populated as some kind of
"blade-like" device into a larger chassis.  We've been enhancing most of
the backend applications over the last 2 years to facilitate this, but
we've been slow at getting Redfish support in bmcweb for it.

The original design in most of the applications was/is that if you have
a dbus path like ".../hostN", then "host0" refers to the single-host
system and "host[1-N]" refer to individual locations in a multi-host
system.  While this design point is relatively easy to implement it
presents a challenge for bmcweb: how do you define an external endpoint
URI name and map it to internal dbus objects?  The typical "single-host"
approach has been to hardcode a Redfish URI (like "/system") to the
corresponding single-host dbus object.  The preference from the bmcweb
maintainers is that this is done in a less hardcoded way.

The typical approach to this, for elements where we have multiple of
them, is that bmcweb can do some sort of mapper query to find them all.
Sensors, inventory, etc. typically operate this way.  However, for
multi-host backend elements we usually don't have an obvious way to name
the URI due to differences in path leaf names across various
applications: hostN, postcodeN, etc.  Ideally, each of these backends
would have some consistent name, path or association to something
consistent that bmcweb can always use for creating the URI, but this
will take work.

My proposal in the short-term is to use entity-manager configs to create
a "hint" interface for bmcweb: Inventory.Decorator.ManagedHost.  This
interface will have an index property which can be used to find the
appropriate backend.

A quick summary of the design and changes would be:

- Inventory.Decorator.ManagedHost is defined and implemented in
  multi-host entity-manager configs.  This will add the interface to
  entity-manager paths such as
  "/xyz/openbmc_project/inventory/Sentinel_Dome_3" (with index =3D 3).

    - https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/72414

- bmcweb will maintain the existing "Systems/system" URI for single-host sy=
stems
  [for a time] (using the redfish-system-uri-name meson option).
  Multi-host systems should set this to an empty string which will
  disable that default URI.

- Inventory.Decorator.ManagedHost will be used by bmcweb, via a mapper
  look up, to determine all of the ComputerSystem paths.  This means
  that an "/xyz/openbmc_project/inventory/Sentinel_Dome_3" with the
  interface will cause "/redfish/v1/Systems/Sentinel_Dome_3" to become a
  valid URI.  When bmcweb needs to interact with the
  phosphor-state-manager objects, it will use the documented convention
  and the "HostIndex" property to construct the dbus path.

- As time permits, single-host systems with entity-manager configs should
  create their own ManagedHost decorators and after sufficient time has
  elapsed the `redfish-system-uri-name` option will be deleted.  [I'll
  let the bmcweb maintainers determine the timelines here but probably
  at least 6 months from initial support.]

- Once we figure out the set of "strange mappings bmcweb has to do", we
  will follow up with design proposals on those repositories to create
  associations back to the ManagedHosts in the inventory model, which
  bmcweb will be able to use directly [approximately 6-12 months in the
  future].

Are there any gaps or concerns with this proposal?

--=20
Patrick Williams

--ojR6c4R1MU1sf0dB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmZ8hbIACgkQqwNHzC0A
wRmL2BAAn6VKwqZjONLk4hJ8orqNOVWFeCkcdY9aKPjUQZDGOVKC3wjD7HQhihcl
6M502/2+/Xcar7rbCooXkebMnNK8CvkNUK46gz3r15jOE0HVpnItld5RVCdvBONb
FJi4E7uk7BFnhiwF9z9set4umQ+fvwCRJhRTzVgcu2EReqymtgRI2DR50NunBS8b
bxSr8LfKfMW8428epHpyhAf16SlyE9nn/u6Xqvt1cAYbHqNFAxehtVTAKicw/9IA
q5R7P/TOLquV3n/KEeIiiyLg3O7bgZ3kuGqd1olWgi4i/Vh9KSlpHZ1YGs0Fkx4B
udYGHhleKCosxEUw0mSPmukTw5GlCEEICtKpq1g6qmD/vm61kHxsy8jnQufrbI9L
Cu0s3gep+s/FGF2g3SxKOxUm26g1pNO4Rmp/A9hRZOjSIqfYFwRJljh+W4lk2wMA
915kS7+JnKpN59B8UaFz3zLPFCrrT+2lU1M/nJ9orNVTDFYvo6vY5jmlgl+I0cVu
DGiWp78ozIb+vqfSd23c/sKA+Mon0ZJeuLpRy5A8hJatuo+m1HqW4noi7bZ4vWwG
+APWkmC4N+2NK56pr2UcxYxVIPkSFJ9jG4ht3VRisV75Nd0S7DJbjBnJvLk3MiJ3
e+/cdwa44/z8aVKwgRmIP9fExccNeMTSdoGJ8+dZGcmF2PtqSbo=
=NihN
-----END PGP SIGNATURE-----

--ojR6c4R1MU1sf0dB--
