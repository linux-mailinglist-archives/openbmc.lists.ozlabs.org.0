Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3B01D20CD
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 23:20:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Mnct16cjzDqg3
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 07:19:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=gNzdIgQi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=xn/gkVi2; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Mnc31l5LzDqfN
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 07:19:14 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 8017F537;
 Wed, 13 May 2020 17:19:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 13 May 2020 17:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=pNiNxgiwgVIeO5D03mYNlMrHdNT
 dy7454je32Spc/p0=; b=gNzdIgQiZHlDyQjzuQxercXLatDzKFaSUYIdzkdTRbv
 OEGkhu4ZJp4YyPJNNzotW3992kdOYxovp1TmMc60I56anQ4Qub2zCFBrPdxtqVP3
 Lp/QQfL3a3B97byudj6b2zlM2h3qE/DfrKmr/FHV/HdrU6yRZfgGHYwASE+pUjB/
 4oXP2nvFW/S85TFVWGXMet21pzNHqPDEArK3kRfdEVW0SugrfT1iqNoSjwAu5+hf
 ox6OWXK8a6kt/kjufZe7BtJcr8dhwaVvK5YJ6nYXCvwG83IJc+tbtE0+LQxPTzPK
 cwuXCB3hNl/cuOrNNxa+FdzqeGIBzgAijCEC6YTQvgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=pNiNxg
 iwgVIeO5D03mYNlMrHdNTdy7454je32Spc/p0=; b=xn/gkVi2SkbBxY6BtH9301
 WfRLRanmft+IKay6K4bsfPLAO3UrklQhECI+y1EQEVhn4S+YrQ9A9u+Gt7uDXYxB
 eSOeKoe25/wBn6WOkfNXxQR7OFXi+WiWLVwOyvHCTEbMvXmiH08PvhQxRKA3MHYr
 tG7JHpGskZWD9E9/SO/22+oec2sjx4jrVqURQlKxyY+RtBUvdVsDOCZIzm/ZUczh
 ByAT7yPqOB3vSZNLQVeK+hUoplDtyU78JzBw/BGflKpQ8pcDYk79BHqdHSo+vs4A
 kUKImmCquPmU02y1kzHoW0cuAkMcGUJgmClFJgmsuS6iKJDEPZPxCRSuaVik+ljA
 ==
X-ME-Sender: <xms:RGS8XmCszTC_aQ7IxoQBMqnjIsUb78h58BQQL6Qw_sMKA7XLqcX0sQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeggdduheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:RGS8XgjB5gAQNyieOmYOdGG9YWRdYd9ijd5ZMW6Zgyu59gP2reUnSw>
 <xmx:RGS8Xpm4bY55PutfVOUWNkm0OL8eeOdyOVTQsnxt8ihXssIQvrvF8w>
 <xmx:RGS8Xkx7gFiD-pPU-Ye_UBNruocDYc7iMRqbDYGlUEov-QCjArP8Xg>
 <xmx:RWS8XiIkd1ZwWtrpbLYTuZPij5xzFajVjeYg0l1wcEl3cXJsxhQRZg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7D9933280059;
 Wed, 13 May 2020 17:18:59 -0400 (EDT)
Date: Wed, 13 May 2020 16:18:57 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Sunitha Harish <sunithaharish04@gmail.com>
Subject: Re: Storing host data on the BMC
Message-ID: <20200513211857.GA1166713@heinlein>
References: <CADeuMvXQfS01sdwpiM+POkaqdVesj64XGDqPWAPreo_TPbuV8A@mail.gmail.com>
 <f4df91bd-d60c-5f4b-ef08-2e3fdd163b4e@linux.vnet.ibm.com>
 <843851ce-b802-05af-2949-c3aa828aead7@gmail.com>
 <ec87d606-9fa9-014a-bfa4-e56f94f6747e@linux.vnet.ibm.com>
 <342b5672-2adc-a6d1-f60a-085847d69584@gmail.com>
 <43685475-b4fb-6d09-a248-01a52ca382fa@gmail.com>
 <20200511120719.GA10214@heinlein>
 <0000b55c-29a9-b0fa-b72f-c4f19d4c7d12@gmail.com>
 <8db810a0-6bc4-5ad5-0f54-f739fe6dde81@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline
