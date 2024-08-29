Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E41E9963813
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 04:12:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvPt74bDrz30VF
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2024 12:11:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724897515;
	cv=none; b=GIu/XOfVEVXKCgxPyUIz68tSlI2k9weExKpnO8HL6tX9wCbjmcn15msFAUQZZuANqvfz9v0zbcW1zrfwJuwgFYj90LR5uuXHMsAgErpmAnwajBHA4lx5WCadhgY9CHGXZoSo9NJ8WayJMvDsjW1XlmD2nezpPnC+gTglvTkyHw5tTSNjZW3kw9PAh1BvFVy+fXXkduMdR/kVZXA7XnWoJ5fDcuW1YwgSB4gbeVu1fy/LlpTzZazfDumaMb2WdRX+Ur7ju7RExT3ijK3w4FpvS3/yeUphpBZKhpubF2QWDwfRNKvZtEKaJdI0BwYT9wDg9Ho+7Z3JYQ+7/4tHtQ1K2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724897515; c=relaxed/relaxed;
	bh=ziQVzWsvDAUKk/zgCljmmCfZcWPR/2eWL5IXt42ikI8=;
	h=Received:Received:DKIM-Signature:DKIM-Signature:X-ME-Sender:
	 X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhrqrToRLhfFE9KM0mtq+UuEwWDsdrY3IIzs3/NOfX4xJNJ1W5A64skAFQ2MB6xGFM9T8pCMKZcJUrWjUZhTi2YiMj1cvyGUfX0mpgMobDgZDuiR1HAOjCct6k0h44qOHovA28EEGPVrZ26jdKzujahbKIInvFo8JRgeptdoydskDXPn1rJCykcPLfuFjRLwOazWn4U74L6PPjLxIo0Mt9M9KRrVzSG6Mu833CqnyBFKHK+aig7mSuqdFBEp1UzC/gGbla3Y4PMPgJEP9IzNqqo4DmTD8ag+5tR6WUnfnPABVniqB6uUZRMXzadDayS6GrBQlkNUqIzw5VvgxJXcUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=HSZj81M+; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=i1rYvWM7; dkim-atps=neutral; spf=pass (client-ip=103.168.172.147; helo=fout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=HSZj81M+;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=i1rYvWM7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.147; helo=fout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvPsz6DMDz2xjd
	for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2024 12:11:50 +1000 (AEST)
Received: from phl-compute-08.internal (phl-compute-08.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id 290CF139007E;
	Wed, 28 Aug 2024 22:11:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 28 Aug 2024 22:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1724897508; x=1724983908; bh=ziQVzWsvDA
	UKk/zgCljmmCfZcWPR/2eWL5IXt42ikI8=; b=HSZj81M+MO5JDj2807Wn72SM1v
	WqrWgOznasJUxwaMrjo1ttTMP50BMotyiVsLInDvwTVEez6ItmYsUASA+t1kjK4A
	bvIFTjuWTKOEKlaj1YJnozqUs/famxLdLBba58VPjN0DbTb21Xb2Vdp6GHPuwMnB
	ikVl1ct/w6x4XrFt3vaEIZMIRf/tLfw/Kff3u696k1CFlv56CHClrb1if02fnhxb
	EYYTBQ6MZkHtNF7p/fLVqkDu7Ex8IyzsRvJjZwAsQHKMpG8VId48i+9Uz36qNnox
	SZ71YlPU70MmW5HtqsHzv1xvPvJ/MU5Q281rHVULPseomx8SHe4Oo44PnS0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1724897508; x=1724983908; bh=ziQVzWsvDAUKk/zgCljmmCfZcWPR
	/2eWL5IXt42ikI8=; b=i1rYvWM7KLt92lrASKHlCK5ArU1iO1KQrtsaIP6yrvki
	MSUy67yDURNmP9GujP+L5YEuydRunfLydmn3q67axIkBW5ykQ47x92ZkYyhiBAtL
	0UHTDbAvOst1V43MeZPwV/wwiklbuQfLKfR3+9k/KTn1vshDuHhJdMkT0sT9YmdW
	0QewkaMHaAiboPYlrLw4p2tyhrqTrztC5goE7C/CJUx2qVgRL6ytMaVHuZRLtDpp
	jdptHfUNcPCdPbqzZQIXb9948xWs7a2gsOLq/KbghQhqxOcfFrNX2r7Ad912QJQT
	DlWcMGpi7MSVsRdg0Q760OysrnFL6EARz7Be+uABpA==
X-ME-Sender: <xms:49jPZvcWVZCap-QTRut8rI4-kZmf-YrzgPPcFBPB187w2RFERRMNsQ>
    <xme:49jPZlPNhox9U_lIahQrEXomD4RoDoIqEWz7Ow88BkFCX1UMa3jcMFeGDH8mWFbQX
    xGE0y4pPTJRQVQDwtU>
X-ME-Received: <xmr:49jPZohWwiuG7H2jVIz10-4wZyThcm79jOmbUMxf-T0huqH64K5HH1qlUCk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeffedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnegfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmsh
    cuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeej
    heeftdejiedvfeekffehledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehs
    thiftgigrdighiiipdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopegrmhhithhhrghshhesmhgvthgrrdgtohhmpdhrtghpthhtohepohhpvghn
    sghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtohepohhpvghnsghmtg
    gptghomhhpuhhtvgesmhgvthgrrdgtohhm
X-ME-Proxy: <xmx:49jPZg90wDXviDqdalsrLvtT5Gphz1zLtSyDgxHBA4b2RfmABfujmQ>
    <xmx:49jPZruoTgfrPWcoBojQK04KdRwK_hK2HOYNK_8QnSE8pdJCI6OSPg>
    <xmx:49jPZvF1YP9v-iZaa4dEAg17TScvm34h5bukhNU67OUXdWZ_ihjZAQ>
    <xmx:49jPZiNP0pAJB1tH4IBJZvBjIQrKB-WWveSteKJoBZ58Vm2Nh59keA>
    <xmx:5NjPZrJILXXyWgaIaW1AAxgmOH9WZE9XN8M81kA0LvI_WUr3T9qXMXWA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Aug 2024 22:11:47 -0400 (EDT)
Date: Wed, 28 Aug 2024 22:11:46 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Amithash Prasad <amithash@meta.com>
Subject: Re: [Proposal] Implementing SensorEvent message registry
Message-ID: <Zs_Y4hEDChiGLZqs@heinlein.vulture-banana.ts.net>
References: <SJ2PR15MB5801EA7FA684D3B21EE32CE3AB8D2@SJ2PR15MB5801.namprd15.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WocVZOK9VpETywLE"
Content-Disposition: inline
In-Reply-To: <SJ2PR15MB5801EA7FA684D3B21EE32CE3AB8D2@SJ2PR15MB5801.namprd15.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, openbmc_compute <openbmc_compute@meta.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--WocVZOK9VpETywLE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 05:08:14PM +0000, Amithash Prasad wrote:
=20
> We have two primary methods of creating threshold based events.
> (1) Legacy, used only by dbus-sensors, set the ThresholdAsserted signal[2=
] and subscribed by phosphor-sel-logger[3] Which creates redfish events/mes=
sages.
> (2) New, used by others as specified in phosphor-dbus-sensors for Critica=
l[4] and Warning[5]. Current sensor services which raise this signal:
> Phosphor-hwmon[6], phosphor-nvme, and phosphor-virtual-sensor raises a di=
fferent set of signal[6], using the phosphor-dbus-interface
>=20
> Phosphor-sel-logger subscribes to both these signals (Legacy[2] and New[3=
]) in different implementations both translating them to Redfish Message ID=
s:
> ```
> OpenBMC.0.1.SensorThresholdCriticalLowGoingLow
> OpenBMC.0.1.SensorThresholdCriticalLowGoingHigh
> OpenBMC.0.1.SensorThresholdWarningLowGoingLow
> OpenBMC.0.1.SensorThresholdWarningLowGoingHigh
> OpenBMC.0.1.SensorThresholdWarningHighGoingHigh
> OpenBMC.0.1.SensorThresholdWarningHighGoingLow
> OpenBMC.0.1.SensorThresholdCriticalHighGoingHigh
> OpenBMC.0.1.SensorThresholdCriticalHighGoingLow
> ```

By the way, I also found out today that there is a "sensor-monitor"
subset of phosphor-fan-presence repository that also creates a different
set of events.

> These messages export 3 args: Sensor name, Sensor Reading Value, Threshol=
d Value.
>=20
> While these provide value and have served us well, they have a main drawb=
ack:
>=20
> They are not part of the redfish standard which specifies explicit messag=
es around sensor threshold events.
> Having events emitted which are specified in the redfish standard message=
 registry have very specific advantages
> for the client side who can use a consistent library.
>=20
> Proposed Messages:
> I plan on creating new events which are based and intended to provide Red=
fish SensorEvent 1.0.0[7, ch2.14].=20
> ```
> SensorEvent.1.0.ReadingAboveLowerCriticalThreshold (Warning)
> SensorEvent.1.0.ReadingAboveLowerFatalThreshold (Critical)
> SensorEvent.1.0.ReadingAboveUpperCautionThreshold (Warning)
> SensorEvent.1.0.ReadingAboveUpperCriticalThreshold (Critical)
> SensorEvent.1.0.ReadingAboveUpperFatalThreshold (Critical)
> SensorEvent.1.0.ReadingBelowLowerCautionThreshold (Warning)
> SensorEvent.1.0.ReadingBelowLowerCriticalThreshold (Critical)
> SensorEvent.1.0.ReadingBelowLowerFatalThreshold (Critical)
> SensorEvent.1.0.ReadingBelowUpperCriticalThreshold (Warning)
> SensorEvent.1.0.ReadingBelowUpperFatalThreshold (Critical)
> SensorEvent.1.0.SensorReadingNormalRange (OK)
> ```
> All except the last one of these provide 4 arguments:
> string: The name or identifier of the sensor. This argument shall contain=
 a string that identifies or describes the Sensor resource.
> number: The reading of the sensor. This argument shall contain a number t=
hat equals the value of the Reading property of the
> Sensor resource.
> string: The reading units of measure. This argument shall contain a strin=
g that equals the value of the ReadingUnits property
> of the Sensor resource. Unitless readings should use count .
> number: The threshold value. This argument shall contain a number that eq=
uals the value of the Reading property within the
> <threshold> property of the Sensor resource.
> SensorEvent.1.0.0.SensorReadingNormalRange would have only the first 3 ar=
guments.

SGTM.


> (2) Have each of the sensor monitoring services (dbus-sensors[9], pldm [1=
0] when it lands, virtual-sensors[11],
> phosphor-hwmon[12]) updated to use the appropriate new message/exceptions.
> We can track thresholds as they exceed and log.
> Each service will log an appropriate event as the value exceeds a thresho=
ld. (Example, reading exceeding Caution

Yes! Each service that implements Threshold interfaces should be logging
their own event for the threshold exceeded situations.  No more
phosphor-sel-logger / phosphor-fan-presence-sensor-monitor behavior of
some _other_ process logging the event.

>=20
> Thanks,
> Amithash

--=20
Patrick Williams

--WocVZOK9VpETywLE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmbP2OAACgkQqwNHzC0A
wRml2w//dwFUNx6t3J/5n4uy/KLsLlrao3Bn3P3Stn4Gu48xZlxqigmnha15n98q
0vLuLfJJqaSLqd7FlDu6kHD2qrUknET8Cv/eHng8e7LlComGV1y+wVjVUEv3XW7K
IOVowCjm2RfrWj73tvqP+TGd9kvG+T6wPrZBO0kAU52V1a1lKEYq0o5HvEEd5gmU
mZGWc6hFDNSKdUrFq3ZTPI6IPxSpSBLcNTBYskVbb/5co+2iWceXcfLHm6kSTJvU
q8+O7W4hoqsL/oY5L/sjEWRY82Sx0+XkU3ilfpfn7pmppg1SaB2ySa9RwqhIY3sR
qfknpf2qO8nHSmuOuUi04HJhB8HfgYtCMCEhALpC7+FtVoStfDRbJl7fePX1SvMz
UN050DQMu84ZIvbv+QqxGJ2Pb7bsa1vxQ53+KWW30d9nh6gE0LmsmDbatzAnZDbB
HNjSDncQVuWlR2GsQcXgvvqKJqoIfkGQbsXmR3cIDMNFWdzA52ev7/FYsE8I2cy0
7NDPxZ3PyOXEYJwmQyhtVv6QinoP0iCQr8be33vUE9iFgc2+nrq53cLuhPd1poBG
xTt0oGILUwg0vzEkfmvvG13mpr2CeAhVER2fnGxTIyUWoZNhw1dKX3SvlMy3th/0
+cUV3LWrmYTW1LEB2ykGk4Wa4phx+51oTonIU3zMgvIhqY9Uerg=
=fC8P
-----END PGP SIGNATURE-----

--WocVZOK9VpETywLE--
