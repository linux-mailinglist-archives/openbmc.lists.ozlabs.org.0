Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A24A94744E
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 06:18:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=L4sz/xw7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wcjq821Jwz3cXV
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 14:18:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=L4sz/xw7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wcjpf4ts1z2yvh
	for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2024 14:18:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722831482;
	bh=k+Tq1TcqFXL0NQgDdisZa+ugn8dqVTZ218PEMDmMT68=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=L4sz/xw7GOhe5WJra5fOFsHz2JfK7kGNitnCGIKqaRTnx/PhTyhxT2JGI62+cKoJR
	 G2ywOIcD5cv+pbxKjUzyvGYY23ZX5muLFg5KKV4GsZPUx1xqclbBm7gDDA/zVXP78S
	 f11Lpeif2OBYf6oQvo3LwgCs1J3aw66zoDk7Lb/LUrTtX+qqcoVHJbP6VPGXjvBJEN
	 X7xJOlKiz8gMuxyeG+Ikk8iMxMBUtrIlD/3kYhqF0l60LkE3tfxnnHsAbgsTmBCrWo
	 +drAe6wRNU7o6D1BvikXc9ET+0NLuuKy7kK1dxy/pCcXs5O8KixDNGqXDVL+yfB1Fl
	 HmF2+VGte8w+g==
Received: from [192.168.68.112] (ppp14-2-105-65.adl-apt-pir-bras32.tpg.internode.on.net [14.2.105.65])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BD38465665;
	Mon,  5 Aug 2024 12:18:01 +0800 (AWST)
Message-ID: <6bb592d634fb842861db3efc4138b53b4c7e0ae1.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 v2 1/1] ARM: dts: aspeed: system1: IBM
 System1 BMC update
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au, eajames@linux.ibm.com
Date: Mon, 05 Aug 2024 13:48:01 +0930
In-Reply-To: <20240801143004.993503-2-ninad@linux.ibm.com>
References: <20240801143004.993503-1-ninad@linux.ibm.com>
	 <20240801143004.993503-2-ninad@linux.ibm.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-08-01 at 09:30 -0500, Ninad Palsule wrote:
> Updated MAX31785a pmbus based fans in the device tree.
>=20
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)

I've applied this, not because I think it's a good idea, but because
it's something the OpenBMC tree already supports. If that weren't the
case then I would require that you work with upstream on the bindings
as usual.

That said, please now do that work with upstream to get a sensible
binding together. The less difference we have from upstream the better.

Thanks,

Andrew

PS: In the future, can you please try to be more descriptive in your
patch subject than "IBM System1 BMC update"? At the very least I would
like it to say something about fan configuration in this instance.
