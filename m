Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A65C3A4161A
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 08:16:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1X952yrdz3c3n
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 18:16:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740381397;
	cv=none; b=dxbCffSgEnDvKRCB7R6DypieVWxvyWlG7vxIEnW9m5BBkUqZxR/TfNGkBYNFSrjkglCRyUV+7u/rbCBCi2wF5amwKsl02xdu4VBdKVAWtERPiCGY3mMH87o6rmCeI4fc06DbrsnAq1LJZfmgFC2gRyInA40KH6k7tiDsnIAJ83N9osCIHrV/R25RqUhyzVfk+m5t5uKTRZIX5/9XgWOpmqPIp18FFO+kgHtkup4x3OcSVnyZsuqQvKAwRxyQM/uQCfpCn3vUCZC1tBI+/btO5ea+mPtceAiAVYpUORV9x+4DRenV3F+x04HgA5qxjQVCa3393E1+gpdfRrzEb7HYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740381397; c=relaxed/relaxed;
	bh=8F627ALJhleDf0joQLUIY5WzrQ4sqzAfgG0V7XR4JzM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=N3sbzazBKpodoeNmA9WpHaXk+FsSx02P/IZN2P4S16BHaKYctXn+ZADwk9HgljkAIeoLQ9U6UlI4WRVqHjIixGxrsIcssiz6Z3cdVL6x1kSE0DS66xum1R/4gsgju4QLykfDsxpORRn8ycKP9ZZU5F+IIKHlWPvOObAJLmi2bYHZUZ7c29TOoO7MT21Q335ppI/Y6qOTUkVXY0UR9OPU4BCa4PWgCkgsXo/Cf6IV1L60enXi8uYz/88GCKTJMZJNLBoYe9hdZH1+yBfCTNdwcLjyXE0DvoebISktrS5vBO75M77iArF4k/x5EItgcuqR5ybvDAu77+lZNvTwR50Nlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dCsrvMjQ; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dCsrvMjQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1X911Rbvz2yXs;
	Mon, 24 Feb 2025 18:16:37 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41E766117D;
	Mon, 24 Feb 2025 07:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48827C4CED6;
	Mon, 24 Feb 2025 07:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740381394;
	bh=2pBGmTogQCkZU/xIxkV1ntJSYG2JD2YqKohqWLQmXu4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=dCsrvMjQLCzpbeyKIBH+s0BVDBGeHCz9RrZkebic83ktfM4vw0gqL8fje2cJ5ce7e
	 BaDVvtxsrgzSHK+16pwIQsUc5y3vkghLu8MY96zCwSEVhw6Pb2HYEDKE2jfCqmE8TC
	 Vtdc5FOmfpVaPd4TNIxN73EtlG0TwoJae/v9IRjHuOfHYL/Evaz+dIDXafrvMlZZ/J
	 x+Y92P5h6+h+F+IN6f9lZ1QOhhC7uTYvI4FhKjz+E3qEX8Gp8GA69GF2iSD31NXE/o
	 NspuiHPWB2/ZlbdGfFFJssj9Nrdvt5VtS5f0Ym8k/mHGz0Ssto5wY6vU7rc6qO1fmw
	 YE8PdOQ2jmDNQ==
Date: Mon, 24 Feb 2025 01:16:32 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
In-Reply-To: <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
 <20250224055936.1804279-2-ryan_chen@aspeedtech.com>
Message-Id: <174038139252.1126908.7016492425946254564.robh@kernel.org>
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, andriy.shevchenko@linux.intel.com, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, p.zabel@pengutronix.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Mon, 24 Feb 2025 13:59:34 +0800, Ryan Chen wrote:
> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
> and description for ast2600-i2cv2.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml:82:1: [error] duplication of key "allOf" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml:82:1: found duplicate key "allOf" with value "[]" (original value: "[]")
make[2]: *** Deleting file 'Documentation/devicetree/bindings/i2c/aspeed,i2c.example.dts'
Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml:82:1: found duplicate key "allOf" with value "[]" (original value: "[]")
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/i2c/aspeed,i2c.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250224055936.1804279-2-ryan_chen@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

