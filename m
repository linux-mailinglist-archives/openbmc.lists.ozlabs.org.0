Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D47F4276309
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 23:27:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxWVH25LqzDqdw
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 07:27:35 +1000 (AEST)
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
 header.s=fm3 header.b=qN0w0c4p; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=q1VGL33k; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxWTR3hwlzDqMF
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 07:26:50 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 08F7A5C00EE;
 Wed, 23 Sep 2020 17:26:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 23 Sep 2020 17:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=cp3aECewHXCGxfDx4y0aD60YBRA
 60y3f/v5A/4FVKTg=; b=qN0w0c4piq1RxXy4ZR4JEqOB/6oCkq/0hhNsJX+Ey+l
 vp/pThJMl8+nEYIZXi4UGAL/GhU8jES2lhFY9rXNUbd1szCwIhnCzuCGFPOuujx7
 nxRpr9fa8LJGRyklBt+SklB9vyXN9iiLXt91B+d3mNcG8LI9T5/NiBtV5ZTDMAE8
 HgTgEILhGUTbQ6q4UCZNAkGQ9An2XMp3wRZbbGicSx5JgpSPjP6VYhZ0eSWKNKDA
 bMA8sk/31bOciWMhgTqU9Pc+QeQxllXJzy4EbqrMVyYd5F3HZNjxrJZdfOZrxJbx
 PDhcqv50S35i/Ni1BFDqIzwrW/6iaPiZjD/knHORhBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=cp3aEC
 ewHXCGxfDx4y0aD60YBRA60y3f/v5A/4FVKTg=; b=q1VGL33kKhKVaBQwQzIi/D
 /UtnWM1ncJsFFQNTqwa7U7cENw2bYaNkawDwyQHmfSqrdP5ucqL+5OfjSx4ZAtTR
 JBcmKU4s7tSnnstI9FmBmlnh09J72uJXPnfKYBPDEPbiCHPPJrL4QivOAGG5RkGL
 6cYJP1gmCUtoJlczx5hdRYRx/vHpgt6moeqppOnTjhbYP2UYR9YIh6+IueyuRGoO
 Wy2WeAGT1IurTlVjqg0Dq+23A5f9typbimTA/jcb/ylRQy1dZsEPhUynvwjeUEFh
 BZbHlXiQwKVO3HMY3AKHq0PMnDuNcTE2hkNiftPm8knFSiYkOul0NX6Da1Ah9XoA
 ==
X-ME-Sender: <xms:lr1rX91AEX_xr1odsjUsNiiAeNgVB4GuQaS_IB1QyKD9W80iYXzNhQ>
 <xme:lr1rX0FIUVT3mg9HD3D4HXWDD5J9vr3Y5bqSCkNscYKnRv3L3Y9wftwS30b02XYPr
 D2e9JLXcjRBmzY_p6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeigdduieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:l71rX96B0t5lPZ8V2jSkv-yiqjpb_JxdmrbA97HGMPYnodN82Rzh9w>
 <xmx:l71rX60r2oEGO9KxyHGAurphrbYUA2qcx7_m0hLh3DfLFMKSPpVu4Q>
 <xmx:l71rXwHL4dKcUNmdi9h6euROyxopq3i2mP0IHvnfodH5XmA1qKx1Ng>
 <xmx:mL1rX6MfmBzMSe2qjhz61nfsreqhkh_6YzHzbuhj9hPKSk6Q9ab38A>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id B3C1A3280063;
 Wed, 23 Sep 2020 17:26:46 -0400 (EDT)
Date: Wed, 23 Sep 2020 16:26:45 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
Message-ID: <20200923212645.GU6152@heinlein>
References: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
 <20200916172045.GD6152@heinlein>
 <CACWQX80BYYwPTN1PsbLfjFN5fQyjNGC1SxM9iyBKvxNiLh=WLQ@mail.gmail.com>
 <a5f0245d-703d-e0ba-0344-442c49a60cdf@linux.vnet.ibm.com>
 <20200917153601.GH6152@heinlein>
 <c007630e-54e2-df13-e6da-0af0b2998279@linux.vnet.ibm.com>
 <e7dc17f5-191c-b24f-4b92-1020cf77a54a@linux.vnet.ibm.com>
 <20200923192457.GS6152@heinlein>
 <CACWQX83TAW8TfAUaNSkO7UA0VrYKjut8uFnd6pF3RgcJm_EDrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wu6d9FdQ4ohoCGf7"
Content-Disposition: inline
In-Reply-To: <CACWQX83TAW8TfAUaNSkO7UA0VrYKjut8uFnd6pF3RgcJm_EDrA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--wu6d9FdQ4ohoCGf7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 01:51:33PM -0700, Ed Tanous wrote:
> On Wed, Sep 23, 2020 at 12:24 PM Patrick Williams <patrick@stwcx.xyz> wro=
te:
> >
> > On Tue, Sep 22, 2020 at 02:39:04PM +0530, Ratan Gupta wrote:
> >
> > It is unfortunate that org.freedesktop.DBus.Properties doesn't have a
> > way to set multiple properties as the analogous operation to 'GetAll'.
>=20
> It was proposed we (OpenBMC) add one while back.  I think it muddies
> the water of what it means to be a method call, and what it means to
> be a property, especially for the use case that it was being proposed
> to cover.

