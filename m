Return-Path: <openbmc+bounces-479-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE54B2CE2B
	for <lists+openbmc@lfdr.de>; Tue, 19 Aug 2025 22:40:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c61fw14W8z2yrT;
	Wed, 20 Aug 2025 06:40:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755636008;
	cv=none; b=CwckOh4aFc7QpYqA8ZR0+mdeVI5oza1NzGo5G23kOmFeEzHHDRpkN4c88PCvaaKZWU4XZDGkrtqfyPfJPlYTQ5rlq6ENYDlWDI/fJhbwBfZs6E6HBY0Lt9pvmpkvfLD0orBOALjagKzSF3/PjROxnEWSZ4nWxEdHt2vfQ8QpbRxJ1U7APGrGuszDiWlX+LxQcrjwKbfYTm5ftniayEzzdVEC+E8qXu1946UFSr7YxmO8Q2AFs+dfqTjWCTvC4bQ8lgqSw+XAV6Xy5m48eH+VeRh4lDPH0R+Zb+Xhj+PwGk7K4QrIsxWl7O1fOogn3jm1g72H8hJdkTMIJGoniKzO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755636008; c=relaxed/relaxed;
	bh=Ij+dMFgfyNOTHFGUqXbZui19tDIvuTGyKs1gkwFOSEg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFk8WzH/tQsMZ4sAb6q89VeUGdlgUbSYkmLCSqUSuCHliRvoiBqadVSrXKbMHg94yd5ZTyJ926Bel7YrlFt4pUaxoCN4ogyYSbOQ0EluhtnA6ylGQoLyaRfW3e8Ffa6qAjNeVhHSLlS8f44tR7xFtSKizGoGgdo0X2OnLmL0RCcy2p6XAoD9tFHzMuErVcZYAKoWyNIoEqzx19kkdrN6b1vO0umr617e9HfUOb2Apa8qgkzHTHnBKwTlc9K+pZvgEH+Lqdfl+wkc4IiLBsM2dTfDyqduIDFB2vEncLODsOh28uyXMkEjCvlC4QjJYVVAWmrlsPinBdz9E7ZQpcucTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=koGwFbCa; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZN0ZVihs; dkim-atps=neutral; spf=pass (client-ip=103.168.172.149; helo=fout-a6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=koGwFbCa;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZN0ZVihs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.149; helo=fout-a6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c61fr5PLWz2y06
	for <openbmc@lists.ozlabs.org>; Wed, 20 Aug 2025 06:40:03 +1000 (AEST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 6FBB2EC037F
	for <openbmc@lists.ozlabs.org>; Tue, 19 Aug 2025 16:40:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 19 Aug 2025 16:40:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1755636000; x=1755722400; bh=Ij+dMFgfyN
	OTHFGUqXbZui19tDIvuTGyKs1gkwFOSEg=; b=koGwFbCaObW/RFaNsvh2epkAjZ
	vyH4XDWqp+dMkeByk2buwTDJu7WegtxkRhxjLRN3D7iGm6N/C6+89ey2Dgnv7jlT
	WK0R7TMuT6RSo++N23JKRTNXYS6AxmqQ+Y5LQ04M0Do8/BdXJ/JXYxvcpwNzWuDH
	qxMvyKNP6oWuPl99AA9tBXEDfWsVA/C8sI31VChlLOCgr8It2vCW5h/TS+DgnEfr
	THQCHJBXkwQD6Y0Ii7DnbNsFqzotRyP+TV+rYxJPL0Ix18/RqhLTI0vXVhQf1DrY
	YmXF+WgNmw/ZREZiTio+BoLsxe++o+s8kbAc4///kMz120XYabRlgjRIs3wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755636000; x=1755722400; bh=Ij+dMFgfyNOTHFGUqXbZui19tDIvuTGyKs1
	gkwFOSEg=; b=ZN0ZVihsKJjBpiTnBA0GrrkgbLGbQlW/TqKurQZSXG1ORCniALf
	L7ZDVljP6hCYij3jSh9Slx/Ofj3TIhRPBr8rkf1ei+7dnAj0R7PYRaYA9PjsYPSD
	8NYwNqGyfQisbilxLnwoox99ZAR3xzRm2MpuIHGgOxP36lLzNK0dTsLALRDI9IyN
	XdFFc1H04/+dViwp4XxuaHgqMGc2ylQWRXvn6VLcRyjYoY2oSyudlmfSfk/G10gN
	l9+wgVf59Lgbo/ljvr5NPlD47l5OPfE4mMy0ObRW/Nw2tfvea9S9a79eDikjPQ+y
	JfPsUXaaL5UxPGAb3WhS5h0G3qxAIA1nKzw==
X-ME-Sender: <xms:H-GkaEmrAhHI820KZabB3iEGnn_BVe08IYfxfXtN10CBYEJHTg-d1A>
    <xme:H-GkaF3vdFW3tgmRRCe44zbbmIUXVgiJpMmjnqEL1t-wIQt4rxGgIRxH58yxquP3s
    GNozCzoH6vzMQxtp8A>
X-ME-Received: <xmr:H-GkaMD5CCo75TVOkrPnVEPObfsmMQZxFtx3h0wXKkhsuj5sKGUmhlxpFjY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheeigeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrh
    hlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvden
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeehleef
    hedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtghomh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
    rhhitghksehsthiftgigrdighiiipdhnsggprhgtphhtthhopedupdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdrohhr
    gh
X-ME-Proxy: <xmx:H-GkaCzMWVTilsCwX_lMoxCO-4FtDxu2bQCQBb9GQ-Wy-YNBk90qOw>
    <xmx:H-GkaKlj5rkYznZid1X67hMGIOCtszja8zwb7xjGP7699TWg-rdmzw>
    <xmx:H-GkaHFObaGopZXM_ZgpwU9nhRSJs9hbbGmN2YpU0mxAzh4pndVJ-Q>
    <xmx:H-GkaKWLwxb5jruaL41mvLd3SRRwLf2x2qror_h-akR_KPo-B6YaaQ>
    <xmx:IOGkaBxv5Gsgw0KFEplo7hZ8TFxiAiNHpazqAru3HlIHOqEHotJqpErl>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 19 Aug 2025 16:39:59 -0400 (EDT)
Date: Tue, 19 Aug 2025 16:39:59 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2025H2
Message-ID: <aKThH-wUWmqyCisX@heinlein>
References: <aKOKlY97pOtfuaEv@heinlein>
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
	protocol="application/pgp-signature"; boundary="HqAuw0Dni4xoFrMO"
Content-Disposition: inline
In-Reply-To: <aKOKlY97pOtfuaEv@heinlein>
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--HqAuw0Dni4xoFrMO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 04:18:29PM -0400, Patrick Williams wrote:
>     https://github.com/openbmc/tof-election/tree/main/2025H1

Rohit mentioned that I had the wrong link.  Please use this one for the
current eligible developers:

    https://github.com/openbmc/tof-election/tree/main/2025H2

--=20
Patrick Williams

--HqAuw0Dni4xoFrMO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmik4R0ACgkQqwNHzC0A
wRmJPg/+JpftWgWxV/2zcfpdXAxxcFcxyxcnXHpdnUzIF00twdSvIcha/htKx/qf
UaH3ifTIusNH8MR4NV75IJD78N+uSXlbEN/LVAU3vnDUoA2Bac8zsRQTf3Y9WpYv
dIoeLVeGuccDh+FTvy34mBKFEFjXTY5ageb1+s+70dqHwcAA1jFEfgiqeIrvCfUD
5rA49b26xRNpSOUa0oytNK3VfS6m4tHdmsUzEgawZ54jGsp0Lx3PRRJ3FsDlGjq0
s6roemgoc67h5JQA7uvOWz5TS4tEyJe3DWXDmIso0XdnxkzqA4hAme2pXSgPNpWE
ghT6W5feE2WkzU55QByIfrjATrkLt3HSzKcbGa2+Olf6z4yYneCi17NdW/nqINsy
JbyhpO7snV4I8gbugiNxmjeGI4IEEFOpmR4I1/RcCwH0LTlj5RZ5LuCIxRiZLGgl
Fi+zMqb1DkaIOBnVPutO4fP8uzoZzJlFIwhFhB7Dvlm0vD6OQESwlVYPXXevRHgP
weCReP5CBfbW7pILxsoyi5DT+xPje+lyzbt3pOxx6gPJc8V9akxkwq9lh6h8K4yg
iCOUGN61MzCt+g4NotmprFbQ7vjC8ztBKb82HMNaL8/IoD2jhzRkemNjUcSjrhPW
faUN1Sxw+F4qlxQ+JoITUn24tY72+zmrumJQh3LkKIuAckpG8aY=
=j6p8
-----END PGP SIGNATURE-----

--HqAuw0Dni4xoFrMO--

