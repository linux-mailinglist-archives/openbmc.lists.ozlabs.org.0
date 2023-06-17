Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 618C2733F4C
	for <lists+openbmc@lfdr.de>; Sat, 17 Jun 2023 09:50:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E/31nVqG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qjp9159b5z3bws
	for <lists+openbmc@lfdr.de>; Sat, 17 Jun 2023 17:50:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E/31nVqG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qjp843JFQz3bx3
	for <openbmc@lists.ozlabs.org>; Sat, 17 Jun 2023 17:49:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5447C60A6F;
	Sat, 17 Jun 2023 07:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E88B8C433C0;
	Sat, 17 Jun 2023 07:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686988160;
	bh=Cl/d9wCnpW8Ooy07aZUN1fOHpnITaoNF27g17Sr6eNo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=E/31nVqGSriw0i990gSEVi7vGxk7V0u+OyCZZRsYWuEdBO8uLiFCe/MB9Tv+4SuM5
	 xgyOJnC+kO6I33fsxCZGO0nyeJKJNkkAjAiExNHSUruY7hFAKE+TezE9lZxPPY1FRM
	 noChV3jksTp1AzcOBBAP3E5oic7K0j0MRa1ydFmRdmodYLDXsvvxzZLcAxsCuJ5Fkx
	 9rBSjxuAk+32o/UuA3bBUIRJeZlK4FVOGZ3ig8vZWO60Xf4IQL6iWAke7r2eywYV34
	 QAKwfYcj+bts1Om4ktFmeg20Ii4tRHRFVrXPK2i8p5mc6IRHqCgj+b+o8o7eExjun/
	 S4bhCmnm5p4+Q==
Message-ID: <653fd8f3-5791-2b1d-d02c-c7e94ac2badc@kernel.org>
Date: Sat, 17 Jun 2023 09:49:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFT PATCH 2/4] peci: Add peci-npcm controller driver
Content-Language: en-US
To: Iwona Winiarska <iwona.winiarska@intel.com>, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>, kfting <warp5tw@gmail.com>
References: <20230616193450.413366-1-iwona.winiarska@intel.com>
 <20230616193450.413366-3-iwona.winiarska@intel.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230616193450.413366-3-iwona.winiarska@intel.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 16/06/2023 21:34, Iwona Winiarska wrote:
> From: Tomer Maimon <tmaimon77@gmail.com>
> 
> Add support for Nuvoton NPCM BMC hardware to the Platform Environment
> Control Interface (PECI) subsystem.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Signed-off-by: kfting <warp5tw@gmail.com>
> Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>

...

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id npcm_peci_of_table[] = {
> +	{ .compatible = "nuvoton,npcm750-peci", },
> +	{ .compatible = "nuvoton,npcm845-peci", },

So they are compatible? Binding did not say that.

Best regards,
Krzysztof