I'm not sure why it would be considered mudding the water.  All property
Get/Set/GetAll operations really are just a method call under the covers
anyhow to org.freedesktop.DBus.Properties.  I do think that ideally we'd
get the method added directly to that interface because then the DBus
bindings will support it natively.

I forgot the mention this again, but another way to solve it is similar
to xyz.openbmc_project.Inventory.Manager where you take a fully (or
partially) formed object as a method parameter and the process which
hosts Inventory.Manager hosts the object.  Settings could be done the
same way.  The issue is, again, having other processes know when to use
this new method and when to just update properties.

> > When all of our DBus objects were serial we likely never had this issue
> > because the request to read the properties (to send to the hypervisor)
> > would come behind the signal and subsequent property updates.  Now that
> > we're moving towards more ASIO we likely will see this kind of issue
> > more often.  I don't like it but we could certainly proposal a
> > 'SetMultiple' extension to org.freedesktop or create our own interface.
>=20
> If you have properties that need to be set in lockstep with one
> another to be valid, I suspect that indicates that properties are not
> the right tool.  Redfish hits this a lot, where each resource is
> expected that any property is modifiable independently, and certain
> implementations need an atomic "unit" of update.  bmcweb doesn't want
> to have to cache properties that are collectively invalid right now,
> but might become valid in the future, so there's an impasse.  Who
> keeps the state while it's invalid?  Thus Far, that falls to the
> dbus-daemons to store.

Agreed.  This has also been a general statement  we've made in reviews
for new interfaces.  "If you need to update multiple properties, use
a method; if you are just updating a single property, update the property."

> > We could define an interface to implement something like Proposal #1,
> > but we would need a new interface and not a property we tack onto
> > existing interfaces.  We'd probably need to revisit a lot of our
> > interface definitions and see which ones typicallly have multi-property
> > updates and does an intermediate state leave us in a bad situation.
> >
> > Specifically for BIOS/Hypervisor settings, I mentioned before that it
> > isn't clear to me what the proposal is for applying Pending to Current.
> > Again, this isn't general, but we could define an interface specific for
> > BIOS/Hypervisor settings which has a way to indicate 'Pending
> > transaction is complete' (set by entities like Redfish) and 'Pending
> > values applied to Current' (set by entities like PLDM).  For the current
> > settings-style values though, this requires external interfaces to
> > somehow know that the setting is associated with the Host in order to do
> > the application, since BMC-owned properties won't have or need this.
>=20
> Dumb question: Does anyone actually need to know the "current" value?
> Redfish certainly would need to return  the "pending" value in all
> cases, as it's required so the restful API emulates ACID-like
> compliance to the user.  Could we just have an optional interface that
> indicates "values might not be loaded yet" and simplify the dbus API a
> little?

I think this is generally for humans in the case of BIOS settings.
   - "What is the setting my system is currently running with?"
   - "What will happen next time I reboot?"

I don't know how this is modeled in Redfish.

--=20
Patrick Williams

--wu6d9FdQ4ohoCGf7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9rvZMACgkQqwNHzC0A
wRn+YA//SJ1K1ipe0hFgcvT/m14a4X99OcLiNxMOSkWrRIPeLAl/dtpUvYnGFWwA
zIem1HRQ4SwJWIC01uM1UbiSCgGx6Jas37U1J2ZW1N8nosZWDQsBh9dWc00y0O0H
wiVSLU3kOktuY3A3yWXOTD7rra66xJttjXTLkmM6ZVGJ926DYkpDxcgsWVooUAjC
4UgZ0Z9HctWa++0eylyLVaZpf9SHZc+N1qGz8qcPnY4Ek1Cb6xA8C0TH67UusIV2
nSqGkbqeCZK6OFpvol6tJNHRRI5t/+OwpYDd0ce7QynilWcMfpomribg76UP3WTb
deTisPt45kNyoYzlHUHQiXmikgVpvxM++DZZje7/zWqLWSRmTZpic0aN4QlrBV1O
CxFus1KI5Ao5GLCEpG6TQkpyLJfmtCqAqQX6IOsaLK8Uw98m57pll23al+YLdBB/
oSwqZpr4KkHPIpIU/LL7w7QfW/hTpOqXVoLtacY7TDJEUBOS4kKpwz8k9BOG3bPl
RA6jEmOvkKjcARWY005AS2+/W/lRMCYiMeJ4RjuE+nNUyz1PtMIlNGGpVtLJkwe5
g7sAF9MkcjLl5rquLebqfUTkvMkOKDv2+KNwQmFI6WIwS0JVPrJ3ug+/OCDTtLEb
V89XG3uQR8CS5Rzgl9bFfNBrWG7432ruibtwC1uLWJTxH1IxdNY=
=sMtK
-----END PGP SIGNATURE-----

--wu6d9FdQ4ohoCGf7--
