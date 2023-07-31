Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 092307697AA
	for <lists+openbmc@lfdr.de>; Mon, 31 Jul 2023 15:32:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kB01tzMR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RDzh06dX9z30f4
	for <lists+openbmc@lfdr.de>; Mon, 31 Jul 2023 23:32:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kB01tzMR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=3r/a=dr=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RDzgR70J7z2ym1
	for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2023 23:32:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1EEEB60909;
	Mon, 31 Jul 2023 13:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B793C433C7;
	Mon, 31 Jul 2023 13:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690810337;
	bh=z+uAjZVNhz3LyIsdekBiHKjrJt8GwMtkgIpTiC3PAhA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kB01tzMRm0xGd46a/lcgXTdh7oLikepiXWJAdD8VSwE9ZBAEkWDo+TYXbogvXBgP9
	 AJ23A5d3Fq/rXkUPkZCk5FG6x+6wOgw05LSZhm/8oVNWbI1jQroLbsuHh3cscmQdt2
	 uRVnuLARcsiT1T1ydr16yNHdd7BwJUtENHPlZzBTzf+vtIX1GV9NmaO/ARfykaAFGt
	 m2NUtScqaxIMg7yiLb5xXR8tVV9P70OWi+gKX9fUuwToBmzCpKqv5jLqJNaDZsSM6U
	 O1ANB4DWnkC/flvt651yNsmqv6JmkQRc6yEgpwoXoHL+DKrdzi9C8ZtxDg1smtXDqI
	 ZhypNn1sURM7Q==
Received: (nullmailer pid 2855850 invoked by uid 1000);
	Mon, 31 Jul 2023 13:32:15 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
In-Reply-To: <20230731122323.172834-2-tmaimon77@gmail.com>
References: <20230731122323.172834-1-tmaimon77@gmail.com>
 <20230731122323.172834-2-tmaimon77@gmail.com>
Message-Id: <169081033533.2855823.7340412529584491141.robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-binding: pinctrl: Add NPCM8XX pinctrl and
 GPIO documentation
Date: Mon, 31 Jul 2023 07:32:15 -0600
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Mon, 31 Jul 2023 15:23:22 +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton Arbel BMC NPCM8XX
> pinmux and GPIO controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 215 ++++++++++++++++++
>  1 file changed, 215 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml:77:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml: patternProperties: '-mux' does not match '[\\^$()*@]'
	hint: Fixed strings belong in 'properties', not 'patternProperties'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230731122323.172834-2-tmaimon77@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

