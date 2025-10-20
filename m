Return-Path: <openbmc+bounces-775-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 997E2BF0DC5
	for <lists+openbmc@lfdr.de>; Mon, 20 Oct 2025 13:35:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqtdn0VrNz303B;
	Mon, 20 Oct 2025 22:35:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760960124;
	cv=none; b=LLorQPPCMTLFC+nH3v0df03CnGyI7FlEqihpGA9CMIwonzn26+LuJT7aQVBsM2hQ7QRij1pAy3HuMzrfIT4mrMQ1ug7UF2iG2YtXKggC9p042XcyW/N7T/rIFvhm86Q5x4pRwmjD3iwFZWbxAERM6uW2QKP5YTt/jPO6dbf5azqQHLQ0kzR20ZTGYoPT7hu/xZ7+N/8qr84/fhKFAtTcy28uvO99tLLkzjGAjmps+VDfAQAQ2G3tWlYtrRMuNBsLCpHy2vTs/Ro/cwWXdCx55Y2Nn7YuGYJaBppy2mIxr20P3sP2JuKjNsBLTcq7JWSEx/RODncB6PlCvY829PJGuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760960124; c=relaxed/relaxed;
	bh=0UtO/Ve7QiGpMlUuu0IVSIrQoQ/KH9yo8ixVSg0L1bc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Qk9ogFXPhYhgzl+6hNr6Cin38bmLjcUrWBZg5Z4nUb+uGIWWWghFlJohDV5faKtyRIdCsdypGVhds0QhSWkpqY+P6Lcl10V7fdpR568onC9prhExX/DuCBEtbtj+C5sA2H3yv/254XsSf7WULL92FD9lgJpUe546osEtY1b7GPTyx0XVFhHhfEymmomtuYyaOauoHks+u4wTve274lMdimjua6bDHb53NHWLYodaerg2PLoAm86tN8aATdFiQiRa3x5rf2EwR1xyjN10Ld9ojYNtmAUe9IJl2TMpznHOL8IAwkz+CqKdFtquoB5nDJ00gcJV7QhQnARp0sxudvKKig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MfN84N3F; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MfN84N3F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqtdk5j9tz300M;
	Mon, 20 Oct 2025 22:35:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 373E1489C1;
	Mon, 20 Oct 2025 11:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A9DC4CEF9;
	Mon, 20 Oct 2025 11:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760960120;
	bh=ZioengeclCBPyaIw8m5VBq2tqjHhRbeGcSeZSVPGoOk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MfN84N3FvlrHrKO6hwp0uof+Ta7bEnnpHDT3YaLa+WZMR3CMdo0kZHWC3c1U6E2pF
	 J5umlW8m4tmUBXWCdMwHbR4/0xVpTKgZPBLKDvRhZKJDxJztlux+q0MDAfDEkL6tk4
	 8OYnemTQgRJ0/6UVcCgGgfTHTwvb9712A6SjcKvzTp9OqaiU46BCKQI2Ydk8t6rmO0
	 EPlKRiwgd6lPVQLKfkryxc/KWv8F9NGbZx7wNrM1RS06vHJfcAyHaIhAQpol9wOgAt
	 CEIBujREfOOxhdxe8FDc9qugI9RYC1kUt+djUMqMw1/KQ0j89XW7VWnow0FdMexgWY
	 J7M8KbhYwuI/g==
Date: Mon, 20 Oct 2025 06:35:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, 
 andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, 
 p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, conor+dt@kernel.org, 
 linux-aspeed@lists.ozlabs.org, joel@jms.id.au, krzk+dt@kernel.org, 
 andrew@codeconstruct.com.au, linux-kernel@vger.kernel.org, 
 benh@kernel.crashing.org, devicetree@vger.kernel.org
To: Ryan Chen <ryan_chen@aspeedtech.com>
In-Reply-To: <20251020013200.1858325-2-ryan_chen@aspeedtech.com>
References: <20251020013200.1858325-1-ryan_chen@aspeedtech.com>
 <20251020013200.1858325-2-ryan_chen@aspeedtech.com>
Message-Id: <176096011475.23064.13799548826512417145.robh@kernel.org>
Subject: Re: [PATCH v19 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Mon, 20 Oct 2025 09:31:57 +0800, Ryan Chen wrote:
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
> the hardware capabilities and configuration options from the older
> controllers.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  3 +-
>  .../devicetree/bindings/i2c/ast2600-i2c.yaml  | 67 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml: properties:reg: {'minItems': 1, 'maxItems': 2, 'items': [{'description': 'address offset and range of bus'}, {'description': 'address offset and range of bus buffer'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/ast2600-i2c.yaml
Documentation/devicetree/bindings/i2c/ast2600-i2c.example.dtb: /example-0/i2c@40: failed to match any schema with compatible: ['aspeed,ast2600-i2c-bus']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251020013200.1858325-2-ryan_chen@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


