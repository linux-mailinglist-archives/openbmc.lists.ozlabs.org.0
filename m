Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90706744CFA
	for <lists+openbmc@lfdr.de>; Sun,  2 Jul 2023 11:31:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hGPGcOTI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qv3hx33whz3bYm
	for <lists+openbmc@lfdr.de>; Sun,  2 Jul 2023 19:31:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hGPGcOTI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qv3hJ3bwRz301Q
	for <openbmc@lists.ozlabs.org>; Sun,  2 Jul 2023 19:30:56 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0975B6009F;
	Sun,  2 Jul 2023 09:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11374C433C8;
	Sun,  2 Jul 2023 09:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688290252;
	bh=xjHV4sdeVIGEpol9xkidrQ1DFQ3NwBTf+3YghSU+NVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hGPGcOTIyIrwobrQzzjRqG8vKsNacc7i1lQdAh4YHL9EPRC+d9JkmbuCgQ6OXj0PH
	 KXJumXX9z/RC0FNsyWLWwHNYNqT5Pbzo/P3qmA6TezWU0Iubu5b7Hvn7IXrLfs+Azf
	 gPZpQMAXDjTiqLBMKkA9+dnkV080Bm/J/GnhfGVoqoq7BhUz5+B5Se1ARwIljV57dO
	 1TEY6cqo9dfTUSGplY6S48gCvJ0gOQlkiosaCA08F9ylXHb0VP/hO8lvnILf1fKpP8
	 l8bZJsnx0i+zvoUk2x//Pq9WkT5f3tBWPKasXKgQjnr2QyZDDHwV8Q2medyfUVm4bB
	 jXAFSNiceOkfQ==
Message-ID: <815354f2-1503-4455-1e54-41978216d777@kernel.org>
Date: Sun, 2 Jul 2023 11:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH linux dev-6.1 v1 1/2] dt-bindings: Add bindings for
 peci-npcm
Content-Language: en-US
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
References: <20230628090404.234965-1-tmaimon77@gmail.com>
 <20230628090404.234965-2-tmaimon77@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230628090404.234965-2-tmaimon77@gmail.com>
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
Cc: Joel Stanley <joel@jms.id.au>, kfting <warp5tw@gmail.com>, Iwona Winiarska <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 28/06/2023 11:04, Tomer Maimon wrote:
> Add device tree bindings for the peci-npcm controller driver.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Signed-off-by: kfting <warp5tw@gmail.com>
> Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>

My patch tracker found it, but the commit msg suggests this is not for
Linux. I mean, you did not intend this patch to be merged into Linux
kernel, right? Cover letter does not explain here anything.

If so, please ignore.

If not and you actually added some dev-6.1 by mistake, then regular
disclaimer follows:

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested by our
tools. Performing review on untested code might be a waste of time, thus
I will skip this patch entirely till you follow the process allowing the
patch to be tested.

Please kindly resend and include all necessary To/Cc entries.


The sad part is that I already said it to Iwona. I wonder if all the
comments were ignored or something was fixed?

Best regards,
Krzysztof

