Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C323B054F
	for <lists+openbmc@lfdr.de>; Tue, 22 Jun 2021 14:56:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8RGT3YYTz30L4
	for <lists+openbmc@lfdr.de>; Tue, 22 Jun 2021 22:56:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=RfizE3Fm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::731;
 helo=mail-qk1-x731.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=RfizE3Fm; dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8RGC4Hs6z304j
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jun 2021 22:55:46 +1000 (AEST)
Received: by mail-qk1-x731.google.com with SMTP id c23so3604198qkc.10
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jun 2021 05:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EQT+jb/cezkeIQ0brD4G6hPZVgUvJHrJEstySOuyTFc=;
 b=RfizE3Fm/1Fh6wd2u26tedNrU8y//ZfJaNrRKDZ2whpIXV5SNISdNq4s/lumZxPQtO
 ZvTug9KOrM1hQqIGuPlpsKNK3zGozlOTLZDXWq29ck5KobtVQVEuunnfDTBaOE84hHwP
 N0UesaGwz9WytFB2HELRFzgsJWWiHml12WDYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EQT+jb/cezkeIQ0brD4G6hPZVgUvJHrJEstySOuyTFc=;
 b=LsXBKSCJE51nAEvEy2GZI/hSwp2f0w3gGRAksCmqMOo7e9xc8KSOvrdkakhARH1X/D
 IMPw8bq7hNf0OIjQNev9X3+0Qd5fGk9XsC03DhL94AaEd1aM+/5oDaWOIQE/ACmakW4a
 6KnHBdf/hgx8RHWBPt4MExDqI2cg1+9KBmtnuLSVjlVyiOzuCS6DcUWvwKOIlrdw4yYP
 ECEgrcv5wbzI3XAtc7J8Ry01cFjGY4XMDyGCHMKidQtTje1uLe6bPA7C2DNGsj97D91n
 WEO1DrkxxGH5mTW2Mk6mbm0cSBqkN9Q9ixagBJtyNLD0X9yO9E4e2J6kACGSBrwdNenK
 q9Gw==
X-Gm-Message-State: AOAM533fCnt6aGY7YKK2h+UdJIfsD/lPPnwf3GVT1xm9fIVzihcsZosV
 xz3APrl18zakU3YH8fAwy1EhTM+4PaYjm3CWVAE=
X-Google-Smtp-Source: ABdhPJyrLJFNUy6PqW8fCOiJznLCbeuAiEj6TLaQ2TCyCBpKKu+ZKKBLELkN0EDgj8mljV+gFg842gF8+0ecfOAMWJY=
X-Received: by 2002:ae9:f401:: with SMTP id y1mr3955520qkl.273.1624366540951; 
 Tue, 22 Jun 2021 05:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210618151436.2266046-1-anoo@linux.ibm.com>
In-Reply-To: <20210618151436.2266046-1-anoo@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 22 Jun 2021 12:55:28 +0000
Message-ID: <CACPK8XfoqoebdX48ORPO=go0XZQC8XU4DvADZ1r+31k_oy=z1A@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] configs: aspeed-common:
 Add redundant env for mmc
To: Adriana Kobylak <anoo@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 18 Jun 2021 at 15:14, Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> If the env is in MMC, specify the location of the redundant environment.
> Per the ast2600_openbmc_spl_emmc_defconfig, the environment is located
> at byte offset 0x5000 in the user data partition, and is sized at
> 0x10000. The redundant environment follows it immediately and is the
> same size.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> ---
>  include/configs/aspeed-common.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/configs/aspeed-common.h b/include/configs/aspeed-common.h
> index 8f404570b1..59449d36d0 100644
> --- a/include/configs/aspeed-common.h
> +++ b/include/configs/aspeed-common.h
> @@ -83,6 +83,7 @@
>  #ifdef CONFIG_ENV_IS_IN_MMC
>  #define CONFIG_SYS_MMC_ENV_DEV         0
>  #define CONFIG_SYS_MMC_ENV_PART                0
> +#define CONFIG_ENV_OFFSET_REDUND       0x15000

Would it make more sense to write it like this:

#define CONFIG_ENV_OFFSET_REDUND (CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)


>  #endif
>
>  #endif /* __ASPEED_COMMON_CONFIG_H */
> --
> 2.25.1
>
