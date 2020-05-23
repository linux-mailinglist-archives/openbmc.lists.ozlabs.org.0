Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DD61DF7C1
	for <lists+openbmc@lfdr.de>; Sat, 23 May 2020 16:07:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TlYV0VDhzDqcP
	for <lists+openbmc@lfdr.de>; Sun, 24 May 2020 00:07:42 +1000 (AEST)
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
 header.s=fm2 header.b=PVq1ewjK; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=nAjub9bn; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TlW51Pg5zDqcP
 for <openbmc@lists.ozlabs.org>; Sun, 24 May 2020 00:05:35 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 4E49165B;
 Sat, 23 May 2020 10:05:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Sat, 23 May 2020 10:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=6bG3oDnC2cjTst8pWW0kopR5+TB
 hriabxgLN3pIDi2g=; b=PVq1ewjKvt1qX0lB1UFXyq1ByCIMbuR15iXDwSpLKUu
 ujxq7eipJuhqPezCVPkQLgxQVOjuhWZUOwTVFBvmIoXOOs97g0lCpEvB7qbXyUCr
 y3DI0vWEW8lnCHQwO7446HweQFZK8s3bOFhqDvuvHWqJbsLvIfLRK95LAodkMfB2
 sYb2IOlzXqP5bBHM4/C0u/rk9D14PiwT3idMSjoAdBFj9HddtPezmGL8Fe9UqnAB
 hGlOf/K8aVUFYSKeUeMn6KkWACgXxoEEdohamjd2CynXxL3MP9g8HOCPAUYt4exe
 J963MyZ8FhgyeW5WHTIwnmtjLbrXuLFmoLHo2CGr39Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6bG3oD
 nC2cjTst8pWW0kopR5+TBhriabxgLN3pIDi2g=; b=nAjub9bnVoiv2Q3GSRgMRh
 LHWGTygMlgdCbqlfLcfl1bDzdK+xirSeQ46P7WAF9LQz9tSCQfibpXS8s7fCfhvS
 2TkmPHWxLNulpWlxAvZelzYMf3OEZ5HQ7gMJADutd8yCn/9RUCpJuogS9csFrP4P
 lisfJzofNXmtCLeyZ4IH+fQ8QqYuAI0O7rzoFl834kcEdzL2CbUj1S5JGYDKh/7v
 C/fC8vPskXQ7qvQEsy59gqG3CU2ZKaPuSvgEs608FoZM/H7UCpLccJbuWLO27otH
 tQd7V2A7nwWfTFSMvYfbbsixmi+qaaP8j8O81PMCJqvEgK/+REbKn3U4NNrjUmnA
 ==
X-ME-Sender: <xms:qi3JXnypN5MILFPJecii5Ej_-U6lan2QJfW3IeIoGz1prE_tskTJbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudduhedgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptdejhfetudeggfelvdfgieeigfdt
 tdeltedttddtudeufeejgfeliefgvdfhveeunecuffhomhgrihhnpehgihhthhhusgdrtg
 homhdpughmthhfrdhorhhgpdhrvggufhhishhhfhhorhhumhdrtghomhdpohhpvghnsghm
 tgdqphhrohhjvggtthdrgiihiienucfkphepjeeirddvhedtrdekgedrvdefieenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghk
 sehsthiftgigrdighiii
X-ME-Proxy: <xmx:qi3JXvStPr8H3S6PGVq3_z83MOLKhHohMUSWMHGyUhYxN_9XlSCdKw>
 <xmx:qi3JXhWhSap_x3-7dTutoq2t-Eo9SWC5ZR4RE6i4nndOasL7TlTrZw>
 <xmx:qi3JXhjgUaJYmETSIcIkS_PmJlpzUwQmNr3iOZGNkizfALKf4OF8Kg>
 <xmx:qi3JXsNHrZtEvnSQavda-sdtGUKYKGtGe9yiI1HYJgiGCDNMtnJR7w>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0E1B03280059;
 Sat, 23 May 2020 10:05:29 -0400 (EDT)
