Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 057604C09D1
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 04:02:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3LRh2Cfpz3bbk
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 14:02:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=mLQU0fA5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::c2c;
 helo=mail-oo1-xc2c.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=mLQU0fA5; dkim-atps=neutral
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3LRP1J1dz2x9F
 for <openbmc@lists.ozlabs.org>; Wed, 23 Feb 2022 14:01:49 +1100 (AEDT)
Received: by mail-oo1-xc2c.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so20448464oos.9
 for <openbmc@lists.ozlabs.org>; Tue, 22 Feb 2022 19:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rghCidw9BAthUHkhlnvUllFOHpjfFDX3hru2ziz3Tp0=;
 b=mLQU0fA5CTmatDkx0pDGXKiCM1utVgqiIAjDm9ANZCoroBnZ1UgLs+fERbb1uyWmx1
 F4Jxb5VvevBgMYb4tAAyvAEO3dMfWJ01QRfNXwsNvogJi/ABn+WgJh+lvkRPdZPgzlhi
 3fg+jCXHkNt9l2PEXm0JwXG3Q/Kmbmt5oC0Nle93LZmMxwxnRG4kf289GnWrGUUIHkQh
 FRR5f4cn5ISewXFUNYngx8oH2JcL49TXIqFlbhyviESq+DAT+w43lgbYWNLVaDoncDEo
 TNO1MWNPHJLiR6tWMYIK5yFv4EaE7LScB6URkUyjs5yXTZxeoWZZbRKFXKLX3hk5KJ35
 SH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rghCidw9BAthUHkhlnvUllFOHpjfFDX3hru2ziz3Tp0=;
 b=mozdg9qxNik/yfUZkPMaHV011Qige20maBtFurXJOrwSYYh36Vk3WU5zGzyfC5VKvd
 IBWS0oxY/I3yHHirVynrL4vwXoVq/zEe7jZnJvyzCcMAi01TMpjuO8HYgWoe3DKokssM
 /gayvxsPBwSiH96j5VTh0RkTmiEx13qYEnJyx1ZAPZGWlDJpr/5MI+XCKjeblGfgff49
 klEVX9S0R7FW4cLH10dcLCquX79L7cho1ZXwRbKOJ/GOWHMr5lXiriSVcPsNZOc4Qies
 e4YnXq3g0WKxAxqKO5lhrdzXsVNibNy71bmz6US+GzobkLTxw36IQyuZPAUKKi0Ak+tw
 P6pA==
X-Gm-Message-State: AOAM532VAgd1QzzyjuHQ8SJfh2qeLI4SnGaMvgW5RS5TgANNrjWYOBwZ
 xhXHqsctyHaOOsTO7JMAnlSYs84UpHEe/Ls7Cgh9B+KeN0TT2Q==
X-Google-Smtp-Source: ABdhPJxjAKepmDQoJmfcN8vOvo4h6ogOG7gvKK/b3kCNGRErY10jzn5gtScLy5ZdiQpExPK34WQR3cTFH1fKI9g/TMw=
X-Received: by 2002:a05:6870:5b84:b0:d3:f1ff:d965 with SMTP id
 em4-20020a0568705b8400b000d3f1ffd965mr3056087oab.335.1645585307228; Tue, 22
 Feb 2022 19:01:47 -0800 (PST)
MIME-Version: 1.0
References: <CAGm54UE7-QxGBniV3J2jnBiW4ygvRcHxKd=G88PsOiNZP+hBTA@mail.gmail.com>
 <HK0PR06MB3779076AB5B2189822951A4C913C9@HK0PR06MB3779.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB3779076AB5B2189822951A4C913C9@HK0PR06MB3779.apcprd06.prod.outlook.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 23 Feb 2022 11:01:36 +0800
Message-ID: <CAGm54UGNdAtX=zSuZdZwQ6k2FjPj-Cxd3AwVxyNLLhifEntHbw@mail.gmail.com>
Subject: RE: New u-boot-aspeed-sdk runs slow and cause wdt2 timeout on ast2500
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Troy Lee <troy_lee@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 23, 2022 at 10:38 AM ChiaWei Wang
<chiawei_wang@aspeedtech.com> wrote:
>
> > Lei Yu
> > Sent: Wednesday, February 23, 2022 10:15 AM
> >
> > On the latest master with u-boot-aspeed v00.04.09 SDK, an issue occurs on
> > g220a that it runs slower than before and gets wdt2 timeout.
> > We reverted the u-boot to a version before v00.04.09 SDK (b0fe8fd9d) and the
> > issue is gone.
> >
> > Below are some details:
> > * Before v00.04.09: u-boot works OK, and it takes about 9~10 seconds to load
> > and start the kernel including the 2 seconds timeout for autoboot, the kernel
> > starts OK and it kicks the watchdog as long as the driver is loaded.
> > * With v00.04.09: u-boot runs slower than before, and it takes about
> > **16 seconds** to load and start the kernel (including 2s timeout for
> > autoboot), then the kernel does not have enough time to run and loads the
> > watchdog driver, and the wdt2 times out on about 22s.
>
> Could you share us the boot log with timestamps?
> It would be nice to know the time elapsed at each stage.

Pasted to https://pastebin.com/emseqW6c
It contains two logs, the first one is good, and the second has the issue.
