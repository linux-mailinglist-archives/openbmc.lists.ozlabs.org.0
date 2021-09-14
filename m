Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E24B840BA16
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 23:18:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8GS15X2Tz2yLb
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 07:18:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=EWgD3x3S;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=m6HL3UwW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=EWgD3x3S; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=m6HL3UwW; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8GRV54ltz2xr8
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 07:18:30 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 719A03200392;
 Tue, 14 Sep 2021 17:18:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 14 Sep 2021 17:18:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=zNwg0Kk+BcN+sgefPwvpDk2X4Q7
 Yx4Sy8IMU0dnyvMI=; b=EWgD3x3SEd7nElfoiNsW4Wa3u37gqdK3BQgjhoWAaFt
 v2CLC/Xjm5E1p54OxS2yoAQ4xP/7we24kBd79ffFKQ5MAq4kZ8Cooncw8DUPg9ZX
 d0QnsiE6PemnBH3DQXewIcuvtcALkSetdXuQ4pxhU6qCV/rgBA6awN7h342WmiUC
 a03TWM2TEm6GpU3ypLlfFBgV7sBunoV8ZJ6lIAnBR/QLXqubblBpzW49NvRFog6M
 na8Uf8bOJi4lzY2/BgMlxgNX5C2paomn2aP26WCNSPJf+EqjJbpfmA+kGj4eECJt
 iMRx09mI/Xh4Yka+0mKmzn621mqY/l+trOD5W8wZ67w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zNwg0K
 k+BcN+sgefPwvpDk2X4Q7Yx4Sy8IMU0dnyvMI=; b=m6HL3UwWBFphNHhpvMvHSe
 2RJ8cIS4Spf3Y2w/2VrUL9pcFMtyLKcVcVVob82ZTAQyNruJ9Obgd1uWr5/KhN3b
 VbHaJjKUOuIgV/kOtoXdW4K/321DiJRvYQb8CvflM+P8RMujjdHzLRQBfFVxoG/a
 gi3MMkVo3YKHPZK12niti7F5kKGw1oNcnU0uS6kxfXFvotrxDWM/F7LvZ+0E1tUB
 Vsrd6buPOCNgY1ZmitumLcZigB5+FC0xa++6gAl0RsnHNEabFNkXojSotb9YnruI
 EYiwzFf3UbB+zCpaak0vu8LcF+oPQDOFRO5ZJc5r3cMECm2+DawT90jrf0MrFfcg
 ==
X-ME-Sender: <xms:oRFBYfIYUyUzMXw-arAJdEuRRlUt9ncSXuFabMVS4tXh4KKoaNkNCQ>
 <xme:oRFBYTIn2a887JlAbnp0FxGX9z9niO--0iHmZ1yvm_2AoIllXe61_hnmlIrqYnasj
 9rOmNsRsunCp3Qcxz8>
X-ME-Received: <xmr:oRFBYXv0JG7YtqC--rsn-1FUjX5Mwu5MYFDVElpDSmcMjrnvLHldm-o5cvwy83sOdwCZbhbPESKvIorHGERX6ArVb5bWMWBnTR2wdYYRjkCS5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudehiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:oRFBYYYGqmlv8dVdPtOAktvEjvTnSFPmFDjACOhJhutR1dxAZlIGtA>
 <xmx:oRFBYWbvDDOTDjPetMhX3K455134tiAqFvOGPJojM-cDd-cHhUlbbg>
 <xmx:oRFBYcAuhgKEQv0VXXPq0VEflqCXXot6q18893Lx179yYAVJRo6U2w>
 <xmx:ohFBYZwcrX-shrAaIFGdIT6z2YXaYZ3_yHtuiewo2g6Xar1dqsoNnQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 17:18:25 -0400 (EDT)
Date: Tue, 14 Sep 2021 16:18:23 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Ren, Zhikui" <zhikui.ren@intel.com>
Subject: Re: beep code manager  for openbmc
Message-ID: <YUERnyjg7LUsL/ca@heinlein>
References: <DM6PR11MB4410B40F9D7DC46B72B0C87594CE9@DM6PR11MB4410.namprd11.prod.outlook.com>
 <YTFJHVW+bYoa1vIT@heinlein>
 <DM6PR11MB4410B4A178CF1DC94978349894D49@DM6PR11MB4410.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nFHyyJOBg/VcSuiO"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4410B4A178CF1DC94978349894D49@DM6PR11MB4410.namprd11.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--nFHyyJOBg/VcSuiO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 08, 2021 at 03:29:48PM +0000, Ren, Zhikui wrote:
