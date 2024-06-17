Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D1190A6E7
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2024 09:21:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=TbMb/VLB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2hCG1qjLz3fqF
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2024 17:21:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=TbMb/VLB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2hBZ0bpmz3fm1;
	Mon, 17 Jun 2024 17:21:09 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 70DCB2014A;
	Mon, 17 Jun 2024 15:21:03 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718608866;
	bh=4O1Yg19zvG/1BCea2tUlqBSAUzPuV9/WXaIGbdGrvU4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TbMb/VLBPIZdVWKQv6Pq9BqQTf63/B5/EwG7UiyQeT6z/FyqQMMCXEuD6jHztfmnI
	 hRM+73HNO1WNHiqbdoqNEQs7f4IRbdIG85AVhD2gwl1YFcMixfCAvZeRTT3DeFZulV
	 8JWH+T80+ubT0cmjz6FGC6QhdVYi27VhGNjICtzcp/R2kTY/Rgwm6Ox0qEiHejcpT7
	 ebC52k8USG+7lwkrqjB9zoSpyL9nIitIcPRaB4ZbfEQmBCqhsikgkQhAGtxsvSe/Eh
	 tE0u7IfUr34rKVJ9CehcdC0bP/M4Wg7euA2bQVZe8hjRD2V2jXbN7abOkzU31PeYDK
	 YUC3YIpy0DMBw==
Message-ID: <5bf8e1dddd2b958a102e7b1b9f9c080a34f9deff.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: aspeed: Use block syntax for
 function and groups
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 16:51:00 +0930
In-Reply-To: <0908995dfd2181e687181bd1b075c4cb27624e94.camel@codeconstruct.com.au>
References: 	<20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
	 <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-1-a6fe2281a1b8@codeconstruct.com.au>
	 <20240604192755.GA1065421-robh@kernel.org>
	 <0908995dfd2181e687181bd1b075c4cb27624e94.camel@codeconstruct.com.au>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Linus,

On Wed, 2024-06-05 at 10:17 +0930, Andrew Jeffery wrote:
> On Tue, 2024-06-04 at 14:27 -0500, Rob Herring wrote:
> > On Fri, May 31, 2024 at 12:32:47PM +0930, Andrew Jeffery wrote:
> > > The expansion makes the documents a lot longer, but it's easier to
> > > review changes to functions and groups when we're not having to deal
> > > with line wrapping.
> >=20
> > Do you really expect to be updating this frequently? I would leave it=
=20
> > as-is, but whatever you decide.
>=20
> I don't expect to be updating it frequently. However it's happened
> occasionally in the past and the diff chaos irks me. So I prefer we
> explode it.
>=20
> >=20
> > > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > > ---
> >=20
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
>=20
> Thanks.
>=20

Are you okay to apply these (I see they're not yet in linux-pinctrl.git
for-next)? Turns out there's another concern lurking in the AST2600
RMII pin groups[1], and it would be nice if we could rework the patch
for that on top of this series.

[1]: https://lore.kernel.org/linux-gpio/20240613080725.2531580-1-potin.lai.=
pt@gmail.com/

Andrew
