Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B721E6091
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 14:18:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Xmtv61FRzDqKX
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 22:18:15 +1000 (AEST)
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
 header.s=fm2 header.b=fLtV8lwR; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=al8Y1Uye; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XmZ51WcGzDqQr
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 22:03:40 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 361145C00F7;
 Thu, 28 May 2020 08:03:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 28 May 2020 08:03:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=7KdMbWGiv7V5R0s0H1qr+RZNXVd
 tHTgzC83Mx0yqAck=; b=fLtV8lwRDxTf/ggYeTPsCmS4pqEPT0/rnygfVoS5wdf
 iffSkQVDg/MfUDkDI8bvhFZVgt8FdJFXCSxviipo3Gjz36SjhOBbBfaRxW+0G6Ff
 xkyPFg0hxzrnKDoyKUV8VbEM+uf8vOxFDxv0NUMEbkddVuP2RQrFUvMa2B859nmd
 H+Fz+x29DBI+/rkNTXkUGVPJMenfLBYJiGkrFkreS/nXbcpHRPl9GLe0XoBX4TUi
 FcZNP2FJ8Ajr0twQlXU8TeZib1WaTBJ3E9VjlO+Y6Mfk7EJMlxUmyO+byWYHezhf
 KRev5wbZYyiHJGqcdZztv4XakcXzUJrTbXajhEutnZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7KdMbW
 Giv7V5R0s0H1qr+RZNXVdtHTgzC83Mx0yqAck=; b=al8Y1Uye3I6dQRA9AUj8lf
 YSrY+lBLLbkSx3HgUg4bEqwXTwz38bKZuDDJb3K0mTSkfT3z8r96rZ9EqfWPdtIR
 XQoeko5kQzfk4iLByktBzqR//qR4+ONkMXgDf0yC4i4XBitUqt1vfbQOxu98Kzbp
 R6Ho9EtElK1SEYPakemscxK7RQ5VrRxG7A9lg480uiPOfPvSIgpGHwPwb5fFjSiL
 +kaBFEyyfaLfuJXjcm419lxmdv4kiAXhRcDI7Uw1CtXrFl0OkH5L1zqZkEKpxA4C
 jA7HWF3U34NKBLw+Pi4HUBPpD67I+yhZIhNoFGeSJheZRHiD+rb/UjwJKk2WSl5Q
 ==
X-ME-Sender: <xms:lajPXioyi3zjYWogtdm0DGACSWfTTbzsOVlFfRF8ezo65X-1CreAtg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddviedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:lajPXgo0BAmRv79mkhtsEOHoRTsf6Q3Bl9v4D1URojSSz-DsSa0Xag>
 <xmx:lajPXnN8IzqWSqpQyld7WxgbDdtg51mEL53KizaY7d7VuayA1-NpvQ>
 <xmx:lajPXh670lv1rzgvRBvlbPjb4MyFPdcbGl193llrDODG490k19Xztg>
 <xmx:lqjPXhGXXljBjqC8mHYg3Br11IvotPeOZfEeAAcyW1kROyAt9g68Yw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2FED23280060;
 Thu, 28 May 2020 08:03:33 -0400 (EDT)
Date: Thu, 28 May 2020 07:03:31 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: Re: D-Bus interface to provide data to entity manager (was:
 Processing PLDM FRU information with entity manager)
Message-ID: <20200528120331.GC17541@heinlein>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
 <5fc67500-b0f4-c964-fc9a-d3f5346e47ab@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Content-Disposition: inline
In-Reply-To: <5fc67500-b0f4-c964-fc9a-d3f5346e47ab@linux.vnet.ibm.com>
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
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2020 at 06:26:27PM +0530, Deepak Kodihalli wrote:
> On 19/05/20 9:10 am, Deepak Kodihalli wrote:
> To do a) above, there are 3 options:
>=20
> 1) Propose a D-Bus interface in phosphor-dbus-interfaces. This was [2]=20
> in my original email above. The concern raised by Patrick here is that=20
> this interface is very specific to a protocol (PLDM in this case),=20
> whereas the phosphor D-Bus interfaces are mostly abstract and protocol=20
> agnostic.
>=20
> In my opinion, PLDM is also a data model, so PLDM specific D-Bus=20
> interfaces can enable two apps that are PLDM aware (for eg a PLDM=20
> requester app talking to the PLDM daemon) to talk to each other. I do=20
> see other protocol specific D-Bus interfaces as well (for eg related to=
=20
> SMBIOS). So I don't really understand the concern. The protocol specific=
=20
> interfaces do not preclude other abstract interfaces.

