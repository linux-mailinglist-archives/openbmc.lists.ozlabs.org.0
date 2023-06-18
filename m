Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37247734540
	for <lists+openbmc@lfdr.de>; Sun, 18 Jun 2023 09:54:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D6mLCtdg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QkQCR0rrQz30Qg
	for <lists+openbmc@lfdr.de>; Sun, 18 Jun 2023 17:54:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D6mLCtdg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QkQBn72H0z2xFk
	for <openbmc@lists.ozlabs.org>; Sun, 18 Jun 2023 17:53:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 216CA60B51;
	Sun, 18 Jun 2023 07:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C38C6C433C8;
	Sun, 18 Jun 2023 07:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687074830;
	bh=i/GwCqNS4xHdNmyl3PuFSJYZpQ/bp/fCK4rTaAbcm5o=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=D6mLCtdgi79ZzJMNBCFsAKJGVdOwn8bcGoRZwy23XlBuWUrXZCnGbweQQSazNzyX9
	 riUs0KE5RW7JmWwT463Wi5HG2isigNpcUlkjtL1p8jbNU/dxCxpf/EfVQ3Bk5JBH7r
	 9uIjOLvRdbB6+Uw38lak74bUPoCb62Tp9KPrT3iY5E0Ip5V6vnQ/zi52rdRDqvZt0b
	 n9MeN4L5nSO4wAynoDftpb+S4FdrUzX3Wn0JxfQxn7SJLJH824RptrNn0uF1dNC8AC
	 BHuyFHZo6nQpT3D1eYts0wsrW7RtokcKQyexUSypaqi/nHMAlNXrGOku16NrcN5kF6
	 xpQdts2MbBz2Q==
Message-ID: <be07d762-ca58-4620-1a88-81d1362ae0c4@kernel.org>
Date: Sun, 18 Jun 2023 09:53:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFT PATCH 1/4] dt-bindings: Add bindings for peci-npcm
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "warp5tw@gmail.com" <warp5tw@gmail.com>
References: <20230616193450.413366-1-iwona.winiarska@intel.com>
 <20230616193450.413366-2-iwona.winiarska@intel.com>
 <2cf63766-dc02-0940-9d28-4c6f9a6b5661@kernel.org>
 <6db5ac93a4308640cf55b837727d437bce7a2430.camel@intel.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <6db5ac93a4308640cf55b837727d437bce7a2430.camel@intel.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 17/06/2023 23:21, Winiarska, Iwona wrote:
> On Sat, 2023-06-17 at 09:48 +0200, Krzysztof Kozlowski wrote:
>> On 16/06/2023 21:34, Iwona Winiarska wrote:
>>> From: Tomer Maimon <tmaimon77@gmail.com>
>>>
>>> Add device tree bindings for the peci-npcm controller driver.
>>>
>>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>>> Signed-off-by: kfting <warp5tw@gmail.com>
>>> Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
>>> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
>>
>> Please use scripts/get_maintainers.pl to get a list of necessary people
>> and lists to CC.  It might happen, that command when run on an older
>> kernel, gives you outdated entries.  Therefore please be sure you base
>> your patches on recent Linux kernel.
>>
>> You missed at least DT list (maybe more), so this won't be tested by our
>> tools. Performing review on untested code might be a waste of time, thus
>> I will skip this patch entirely till you follow the process allowing the
>> patch to be tested.
> 
> That was the idea behind marking it as "RFT", adding a note that "I wasn't able
> to test it on a real hardware so I would like to ask for help to test it on
> Nuvoton systems." 

Which does not explain sending patch incorrect patch or patch which
automation cannot test.


> in the cover letter, and sending it exclusively to OpenBMC
> mailinglist - to avoid wasting time on review before someone has a chance to run
> it on Nuvoton hardware.


Usually such patches after receiving tested tags are immediately
applied, so in that case your patch would be applied without review and
our automation testing.

Anyway, fine, to be clear it cannot be applied:

NAK, patch is not correct

Best regards,
Krzysztof

