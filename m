Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B3A86F62B
	for <lists+openbmc@lfdr.de>; Sun,  3 Mar 2024 17:37:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=byLmC7rM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TnnYV6v4Wz3d40
	for <lists+openbmc@lfdr.de>; Mon,  4 Mar 2024 03:37:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TnnXs54l0z3byl
	for <openbmc@lists.ozlabs.org>; Mon,  4 Mar 2024 03:36:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=tSswBdIcszDJoDe9Vi8pnuS2WTvFPCmOZO051C3dxKM=; b=byLmC7rMmjeLz0US861q1IrR7R
	IQbPqrmvZLo+d9gIbCSHG1dzWeOCiwoo9J0+pQRIfrybvbIRarvyosXTpVwRiMGjlDnRI+vgQBrhW
	m6YlLLdXfwuqsNal5V2vZnPjOuG61Y29ges0vQu2a1Bxd9DXUR+HmWjGPwDNo5nrB4MvlBGu9vmMe
	aRTEyUVbR5lg7i8k0X05EpsQw03v6OyDcPwI8OB2QkhbJ4KfkQqKjNUDxPXm3auq2oUUmj871eJ2P
	1/P3MixwaR7KnoUPEZqL/cmwbjLFzXPKTKKM7YyTzFZr13pXSS4hAQ6B/sQ7EbYvrT37BAb0weNdM
	kjfkxXOw==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgopZ-00000006IUw-1oWo;
	Sun, 03 Mar 2024 16:36:53 +0000
Message-ID: <aac03d82-1a07-457e-af5e-f125e05c66de@infradead.org>
Date: Sun, 3 Mar 2024 08:36:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Removed controller field description to prevent
 kernel-doc warnings
Content-Language: en-US
To: R SUNDAR <prosunofficial@gmail.com>, openbmc@lists.ozlabs.org,
 iwona.winiarska@intel.com
References: <20240303134453.5791-1-prosunofficial@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240303134453.5791-1-prosunofficial@gmail.com>
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
Cc: linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 3/3/24 05:44, R SUNDAR wrote:
> /include/linux/peci.h:84: warning: Excess struct member 'controller' description in 'peci_device'
> 
> Signed-off-by: R SUNDAR <prosunofficial@gmail.com>

Yes, or
https://lore.kernel.org/lkml/20231223050605.13961-1-rdunlap@infradead.org/

so
Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  include/linux/peci.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/linux/peci.h b/include/linux/peci.h
> index 9b3d36aff431..90e241458ef6 100644
> --- a/include/linux/peci.h
> +++ b/include/linux/peci.h
> @@ -58,7 +58,6 @@ static inline struct peci_controller *to_peci_controller(void *d)
>  /**
>   * struct peci_device - PECI device
>   * @dev: device object to register PECI device to the device model
> - * @controller: manages the bus segment hosting this PECI device
>   * @info: PECI device characteristics
>   * @info.family: device family
>   * @info.model: device model

-- 
#Randy
