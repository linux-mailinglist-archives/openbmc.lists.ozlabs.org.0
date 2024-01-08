Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E248279FE
	for <lists+openbmc@lfdr.de>; Mon,  8 Jan 2024 22:10:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LJysBBxa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T86CW5BBdz3brC
	for <lists+openbmc@lfdr.de>; Tue,  9 Jan 2024 08:10:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LJysBBxa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T86Bw0G5rz2xcn
	for <openbmc@lists.ozlabs.org>; Tue,  9 Jan 2024 08:09:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E010B61041;
	Mon,  8 Jan 2024 21:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1719AC43390;
	Mon,  8 Jan 2024 21:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704748180;
	bh=tOZeUwu8Ym50TZyoye/7s3VUIMz/brOfUTrnWpL/6c0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LJysBBxajBMPFfDATpJd+uWkPL3Z5fpOojms4mGLvOAO91gF1W9TpCFLbFI6b/Vg9
	 FXZn+YmoSnguYsVRJSiuSOOny/i5cwbpl3Zdv/iitV3842uA67jdfd8ERQD1josYtm
	 Vcc+YUiyGE4jvoONH9istQxAVsBTOloUmkURe68BEBS8U0NVZppgbFNbVKik4XeZZe
	 VfGMuvKJy74wu1sbbyFS6GlX20UK+unzrDKJJDDyrwd1mUyLmLxyjf84eNQaSwaVDm
	 hZ8fwKSbS8gQW9SenAcToLaAj1yYZjNJokMkcpzwic95/GRBpstaVco5lDsWZqDidv
	 Bac3fPiapXvnA==
Received: (nullmailer pid 2140736 invoked by uid 1000);
	Mon, 08 Jan 2024 21:09:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
In-Reply-To: <20240108135421.684263-2-tmaimon77@gmail.com>
References: <20240108135421.684263-1-tmaimon77@gmail.com>
 <20240108135421.684263-2-tmaimon77@gmail.com>
Message-Id: <170474817687.2140623.4004065884295248395.robh@kernel.org>
Subject: Re: [PATCH v22 1/8] dt-bindings: clock: npcm845: Add reference 25m
 clock  property
Date: Mon, 08 Jan 2024 14:09:36 -0700
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Mon, 08 Jan 2024 15:54:14 +0200, Tomer Maimon wrote:
> The NPCM8XX clock driver uses 25Mhz external clock, therefor adding
> refclk property.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/clock/nuvoton,npcm845-clk.yaml      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.example.dtb: clock-controller@f0801000: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/clock/nuvoton,npcm845-clk.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.example.dtb: clock-controller@f0801000: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/clock/nuvoton,npcm845-clk.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240108135421.684263-2-tmaimon77@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

