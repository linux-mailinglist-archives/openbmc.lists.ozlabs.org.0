Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0A43053B7
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 07:58:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQZDk4YNCzDqpd
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 17:57:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=caY0nOWv; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQZCq02tgzDqgj
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 17:57:07 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id e15so718484qte.9
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 22:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MCyfyk5eCtPwSD7QsO5BCqpRNmfOd1XjxUu5KEhZ8xk=;
 b=caY0nOWvIqLf0Fz1Q2s6qp9U08Ke00W1GAXF3hO4sErHf6SxjRHqKGOxMoxLY3Zgcv
 HwlnHG3ts7R0V+o/ykBVohTMTFNDw9K7v2XeFle8VuCuJaC+3EV1vcEJRFlj71mmdNrv
 PA8f7qU78SyP1pXOJdbEPnSg+hzyNZxKQ4h2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MCyfyk5eCtPwSD7QsO5BCqpRNmfOd1XjxUu5KEhZ8xk=;
 b=R+1M/dBYFnmrYBjzxjBxuYgOZ9qPPrd6QFa0bZIv6IwBU5YX9t//s7d/r8tNocxmjc
 0j7qFiMme5Zgl2PX9YpM2IAgpF78T5cUN1kG4HCgmGU+VsdmVVp1D88UhH5Y1OSVREmy
 qbfEgzEPIcL0RzxB/bJM3PETV1hFul9z2foyHEZoihHxl0oMCvm61KerPPQYDNOR2Qgp
 udV5vgCsrgGXOVKn57BjazpN3XHN+wAXAkT2C3DZsqaHU+fNWPo/rdvvT3XwZT8BqIgW
 V5FFmS13EYxmJzE3XjcvsxLh/izlAOd339O80tiuSHsoX+Wyu2ArAfncanRbKjI5onLn
 7Y2Q==
X-Gm-Message-State: AOAM53210EcxvadAVO2yjZzHM/1bOvSIP78OHaOToNVZn1rmp9DPVFbv
 qUTbzYBVvswCld1fPb0P+LxFhLfI0Qjiuhd3+Io=
X-Google-Smtp-Source: ABdhPJxOqqLnLkgvc8cnVWjGoYwGwunHJVKD5uH5Gi1D+kk+KdaF8ozEcrF6I8lzMcgaY2Zy+fUNNZpK+vlJOchNPA8=
X-Received: by 2002:ac8:5156:: with SMTP id h22mr8729896qtn.176.1611730623733; 
 Tue, 26 Jan 2021 22:57:03 -0800 (PST)
MIME-Version: 1.0
References: <20210125045846.448399-1-joel@jms.id.au>
 <20210125045846.448399-2-joel@jms.id.au>
 <d2407df1-75b1-78eb-6bbb-6ce9e771dbed@linux.vnet.ibm.com>
In-Reply-To: <d2407df1-75b1-78eb-6bbb-6ce9e771dbed@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Jan 2021 06:56:51 +0000
Message-ID: <CACPK8XcdgZMB-ocZTDxcDDe=5rxsnph-v_gbLf4omCPJSgd1YQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/2] ast2600: Modify SPL
 SRAM layout
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 27 Jan 2021 at 01:55, Klaus Heinrich Kiwi
<klaus@linux.vnet.ibm.com> wrote:
>
> Hi Joel,
>
> On 1/25/2021 1:58 AM, Joel Stanley wrote:
> > The SRAM is 89KB on the A1 and beyond:
>
> I guess I'll have to trust you on that one.

You have access to the datasheet and can verify this.

>
> >
> >   0x1000_0000 to 0x1000_ffff: 64KB, with parity check
> >   0x1001_0000 to 0x1001_5fff: 24KB, w/o parity check
> >   0x1001_6000 to 0x1001_63ff: 1KB, w/o parity check, each byte write once
> >
> > Allow the image to fill the full 64KB payload size (max that secure boot
> > supports) and plcae the stack at the top of the 24KB of SRAM.
> typo
>
> > @@ -25,8 +25,8 @@
> >
> >   /* SPL */
> >   #define CONFIG_SPL_TEXT_BASE                0x00000000
> > -#define CONFIG_SPL_MAX_SIZE          0x0000E800
> > -#define CONFIG_SPL_STACK             0x10010000
> > +#define CONFIG_SPL_MAX_SIZE          0x00010000
> > +#define CONFIG_SPL_STACK             0x10016000
> >   #define CONFIG_SPL_BSS_START_ADDR   0x90000000
> >   #define CONFIG_SPL_BSS_MAX_SIZE             0x00100000
> >
>
> Got the following when I tried this patch (Ubuntu 18.04.5, gcc 7.5.0, binutils 2.30). Am I missing something?

This is a very out of date compiler. We use GCC 10 for openbmc.

I will submit a v2 with some new features for reducing the image size.


>
>    LD      spl/u-boot-spl
> arm-linux-gnueabihf-ld.bfd: u-boot-spl section `.u_boot_list' will not fit in region `flash'
> arm-linux-gnueabihf-ld.bfd: region `flash' overflowed by 1612 bytes
> scripts/Makefile.spl:384: recipe for target 'spl/u-boot-spl' failed
> make[1]: *** [spl/u-boot-spl] Error 1
> Makefile:1663: recipe for target 'spl/u-boot-spl' failed
> make: *** [spl/u-boot-spl] Error 2
>
>
> --
> Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
