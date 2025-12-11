Return-Path: <openbmc+bounces-1006-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BB2CB6659
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 16:57:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRy0d3r0dz2xPB;
	Fri, 12 Dec 2025 02:57:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765468673;
	cv=none; b=Iz2jZVyYVIlVfw0H5NzVtDM9lWIvXw5YzgPUKlSTDO9vYAQvYk+LJBJPyVufISCJF3ZYNw5eSCF/A6hLkOA2kjEWzJEoxlD+7hR50vGD9kz1a/HuJ9akS5TKX3dMwQjZCXe3N51xGzD7fh8IebE7CvwXuqlRVFtWpvmSQlgfoCbyQYxW4NzGzk3jsXZVCjxZE/rWYMihGtQdW+TcmBnHhze5w5XrH5CS2FUf3JIdxqHCkx03ur0ALyypnlO6gMayfzAa3KZOq8jUecqeDEGqCTIe1JRL8s+2rFCUZWDf6J28zwIygN0zQXZc9PkjgcuL5M3feAUGVBhBrGBV2XN2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765468673; c=relaxed/relaxed;
	bh=UWNcghzwvuVYfrQNEdy3WyZPj72HXtm2nUYg3b1P7Ss=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=oro0frUXl+NtdfGWKxeTgGbjOQVLHsFX1HkvVffy81H+LMsjYt7tDmRR24ge2u+2LW5HJNVnT8nfvnkCNYhzq+URhJmoYHNgj/19rjOurPt5vzYY1OdF89Z2Qi0BGobOxxYsRW2tVXHqcwK6T8tzKAXP71nxncAtGQtMOqwiCDHbLi2QFy52jupAv3eTPYvGfNNWuM5ES01LaecYpcACOFL9cVfC1dN6U93ywHfcTi4hnTq19/FblFIiHVP7Y5OEo6grebE7S2aBnfEH7kXBhLX8vHZm8R+bFo37hHzjSG7zmwARIEnjOhAfCDoGV+PxG4hUpSG+20+LgKYiBaejOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tDBGKf2W; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tDBGKf2W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRy0c5YRHz2xGY;
	Fri, 12 Dec 2025 02:57:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3598A6013A;
	Thu, 11 Dec 2025 15:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB4CC4CEF7;
	Thu, 11 Dec 2025 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765468669;
	bh=pFsCSVV25XloLK9Jvu2/qNTgDEC1TPVYRi3qn4jGraI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tDBGKf2Wb8Cl6lzG5cx4vBkzWJr4i/qgbwkSv5JcKhhDLKt4RMd8zBcl8z00VKYK7
	 yfmdbPecn1pr7ynoRhjMU+wNVgUlQx+MK9oEoymM+KMpk80lJadHVtxBjD8+VyPGhy
	 lpgOJx28AznF++QhBe31bMUER/pB9aITcDTVhqkJESwIs1waTYRPjBnghQhdqUbafb
	 XZBeilKLe+y5nt3/Ii8lhjLHe7i8Dk0ldvFavx/oNoq4N6kLcYogdKi3dH8NNqjlAk
	 FiGUG728GtdRqfsleYVeKxM60PgNHtr852oAkaKTYOPmN8O9Zn3rjEfHfNVB7H1Pen
	 t6gnGiv7kyXug==
Date: Thu, 11 Dec 2025 09:57:47 -0600
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
Cc: linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, 
 Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-6-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-6-21b18b9ada77@codeconstruct.com.au>
Message-Id: <176546866607.1487115.6798113196659439308.robh@kernel.org>
Subject: Re: [PATCH RFC 06/16] dt-bindings: mmc: Switch ref to
 sdhci-common.yaml
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 11 Dec 2025 17:45:48 +0900, Andrew Jeffery wrote:
> Enable use of common SDHCI-related properties such as sdhci-caps-mask as
> found in the AST2600 EVB DTS.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/aspeed,ast2400-pwm-tacho.example.dtb: fan-controller@1e786000 (aspeed,ast2500-pwm-tacho): #cooling-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/thermal/thermal-cooling-devices.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251211-dev-dt-warnings-all-v1-6-21b18b9ada77@codeconstruct.com.au

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


