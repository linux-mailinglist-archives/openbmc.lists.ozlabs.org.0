Return-Path: <openbmc+bounces-1447-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFYEM+8BrGkRjAEAu9opvQ
	(envelope-from <openbmc+bounces-1447-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sat, 07 Mar 2026 11:46:07 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD7A22B22A
	for <lists+openbmc@lfdr.de>; Sat, 07 Mar 2026 11:46:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSg163h92z2xqm;
	Sat, 07 Mar 2026 21:46:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772880362;
	cv=none; b=BjVwPWa3BLTMWSHauTs6tpIS/miE9VEOoIQPYCQIUepXY+WqXcIPJRUbZ/qhuQT+pJWMIRIR7yRDqiLF2CsMsx3QekAIH9FU23bcuWTYiNYxpo8p4eRgiMKA7CPLI5V7NZd0Pzc5EH2Ye3TKgofmGJR0yavMgHnmCK+Kl7/bVypsA0YSVGLBCLOhxQPnRYR8v4Hsr/2MNHwiCFgX6hBjYdyeWLt1FYEirHMMehpzOSqNzR0a7aB+emYnD7+8RTVy7cvBouLouEUerD8aO07SaZZ5A+yU0hhiEZ/Lr4e0y0wx1MNKJOb7jHuB+BgqaA9Irs3ekSqJRUtxJFUToFc5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772880362; c=relaxed/relaxed;
	bh=SXuyckBYLtwIY7dFkWyl9sWSGd1W5P+XTpcE5D1/nWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhOEtbc+y+zRZVoSdkZKomMdG/2939g3IO1p2qmJYoRT2UdUl8NLiQ+i/lpzlEORcarG+4w1pA0NtqdT+RZjSjP3xBCN7hPF3GGjx5kPKGQHBsJY2F33RtYqa1fczY0KUEom/x1ULch9bHP3O13x/FtZ5Jet0pO7xlf7iJijhaLN8R2shVxZp8jM7vFuTGeL/Feon3/IsqyTarwTl71XIXYSPxkd7Ky4L6Qyf9zZrK9RffLs9HSvWyO70Nm7oWigIdiGROphe5e2NtNAgzHqvu1H9khO0U8y8eOMI/+CHVtb7vt6t1OCtkywU0P7Ox11iomdqrk5Eli9G0wAUi4hsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u6nmCR95; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u6nmCR95;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSg150Svvz2xdL;
	Sat, 07 Mar 2026 21:46:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2497A60018;
	Sat,  7 Mar 2026 10:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4530EC19422;
	Sat,  7 Mar 2026 10:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772880356;
	bh=DdRhW/Ebu6ObLgaVXVQOgiAe0HAEyztDCaZQo72MRmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u6nmCR95KNIU0YfUVfVzt1d+1ZQjl5pVhYcgMjKgohKJHpjb9WFjWanAK5qtZ7ZqG
	 JAUCPGRvJuleUn82VWHgAFg25omEtmz2BBpK1AxLe1h7sK6TmygsY7SwES1hREY7YC
	 EhDXMJTNqC7EHd1VfYve4FtCGkvANhJJbYaF6l8e65/eXeklpF/g67ZV795i4Z0N/2
	 /oDO3aDgR3xgB169FQGWRnywm7yMlf3DBOkRlJM+ju3C/aDnbqNPWtdv01onOZOvxM
	 dHmoze+vlwLGbnUOmvZJTs6a2Qa82+xqt6/Wpb03E9M05nfNKe80zePYqQlH2m7TK3
	 TzosQHpKI+YSw==
Date: Sat, 7 Mar 2026 11:45:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: mfd: aspeed,ast2x00-scu: Support
 AST2700 SoC0 pinctrl
Message-ID: <20260307-dexterous-resolute-camel-cbae39@quoll>
References: <20260306-upstream_pinctrl-v4-0-ad4e8ab8b489@aspeedtech.com>
 <20260306-upstream_pinctrl-v4-1-ad4e8ab8b489@aspeedtech.com>
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
In-Reply-To: <20260306-upstream_pinctrl-v4-1-ad4e8ab8b489@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: ECD7A22B22A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.20 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1447-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.962];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[openbmc,dt];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,qualcomm.com:email,aspeedtech.com:email]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 08:40:25PM +0800, Billy Tsai wrote:
> The AST2700 SoC integrates two interconnected SoC instances, each
> managed by its own System Control Unit (SCU).
> 
> Allow the AST2700 SoC0 pin controller to be described as a child
> node of the SCU by extending the compatible strings accepted by
> the SCU binding.
> 
> There are no functional changes to the SCU binding beyond permitting
> the AST2700 SoC0 pinctrl compatible string.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


