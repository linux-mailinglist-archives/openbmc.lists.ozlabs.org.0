Return-Path: <openbmc+bounces-1367-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MQ6LAVMkmkLswEAu9opvQ
	(envelope-from <openbmc+bounces-1367-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sun, 15 Feb 2026 23:43:17 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCACD13FE9D
	for <lists+openbmc@lfdr.de>; Sun, 15 Feb 2026 23:43:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fDgsl6KSNz2xlk;
	Mon, 16 Feb 2026 09:43:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770980781;
	cv=none; b=k+uthNu+fTji9eiTkL5jUpsawciLxZ7KHAGDwJ5B3B9LyTsCJs2dwfrkkc06Z84CiGabnGkT/4Si3uaW4D/UKlQ739WDzIYl4r4Jf+tAiQHy6pNItpLZ49gw2XfCj+Q3rDYj/2RtqnFaIHSZbv+13rNRrPnF/o35z/lm2qR6P/11Tou2BNw1/OIQ3liYEQUZ2fJ32HNMnmfqRyyqEfYzK2pyESTJJkGbao7QELyb7DQqgl0Fzkhv3aYVpGNxrst+JUgMLVvjRGqq+y+INsyM2oAZAHIger2r0Kh2jWVOvZb1Z2e5+KBRfdl7m56kDSwT/pSpp925jtfKgnBFsv2OSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770980781; c=relaxed/relaxed;
	bh=DkXQFRF6rnThdSPYfiSLSD241i5nICJqc3BVoN723YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTmwCwkSYcVvbG6qg07vSF+h6srEFdWRdT7uOiNZ775yWXNqSqo1Hq/z0hEe3y2U2UTJd4LjWngfFQr2uhlmhwajpUbNxQg2ASTY8+q0XOFOYGYOBciqg02h64+cR9OU++054s7z490OjLJXtOpkPNCEi0CNhueZZI1xovJKUIv5BJtif50uB9uRNb8V6YwWE3KmUHAmLrOqOdIv2e/Kb8++HCYrQRCQ1yY1HLqN2aNUnZii3P7kVxfdctRsIdyiFxm6RtLGbZOORu4m568oQ7t78vwIQo6ReEq16i6/EQhnx+1ovNDZXA23SSOSChdWqEOMkBR2O6bvEoXUGqn/nA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=X2g2njXx; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=X2g2njXx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 351 seconds by postgrey-1.37 at boromir; Fri, 13 Feb 2026 22:06:19 AEDT
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fC8Vh05BPz2xdY
	for <openbmc@lists.ozlabs.org>; Fri, 13 Feb 2026 22:06:18 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 4BD63240101
	for <openbmc@lists.ozlabs.org>; Fri, 13 Feb 2026 12:00:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1770980421; bh=DkXQFRF6rnThdSPYfiSLSD241i5nICJqc3BVoN723YA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=X2g2njXx8+MMcA1akYv0HBbC7bzhH2RhKZOuCe4Y+A3rLk4Z4A3FGrb4CsD6yxekR
	 PVqW9rTvuIrYzpxlhT8cU7yVFspBhPU9o9XUSMICBnqhU4VVsWoLqZFFsPeqqBHnlm
	 6Gm0Xk7T/Nus/kc93Ih5uAqxSEy2SYBUcw6TBpymXddppHDCa30iBQEEMg+oK+JfTr
	 hvFFOGSD+1ZFAZBBg2O/e5PEqW0zjfFGQ6bKlXx8yGgacHRTOzeJxTP2V4LBdWfFkG
	 oJPPxd0hbKT5BNziMjyetQIrTti1PwSJKUkTiwmkoQ0NECNAFW2VxWm2BEBgjupSI7
	 hloV7W8ny+HFw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fC8Ml6gzsz9rxF;
	Fri, 13 Feb 2026 12:00:19 +0100 (CET)
Date: Fri, 13 Feb 2026 11:00:20 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: wpcm-fiu: Fix potential NULL pointer dereference in
 wpcm_fiu_probe()
Message-ID: <aY8EQ_7Oho-5BeM_@probook>
References: <20260212-wpcm-v1-1-5b7c4f526aac@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260212-wpcm-v1-1-5b7c4f526aac@gmail.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.80 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DATE_IN_PAST(1.00)[59];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[posteo.net,none];
	R_DKIM_ALLOW(-0.20)[posteo.net:s=2017];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:broonie@kernel.org,m:openbmc@lists.ozlabs.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[j.ne@posteo.net,openbmc@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-1367-lists,openbmc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[posteo.net:+];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j.ne@posteo.net,openbmc@lists.ozlabs.org];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[openbmc];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.net:email,posteo.net:dkim]
X-Rspamd-Queue-Id: CCACD13FE9D
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 08:41:40PM +0800, Felix Gu wrote:
> platform_get_resource_byname() can return NULL, which would cause a crash
> when passed the pointer to resource_size().
> 
> Move the fiu->memory_size assignment after the error check for
> devm_ioremap_resource() to prevent the potential NULL pointer dereference.
> 
> Fixes: 9838c182471e ("spi: wpcm-fiu: Add direct map support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---

Seems reasonable.

Reviewed-by: J. Neuschäfer <j.ne@posteo.net>

Thanks!

>  drivers/spi/spi-wpcm-fiu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-wpcm-fiu.c b/drivers/spi/spi-wpcm-fiu.c
> index 0e3ee5516587..0e26ff178505 100644
> --- a/drivers/spi/spi-wpcm-fiu.c
> +++ b/drivers/spi/spi-wpcm-fiu.c
> @@ -459,11 +459,11 @@ static int wpcm_fiu_probe(struct platform_device *pdev)
>  
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory");
>  	fiu->memory = devm_ioremap_resource(dev, res);
> -	fiu->memory_size = min_t(size_t, resource_size(res), MAX_MEMORY_SIZE_TOTAL);
>  	if (IS_ERR(fiu->memory))
>  		return dev_err_probe(dev, PTR_ERR(fiu->memory),
>  			       "Failed to map flash memory window\n");
>  
> +	fiu->memory_size = min_t(size_t, resource_size(res), MAX_MEMORY_SIZE_TOTAL);
>  	fiu->shm_regmap = syscon_regmap_lookup_by_phandle_optional(dev->of_node, "nuvoton,shm");
>  
>  	wpcm_fiu_hw_init(fiu);
> 
> ---
> base-commit: 9152bc8cebcb14dc16b03ec81f2377ee8ce12268
> change-id: 20260212-wpcm-d86f76761645
> 
> Best regards,
> -- 
> Felix Gu <ustc.gu@gmail.com>
> 

