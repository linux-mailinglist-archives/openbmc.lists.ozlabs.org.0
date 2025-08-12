Return-Path: <openbmc+bounces-432-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7890CB23A8E
	for <lists+openbmc@lfdr.de>; Tue, 12 Aug 2025 23:21:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1kvc49qwz2xK2;
	Wed, 13 Aug 2025 07:21:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755033676;
	cv=none; b=E+gJpJY25D0cuJXOpSDQLcQbMNYni4ouHRnTFN8vesXAVNtiQQwm/0ZYhcmIM7marbh7oA9GXbz9PdDJYC59J9vuk6/CReOMvRKrNixbSOen8aP648+kZnbhpxC1571Lnqhk4pJknP4zXuDotPJe/Zbmho0fgtCa3gO0zJlhy1lpj2TM/9SqMAaRttueU53+AP0Fmwy+DRuRwcpzDJM8kUBx+7m50zE+fjyyJhV2Yanvq5pRnulpabhI60ZM3ifE+9Y/6hGzDLMu3SN8OwGB3I5mEiBIl+rSSdmZBap6ByhNYQ+CRoU73obyyMzL92peXmU5Tnsz6P2m3uiJQMaRLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755033676; c=relaxed/relaxed;
	bh=24LigCkE6zctm6E4jG8q8Crh12iLYDW/kuAAOEBeNkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NziA6qkI/LvmOyz/LSehR0fKRIswCuvAKhAS1UtspTapI4zWQABB4uUulSN5ahiTfV6i+m7DHLZv1q9fZ+daClBZqHxf9w14jSbj9Olj5f3aU9QXegjE+H7zv0VSLrKvYgGKhuSRPVpLcKGfD3iVCAJdnIbntkcTWV+G2Dh69Z60YL903507S/EDGKWt8HrymYHLVUVd/uUNUiP9WBWhiQWx7o39JyZ0whCZx+4vCCRTbsM6fRcw2Shy6GpoCuv4/M8EMiEgjZWj6B1ojMuIjw8+eh2s5VHIhkmhWglI1l4EbTwFbkoH26buw/ETeSPSnPOg1wxorrSTplksr7BalQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=YPjQcEdb; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jxmCYdRQ; dkim-atps=neutral; spf=pass (client-ip=103.168.172.151; helo=fout-a8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=YPjQcEdb;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jxmCYdRQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.151; helo=fout-a8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 410 seconds by postgrey-1.37 at boromir; Wed, 13 Aug 2025 07:21:13 AEST
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1kvY6pTPz2xCd
	for <openbmc@lists.ozlabs.org>; Wed, 13 Aug 2025 07:21:13 +1000 (AEST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id A0623EC0255;
	Tue, 12 Aug 2025 17:14:19 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 12 Aug 2025 17:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1755033259; x=1755119659; bh=24LigCkE6z
	ctm6E4jG8q8Crh12iLYDW/kuAAOEBeNkc=; b=YPjQcEdbg3Sxm+MQnhtdQew5A1
	I3WNejBbWsOBIjmdHTgdOvLnWiFX4W52JJT7HzrfoXpQOYiN0kTtRSr32HfSj+wX
	qe4EnTVFWJwrRaWVUhVLOeUqpQTfFdugTPpvR56KybQlXMM/Y/TuaDH20wi/izdY
	PWwmZxBPyV563Tt9jju9Jn0TgPMjkCryT6tMJ8bJPCeONAXE6gywfGj05YFl0bjI
	ArqwpbQUIgU4Oe2tVKjOC9NEDI+qYv9Ba8dUVZlPCNCqx5BViWqgdglTUVCQoxD/
	vFADi3ysLPKqId/z0NyRQIEBvr7CuOa/nZ6R2F1dZ+70E/UE2+N7VCZV6kCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755033259; x=1755119659; bh=24LigCkE6zctm6E4jG8q8Crh12iLYDW/kuA
	AOEBeNkc=; b=jxmCYdRQk3qc8EQlcKAdZw7WN92mS+g+Rfv9iE7WWgWTko1DhQw
	Ooisu52iQzYT5/oou/vmO5W+R9nfog7ed679S67APMN6ZDEXRkj4RJZo6X3wrLWu
	VmL+puZ+bpSxnPqeq8qyRQdvRw5GLNtezctkKVw27R/VZXW4RNw6WJKICGxbV8EW
	gB4SPew91HFUPLhYg7zImUKgIO1E721KiJ8EDp+ihHqZ4osuNahzOeIzmMyv9P4b
	uzYH5+e/4O7v30lB+x4BtSTXYNRLInV8MacM2duIWTLYae1cJXs6l3DNqKScC2/f
	kHywKIDcsKLa8CIZP2JArypEsPH3QfRgZHg==
X-ME-Sender: <xms:qq6baPZfDkWuNzaDQrpiVWkEaoWnmQ__I7ZrT6d-ZxvpgQ_UAzpCkQ>
    <xme:qq6baFRbf4aCCIu3XzdKszoIwwIV-Ee2fI2YJ_CEvmi8PavwX6-sWJLgRUT2uZyut
    uOblaw-u5KF4OrAqG4>
X-ME-Received: <xmr:qq6baO7bSMT-pHbvqv9iUY7IoXG_eEAainRkCfjhyCAwav3bURM5TaF97OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeeifeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrh
    hlucfvnfffucdljedtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtdorredttddv
    necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
    iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeetveeugfevteettdefvedufeehheet
    feekuefgudfgtdefvddufeevveethffhffenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiiipdhnsggp
    rhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfi
    estghouggvtghonhhsthhruhgtthdrtghomhdrrghupdhrtghpthhtohepohhpvghnsghm
    tgeslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtohepghgvihhsshhonhgrth
    horhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:qq6baCyC2JmxoVczpib5rf3HFZJhvde8r3NqCzNXhtPIfG9zLKuo1A>
    <xmx:qq6baFS14ZFnay1baDnhBTzTtpOrE5cn66TO8tk3cZEt-GSmnMgrMA>
    <xmx:qq6baJW6XVUiPbZqaYClzmIwghdU2B_wyteEEvZu3BZa0RbGGJBvpA>
    <xmx:qq6baHZdBp9I2AQk5LW6teC0UCJyWzjPAr_B59ofN2kxieGsWRNOLw>
    <xmx:q66baC5MapwvSLZ03YMsgkpiZUd97k1laq7BRPcNVuumGCzNRplBg0bq>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Aug 2025 17:14:18 -0400 (EDT)
Date: Tue, 12 Aug 2025 17:14:17 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: openbmc <openbmc@lists.ozlabs.org>,
	Andrew Geissler <geissonator@gmail.com>
Subject: Re: Proposed deprecation of device-tree-gpio-naming.md
Message-ID: <aJuuqQxqOeuBYhmg@heinlein>
References: <eff663ee55f2614dde750f5f0669ec876f107c0d.camel@codeconstruct.com.au>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FmRnnpfPLvwGKx0H"
Content-Disposition: inline
In-Reply-To: <eff663ee55f2614dde750f5f0669ec876f107c0d.camel@codeconstruct.com.au>
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--FmRnnpfPLvwGKx0H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2025 at 09:24:37AM +0930, Andrew Jeffery wrote:

> Devicetrees represent the hardware, and from experience
> over time I think it's best that they reflect the information from the
> schematics without influence from software implementation choices.

Can you elaborate on what this experience is?  I'm not sure what this is
referring to or what issues you've observed with it.

Devicetrees do often represent the hardware but they don't just represent t=
he
hardware.  For example, we have the flash layout in there.  That's
strictly a software function that has no connection to the hardware
(except for the flash size itself).  I'm not convinced we have enough
words as to why it is okay to specify the flash layout but not okay to
represent the intended purpose of a GPIO.

If GPIO names were to reflect the "information from the schematics", I
assume this is to mean the net-name?  Which net-name are we going to
use?  The one on the DC-SCM, the one on the connector the DC-SCM is
plugged into, etc.  There are probably, on average, 4 different names
=66rom a source of a signal to the BMC.

You could of course say "whatever the person implementing the devicetree
wants" for the pin name, but usually that's the least useful name to
anyone else.  On top of that, schematics are often times closed and
unavailable to more than a handful of people.  Having a devicetree named
"power-sequence-start" is way better than "DC_SCM_GPIO_P7", right?=20

Sure, we can have this translation in entity-manager or wherever, if
someone contributes the entity-manager config for their board.  But,
that means it's only available to BMC code.  When I'm actively debugging
something, I have yet another hoop to jump through to go from
"DC_SCM_GPIO_P7" to "this is the power sequence start".  If it is in the
device tree it shows up right in "gpioinfo".

> However, perhaps it's still a reasonable set of suggestions for
> consumption of pins with the translation from net names done by the
> applications themselves?

I think it is.

--=20
Patrick Williams

--FmRnnpfPLvwGKx0H
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmibrqgACgkQqwNHzC0A
wRmDpQ/+PYAS9eHsLCua7D8Aqce5GRc2H8rTgrdyiiVo4QpQeZtOcAf8UIM7idDN
2PrELzPmNA0i9Rz2F+8jVyT1TwzB9yiZ2AaeeKs+e6CGBvJsTzi59yUNaWP7tPKV
Wp7aPLhOZeJ41ox2gXtKysuBSAaGKIfS+ebvXWLLYYGVv+SvDAz0YdPeT36xnObO
Cy0JJjAQxrmUopRZRgpHxdgSFnK81hDYVe2WyxhtEM39eNbKvGe3QWjtnxL4yQIH
6ayw804auks1jxmQ/8ue6MeCChIMOxtuNNGkmFiIxErrhWK/hmc7pPUYYaGejkmL
bY9o3cRJgnyNqK5q3u3NSt0tM3YYjMG0WgZ9bFEk7GPojJg5UjowvunNDJNLnLCo
rAl4sFA9rCBZdjd+uCIKeuXRsabfbXmaau11ZvWkwKRe9GfWus9Y9j+d7KF/m6gE
Z4s3toRmRt9J/ZhACTEZ9fqIkPhdBcT/o4MxPb1Cr/lrRmn+/xz+fPS2xKj2oenY
GzmrYk91JRTbgJ4o6s7dgQQT+SbwU5JyAXaIoFbF9d5NWfIsL+06HjtpEzGD38GZ
eHRex8rwAayGEDW/uxi88speuT3qnDfK+32NUE5asox1LKmuo2iKequeseXEVgGk
uqJ+ZTEjubvdVHp66FJbYwGxixpVhxT4SQSSOIVraLRKoZsIzMA=
=fq1H
-----END PGP SIGNATURE-----

--FmRnnpfPLvwGKx0H--

