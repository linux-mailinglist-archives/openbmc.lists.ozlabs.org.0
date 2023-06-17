Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51289733F49
	for <lists+openbmc@lfdr.de>; Sat, 17 Jun 2023 09:49:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G4JvpBw+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qjp7x1BFNz3bxY
	for <lists+openbmc@lfdr.de>; Sat, 17 Jun 2023 17:49:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G4JvpBw+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qjp7J38ksz305l
	for <openbmc@lists.ozlabs.org>; Sat, 17 Jun 2023 17:48:44 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 726D360302;
	Sat, 17 Jun 2023 07:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23592C433C0;
	Sat, 17 Jun 2023 07:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686988121;
	bh=cNVQrV5MeiTSBG6fqJ3O5X7C09FJV0FcFgQvtJkiPCE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=G4JvpBw+kIwHyhixbt4PqmnqFgOWGlrvEcZkIhxcXCKEgAXUOxV7ih6YIo/RcQcjw
	 Ax0qxZ7w2brHT+WNNg9JI5m9V0Orik0lDt9WpEwpIO884O6evBw3rrUTfF1VrjP+JD
	 mkZYa4l2tZ8EOxXXpMvkVynw/zoXgpVgKoh9GEUEgSZM0RzDqMmcy9TEavmaZ05aH1
	 5iVzyO2LwOaXiLRRjI4R0YlM3mO+RpNvPGYODOnBtpF1fVOIlJaSk6aNLzodH4W+HN
	 JiU/DpKbqvsSJi6vavFOwHARP+OOf/SZex/QOvInPxttbVwyquMMUawU8wV7urekYb
	 pERKQCZOrSa+A==
Message-ID: <2cf63766-dc02-0940-9d28-4c6f9a6b5661@kernel.org>
Date: Sat, 17 Jun 2023 09:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFT PATCH 1/4] dt-bindings: Add bindings for peci-npcm
To: Iwona Winiarska <iwona.winiarska@intel.com>, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>, kfting <warp5tw@gmail.com>
References: <20230616193450.413366-1-iwona.winiarska@intel.com>
 <20230616193450.413366-2-iwona.winiarska@intel.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230616193450.413366-2-iwona.winiarska@intel.com>
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
> Add device tree bindings for the peci-npcm controller driver.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Signed-off-by: kfting <warp5tw@gmail.com>
> Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested by our
tools. Performing review on untested code might be a waste of time, thus
I will skip this patch entirely till you follow the process allowing the
patch to be tested.

Please kindly resend and include all necessary To/Cc entries.


Best regards,
Krzysztof

