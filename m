Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 268916FDEBB
	for <lists+openbmc@lfdr.de>; Wed, 10 May 2023 15:40:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGbkc6pnFz3fcV
	for <lists+openbmc@lfdr.de>; Wed, 10 May 2023 23:40:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SmxRpjq7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SmxRpjq7;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGbjy712Gz3fXG
	for <openbmc@lists.ozlabs.org>; Wed, 10 May 2023 23:39:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5309560ADC;
	Wed, 10 May 2023 13:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740C1C433EF;
	Wed, 10 May 2023 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683725988;
	bh=or9xO+FxxGuS+uW8S4ooQcNLrLHD2LW4ES6g9p4l/Ys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SmxRpjq7ppDPNEpQg+L04k27bKVC7IcYKPySWI99KWektA7FO0TD/2DoBw/4rRCHE
	 8aTEsxzJ3nV2uXBN0p991RmB4J6mXNfrBPmhIEIdUWsvbeFFuchkko9O/vHK/xOKRw
	 KTC7t1QcnSZchetIVzi5eTt0gByadYxf6xp1Z1y+E5pckHivbYuLIzRnVQXZtmSDKx
	 bVW8pfyFr2mcdjViIA/K5H5MU42LSqTqzamaU8ETONjA+pEKKLDWKdFCwgAWgQhxey
	 RYsGfQlGdrk10ew5PquonzTN9j4KwtyfIkk8+Wghvs6IRbmohR+l+dir70wp1m0tGB
	 W39JW8sPxcygA==
Message-ID: <235478cc-b3f2-f22f-ec08-8d94c069796f@kernel.org>
Date: Wed, 10 May 2023 15:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add Supermicro X13dem system BMC
 devicetree
To: lesly895@gmail.com, openbmc@lists.ozlabs.org
References: <20230510105856.2066494-1-ryans@supermicro.com.tw>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230510105856.2066494-1-ryans@supermicro.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: andrew@aj.id.au, Ryan Sie <ryans@supermicro.com.tw>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/05/2023 12:58, lesly895@gmail.com wrote:
> From: Ryan Sie <ryans@supermicro.com.tw>
> 
> Add a devicetree for the new X13dem system.
> 
> Signed-off-by: Ryan Sie <ryans@supermicro.com.tw>
> ---

Also please include detailed changelog under --- per each patch.

Best regards,
Krzysztof

