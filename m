Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A44975FBD
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 05:32:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X43041Tg9z3c7d
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 13:32:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726111921;
	cv=none; b=XgQHamDHrBms/WdnpX9sv7LlXaJwlZsWV2fcVBkbaKHp46rH9Lcwkj2iCZag6TDCjoe1KxOJGpM6m9yZO3963cBVTfApVAcgLsqVEiMGp+1TdVARMaKFic/vJuJ4ZiSXy4A+ELoqeDPRKJk09G1IhEPIOeAyN5YhTZVYbO4FTz8b6RLIIHNnCbh2umDsxC/67Ww4JmHGSXlu9Pm7Fhj8w8hIjoFVz2qehGLe6TEihP3tVCqcDXRCaPvVzSokr2EI/jNjYAu760n4rUvM7WwDh3E1S+UnLx7w1WU1yvBsvI92VAUkrmcQI9WYww3F3h/4ZTYTuvkbH1F8Gp5TZu0p2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726111921; c=relaxed/relaxed;
	bh=wLVcri7r6S3oIlaZawBIgL4VbA7+QSQ21Nj/NbbueEA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hhKym8rVtr3MjXt8n7MiPIbnHzu0kFuoDmFOWevMt/jrofG/vtsYtZP84AzE8Pdq5AM+J26MK4vqqom16wpbptNgvIXWkDmoju19APwodpNaQVc5k3UempjeLwzgCszCQJIDJE5e2s8ts9gTG5E1GR4P1ACGtta1NWPTRuLIrauo1Poj2jJzXtVH4V9HQvcO8Uq00XZr8ugO8mAvW1aE8F+iCnX0YJrXbEqR2Gawo3VWnLViJaPYzu0mY7+qg/2a2b+8kDJUcQQFPaH1kyPFSuZv2tOLOmo+nqvd87DA5lp2D8HSMIkzZDlyqLVClX0cb+h0NpNg/rCPduKpLdADRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=nTXFVopJ; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=nTXFVopJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X43016C8Mz2yHj
	for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2024 13:32:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726111921;
	bh=wLVcri7r6S3oIlaZawBIgL4VbA7+QSQ21Nj/NbbueEA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nTXFVopJ5Jt7L1j3klruPthwzm9/4Gr7CsVjxOW8yzdy4FCBp3If/htPq1kz/YvYs
	 sd1fTSD4K/AJmmek1w0Mx/7CCLErJrJ6dPbA9wXkpLrpFPiwYLZv3ClE6ioNBQCUJX
	 bru9p3ir6QE0jJpMPX2yhHGPi4esj+mzJv5PWhtjQOQvaBj4nw2Ca8rSsDIA2BZWHF
	 +4JO31KCdqOeVptcGKYb0G4apQ4lT/CqnQcOHUNZQT5F0jTV4+1j4jvKggw8HeAGYj
	 4d433n84YLhWVC5oePkpN6ttLY7J0Z8vIPa2YOURC42vo+5qKdm457jgCwEDKtC2OH
	 nGYosW4zBsZ1A==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ED465650D6;
	Thu, 12 Sep 2024 11:32:00 +0800 (AWST)
Message-ID: <75856bdf67dda2ed81881faec6a2d52743bd593b.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v3 3/3] clk: npcm8xx: add clock controller
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 12 Sep 2024 13:02:00 +0930
In-Reply-To: <CAP6Zq1hO-fZMvG1sHJGVzF-JCwVwqrMtBGSCAHtVOYjeR1PfBg@mail.gmail.com>
References: <20240827133501.3451302-1-tmaimon77@gmail.com>
	 <20240827133501.3451302-4-tmaimon77@gmail.com>
	 <7b9f4c904b3a6e8775726c071f7fb4831854f352.camel@codeconstruct.com.au>
	 <CAP6Zq1jS6v3UF8D=Knq5rarnbQOAZBgHbOeu2VZe_kvApVFinw@mail.gmail.com>
	 <CAP6Zq1hO-fZMvG1sHJGVzF-JCwVwqrMtBGSCAHtVOYjeR1PfBg@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-08-29 at 11:09 +0300, Tomer Maimon wrote:
> Hi Andrew,
>=20
> the clock maintainer has approved the driver in V3 :-)
>=20
> So I think we are good to go.

Yep. I'll backport the changes straight from upstream, unless I
discover any issues in the process.

Andrew
