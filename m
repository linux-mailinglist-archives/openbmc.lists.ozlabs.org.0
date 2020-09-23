Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AA4276102
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 21:25:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxSnc2Y6VzDqHR
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 05:25:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=P7jwWefc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=XvH7whMS; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxSms2PBkzDq9l
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 05:25:01 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 30C255C0100;
 Wed, 23 Sep 2020 15:24:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 23 Sep 2020 15:24:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=BVP+4p48tcMJb9YptNuBdzPs6oK
 SCNiwYCGQdlq3MLk=; b=P7jwWefcbwwq9ACjDQMCnhE+c2Hi20SbP5D1yy0SbJW
 JJY6gSa4IM1jFOQrMUpbO8Z7EvZQ/BiZFnGPCWyTmplLKEGJ9Zyjk6bo0ifBCsRs
 GscAF4igg6J7lE11G/+4jTzcU59qdpRg4Rf2a54crhMOjF2OtG1WXzg1Fi65ciAm
 +ETnjT3zTGfyyxlUyf15GC1/WR6qhQd0fP9e6zd+0vf5koOhD1iuEldWxhGQBxAT
 4lvn95X3sZY7TCoR3vz7iz3jyjjvYpXzZg+DHzu9GsIltGz5YkYlpuYHRTvEed25
 cbSXrEAENV0eRZsoCKsFHfFje2i7T5dRFvhtvWOpchw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=BVP+4p
 48tcMJb9YptNuBdzPs6oKSCNiwYCGQdlq3MLk=; b=XvH7whMSDojDbIt6KYLq3P
 jJRFsuLcpW+hg+7LHwbPM9FO2V9ABimdweU5aXxeY5/ZFs93hPncaB1g0xUR9AdY
 AHoRdjUuaYrUhY+AYMH6ztl5eugi9v6wJrSDi25My/A5/dAOSQjPM1OY5kYS3/Lg
 nkjhmRVixypQF2g7MLbb7OArs7wUjSG6QYlbGsPnAYI+a1YYxCQXsCJwTBK63zu6
 9GEvMmwkTFlvnFgnrlBLKXXysEUEjTsV+JMOn6rl6t3O7ml+SVw8G2vcbEXtizXr
 6Ej5iuErRd5SdMHUxFL5ZbnGofrIE9h/A23HlU6h2VqJO2DX6mNvFdBBbvnTKogg
 ==
X-ME-Sender: <xms:CqFrX3sNc_BycFPn37uhs7ZGHsB9TcSxAi3npmc0AF6IKvVKuqBDOQ>
 <xme:CqFrX4dbcx7rC5VSZwWB1C9XD93OQD5vRZu-X_sWdKE0puIEltkzhi84Nh2TmFbhB
 IKgFgyAAoPksajOuwU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeigddufeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptdefjeetuedtfeelfeeiieevveek
 geeuvedtveefiedvhfeiueeugffhkeelvdfhnecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:CqFrX6yaLQVAiOPYPg6vFaIzspeuMKFhpiwIf7Bb_pqTPV95I1pqdw>
 <xmx:CqFrX2PP1DBQvVERrP7xuZsJRDKrloGdIq6bCY-StVlDNjbQogF2sQ>
 <xmx:CqFrX38Dd0KjLxc9EPYLB2c9kMSqj77DwPblTaisuRdGDB5RpcPUDA>
 <xmx:C6FrXxlE4wkgA6tdY1i-1nc_OPyIIH9MLyF58y-U5HFUQvgYJN93Ng>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4A3283064610;
 Wed, 23 Sep 2020 15:24:58 -0400 (EDT)
Date: Wed, 23 Sep 2020 14:24:57 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
Message-ID: <20200923192457.GS6152@heinlein>
References: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
 <20200916172045.GD6152@heinlein>
 <CACWQX80BYYwPTN1PsbLfjFN5fQyjNGC1SxM9iyBKvxNiLh=WLQ@mail.gmail.com>
 <a5f0245d-703d-e0ba-0344-442c49a60cdf@linux.vnet.ibm.com>
 <20200917153601.GH6152@heinlein>
 <c007630e-54e2-df13-e6da-0af0b2998279@linux.vnet.ibm.com>
 <e7dc17f5-191c-b24f-4b92-1020cf77a54a@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IfZ+tgy+ooJOsAAy"
Content-Disposition: inline
In-Reply-To: <e7dc17f5-191c-b24f-4b92-1020cf77a54a@linux.vnet.ibm.com>
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
Cc: openbmc@lists.ozlabs.org, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--IfZ+tgy+ooJOsAAy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2020 at 02:39:04PM +0530, Ratan Gupta wrote:
> Hi All,
>=20
> Adding one more problem here with settings infra and with some proposed=
=20
> solutions.
>=20
> Problem Domain:
>=20
>  =A0=A0=A0=A0=A0 - With multi property update from redfish , webserver up=
dates the=20
> settings object
>  =A0=A0=A0=A0=A0 - PLDM on bmc listens on the property update of settings=
 object=20
