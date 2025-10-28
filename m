Return-Path: <openbmc+bounces-824-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 545A2C135C6
	for <lists+openbmc@lfdr.de>; Tue, 28 Oct 2025 08:48:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwjCn2Xgfz3f6y;
	Tue, 28 Oct 2025 18:48:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761637685;
	cv=none; b=M0GCtx3/N42VrhKVNP5+2buEs4eBMVnVGq3h+LohCKOlf6yYxz00BU8rtzs/vAjojhXf6UKpKFAfEcpNQhXOUQGkFJXxToW6T+EjkK1tdCE9/A6QPeHDCPqDUUCUch0weaLvHOwTS+RPw+0XxLJUmxav8mGoQrEdG1xQhzw3m1V5NsVUwZxUVjAC2/S6yIIX5kjWnvlRifpArkkj6Wdxk9tDzK0QxqepFnJS6BzCqt/xpIa9PnhIsM+uaozk+7QL6FARP5PJLRoeXfTnkYKuYHwQ/IMfaeOaGcOYC5kPNWfs/5DrcMyC95MsZOIniaV9GHWj1cSzAIPyiSRW9BWhBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761637685; c=relaxed/relaxed;
	bh=QL8VsAg1at7SuW5tNZ8SM68KMxfARdF7RwLyGMZNOH0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Itjrp7RrnQE4so+57uqYqgmndmFQRxjTAGRKdd/dvB6xj22k3lesgBOMeAMZ2bmX0C4efveIfKTSaw2r/n2sBMk3ahfV4pPVa/PPauSF0EvW3bzbNfyaq+QPoucmsPZ+DOTTKCVKQiXrSOSokQ2EjHCp8Wu1hdAuOWHNhEaCBTpRTTMecq2YdmIjwN4K1huRk3oWrLWA6W121jDwn5YCwCM2wQ4aRFKBFTIYvxaHw3T8M0K0m80DomhxdV4hOfQlg3jE6vy0vjMftOql7OwEqle2Hmk7UmsnxUx91BJyNMohns6VDFQaiuPQ+qrbWen0+ifoIgsQlhOelouURXMtSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JSp4dhCX; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JSp4dhCX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwjCm1Xhzz3f29;
	Tue, 28 Oct 2025 18:48:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E8046027E;
	Tue, 28 Oct 2025 07:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD480C113D0;
	Tue, 28 Oct 2025 07:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761637681;
	bh=KClJh703ruviggVORWywOzunQO6HBuBT/e1jnVpnPXc=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=JSp4dhCXz/ltiFCTPO0JZcMRQ0fsKve6CAnHmMlvgGjKIsE9cs2S5JvV5W2MW7nAn
	 82HXAZqM6GUp1+SVIebgExEctwbw5eR8rdTw73RBFVFYfA+vDmsp+U4HqdAgSoU5F/
	 /TKhjJf/vrUuHq96xsIZAhivbBsQ/tgYZuM83LA1aYES/wvftOKN+q0du0hlugp8Sz
	 fa01y6qXoBel8u57qib+5TEcobWqo/i4L+Cz73uiN0CdPftCQZDwWT1lXiIESFogAy
	 6OQvGLFdXKq9D1mZ7L2/12L7C9M+hmgdIEAFAJ83G+sJ30s0jnr9tUhLF61qe4Wa7r
	 a9BW8d4ARqz2g==
Date: Tue, 28 Oct 2025 08:47:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>, bmc-sw@aspeedtech.com, 
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org, jk@codeconstruct.com.au, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de, andriy.shevchenko@linux.intel.com, 
	naresh.solanki@9elements.com, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
Message-ID: <20251028-ingenious-dazzling-jackdaw-af487d@kuoka>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
 <20251027061240.3427875-3-ryan_chen@aspeedtech.com>
 <93a2ff5f-2f8e-494b-9652-b93bc243c229@kernel.org>
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
In-Reply-To: <93a2ff5f-2f8e-494b-9652-b93bc243c229@kernel.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 27, 2025 at 08:14:45PM +0100, Krzysztof Kozlowski wrote:
> On 27/10/2025 07:12, Ryan Chen wrote:
> > The AST2600 I2C controller supports three transfer modes: byte,
> > buffer, and DMA. To allow board designers and firmware to
> > explicitly select the preferred transfer mode for each controller
> > instance. "aspeed,transfer-mode" to allow device tree to specify
> > the desired transfer method used by each I2C controller instance.
> > 
> > And AST2600 i2c controller have two register mode, one is legacy
> > register layout which is mix controller/target register control
> > together, another is new mode which is separate controller/target
> > register control.
> > 
> 
> This implies your "reg" properties have now completely different meaning
> and this would be quite an ABI break. We discussed this probably 15
> revisions ago. Where did you document the resolution of that discussion?
> 
> >  
> >  unevaluatedProperties: false
> >  
> > @@ -57,10 +85,12 @@ examples:
> >        #address-cells = <1>;
> >        #size-cells = <0>;
> >        compatible = "aspeed,ast2600-i2c-bus";
> > -      reg = <0x40 0x40>;
> > +      reg = <0x80 0x80>, <0xc00 0x20>;
> 
> Not relevant to this patch. You just added this line in patch #1, so did
> you add incorrect code just to fix it right away?
> 
> No, fix your example when creating it.

Heh, and this was not even tested... you have warnings here (see
maintainer soc profiles).

Best regards,
Krzysztof


