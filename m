Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26240704680
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 09:36:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QL7Mt6vp1z3f8G
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 17:36:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T9cQpVQ5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T9cQpVQ5;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QL7MH6X0Nz3bl6
	for <openbmc@lists.ozlabs.org>; Tue, 16 May 2023 17:35:55 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 801B46106F;
	Tue, 16 May 2023 07:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A84C433EF;
	Tue, 16 May 2023 07:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684222552;
	bh=idzn8jz1rIMXrKUnYO4F1EQF3LLUxOJZOsoY4c9nWjA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T9cQpVQ50uyLtxYdgUANKs5lkMCeTqQ9uApT9wAaQPeNC13IT7O+G7mA2h4ERvzsg
	 BwhuSfPon2VAV5IJnRNnwIXQAvbzCZqETTVNLr8xx5tMuEYfoz/onEXOfPCt3FqOhV
	 mISdgWBjD7fTLN7e9KG4Y8F+dBCMQ32f7ZC+bwf7dqhTu/YYnaKa8hM7cqm0WSQE8C
	 uEa4c6bvuzmTnJiQEJWyqjwjNe2vQT76TvzcP3oOP3644y8lBnmaebuuvwJ5hExJ7V
	 rwduT0tcJ0zz7z4WiRM+NXh5/uM7o2FLnFei3bjciXA6HvshSNd/sURYoIxTb3XoVs
	 RrAFLafSTv0JA==
Message-ID: <b99a650c-4aac-8383-2995-b4bfb625d3e2@kernel.org>
Date: Tue, 16 May 2023 09:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: add Inventec starscream-bmc
Content-Language: en-US
To: =?UTF-8?B?Q2hlbi5QSiDpmbPmn4/ku7sgVEFP?= <Chen.PJ@inventec.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <28f0ce0a82464083ae24f9ef2f598425@inventec.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <28f0ce0a82464083ae24f9ef2f598425@inventec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?B?WWUuVmljIOiRieWuh+a4hSBUQU8=?= <ye.vic@inventec.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 15/05/2023 09:30, Chen.PJ 陳柏任 TAO wrote:
> Document the new compatibles used on Inventec starscream-bmc
> 

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested.
Please resend and include all necessary entries.

You actually ignored all maintainers...

Best regards,
Krzysztof

