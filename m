Return-Path: <openbmc+bounces-628-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A95B517AF
	for <lists+openbmc@lfdr.de>; Wed, 10 Sep 2025 15:12:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMLgg249mz3dBd;
	Wed, 10 Sep 2025 23:11:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757509919;
	cv=none; b=CDGsPw2TXdX3uoHS40iZkPatoJwWSQWXdhip0qBIQo+rwL2xhCuzrx6x9ROhWYr7uA3n+RYMZ6qjNMSP/dEsKgtOXzyxGUNeAJSbApNBFzZ46/eUevqs2nAbfSRRG2daRsJk56KAdpb3uruV3uKxHtz+H4yxTBqCxFNi9n0Ty+dGDLfiZoeA3Iwwo32pnVh6QrGFmQSHy/zpSvCY0GiPy0nlmwNRFK3CESP+fjbTvf0DYKK5iWlk61W1dufB7E7MBpeCEsv7D3ZmnAOVcg4DOkxUQaMWf92W+T9zOtMBDnyk2y2WBA8UJZ8F3Ix3fzzBwde6G9hfVr000tRGeYbLGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757509919; c=relaxed/relaxed;
	bh=8TgsJAPG+gvJuGo1mADyM4jldixKGYBoLgCB1sss4qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXTW9J2CHYnQ58J0MYuMwlo90+f3T6O+/dguAAsoL+bvqDe4N3c7AbzgZJXNNih8tZ+LJWRnkSWeY9LexBUR7ZodYp3oH6IMCf/1zWYS6OA0lO17AQGo5r3tUJMyUb3oP3AEn+BO670wMm3p1AKVVcrAcsWAJWebk5bAEAHl5jg0sp4UtReY6pC6bq6hRlS0vqmIZXz31bmxPDj5tbB5lU0wnAbSt2fXZbE+5huWV0khd/+s8dkxxKlQFzZ00PflN5UYjBzPDgu6bnEk4QvU7PiL/1XNapeq+uEgsfiKaWDfQ7cGR9HioJ81cFcu903BObu+gkpY4xJTnN/i0Z9OTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=lkR1tk78; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=lkR1tk78;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMLgf3yVBz3d0s
	for <openbmc@lists.ozlabs.org>; Wed, 10 Sep 2025 23:11:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8TgsJAPG+gvJuGo1mADyM4jldixKGYBoLgCB1sss4qk=; b=lkR1tk78PoV+Tma7HPr7R4vg4F
	89G9DYvsE0UEMbP3/X/fB068fW1Iba2c7JfnYajxoZlZ7vXiPSUusxi4rdETc8BwDacD0hfzRWikb
	F324HDIyWpZl/15fv3FvAq5siiiSaVLPbOmBefKd7SYlI8uqISsyAdq9a5wMbuSPg1Ss=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uwKN1-007wR1-Mv; Wed, 10 Sep 2025 14:56:19 +0200
Date: Wed, 10 Sep 2025 14:56:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, etanous@nvidia.com
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add NVIDIA VR144NVL board
Message-ID: <3114a51c-47a2-4b67-8965-33841ee87fd5@lunn.ch>
References: <20250910040601.240162-1-donalds@nvidia.com>
 <20250910040601.240162-3-donalds@nvidia.com>
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
In-Reply-To: <20250910040601.240162-3-donalds@nvidia.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> Changes v2 -> v3:
>   - Removed unused phy-mode property from mac0

> +&mac0 {
> +	pinctrl-names = "default";
> +	phy-handle = <&ethphy0>;
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +	status = "okay";
> +};

Oh, fun.

Please don't do that. At some point Aspeed it going to clean up the
mess they made with RGMII delays. And at that point, it is very likely
your board will mysteriously break, if nobody remembers it is doing
something probably no other board does.

	Andrew

