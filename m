Return-Path: <openbmc+bounces-214-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09253AD9926
	for <lists+openbmc@lfdr.de>; Sat, 14 Jun 2025 02:42:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJyB34BF1z30VR;
	Sat, 14 Jun 2025 10:41:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749830387;
	cv=none; b=K1um7Txbf1f9HUaoiFcG9yyH5fdRPa0aCQglaa+xGSbRKauKYkX4sTiNdBWYGBWnGJzeBjvCZgBmfHuRdJzggHy8gmEJBk+3toIAxu+u3VWu4Hb2aMOHN3KQ92LwWZFjXDXApBK9czUMpJ9OQLgw/VqHZypwuAIprPVxEaM++RZOImkRU8jyipYvlRYNLaP4wLq0vhh9gbpdO2q60nLS/sGmcKwh6mkiKY565cg0BRSdUMYru1i/xyw+IByQC97oMnDOWY7PWmnf+kL+/sAOp+h4/clI4kFVlv+0dfrH6VrItsdTTCpENP1OJIeMSU9xCv3fQN6hyc8R684B6KBiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749830387; c=relaxed/relaxed;
	bh=SQ7GUXRJXqTDf9P/Qm4haDbuby4wi4QGvJKfFQG9Ik8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=QFnxccQoGO7UYeWJsoFSsZrSJuinsR/fx7m+bDKLJZbE3R1/iHHlNEJvZuOYfJkFcZ/qd9B7dmGArwKajfspLfQAudEgMR8aVSlN6CxhMKKucngrmVUPi/VPQzqS0XuJ6E2CQRtlqTm7JehvIzevvyLs2UgxayOJP2mPduNPsgDEijkb8B7aKsAucPnKKc3BpV6wUSzEr/usIsRIF2rzyShS3E1Ki5jNQRzGEQ5B36fSYbfz9Lz0MHvnZi5962MYKFBePKMA4pVsm22DwLcgChcx9GW4F26N8PqZVeDh/rLjhCnmdcFilltcibaX76V8obwLJxZNZHf+3EusH02isQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n0zzX3fP; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n0zzX3fP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJkcL4fTfz2xBb;
	Sat, 14 Jun 2025 01:59:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14326629E5;
	Fri, 13 Jun 2025 15:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8987AC4CEE3;
	Fri, 13 Jun 2025 15:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749830383;
	bh=SQ7GUXRJXqTDf9P/Qm4haDbuby4wi4QGvJKfFQG9Ik8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=n0zzX3fPoRLTKtU+Wvdnf5IHXCu+A8x1xZNu5w/6wgOQjGKbQFeV/0lZl7mE6OVIl
	 LL5aVqs62RYkY/233ZAY7Wker72IKkGxfsiesN+3BPeO4JGA4e1fzISkzQqpi4cp6V
	 m400saPoJCII944lgT4+iD0UphSshRlzWNtAaIkt7walOyIdybnhSOKR94PEl6pJeJ
	 TT87n7a6/GvYSEqItedZbj00JjeSYf/eYjB6Fd+43MQyY/xIR3zdgK1MxjBTdr5JPc
	 cPeXPYeWLBpoYGUAeXaYGSh1ZwK4TOVV2g7jHOzZhqLb3fbymJctUrPkqdw8pigTxU
	 HHOSLHP8++VnQ==
Date: Fri, 13 Jun 2025 10:59:42 -0500
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
Subject: Re: [PATCH 4/7] ARM: dts: aspeed-g6: Add AST2600 PCIe RC PERST ctrl
 pin
Message-ID: <20250613155942.GA962477@bhelgaas>
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
In-Reply-To: <20250613033001.3153637-5-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jun 13, 2025 at 11:29:58AM +0800, Jacky Chou wrote:
> Add pinctrl support for PCIe RC PERST pin.

s/PERST/PERST#/ (subject and commit log) to match spec usage.

