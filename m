Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0243893CE16
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2024 08:18:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Zx1QC6Cd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVcyZ6rMjz3dBK
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2024 16:18:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Zx1QC6Cd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVcy36mX5z3cdy
	for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2024 16:18:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1721974697;
	bh=bO9w04C4FhCu2q4FC1YtzYAAC7CNVHR72IVGrz6vca0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Zx1QC6CdmZrL8bMlUKRCcr9qOgDq/Eb23xLtALt2evttm/L0lsehxS/oHjuqrBT/q
	 9XIboB5CsiQyzrFysUt5cn9Nsfqi2woqdJ28t/uA6mB5ZRLEk878AKr4bAM+f/rZJL
	 Dzpi86GLDhaFEPgM88iFvKwNHquo+yOKq8DNv1mDTWIyLC2MSJ2YMo5IycQ6NU4uwA
	 Tts3C5L3S7B7NRXtedRdaMt75x7ZwfTddarZE5HrsGcHBhf6pdwDe64CFd1/8H4SAb
	 /MmpbfZkHYJ8i04iNBLDIYQhIAm2qTVaZVhLYHhpcgd0z1C7wM01ImYNWDajMumJVK
	 PAHhHov0uNmrA==
Received: from [192.168.68.112] (unknown [118.211.93.69])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 20B8866AB4;
	Fri, 26 Jul 2024 14:18:16 +0800 (AWST)
Message-ID: <85c34699965379f7ceea3f4cdea120e9fe15fbe9.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v1 0/2] spi: npcm-pspi: add full duplex and fix
 word issue
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 26 Jul 2024 15:48:14 +0930
In-Reply-To: <CAP6Zq1hAMrN_tssFnrAeJDiRtDhSeeFPFN77KGGpAjFCe0aLqg@mail.gmail.com>
References: <20240709160242.1921541-1-tmaimon77@gmail.com>
	 <f17486d058ef660c65a9911d62605c250cdc0b09.camel@codeconstruct.com.au>
	 <CAP6Zq1hAMrN_tssFnrAeJDiRtDhSeeFPFN77KGGpAjFCe0aLqg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-07-16 at 17:05 +0300, Tomer Maimon wrote:
> Hi Andrew,
>=20
> On Tue, 16 Jul 2024 at 06:25, Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > On Tue, 2024-07-09 at 19:02 +0300, Tomer Maimon wrote:
> > > This patch set:
> > >       1. Add full duplex support - this patch have been upstream to d=
ev-6.1
> > >                                                                and re=
moved.
> > >       2. Fix transfer bits per word issue.
> > >=20
> > > Tomer Maimon (2):
> > >   spi: npcm-pspi: add full duplex support
> > >   spi: npcm-pspi: Fix transfer bits per word issue
> > >=20
> > >  drivers/spi/spi-npcm-pspi.c | 90 ++++++++++++++++-------------------=
--
> > >  1 file changed, 38 insertions(+), 52 deletions(-)
> > >=20
> >=20
> > What's the state of this series with respect to upstream? Is this
> > something specific to the openbmc/linux dev-6.6 tree, or is there an
> > upstream equivalent? If the latter, can you please link to the relevant
> > series?
> This patch set hasn't been upstream yet to OpenBMC vanilla and it is
> not specific to openbmc/linux dev-6.6 tree.
> We will do our best to upstream this patch in kernel 6.11 (We already
> have a lot of patches to handle in the next kernel version :-)).
> since we need to upgrade the NPCM from dev-6.1 to dev-6.6, we would
> appreciate it if you could add it now to dev-6.6

v6.11-rc1 should be tagged on the weekend. Given that and your intent
to start sending the patches during its stabilisation (I'm interpreting
your comment above as sending them targeting the v6.12 merge window), I
intend to apply this (and the remaining patches I haven't otherwise
replied to) once we have links to them on the upstream lists, and
tracking them with the usual OpenBMC-Staging-Count tag.

Andrew
