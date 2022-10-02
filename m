Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DE05F2515
	for <lists+openbmc@lfdr.de>; Sun,  2 Oct 2022 21:12:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MgYW45R1Zz3bsS
	for <lists+openbmc@lfdr.de>; Mon,  3 Oct 2022 06:12:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=tA01ssaT;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=nGDDG6Pv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=tA01ssaT;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=nGDDG6Pv;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MgYVZ0JZ9z3bP1
	for <openbmc@lists.ozlabs.org>; Mon,  3 Oct 2022 06:11:48 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 0F1D332003CE;
	Sun,  2 Oct 2022 15:11:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 02 Oct 2022 15:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1664737904; x=1664824304; bh=6CHU0LMaDo
	uzcTNPmfFtfspljWT13wvShhCV/mLjKBw=; b=tA01ssaTpewq76ugBjiE04usWp
	jS59D7YmRV6TGFWf5eiBW+OtaNZRy1rnUlOBWDTqOpEEps+Z00takZjX68/TRJIZ
	+9C/SckMgGqClxwOCL5U4h3yKJtcop92sTJL9hRFCE2KQnITdyBJviKi9dOJWKe2
	gMmkxlA/G9zWuhdWxrsc9FA2cP2jHBPejv0GS7aPpyMqIQmC8caE+DzYvnNPYaDY
	9RLD0wQDM6+d1DRXTFyCc7t+k4liSF9r4FdlN+Bkhe4CNCOEfi//lpSPwb7L85Sb
	PVJVUGlgDpnz768pDFRAFjT/d6pdmq9CEhcCqdfeKztNL+IQbpmR0iIoUB1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664737904; x=1664824304; bh=6CHU0LMaDouzcTNPmfFtfspljWT1
	3wvShhCV/mLjKBw=; b=nGDDG6PvwJDNzYFgU3fLETU46actdkbpLhxKjAaCzt06
	JZhCwmSWG2sGDFEX1se+/xWximySS1AHXu8Wg6TyQeWZoyJriT70a4kilbQLJWDV
	d6TGQ5fim/kl3J/EFd0tUgl9kOa2ZgGTNCqZeR8sffbB3vrLo6SwCTDpwinyqJRy
	QaDM8GnT6fbUf979YXP3Om56wSh6LhBpMs8iQfdut39ywH+H21qvm786vtmJAnDB
	2YY8RRaagIlhdTuP2+ZNenQ8Bi2fp6YK0x2fHqK3iF9End4ivr+JdpFIrZmt/2Yf
	lqgVREv7B5SqFHRRZZndZw22rZ2mg8iCKj7YAlUyCA==
X-ME-Sender: <xms:cOI5YxJjKEcovdaNjQwFNjGfaoYTbssaHcjR8XaWAwOLYj7Y7WU0og>
    <xme:cOI5Y9J2ws3UE2-WjloGfuR7qOsYyBegFsA4_xCTNcqOrKxGQ3rYBuIUWiAu1Zc7w
    arNZMO3_ve1ARWzKRc>
X-ME-Received: <xmr:cOI5Y5ubhe8KQZIBTt2sJ4b6LphIoraxkOUG25VHi7-FAgK5vOVwzqOy7HYY68we6btYsiTewFRZGWAxJxmxceLJO4rzwm_Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehjedgudefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepleekhefhffejffehhfeuheef
    feekueetteduhfeugfevudevheehieeuhfejveejnecuffhomhgrihhnpehkvghrnhgvlh
    drohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:cOI5YybvdycNBPvw0vDjJx5sJc5_1qfBHpB9W4i6sd5O6zmkmCajcQ>
    <xmx:cOI5Y4a7ODZ0N7tVJXqpzHbLeoWLpj0SQrkCm4zDXODyyuGmLKpbgA>
    <xmx:cOI5Y2DYEKPePE43Cre-tjdUB3ovsAVzyUpkrAj0Xqq6M5C8d41baA>
    <xmx:cOI5YxBxksbhGHJ2UU8GvYxfqFp1e7wYHWht6j6PyHETeKuX4vx_xw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Oct 2022 15:11:43 -0400 (EDT)
Date: Sun, 2 Oct 2022 14:11:42 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: George Liu <liuxiwei1013@gmail.com>
Subject: Re: Enhanced sensor monitor
Message-ID: <YznibmIQxFIRa+mf@heinlein>
References: <CANFuQ7BJBX2dZyrYAvxfuZ2sjnWLR-iAbu6_iCQHBFg7--0X-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yvzBJjxpm3jzIuWL"
Content-Disposition: inline
In-Reply-To: <CANFuQ7BJBX2dZyrYAvxfuZ2sjnWLR-iAbu6_iCQHBFg7--0X-A@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--yvzBJjxpm3jzIuWL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2022 at 05:44:03PM +0800, George Liu wrote:
> Hi, all:
>   I am working at Inspur and we're investigating a feature related to
> sensor monitoring.
>=20
>   As far as I know, the OpenBMC community will only trigger LED alarms
> when the parsing FRU/VPD fails or is not in place. The lack of the
> function of triggering the corresponding Sensor fault light for the
> fault status (Warning/Critical) of the sensors, including
> threshold-type sensors and discrete-type sensors.
>=20
>   For threshold-type sensors, this function has been implemented in
> the Intel warehouse [1], I think this should be a general function,
> and even many companies have implemented it downstream, so can we push
> this function upstream?
>   For discrete-type sensors, it is only implemented in the
> sensor.yaml[2] of the phosphor-ipmi-hostd, and we found that the
> present state is simply implemented. I think it is necessary for us to
> improve the discrete function and support all types and offsets.

