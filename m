Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A609C6C55
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2024 11:04:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpJmb5H8nz3bWq
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2024 21:04:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731492277;
	cv=none; b=YjwwkcQaBwXS+5T2+fkRBv0kxHOrN+MW2msWFwlFSYgpn/bkZUKV/Uc2LZ+Scky4n52jVDfN0sKqPiRThQbEJR4Nw6XsgW/xyPisE4GQ79n5Q745RZZRWq+4y0oIpi2A2l3yT4Qev86JPuL+plSsS8ezU/j/cTcbcYnFgOqDDIi5vFiQYrIxjDLGyvA2h61O/Ab6NB0mt5L3GO3VOhHtfnHU7yssmpVcKRlc8NH0ZfXAqbu1ZwH7Bl4QxGY8XWSo3+Iway/caLK7kDCjlhrkRr3JRECn2JS+KIxbP0oveJCZNZa5+gucVY6wAx54OFgYfAy7iEj7YNkmnibkEWg0Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731492277; c=relaxed/relaxed;
	bh=KihtNbifDm6WbD0d3qZBWnRWMaUKN4RzGEp0IW3rza8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TrvdRl12RfxkqNjfsFUZmldniK+Q2jp+VvqELugaXdyKuc1+R7RlhvEOvUjPis+y1LJIX3/ILZ6b7j1wvKKAoLfmRuLcC+IhH5dDhUUe5boYqoZF28ubpBczYCsrr4E5MEcIU1Ucl/fg3Trd+DY2aaaws0VkHfqPlLuDehUIgsAiJBhjrV6qw/KhvQyt+1gwcjtr1psjGiNLZcQXS8MZFeNHXekwwWGXnIACBFdOaeipRcWzYxy0eSeA/tuHPvlT4GC+RfXk87iC7Ud+Vnwhh/fdtDUtMUZo1axHCWe1gxSi/sJ6WfkpUqhw72wZwObY0wMkV5T+wu0KxOd0Rh2Y5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpJmM4v8gz2yWK
	for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2024 21:04:33 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tBAE9-0007LF-0u; Wed, 13 Nov 2024 11:03:57 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tBAE4-000YV1-2h;
	Wed, 13 Nov 2024 11:03:52 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tBAE4-000387-2O;
	Wed, 13 Nov 2024 11:03:52 +0100
Message-ID: <6d8a0d8916e185090423d42217262450ee948088.camel@pengutronix.de>
Subject: Re: [PATCH v15 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>, "brendan.higgins@linux.dev"
	 <brendan.higgins@linux.dev>, "benh@kernel.crashing.org"
	 <benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>, 
	"andi.shyti@kernel.org"
	 <andi.shyti@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org"
	 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"andrew@codeconstruct.com.au"
	 <andrew@codeconstruct.com.au>, "andriy.shevchenko@linux.intel.com"
	 <andriy.shevchenko@linux.intel.com>, "linux-i2c@vger.kernel.org"
	 <linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Wed, 13 Nov 2024 11:03:52 +0100
In-Reply-To: <OS8PR06MB7541739C4D1E69C0981CBCB4F25A2@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20241007035235.2254138-1-ryan_chen@aspeedtech.com>
	 <20241007035235.2254138-3-ryan_chen@aspeedtech.com>
	 <6aea003a286162c465d0ee7681988b3697feb103.camel@pengutronix.de>
	 <OS8PR06MB7541739C4D1E69C0981CBCB4F25A2@OS8PR06MB7541.apcprd06.prod.outlook.com>
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

On Mi, 2024-11-13 at 07:43 +0000, Ryan Chen wrote:
> > Subject: Re: [PATCH v15 2/3] i2c: aspeed: support AST2600 i2c new
> > register
> > mode driver
> >=20
> > On Mo, 2024-10-07 at 11:52 +0800, Ryan Chen wrote:
> > > Add i2c new register mode driver to support AST2600 i2c new
> > > register
> > > mode. AST2600 i2c controller have legacy and new register mode.
> > > The
> > > new register mode have global register support 4 base clock for
> > > scl
> > > clock selection, and new clock divider mode. The new register
> > > mode
> > > have separate register set to control i2c controller and target.
> > > This
> > > patch is for i2c controller mode driver.
> > >=20
> > > Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> > > ---
> > > =C2=A0drivers/i2c/busses/Kconfig       |   11 +
> > > =C2=A0drivers/i2c/busses/Makefile      |    1 +
> > > =C2=A0drivers/i2c/busses/i2c-ast2600.c | 1032
> > > ++++++++++++++++++++++++++++++
> > > =C2=A03 files changed, 1044 insertions(+)
> > > =C2=A0create mode 100644 drivers/i2c/busses/i2c-ast2600.c
> > >=20
> > [...]
> > > diff --git a/drivers/i2c/busses/i2c-ast2600.c
> > > b/drivers/i2c/busses/i2c-ast2600.c
> > > new file mode 100644
> > > index 000000000000..17ba0ee77c27
> > > --- /dev/null
> > > +++ b/drivers/i2c/busses/i2c-ast2600.c
> > > @@ -0,0 +1,1032 @@
> > [...]
> > > +static int ast2600_i2c_probe(struct platform_device *pdev) {
> > [...]
> > > +	i2c_bus->rst =3D devm_reset_control_get_shared(dev, NULL);
> > > +	if (IS_ERR(i2c_bus->rst))
> > > +		return dev_err_probe(dev, PTR_ERR(i2c_bus->rst),
> > > "Missing reset
> > > +ctrl\n");
> > > +
> > > +	reset_control_deassert(i2c_bus->rst);
> >=20
> > The shared reset should be asserted again in ast2600_i2c_remove().
> >=20
> Hello,
> It is share reset, if unbond driver and asserted the reset, it will
> affect others driver running (which is share with the same reset.)

Shared reset_control_deassert/assert are refcounted, like
clk_enable/disable, see [1]. The reset line will only be asserted when
the last driver calls reset_control_assert.

[1] https://docs.kernel.org/driver-api/reset.html#shared-and-exclusive-rese=
ts

regards
Philipp
