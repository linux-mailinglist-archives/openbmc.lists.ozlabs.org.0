Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9072181CF84
	for <lists+openbmc@lfdr.de>; Fri, 22 Dec 2023 22:41:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=En2dxes8;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=avC0jKmN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxgjM1sJ5z3cYp
	for <lists+openbmc@lfdr.de>; Sat, 23 Dec 2023 08:41:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=En2dxes8;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=avC0jKmN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sxghg5h6nz2ytJ
	for <openbmc@lists.ozlabs.org>; Sat, 23 Dec 2023 08:40:50 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 5B8ED5C0315;
	Fri, 22 Dec 2023 16:40:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 22 Dec 2023 16:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1703281246; x=1703367646; bh=pKX8T0kWEO
	i88D8kuH457ZUk9N2Er2PaLzdJVSiLJ5Q=; b=En2dxes8JMe6XSnn07/j9p/Doi
	EzzW2wdqaR9MI0HbEvtCt4gR7AbzCRTF+JIofUkrztTwb6cJPlUMYfG9o/kM0482
	0PWfla9iUss0tKySaISnXG0DSH7uQVaS06oXmSbI8vjflQbsPts0mwZGVil3uZL9
	4e11pbutX9hC8qHvg9kTmzDasTpKwsWJ7P0BaEP8ie//S3pokTS1lsq0Decn7GG3
	8qPXfsH0qSPVi1PlytLCAkhGBxy4kr0V8UrHSDgceoREVKkve77aKFONNiRMvKPW
	pEon0PxDRjuaXGfY7FN3Eekohi09nkcbbvULwTPP1nY0EjWyq3Uydzb7+olw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1703281246; x=1703367646; bh=pKX8T0kWEOi88D8kuH457ZUk9N2E
	r2PaLzdJVSiLJ5Q=; b=avC0jKmNPR9UsS+7MK3wny19JIUx9mloTAUX3qeG95eV
	PnoRAj8r0cS7rzKBeF3fABHMMMSera7VDU7nq2fpGL286pvyirc89QBxVC2jozId
	70bNi0JLFStNce1A6l3/iOBgFTdD+Xia/w7mLjjNloonzJgS4THVJ5EWFKedHitn
	47GRKYOqrfFLuBiLr/HinWRq9UHgat/dN4d7494Hvvx0YOJ7+sQipJM5okwyZ37c
	wznw4On6nVNz+ZrFmC6xmO9jHNYwwovxfXdMJrstSLMRY6zY4mTLRKDZ4GdGyAC9
	lQVfeY83wN2qCm1tL7MpwZDHk+yWD3+mPoN5+Zo3/A==
X-ME-Sender: <xms:XQKGZfmc28Ijoc9g03h7GNWAHlJ0rgKsYk2XF9Ezpwihw_bsdAnzDw>
    <xme:XQKGZS2oCzKH4g4PpUuvof5C_Sau_dwZMQgX9TxIyi_6ysP6c8qetwUezy-jMZSx-
    zuNrcQku2yYtmoUsm8>
X-ME-Received: <xmr:XQKGZVph684S0MElvkHG5u4HnupH_3G8DckKqvmShASL_k3n5_IuFozhKN2Uhso1FKfcPqn8HW-sDzhzXqsQGjnpuA0ZkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddujedgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeff
    heeludekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:XQKGZXm7iqPVsrrJ2vk1tTfhclZ0bPjJJ1ZoZTlgMOt79Prdz6GzEA>
    <xmx:XQKGZd1MUES_lzg2Xiyn8ivcFadUcWtlEcgqdX2LF17HJfOPPtnTxg>
    <xmx:XQKGZWvk4T3ASx6wEn5hWbc_pOocyOR_ebOEpUU1O2Iz65Nj_YhIcw>
    <xmx:XgKGZWxMHKVR-9tIg86H0q3UN482B8QpnJZ4tfWZleCPXhSgyq4tHA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Dec 2023 16:40:44 -0500 (EST)
Date: Fri, 22 Dec 2023 15:40:43 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
Subject: Re: openbmc/telemetry: First complaint of unresponsiveness
Message-ID: <ZYYCW2V-LDe6pQ9i@heinlein.vulture-banana.ts.net>
References: <47c53da80f585dac8e1450b20c5855ede960d243.camel@codeconstruct.com.au>
 <5296a763-9a24-4828-a648-2de5d78cad76@linux.intel.com>
 <ZYMGqtn9XVgjkBj8@heinlein.vulture-banana.ts.net>
 <fcd703f2-b05b-4c21-9d66-6506b7aafa01@linux.intel.com>
 <ZYMc0jRDhpuaP_KR@heinlein.vulture-banana.ts.net>
 <74ad915f-02b3-4c69-ab27-472bb9332388@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4/91LxYfMCc/Z+bv"
Content-Disposition: inline
In-Reply-To: <74ad915f-02b3-4c69-ab27-472bb9332388@linux.intel.com>
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
Cc: cezary.zwolak@intel.com, openbmc@lists.ozlabs.org, liuxiwei@ieisystem.com, jozef.wludzik@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--4/91LxYfMCc/Z+bv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 11:42:52AM +0100, Ambrozewicz, Adrian wrote:
> On 20.12.2023 17:56, Patrick Williams wrote:
> > On Wed, Dec 20, 2023 at 05:03:21PM +0100, Ambrozewicz, Adrian wrote:

> I would prefer to not dwell into further discussion here as certain=20
> topics are far beyond my control. I'll just assure you we're trying to=20
> do the best we can with resources available. Whenever similar related=20
> issues or decisions to make arise in the future I will be surely better=
=20
> equipped to make informed decisions aligned with general open source=20
> consensus.

Ack.

--=20
Patrick Williams

--4/91LxYfMCc/Z+bv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmWGAlkACgkQqwNHzC0A
wRnaOhAAg1TQH+adsK2GF/YoFpvhL/ukfOnG4qmIVf9ypQ1NEKnVoc7AIbqwDtEb
ZJh2iuam9kQ90MWEm159txLscyTd/1BPe8otuvNVfe6XTOL8KHTXCtjHP8aM6v/2
0apBP5EyZPjRBS8oFTfa9XXWmNam0X1MHjCPrS/DLdVFdrGFpmng2auOrfPsFbYf
Vz33K/8zO9koVlsfPQw9ZyeyErGBwZ0ze+AlT4L+lt3EAhE2CWaxIGiBeLjFuaoK
FCX8Zj4VC1Sc4F1eU1EZE0ZZFFUG9Odoa40ry7ZE5ZMnwINpFrhNWUOnGaFaIztL
gl7A+YVmsTv8j1K30IhCtvXvDdPwPpfQ1Aq4/Z5W/6r/MiokKrsoVt3MU9q5P3T7
NlCMZbVU6YUZhg2x6ZBRFTg+IU6A/ieGefTdUXw10s+HSUGDZtbshcl0OgxvfQBP
eL7psEJFqCPBAkg8EW+4Jp4lrtPJMW7RXy3sV8GsBIUtPOkp/LESIQZJ+6CucFg5
Ea6fl8rCU4i7aCOsNzjOwB78IUBVkPZ0BiAIsvbP6Kgq+I+hglmegZyFgy01jN53
M6p1TTNm5al9QA/As54rO94Y9WH3i0+/BYfzqPhRP9zJng/SuwXUbR1T0fdgeWod
5/rYpzRCcRBta3WBpljCkFA90gBF1D3MKlyeXqOHgrUzquRiyfY=
=Gyp9
-----END PGP SIGNATURE-----

--4/91LxYfMCc/Z+bv--