> and notifies to Hypervisor
>  =A0=A0=A0=A0=A0 - As there can be multiple properties in single PATCH op=
eration,=20
> PLDM on bmc sends
>  =A0=A0=A0=A0=A0=A0=A0 multiple Notifications to Hypervisor
>  =A0=A0=A0=A0=A0 - Specifically in case of network config,=A0 single prop=
erty update=20
> on phyp may lead to network inconsistency.

The original bios config seemed to only apply settings at specific times
(ie. when the BIOS restarts) but your problem seems to indicate that
you're immediately sending settings up to the host whenever they change?

> How can we solve this?
>=20
>   * Proposal 1: Add one more property in the settings Dbus object itself
>     which tells that it is ready to be read, PLDM on the BMC watching on
>     that property and read the whole network configuration and notifies
>     Hypervisor.
>=20
>   * Proposal 2: Hypervisor runs the timer if the bios attr belongs to
>     network configuration and once the timer expires,it reads the bios
>     attr related to network and applies it.
>=20
>   * Proposal 3: Add one more bios attribute in the bios table which
>     tells that Bios configuration can be read and applied by the
>     Hypervisor for the network configuration.

It is unfortunate that org.freedesktop.DBus.Properties doesn't have a
way to set multiple properties as the analogous operation to 'GetAll'.

In the case of networking, how do we handle this for the BMC settings?
Don't we have a similar situation where multiple properties are changed
via some interface and could leave the network in an unusual state?  I'm
thinking IPMI does this.

When all of our DBus objects were serial we likely never had this issue
because the request to read the properties (to send to the hypervisor)
would come behind the signal and subsequent property updates.  Now that
we're moving towards more ASIO we likely will see this kind of issue
more often.  I don't like it but we could certainly proposal a
'SetMultiple' extension to org.freedesktop or create our own interface.

Proposal #2 isn't great because, well, how long do you wait?  In the
case of hypervisor updates, delaying something on the order of a second
is probably sufficient for Redfish/PLDM, but that doesn't really
generally solve the problem.

We could define an interface to implement something like Proposal #1,
but we would need a new interface and not a property we tack onto
existing interfaces.  We'd probably need to revisit a lot of our
interface definitions and see which ones typicallly have multi-property
updates and does an intermediate state leave us in a bad situation.

Specifically for BIOS/Hypervisor settings, I mentioned before that it
isn't clear to me what the proposal is for applying Pending to Current.
Again, this isn't general, but we could define an interface specific for
BIOS/Hypervisor settings which has a way to indicate 'Pending
transaction is complete' (set by entities like Redfish) and 'Pending
values applied to Current' (set by entities like PLDM).  For the current
settings-style values though, this requires external interfaces to
somehow know that the setting is associated with the Host in order to do
the application, since BMC-owned properties won't have or need this.

--=20
Patrick Williams

--IfZ+tgy+ooJOsAAy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9roQcACgkQqwNHzC0A
wRlCkBAAo+JK4EWVgNihxl+LYFKp/I7kpMbXtaLjKOGy9BtJGGT/K+RBvkuueeu3
6mgqy078aiL70iL2tqDNlJi9ShQv85+lrVCDJ56pBoSO1jMWob9TQIaX2bRKY2BZ
VQTtmwkmnRDb2pwSN5jXyHmzOjmwhvg0mCxCVe7gYoNeeuHBpsSwD7hXFFYPuUuG
XcD09jiw0LkHbNlvJd752yvRjK+MRF/HS5hpJZkt6hMmkn0XJ8M32Kc1p8Xy0luP
QNfNpMFtZwwUM4IcxyK6HPmwU0EoXTFMSjapqdP3DpbgIQXp4RaUXls6nuxvG4w2
r1R519exrS0uIc4H2izV0ZFKNnXCaPdv7DKRtMktN+F4RNLqf24tt7ekNtYXco+a
xncAdhqqWbkDZOqxITNuKVLJ37MyM4QeWKxCFlP32OvuG8VFZIfFxymBYYN2m0Ov
83vNtVfj6DgxgirqcOdlj1LJ1qh0Qra0S/YgAaYr0fbAUCbtt7YM+IBDlpaUbEM5
EQPejyzSv6vxdDXgLjDxb3uq2ip8tvt3gQ0Ln+iTGT6uqEZ/bsSMcBYbQQP8oTcq
T+Vum9AlMCWzIJh3T5r7CCFd/oTEdDQ3DLOUv8b0ZpXDa6WjLPXtjy3YDACNBz99
WhtmOI4GlExUfZhlxPh6nZ+8IS/k9qv14SCv7hc0EwQr7xWpABA=
=3RzM
-----END PGP SIGNATURE-----

--IfZ+tgy+ooJOsAAy--
