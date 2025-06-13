Return-Path: <openbmc+bounces-211-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B2CAD991E
	for <lists+openbmc@lfdr.de>; Sat, 14 Jun 2025 02:41:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJyB13y5Fz30T0;
	Sat, 14 Jun 2025 10:41:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749830338;
	cv=none; b=QfHKMg0GaxGdnWBdyf4+jiIjPn8IwXBLNInh8mZnabL2hixOrSG8HH28xq/QV5Bjy5y3Hkw99ZVFKGzRWB8ij2hfD+KisGUd9HTV9+v4ofOk8qlv2tc+JifNQCC0f0KqPrSyozp3zf1A/TmGAFJmvf+jOALgSTV3gcDwf1iL+74R+G6ER52Z8bU8q7i40GwPCMXUe9RvEkwvTdRhlYPoMHTUQCa2WpbPRjlIKm1im5wePqOn0xCaMPc1V39vU/ESPIZre5gZBnqL8xpnBVcrEB5AKnRtdQ0Hey2NA/m8jYQZKEMjyEd2eHAGwD0HtoRjgL8kNfWoOmwLPQ+niRvMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749830338; c=relaxed/relaxed;
	bh=otyT+YaTJjPBX9e3RtgYlk7uAkCyCMfxu1qgrQAGDgk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=jgbJnUn1i8R6t9nSzpm6mMmndnKFCHq4BC/ANw+izP0SE934SzQo/JC2zgHEd7lrhX068soKMmFES/XB6M0/HQqIf97Luxy//zlF3HpfYPii/IQM7dV4mp+ipMGWe6Cpk3+/VvbKhQKlg0KXM49YIMgEqwdp2jZCSPtS2Heq8z3Sq184Wkg15piC6GPNZ3VzEgcVdEgmsT1VTMtgJcmDQUbevJNGmK6AnZcp0LtWsslDFxVHLwhIpl80PE9WbeEKTiBSdyLiJ6mG5g2rfwDZG2UWGlDG8+oS8COgo7xQgNd5/FZ8t9fC3TAgAl6vMgK1MsL1IVltF47I+lD/PLE2mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cb2gSlz4; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cb2gSlz4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJkbQ0K2Hz2xBb;
	Sat, 14 Jun 2025 01:58:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44535A51438;
	Fri, 13 Jun 2025 15:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B51C4CEE3;
	Fri, 13 Jun 2025 15:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749830334;
	bh=ubx0aSPirWzdiPRt3UtSIssQRIZ/h985GJfW7cPAiJ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Cb2gSlz42q4+9rckZbHNm9mmnaMRvUkvnKuTABMYiq84cfWP92JqlnKt4mc/n1poM
	 T1TVcBG64hgiXnN1aHOB/gmT48zyQJZyMuDYETaY5RHNIjn6CXyB0f5jMv+qNx8OoK
	 G2wnFuAqX6HtyA5hVjSFwbyd9k58RoaA+uERxSXQFNexM+5+E+YvraktV0HOcCYw+u
	 fzC/lxxv9xfphyGnR6gtAC8Of00o1jYtLjo/lL95F/0SKU3b6ob3iwvx57JLO+hoGw
	 hdtymaQhdLgvfyR0uQzoUfJDQErdB8E/NcxpoZN50++35IjeEINdfnkpPoGoPclMxL
	 RRUepl/Ha9XoA==
Date: Fri, 13 Jun 2025 10:58:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	vkoul@kernel.org, kishon@kernel.org, linus.walleij@linaro.org,
	p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, elbadrym@google.com, romlem@google.com,
	anhphan@google.com, wak@google.com, yuxiaozhang@google.com,
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH 2/7] dt-bindings: pci: Add document for ASPEED PCIe Config
Message-ID: <20250613155853.GA962329@bhelgaas>
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
In-Reply-To: <20250613033001.3153637-3-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jun 13, 2025 at 11:29:56AM +0800, Jacky Chou wrote:
> Add device tree binding documentation for the ASPEED AST2600/AST2700 PCIe
> configuration syscon block. This shared register space is used by multiple
> PCIe-related devices to coordinate and manage common PCIe settings.
> The binding describes the required compatible strings and register space
> for the configuration node.

Make your subject match style of:

  git log --oneline Documentation/devicetree/bindings/pci/

s/Add document for/Add/

