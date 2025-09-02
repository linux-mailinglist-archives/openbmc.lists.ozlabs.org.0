Return-Path: <openbmc+bounces-557-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4B4B3F710
	for <lists+openbmc@lfdr.de>; Tue,  2 Sep 2025 09:53:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGHzX27HYz2yrg;
	Tue,  2 Sep 2025 17:53:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756799592;
	cv=none; b=AxACjQC0hlS5qArZ8L8ceAtfpRjQbC2m1sEtRM2UDBKZFIa4IGMNo1ZlWy0JbrVSBiJmylmtHO0979yslHi0QFHBm9DDtDoLIwpIHC+zaVsWYqo2yD2F4yL4S8KX1qJRyuxdQYTJlY/oMQSVY9JmxSV0JZzCvWde6nUpcfQKa0b5v3ub/6Rss44K2zRFlmII4U8MQ4Be5L8F6/CSt7UfVgp1nH1nWdholANN2sPbiaPzL0PTVD/pYPRg/68CAbMLBSQsAoGz3eU753aoUdJhJGdlBvvATMOYqDfWu0gTwqybuiXHryDaZZMjqsOlCpl5T3sDjFRanj8PL1Q4Hk3mJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756799592; c=relaxed/relaxed;
	bh=kqixcjsZhlfl6uKrhVCPBxlqCy34X0rBKN3+98rdgHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRvpOm3y9x4puDrSgEtUR9v0S5UfX/H/px9l2kqvjqpCMasJpEN3ce7mK3bcyIviqOk34Q9BXFA2YEh5jJXoTLR4ryeSQsKqDrMT06ztf8eHrXgR1MoJ7ISlQ4DC3e0qErP4yC8JPfXh9lsVaFULkoioL53tZ69YB0B7NqUnW3z2Ftdw9FH/MIfdvm6JAv9qTbY1CC7BaSc1xVpdeMaN0Y05c99Xgi7Vuljf5o81XZBlqJH+boHi0QFpWCF265HZVXXBUvqdUHkh2ARikCOtDzdb2goQ+FhiYJ/KKPoOAymaUb4ufPKzhE0VuUO6YNDclT9G78u3Y3mbXITe7KrPDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dw/QA4iu; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dw/QA4iu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGHzV74MJz2ypW;
	Tue,  2 Sep 2025 17:53:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2651F41A9A;
	Tue,  2 Sep 2025 07:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64829C4CEED;
	Tue,  2 Sep 2025 07:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756799588;
	bh=riQZiJZ4exUI8JW+1R+cAI/RIVX8pPtYIePY0YIjLsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dw/QA4iuLCsV2GfTsBLU+q7zXIGmkBCLfJNQC89MvqZra4FPAbOmsMl6Q7Iz8cwbw
	 4PDHfFYokehXrp8huzoiWiL6X6NJiXL/tCtfpnCERdi2Xic4+ba+JytNJpPcFin6ba
	 hjnW014cTeZC8WsmPlrK5WBpG16uS3T6mEVdQje6SWzma+XO8yszw95Bi1ZPsYRum3
	 F3tKcY5MTYL1DZurIQ6lDBhuSidLFORmn4YzXz99wOfGYwwmiveWWlmlVEYBwgg40M
	 h0V+3lnpTJt+VLmCTB1GvWF3+z3f6SNinTHJ3U63jeOwLF16/YLaJlOXRvX/ibuBwH
	 gjdEiFRUpVF2g==
Date: Tue, 2 Sep 2025 09:53:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bhelgaas@google.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org, 
	kishon@kernel.org, linus.walleij@linaro.org, p.zabel@pengutronix.de, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 04/10] dt-bindings: pinctrl: aspeed,ast2600-pinctrl:
 Add PCIe RC PERST# group
Message-ID: <20250902-wakeful-sepia-gecko-eeba05@kuoka>
References: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
 <20250901055922.1553550-5-jacky_chou@aspeedtech.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250901055922.1553550-5-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 01, 2025 at 01:59:16PM +0800, Jacky Chou wrote:
> Add PCIe PERST# group to support for PCIe RC.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml     | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


