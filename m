Return-Path: <openbmc+bounces-697-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA9BBAF032
	for <lists+openbmc@lfdr.de>; Wed, 01 Oct 2025 04:35:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cbzYr27cDz306S;
	Wed,  1 Oct 2025 12:35:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759286144;
	cv=none; b=jjKcKaL7PnKRaaOVj9k8BGZbdwq8MQWt5kZs/3VKQr0NvTjVPaa2IrSLtwwG4W468K9bAtUDXoLXwnNWIuNG3qzXalcJWxX0u3rnbi37m69XLUv/7RrdhzIJZgg4kU3ENFs1dEWnmbFc2mTWrxhys2BydWz4eaJELKcMIKvGa1S4F/Z2xrFOiLFX2OOkJ1UehQcir3Oimp89WQ7Fo2OlpyM9usddx7wwEN/8fwAaxBmMKO8fyNKbFAkRaYEmWtvtUq9R0hI4v4c5zhhUrdKGbE6AkVNK6mD1w4iOpbqLBZ556Ho3t/fTLx9E44Va2u4CwvVoTLOc02Euih5dTzEeRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759286144; c=relaxed/relaxed;
	bh=K9fCsMOCdUbvRNo/t+o2bC2PyvUlczEgu2UBaPD1egI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vub/Aro65xCmzoWE7B+KMiqNOc5OVbYmtPJFDvOiCo0ZWLyMxYzXnzoLqKY02cGqJzyhhm4vCI8QlFG5s5hVbAhOsv2jQf8cmBBEGpp9QAikBOoxwQMsX4rSg1tloXDOEFExATynPnE9QhOIWDQwsZm1Ng2DJFvimQI/tMjh6mb3lbbXGdikgGa8HVhhGYn4MrCt3N59v0Hnv9m9gTRpCEsv+ri0iWF9GLhZeEYf6DiWvFJvOvI8FuCIc+y0e4T9oIRRFqeP9bTY8uzxic1gswRzlmZMEP5haqRkhhW1Ei7TSXGoqeCGPnxn3g7iriLFjUBN3jBqh5JG/2UroWT2GQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BZS10cwL; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BZS10cwL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cbzYq61bHz2yN1
	for <openbmc@lists.ozlabs.org>; Wed,  1 Oct 2025 12:35:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1759286143;
	bh=K9fCsMOCdUbvRNo/t+o2bC2PyvUlczEgu2UBaPD1egI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BZS10cwLGFLV5nsN0uVkLFHIq48Oo2il5WbyDSJvHm3dHPjdTV8wixUYy5gUITgc0
	 Jyx8eIPnhDSPxODugl67iAIXBGYrAnuuNV0m8yiiz/+klC2aHN4/PzO4YJ4yEzUWsF
	 xhEVltPYvy9tosuvwWUrB8rKBgJpe90p7deCnbFp+a40msHMA6uyxPB3EVctuJwO6E
	 3wGaeCNu5f4IgFDQ2/M6MAC53VQUcmGn6XchruaP2BRoaOvcBulzpYnRPTD362gqYB
	 IzkD40nZKAx/QBIIFJXTNmOReFZUB5cOSvX45trBXVN6NzJPDVrJIwISBEVZCmtCXb
	 GGLBCpTvd9RyA==
Received: from [IPv6:2405:6e00:243e:cd99:1d87:95e3:706d:5dc7] (unknown [120.20.48.42])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 49F6F749D1;
	Wed,  1 Oct 2025 10:35:40 +0800 (AWST)
Message-ID: <045c7bcd3a852e626f11e5b78c07939feac0e298.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 0/3] arm64: dts: nuvoton: add NPCM845 SoC and EVB
 support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, venture@google.com, yuenn@google.com, 
	openbmc@lists.ozlabs.org, benjaminfair@google.com, joel@jms.id.au, 
	krzk+dt@kernel.org, tali.perry1@gmail.com, conor+dt@kernel.org, 
	avifishman70@gmail.com
Date: Wed, 01 Oct 2025 12:05:38 +0930
In-Reply-To: <CAP6Zq1jmmhqYu3C7KHFK2tz9zjW352Bbw4cXeOYSjNSTELrp5Q@mail.gmail.com>
References: <20250925200625.573902-1-tmaimon77@gmail.com>
	 <175890301752.880349.2331946518360447485.robh@kernel.org>
	 <CAP6Zq1jmmhqYu3C7KHFK2tz9zjW352Bbw4cXeOYSjNSTELrp5Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
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

On Mon, 2025-09-29 at 12:15 +0300, Tomer Maimon wrote:
> Hi Rob,
>=20
> Thanks for your comments
>=20
> Most of the warnings occur because the compatible strings are located
> in .txt device tree binding rather than in the .yaml file.
>=20
> The only change that needs to be done is in ti,tmp100 that
>=20
> Could you approve the patches, avoiding NPCM845 compatible warnings?
> Meanwhile, I will work on converting the txt to yaml

I think it's best we get the conversion done, and then subsequently
apply the apply this series. See:

https://docs.kernel.org/process/maintainer-soc.html#validating-devicetree-f=
iles

and

https://docs.kernel.org/process/maintainer-soc-clean-dts.html#strict-dts-dt=
-schema-and-dtc-compliance

Andrew

