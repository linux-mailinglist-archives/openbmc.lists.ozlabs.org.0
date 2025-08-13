Return-Path: <openbmc+bounces-433-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC89B23D90
	for <lists+openbmc@lfdr.de>; Wed, 13 Aug 2025 03:03:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1qqy2MXmz2xHp;
	Wed, 13 Aug 2025 11:03:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755047006;
	cv=none; b=laj1xQUzNpj6vD9/JnbDQ5GXKnuhDNG2Rteifd7DQ/MaPoAHhWuHX1Z6i16VHRFvaB8xh22PvuP+kFEojdMFkz2lW1aKhqkOAie0qnF4djNWtY+CcwuYsT8bKgDDHB13/7W4+YW6TAXuQsWj2eVjlhRse/tSdAqTGeUii8ughAhZLcW81cbkqrrpUGOTimLwIxseErgSvRXc8CpQZsorq7IPfnf35QXpduoEkCl7VnN0FsB7x9KuPwGIlHp/hgR/BwSXOMPhWQ7kHr383CI3fsQ4JjeTcdiD83PTeuQ/+JEwHdHf5HAJrGi1FXKwy4XWM8Jgg6aSy6VvLm+F68lITw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755047006; c=relaxed/relaxed;
	bh=ubPx2kdzCVq5b3prRy0vDqzOBhzXRv4VrDUeDBVEQaM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kerl5obvfRjsgxvzhghGfpQaXogHodAnn944Rf5gfUb+f5eJm4yKjx+m96k7kHeFG/EXnMGDPyOOOyPd8DuVDbVCBNXBsx6j6+9hWt91x1qecZXD6LRtppldWc47j+zH5Edtfp1gBxbsNIIx3wBFG7zhHuamPTqB7zyIUoSlj0BU082Qme2ufsUFmpyLKIu5Phm/mJXQ2XoNtXgHOnqF3iR/YOArHE+peXBe3S29Qwcq1W/7dzqRsmy9gf6tSBk+GU8sAuHRxFq1pHNhJ0FVehTw9CP9lBBqtsWFo+agMg6qH9vNxeQ93XacUYdcWhinW/U3v6Cw4hWIf+GBJA3GbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=a5M/i6J1; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=a5M/i6J1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1qqx0JGYz2xHY
	for <openbmc@lists.ozlabs.org>; Wed, 13 Aug 2025 11:03:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1755047002;
	bh=ubPx2kdzCVq5b3prRy0vDqzOBhzXRv4VrDUeDBVEQaM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=a5M/i6J1Xt8rdPOFzvhuZ2KCICHkV5kHKUhIdvxosxZjV0BMNMqIa5SDxjhz/oeQu
	 87TwvLiohk5sT5K14L7lEERESr0vrE2Z+wjsCu0ctEmFLvj4EOCLECmSGpT1nym1mj
	 /SbPEEVA3eVibAJjv4I16No7M9xnpM1Sgx6aAknNLymSV6N9Zw3HkPuYaKEe1kaY8O
	 CRo2HeIs7m67rL7RSwVlY4dKpbXxf1j0lAWBsdBd7XKlpMtUAaEtPjp1/jIjH/gpFH
	 sHfDkyGtTx4JX0Bj4FP3ll6pi+peZs8bSi4fX/xxr7LQIg+DCwvsa4re+kR5iBcNRg
	 OmeY4M3fB39ug==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 259B26409F;
	Wed, 13 Aug 2025 09:03:21 +0800 (AWST)
Message-ID: <156939ddd94e07da334913c676973a7757311192.camel@codeconstruct.com.au>
Subject: Re: Proposed deprecation of device-tree-gpio-naming.md
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: openbmc <openbmc@lists.ozlabs.org>, Andrew Geissler
 <geissonator@gmail.com>
Date: Wed, 13 Aug 2025 10:33:20 +0930
In-Reply-To: <aJuuqQxqOeuBYhmg@heinlein>
References: 
	<eff663ee55f2614dde750f5f0669ec876f107c0d.camel@codeconstruct.com.au>
	 <aJuuqQxqOeuBYhmg@heinlein>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 2025-08-12 at 17:14 -0400, Patrick Williams wrote:
> On Wed, Aug 06, 2025 at 09:24:37AM +0930, Andrew Jeffery wrote:
>=20
> > Devicetrees represent the hardware, and from experience
> > over time I think it's best that they reflect the information from the
> > schematics without influence from software implementation choices.
>=20
> Can you elaborate on what this experience is?=C2=A0 I'm not sure what thi=
s is
> referring to or what issues you've observed with it.

- All devicetrees that get merged upstream, because I'm merging them,
- The bikeshedding that occurs when trying to update the document
- The lack of coverage in the design document that results in people
using net names regardless
- The avoidance of updating the document, by the existence of net names
in the submitted devicetrees
- That to name the GPIO you then have to consult some other piece of
documentation that isn't the schematic, whose existence you must first
be aware of, that may have little meaning to you otherwise

>=20
> If GPIO names were to reflect the "information from the schematics", I
> assume this is to mean the net-name?=C2=A0 Which net-name are we going to
> use?=C2=A0 The one on the DC-SCM, the one on the connector the DC-SCM is
> plugged into, etc.=C2=A0 There are probably, on average, 4 different name=
s
> from a source of a signal to the BMC.

Sure.

>=20
> You could of course say "whatever the person implementing the devicetree
> wants" for the pin name, but usually that's the least useful name to
> anyone else.=C2=A0 On top of that, schematics are often times closed and
> unavailable to more than a handful of people.=C2=A0
>=20

Contribution of reverse-engineered of boards is not something that
tends to happen frequently. I don't think we should weigh its
importance too highly here.

https://discord.com/channels/775381525260664832/775381525260664836/12881607=
38157924362

If the schematic is closed and broadly unavailable then perhaps the
document serves as a reasonable way to name things, but I'm not sure it
should take priority.

>  Having a devicetree named
> "power-sequence-start" is way better than "DC_SCM_GPIO_P7", right?=20

If you have enough information to confidently name the GPIO "power-
sequence-start" in the devicetree, where that isn't the net name, then
you have enough information to choose a net name that isn't
"DC_SCM_GPIO_P7". Pick the most useful net name? We can query this in
review.

>=20
> Sure, we can have this translation in entity-manager or wherever, if
> someone contributes the entity-manager config for their board.=C2=A0 But,
> that means it's only available to BMC code.=C2=A0 When I'm actively debug=
ging
> something, I have yet another hoop to jump through to go from
> "DC_SCM_GPIO_P7" to "this is the power sequence start".=C2=A0 If it is in=
 the
> device tree it shows up right in "gpioinfo".

Picking a more useful net name likely helps the cause there.

Andrew

