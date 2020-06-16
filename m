Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5079E1FB61E
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 17:26:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mX9X25hfzDqtW
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 01:26:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=T4wddwnd; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=CrZTEljo; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mX7L2TSqzDqp5
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 01:24:44 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id A53DA4C1;
 Tue, 16 Jun 2020 11:24:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 16 Jun 2020 11:24:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=z3mhfSjXMPyCiVXr1pTSKyzuYoy
 Dwf5A12hhllRor4k=; b=T4wddwndyCEGc8oOwI9Yby6B+b6LScWBEczeDA3vlwR
 BRwwD+YtCNiT9UzLMQ1PcMxGoDBXhyk9m0Oc0adzkIgX1eYLxnqbsDMfAl5WSjqd
 BHF0BM5vLOqzOrXgZGjwNiq6Ll8lnNtudK+tWP/vq2KRc0aL2ewmCVFRrBGkLVLB
 /fKZnlLQ4QfVLHd8zDJhqsrpEADBJ5yXAXXKQTKTs3w2jrF2lD6iW59fII3wYTfe
 njzUbqEJLEKse7z36ZudM47b9xIQDke5R6tK3Tgr5EuD5HX9Yx8wRfv4NKcZiw/u
 qS/ibmb1jO4EKh2ojtircyTyGGdQpN1S9dsDRiajonQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=z3mhfS
 jXMPyCiVXr1pTSKyzuYoyDwf5A12hhllRor4k=; b=CrZTEljo20bIsGkgjyOr7n
 kT0A3Qbi5mb6g3/oWkqd6IV/vZLVrC4g5+nvlakJRg0JuaMh+dvKOYiSlGNQkh5Q
 pRTBzb2vQ16tRuW6TUT5FERVGdoqqHLb4UsYRMWMlcs4LnSODWKJKpLp/YgjwgBo
 +QOI7Fs4D7WAlVzXj129EifbHiHWKmyZPirjgBt+zC3Ttm5OqkfNGnGEFmWpCijw
 FDk+pE/TaUfIgjPUvnVZ75UsOqSoXQBB5Y91X3FkWc1JQrT7s+mE37ppQlU8TEWn
 4n7v/VpVyrEnKD8tpwduNQq/h6NWkFIInhVw0xRpl0j3Be159FnIrO+0TR6R5awg
 ==
X-ME-Sender: <xms:LuToXg8VcxsXQjetFHtwN8HHPBXLTAw-oQHaK-41_VX2o_PNspX4mg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejtddgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptdefjeetuedtfeelfeeiieevveek
 geeuvedtveefiedvhfeiueeugffhkeelvdfhnecukfhppedutdejrdelvddriedurdduie
 dunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:LuToXouNtchXhPez1s3jHNTdURos3C4wiZ0473muxOQM6kJ_vsA5rg>
 <xmx:LuToXmB-_I9pG9lMz0JXl8xmA3bB0Az4w2NP8p9V_CC8qj1kW5wFNQ>
 <xmx:LuToXgd7by1XCg_o-fWvVydqe_YEnUGI3IEahqir3QTTFnh6PvEh_g>
 <xmx:L-ToXuYUM-XYfkZb5JX-yqXW0_mVxleLRxsimNDJox9doPc9MAapLQ>
Received: from localhost (mobile-107-92-61-161.mycingular.net [107.92.61.161])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6357E30618B7;
 Tue, 16 Jun 2020 11:24:30 -0400 (EDT)
Date: Tue, 16 Jun 2020 10:24:28 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: James Feist <james.feist@linux.intel.com>
Subject: Re: Redfish EventService Implementation
Message-ID: <20200616152428.GA4618@heinlein>
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <b80d18b2bc2766d58158e9c93f05201e87b445cd.camel@fuzziesquirrel.com>
 <c31b2941-dc48-349a-68cf-c5292ccfc621@linux.intel.com>
 <1d2ad757-826d-1993-b88a-e92010b984ed@linux.vnet.ibm.com>
 <05ec7793-2efa-42da-ef56-94cc1477d2bb@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
