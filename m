Return-Path: <openbmc+bounces-794-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E7CC0518B
	for <lists+openbmc@lfdr.de>; Fri, 24 Oct 2025 10:40:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctGZK54NZz3bfQ;
	Fri, 24 Oct 2025 19:40:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761295241;
	cv=none; b=d21KFaZ1A3ZWAhe/xUfZ9tvSiMLDQGHnF5C9XAXFsRr9EWCUx50bWhFjY7L6y/7awMInzyt5kfewnYTYUL423UN5jAEwSIb5MBwZ0MQB9E9oMNKIHHEoTGS3ALax0B4CYv234OHE5p/OzeDyWp14Rrh9bYBXQSo4J9ix4eWzGTDBvV8y1XIsJ3HCIjcYA40rCe096k4H86ZUUWpv772LWazcXb172zDM67kVyq27DXP6NeS1yD7VNMrucu7/zCFyKajp65mqBtP6AzZyjHGX22W7+Wad57b+cELJSvLLAMvHj/BuMlOSzAKLNJoUSS67joRsUoVok+Z5T/8LpEdndA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761295241; c=relaxed/relaxed;
	bh=Wem404aV0t2DuNDE8zK+b4FQd+9biDbjtIJpBHo0aMM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FPl6MLO9EPcz4CV1HK1lK77hT9Itn7GuDXRSJCb/tQyeUavAMId2sRqZuJk/L3j39xWIo4h/ATri8o9AjQ8+CFwP3XcMdoIZ7w/STDScp1nLq6fzo1kkeB3GJe7fdvkMt9aepwdUsquz4+E7I5wUgZzzGE1y1F3pzVPvQZgiGKXocNgfNxSGwNDotK1I2Vbuhh1yJMEgJtap64gnI5+fuXsrUi6wckcXw3tXasMTESa28BqKmWvv5vf2Iebr7NpCr87cEKxByG97x9er53MDV/+QCMsb4/dnJ/YNEciDoOnhYSqLLxQP9MwZG1qnux0XWW3hTjJWjm+vw5l/oV889w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ctHyGqsv; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ctHyGqsv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctGZK0x3nz2yl2;
	Fri, 24 Oct 2025 19:40:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761295240;
	bh=Wem404aV0t2DuNDE8zK+b4FQd+9biDbjtIJpBHo0aMM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ctHyGqsvOYJRXH+CRvOB4EQgB2myWy+sZO7qcXv8RFGMv7dH/Fj1rE1hMKQ3/2asX
	 dznZtEj8rUzVAFUfkDGlJdkrxwpVjqqVIo/MDLcEXQ2TWUDM0643iNBIuphCjKW7oa
	 wuIhoShV671DebHHgJ3XSvHwkvGN8M2/YOG3zDL8H48oIG0A8t3NLjeSZNhj/XuVGy
	 OC4t7qGnJMJmGaxuR0gZUVTlS1ejQSnvd9IMcDLG9YBG8hPT2iWfjx0B8oNMmGweZf
	 ehNN1u8WGnbSlIwqCvAAyrgGJezPC76kXI924y6QdY7bsfYPQjIAzHLEgtxfl3y5Oi
	 bqxRfJYA2S4JA==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6DE8772F33;
	Fri, 24 Oct 2025 16:40:39 +0800 (AWST)
Message-ID: <7a650d60cabcbd33b65c954b0c9c5918dfcabb09.camel@codeconstruct.com.au>
Subject: Re: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
Cc: benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrew@codeconstruct.com.au, p.zabel@pengutronix.de, 
 andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Fri, 24 Oct 2025 16:40:39 +0800
In-Reply-To: <8341a903-639b-471a-8425-a98c473f5ab0@kernel.org>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
	 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
	 <20251024-dark-ringtail-of-defiance-1daabd@kuoka>
	 <2939cae6-2e8a-4528-8e27-8c932e2f82de@kernel.org>
	 <bf3d6690b9124ecf74df6c0f9f1c0f72ae1db9f7.camel@codeconstruct.com.au>
	 <8341a903-639b-471a-8425-a98c473f5ab0@kernel.org>
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

Hi Krzysztof,

> On 24/10/2025 09:56, Jeremy Kerr wrote:
> > Hi Krzysztof,
> >=20
> > > Although now I saw next patch, so clearly this commit is
> > > incomplete.
> >=20
> > The split that Ryan has done here - by shifting to an identical
> > separate
> > binding, then making the changes explicit - allows us to review the
> > actual changes without losing them in the move. Sounds like a
> > benefit to
> > me?
>=20
> Not related. I commented that rationale is incomplete. We do not move
> parts of bindings because new device is someway different. There are
> hundreds of bindings which cover different devices. We move them
> because the binding is different.

OK, but in that case I think we're after guidance on the threshold for
"difference" here.

> Not much different than every other soc. All of them are separate IPs.
> Look at any Samsung, NXP or Qualcomm binding. Separate IPs.

So, something like this?

    allOf:
      - $ref: /schemas/i2c/i2c-controller.yaml#
      - if:
          properties:
            compatible:
              contains:
                enum:
                  - aspeed,ast2600-i2c-bus
        then:
          required:
            - aspeed,global-regs


I can't see how we could represent aspeed,transfer-mode though, as it's
optional on aspeed,ast2600-i2c-bus, but prohibited on others. Any hints
on that?

Cheers,


Jeremy

