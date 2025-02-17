Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 625F3A37969
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2025 02:08:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yx4Kp2c3kz3c8G
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2025 12:08:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739754523;
	cv=none; b=D22qhV77AI/DL8+Cbb7lsnGfcB4v4qG6UR3/lPU0IWNBJKCnwUxVv7Sg+hB+BdmyR84g7ZJrteVWe4M/tCUQJRygAfT0HogPL+rDXq5d0UatpCMSJxhkhGY+lMsgHgEmA8Xvs0XCveEf67GCJHH9tw/mUJRkbANAUSYgmd5J8Uat+6YtNHkNcUXrYIstkX1SzvV0j/vtLv/BzB7yM9HoGlvhoglSNsBJ7BW8t7oaRfO24xUsG1JxB1TW3FrgILp2qexScXeMeVMyLjZKrfiFeMPh6QwBjrxy7MmuHo98qP5iQJqPRvVzujJ7sH96Tkatul4ST/afsAMeYTlY4Xwzyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739754523; c=relaxed/relaxed;
	bh=kTvXpNTT8hBvwLlumL0i3cvNsGGPFZ1Q01c5tvz2Iy4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zyv54NSTQVVOelUiwt+NXsYN7DpnPuh7Ec4zJOTUItPL0neigmbsgTpyTl9/+70gKwRMTupzNJ1iQaLssIp487jJNLbzpYIVUZLQC5gEcWQNKO/7gu05Nrp0Xvur+K5MRTSu5davqg65Qoj5IgMOywsTo79EqS/2fVJ/blTxe5ndIwcqvXNLqnS3WrVr2XEv6ALHGEJx7x7BbKEuKSMBPEywJP2hgJtlSZqVbnOAoOY7q1KAg1l29T6JEK3//ISO4fcC9lTpv/Bcq6Boo+7JKHHnelEUbm672oYLgT7xsmJjqMRrkVzH93OH/mrRAnQ68g2oRTIwnS602lSm0dJcJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Pdy+tuHn; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Pdy+tuHn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yx4Kl3t5sz2xBb
	for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2025 12:08:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739754523;
	bh=kTvXpNTT8hBvwLlumL0i3cvNsGGPFZ1Q01c5tvz2Iy4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Pdy+tuHn1UipDIaUoqg7g50EOiPn8n1jj69C+LQHA4rlKnBPY8L4DWv/54Kf7BWQr
	 pfUuBTQLkoLT8oQfXwG0kCgAdXPv6za/jjW5Ffyswae1BM7GJcetN96NiEeUKjoFBJ
	 BhKoh5nPsgFT5CdOhcM5TsyLSN3EpTwInyYWttYNUso3xG/3i3vESk5YSO80QytHp1
	 PoShwM2tTxMkz4aGpJ/8el8FS4kMyCGEs2KRMobT2GQq6B2FccVKhwkdf8/uV6wIw6
	 XS+83BVHL/zbKcYIvsRE458QwNhOlzui60CgYv0Nbyvya6M0M0yGEIdGhGzA6/2l9a
	 Ilgl2s4BQ7PJA==
Received: from [192.168.68.112] (ppp118-210-170-58.adl-adc-lon-bras34.tpg.internode.on.net [118.210.170.58])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8961764E5C;
	Mon, 17 Feb 2025 09:08:42 +0800 (AWST)
Message-ID: <b0b62f3d4510f2d28f4b7682bfb433cb4267d3ea.camel@codeconstruct.com.au>
Subject: Re: Ampere's CCLA Schedule A update 2025-02-10
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>
Date: Mon, 17 Feb 2025 11:38:41 +1030
In-Reply-To: <D5524156-6A3D-4AC2-85F2-6BE5719937FF@amperemail.onmicrosoft.com>
References: 	<077812E1-6D53-4F66-86D5-57DD5B8A8779@amperemail.onmicrosoft.com>
	 <99a6795fac93ed52f2b2546026dd2cb4032dd8e0.camel@codeconstruct.com.au>
	 <D5524156-6A3D-4AC2-85F2-6BE5719937FF@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Hieu Le OS <lhieu@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2025-02-14 at 06:41 +0000, Thang Nguyen OS wrote:
> Thanks Andrew for your feedback. Please see my comment inline
>=20
> > On 14 Feb 2025, at 12:23, Andrew Jeffery <andrew@codeconstruct.com.au> =
wrote:
> >=20
> > On Thu, 2025-02-13 at 04:17 +0000, Thang Nguyen OS wrote:
> > > Hi Andrew Geissler,
> > > Attachment is the updated schedule A of CCLA from Ampere.
> > >=20
> > > Please help review.
> > >=20
> > > Note that Hieu Le will replace me as Ampere CLA Manager. I will check
> > > with you in Discord to change maintainer access from me to Hieu for
> > > what I am handling (openbmc/meta-ampere and ampere-ipmi-oem,
> > > ssifbridge).
> >=20
> > I don't have concerns with Hieu replacing you as CLA manager, however
> > the expectations are different for maintenance roles. Background here:
> >=20
> > https://github.com/openbmc/docs/blob/master/community-membership.md
> >=20
> > Specifically:
> >=20
> > * https://github.com/openbmc/docs/blob/master/community-
> > =C2=A0 membership.md#platform-maintainer
> > * https://github.com/openbmc/docs/blob/master/community-
> > =C2=A0 membership.md#subproject-owner
> >=20
> > openbmc/meta-ampere still has Thu as maintainer, ampere-ipmi-oem has
> > Dung, and ssifbridge still has Chuong. These won't become unmaintained.
> Actually, Chuong changed to another role in Ampere before so I am the one=
 who reviewed and merged changes in ssifbridge so far.
> Dung is inactive in ampere-ipmi-oem also.

Okay. I think it's fine if they become formally unmaintained, if that's
what your situation requires. The technical oversight forum can move
things forward if/when necessary by introducing new maintainers in
accordance with community expectations.

> >=20
> > Hieu should be subject to the expectations outlined in the community
> > membership document, as everyone else is. Currently Hieu has few
> > changes pushed to Gerrit.
> Do you think I should update the Ampere CCLA to add me as member again so=
 that I will continue to maintain these repos until Hieu satisfies requirem=
ents?

I'm not sure. Does that make sense for your situation?

Andrew
