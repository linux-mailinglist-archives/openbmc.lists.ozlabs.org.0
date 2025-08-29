Return-Path: <openbmc+bounces-535-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA6CB3BCD3
	for <lists+openbmc@lfdr.de>; Fri, 29 Aug 2025 15:51:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD06N2Gj8z2yN2;
	Fri, 29 Aug 2025 23:51:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756475468;
	cv=none; b=dGRxRgsA4ELYmAbp2JtWSdtbb9Z+gNzeJmOmvdej8lLWelY1MXHFjf0rHVpGpNIPztgOVIz0X0lgpuAwbINJPFkjjEnEDgy+ZddtQWhukbO0u3P/LeWLAW3zdnfdD4lZkeeRF73VO6BPEoSqd/8rlsPsW199HmIRPUs98mDCrvkJ70HlgfS2BeFSUunDtLvjkYv+zGNMSMHjgNv6MskIiNYrBS+ZdomVCC7eIgmh7CdlIomAbzPqRqRadNymifWNpqZZYmI6pW0SxWe+pNBttxDpbFskvcrMWXp1guGceAr+Io5a0PgopUY2MemJuKP3bpPzu2uDe4E80jkQzl0SIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756475468; c=relaxed/relaxed;
	bh=Dbo6xW5TJbh5WPsB6dk7vrKFTqJnS4MupBdN9HCpIP4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=MRmgztcxg27sYZYdaDqHXxuOJ9+1mJ9AwuCfpn1ice3lQHKu1L+qKd9dZLxXlhymYLjAx//eS0FCyROC/1788gEsyXPHj+En9D8ldaYhNXjZxoljcdoTk2/ESL11SDezHpAgtAeufGuXNt/ye74xqrAvUZyzksC5Df6psDgiCWpq7IaPv7I8OG6dMCuwFuv2pXHjCK01prSsHh1Yiz6DYteef4tzUCVO43UypNR74aCvqbJMo7uYzJFF9NfAFFs3EGG/MVik0IA/GvyKZUzc/6RBaLeSrLldnZGyBDrcd7fMKAtCSVY+7Yzgi7ARO/AzTod/ihuCHyCvs4bX6+Bg9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J08iN6Rd; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J08iN6Rd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD06J1lVSz2xcD;
	Fri, 29 Aug 2025 23:51:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA19060147;
	Fri, 29 Aug 2025 13:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166FBC4CEF5;
	Fri, 29 Aug 2025 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756475459;
	bh=iMyE22m+SMBuDDViYX2YsQUqlBSUcMMIUputDrUwsPo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=J08iN6RdW+t2gMQ59Tr1GMVwa3UffcElZFqa4Zg99HY8zZzGt08x/uKqmpkG3ubKu
	 8TrwqgVR9+6I7fMDTZau5j1fIgrT2uDHUJ1priylIHzrnyc3fR3hIpJ8eTY8ey8x7P
	 yLjGFysK0NlqW3ZnoBjqFzZlX1vxIVPDnnWMy+kC0t12AUmzfX9idKKzeSc5A89pg4
	 b2xpZlqyBvyquHWQKX8Xb+U/E8UTUXQNo3dWmER5QMINukZ7pGdDqmLST4KVRDuv6W
	 qe93O16t/bYXFGKjMEY8G56asDFR9GSQg8s7cyzLMJ0UHOEhFTUr4jfqB+KHxTiQA0
	 tEPnD46DuqdnA==
Date: Fri, 29 Aug 2025 08:50:56 -0500
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
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 joel@jms.id.au, andrew@codeconstruct.com.au, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com, linus.walleij@linaro.org, 
 lee@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 openbmc@lists.ozlabs.org, brgl@bgdev.pl
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20250829073030.2749482-3-billy_tsai@aspeedtech.com>
References: <20250829073030.2749482-1-billy_tsai@aspeedtech.com>
 <20250829073030.2749482-3-billy_tsai@aspeedtech.com>
Message-Id: <175647456196.394574.546840408984626348.robh@kernel.org>
Subject: Re: [PATCH v1 2/4] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Fri, 29 Aug 2025 15:30:28 +0800, Billy Tsai wrote:
> Add bindings for the pin controller found in the ASPEED AST27xx SoC.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  | 135 ++++++
>  .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml  | 452 ++++++++++++++++++
>  2 files changed, 587 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.example.dtb: /: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.example.dtb: syscon@14c02000 (aspeed,ast2700-scu1): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.example.dtb: /: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.example.dtb: syscon@12c02000 (aspeed,ast2700-scu0): #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250829073030.2749482-3-billy_tsai@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


