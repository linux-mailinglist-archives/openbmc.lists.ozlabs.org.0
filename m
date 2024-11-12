Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2045D9C5460
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2024 11:41:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnjdX08t8z3bdK
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2024 21:41:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731408093;
	cv=none; b=GVLKgTq0CWbhkepfSo4zbD7x7N7F0RRNcL8b6hYthKBGE4P9Go1AxrHGISPjZYKFQfdCK/p22czXFeo8rC5das0D3Q1aVpxLXWAiAI4lYbiSHEs22MypANKNXG7fCLH12IyvPK4EWMHpmPOc59clH/N5ITEG+nZRv+ob9QnK0Y3gOMq+VY7uBXY92STx1JYla5uBbghPHQ4+K1VD8u4RAVUrDtSNbYgmy/TEzcCARv8SyZ8kiB8u2YR87pDqARpjrsxADHjS7nN3cW8fJF3bKF8S7Dwvur/drzb3zej/Qux8lVuQKeQpS4lpbRSdjT8IORfITJRHHL6EowNUgLI/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731408093; c=relaxed/relaxed;
	bh=nbRCJ+o2wwLu4KX1zygm/y3IpVRBb3VVNeeUVG8b0Zw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tq0vZIDAQCNqvS1TwEYJb9/EwebNPR+/fJksZUGXHa49YnZdXcjIyDXDPd1E+clUcXl9xuLa5R6EQPnmUYAE0E/12l/KPHm458qnzHYWoXq14nZcvd2+HbSrYeFcSc9nukbsI2nmOh2JM92PMOz+Gtd3w4AJ7yTdiHbrzLeyPnpYnpTLJ3V5EdEeeCq2gkVaZ6eJ6W9XN2lYqrvqig/m+QYeuRj3+LsUmPmKZiJDNQyaUfUl+Zy0/E/K87O0pbWKHEs2isY1N0yvnQCmUJOGpTlNx96O4YSESJSCirs4AD3gh/qB1yO2ffFIDlwYeSyYzcRYk7IyJ6GVfxheLWgz+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1125 seconds by postgrey-1.37 at boromir; Tue, 12 Nov 2024 21:41:32 AEDT
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnjdS2dPvz2yLV
	for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2024 21:41:32 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tAo2G-0004IB-69; Tue, 12 Nov 2024 11:22:12 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tAo2C-000OVP-1A;
	Tue, 12 Nov 2024 11:22:08 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tAo2C-0004HE-0w;
	Tue, 12 Nov 2024 11:22:08 +0100
Message-ID: <6aea003a286162c465d0ee7681988b3697feb103.camel@pengutronix.de>
Subject: Re: [PATCH v15 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>, brendan.higgins@linux.dev, 
 benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org,
 robh@kernel.org,  krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew@codeconstruct.com.au,  andriy.shevchenko@linux.intel.com,
 linux-i2c@vger.kernel.org,  openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Tue, 12 Nov 2024 11:22:08 +0100
In-Reply-To: <20241007035235.2254138-3-ryan_chen@aspeedtech.com>
References: <20241007035235.2254138-1-ryan_chen@aspeedtech.com>
	 <20241007035235.2254138-3-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mo, 2024-10-07 at 11:52 +0800, Ryan Chen wrote:
> Add i2c new register mode driver to support AST2600 i2c
> new register mode. AST2600 i2c controller have legacy and
> new register mode. The new register mode have global register
> support 4 base clock for scl clock selection, and new clock
> divider mode. The new register mode have separate register
> set to control i2c controller and target. This patch is for i2c
> controller mode driver.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/i2c/busses/Kconfig       |   11 +
>  drivers/i2c/busses/Makefile      |    1 +
>  drivers/i2c/busses/i2c-ast2600.c | 1032 ++++++++++++++++++++++++++++++
>  3 files changed, 1044 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-ast2600.c
>=20
[...]
> diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-as=
t2600.c
> new file mode 100644
> index 000000000000..17ba0ee77c27
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ast2600.c
> @@ -0,0 +1,1032 @@
[...]
> +static int ast2600_i2c_probe(struct platform_device *pdev)
> +{
[...]
> +	i2c_bus->rst =3D devm_reset_control_get_shared(dev, NULL);
> +	if (IS_ERR(i2c_bus->rst))
> +		return dev_err_probe(dev, PTR_ERR(i2c_bus->rst), "Missing reset ctrl\n=
");
> +
> +	reset_control_deassert(i2c_bus->rst);

The shared reset should be asserted again in ast2600_i2c_remove().

regards
Philipp
