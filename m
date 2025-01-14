Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1383FA11583
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2025 00:36:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXlqr1KbGz3dBV
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2025 10:35:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736897749;
	cv=none; b=I/t85m/t4qFIvwFB6qd6fvDcFLAK0ACagghFudAUlJd3ChONoWJZPmWWLQvCRur2BzIQvz5YyeoL/+NPVn8wFoNmpn7P+G0t4GAFLB/axNnH4SOqNwH7iOCbaJBVPiB7J5Hefk5fblcsPaZZT8BVh6bpZ15TDrrqc7zsSe1+JqHWT1JEf1qkR2XvPTNAgXnBPd5/2Gv3+TxtVDMLWMquNHl0PjEJGjzWOVsJGuR8tmyk/2j7TU5Ga7oAdp3K5QiqU0cfbIhubGzCDAx/eOYhgmKl281xapI86tmA61uJRV8s9fWcAPr1DJyQoFVLrc2U4H10MubMo6YX9VGaU/2C9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736897749; c=relaxed/relaxed;
	bh=tc3Ep+dLYrxWDAVE5hbsYpi+HYF3ujM52ZOzbBYhtzI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O/l1hCsKJT3yCGk6PqB6aNdtmFtWwaa7jpbd+lDEKR0rAOVqOEy5EY3dc7Y3HdEd2G/zDEC2GK4eXKlmTm/8ZRAR/rM7bGsrJDxrmUgSCHmmxu2X1RHzNxDdiQCsoP0uSlWBTuaQdG0ao/0S08QxeOhphy7AD+RT4EQCxiH79TrnNsqvV0xmri8bPbtsdFZ+uuXxSDenRDWKn4K4GNdBxEIpGQP0V+OqW2Zhl840WoBMnzBexapUJPOIxcXl+xVAu1jnngLFmK0SXPo7N45KGAYz5aAbzKqAZMFamqTWh82YZ9X7CuJS956ZvewLtJhjfsmOPxgb20jUj1/D76kNDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LuMe8JFs; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LuMe8JFs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXlqm6QjWz30f5
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2025 10:35:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05CDFA41B9B;
	Tue, 14 Jan 2025 23:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEF7C4CEDD;
	Tue, 14 Jan 2025 23:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736897744;
	bh=mAGMGtQrfQ3/Drlhgn5zGpK+PDYQqfFjj696cQz6oLc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LuMe8JFsedYcMeGaVXORNDg142CfYmNisZhtpqwVCaDZpjyHVd/hXlD/qXvosjt8I
	 A/POYMUWNOMF8A6PZ2mQ4RofXjmzJMKcVB79uodPNCzRZaVJA8fiyr2ll3BZ/4IG7s
	 KWAioX7Zj4HiHYTBKMOL5fz1c5swL5Vp1qad4HzDmQzlszZZ6rg9bBHqZDU0Nai7+S
	 KSwyb2dFL1xQv9w78LBlSTP+dxZlyvM7xUu7ERqFcwUXujEJJCq7kn2iw4ByCVOQNn
	 /CHuc6vQhTEleOA6ddE2V+QDmJN9DnL4YwlxMLHkoWVvOcl/PtRh4JTTjD5ICYGV33
	 1eIaBKz8ypkWQ==
Date: Tue, 14 Jan 2025 15:35:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
Message-ID: <20250114153542.29d10a04@kernel.org>
In-Reply-To: <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
	<20250113055434.3377508-4-a0987203069@gmail.com>
	<a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, openbmc@lists.ozlabs.org, joabreu@synopsys.com, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Joey Lu <a0987203069@gmail.com>, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 14 Jan 2025 02:49:31 +0100 Paul Menzel wrote:
> > +MODULE_AUTHOR("Joey Lu <yclu4@nuvoton.com>");  
> 
> Maybe Nuvoton can set up a generic address?

FWIW we prefer people to mailing lists in netdev.
Humans tend to have more of a sense of responsibility 
than corporations :S
