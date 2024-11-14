Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AF29C8D86
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2024 16:02:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq3Kw04hfz3btY
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2024 02:02:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731596561;
	cv=none; b=fcm66TjZA415ObrVbVdtL/z8zpXV2qvLiJaVQ1kPNqRMaXPtUrsAaXUx9GmXyALS86ZCKoEhAtjVl4U9/dBc8nCX3NnMAqQ97GWF0t9ZH7MidLQGmHy0QHouSQcsw3bA8A6RKvLAHNpiz3PogcJPc8vj8J9iIp7rUtGmgPYpk/r6kCyntxwy92jX9UUeAGSHDxrZP1AXG1XIXsMEoKKjV6SyWYWBUEj9kti+q0NUBY+vsqe2oTFA+L5nfz2YQDkhA1wzgo9e8hRjEndS+QogxuM4A2xow3sUVLb+sNRvWJZej2XkoqkfC68wkzCT5PWCcvfZ4qlhpBIhghgFwDaGlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731596561; c=relaxed/relaxed;
	bh=gWmcEDivNjhTR7Asb/NoLrV12b3lcEZ194D1f6+Aj90=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K5Ilow8fbua0hTcNZfWvs1zkdtY5oFq0O538dO0AITxQcBRGzCmZuPtojc68X5mB6m7q0vW4EwKJERipNUkX6dN0m6H7WnOe6PRig+KYFdlJQrxgrPUgyNjfJZ+iEqFXAHOggSo2EGUA5ljTVuaSyCucKwtQS/0AAsuBdwGjpMP9aCOdERtNMb21ntL24yS/vJ1Q+hrqJRFxa+bESZZKInwZZlYnkFRKc9Ov1P0m2paA9O9lz9kVoKNOoesSfqYPX5g5+0XnrvNN4M8gz+0Uben+YzQ6TRuc8B2MJjQMsEt990IMgMRSXk9eK13F3RXiFBNfTu7NRaDBnS6mQymjlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WOVs1XoT; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WOVs1XoT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq3Kr1LyPz3013
	for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2024 02:02:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7CA505C5FB4;
	Thu, 14 Nov 2024 15:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2D3C4CECD;
	Thu, 14 Nov 2024 15:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731596556;
	bh=dN4tvL3q9pcjFqSpwP8uKkrWWNaEeL9R+qbXlxvJ5G8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WOVs1XoTZNNbTwcON3ExJl0NUWwZHgdMAROCIprysZMcxVLF215tsGcnP13WdCHxx
	 +2f+9wr+kfk5dYY/V1gIGg7Db6voSlLXymnJ0YkUtFoo6OIOzph/hO4HNjHswqksBK
	 xYg88qZHfVFVxv758KXVCys0hIsRuq4Q18inblgZqFixbNx7hD4h+OOntrpvUvdnab
	 WJRYGmkcKrBbF/iTfd5XpEgrZJqFtvxR6t+nDg3KxTSTXEBJ/nCGhTwkhoMcKy+azo
	 Rpo/65vWkT2H3qpJD8krVr6LESHH3NTB+NkGYmlw5RojqOXtenhaPjQIVbjC2VACoX
	 o71rNQakFzwTg==
Date: Thu, 14 Nov 2024 07:02:35 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH net-next] mctp i2c: notify user space on TX failure
Message-ID: <20241114070235.79f9a429@kernel.org>
In-Reply-To: <42761fa6276dcfc64f961d25ff7a46b764d35851.camel@codeconstruct.com.au>
References: <20241108094206.2808293-1-zhangjian.3032@bytedance.com>
	<20241113190920.0ceaddf2@kernel.org>
	<da9b94909dcda3f0f7e48865e63d118c3be09a8d.camel@codeconstruct.com.au>
	<20241113191909.10cf495e@kernel.org>
	<42761fa6276dcfc64f961d25ff7a46b764d35851.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Eric Dumazet <edumazet@google.com>, open list <linux-kernel@vger.kernel.org>, Jian Zhang <zhangjian.3032@bytedance.com>, Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 14 Nov 2024 14:48:57 +0800 Jeremy Kerr wrote:
> > routing isn't really my forte, TBH, what eats the error so that it
> > doesn't come out of mctp_local_output() ? Do you use qdiscs on top
> > of the MCTP devices?  
> 
> There are no qdiscs involved at this stage, as we need to preserve
> packet ordering in most cases. The route output functions will end up
> in a dev_queue_xmit, so any tx error would have been decoupled from the
> route output at that stage.

Ah, it's the driver eating the errors, it puts the packet on a local
queue and returns OK no matter what. The I2C transfer happens from 
a thread.

I wonder if there is precedent, let's ask CAN experts.

Mark, MCTP would like to report errors from the drivers all the way 
to the socket. Do CAN drivers do something along these lines?