After thinking about it for a bit, I think this is my preference with
the design caveat that these are only consumed by processes which are
"FRU-to-Inventory" transformers.  I would suggest putting these
interfaces under the 'Inventory/' namespace somewhere to hopefully make
this clearer.

We have two implementations of these "FRU-to-Inventory" transformers: EM
and PIM.  Both of them have a form of dbus backdoor in order to get the
information they need to create the Inventory objects they host.  PIM uses
`Inventory/Manager`[1] and EM uses an undocumented `FruDevice` interface
between it and 'fru-device'.  Both of these implementations do
processing on the data they get (though, very minimal in the case of
PIM) and create `Inventory/Item`s as a result.

What I am worried about, and Richard seconded in his response, is the
details of PLDM (or any other protocol) starting to leak into other
processes.  We don't want people to notice that there is some piece of
information that isn't currently exposed via Inventory but happens to be
available in PLDM and start coding towards consuming it.  Hence, my
request that the design document the caveat I listed above.  We want to
limit the scope of applications that need to understand specific
protocols.

My suggestion would be to put these new proposed PLDM interfaces under
`Inventory/Source/PLDM`.  Anything under `Source` becomes one of these
"FRU-to-Inventory" transformational interfaces.

> 2) Propose a generic/abstract 'FRU properties' kind of D-Bus interface.=
=20
> This is something that both the PLDM daemon and FRU device daemon could=
=20
> use to host FRU information on D-Bus, and to provide the same as an=20
> intermediate FRU format data to apps like EM. The suggestion on the docs=
=20
> commit above [2] was to have an interface like {Enum[Protocol],=20
> array[byte]}. I think instead this could be a dict[string,=20
> variant[string, int64]], for a FRU property to value mapping.

I don't like arbitrary string-based properties like this.  They aren't
documented and effectively become a private API between the processes.
In order for someone to make a new implementation they have to reverse
engineer the code.

> Thanks,
> Deepak

1. https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/open=
bmc_project/Inventory/Manager.interface.yaml

--=20
Patrick Williams

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7PqJIACgkQqwNHzC0A
wRnJow//ZVejG5WVs0b5T+Cg9g47y2TUH1Ki3uOGPbecVZLKswEzfe+CnfBNALWh
0TbhgsRtL1mJ7RuwjACwkNDuR1MRLpgXGrkBfIKMfeB/HllhA/pWIznVUR7o0ViT
xP8Ni5mVnII445JbkxXIATsnPkPCYpz5yVOE9mwjAclesZq8XDuHacHPTXlIFttW
mPiSOHuJkolgX0EjoRWMbWDMWkQMIsGflYSg9nm+ORH/5PNkL/mDrNovE6DAVMR1
8QehBjV1PHxU3BRGqLErLGK11WTGqQU4GoCdFEMR+rjC7ay9wEwUaqrOaPvzoMjf
ZMgfJ+YDoqMWzPT9/7bYISuK9/3vBMric0lxK6Wp+PsAJQT6pMxxbs6ASpE64/Rt
1vBPCWoJlAKyevFSMMg7DvlrdT97NwRUfvpyKxtT5ueJ4dTtyTl7iiP56QPhtNnF
nG8fJX99NO+YOVASJ2lquHzMX7pJHZKCcg9YT4ZlMQDFp1OVyi8Rs7n0MJ19kHry
3iTjp6bfVNajFKk0r2GEM99Svi4TU4e5lMBbu7ChSGvFUeVLF8PAzdfOuZrvNrls
tFDUqnH9NLGpYLrIxHQvoBfOxOCaBoEQsApAAYAHYYB9GKSiWxR4kyMbpQgZOb5A
yZc/1qx2HKzfQKKwJl9AwHb0XfFin+Df9mCUjzf9I1w8PDMewK4=
=4Nmc
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--