In-Reply-To: <8db810a0-6bc4-5ad5-0f54-f739fe6dde81@gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, dkodihal@in.ibm.com,
 suryakanth.sekar@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2020 at 08:37:32PM +0530, Sunitha Harish wrote:
> My scenario is :
> 1. Redfish client sets the host interface parameters for the IPv4=20
> address. These user settable values are stored in the DBus.

Ignoring which process "stores" this data, we have two mechanisms over
DBus to store this kind of data.  I can't tell fully from your
explaination which is more appropriate for this data.

1. Data we want to split out into well-formed, existing dbus objects.

    * We already have interfaces to store networking information under
      xyz/openbmc_project/Network.

2. Data which is generic / opaque to the BMC and we're just using the
   BMC as a "storage location".

   * This would be the proposed BIOS attributes interface.

So the question to you is, do you want the BMC to actively interact with
and manage this data, like we do for our own data, or do you want the
BMC to just be a dumb passthru of this data?

> 2. When the system is powered on , the pldm reads these DBus values ,=20
> and sets the BIOS attributes.
> 3. The hypervisor reads this BIOS attributes for the interfaces and sets=
=20
> them.

It doesn't seem like two steps matter with respect to the 1/2 above.
Where the data is obtained in this regard can be self-contained in your
PLDM provider, correct?

> 4. Now the hypervisor sends an indication to the pldm that the IP=20
> address is active at its interface and its Origin is Static ( ie : user=
=20
> configured) OR it is DHCP ( ie: not user configured, if its DHCP enabled)
> 5. The pldm should store this Origin value "somewhere".

This description makes it seem like you want it to be more "managed"
data than "opaque", if I'm reading this correctly.

> Redfish client would need this value to interpret where the IP address=20
> has been Originated from. So we need a DBus property to save it. But ,=20
> this is actually an attribute which is set by the hypervisor/host - a=20
> pldm sensor. Its not suitable to be fit into the BIOS table. My=20
> question&proposal is about how/where to store this value?

I think we need to be careful about being hung up on the name "BIOS
table".  For opaque data that is more OS-centric,  we could  make the
proposed "BIOS Attributes" interface more generic to store different
levels of host-owned data: BIOS, Hypervisor, OS.  This might be a good
comment to make on the interface code review.

If you are wanting the data to be managed, utilizing existing DBus
interfaces we have around networking, doesn't phosphor-settingsd cover
that from an implementation perspective?

--=20
Patrick Williams

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl68ZD8ACgkQqwNHzC0A
wRmzlA//RoODHfwTACWU+WbiMeZbgekVoBLlD/KD8qz0TgAvfW2KxFodXsAesu2H
cdP4BkDkItZ7dWCGTGguI6bQabhfutHRDPtP3LNMUvYHbaUcHVQu1I1ih8H6mENG
M7dmxI8l0dQyZOP2m9Zexj8i9LEYkvraIWeLiwS+ADadSWvmbZ0GbGjFDrxqjw7V
Q8hPuB3mfovIt6dqpONyKENQs0wtYBnz/YoZhpGamNkkYe7mrqcshwaF0jNprrkC
IVTPZiroraTTPpkYVVSLUkcLlXg+J/tHp7+rxQoRmUl3K8hzA08gh6H6d2692Av3
JYbm+5hkySuVgyrqihWA6tqqD/Zv5TIgAq5hG/59sWgExTTp8gIOf0bfAm62GdId
Jzv9SvFHGYc4EANrU19bqAGZTgSDeVBONducIODwgWToZGtta0Qt9QuPQEIN7Gw0
dyILb9LGj7lHnNPHBAD6dGn9EyoTZuCEpPkAj9iHxMfnOOMxhQiOYTVHWqhdPbMj
JSpFMFJpR4Gr6NmKRVe56mDA5vLBbdDHnTOnNt42ch6iPqNyxxsPGLwEeT6BjsPJ
/VWGBWbFkA458XrIEIWinSAMQi2UFbGvP3yFtjF9fMrbTnj5vY03dJDMJqU7d8lq
pNUQQzPpULbCdP1l+Uw4tc/5RnmHEOELtHQpn0wgKPecT1U9tT8=
=ANn8
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
