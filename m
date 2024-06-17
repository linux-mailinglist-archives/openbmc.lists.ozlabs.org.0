Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC2F90A769
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2024 09:36:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=TikU2bPn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2hXX45fkz3fnV
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2024 17:36:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=TikU2bPn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2hX1399yz3cV1;
	Mon, 17 Jun 2024 17:36:17 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 242482014A;
	Mon, 17 Jun 2024 15:36:17 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718609777;
	bh=iOiT9XbaETPh/FvCvqtFzcLzSYCSL59RFQR96l/c+sY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TikU2bPnSvNMKifTDiW9nN2PW7diSyrEPF2VcwSk0Gc75oNTixqOtJue9r6SQp9YT
	 m/Ils3hmxFlKoIdOFroZMBwAFEL2B8hNR27a9Ma2I5lHcrnuKDfjLOWXok4Fn0OKhj
	 3bvcfXScHtyjk7h8Uf+vOZua7UMu/tQBI6uVzyca7G78KgmRZp38EyO89tYS9w9f8i
	 RCoAK/OVhGm1bga7v/ZjJCOSxpqjPw7JtaUOXCnmmLIiFEzTtdFi/bQ5ga+FfuQRA7
	 gfUWDjoHmvuDSYOLiq52zuuaXFa2xAWYpV+eaqe2RF6pTWDp1pNB10FWF9rAA55t99
	 GWufr9eYjWttg==
Message-ID: <28297cafdf748dd3e2da3e6b54012bf3c88a1be1.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] dt-bindings: pinctrl: aspeed: Define missing
 functions and groups
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 17:06:16 +0930
In-Reply-To: <CACRpkdanSAkR-czs=OUKLh6dpiRk0QDLR-T0ECrG-Y4cY9=Vmg@mail.gmail.com>
References: 	<20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
	 <CACRpkdanSAkR-czs=OUKLh6dpiRk0QDLR-T0ECrG-Y4cY9=Vmg@mail.gmail.com>
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

On Mon, 2024-06-17 at 09:34 +0200, Linus Walleij wrote:
> On Fri, May 31, 2024 at 5:03=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
>=20
> > This short series cleans up a collection of binding warnings concerning
> > use of undefined pinctrl functions and groups. Together they make a
> > reasonable dent in the volume of output from `make dtbs_check` for the
> > Aspeed devicetrees.
>=20
> All patches applied.
>=20
> Thanks Andrew!

That was quick! Thanks!

Andrew

