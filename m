Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FD74C0FC5
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 11:03:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3WnP63MGz3bXg
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 21:03:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=61qTKQI5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::332;
 helo=mail-ot1-x332.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=61qTKQI5; dkim-atps=neutral
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3Wn2233wz2xsS
 for <openbmc@lists.ozlabs.org>; Wed, 23 Feb 2022 21:02:45 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id
 j3-20020a9d7683000000b005aeed94f4e9so8158419otl.6
 for <openbmc@lists.ozlabs.org>; Wed, 23 Feb 2022 02:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FPBLx1+RUpYKT8P/LJdSYI/bW8oyzBmv2yXcN6Tk7ig=;
 b=61qTKQI5SfwY0GUWc+jtxcUwyym3BTbZ+99/+akMd5PV0FBBXSA/zbJtAKqWsOyvDT
 ZLeb1IBj40ddUzbIQYtUgINTLqb4FhfnANSPYG4K5BYhplFPIAwm+ba+59Tccb7sYD5g
 /HpqobBIt+h3pz5v0nmvFTNj2Sr1esNEZVwQB2TfWFnRR5/zxYE87I2liFsI1HDY6Zgk
 rtN0dLQxP3IzDisTxEYn2HOFgwI2Z+O2jPUr71iEM1fyY7PBxl2g8WKISqIFxst4hkEV
 AnxbWYwgtcQQSFCmWDjBKueguV9a+1W2Gyrdd6Y6bve6J50rhk6JzjzHqiplCftbgD5d
 yWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FPBLx1+RUpYKT8P/LJdSYI/bW8oyzBmv2yXcN6Tk7ig=;
 b=TsnmEoSYa85TIPmyJETdAxt8lpDn9asg04E5NNJej1eRCBe7FYnJsxq4AhyzbwD1mN
 Y1as4zc0WEi3qOJb1DlVn7knS8Lw7ji9d6EhwLbn0BWzOOyqhVB3nYzSdV6+AtsKOIF2
 S4IojRLPIy3W6+BvZtkpOyW2Qo7/OyMKzr12suqeYddgs2+l10m8S71MfrnoxFZrruwB
 KJOD8358lD4c8oH+twtF0zFhGsl30wspLjvezreS6d+KPh6bGnST8BCOKKy+vdTljG+G
 0URvctWRA9J3UafLZfoMFya4jDeqdyKZ6tW9AiSKX3NnJDTDuEBnHshR07QGQsisHvIf
 xBlQ==
X-Gm-Message-State: AOAM530q9tgpqit8yGquQYzC9rhNPwZp7BCyw+ThzEuQE6e9ysP1g8MO
 iLmAHWBqV1MPYZIQqXLYrtYt1+TKoA3HGQ7eNQDELw==
X-Google-Smtp-Source: ABdhPJwL1sPAP6rPzcDtUD3eGEXNvmVEge83cYdWche7ei6ZkEqU6n/J3Y1DhrZ0N2Mt4VNiNLSIkDEBa6d2qwS6Lc0=
X-Received: by 2002:a9d:7016:0:b0:5af:157b:685 with SMTP id
 k22-20020a9d7016000000b005af157b0685mr5441787otj.16.1645610562552; Wed, 23
 Feb 2022 02:02:42 -0800 (PST)
MIME-Version: 1.0
References: <CAGm54UE7-QxGBniV3J2jnBiW4ygvRcHxKd=G88PsOiNZP+hBTA@mail.gmail.com>
 <HK0PR06MB3779076AB5B2189822951A4C913C9@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <CAGm54UGNdAtX=zSuZdZwQ6k2FjPj-Cxd3AwVxyNLLhifEntHbw@mail.gmail.com>
 <HK0PR06MB37792404CAB772185CB386B0913C9@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <CACPK8Xdu2VzLBW0oMy_bGo=hoJUng25pffGEYXe9xjyqC4=7tQ@mail.gmail.com>
In-Reply-To: <CACPK8Xdu2VzLBW0oMy_bGo=hoJUng25pffGEYXe9xjyqC4=7tQ@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 23 Feb 2022 18:02:31 +0800
Message-ID: <CAGm54UH8ZrUWms84E-4mzgUvGEdVYJGiq4mWSyCKoTzAtFc9HQ@mail.gmail.com>
Subject: Re: New u-boot-aspeed-sdk runs slow and cause wdt2 timeout on ast2500
To: Joel Stanley <joel@jms.id.au>
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
Cc: ChiaWei Wang <chiawei_wang@aspeedtech.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 openbmc <openbmc@lists.ozlabs.org>, tangyiwei.2022@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> > > > Could you share us the boot log with timestamps?
> > > > It would be nice to know the time elapsed at each stage.
> > >
> > > Pasted to https://pastebin.com/emseqW6c
> > > It contains two logs, the first one is good, and the second has the issue.
>
> Working:
> [2022-02-23 02:47:03] U-Boot 2019.04 (Jan 24 2022 - 10:18:18 +0000)
> [2022-02-23 02:47:06] ## Loading kernel from FIT Image at 20100000 ...
> [2022-02-23 02:47:12] Starting kernel ...
>
> 3 + 6 seconds.
>
> broken:
> [2022-02-23 02:58:07] U-Boot 2019.04 (Feb 15 2022 - 07:22:14 +0000)
> [2022-02-23 02:58:12] ## Loading kernel from FIT Image at 20100000 ...
> [2022-02-23 02:58:22] Starting kernel ...
>
> 5 + 10 seconds.
>
> Interesting that the pre-hashing part is also slower.
>
> The old branch was based on v00.04.03. The new branch is based on v00.04.09.
>
> I wonder if this is the cause:
>
> $ git diff  v00.04.03..v00.04.09 -- configs/evb-ast2500_defconfig
> diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
> index 9fcf55b05ebb..000ed3f90bdd 100644
> --- a/configs/evb-ast2500_defconfig
> +++ b/configs/evb-ast2500_defconfig
> @@ -1,4 +1,5 @@
>  CONFIG_ARM=y
> +CONFIG_SYS_DCACHE_OFF=y
>  CONFIG_ARCH_ASPEED=y
>  CONFIG_SYS_TEXT_BASE=0x0
>  CONFIG_SYS_MALLOC_F_LEN=0x2000
>
> Lei, can you re-test with CONFIG_SYS_DCACHE_OFF=n ?
>

Yiwei helped to test with CONFIG_SYS_DCACHE_OFF=n, and it works fine now.
So it seems we get the root cause!