> >I see it creates dbus interfaces but I don't see them defined anywhere. =
 Can
> >we get that added to phosphor-dbus-interfaces?
> >
> [Ren, Zhikui] Yes, I will submit a review on that.
> >It isn't obvious to me from looking at what interfaces are there who wou=
ld call
> >it.  I see various "beep code" patterns:
> >
> >    {beepVRWatchdogTimeout, "1-5-1-2"}, {beepPSUFailure, "1-5-1-4"},
> >    {beepCPUMIssing, "1-5-2-1"},        {beepCPUCatError, "1-5-2-2"},
> >    {beepCPUErr2, "1-5-2-3"},           {beepVoltageMismatch, "1-5-2-4"},
> >    {beepCPUConfigError, "1-5-2-5"},    {beepPowerFail, "1-5-4-2"},
> >    {beepPowerGoodTimeOut, "1-5-4-4"},
> >
> >How do these get triggered?  Do arbitrary programs call into the "BeepCo=
de"
> >service when they hit their own event?  This doesn't seem very maintaina=
ble;
> >shouldn't the beepcode service react to events through some other method,
> >similar to what is going on for Redfish events?
> >
> [Ren, Zhikui] Currently, an application can call into the BeepCode by cal=
ling the dbus method
> One of improvement ideas is to make the beepcode service monitor the even=
ts it is interested in.

Fundamentally, I see this as a very poor design.  I don't really like us ta=
king
code written in isolation without any design feedback and then expecting the
project to pick it up as-is.

We already have REDFISH_MESSAGE_ID and IPMI_SEL_* journal strings, a propos=
al
for audit, and now this beepcode proposal, which are all a type of event.  =
The
current design proposals for all of them is that every application needs to=
 be
aware of every consumer and make N random function calls to each of those
consumers.  It is sloppy and doesn't scale.  I don't want to add to the mes=
s by
adding beepcodes this way.

I'm slowly working on unraveling this by adding an Event concept to
phosphor-logging (distinct from the current Error concepts).  I'm hopeful t=
hat
this can be leveraged for any such event, including boot sequence states th=
at
can be consumed by this beepcode application.  I should have the initial de=
sign
within a week or two and would certainly welcome any review (with respect to
beep code) and assistance in implementation.

> >How easily configurable would this be for someone who has a different
> >beepcode policy than Intel's?  Are you planning to update it with some J=
SON
> >config or leave that as an exercise for the next user?
> >
> [Ren, Zhikui] Good idea.  However I don't have a definitive plan on that =
currently and open to suggestions/collaborations.

Another reason why we shouldn't just take wholesale code that was written a=
nd
designed in isolation but isn't really fit for anyone else's purposes.

--=20
Patrick Williams

--nFHyyJOBg/VcSuiO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmFBEZ4ACgkQqwNHzC0A
wRmWGw//QBztdOkffCxqIMrj+QovZZVpma49xrNoSy8XMTKao3obVdVTzqBgbMmu
WW6AYQhIQ3Dsps8hOTPzU2VtJvtPGfG5B0ufLRE3T07i71D3ouSuggEPtEaxOFnt
AEnmu04yaQsb32kngdTkfBh2LEG1XNsgvBO/JNJH7vMg11Ue3YKY4vp1cUa4620N
wHV5SpWsciDgOMyMcevqSs9OnYxXAZmPc+vuxUxd80WQVsTIwYErssPSayqeilQp
0aKHjQT5bkDUcFRVVpsECl8VHfEuPV5j4WNpmQCZ1P7wAv1/03e3qEGMiM+K9BaQ
yAg8vy1XSUWin1r7mdiGBkrRs1K9iYpTtL5+VV9a0WeDcf5hS8ZEdj2OPqrKXjub
sYbyyUNhnlm1psxEtDw1lv3EZOJhLjnVOFahPDN3lZcFaxPLseJAYveZOvibpb8V
6c74aLV6WA6eE0NK30jaxpBmLTHNA8If83oM9RuGg3skjC44jXrw/EPZEpulOZzZ
M/GYabRreNwr5Vv+GEU8I/7lQOzjDpK+u7l3inwc2xLoQzCqIANLajshWVS3dM29
IaYS8m9MGfobAYRSwSYDjGy5UmukjCouJB0/h3gizEPVCy17pFETjxomoeez5Yng
HbHzFEGdV1r+OSEbonpPZH91rcTj170qaWypSz72+JZbAnNieAw=
=xZgD
-----END PGP SIGNATURE-----

--nFHyyJOBg/VcSuiO--
