Return-Path: <openbmc+bounces-1220-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A9FD391C7
	for <lists+openbmc@lfdr.de>; Sun, 18 Jan 2026 00:55:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dttr74hJWz2xm5;
	Sun, 18 Jan 2026 10:55:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768694103;
	cv=none; b=XedfU3B/o/Wqkxx2nSYKxMbrToRNgQphq0Kr5rD9i72cgbbfZ3A/U3El7vLXdJsKXmLnCz7E7nHIv+Q56UEPZznYDRiRuGkxlFSbYd2p2abXztfX8vwFlFv6/jymrLAiJ36BO6wEA54sg7v3mcqLsPaasVcMwr7cNKkFA0+9189ralsIOgRPbchxd+vQN3mSuELsf7fM/qeGAFEgw7HTlNiFptUmsfMFdNOJ4XifEiofGcRJs05Fo0AnrLSC0NcBAU2xqhtcm2qsrLd3ef4aHmoURMK0U0Z77dqciWpNkAklpkh20psGnLAKqjTaDvwMMLG9m7YW96EBvkdfe/3VSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768694103; c=relaxed/relaxed;
	bh=xBCCK4YiYlil7mdtloinVQAo6Jd0Tmjjp4MJCr/7Cqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=amG3SvpVNNMY7HxA8BEqJayXX4SBL8NckYqtXo/cup/agKN3S2e5eirRGmTI1C3BA4DVcpPiFWnA7pEyf2rvxt2h25mX2TRh9Yv85x3YXO80Ke07SN054qxqC1QLmyUDI6AQQk3yDX/dlasLPvOCfWvL03IZHISCmnwdrG7+/b4GR9KOpcPQk4b7UMPnhU6Y5Vi2BkoqBpIn01dgQIi7lI0obN/pY2i5zBnxltSkVqsfRLJAc/CSiyvcyGa6Fsh4W9S7AOTanCPcrGyzSVwu9zmhpT1isUKzPqQUjD7CG9CKhfxlWYOL1Bv5m9QJJuU66vvqIJCSm4EOkOyJ8Gjy/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org) smtp.mailfrom=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bit raw public key) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dttr63pWDz2xLv;
	Sun, 18 Jan 2026 10:55:02 +1100 (AEDT)
Received: from [10.0.57.151] (unknown [62.214.191.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 30E864C4430066;
	Sun, 18 Jan 2026 00:47:01 +0100 (CET)
Message-ID: <ccb6b5b3-84cd-4197-a770-7e626c1ddcf3@molgen.mpg.de>
Date: Sun, 18 Jan 2026 00:46:57 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] spi: spi-mem: Protect dirmap_create() with
 spi_mem_access_start/end
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
References: <20260117134216.595436-1-chin-ting_kuo@aspeedtech.com>
 <20260117134216.595436-2-chin-ting_kuo@aspeedtech.com>
Content-Language: en-US
Cc: clg@kaod.org, broonie@kernel.org, boris.brezillon@bootlin.com,
 joel@jms.id.au, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 BMC-SW@aspeedtech.com
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20260117134216.595436-2-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.9 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	RCVD_IN_SBL_CSS,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dear Chin-Ting,


Thank you for your patch.

Am 17.01.26 um 14:42 schrieb Chin-Ting Kuo:
> spi_mem_dirmap_create() may reconfigure controller-wide settings,
> which can interfere with concurrent transfers to other devices
> sharing the same SPI controller but using different chip selects.
> 
> Wrap the ->dirmap_create() callback with spi_mem_access_start() and
> spi_mem_access_end() to serialize access and prevent cross-CS
> interference during dirmap creation.

Do you have a reproducer for this issue to test your patch? If yes, it’d 
be great, if you documented it.

> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>   drivers/spi/spi-mem.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index c8b2add2640e..85702a77b3c8 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -708,9 +708,18 @@ spi_mem_dirmap_create(struct spi_mem *mem,
>   
>   	desc->mem = mem;
>   	desc->info = *info;
> -	if (ctlr->mem_ops && ctlr->mem_ops->dirmap_create)
> +	if (ctlr->mem_ops && ctlr->mem_ops->dirmap_create) {
> +		ret = spi_mem_access_start(mem);
> +		if (ret) {
> +			kfree(desc);
> +			return ERR_PTR(ret);
> +		}
> +
>   		ret = ctlr->mem_ops->dirmap_create(desc);
>   
> +		spi_mem_access_end(mem);
> +	}
> +
>   	if (ret) {
>   		desc->nodirmap = true;
>   		if (!spi_mem_supports_op(desc->mem, &desc->info.op_tmpl))

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

