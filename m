Return-Path: <openbmc+bounces-1386-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKbrFbw0lGlAAgIAu9opvQ
	(envelope-from <openbmc+bounces-1386-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 17 Feb 2026 10:28:28 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA0514A615
	for <lists+openbmc@lfdr.de>; Tue, 17 Feb 2026 10:28:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFZ7r2wcSz2xjP;
	Tue, 17 Feb 2026 20:28:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771320504;
	cv=none; b=KNyQCvm9h4dTQQtXsY06pchdtYlFzS0oSymZKqb4tyq+Hu5cYwuGpZsqWTIoiUOFGGna4MrqmUdQs/hupBc6upEFNK9qcKSVEwERV/7Lt4M10Hu0sexq917lAKGDLc2peEkONQVF5MZBdomJNjMs3FcRcgZGYFd4oVnr8ny2u62e17lS3PXLSBUuqoFQvXwZmWEHQOXPkqVbckPSUzGgsUpAJUdxUC+ROtcPlk1cyRljs7MvWPPej6NLmBzg5jXrIwytW/ZzRspEmWrVxyEXDfz/jvdOqdkYco2d/bYHThFedjfOa1woTphi9zZw1UUmyFjjXxq9HD/izC3HsLKI/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771320504; c=relaxed/relaxed;
	bh=O/S5VUjeYzS0dHzM+pMjM28XHQF513QXXGU826VAc9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=kzYpK4bcU/3XkVe0J5B7cGgYlK2RqznZ6OoPP5+TLsZ+oWmY5ma0BWdsKSlgg/zi4cfjtVP0j0pMPl+fDV8Ao9G+AiQWNRTQ7idTdxr+CAmhyvtk6zk9bhupk4LEJd87Mv6MB5iRnyrJWtk45ioPGYFZFYFJtJDwBg9igFw/McOUI7Q/A9M9AB/TBiIvd1YL9NMaQNLhNFwU4r9yPuDA/NFygHKalcxitV0I1hs7xKV0LupV9RicR12vfdNYLC4VI6KqWLQVgrCxThUs9q0x8Iv18XPVHkehAcUD3I2EcysE8jPT0rFt9hf2yo63EZH/V8CGX59/hdPy9+8hPE3o0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org) smtp.mailfrom=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bit raw public key) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFZ7p6Wbtz2xN5
	for <openbmc@lists.ozlabs.org>; Tue, 17 Feb 2026 20:28:20 +1100 (AEDT)
Received: from [141.14.13.172] (g427.RadioFreeInternet.molgen.mpg.de [141.14.13.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 84BD84C2C37D75;
	Tue, 17 Feb 2026 10:27:58 +0100 (CET)
Message-ID: <296e66c2-b110-400b-86ab-136b128c105e@molgen.mpg.de>
Date: Tue, 17 Feb 2026 10:27:57 +0100
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
Subject: Re: [PATCH] i2c: npcm7xx: Use NULL instead of 0 for pointer
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216085825.70568-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Andi Shyti <andi.shyti@kernel.org>, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260216085825.70568-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.00 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[mpg.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:andi.shyti@kernel.org,m:openbmc@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taliperry1@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pmenzel@molgen.mpg.de,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-1386-lists,openbmc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmenzel@molgen.mpg.de,openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[codeconstruct.com.au,gmail.com,google.com,kernel.org,lists.ozlabs.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mpg.de:email,molgen.mpg.de:mid]
X-Rspamd-Queue-Id: ECA0514A615
X-Rspamd-Action: no action

Dear Krzysztof,


Thank you for your patch.

Am 16.02.26 um 09:58 schrieb Krzysztof Kozlowski:
> Pointers should use NULL instead of explicit '0', as pointed out by
> sparse:
> 
>    i2c-npcm7xx.c:1387:61: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-npcm7xx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 8b7e15240fb0..f667a873b81e 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -1384,7 +1384,7 @@ static irqreturn_t npcm_i2c_int_slave_handler(struct npcm_i2c *bus)
>   		 */
>   		bus->operation = I2C_NO_OPER;
>   		bus->own_slave_addr = 0xFF;
> -		i2c_slave_event(bus->slave, I2C_SLAVE_STOP, 0);
> +		i2c_slave_event(bus->slave, I2C_SLAVE_STOP, NULL);
>   		iowrite8(NPCM_I2CST_SLVSTP, bus->reg + NPCM_I2CST);
>   		if (bus->fifo_use) {
>   			npcm_i2c_clear_fifo_int(bus);

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

