Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F149B69EC5C
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 02:30:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLzBS55QQz3bgn
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 12:30:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LaMXyIwe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LaMXyIwe;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLz9m3qXYz3bfK;
	Wed, 22 Feb 2023 12:30:20 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 56D4620037;
	Wed, 22 Feb 2023 09:30:15 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1677029417;
	bh=dKZoLqo3DWoAawVA6U++xyewr4VS6v9UTkeXqOdFT80=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=LaMXyIwenqXd2NJpLNx0MJWu44XaaWS+XoUVQz1QhWfj6xROwysPYi4xLGrQNIf/8
	 3vMdoH/XGf9BY2b37v5F1QSMq0cOaM/bRejMzgxCBWb+EpSqp3qrsUAIBSoOz2ekzq
	 afvd5hPg4g2SVmF5w8+dnhmkD1NRVTkFb8LARY9UlHW/Bld2O+r5NReLqZ3jcQyKV6
	 HvUuqLCN+/WPxMcvoEsirCy6QG5UmLNor+K4ZgH0IpmSaJTWCl+6aqq8qpL7mnlgXK
	 vW7ZmjerwzWwIFBVlswQLy7YN6BqYtRYWa/FXjmk15FM/qCRtgbwGHVEx++XRWMHyZ
	 hweZA1/lDrgsQ==
Message-ID: <d5d0bbdbfdce06a6e2ad34f2fa8f27d4eaf36207.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,  Philipp Zabel
 <p.zabel@pengutronix.de>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>,  "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Wed, 22 Feb 2023 09:30:14 +0800
In-Reply-To: <TYZPR06MB527469EBE6A18B897D2C1F6CF2A59@TYZPR06MB5274.apcprd06.prod.outlook.com>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
	 <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
	 <2141e513acc750bf26775f5b435f4dccd41244aa.camel@codeconstruct.com.au>
	 <TYZPR06MB5274714E58C319B4FE3B6E1BF2A49@TYZPR06MB5274.apcprd06.prod.outlook.com>
	 <dfc2c2c442af55f64e147c920585cb7e6a74939f.camel@codeconstruct.com.au>
	 <TYZPR06MB527469EBE6A18B897D2C1F6CF2A59@TYZPR06MB5274.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ryan,

> > On the other hand, if it's just because of OS behaviour, then this
> > doesn't belong
> > in the DT.
> >=20
> > Maybe to help us understand: why would you ever *not* want DMA
> > mode?
> > Isn't that always preferable?
> In AST SOC i2c design is 16 i2c bus share one dma engine.=20

Does this mean that only one i2c controller in the system can be
configured to use DMA? Or is it able to be shared between multiple
controllers?

> It can be switch setting by dts setting. Otherwise driver by default
> probe is DMA mode.

You've explained what the modes do, and how they're switched, and what
the default is. However this doesn't explain *why* someone would want
to choose a particular mode when creating a controller node.

Still with the question above: assuming there are no restrictions on
DMA usage, why wouldn't a driver implementation just enable it always?

Cheers,


Jeremy
