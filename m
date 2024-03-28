Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E2188F69A
	for <lists+openbmc@lfdr.de>; Thu, 28 Mar 2024 05:48:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VoJX3Ifx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4rdj1lFBz3vYc
	for <lists+openbmc@lfdr.de>; Thu, 28 Mar 2024 15:48:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VoJX3Ifx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4rd41KR0z3dW4
	for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2024 15:47:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZeyI246RdPv08pafnqQ6MRH7GAOmb2wa7EV6ApCd9zc=; b=VoJX3Ifx6dpNP2vF7afTf36fav
	OgDWRnogJsWpcVZoXmhAtotOqQds9MaIcnPYG9nDRG4jNZRciFvw2Dxy+CJm3tZ6L4QGVKiZDXrhL
	2n9J4s955Fi+NnRBhCYmiGtgTQbNIfhByhNb4os8T4twId1MDPeBrj9wpmPwa6Q19BDh8HdhkKNVy
	A60/sOHE8EaI6PYlAOQs6kSOj6YeTkA0bJqit5hP0KH1gWmc0lHUlvEpr8C3uhsGL2rqV3IBnBkck
	CmuWpR/59SewYTiJ5FCUjYWoy8eLLxiu0cCX0sTvxAuqaarZwcuj+6w8C27Yz4gdSYFSYRvdjuu2x
	fFRuWunA==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rphg5-0000000CQcN-4Ak9;
	Thu, 28 Mar 2024 04:47:50 +0000
Message-ID: <d9bf12c1-4d21-40d4-9abe-95a4d8b59d8f@infradead.org>
Date: Wed, 27 Mar 2024 21:47:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] peci: linux/peci.h: fix Excess kernel-doc description
 warning
Content-Language: en-US
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20231223050605.13961-1-rdunlap@infradead.org>
 <a3ea93b54911f553a6ca37d33181be0cf9f89b07.camel@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <a3ea93b54911f553a6ca37d33181be0cf9f89b07.camel@intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 1/10/24 06:19, Winiarska, Iwona wrote:
> On Fri, 2023-12-22 at 21:06 -0800, Randy Dunlap wrote:
>> Remove the @controller: line to prevent the kernel-doc warning:
>>
>> include/linux/peci.h:84: warning: Excess struct member 'controller'
>> description in 'peci_device'
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Iwona Winiarska <iwona.winiarska@intel.com>
>> Cc: openbmc@lists.ozlabs.org
> 
> Reviewed-by: Iwona Winiarska <iwona.winiarska@intel.com>
> 
> Thanks
> -Iwona

Hi Iwona,

Who should be merging this patch?

Thanks.

> 
>> ---
>>  include/linux/peci.h |    1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff -- a/include/linux/peci.h b/include/linux/peci.h
>> --- a/include/linux/peci.h
>> +++ b/include/linux/peci.h
>> @@ -58,7 +58,6 @@ static inline struct peci_controller *to
>>  /**
>>   * struct peci_device - PECI device
>>   * @dev: device object to register PECI device to the device model
>> - * @controller: manages the bus segment hosting this PECI device
>>   * @info: PECI device characteristics
>>   * @info.family: device family
>>   * @info.model: device model
> 

-- 
#Randy
