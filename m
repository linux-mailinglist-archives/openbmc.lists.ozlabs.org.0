Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C431E690A
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 20:06:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Xwd831RHzDqZk
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 04:06:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=WJAUcm3B; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=4nJH+4sv; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XwcC0SyqzDqZF
 for <openbmc@lists.ozlabs.org>; Fri, 29 May 2020 04:06:02 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 45CE05C007F;
 Thu, 28 May 2020 14:05:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 28 May 2020 14:05:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=yARL/VFA6YPY/PKIeLEWFewrcXA
 7fCoCGu/LSSzbbKc=; b=WJAUcm3B+RqFgNAJAjF6cbw3hqhTKPxJuCOGwReX15t
 MPnIDo2QuKb92LL1j8vwFCa/QJiP3MEHsRmfxrXN7bgb2oc/DdBZOI43W9bgd4My
 XzvEwG6Bt/fobmdIda24WxuSec26Yf3ntUveEKHEIX07CKm3bQUQHUDtRu6FETox
 hC7JwHZptTzRssRCfYzb/v8jrq82HRAMWwEBRp8SF/5oZOQwqfYamP7NGUsFJgGO
 LJ0yF9wsy9+aIat8fFg4IRjydMlilMtTTmPZEBJp1wm1uycgF5S7iqASbIN0TlgP
 WBvKbP6pzQODdAqKuYJZYybHYbDQmhvDzIuZZAKe/0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=yARL/V
 FA6YPY/PKIeLEWFewrcXA7fCoCGu/LSSzbbKc=; b=4nJH+4svJ32PYAYF5U/tCU
 h+tgFtCzLmmIKuRDUwQ/jrevhmROcI1CH1pPG/L3w82zufEEzip1jIidFngBFqIe
 DUzYbCYLWOXXqJKLtUTDhYkqT5RUEBIx4YnvJs+0Is+zMQ5MhOuEs1rgW1fbczIJ
 qfnkgZFmd/Me2WYjsPKsrs4V0cFSiBP0ha2l/3n9Kr0OsKF3eZvqwKQHsTxofb8c
 E2E4L2vGp00FXaBzWSuzBzB+AtI9oZeo2IbXpSDGbuKXTOTYcJP5Js1WW6v2zVVT
 p+7MhGB3e9B7EOtRwgb7EqfqAuq60qsBjotbWuADCABpQ0MpPcwFwx41iR0Iy29g
 ==
X-ME-Sender: <xms:hf3PXl2eQHzVMV82Kcuo_822fI_VWajkWlq-ILVkGXVYsurEvyV9iQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddviedgieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptdefjeetuedtfeelfeeiieevveek
 geeuvedtveefiedvhfeiueeugffhkeelvdfhnecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:hf3PXsEXfeHr3A4h-BL-9OqXCBcgZozSfhr-qYQsn-IlN7U5TDzlxw>
 <xmx:hf3PXl7b5qD0TQNhsno6v_o6HFZ7qqDJ6Xm-VRAsdoFl3GFfaIJsew>
 <xmx:hf3PXi1H7e7V1THFbujvV-u2jRuYy_av5PZWO_--W8Lf-w9weYlFfA>
 <xmx:hv3PXtS8KYVOxnbyPSylITOSOys9iUpmcEh63i2O52qwtu6ouPpP4w>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id CA7A83280064;
 Thu, 28 May 2020 14:05:56 -0400 (EDT)
Date: Thu, 28 May 2020 13:05:55 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Subject: Re: D-Bus interface to provide data to entity manager
Message-ID: <20200528180555.GA1717@patrickw3-mbp.lan.stwcx.xyz>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
 <5fc67500-b0f4-c964-fc9a-d3f5346e47ab@linux.vnet.ibm.com>
 <20200528120331.GC17541@heinlein>
 <0942393e-4475-5249-4918-4125e85ec554@linux.vnet.ibm.com>
 <17ad5a3d-e69b-0005-4bc3-950e590093bb@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
In-Reply-To: <17ad5a3d-e69b-0005-4bc3-950e590093bb@linux.intel.com>
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


--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 10:12:19PM +0530, Thomaiyar, Richard Marian wrote:
>=20
> On 5/28/2020 5:54 PM, Deepak Kodihalli wrote:
> > On 28/05/20 5:33 pm, Patrick Williams wrote:

> Why do we need to have 2 different interfaces to represent the same
> information for FRU-to-inventory transformational (say ProductName). This
> will make inventory manager to be updated for every FRU producer?. Many of
> the properties are common, and we can form a common interface for that, a=
nd
> rest can be maintained in it's specific interface. I understand that curr=
ent
> FRU to Entity-manager interface seems to be private, but we must make a
> common interface to represent like Product Name, PartNumer, Serial Number
> etc. (instead of maintaining it in different interface saying IPMI / PLDM
> Source, with different types). How about?

Yes, I am in favor of common interfaces for this where ever possible.

Is there someone that knows the existing FruDevice implementation well
enough that can be included in this work to propose common interfaces
where it is appropriate?

> Inventory/Source/General/Fru=A0 (Maintain common things here Product Name.
> This can be used by Inventory manager to advertise it (instead of searchi=
ng
> it in multiple interfaces/properties))

Minor tweak here of 'Source/Common'?  When we have an existing Inventory
interface for this information should we mimic what is already in
Inventory?  At some point are we trying to be too common that we're
effectively reimplementing Inventory instances under a different name?

--=20
Patrick Williams

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7P/YAACgkQqwNHzC0A
wRnZKg//XydCDvdn8ttJ4w2EKr5urxdBcyTxNqzU5P0OV5ybGIuGVxuGQiAzPCNc
MMrgNKRxr8xF93dtSI6Ep2O8KDlHCDNgNxcT371SFgIL+8CJxu4cMwI4apW/f20C
+Cy+GZfJ9w8aj1Rp7KFaPA0PtzSzBlLkcWp+r1lNo+aU/cKsZGgh1PazAyBaQSXf
FU2sF1y03498GS5TXvcOltlqNKPCJyvMpYxAea80cgKWNEJQGiej6ZRO2VQ/0u10
iKrYOab7ZsgVC8yITJAKdXZOmHcX5npEtxJSnl+vJdCi24IQWkb+ZTUGZW37yKuN
plZujaIle4Y3TKKFvsWqh6Jcun+lw3i+lIWPCQxbpKor/Msczx1vdL2w3HqlZoT1
BQlekBJ6Rdk3RvCHBULEg4uBhE/bT+HV5YogeqnDjx7TmA7r8p1jVbjgTHJMvLxM
y3rTN1RSvl8UmPfEo3ih+LX6IjvyDAbAX01fZLoW/QKaUu6n8GnRR1DyjVopCwmS
Q+w+/gtFhDAX91Z7AxZlMuz0Wa6nFLEfbO6hEMtf1c+W9fYmQ5Mf2XXOnlpDfZWv
+Vm47/32OczSajzUzdhTA2kbRoAje3pAhxONs1FjNCNURIUJATeZ4tvOkT2EcaLl
AFMR8hbGQ5jcjUtPoJTujgRDwUp1TDfVkBj2C2aZWskNCd5s1ko=
=x+O0
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
