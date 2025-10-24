Return-Path: <openbmc+bounces-788-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0F3C048C7
	for <lists+openbmc@lfdr.de>; Fri, 24 Oct 2025 08:45:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctD1N2ZjSz30RJ;
	Fri, 24 Oct 2025 17:45:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761288328;
	cv=none; b=kdVDYU3pYWGn8EM2EF6NgzH2nbTd9RtTxNVuCxWo5oJwBw8wZI4kV9sDorsevgqIRxYEnnQLtr5E3/9nUhFXeDH3D/sU7JfUeXzTvYH/lJADPwhCpFOEX+EYcI7Mfr3KcBdV7z7EFZqzbl1SHC7Uf3X1alSE7L7d3PRay7OWTpFkJwxU4+QJ6nMYWsGUBprl2NzkpNqI7VFAodNRb41ssbnLjxJ6ud3LCu/Es60Xda18ALX/K3CFAio7AKCYpydOBiuhmTZN/Wcugt2blqND/rS1NGaeDr2fV+6QxBMWoRfzjwDueN4Is0wvjGTdHWw94s8F/xrWK/ER9trrrCXepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761288328; c=relaxed/relaxed;
	bh=DvwlF6aMjt/ctYUuBL3JPfNBkTxCTujVNJ6VU6bSGDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJ1gHbnh435b3GhBPZfYmnLmhDtfG5/7wj3tKHm8AjkYXWNTrogKxMAGQmoeVQmpIaGseLF+Uo2y4W0g+8zlErm8QC87HXN9JxFQ56LGv3QhTpCkZYqyQUokj+f5vJDuAEuoZvblcHLmE03mvfhmfknMfemPfrbzdH8EBLKb0N3x7A0hu4Zc1Bz3CC7Dqzwpl/ymp4hhMx1tpO80L2zdZ316g4LKKLoeMa/dbTdlWJbVLkXjbt6VFIgZ76t5UqEYB/QtHNHimgxEuxGpGXdjeXJY8qd03ZPgTD7nferWY8aD+q9O5BxtxfONYX8cu6UmYkVIXmZgDKLEA49o9LjgBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ivnGSX9D; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ivnGSX9D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctD1M4Tfsz2yjm;
	Fri, 24 Oct 2025 17:45:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A2C543E01;
	Fri, 24 Oct 2025 06:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4902C4CEFF;
	Fri, 24 Oct 2025 06:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761288324;
	bh=UUhpDadZzBT4RrPvzIdECya0GjjCWyOzHQkuKftuzQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivnGSX9DduM/MQ3ZCnpNc62OnWb6W1h9IiDDP6dsfVjSgb3jOLPa0VNNzruUqf5pS
	 qhmliyRhoRe269hJZp5+YDDOXrtig4fQViL/rfmkqETX14BeTLZ+nPnQ6T8lF4dveM
	 SEOIUhC8wTQ/V6yEtA30ijB80qUwyN0LhUES2BGTO5MWs2i20z7xJ5yE6b3+EwiYav
	 S2HiYVRBLW1LRSyeZdeRRo8LsL/+kBul/V/7kJ4UPQaP4W58RJ/r8sRG061ecw60sR
	 4uaJWGTcXUxD2sdbCdO8bSUlWf5gKjkeJstNRnwyN6e24SqUA0FeR2z8DpMtxKmLhM
	 Gyw7h+Znj9EbA==
Date: Fri, 24 Oct 2025 08:45:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org, 
	jk@codeconstruct.com.au, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de, andriy.shevchenko@linux.intel.com, 
	naresh.solanki@9elements.com, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Message-ID: <20251024-dark-ringtail-of-defiance-1daabd@kuoka>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 21, 2025 at 09:35:45AM +0800, Ryan Chen wrote:
> The AST2600 I2C controller is a new hardware design compared to the
> I2C controllers in previous ASPEED SoCs (e.g., AST2400, AST2500).
> 
> It introduces new features such as:
>  - A redesigned register layout
>  - Separation between controller and target mode registers
>  - Transfer mode selection (byte, buffer, DMA)
>  - Support for a shared global register block for configuration
> 
> Due to these fundamental differences, maintaining a separate
> devicetree binding file for AST2600 helps to clearly distinguish

No, that's not a valid reason. You just moved the compatible and are
still 100% identical, at least according to this commit msg, so there is
no point in this patch.

NAK

Best regards,
Krzysztof


