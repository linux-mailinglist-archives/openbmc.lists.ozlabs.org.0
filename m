Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC2B9A33E8
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2024 06:35:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVBj45GwPz3cRJ
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2024 15:35:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729226149;
	cv=none; b=Px+El3X4RiOjSu+WCXw7iJ7lGqPOMefYfkDcJFOlZymgXUHSVjNY1pgqOqpMfuItctVONrUKIjdpM/21/4oEaWej5RRYd010G9bJItiUPZpt0UyakYpYhaZY9PlglyM7pZr0untkZHDlEc0lAc23XeqOZ7ndHOm7M0Ju1C4CkyJpigoG0FHGWKa1V8bWVaXHBbPBvURZZAj12WGowCVJEC5Z23fA1bX4R3dBUdP4bMOFDUMDXSQcKbSm+zXpX/xPaSE3tlJzz36pDvHrkcKAiz1Ac1f43Kl7F+39s3BcwS0S4Q4OFEbUnE8nxjalN7OP9uR9QUO9nPkcO72xUHjZ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729226149; c=relaxed/relaxed;
	bh=NP6NRlGAEnQ5DtECIzxbpzRPTglwkI6hJiT85COeZ08=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T+DE957nGUdnPpBYVV/Z6GIBO/UF6wMrzmxMyA38+GwaRkBLcEiVINRExOGdiZBm1aNnK5eDCmKmoYtlSeCOMYWkPYbKZ9XZk5CNXa5fcxUWQtrwBF26xIGCu+e7+UBPAX34kRPYAhNbJq/iyP8bEkJP9dAPeXf2DOaN6mcCH7khN3+wBy6MONlkNf03RemsodHoLAhg9WNIWhFJcWSxvMXmuwKFhwZYIZ1VHUSd8iD3Wyopcxtw5BaAgRql0fF1pbpd1Ef2dLz7njRauppU909R/mAXL7oxXbMs3M8a0xb0lSUNmkuXJL6c0fWF5F1uBlw1rT2Z0y9HxiMOwHTYAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=b5zFpXEj; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=b5zFpXEj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVBj05Xl6z2yL0;
	Fri, 18 Oct 2024 15:35:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1729226148;
	bh=NP6NRlGAEnQ5DtECIzxbpzRPTglwkI6hJiT85COeZ08=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=b5zFpXEjm4MUZAcbjgBPLYTCResrTNytMosa0d77qnI+oRFx4+Lx/Fbqp+I1PdGMy
	 WkCK+ulvFt6yvnspwxFkm8q++0f/A4VQJ6XJfs75LXG4Jl8T9+FQ/eVzgRGbBQdaDa
	 vm4s4i6LjuTEWH4LkOFp98t4IygoiaCXjFXL0StvJEGW+48QTVKnvlfl53agABsUck
	 Roo1uKq7MM+qrYCRJ75Rbdu8rHELyMIjpF6iwFjlfcTWJEc0WVweC/UT35ucuNxUbB
	 cFtofEqrt+NEL0wqn+xF39N0Qz4VSV5ZkaI4RA/Rhr7C6/ldTkDoICzEsGluod8tGR
	 Ip2jyKQFt5yOA==
Received: from [192.168.68.112] (203-173-0-39.dyn.iinet.net.au [203.173.0.39])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 243FE681B1;
	Fri, 18 Oct 2024 12:35:47 +0800 (AWST)
Message-ID: <0361287ca986cb6101fae2b269b2fe14eea84158.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Jefferson BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>, Chanh Nguyen
	 <chanh@os.amperecomputing.com>
Date: Fri, 18 Oct 2024 15:05:46 +1030
In-Reply-To: <b16b82d7-60e1-428d-bc7a-8a236ebb98ca@amperemail.onmicrosoft.com>
References: <20241014105031.1963079-1-chanh@os.amperecomputing.com>
	 <172891445289.1127319.4114892374425336022.robh@kernel.org>
	 <b5919d904c9f06a618a54d49bc895c3081a511e4.camel@codeconstruct.com.au>
	 <e8e31fb4-4a9f-4ea9-be4d-9ba29d824cc5@amperemail.onmicrosoft.com>
	 <7555c528c90e6151f54d0e17c278527f95fac184.camel@codeconstruct.com.au>
	 <c42be4ea-9902-4fac-8b1e-afc38fe04bad@amperemail.onmicrosoft.com>
	 <f833ef3b873d0e71581dd138f046b19fa3fdeaf2.camel@codeconstruct.com.au>
	 <b16b82d7-60e1-428d-bc7a-8a236ebb98ca@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Khanh Pham <khpham@amperecomputing.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-10-17 at 17:02 +0700, Chanh Nguyen wrote:
>=20
> On 17/10/2024 07:08, Andrew Jeffery wrote:
> > [EXTERNAL EMAIL NOTICE: This email originated from an external sender. =
Please be mindful of safe email handling and proprietary information protec=
tion practices.]
> >=20
> >=20
> > Hi Chanh,
> >=20
> > On Wed, 2024-10-16 at 17:26 +0700, Chanh Nguyen wrote:
> > >=20
> > > On 16/10/2024 12:07, Andrew Jeffery wrote:
> > > > You can also find discussions where other maintainers (Guenter, hwm=
on
> > > > maintainer; Krzysztof, devicetree maintainer) have asked that "pmbu=
s"
> > > > not be used as a compatible:
> > > >=20
> > > > https://lore.kernel.org/all/f76798ea-6edd-4888-8057-c09aaed88f25@ro=
eck-us.net/
> > > >=20
> > >=20
> > > Hi Andrew,
> > > I checked the discussion at
> > > https://lore.kernel.org/all/f76798ea-6edd-4888-8057-c09aaed88f25@roec=
k-us.net/
> > > . It seems the maintainers don't want to use the "pmbus" compatible f=
or
> > > specific devices. The maintaners require an explicitly compatible fro=
m
> > > device list in drivers/hwmon/pmbus/pmbus.c .
> > >=20
> >=20
> > There are two problems:
> >=20
> > 1. Describing your _hardware_ (not drivers) in the devicetree
> > 2. Binding a driver to your device
> >=20
> > You ultimately care about both 1 and 2 as you want Linux to do
> > something useful with the device, but for the purpose of this patch
> > adding the devicetree, 1 is what matters and 2 is not really a part of
> > the considerations.
> >=20
> > What needs to be the case is that the devicetree describes the device
> > via an appropriate compatible string for the device (manufacturer and
> > part number). Prior to that, the compatible string for the device needs
> > to be documented in a devicetree binding. This may be the trivial-
> > devices binding if there are no extra properties that need to be
> > described, or you may need to write your own binding document for the
> > device if it's more complex and one doesn't yet exist.
> >=20
> > So whatever is in pmbus.c needs to be fixed later on if your device is
> > not yet supported by it, but that's a separate problem (2) to the
> > problem you have here (1).
> >=20
> > Who is the manufacturer and what is the part number?
> >=20
> >=20
> > Andrew
>=20
> Thank Andrew for your explanation! I'm so happy to receive comments from=
=20
> you.
>=20
> I'll remove the PSU node with "pmbus" compatible in the patch v2. We'll=
=20
> discuss more to have a suitable PSU node later.
>=20
> I'm preparing the patch v2. Summary, I need to update as the below list.
> 1. Add Mt. Jefferson board compatible binding as Krzysztof pointed.
> 2. Remove the PSU node with "pmbus" compatible.

Sounds good. Thanks.

>=20
> If you have any other comments on patch v1 please don't hesitate to=20
> point out; I'll update that in patch v2.

I had one query on v1.

Andrew

