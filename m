Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 906DF8809D5
	for <lists+openbmc@lfdr.de>; Wed, 20 Mar 2024 03:46:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=LyzUosUW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TztK42gXnz3cCr
	for <lists+openbmc@lfdr.de>; Wed, 20 Mar 2024 13:46:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=LyzUosUW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzRy80Q3cz3cVv;
	Tue, 19 Mar 2024 20:58:55 +1100 (AEDT)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 482DBC3985;
	Tue, 19 Mar 2024 09:53:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3CB1FF80D;
	Tue, 19 Mar 2024 09:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710841993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EBDDiNG/eNmY+ueIncptOoRVdMb4em3Z5Wr8wvDjWc=;
	b=LyzUosUWbZmhrAA4qvwA0ojyg9rDBL6yH+R73/Cl/AGOQYhPpeDYpbVg1jJWu+O1/a6MiY
	GBtEWVlXLRdBYAfeMbmpOHGLpgAKW+VDmM+X3OTurys03prNWASCLdD7QloxLQT5lWKEcK
	Jwor7i4jxb3XKQjqvKriBWQQpRtMnJVJicefmt3ecDm2AlHMHsSaMVfI95oAdTr03N/yRg
	+qp5UgKZGXIpdlewjym3wvEOhprR6T9pCv9wPgYXSxkC5i1o17+vt8Cbj0CF15sCTGTSpK
	SRTtIkMjzAFEMh75v0eGJSLFpvSufCkkMYqFgr3oJdm08AfYkBdvYQMPZiXCvw==
Date: Tue, 19 Mar 2024 10:53:09 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/4] mtd: Replace module_init with subsys_initcall
Message-ID: <20240319105309.7cdfe106@xps-13>
In-Reply-To: <4e3fbff7-6edc-4196-bc72-1095f14d0dfa@linaro.org>
References: <20240319093405.39833-1-manojkiran.eda@gmail.com>
	<20240319093405.39833-3-manojkiran.eda@gmail.com>
	<4e3fbff7-6edc-4196-bc72-1095f14d0dfa@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:46:22 +1100
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com, vigneshr@ti.com, linux-aspeed@lists.ozlabs.org, richard@nod.at, chiawei_wang@aspeedtech.com, linux-kernel@vger.kernel.org, joel@jms.id.au, robh+dt@kernel.org, linux-mtd@lists.infradead.org, patrick.rudolph@9elements.com, krzysztof.kozlowski+dt@linaro.org, jk@codeconstruct.com.au, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Manojkiran Eda <manojkiran.eda@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

krzysztof.kozlowski@linaro.org wrote on Tue, 19 Mar 2024 10:51:00 +0100:

> On 19/03/2024 10:34, Manojkiran Eda wrote:
> > While engaged in development on the espi kernel device driver[1],
> > I noticed that the espi flash driver, utilizing the mtd subsystem,
> > appears to initialize before the mtdcore subsystem registers the =20
>=20
> NAK
>=20
> You incorrectly ordered your call, so now to fix this you incorrectly
> re-order rest of kernel. No. Fix your code to handle modules, probe
> deferrals and device links.

Agreed. You shall not need this. Maybe just moving the driver to the
right location (spi) might fix it.

Thanks,
Miqu=C3=A8l
