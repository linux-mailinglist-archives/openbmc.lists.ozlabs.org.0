Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 909ECA417E0
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 09:55:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1ZLp0nWZz3c1Q
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 19:55:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740387310;
	cv=none; b=IIx4OzE6Soi1Al3lvWsvA/8vAm3Iywklz56GNvIp1tDts+ZKUojH93JCqM2z8ygWjSGRTvFMZoGMgFRVSfuFc/SWbV9o7t5ln1K8TNhDmvjNbXeXV9S/L18gDA49yd5P3tP2NyVwz2VAdp2LUVhpVPDkPU+qEViH8ri6QjTCaDpbYtcIo9/0NbOTE5xWp20VeiWp8/sAOF7XzdAbRF/qVh7mRJeLxOn6xj+5neTk1MUAMuu5w8lhaisnYNVqXCrGS3BXE1jpo22F35mTM6GUZ/gthH06DmBhmSluYml3qL7dV0VR7BtcVjO2ToNLcUahxovmNeJY4mChYkc9YIZzqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740387310; c=relaxed/relaxed;
	bh=coQpN1nKHgGKkMTUN+sI75uFyqPjk4mGdjVG4PGQWys=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AKrJvj0BCfAls1DcXTzP3s73ZgOqoh3pL+FyCI4X3P/xYfn1jT8ITdVETa7gs7RO12zMh3O5n72c1r1uGt09B3/wIyr1v09sGSvx9W8qb0bdyj8Ico4MIPfWrF05DDao8ePArp3GwfVZXfNC5BtcN+eUqxJidrQ1uiNRD7ufRqL0cj3d3qCGWBdaAUfHiLpO0DxPh3v1hapLrPaDPzhfC/zGOtcRqazDk4R3zjCo0wohduVOSKTfz7d5N9hjhgUtVJKgM+0l5U/+YQQVEB/USYOYDyAGH5CQ8Jt9uzDNTh4bvw/pcN9ipkI3dh/JMhetSX33ajAfo8sQVPllwqOBoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1ZLj4S4Bz300g
	for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2025 19:55:08 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmUEV-00031V-Cf; Mon, 24 Feb 2025 09:54:35 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmUES-002Yzx-16;
	Mon, 24 Feb 2025 09:54:32 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmUEN-000201-0o;
	Mon, 24 Feb 2025 09:54:27 +0100
Message-ID: <ee0f5b583aadb42e7557e1afc49c5b9af594d2c3.camel@pengutronix.de>
Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>, benh@kernel.crashing.org, 
 joel@jms.id.au, andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
  conor+dt@kernel.org, andrew@codeconstruct.com.au, 
 andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org, 
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 24 Feb 2025 09:54:27 +0100
In-Reply-To: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
	 <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
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

On Mo, 2025-02-24 at 13:59 +0800, Ryan Chen wrote:
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
>  drivers/i2c/busses/i2c-ast2600.c | 1036 ++++++++++++++++++++++++++++++
>  3 files changed, 1048 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-ast2600.c
>=20
[...]
> diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-as=
t2600.c
> new file mode 100644
> index 000000000000..bfac507693dd
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ast2600.c
> @@ -0,0 +1,1036 @@
[...]
> +static int ast2600_i2c_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct ast2600_i2c_bus *i2c_bus;
> +	struct resource *res;
> +	u32 global_ctrl;
> +	int ret;
> +
> +	i2c_bus =3D devm_kzalloc(dev, sizeof(*i2c_bus), GFP_KERNEL);
> +	if (!i2c_bus)
> +		return -ENOMEM;
> +
> +	i2c_bus->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(i2c_bus->reg_base))
> +		return PTR_ERR(i2c_bus->reg_base);
> +
> +	i2c_bus->rst =3D devm_reset_control_get_shared(dev, NULL);
> +	if (IS_ERR(i2c_bus->rst))
> +		return dev_err_probe(dev, PTR_ERR(i2c_bus->rst), "Missing reset ctrl\n=
");
> +
> +	reset_control_deassert(i2c_bus->rst);

No reset_control_assert() in the error paths below? You could get that
and simplify this by using devm_reset_control_get_shared_deasserted().

regards
Philipp
