Return-Path: <openbmc+bounces-1011-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB27CB7185
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 20:58:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dS3Kl0HxTz2x9W;
	Fri, 12 Dec 2025 06:58:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765483083;
	cv=none; b=GeagtvHeB6JM4+2rsdwh2WQvF16Q7uPYlJFxcsrkkDB3Mvrryv9S483pJetv0HBbadCoEwPeyGsMBLzeAijWqWWVT/Hk6bG2UZMsDJfROeMShAQ4rjtDfrmVJnL2TfIUtmnsP4Qahx8+PJGRI6Xx22YYc0MjgeGMHAijB6GvJ/ClHK6aFf6ZI0VvLjR15RNDinjFKOjpEE16MMkhBwQbuQ6FC6C9VhLhjX+CLdiXlvVQ1qaEBdoLltkVQmdZpGmhPDWs6GNb94WbkqxrOBbBXpGnjMAJzd6AFs7ilqN/BORvJIA28Rprop6YE0OxiCdHD39w8ayV/2Hus7rSJzdkew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765483083; c=relaxed/relaxed;
	bh=ONbXaRWBXX1LTRSqFq8fMOHEMVLQiTenj9LKRYRLWuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCNTv+5sexml4Kan/T9gjWUX33HtS4DWjt64EB3QDMOSsie9vEFjAhALf4rU4c8gy4hKQ0AmlARmrfyYCylc0DSL/MXeFvM7L4DWs+jKEgRN0wEHqd9SbAaXfF3DBPpDeA44FvQMvZSCspSevlmYrFHxBZWxY1h8OyFrOddkMQQTcxN6QUDuKpD9ZhSOTqZAyoG704UooPC/Wcd8TJxEVsJEQirSRyTmQMHOGdCruFEw1CDZuqPXdoYHDV8Xs7DKd5ywUz9KEN5xP6PTNUC2L6AIdS5m+t9i98uL6G6hdeEsRsIzOGIIqx6GnkAAIDvnF+3ULqidCws9X+t3B+S74w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ATJJ9+uk; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ATJJ9+uk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dS3Kk371wz2xZt;
	Fri, 12 Dec 2025 06:58:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0DAE4012D;
	Thu, 11 Dec 2025 19:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A12DC4CEF7;
	Thu, 11 Dec 2025 19:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765483080;
	bh=3/wJayDctxhp5vTQT4wNVc8YtzAiKTCUMkMHSROR2NY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ATJJ9+ukH0IzvEXvHTv6Bh/v+OnGQoKbctRpgp2vE2zMixw/67hkREvUItUMDl1Bi
	 Ax4mAc4VKjE3f8920syuzKruVfyJQh1CdFvGLdQPohTQD/u4HK4KOeVHSBlOg6g7pg
	 BpWKTfhsRW/WnJ1y3ztBDdx4NoJ+oZQSQrWLOG/BjJ/33uexE+QQYMDU48ryMEPKCZ
	 uQ+3GZvJjVBrUjMDhS9ucXX5lhF4d1RdytB5w8TqLegOatCfksxC4uf9NFkE9cvQoD
	 gQ3QPmkY96buSBIuUQdQd+YpWx6c4TjNhqzzomPQyE9PlSYDk4AIw0/bEixNX9sVW8
	 6WH/8wPsNXDzg==
Date: Thu, 11 Dec 2025 13:57:57 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-crypto@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH RFC 14/16] dt-bindings: iio: adc: Allow interrupts
 property for AST2600
Message-ID: <176548307744.1801669.10354753289483698774.robh@kernel.org>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-14-21b18b9ada77@codeconstruct.com.au>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-dev-dt-warnings-all-v1-14-21b18b9ada77@codeconstruct.com.au>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 11 Dec 2025 17:45:56 +0900, Andrew Jeffery wrote:
> The device has interrupts allocated according to the datasheet, and
> the devicetree already defines the interrupt property. Address existing
> warnings by allowing the property.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