In-Reply-To: <05ec7793-2efa-42da-ef56-94cc1477d2bb@linux.intel.com>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>, openbmc@lists.ozlabs.org,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Puli,
 Apparao" <apparao.puli@linux.intel.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 02:42:11PM -0700, James Feist wrote:
> On 6/15/2020 5:50 AM, Ratan Gupta wrote:
> >  =A0=A0=A0 eg:
> >  =A0=A0=A0=A0=A0=A0=A0 sd_journal_send("MESSAGE=3D%s", "Account Modifie=
d",
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "PRIORITY=3D%i", LOG_INFO, "REDFISH_=
MESSAGE_ID=3D%s",
> > "REDFISH_RESOURCE_PATH=3D/redfish/v1/AccountService/accounts/<id>",
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "REDFISH_RESOURCE_TYPE=3DComputerSys=
tem"
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "REDFISH_REGISTRY_PREFIX=3DTask/Base=
/Resource/Oem",
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "REDFISH_MESSAGE_ARGS=3D%s", "Off", =
NULL);
>=20
> If we're going to go down the path of re-implementing logging, I think=20
> the goal should be to stop logging things in the Journal that are=20
> Redfish specific, and instead log them in some generic format that=20
> phosphor logging controls the map. Right now we are bifurcated because=20
> the dbus-event-logs, SEL, PEL, and Redfish are all using different=20
> methods of logging, that play to their own set of rules.=20

Absolutely agree with you here.  There is zero reason that applications
should start logging specially formed messages with REDFISH_* meta-data.
We shouldn't have any applications explicitly know about Redfish except
the Redfish providers themselves.  This is no different from IPMI, PLDM,
or any other external interface.

The kind of information presented here as being interesting to expose
via Redfish is equally as interesting to me to be able to add to one of
our 'FFDC dumps', which could be used for security / forensic work.

> Most repos use=20
> phosphor-logging, so instead of creating yet another daemon, if we added=
=20
> support to create a 'System Level' or 'External User' log that has=20
> predefined dictionaries of required and optional keys, something like=20
> phosphor-dbus-interfaces, we might be able to drop some of these=20
> transport specific logs, and have the transports based on the same=20
> database (the journal). Then each transport could filter these based on=
=20
> journal entry type, and transform them into the correct log for that=20
> transport. I think adding more Redfish specifics into the logs hinders=20
> those who do not want Redfish in their systems.

Can't we do this already today by defining a simple errors/metadata file
in phosphor-dbus-interfaces and calling 'logging::report<...>' on it?
This will create a record on dbus in phosphor-logging.

--=20
Patrick Williams

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7o5CoACgkQqwNHzC0A
wRnDVQ/9FlbTWfip35N1SR6X9STjVpFr8jmZ9YRiRoGrz0taNE63CaeZL8EIE5Mt
iv6L2bn4LYYS0Su58mr6qmlgTCN7x7e+UT69jdfL/2t/CXGzzDd2CIMKBozUI2lm
rupEkEhRP/AkAVINIqEvDT+UdJB1elc+kqhqbutwpv3YCG5m19eED8TP9wgN2Y+t
iGPrOd1++7GbY84t72RAzJR+GeEXghwoVSWq5vLV78iEPgifB6C3eN/hJWkS5KPg
e3fSizZSsNfQpJ9eKn8ZDE1oDe9mnROZl3INCAamUf1T8hWmIxCpQKwk4ceyE8HM
BtLUa+tC9XJkjxCdhpYyIoUlP6tIvvXM49qMdZLY1BwLpO1xn7wAd1OIv5bMC3ZV
OrAcAZxuhqigvbn+1KHTRLiax+EYIwYWgTtUeEbbdVBkVjbbQvtZAULqTO+IkcS2
LXNLiHVTbRMoswKiUI9mpsSGnZHswvD0xneIXnyEGkez/G8anXL/b0OUorGTThvZ
mDebGlwVMjDiocMoA0qmwFesIhxtmMFUooF2/anIuIIz5PV5/K1eslnFBM2Ox/ru
f3jERdi9iwvVAKPRHqq8mYltWVBlcdN++5JIVn6d917yyYlrtOWWlDPIeV82pqvo
wB+sgzhr2oCofeNqNB1HGyuBDnPmxq2IN7QVsf0FpdynTlymCEI=
=zfSv
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
