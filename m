Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7369C6926
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2024 07:16:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpChV037Kz3bdV
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2024 17:15:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731478550;
	cv=none; b=O4nm8Y1+3246PUpZn1eC/J6bnULCSsIuYqRkloM0lBSIiJPhfoTpAD9dT1Bl4ZGdBZLMIV+qInHrq8+9KiWjSToeYf2/w7VqR8Os1Xs1HLERIKIZJ25DC1gjTfxtEr+5EI1pUwOiYTVepib6aDz1c8VA5OlZ/cBcy5ZePOtUF+ClPLyN1Gx04TEWpoCe0spujSbvq2GMZeJC9ysxjR8ON7l+C3mz0J6GCUYyNEJt3H07fGwEbBmXZPxQ1adBGKGhBuI0WasZh57IfE41ysE+HbvgaIZALdj5FtwodhVzfn0+SEYXuyxQBcegghdasXdjtw0cA/sxVescQqjTNstkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731478550; c=relaxed/relaxed;
	bh=z5YdMUXgGOAF8goB3vv69jUrB8QTyxx1LopfUs1gOnU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=VgLL6AJMKMDzhyz+OPeKfX2/m8QWJqOEZ/LNT2+ya50VPc8iIePpu14hLDu1NzUp3G0yIgOc7EJaJpvEgjtMeHVXwHee07I9PoiuWRG/5oddHE3SHXrib2/AlW7dJ1wi8HMM0nASCQB/Edj6V7JWEV4xaTYOh9XOi4PX+4KGC8YeX9JK3LUnblUb6iOLzgmEh2jZP2HS7a86AgYjrUZ2ZVAeg7oD6MHBgwj62TeD3XKXbuG/ItpfNWDwGw2CMv0GT6HEwiTORA1N8JsOyTO1jZWwaYJh1UX3CfCVakUg0nCwOfi1XUpcDm1SNsId+6gv/BlSAU4uqADjChdcwNWd+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qmCQpJzd; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qmCQpJzd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpChN57lSz2xk1
	for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2024 17:15:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D43C7A4029C;
	Wed, 13 Nov 2024 06:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79179C4CECD;
	Wed, 13 Nov 2024 06:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731478543;
	bh=GjHWsGBW2+fujolM2tMANHwifuU0meTtmmBJ4b3ZT90=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qmCQpJzd2ahwxFIOLRTrnGuJ+kFeMPsYIBS0aPzc4h3BS7MXPwxBhDuBL8P5XaAVZ
	 ABagjtywQEbi2AV19TGV+hMZuv1BAQm/m7PQ3X0xMx8RZoKhIjSZgsZR2Y2kxJlviP
	 awiL8oQ4Ow5oejzqmbTw1b1ZSiSncj/UAPO9/8WPAYy/NS0oPsBGMY3Vlgud8GBW1z
	 crzmwWXyqMqr4FtgIhDnkpiNeBkVZiK2OgEqFbei6V0tj6sgIZOAKw4NGehTYpWXZi
	 JFe8U+7qEtRnPbGFGznPKuQ12JJwPgCrsG4BE+fCaNz518ZMDIZ7pnY2xSV9Ri/qxX
	 QumlFfgbrpnSw==
Date: Wed, 13 Nov 2024 00:15:41 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20241113051857.12732-2-a0987203069@gmail.com>
References: <20241113051857.12732-1-a0987203069@gmail.com>
 <20241113051857.12732-2-a0987203069@gmail.com>
Message-Id: <173147854152.3007386.10475661912425454611.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: net: nuvoton: Add schema for MA35
 family GMAC
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, alexandre.torgue@foss.st.com, openbmc@lists.ozlabs.org, richardcochran@gmail.com, ychuang3@nuvoton.com, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Wed, 13 Nov 2024 13:18:55 +0800, Joey Lu wrote:
> Create initial schema for Nuvoton MA35 family Gigabit MAC.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 170 ++++++++++++++++++
>  1 file changed, 170 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: ignoring, error in schema: properties: compatible
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:compatible: [{'items': [{'enum': ['nuvoton,ma35d1-dwmac']}, {'const': 'snps,dwmac-3.70a'}]}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:compatible: [{'items': [{'enum': ['nuvoton,ma35d1-dwmac']}, {'const': 'snps,dwmac-3.70a'}]}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:clock-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'stmmaceth'}, {'const': 'ptp_ref'}] is too long
	[{'const': 'stmmaceth'}, {'const': 'ptp_ref'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'MAC clock'}, {'description': 'PTP clock'}] is too long
	[{'description': 'MAC clock'}, {'description': 'PTP clock'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.example.dtb: /example-0/ethernet@40120000: failed to match any schema with compatible: ['nuvoton,ma35d1-dwmac']
Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.example.dtb: /example-1/ethernet@40130000: failed to match any schema with compatible: ['nuvoton,ma35d1-dwmac']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241113051857.12732-2-a0987203069@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

