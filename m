Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D2994556B
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2024 02:34:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jlFjof7/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZn0K4kWKz3dWQ
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2024 10:34:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jlFjof7/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZmzp4pw5z3d9g
	for <openbmc@lists.ozlabs.org>; Fri,  2 Aug 2024 10:34:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722558852;
	bh=6zlX7VG3An/f9geZnTaa8WoGVtLNiqlJy5MH1bkIV3E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jlFjof7/ybzB74dML4poRoA08KGCrq/Sj18c2+MtQ0bMztisZrqLS5+wZIq1z4TFY
	 2vuO1kwTsCY5RuhrU9NNWsxiPGAGf5L5JqnELXYsKRNsM7g3f9mvf+qfGDwCHc7IzZ
	 7hqo1+8+uHr1LiSQccaxmIAfVyDPt8KEgEz4hHyAlGRAfSdtlx5P1gueQqsxFxXKQS
	 iin6ap8g43dQeyFAbL0GqpHgGdIN7txkDigeX1sg3UY6jidl7U+q2WYP9xuAGq32AT
	 HclQWbGcy2/QFwFbP+4+HS0W+YhzBsV/4Kh/s4bpJUz71ONGwIg37w1lYw42tQBvKG
	 UzfUQL2+TuFsA==
Received: from [192.168.68.112] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B5C4264B84;
	Fri,  2 Aug 2024 08:34:10 +0800 (AWST)
Message-ID: <7561fad7f0dc27543c467715b2537eeb16a9a8f9.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v1 0/2] Add Nuvoton NPCM845 i3c master driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Stanley Chu <stanley.chuys@gmail.com>, openbmc@lists.ozlabs.org
Date: Fri, 02 Aug 2024 10:04:08 +0930
In-Reply-To: <9bfb41d03105dde846fa7fa9a1b6feba1ab53c43.camel@codeconstruct.com.au>
References: <20240730062122.3781121-1-yschu@nuvoton.com>
	 <9bfb41d03105dde846fa7fa9a1b6feba1ab53c43.camel@codeconstruct.com.au>
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
Cc: kwliu@nuvoton.com, yschu@nuvoton.com, joel@jms.id.au, tomer.maimon@nuvoton.com, cpchiang1@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2024-07-31 at 14:44 +0930, Andrew Jeffery wrote:
> On Tue, 2024-07-30 at 14:21 +0800, Stanley Chu wrote:
> > This patchset adds i3c master support for the Nuvoton
> > Arbel NPCM8XX Board Management controller (BMC) SoC family.
> >=20
> > The Nuvoton npcm845 i3c controller implements I3C master functionality
> > as defined in the MIPI Alliance Specification for I3C, Version 1.0.
> >=20
> > The npcm845 i3c master driver is based on svc i3c master driver and
> > add platform specific support for the npcm845 hardware.
> >=20
> > This patchset was tested on the Arbel NPCM8XX evaluation board.
> >=20
> > We will contribute this patchset to torvalds upstream soon.
>=20
> Please reply here with the appropriate lore[1] link once you've sent
> the equivalent patches upstream. When you've done so, I'll look to
> apply these patches to the OpenBMC tree based on the feedback, along
> with the OpenBMC-Staging-Count tag.

Based on the feedback from the thread at [1], I'd prefer to wait until
you've got an Acked-by or Reviewed-by on from the DT maintainers on the
binding.

The driver is less concerning so I think it will be okay to apply that
and do some fixups later, but the binding issues need to be sorted
first.

Andrew

[1]: https://lore.kernel.org/lkml/20240801071946.43266-1-yschu@nuvoton.com/

