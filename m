Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDF4256CF1
	for <lists+openbmc@lfdr.de>; Sun, 30 Aug 2020 10:49:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BfRpV2Ng8zDqY0
	for <lists+openbmc@lfdr.de>; Sun, 30 Aug 2020 18:49:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m55GwtJC; dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BfRng5sHWzDqHm
 for <openbmc@lists.ozlabs.org>; Sun, 30 Aug 2020 18:48:35 +1000 (AEST)
Received: by mail-il1-x141.google.com with SMTP id 16so1904821ill.6
 for <openbmc@lists.ozlabs.org>; Sun, 30 Aug 2020 01:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yN5zfpYr0ap6QNQA6b07VLlwIC2ZQknsrsg4qZRzhsQ=;
 b=m55GwtJCzctGLHJCy6ILFyLvwnfMV5XnTAMd/1yNRPHbpAdIKjN6Hza1t0wxqstKy7
 J9Phj0+iglK0im2Who8WuCOoKdxS6rL+Xr7rx28YsfTCU2q9XnJx4bYi5ql/xXY6bJAm
 Z8T4ujvVSBNWpeIromQpcoJIxFJAvlC06+TqRjDVuRgUIsNsiJOv2CjHIavE/c2jswuY
 PJvKKJl2F5YN1lOAmp7+5XD2pZY0EDtz26dWR7LPC5q6A/6mGRODJ9e6KHbjIG2UJAeY
 Ms0wZ+FWAsACQXxXoYfZQXi2JgpiU4vlfkBS9zFExrSiyRRcErx8fmNXCjO1M7UnAYNF
 ywqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yN5zfpYr0ap6QNQA6b07VLlwIC2ZQknsrsg4qZRzhsQ=;
 b=VoaRKE7PM18A7DSiGKhDL4hXUtMXTqj/G+o96WiRCz1KEn1o0Gj85rIpYX0WGhPm61
 eXHzef9Ew8KLgG9fL9jXXYoY9lUY4bv6wyN4VBbzt1BKY0P3V+JRLI5rBarFm+Iyewat
 oBBOF5l96EY9eTT3PKga0lDIxzvumjV2qW5Eui9QBpVrUSzkAOnrK1jXztZy0E1ZqoVj
 Sx2DZQN4RA83nCqCGHKkAJ15PAvOUXOMTvaxNjUbbg1EOvqO0SsYE4Czn+yRnyGB3EUd
 YXR5SmXfISkGttYklLeH23Cdd15E/Zv7cUXPpxASUGrE1f3h5iceLkvYTkNu68sThvNe
 SdFg==
X-Gm-Message-State: AOAM530E0xpjHKfabsxPQEksVduyXegY51UiRwQsheQpVgquCATo0MHC
 GPSrLVanHrMHWpdCnt4Y1Vao/EP86zf54bXKUQ==
X-Google-Smtp-Source: ABdhPJz5E1w87C69bFw/bnQSnAdK1UhDOFyXTpK/FIJL9zevxCZd5atGrqgMHCeioMk2a4VJDuc1YXEwz5MBP19S29k=
X-Received: by 2002:a92:4952:: with SMTP id w79mr4201284ila.1.1598777311765;
 Sun, 30 Aug 2020 01:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200830074903.176871-1-tali.perry1@gmail.com>
In-Reply-To: <20200830074903.176871-1-tali.perry1@gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Sun, 30 Aug 2020 11:47:10 +0300
Message-ID: <CAKKbWA4f64TxfwVr0p=-TT4e=yznO8WCJuie9cxF3J7u5hELPA@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: npcm7xx: bug fix timeout (usec instead of msec)
To: Tali Perry <tali.perry1@gmail.com>
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
Cc: xqiu@google.com, Benjamin Fair <benjaminfair@google.com>, wsa@the-dreams.de,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tali,

On Sun, Aug 30, 2020 at 11:09 AM Tali Perry <tali.perry1@gmail.com> wrote:
>
> i2c: npcm7xx: bug fix timeout (usec instead of msec)
>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 75f07138a6fa..c118f93a2610 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2094,7 +2094,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>         }
>
>         /* Adaptive TimeOut: astimated time in usec + 100% margin */
> -       timeout_usec = (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);

I suggest to add a short description like:
2: double the timeout for clock stretching case
9: bits per transaction (including the avk/nack)
1000000: micro second in a second
timeout_usec = (2 * 9 * 1000000 / bus->bus_freq) * (2 + nread + nwrite);

> +       timeout_usec = (2 * 10000000 / bus->bus_freq) * (2 + nread + nwrite);
>         timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
>         if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
>                 dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
>
> base-commit: d012a7190fc1fd72ed48911e77ca97ba4521bccd
> --
> 2.22.0
>


-- 
Regards,
Avi
