Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1609F4FED94
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 05:30:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdSlj6mhPz3bXB
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 13:30:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=cjLFd/5M;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=d1cMYf5c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=cjLFd/5M; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=d1cMYf5c; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdSlC6FYDz2xdN
 for <openbmc@lists.ozlabs.org>; Wed, 13 Apr 2022 13:29:59 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 94AC55C022B;
 Tue, 12 Apr 2022 23:29:55 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Tue, 12 Apr 2022 23:29:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1649820595; x=1649906995; bh=ypRVjg4xA1
 22dRRcZGY3X1DPtS3yUxEDPkVPzP56wGY=; b=cjLFd/5M7NpJwGh/DQ74W0nUd9
 NIrFHt5uo/HFdW7bC2b5lb2V+c7eLHAJAHpzxBGqe1RnKXFdwEH+iqdA7yZNt0KS
 Jna97pOKbEZblh3L42V+Uf7WqfNu4SeC/V4ljF2U3zJZO9UImCq6k9jYSzx6ki+z
 GnqcQtnWDqe5Yj0Fh/CaX7WxfBh6Mc4bjGNJUsOZpO4z3nOHQjcPgJcioNWvtjP8
 pP7zdOFuwTmWo76TACndiyvRZoAXzGq2q5sWyjGEsxqZn46N8R4P5vM1N9+t19dD
 3biH+Ilzx7nrONAaBX2zuXX3h5455eQE53rCUyg7HNChEX2wvurrMA7Ji0qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1649820595; x=
 1649906995; bh=ypRVjg4xA122dRRcZGY3X1DPtS3yUxEDPkVPzP56wGY=; b=d
 1cMYf5cthDn9LOmGAHBp1V4PqvMkt2XwaXzlCEw3Sz4lJG6PQ1S2O4S/leYeOeCX
 HcjFVRGv/yO21/+maaXSpRZVnERnX8nEN42eda1tyRnIGMUSm2tqARvoFpUEO4EZ
 k3504Cot/Nq4eTLORVhPAxz4Q9ZnZqHfl6IGNc2I+AgFkxU4y/ia/ewpVvSNWlKY
 3XHLf2jSr69YwO10kneZJd3rkRXHi0hzezFsoAGbvNA1aTcYcTcGcib59ZD6dvB8
 21SdcuKdrujReePfcpNrsm7ybo8ERZkz+KtveWu6GA/MBZoGUS49zeAUHX6TpFrD
 u0XrSLcVTaY+eTm+LmUZw==
X-ME-Sender: <xms:skNWYi3WC6aZC7XEVGJN1M-c6WEWeIM_ShFXy85_vxj2M7K4ukwpUg>
 <xme:skNWYlG76BQoCf98YEncbTCm-QUlZxCB4syfW2bXwSKsqu60W9MvXHbdQaZMkAgeH
 vBdb4ihaK1VI22cmg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekledgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:skNWYq7fbuPClmqMfCnbyoTUSNwFlfAB4HueMhno2kTCEKpr6LD7kg>
 <xmx:skNWYj39dtB8aL4yrY8e4tXmpL-FCEJZhQ8p4ytH-pwlADqnUUWguw>
 <xmx:skNWYlFlrkCqeFaHlMgwaz6KtYA9UBdS12ldPtxuWOKmwrdbrxqicA>
 <xmx:s0NWYoMEq7yzL-WwyoWUp9f4xA4XqfV5aSm2qH8agx1rWL1fs_LJQA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D98F615A005F; Tue, 12 Apr 2022 23:29:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-386-g4174665229-fm-20220406.001-g41746652
Mime-Version: 1.0
Message-Id: <306d799f-e145-41b9-b9ec-4eb2a04b4dd4@www.fastmail.com>
In-Reply-To: <20220412215331.42491-1-eajames@linux.ibm.com>
References: <20220412215331.42491-1-eajames@linux.ibm.com>
Date: Wed, 13 Apr 2022 12:59:33 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.15] soc: aspeed: xdma: Add trace events
Content-Type: text/plain
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
Cc: Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 13 Apr 2022, at 07:23, Eddie James wrote:
> Trace the flow of the driver to aid debugging after an error.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

The only query I have is whether you considered prefixing the trace 
symbols with 'aspeed_' to match the function symbols in the driver.

Other than that it looks okay.

Acked-by: Andrew Jeffery <andrew@aj.id.au>
