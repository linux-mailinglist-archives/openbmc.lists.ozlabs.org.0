Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3E7359310
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 05:36:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGkLY0bdpz3bV1
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 13:36:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=kf/yhUgz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=kf/yhUgz; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGkLH1mQWz2xfw;
 Fri,  9 Apr 2021 13:35:50 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id c3so4586176qkc.5;
 Thu, 08 Apr 2021 20:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VW/C+2LLet/ldR+i+V3eCTvpTJBdjFtGmR5udw1qeLQ=;
 b=kf/yhUgzKhxJK2p+6wg/izoDDT8TFZB4rkZhdAkJoNXFkTR7yODnvd33p9egVGYtph
 gbjuS+5GR0hjMGkDh2zU1fwjhgdqLPt/a/aFHME6YguBsLD7EVdtdN+p5QMtBp8FPzS0
 KrAOJQ7t3AKlSkWQfGGwRPGIXSlG6ftCpd/p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VW/C+2LLet/ldR+i+V3eCTvpTJBdjFtGmR5udw1qeLQ=;
 b=MHlqUCueRUeZxT3kD3oLqbVu/n4yWM2BJQbddYibir4kaxO5fiR4MvRALzwPkoYsKr
 swZdcjRJDmqF1FtMZCsGEIlGis41zAlfBEkcB1wmQqBPfIJWWc8b1f+Fy6wWwjbrxBzk
 BqREry1s40Na/7XrnO1k46W+sS5SvLZUM2JOBtdWyCtb6FHuWDa3SP8f21iGfrtqJXXn
 BlWTXCKgxFLbqxRt1i3E3lY7O0Qse905GTZK+IS1gKRDKhNfePe0uYjDQ52avkwrzz4S
 FIzvWBCpAHLZdjn5IsWNnvmknM1oQ/IlGmrCW/JhKDdHOCgRbZNjs4OUMtpLSypHwli4
 Yy6Q==
X-Gm-Message-State: AOAM532nwOMdRJ4D5T40qBUx2ITB2aE0oir90fmpusxhWmsyCORnG4t1
 vSzJoBTZbilCxAKbh/GpQo9dHcfC/HNE18cvIzc=
X-Google-Smtp-Source: ABdhPJxle9zTiCZMcHgQmCbwnJmAkb+TEoOlJ7KMtbFw35LN/7onMEAKpvQn37Vrs7E0ALx7tpeNrdmUUNmbjGlTwlo=
X-Received: by 2002:a05:620a:28c9:: with SMTP id
 l9mr11766768qkp.55.1617939347264; 
 Thu, 08 Apr 2021 20:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-3-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 03:35:34 +0000
Message-ID: <CACPK8XfkvBA+9_WFb96oEa4F1vDPd90hG+M2Y-Ek=Xt5FUFqmQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/21] ipmi: kcs: aspeed: Adapt to new LPC DTS layout
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Haiyue Wang <haiyue.wang@linux.intel.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Corey Minyard <minyard@acm.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 openipmi-developer@lists.sourceforge.net, Lee Jones <lee.jones@linaro.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 19 Mar 2021 at 06:28, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
>
> Add check against LPC device v2 compatible string to
> ensure that the fixed device tree layout is adopted.
> The LPC register offsets are also fixed accordingly.
>
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Haiyue Wang <haiyue.wang@linux.intel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
