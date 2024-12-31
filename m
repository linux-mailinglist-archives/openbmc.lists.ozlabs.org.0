Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B069FEC04
	for <lists+openbmc@lfdr.de>; Tue, 31 Dec 2024 02:04:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YMZVM59mHz3bwf
	for <lists+openbmc@lfdr.de>; Tue, 31 Dec 2024 12:03:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735607033;
	cv=none; b=AlCZPIi6rUgxV3x2gBjXA2HKyduM/2sa0HpxOKsUvwXUA4ksUWyTpGTlPwX2fKPMShoVjbUJwM0FdozwjikhaCBTyXfnzgKUhOGd2/wpwy9OIcfEd07UwyU1UqYRhN5LDZeX+RyOHHkwi1G6xc2K62LtuBRR6q6rC5UR2uRmpAC8h+jSlTv6v+svT2dFJUxXj2tLuChgBVF4C/VaagirNlcXXMdFgdq66mCNSN2hrFTJZG+0Ib2IYuT2m8x//GKMctjGIodXBqwcWqcelI1BsolZ+RC+xRsGHQgi7EBbf5rG7kq57CJDrjAZiepVm/RG+L2yWvgISZ76NIHKFcsbTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735607033; c=relaxed/relaxed;
	bh=X6KAD434ircXFlRJySWms6u2Woaxjz5VOipm3aKZlcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+0Oy3bYUz/cy2qb1HaGIlI5ikKtFA7ZejZTr76tXdf60ickDL3P4phpk2xLqDNeid7XoK+V0XJ6Hl5jWTIBCmMiTKgYwFmFXcgwuv8ma9GkdVlPPF9BlZycanVmQ01rXukrsRIk9AKcPQC+l8mPn1QQ2xUTpaX15BWiqGgWrmZra0uKT8ECldfxAzbJ009hHGePS+WY40HiOOM4YPb6MlzvmPjeYH7c4S2vm4qDg9uUm5EMDGGgcl1IB6l8H3YYTu6vOr0mLaBuBsvWXAp88tg9icDQtZMh0M113A/G/Fxgiitp8Hurbl7KS6bz+xfGkPVnHAQcQ3ZqNQEkm4I3Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hzlu31/j; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hzlu31/j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YMZVJ27Jfz2yZN
	for <openbmc@lists.ozlabs.org>; Tue, 31 Dec 2024 12:03:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A33BDA40EDA;
	Tue, 31 Dec 2024 01:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68679C4CED0;
	Tue, 31 Dec 2024 01:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735607029;
	bh=SLxVkcGz5+P4J5d9OZXZNHaIHpMJMKM6U+t5J5uXOlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hzlu31/jwQayZ+6h16cV9QCGnBLyML0qXHeAdr0dzUvQWfXyMYdfJtupRRqI4tfQS
	 yGcmMtJcRKXM9M8sCZzjsOQawmQ4GXWYxSHU1a1GyCqmlmK4sLKd127Aq1fB//2iT2
	 RQDiO85C43tqGgMdndYJ/07ypdYuL5Nwiq+31P2sGvzd20lZZzXddyoA0FBHMiinBX
	 cmaH/FPHNNO1I9m35mZM+yCh15/DeZqfdLXGOlqHLLfdC9JtazvU78caF7+QU7nqjn
	 r91WIQFDeAUL+ozLoT7oe68FW9Mzt5F4Xjl10hRTl522swAEsucTZvNRA5c5fBiEi2
	 RJMqASaIdbSwA==
Date: Mon, 30 Dec 2024 19:03:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
Message-ID: <173560702701.2856960.545232938075412224.robh@kernel.org>
References: <20241218114442.137884-1-a0987203069@gmail.com>
 <20241218114442.137884-2-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218114442.137884-2-a0987203069@gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, davem@davemloft.net, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, ychuang3@nuvoton.com, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, richardcochran@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Wed, 18 Dec 2024 19:44:40 +0800, Joey Lu wrote:
> Create initial schema for Nuvoton MA35 family Gigabit MAC.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

