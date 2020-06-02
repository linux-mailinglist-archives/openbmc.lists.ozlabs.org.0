Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D6C1EB32B
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 03:58:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bZv33trbzDqQl
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 11:58:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=JyETxt2m; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bZtS0TcMzDqMV
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jun 2020 11:57:35 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id s19so8776180edt.12
 for <openbmc@lists.ozlabs.org>; Mon, 01 Jun 2020 18:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3NwwdAFLZm32HsXtK+QReh7GLM6bLao4y2XhXE2Moas=;
 b=JyETxt2mG2VmQ0oPa3NHWPk0p0IB/NvSSMiQMCccjlBVbe20cr9P/Liu2aydR5d+kc
 7xoURcyhYs2rkCdiWlSeis9hs4MOT2rSbhWsFzHJ1DUS3l43FBICTfTzTXPbGncJY4lr
 YD364OLmaxsznBD7PHz8/hIMYwiaZVenVow7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3NwwdAFLZm32HsXtK+QReh7GLM6bLao4y2XhXE2Moas=;
 b=QMIu70z0z8KGM2PNnXJWw3Y9D6dMLHlH44xHX1BHxRzf0bWfjUlOZNJsqbyFPmSGKx
 BBOXsJ4hQbqLymu9pwLGpn8mEU+24JP2j71OtHikNaNWLDm4ONJe4BJa9aWl3UpbxCA9
 uOpCv9F/HDddyziu3RDacwPaQh7+1pD+u/YDiIkTtbc7C9C6bcclxQA01lq6QeE37Mj7
 3GeyYCY/90RRK9ZQJK1Zj95CczCEK9anTTfui/bjS5OTE343/uWO9ZXQEiP5NWoOUeUd
 f6CAzlb+0Yv+LbvHYvIFZHNRsszGorCiXlXQBrsAn4Sv1UQrrtDC0hS9jvTc245fXUUG
 loiw==
X-Gm-Message-State: AOAM531/Ul01AXKFE+iN5mlmZ/GyapDJ/jrUHoEB41h81ftIlryDWHdB
 N6gyDdU8B08MLIBQZ3WW+IRbv0XRkhrlSpmqeIw4mYb9KDg=
X-Google-Smtp-Source: ABdhPJwFVHg/k0Y7wYfoc1QWSmMFiFrZPoGs0xtp+dL9pB2LrWcahlH/V1szpBC07bxccGs8X/RrAJpa2QSaaqB6/UA=
X-Received: by 2002:a50:f094:: with SMTP id v20mr24098444edl.77.1591063052964; 
 Mon, 01 Jun 2020 18:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200519193936.7295-1-eajames@linux.ibm.com>
 <20200519193936.7295-3-eajames@linux.ibm.com>
In-Reply-To: <20200519193936.7295-3-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Jun 2020 01:57:20 +0000
Message-ID: <CACPK8XfzeUBCL8OGzMwF+Se41T9zakarLEEXB+ae-W6r6Ni4iA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4 2/2] i2c: fsi: Prevent adding adapters for
 ports without dts nodes
To: Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 19 May 2020 at 19:39, Eddie James <eajames@linux.ibm.com> wrote:
>
> Ports should be defined in the devicetree if they are to be enabled on
> the system.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/i2c/busses/i2c-fsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index 977d6f524649..d6ea502521a5 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -703,7 +703,7 @@ static int fsi_i2c_probe(struct device *dev)
>
>         for (port_no = 0; port_no < ports; port_no++) {
>                 np = fsi_i2c_find_port_of_node(dev->of_node, port_no);
> -               if (np && !of_device_is_available(np))
> +               if (!np || !of_device_is_available(np))

I thought this was wrong, but the important part is that
of_device_is_available() returns true if it can't find the status
property (ie np is null), so we need to check for np being NULL, and
if that's false we can check if it's "available".

We could write it like this if you agree it's clearer:

if (!np)
   /* Port not defined in device tree */
   continue;
if (of_device_is_available())
   continue;

Or I can take your patch as-is. Let me know.

Cheers,

Joel




>                         continue;
>
>                 port = kzalloc(sizeof(*port), GFP_KERNEL);
> --
> 2.24.0
>
