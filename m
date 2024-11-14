Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9ED9C8168
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2024 04:19:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XplkD2S2zz3bmL
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2024 14:19:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731554353;
	cv=none; b=YaVKXH4Rrpf1lFMvmMpDhAeYkJcYpv8Pp6knt7gmigvhI9lcN3M799KjUxtdjVjEkO3WjehhhcrFNDMS8iCEJMqitCwf6HjHhSzE2XEXF3ZZ0aAEH42rtbSwl9dOm+M8BVzwaakOpIfPkA90Rk09CseSJwQCeJtH8KsM6IOhroyVVqW92WGpA/2Sn4TYazojcsqb3L1Lys4AMfE6gFLsUMkM4fYMxctCILjwm4KsWrf1pSdKivtCIR6RNzncITUr1Ux9Q0M3RZP75MWKgUOp1GkOS2WKW+dlZaLKXf+3aRwDCSWtWLtx0bbQxxbbXEFCl9IgU9lsEp2s076Szp5hvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731554353; c=relaxed/relaxed;
	bh=Urs/DcUApj0uGKM9NeJDRz7l+4sgH4wqrxLw+oSORAw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oSNasSa9gb7N0guzHS3Carqx6nM79DTAtqjcYBbPJe8GswEUt/5vwwK35GlhBBsfYRh1sMkO+X/qSrA6Xhzde35ndrzsa3FOL5QGfXYJGY5vkNsW81eUsB53AtjVAmyk5bHVXe/FK58Ava0UDvirDK/R3VditXTC1YNMHvbKVvO8WzJDSeGJC28qAsQ0mUlgx0y9hNPBplsJiXla3TzmZZoVjydJs3doYBuY0Wp40oUDR63l5iqBt3I/zXkp70hXmEt3TsrFwXG3kf9EBM75qZ2uz4yMs2Qnap1t+iQESZr20WNVsTAkovxhfTOJBJMOTb/S4D3UDdD/rsrGCHtoIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MYTYmt0Z; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MYTYmt0Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xplk84xb2z2yXm
	for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2024 14:19:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A22D15C5C0F;
	Thu, 14 Nov 2024 03:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37128C4CEC3;
	Thu, 14 Nov 2024 03:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731554350;
	bh=Yq1+6nK+LxMRxpgCo00ZoaEvjLTfqSrkJRDCOrj8YJk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MYTYmt0Zeb+GLahunFyo7ba2qGhn6Ao2p7cOMvd3FG6jwMdUrE9Lsmk0syPpvRaSM
	 A6UkDKgAg1u+/zP/+mbanWyOlaTn8ZDaLMcfS8+z97s4nGMsbDxq2DtllrRWTK58Qu
	 ZVA13UA6XjH1ObJdhzfXAbHhvoaP87AEfNyfHsUnbjXr0YD6Sr2XOf5cbTJYxJXEoI
	 9/A3ZFn0lXzV2eOods0xFCEjLVxh9tYo6XpkTWS/si+GwNfV54MIqBUIIvBeiw7HPD
	 qHXLxNVgPW9LVgl2HXUh45wa54m0SwmyvIU+DMOnDb+vke2YdQ2cCSuZuPN4ewRZ1J
	 DGZ3G3Pl5ErQw==
Date: Wed, 13 Nov 2024 19:19:09 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH net-next] mctp i2c: notify user space on TX failure
Message-ID: <20241113191909.10cf495e@kernel.org>
In-Reply-To: <da9b94909dcda3f0f7e48865e63d118c3be09a8d.camel@codeconstruct.com.au>
References: <20241108094206.2808293-1-zhangjian.3032@bytedance.com>
	<20241113190920.0ceaddf2@kernel.org>
	<da9b94909dcda3f0f7e48865e63d118c3be09a8d.camel@codeconstruct.com.au>
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Eric Dumazet <edumazet@google.com>, open list <linux-kernel@vger.kernel.org>, Jian Zhang <zhangjian.3032@bytedance.com>, Matt Johnston <matt@codeconstruct.com.au>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 14 Nov 2024 11:13:33 +0800 Jeremy Kerr wrote:
> > notifying socket in the xmit handler of a netdev is a bit strange,
> > could you do it somewhere higher in the MCTP stack?  
> 
> Sounds like that would be useful in general for MCTP, but we don't have
> a facility for that at present.  Any existing implementation you would
> suggest modelling this on?

routing isn't really my forte, TBH, what eats the error so that it
doesn't come out of mctp_local_output() ? Do you use qdiscs on top
of the MCTP devices?