Date: Sat, 23 May 2020 09:05:27 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
Subject: Re: Redfish client use case for Software Image ExtendedVersion?
Message-ID: <20200523140527.GB3941@heinlein>
References: <978080df-7d52-b204-5102-b2a9b4405050@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline
In-Reply-To: <978080df-7d52-b204-5102-b2a9b4405050@linux.vnet.ibm.com>
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


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2020 at 02:07:58PM -0500, Gunnar Mills wrote:
> Anyone have a Redfish client use case for Software Image ExtendedVersion=
=20
> or see value in it being added to Redfish?
>=20
> Was attempting to get ExtendedVersion added to Redfish's=20
> SoftwareInventory schema but Redfish did not see an "end-user / standard=
=20
> use cases". IBM's use case is mostly for development and Redfish's=20
> feedback was "single implementation can utilize OEM easily". If someone=
=20
> else has a need, will pass that on to Redfish and hopefully that will be=
=20
> enough to get it added to the schema.
>=20
> Some background:
> ExtendedVersion - "Extended version of the level.". A value from an=20
> OpenPOWER system:
> "ExtendedVersion":=20
> "buildroot-2019.05.3-17-g522600d,skiboot-v6.5-242-ge19dddc5-p37cfc70,host=
boot-820a099-pe030f7b,occ-3ab2921,linux-5.4.25-openpower1-p2339fe8,petitboo=
t-v1.12,machine-xml-0f9b366-p7fb7a8d,hostboot-binaries-hw013120a.opmst,capp=
-ucode-p9-dd2-v4,sbe-0a77603,hcode-hw031620a.opmst"
>=20
> More information:
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openb=
mc_project/Software/ExtendedVersion.interface.yaml
> https://redfish.dmtf.org/schemas/SoftwareInventory.v1_3_0.json
> https://redfishforum.com/thread/301/firmware-extended-version
> Some additional discussion (summarized above) in Redfish issue #4000.*
> *You must have access to the private Redfish repo to view.
>=20
> Thanks!
> Gunnar
>=20

I don't know enough about Redfish to say that we need ExtendedVersion
directly exposed or not.  Two thoughts though:

1. How do we represent information about a software package which is a
   collection of other things?  What you described with the OpenPOWER
   ExtendedVersion is effectively that, but we have other cases where we
   have an update which is a collection (such as BMC + host together).

2. One common problem we run into is that there is a lot of devices for
   which the update type might be "Other" because we don't explicitly model
   that device.  One change I'd like to make is for us to be a little
   more formal about the ExtendedVersion going forward to better
   identify what the "Other" is.  I intend to propose this similar to the
   Compatible decorator which is being added and defined[1].

Is there sufficiency in what is already defined for Redfish to cover
these two cases or do we need an additional field?

1) https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/=
31670

--=20
Patrick Williams

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7JLaUACgkQqwNHzC0A
wRn4CRAAiZrYIr/OMRXyGzpJX10ZzUK1JJT2vTZVLis/G/VF6MPhvyruFbxFnMYf
eoa9/U4GIM5PlNxTLGYnWEteHk2WP5vM5D23C8CZGkNOleqqFseQqJjRSO47aYM+
e1ijl1hRN0wlcGa8vdVugoZm/b90jSt4lT+SBE49/u6eiv8H7kaddp/nqiyDcPFH
3d3i+FCQPwVeocgvHNfnF/5pt71PvvhVK9wIsy+5n47dFIdLdwkPWX6bzZoAkjhO
ry0EJMmRie2bvWmdScImSVC6hV1egKjy4fejEWloPgvfUawjVk0g+Vsb8bA1pnSn
wb/yOnJ33JcHas4hcAzF1O6bIEOoDcxVvpUZCAUsJZLOMiTlekbyPoJMLJGjcAyS
9qJtL0dl4S1KGsVaHHJc0vwctVqBj+EHaTeSM08AltHw67HG1bMvy1INuBAdgb0N
RUMldUe6qoujtz4VFWboINyM71lc0LDuYwHEBBCSHY55zlWtdX8BgfR86mqoR0z+
cugO0tk70VvpEvOAlv45OfKBHCaVWfTtnxnqMNukILMaXKvD21zYgQ/qNZ5mBe1U
uuIhC2clEZxfH6kyOMdED1GfLEBXSAC2X1+nVPbNrJnZOTcPmSdhasT3Y5WBPpI0
c1Ew3noRf6GX317h/rXcSFBATYHDaaMKG64uID3zZS0XGetcfQM=
=dTAQ
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
