Return-Path: <openbmc+bounces-1007-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48648CB667A
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 16:58:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRy0f4Vt5z2xGY;
	Fri, 12 Dec 2025 02:57:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765468674;
	cv=none; b=XadsrFetEZdzAdRKhQmU+YARKZh0gu7A0eN5yt7Q7u4vL3V2CEDsV7ROlk3jKqzoOkLE7NYO/+KyWfWikGu0jPWjrKvhMYwIqLVthUylyIF/CUwHJSSEdXuT/vgWxo47JeIqbt7seOB9GpChbT2lJ/DQIKiEFScx7yRZIn+GyC8dxhR/eZgLU5J3ltFAQ5VPVyxuCTVX+8lMSQOcWjCzg/0fn8Qfg3fSLdk+/nHd9R2y7GOvQfbeiVGH2oi6DtXnPAeLidIFmoxZ1eGbFjP3G4/pFiWo9f9evRFX3lIO6rPbjmtSpbm5SDrHMv1HSF4sMvg70O7proKafdCiCj6TuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765468674; c=relaxed/relaxed;
	bh=g+3XQfRI8SlzMRRDqWRLgVwzexQuXrTAXKKfYG4pUFE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=h5jvLmSUsLYn2Ir4Q3D/fPvD3Pg3SwsMuCfCbIIWonYH8FetNTd4WgKX+d1CIThjjuI3MzJwPe0zD1fbjwSrVS5Pk0dFk6VySd2nnX2nQY6upayYrZUl0Nv01P9t44sB+b+jHFv/Qa0xhQZQepFsGc48Ub9fIveyVGluA5FcMCiDs6FVwoHrIlzxmrvk/bqglxC40M/US0W6DlURUauhe0cLO77I0p4U6qQAR2hzfgvyJzrIOa6o2fjYb+vX46MQQDjIg3WcTMvDDUqQficDaDSsffRYpCi5j9msajaZdN57O1dc2UrotFOmA+uKjUgpLFp97mEjW2zFifxOA5KwGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=esKifij/; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=esKifij/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRy0f0Mfjz2y7b;
	Fri, 12 Dec 2025 02:57:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 742BD419A7;
	Thu, 11 Dec 2025 15:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A1BC4CEFB;
	Thu, 11 Dec 2025 15:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765468671;
	bh=aQN9YBZJ1/3TgzhE0vb1ucmDOVbahlZuL1in8B8rZXA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=esKifij/8dhYsEU8w1WyMNuXAVSlN23yCyZg9abVk+EvvGTJik0I6PaTapC6y6lgk
	 9DSN2eWrwg2PpNOnHvWhEH3b/ZgVGsLDmZXqcNrs0NeOlj+x9E0Wh+kGDDwu4CCF8F
	 4XYa/pUqW6wHxb/qBshR7WOIaLTh/0fnn7VoDOSwgWPdwJ8ErIcFxlduWvBivpoFn+
	 IpPjwCGfsiicFSRpmuICleEUojKPqGOGsf3xwCxxLR5+grBffvMpZEQXfSoGKBJmAc
	 +J/H0qT5EqY1z/AglqUXvyaokIxb2Evp3PrfGCq5FsRJG8aPW+KCfP75qCONvUrM3h
	 pXM6DvHSuCwXw==
Date: Thu, 11 Dec 2025 09:57:50 -0600
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
Cc: openbmc@lists.ozlabs.org, linux-crypto@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Conor Dooley <conor+dt@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-16-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-16-21b18b9ada77@codeconstruct.com.au>
Message-Id: <176546866713.1487167.4918701456595372928.robh@kernel.org>
Subject: Re: [PATCH RFC 16/16] dt-bindings: mfd: Document smp-memram node
 for AST2600 SCU
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 11 Dec 2025 17:45:58 +0900, Andrew Jeffery wrote:
> The platform initialisation code for the AST2600 implements the custom
> SMP bringup protocol, and searches for the relevant compatible. As a
> consequence, define the requisite node and the compatible string, which
> in-turn tidies up the dtb check results.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  .../devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml:140:16: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251211-dev-dt-warnings-all-v1-16-21b18b9ada77@codeconstruct.com.au

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