Shouldn't this be reported as an Event of some sort and have an action
based of the Event?  I thought we already had the ability for
phosphor-logging errors to affect LEDs.

>   In addition: For the SEL function, the phosphor-sel-logger has
> implemented threshold-type sensor alarms and records SEL, and I hope
> to also integrate discrete-type functions, and be able to get all
> sensor information through `ipmitool sel elist`.
>=20
>   So we currently have an idea, we hope to create a
> phosphor-sensor-monitor repository and implement the following
> functions:
>   1. Provide a PDI interface (eg:
> xyz.openbmc_project.Discrete.Sensor.Value) to record discrete states

I've previously written about "Discrete Sensors" here:
    https://lore.kernel.org/openbmc/YAl32I0oGFi5i7Cl@heinlein/

In my opinion a Dbus interface for "Discrete.Sensor" doesn't fit our
architecture.   As far as I can tell it is only relevant to IPMI and I don't
see any indication from Redfish of such a concept.  While modeling
everything as a "Discrete Sensor" might make the IPMI providers simpler,
it is an overall worse design.

>   2. Provide a way to monitor threshold sensor status -> trigger LED
> -> log SEL (the function of logging SEL has been implemented in
> phosphor-sel-logger, I hope the two repositories can be merged in the
> future)

I would definitely like to see a more converged event/error infrastructure.
The current "sel-logger" and similarly constructed Redfish message
structure is, as I've previously remarked, kind of a complex Rube
Goldberg machinery:
    https://lore.kernel.org/openbmc/YhY9lX6a8RDGcY2K@heinlein/

>   3. Provide a way to monitor discrete sensor status
>       a. If it is the data on the Host side, trigger the PDI interface
> through the ipmiStorageAddSEL method of phosphor-host-ipmid -> trigger
> LED -> record SEL
>       b. If it is the data on the BMC side (eg: PSU, OCC, etc.), it
> should inherit this PDI interface in the respective daemon, and the
> phosphor-sensor-monitor only needs to monitor the property value of
> the PDI interface -> trigger LED -> record SEL
>   4. Flexible JSON configuration file, ideally, when adding or
> deleting sensors, you do not need to change the code, just update the
> JSON

I'm having a bit of trouble visualizing all of this, especially
considering what I've said above about Discrete Sensors.  We certainly
have a spectrum of real-code vs JSON-as-code in various implementations,
but I think we're generally moving more away from JSON-as-code.  A
simple (Condition A -> Condition B) is probably acceptable but we should
not be coming up with another JSON-as-scripting-language.

>   There may be many situations here that we have not considered.
> Welcome to ask questions. If the current proposal is accepted, I will
> push a design document, thanks!
>=20
> [1]: https://github.com/Intel-BMC/provingground/tree/master/callback-mana=
ger
> [2]: https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/s=
ensor-example.yaml
>=20
> BRs
> George Liu

--=20
Patrick Williams

--yvzBJjxpm3jzIuWL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmM54mwACgkQqwNHzC0A
wRmY2RAAoUzzKYcDR0iFQafbTs0H43/fX9930Mj/ZkprtsGxDjo7RZ8BcryjuKvk
i5ygDz0a1UszjjrRnlTV/PDHoEjPBwAMVo/q3QBudg3zME9m9iMyJ1UmuMGVDrL9
ODHfFi4I8PVHBuB3qbnegvASJixn+KS2vsrDWat2Rrx523Va168Lnn63SNbjBAiy
3CaIF6l0zvSshgQuGdDRiMjmAlhGJz9MHq3UfgPBSJG3937Nn2tCgkk27/y1A6TF
nRJBKdGT6XyQ2EbwSvt6zIp6Y0uCSvo0oytb3ZNuVkFzZThTBp4IeCOKoJFEo4qX
IGHnoy02PrHHnF536DzFRGvCCtOEu6lR/SGv9s/wtH/DD5fIg5NmIehqnMVTsuVO
069uVGgd2INKEJxEpdbLYpdKi2Y4HgdhlBSjJyjPbuHZTas2qHJgvesI/xafAwJr
hcBQhWPTQdgpr57VY8r8dbisWEL6Rew5IVc571MspJUvtmWrzp4mEeHaGUMZOUBs
MqNYiOHtpmEaVnaHi/fTfC9Z8xovkkizQ8Cn+O3E1t8ix9WSd0FO/aRVrh2BCm7v
vG+s5ufBZsOhGg1d7yj4iog90FamtkinMED+AJYjtzd5zC/Vul9v/1PAhhmNj5Sn
x0bJM4l1tCO1pOG3Yc5HfuYxSnoolY7D2dc4K+98TwGbMEdH+oU=
=EWEj
-----END PGP SIGNATURE-----

--yvzBJjxpm3jzIuWL--
