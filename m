Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D3BA66576
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 02:46:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGvnc2DPSz3c7b
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 12:46:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742262369;
	cv=none; b=aTKGhutI+vhsnYM56FSN6sHmmHZlxvnFZxBOFfOOYbP2m8482TFHpUYBs+X22qanWMxdthVHtnJMdTZbC2jUoExBcezb+Py7rjGFcZK8sbRHJ9HmYYG6jM979Xw+V59UUfeqdDoFgJJyErY8Zi6IQxYrdf2RZHIgPsb1eSgL9K9+H91qkpvzvxSQNgZgaeNfovDWuQBdMhc+czor/qjsH1rZ9+0DMQbQK7y/NOzCkO6j3pBASIb3K8mWoYDDmLer60DKZHWYkED9fo2VF+/knvkzSEsReZIlJ9sWE1LSmiyRiYHgEREJzz51vMXFtlygwh2TrqYj/ndnwlfFMFi9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742262369; c=relaxed/relaxed;
	bh=hCoA3QOiozZt2TEW+4yEG+YrETK1SwuW8BvHVs907DM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cr9dYgEcBUAOsIoD0WzzH33oGFxgwmAtk9wsrpaxOds4OxnHeyDEwV+H+Z8WIy4IEcn1GLNosfwrQJhyTM00aSd9csHdA1aOJrFdf+45DNiDDio2KVaNI82f8q0jzaxFrqLoGAgH/96wnnobZFGZF2lAn5K2u46hMCl1wxa3CWJ1WOj+PpMsaFQ1WDIdgMSq6GdhaeepyAcxmuFNMojewBtrSRbd8ERQKvJs83brrvsFu+P/Wj9gFKL67zPCS8oHk9JrelDkwcmM0i3qQEewgJlWgv2CLWCIDugoOzFIB9r2Lbti8QbTCuNnXVM1DmE91pg1+eqcsQJRXSQGfCTT7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PLFqnyNu; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PLFqnyNu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGvnX5dN7z2ySj
	for <openbmc@lists.ozlabs.org>; Tue, 18 Mar 2025 12:46:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742262368;
	bh=hCoA3QOiozZt2TEW+4yEG+YrETK1SwuW8BvHVs907DM=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=PLFqnyNuNSAtsuwcCUsJPlxz31N66GvTBAeAmzWfdg0fuqcC3eo0RZukDZQGm5+Lc
	 ohlFYsPCUDVw2QKzchYtQZDh5eCjl5/ZB5sm7AEmg5R8CUFgvYTeDPSj5KvYagHNrh
	 G/bvzf3NZDDoHk7xcp5BU9i1IBY/wVl4hNh5zatiSK3mmvvkHbPjQWYejVJ8REe9XU
	 WwwbyrJeMR4dAo4XkQCxF6Sk/l+9rxWB2AN0XvZUh2DjeA4Rin/Eax5cFQDkpfWX+0
	 XlB+eWRR+8KFoA0n7RlJPBgyc1mWPv2Oiw2z0/7YXGa9pDWpxmiFwmEdI7kisGhvpa
	 XvqiSSFG2rTew==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 04AAE77BB4;
	Tue, 18 Mar 2025 09:46:07 +0800 (AWST)
Message-ID: <dac64d1cf1f4cc7911b2652411a24fd7405bdb4f.camel@codeconstruct.com.au>
Subject: Re: [linux,dev-6.6 1/4] ARM: dts: aspeed: Harma: Revise node name
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au
Date: Tue, 18 Mar 2025 12:16:07 +1030
In-Reply-To: <20250312101250.3238182-2-peteryin.openbmc@gmail.com>
References: <20250312101250.3238182-1-peteryin.openbmc@gmail.com>
	 <20250312101250.3238182-2-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2025-03-12 at 18:12 +0800, Peter Yin wrote:
> Revise max31790, tmp75 and delta_brick node name.
> link:
> https://lore.kernel.org/all/20240412091600.2534693-8-peteryin.openbmc@gma=
il.com
> /

Rather than a link, can you (re-)create the series with `git cherry-
pick -x` so we get the upstream commit IDs?

Thanks,

Andrew
