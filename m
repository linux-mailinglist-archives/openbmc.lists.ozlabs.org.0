Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7692E057D
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 05:50:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0P6B5SP7zDqQy
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 15:50:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=V/xri5jB; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0P4s0B7SzDqR0;
 Tue, 22 Dec 2020 15:49:16 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id a4so5188821qvd.12;
 Mon, 21 Dec 2020 20:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GWtT9dFNEqcjPHmXbiAmtOVLFIp1sJxP3GkNlraCet8=;
 b=V/xri5jBFHmYbWxVUSImNRGuyAQ0cgIJk2RwCYMPY4Csvdds8VDMvvCmmr+KpbP6PK
 NFtdxVjPR9kkM0wa9wl8we7P4z+SDfpxMwzltE9zqZ4lqCsAWyz7WAmdlWDBCHc2w6Hs
 ZbrtkK3LtVSlaxQiYQQoqafv+3fMqNFHhPa/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GWtT9dFNEqcjPHmXbiAmtOVLFIp1sJxP3GkNlraCet8=;
 b=iVZUx3FFNIbEWYVpB4B8E97pgWyeF9jzV36Q4rlQGL/V1b445LjsjMuhvIAlKC4c/i
 GBooBgo2kMdLqQfEvfalvdHExJXJetUrPeaJ5G/dVSKA+nblA1JgA7OjmXITFo25F+K0
 rb0kEozW/ITUeSREowM2BKe72CtSQo9twWzpEJDv5QfCahRdY1igQXwDZ4yPEsxq6ql6
 HXxQRz/y1aAKvaacRv4zCSvpyh2QAwrp7Z+4xbUoWlIWBNg83oasufyNomD2x48SSvO+
 WtDXW5pzl7lir1kOeGuMF64Rm12ThRE6NOJcr2eja5QlAHDa4ejGXIEprhkU4Crq1nHf
 +HMQ==
X-Gm-Message-State: AOAM5339chb0zm+Y5wNGm2ZxzZztT6ppPGucWREfqO4VNAqyG9O/uMQM
 fj6Yi+ME6ShGQRj57ygI64hWZT7yh/TXpltPq8A=
X-Google-Smtp-Source: ABdhPJzaVZU4oIKFfYRAkH3IRIleJXfQL+zGDPUA+rF5Cw9csSVMZYtEy8pQb4tpH5uLqJ2xelCA0hFc/0OlWNwvZYk=
X-Received: by 2002:a0c:b990:: with SMTP id v16mr16780968qvf.16.1608612552612; 
 Mon, 21 Dec 2020 20:49:12 -0800 (PST)
MIME-Version: 1.0
References: <20201215024542.18888-1-zev@bewilderbeest.net>
 <20201215024542.18888-4-zev@bewilderbeest.net>
In-Reply-To: <20201215024542.18888-4-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 22 Dec 2020 04:49:00 +0000
Message-ID: <CACPK8XdAfYaAPeyDL4nsG+04xgr-u3+CQKNNdpHAQb4vG7=54g@mail.gmail.com>
Subject: Re: [PATCH 3/3] aspeed-video: add COMP_READY to VE_SPURIOUS_IRQS
To: Zev Weiss <zev@bewilderbeest.net>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 15 Dec 2020 at 02:46, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> This joins CAPTURE_COMPLETE and FRAME_COMPLETE in the set of interrupts
> that have been seen asserted by the hardware even when disabled, leading
> to the interrupt eventually getting disabled as described in commit
> 65d270acb2d662c3346793663ac3a759eb4491b8.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

I have less experience with this part of the chip, so I defer to Jae
or Ryan for an ack.

> ---
>  drivers/media/platform/aspeed-video.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 218aae3be809..48c52bf91a1b 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -564,7 +564,8 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
>   * register.
>   */
>  #define VE_SPURIOUS_IRQS \
> -       (VE_INTERRUPT_CAPTURE_COMPLETE | VE_INTERRUPT_FRAME_COMPLETE)
> +       (VE_INTERRUPT_CAPTURE_COMPLETE | VE_INTERRUPT_FRAME_COMPLETE \
> +        | VE_INTERRUPT_COMP_READY)
>
>  static irqreturn_t aspeed_video_irq(int irq, void *arg)
>  {
> --
> 2.29.2
>
