Return-Path: <openbmc+bounces-790-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2982DC04F1E
	for <lists+openbmc@lfdr.de>; Fri, 24 Oct 2025 10:06:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctFpX5Jcbz301K;
	Fri, 24 Oct 2025 19:06:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761293172;
	cv=none; b=X7HKO0QibdhPDIAajbu9Br5oCQhtzkrM1ICV5GRpL3xi+5yaZye3W/gk7+eWAWPu02m5vqvgy3mZl/CSW86ID7Ie48E1fX+Sj9uO3MgDHs6pVO/rNjrFFus9gu4sYzKov4WUk6oPUZClV3yyEkWhmSV6LcLXVzkUYulZ9TbYgOi8gsM/T0HkvaOX9nNGY2bSOOT900EbC7ni9hXu8zZ0pdrZLkz/qNF4xExup6vWB+KshCGLAFZwSfATTSRcUNDkb/LL+nF8YSzFSoyzUJbQU45qc0L7/V9FfX5kIuC3aFFVtiGAo8dRIp2kTqthByQiR0f1m1CrYcTx65TktsUC/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761293172; c=relaxed/relaxed;
	bh=HvOaKA7yATNHviA11gu4zFrMYg2AOIM8mTYHs1HrhIQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mrvgi2594/AGj2f7LAoYatyrp8Ve0s5jWb1wxdH2xDdXovrH8MZznULHodvFau6TjIM0LQ9QoHLqxaX+p9aMaHkvl4rmpyvFPLQzsgyqmV8EDxbbRDvWri3adtyl0kKos1bF8V39jLGYW5YvDq9PokHGmuhmf3alq586NI+Cb+X4kLngXet+W/BNZgjj/0To1H/aXIbq+3XZs5mMLMzRFF7uznsa6/Z71iNl63FfvQ5+YoEbTM8dbeZvIdxIDXtIAz/hB3YOS+/YuKK5Kb+M5cCiw/PQV1sm8bpf1EePp/nx/6TeleHg8y9IrIYhEF/Eo6sXbJpxFYt/iiOthtSoCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eTgClpl/; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=eTgClpl/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 603 seconds by postgrey-1.37 at boromir; Fri, 24 Oct 2025 19:06:10 AEDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctFpV0kbyz2yx8;
	Fri, 24 Oct 2025 19:06:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761292565;
	bh=HvOaKA7yATNHviA11gu4zFrMYg2AOIM8mTYHs1HrhIQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eTgClpl//Z89Gd3mJ26u/c4wtzTyfWBNQOqpjPZtVQzGYTvZMQdVv1/Wpm/Rr2afn
	 ixqp5Glry95DeQ2s9NOePqNV048rEplCbVMt2Ul1jOE/rEOgl1Dg/zfWxmeQR5yNML
	 XNCBrPiNacSqWAd+MngipGJyTrP5Osv2FMm4YfJEGOPidCmGebP0fiXHOS6ZipyiFq
	 wbATJ/kvggqZTwHSbM7FPjb6+CADOaSZkY51KEnzJaLr4g3rrlSF/At0W9aPaOZU1M
	 w+v6N7CGvrjRFtZxssmUwbCS8reLoFtOy35NSpeH8uE/Jgx9uk/TT+312sYqmAeAzL
	 hAR2vW9ZYV+og==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1412F72F33;
	Fri, 24 Oct 2025 15:56:04 +0800 (AWST)
Message-ID: <bf3d6690b9124ecf74df6c0f9f1c0f72ae1db9f7.camel@codeconstruct.com.au>
Subject: Re: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
Cc: benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrew@codeconstruct.com.au, p.zabel@pengutronix.de, 
 andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Fri, 24 Oct 2025 15:56:03 +0800
In-Reply-To: <2939cae6-2e8a-4528-8e27-8c932e2f82de@kernel.org>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
	 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
	 <20251024-dark-ringtail-of-defiance-1daabd@kuoka>
	 <2939cae6-2e8a-4528-8e27-8c932e2f82de@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Krzysztof,

> Although now I saw next patch, so clearly this commit is incomplete.

The split that Ryan has done here - by shifting to an identical separate
binding, then making the changes explicit - allows us to review the
actual changes without losing them in the move. Sounds like a benefit to
me?

> You just need allOf:if:then: section to narrow the
> constraints/presence of properties.

That seems like a more complex approach. This is separate IP from the
2500 controllers, wouldn't that warrant a new binding spec?

Cheers,


Jeremy

