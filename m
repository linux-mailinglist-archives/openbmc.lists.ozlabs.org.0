Return-Path: <openbmc+bounces-1051-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05993CC812E
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 15:07:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWbGr0RpDz2yvc;
	Thu, 18 Dec 2025 01:07:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765980467;
	cv=none; b=S7vmYl2W+i3+XajeQS5qLR2fps/DGavD8VdrLqQjmbn87Iid1234JvFwLltniMi4Cz8gCj6RHPDfP59J41zze+Ls72eANVZTh4k9hDW72oHqL+WoaJyIUCBxnG3A8Cze2p0UuK9zN/Jq14xCrZDZWgwtgGC2369RF8alAh86GbD5e/EVHB2oQ6FHdy7hL2sW8/KdacS5ESAwui+XSk7lLb6DDW2MGJjpQxbymHos9xZE6Xdpx0BOuY1xK83ceOHr6xz8XE7KvaNR0+AAVncch+ptLGzM1l5mclh9MeIPF9hOdGiWhy8FNZfe96dZpoOUaBdWcJlYh53gdg8Cb+urag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765980467; c=relaxed/relaxed;
	bh=QUgIqK1Xxrn9AmObRt4JA+pI2mdjg2peBLShKt0t0ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBfUOrUy/zogfz0N6rWRU+4jvFRctns4tugF4WE57VgbpO2TL2PZkdR6YfiDuRllEHvASnZBFE6Xxvm6qnWK1+FAFFgREAzPwgGO6zETjNo+Gk64E7mu6fxsqZt07Iy7UTgXlHWQjTOHJjWev6zqcvyRLp5nowixHafr6kAutkHcuZy8mOLY4sj6DJlfvPNckJ21H9PB0IRDKzTBMyaQp/2UnpiLP5Pqll2tIF6bZQel/Z88hLUWzKGew1Us64GwOGgApn1w5qOCqk6tJDqYXUOvd7FNClyrTTLybwm+EG3qE5ioLiwWWxxuGxfnPnxOvRm+aoKzpPu4ArEg2kXDkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=COj/Z3nK; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=COj/Z3nK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWbGq338Vz2yvZ;
	Thu, 18 Dec 2025 01:07:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62282601A5;
	Wed, 17 Dec 2025 14:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7828C4CEF5;
	Wed, 17 Dec 2025 14:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765980434;
	bh=BBej7b2TZcIfv26VO07aVWI/nJSmjhBy+pY5L+9zcb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=COj/Z3nKklzgE1lymvXRLZGmg/6UR6V78uX8ycnn0SpbWOJFD//Tg/lKvkrv+zzpt
	 KJmm3fOvLHd4j4ZFg+6/uGG4WACNgTs/vdylLOhGT5TANFGTJK2lPvQN4/Z1QG26CY
	 Jj2buSSzuYkRB41d1MQmoOV6hGIL2FdNUHCgu0Uoo0WNYpPU2XS3yp5nwVsioshvWP
	 cGUceKKnL2caC3UC1OAflD7JMCoqIWXwNe8O5eaiMPqs7HJ2EMcAhYjt8I+IFQtxQs
	 3HlkLx7Kss0Kh/B/ENnxkaAwJxYiJzpVokdyTv6qtVRgPJfTodJSPLHuxzcH2dOQwj
	 Rwr2agbdZ/hXQ==
Date: Wed, 17 Dec 2025 08:07:09 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	openbmc@lists.ozlabs.org, Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>, Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v7 2/7] dt-bindings: PCI: Add ASPEED PCIe RC support
Message-ID: <176598042865.925447.819427829703405501.robh@kernel.org>
References: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
 <20251216-upstream_pcie_rc-v7-2-4aeb0f53c4ce@aspeedtech.com>
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
In-Reply-To: <20251216-upstream_pcie_rc-v7-2-4aeb0f53c4ce@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Tue, 16 Dec 2025 09:50:01 +0800, Jacky Chou wrote:
> ASPEED AST2600 provides one PCIe RC for Gen2 and AST2700 provides three
> PCIe RC for two Gen4 and one Gen2. All of these RCs have just one root
> port to connect to PCIe device. And also have Mem, I/O access, legacy
> interrupt and MSI.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../bindings/pci/aspeed,ast2600-pcie.yaml          | 182 +++++++++++++++++++++
>  1 file changed, 182 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


