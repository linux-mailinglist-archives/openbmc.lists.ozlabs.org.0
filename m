Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 341451D2FE6
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 14:37:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N9yg3kWGzDqLV
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 22:36:43 +1000 (AEST)
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
 header.s=fm1 header.b=K4ihyoL0; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=trCXeoaG; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49N9vf6d15zDqqD
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 22:34:05 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 9437DB5A;
 Thu, 14 May 2020 08:33:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 14 May 2020 08:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=+hyWubth4+CaszOckLL1G8K8Auq
 yvdSGSBkJSywwnDc=; b=K4ihyoL0L7WUp8Zn3yeh2yrmchdeDmHaAWTgesmQeOj
 dGmfHfCoyMyqoWta0Zz+XrwTjLMmheiqZDC/ALfp/ihsZvnGmAHPnWkR46RAB/E4
 CCXRL90kLO/lPpkWsNKuuznJrDI0RYw9mWSR3aYD6J2xFXStYVuhRPA/ZTaXwsvh
 Ot9vkCcW5iA1DtuJQUsliRr+7eBtBJsvIiaDLECSk9mg8Nn1UMe+qudMYM45Hif8
 BvtT2AWaWQDHACMC/PAKQgLHqEqTMRsAJnohhp35D5tGAEFcPikRU2Fhujrp4xP1
 MveDB+mW3e+znVHEdPOz0eEwc+r9rxom63F2iReIpkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+hyWub
 th4+CaszOckLL1G8K8AuqyvdSGSBkJSywwnDc=; b=trCXeoaGDIVX70gWEiPA29
 oLySdHZ6n1n/Zmo3gZ9v9h24HdT5tbSYVvcnYoxDRwSwC5Y0Fy/IHatCfkBLxVYo
 gtED47vOD0o7tvCr9bjqfSJjFeHOw1/TvoY4ON4lMO/VrHwRBXNXiiWTrjWk7d7A
 1pktfTvBPRCH2BS2ZvCjSE8sgZ6rovTAxvIVOIZP+8LaYZQEw6+gviPcULGzKoMS
 nSIiReViirdyvjaX9z4ACBdPrgjJMS47zDygIGvbRamUZHkjxHPrBFjwLXOZ8FZM
 wXfGlDEb4kwq3/+33peg/tbOjFqPivw0Sa6DqYYvtwJh++Up5/76TBdzg9sOeuYQ
 ==
X-ME-Sender: <xms:sDq9Xt_dtyHkJSC5Sgs-GuX_J0gEAlw4YczKiE_Mu4ay5Km13xTBCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeigdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:sDq9XhvuKcBIh9H9E3-JMbecr1iwbhc4xTek6F2R0FfX5JcAgGUu4g>
 <xmx:sDq9XrD7CmDb3mzYLLWYBaCEqw20vkumsop3QTqQvgr-4k-WWCSC6w>
 <xmx:sDq9Xhe28K3p4iVe5UjJiPFwdv30CJyM-dTNqgOYFSSFoEOsHiK-aA>
 <xmx:sTq9Xk3NyaJndsUTUJHbCuhDqFDXJhG804Dlb9oC9h0H_-BKu4WDLg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 28027328005D;
 Thu, 14 May 2020 08:33:52 -0400 (EDT)
Date: Thu, 14 May 2020 07:33:50 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: Re: Storing host data on the BMC
Message-ID: <20200514123350.GB1166713@heinlein>
References: <f4df91bd-d60c-5f4b-ef08-2e3fdd163b4e@linux.vnet.ibm.com>
 <843851ce-b802-05af-2949-c3aa828aead7@gmail.com>
 <ec87d606-9fa9-014a-bfa4-e56f94f6747e@linux.vnet.ibm.com>
 <342b5672-2adc-a6d1-f60a-085847d69584@gmail.com>
 <43685475-b4fb-6d09-a248-01a52ca382fa@gmail.com>
 <20200511120719.GA10214@heinlein>
 <0000b55c-29a9-b0fa-b72f-c4f19d4c7d12@gmail.com>
 <8db810a0-6bc4-5ad5-0f54-f739fe6dde81@gmail.com>
 <20200513211857.GA1166713@heinlein>
 <10275d64-bebd-cb33-0a16-21299b7b1880@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline
