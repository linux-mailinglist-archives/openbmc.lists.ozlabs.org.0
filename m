Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 272128FC0EE
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 02:47:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=kP8qrqGF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv82B23Blz3bqP
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 10:47:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=kP8qrqGF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv81b4Fjbz2xb2;
	Wed,  5 Jun 2024 10:47:15 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DBD032009F;
	Wed,  5 Jun 2024 08:47:13 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717548435;
	bh=ANXb6zc3UuSOyX6FxuEvTkWNM9eC6npStLm/IruWE68=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kP8qrqGFDNRLThPf7QY2mccgHy7qaTo0F9H6onVvhw3Bll10+LvUt/xZHTaGwhRFd
	 FkCyVVh2EZ4k/nTG0FgLSkZhXqMDmNP81hUXuZWMN9qgiEL1724OhCIioAvYGBf5tJ
	 ol61Gx0duyW5kbktYsE/UQ2jdzS0KCKAJuFU9UyjqrBavlAV8K/CPUlkHCAo7zlG8L
	 DheyAK0GqUPhpqqQ0cO0BgVW7khE0vzcO2AEMiy4n4vrQiOvTA4TBaneVkkUlMJ8nc
	 nLriEZvSjEeUtCCUvFf/TWjsI4F3aXkYfNCOFlhve96arT+AcfBZJZkgS4PUKrAOGi
	 tOtafZ0wA/TqQ==
Message-ID: <0908995dfd2181e687181bd1b075c4cb27624e94.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: aspeed: Use block syntax for
 function and groups
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>
Date: Wed, 05 Jun 2024 10:17:13 +0930
In-Reply-To: <20240604192755.GA1065421-robh@kernel.org>
References: 	<20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
	 <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-1-a6fe2281a1b8@codeconstruct.com.au>
	 <20240604192755.GA1065421-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-06-04 at 14:27 -0500, Rob Herring wrote:
> On Fri, May 31, 2024 at 12:32:47PM +0930, Andrew Jeffery wrote:
> > The expansion makes the documents a lot longer, but it's easier to
> > review changes to functions and groups when we're not having to deal
> > with line wrapping.
>=20
> Do you really expect to be updating this frequently? I would leave it=20
> as-is, but whatever you decide.

I don't expect to be updating it frequently. However it's happened
occasionally in the past and the diff chaos irks me. So I prefer we
explode it.

>=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
>=20
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Thanks.

Andrew
