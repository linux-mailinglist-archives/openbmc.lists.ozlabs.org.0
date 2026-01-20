Return-Path: <openbmc+bounces-1253-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xSTtBPWtb2k7GgAAu9opvQ
	(envelope-from <openbmc+bounces-1253-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 20 Jan 2026 17:31:49 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C102F47971
	for <lists+openbmc@lfdr.de>; Tue, 20 Jan 2026 17:31:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwRRs1FsJz3bf8;
	Tue, 20 Jan 2026 23:27:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768912073;
	cv=none; b=bwlBoj/blWPDyTXsWP9f9iziyf/wqYsNLSqp9YMikxik3Qhf3fbJjV0PflLD2IbrdnYM0SaobX1AzisndxjIZwcFPur3Z19eq1mo0wUCBZBCZPKpgDQMFnP1BZCnpH5okW9gfh4y3qepsSj/NRDLIFZlHs5mhmwco6eC8z7IzlvwaL/iZbtoxRnP4sSethb/vAeAQVUAUuUl6QCtg93qx7PU2g9Es7wgO4pjb5EVC2NYJ+L9V69tgIGxrR53sp5fIGzjmfc2z3nPWX18VCFBag93HxWGNcOfq+RWAj/SsQxc5H8qzS3QjPCL9yaO+bxgu2AV9jUX0nqW9QizJE+MwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768912073; c=relaxed/relaxed;
	bh=dWzUL86zeloyhVgkXz4snN6gH5GJmE76J80J6yEf0kk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=jebF9VdZ2izzUNmp40IoRdW3KEkpCASj3kKTeJ436wfFlw2v7CPtGEiIn3z7X9OPSNrZZVNMA9LvuPxWR871jZh194KuMCIo6+kq+J578wf0SDhHPiDlWETwNsKcVXTREzsW5BhpNJSxHaSen0GPQ07+6asUDOv84+Rlpq0RVKv2u5PUXCFtiYNlpx1p7uVdrZKZkfShDbs+k38vot8m1TRQ7SzmLku278hFkPYVsQL1VwgQnEntXf9HI5WRjuQFiUGUaJSbINkucu2vbm3kXn28BpuSjbxvy4V/uMAEoliZmSaZB9z/OHUTuUNQMXWPMVW5XmPNYN6GmKcrgVlfVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hHyqsg7S; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hHyqsg7S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwRRr2XfJz30T8;
	Tue, 20 Jan 2026 23:27:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3380D4376F;
	Tue, 20 Jan 2026 12:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B855DC16AAE;
	Tue, 20 Jan 2026 12:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768912069;
	bh=OBQa66E8qIIZZ+a5/f/YUB/uMB9Oa+5RXnBGA2tH1VA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hHyqsg7SLKU6D/+NrFAwaN3MhGr5XHbaGDgQQaIQvl+t/iY5qBmfoYu4l8P1Lcgm2
	 oqJ3zQmgw1zYfVFAqf8RWA870XZkWL9FQDro7p9evW2z0tw4c4/sBvgKaSQtE4S5hn
	 CdQsPuEKhcpai1OKgQmiT+5ZVmFPe9frZIGN4ZfeuxtJ7DNvwhniQ85cZa9PK0IB8T
	 LRTiByz0h8vDb+LxO4ccWKXYiOI8JKsTMY1lsJ9exLUtk9yiLYW4Mi8tjUvTgSQUVa
	 U4O5JcFDH62U61e3HJyoNXKzJhwJ7VTiD1wcAU6iW1MKXr8WJHEzxlNP0uS3iWfgpB
	 YOcSVoJ6njokA==
Date: Tue, 20 Jan 2026 06:27:48 -0600
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
Cc: bmc-sw@aspeedtech.com, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20260120-upstream_pinctrl-v3-2-868fbf8413b5@aspeedtech.com>
References: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
 <20260120-upstream_pinctrl-v3-2-868fbf8413b5@aspeedtech.com>
Message-Id: <176891206887.1610236.16662937885214497301.robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [0.30 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1253-lists,openbmc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,dt];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,aspeedtech.com:email,0.0.1.144:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: C102F47971
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 20 Jan 2026 19:43:06 +0800, Billy Tsai wrote:
> Add bindings for the pin controller found in ASPEED AST27xx SoCs.
> 
> The AST2700 SoC consists of two interconnected SoC instances, each
> with its own pin controller register block managed by a separate
> System Control Unit (SCU).
> 
> Introduce the "aspeed,ast2700-soc0-pinctrl" compatible string to
> describe the SoC0 pin controller, which is not compatible with
> existing ASPEED pinctrl bindings.
> 
> The SoC1 pin controller follows a regular and predictable register
> layout and can be described using an existing generic pinctrl
> binding, therefore no dedicated AST2700-specific compatible string
> is introduced for it.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml           |  27 +++++
>  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 130 +++++++++++++++++++++
>  2 files changed, 157 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$: 'anyOf' conditional failed, one must be fixed:
	'pins' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$: 'anyOf' conditional failed, one must be fixed:
	'drive-strength' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$: 'pins' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'if', 'else', 'then', 'allOf', 'anyOf', 'oneOf', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/nodes.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$: 'drive-strength' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'if', 'else', 'then', 'allOf', 'anyOf', 'oneOf', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/nodes.yaml
Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.example.dts:63.13-50: Warning (ranges_format): /example-1/syscon@12c02000:ranges: "ranges" property has invalid length (16 bytes) (parent #address-cells == 1, child #address-cells == 1, #size-cells == 1)
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.example.dtb: syscon@12c02000 (aspeed,ast2700-scu0): reg: [[0, 314580992], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.example.dtb: pinctrl@400 (aspeed,ast2700-soc0-pinctrl): 'reg' does not match any of the regexes: '-state$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.example.dtb: pinctrl@400 (aspeed,ast2700-soc0-pinctrl): emmcclk-driving-state: 'drive-strength', 'pins' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260120-upstream_pinctrl-v3-2-868fbf8413b5@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


