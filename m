Return-Path: <openbmc+bounces-1121-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15855D08E34
	for <lists+openbmc@lfdr.de>; Fri, 09 Jan 2026 12:29:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnfgq1m0tz2xSN;
	Fri, 09 Jan 2026 22:29:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767958183;
	cv=none; b=FCkOmhIILtCJqIgLuHdyHdB07hrLR5wo0x3zkBNeXry8eiZJx/zyRNTIavvEhEQaFZFE5wa1JqQcRRPSgBWVXGFV1GgCsMBPKwLh/jdvw7pr6IDAO0c9QPMSuHPZboknnzXw5LVXgK03bb5l6Lz4BxHftjzBTwaTM3lgv7qTRpnbRydqWt//hkAm7SOow7SF/Men8ABWTzRE0mmNUv/ItGVKOxeJzUjnTDKiRISQTeXTsRwovz3GEkAMQQkvHjtblpgz2H111rI4VPuRUUmZ/GsRuqxwow6VEbWF+XoFXmw/0hz79qe8CgmTZqW6fRfywXfDb6YEe1asKwVphJU5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767958183; c=relaxed/relaxed;
	bh=5ZmF0FSDjjhuramhZj/wmnOkap/wWgMgFMYGuEdcLhA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=g+PZaoKPSAaX/70bBhuGOCYJ2Y9/F2gEkqQFv+/RD1xZEP345g0jy2BxAYlPzany1tuW7E2dVwxoddr8ibW+wrgOw/iasdroEA6balS9/44vDyXum34xan9BM0GJuWM1a3hPxZllQdX3Gll6AnB/OpM3fkmq4Y/uPjZ/nKAoBgzBWwFF5jOKaFjXxGYf3ZtCJTLnmTfShbuylVvuE5RRhwamPeSxtUsBRYmWdUQUIPPiC91klse9M2Bft1DHrjmYIh5HWPZMjYyM3PUJ4E+0O0zTij7OLEKdZpl3K5zBwd0fuAgqPXW7mhxCAzhlFMVC/0LjPnwqTSUK/gTkXgTIZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FW5xbNLB; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FW5xbNLB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnfgn5BCqz2xQ1
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 22:29:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24D1144440;
	Fri,  9 Jan 2026 11:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BE8C4AF0C;
	Fri,  9 Jan 2026 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767958149;
	bh=uuvtHWXbur4b3UNiVol3kfUJOuEa5Q/2AL1FzGgXs48=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FW5xbNLBDmErOr6Ze5BAvusMexofgauPk70Ccu8+L6xSAvXOW+UrTddAEucxw7/zs
	 R57upHBxrHYe9aOFaKroXtLzUFVkA1gKnzwmfTJqY0/PcPMvx7e9AKBgv/edAkRE2W
	 M0IIBjbS5dhEwRW2VyAHJkXK+6b78O2VNuIZqSKeRCS05kNuGf0rYbF6cyxug0JClw
	 OoHOzvoVA3aHcZb1jtfd4DweYlUgKNphNreAzyBzb4+gKHuG1PE0O+K/J+/eN6g4za
	 j93/js3oFH7PvoyxwCFzN7VLQ06ZRkH8hACeikn0xmkOW/W+Swr2K60xQt9xWUczXP
	 3FclL3Mu64/fQ==
Date: Fri, 09 Jan 2026 05:29:07 -0600
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
Cc: SriNavmani A <srinavmani@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, openbmc@lists.ozlabs.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Michal Simek <michal.simek@amd.com>, linux-mmc@vger.kernel.org
To: Tzu-Hao Wei <twei@axiado.com>
In-Reply-To: <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-1-934f1a61f7c0@axiado.com>
References: <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-0-934f1a61f7c0@axiado.com>
 <20260109-axiado-ax3000-add-emmc-host-driver-support-v2-1-934f1a61f7c0@axiado.com>
Message-Id: <176795814783.2967277.2609413382098901076.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: arasan,sdhci: Add Axiado
 AX3000 SoC
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Fri, 09 Jan 2026 17:46:25 +0800, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> Add compatible strings for Axiado AX3000 SoC eMMC controller which
> is based on Arasan eMMC controller.
> 
> Signed-off-by: SriNavmani A <srinavmani@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---
>  Documentation/devicetree/bindings/mmc/arasan,sdhci.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml: properties:compatible:const: ['axiado,ax3000-emmc-phy'] is not of type 'integer', 'string'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml: properties:compatible:const: ['axiado,ax3000-emmc-phy'] is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml
Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.example.dtb: /example-0/phy@80801c00: failed to match any schema with compatible: ['axiado,ax3000-emmc-phy']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260109-axiado-ax3000-add-emmc-host-driver-support-v2-1-934f1a61f7c0@axiado.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


