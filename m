Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ABB96D0B0
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2024 09:46:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzrzC0fJzz3c9g
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2024 17:46:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725522404;
	cv=none; b=M1zMA4Zoz93UD9tLBwQwLdFCKxvVnvDbYoEXJJq3kyqlYoHMw1e9jyBTiyzJTQsD1g6vkqpfluEO+ailDFL4gzAWo5uSe+9bYcVOnBIZyLJlUWo1pyrFYmugm9TNkDwC4K4WuKe5w2JulxOCRUawQpb732dvK5VZJif1BWxWFT8/eNxcEkqZ+49fExPGp0ge4pSohGxuofDESMv4UwDJFiahnKP8gDPBuXIi3tH7Zx4FH5XXzRZ4RYJbr1GrAbs+NmE+2glZ+6uIOCXxLt5HHYLkfWTPOD34oInu7dZEZLGSEA0dc/KpbizoU/iIrkhkehsMfU+te1RUGkP2p+u/Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725522404; c=relaxed/relaxed;
	bh=KkpHYEUlojqD4egST17h/NJcHKTftwER4zMqeYHg7qw=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=jCtEg2Pbs7RYRE/vmpUvvouakcqRUhwX/2Cp/1Q5EHDFxJr5/L+oM7bY5T8RuLA3ioAg7X1w7rUdsVHaA7KZotzjF76EwtSDFHdNVtAetSgI3wCGRlkEfdNnXJfmeLe86fTx2lnsKGZZ69LftYatMVmCHqG84P71LxZwKjonhlBc7hKLDLhMEqClfhDBdYDFC3GRAnjR5t3s1Ck14U7Y9jIxW1Jp31SS+txRt9Ju7qq0ymyXlSnaZcJAIqZq39uLeAhkD8YQX0GVRNVjzi3wRsswwQFpt3W/QoPBUjX6XpnxUWr6TCKmYLDYWQ1i/qIeRJGoCSXnV3F69Q3hurcVZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QWBVVBWL; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=peter.chen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QWBVVBWL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=peter.chen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wzrz76M9Tz2xJ6
	for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2024 17:46:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C7EA5C0FFA;
	Thu,  5 Sep 2024 07:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB37C4CEC4;
	Thu,  5 Sep 2024 07:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725522399;
	bh=ZA2xtBa0ZD9doRYaDtQI6rey1VJXbSnib3Nj3waz1sU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QWBVVBWLPLUPKsa1B4jwatcUCnd9AB9Aq+Nu6f6W2MGoibG4OmY83InU+xPQKj5Fd
	 0Dh/SwWqWGD0nd1AX+AsGyEfclzNga+JpgCD6SrNz9Zd6GC1pEA6JUVcMubSWZexHN
	 H7wYxBMU+LUX71GYgMTLaIkE0563KP/MEf3o6djXM/08xpa1MdOig1AxfLVWyZmJUE
	 rpSVPSFm9Jfo8AbKkcmXEqSKJcUDIolxxacLwMxdOxwxJyXo2/vwAVHyPrdg3LkFzX
	 NvqTFMOqACEIrlnPKyWxBBeN9eSA673Ljv/CFPLacz0DhxJEtkz4g9GO/6LhfIgRoy
	 sp23g+wR/d8vw==
Date: Thu, 5 Sep 2024 15:46:30 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Andreas =?iso-8859-1?Q?K=FChn?= <andreas.kuehn@diekuehnen.com>
Subject: Re: [PATCH] usb: chipidea: npcm: Fix coding style with clarification
 of data type
Message-ID: <20240905074630.GA325295@nchen-desktop>
References: <20240903132535.15554-1-andreas.kuehn@diekuehnen.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240903132535.15554-1-andreas.kuehn@diekuehnen.com>
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
Cc: benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, gregkh@linuxfoundation.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 24-09-03 15:25:15, Andreas Kühn wrote:
> Fixed coding style issue: unsigned to unsigned int.
> 
> Signed-off-by: Andreas Kühn <andreas.kuehn@diekuehnen.com>

Acked-by: Peter Chen <peter.chen@kernel.org>


> ---
>  drivers/usb/chipidea/ci_hdrc_npcm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_npcm.c b/drivers/usb/chipidea/ci_hdrc_npcm.c
> index c89c68f41ccc..3e5e05dbda89 100644
> --- a/drivers/usb/chipidea/ci_hdrc_npcm.c
> +++ b/drivers/usb/chipidea/ci_hdrc_npcm.c
> @@ -18,7 +18,7 @@ struct npcm_udc_data {
>  	struct ci_hdrc_platform_data pdata;
>  };
>  
> -static int npcm_udc_notify_event(struct ci_hdrc *ci, unsigned event)
> +static int npcm_udc_notify_event(struct ci_hdrc *ci, unsigned int event)
>  {
>  	struct device *dev = ci->dev->parent;
>  
> -- 
> 2.43.0
> 