In-Reply-To: <10275d64-bebd-cb33-0a16-21299b7b1880@linux.vnet.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, suryakanth.sekar@linux.intel.com,
 Sunitha Harish <sunithaharish04@gmail.com>, dkodihal@in.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 09:13:47AM +0530, Deepak Kodihalli wrote:
> On 14/05/20 2:48 am, Patrick Williams wrote:
> > On Wed, May 13, 2020 at 08:37:32PM +0530, Sunitha Harish wrote:
=20
> I think the current proposal from Surya enables this already. Do you=20
> just mean the design doc should explicitly state this isn't restricted=20
> to the "BIOS" firmware.

Yep.

> As far as Sunitha's question goes, my point is that not all host=20
> firmware generated data is a BIOS attribute. For eg if the host tells me=
=20
> about the presence of certain FRUs, or their functional states, I=20
> wouldn't want to store those in the BIOS attributes backend, I'd rather=
=20
> associates those with the existing D-Bus interfaces for the FRU=20
> inventory. I think the same applies to the Origin property that has been=
=20
> described - associate with the networking D-Bus backend.

I think we're in agreement here.  Data which is interesting to represent
on the BMC, for which we already have a defined-interface, use it.  For
data which isn't interesting the to BMC, use the generic BIOS attribute
table.

> > If you are wanting the data to be managed, utilizing existing DBus
> > interfaces we have around networking, doesn't phosphor-settingsd cover
> > that from an implementation perspective?
>=20
> I don't think the 'Origin' property is a setting.

Well the name "settingsd" is somewhat arbitrary based on its original
definition.  I believe the current implementation can make a placeholder
instance of any dbus interface.

Having said that, one weakness with settingsd is that you can't easily
restrict property changes to data coming from the host.  Once you make a
settingsd object, anyone can make dbus calls to change properties on it.
If we want to be able to restrict that to specific interfaces, we might
want to look at a phosphor-inventory-manager like implementation which
has a special "backdoor" method to create / update the instances but
prevents modification through the normal property change interfaces.

--=20
Patrick Williams

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl69Oq0ACgkQqwNHzC0A
wRltjg/8Djl5NKiwyZtZn18Lv5CzE1tEOp/0oKO2/J7kDw8erRehTmiQfrZuV3q8
DC/JPenj/97bkGwUxaxIBih7SMl1zA9zxY8qB/XTefGYkl8uMV1QmbkQazdM/lFo
8yif7p9sj7yeVT68FG3s8ugPu56OA15kaorZxkV3oXcUK8HoV/tEKjy5KRfp2Py3
4V83xoDYzmyTtrnongzn+KpkEZ9L81UfuC6rLJk3kRxMF09DQZJfAP6kpjfbuaDw
JKF7F8x8M3M1BewFIKC3XepcSM5hMrTI4HAPLu/KQLcA92X/6FP9urDL2YHOHCNA
nOZArmZ/hp/Is8z26VzUdfqEmMYfrPbuEuzJJ1wcJBjfSGQVDh8B535sYvCE3JVW
Bn+LIWZQTc5GmPWuXyuVwfwYb1s+jgPsobrOqM/AJkBFSYqQfAFpq9leQahXpQep
U/93YMdDBPv1LDs3AXohM8GT1ah3WmrWkYPqb59cM6rfN00VLhP3Cp6Q/THLicu3
V8hSfTg6XwZqVQORlNV0rW5hRBInFgfdbn5BKe8GSUW5rvXjDTz2Q0HsYxXFaWZA
FoIsKgPhrJZbIyrlBjIi48j4UQxTKO1bcbf/6m43gIwQOXwnaJ8d1UScbabNtDaM
ZzoCcu6L9mL9c2/MW+5lqwZ0v5HWxkG4nnadMw3Ll0MXYbt6Hjo=
=EFjU
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
