Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F5F592921
	for <lists+openbmc@lfdr.de>; Mon, 15 Aug 2022 07:42:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5jpk3NdSz2xrH
	for <lists+openbmc@lfdr.de>; Mon, 15 Aug 2022 15:42:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=hi+YPdFW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=patrick.rudolph@9elements.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=hi+YPdFW;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5jpH6QtBz2xHC
	for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2022 15:41:57 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id p14-20020a17090a74ce00b001f4d04492faso5905489pjl.4
        for <openbmc@lists.ozlabs.org>; Sun, 14 Aug 2022 22:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=dISpi/L9fnODHGIWlW7P7Iqm26ll4CfZEkovJUIbMzw=;
        b=hi+YPdFW0l72WZm405VYWW/JCP5PE93AeQwxgnLez+gx7tafSSTA6NcV+OF+cQ9tqs
         jkqWOGhTCsD3RleQNHrtE4Cb6YEqfX0Xj2KDMK3uubM0Wq1ewivgbuog3SlUdMClp+Yo
         k44tsEcmVAhOQY6rGc8Vz8VGMHvIZ6ZBoy3B9d+QB+NgT9npflLbp+VyaL2R3PyGCg68
         /ZtI7gcAHsGB292YW7Az/vshv1lvkuyvx3AQVImD5dxcqiGb6Gn/ycF+gGSXU3xvfOx9
         yKFDQXwERLgGRXXRK0unNopanW1Da6VtdGrkLEeAfXMBX5prqqOtr71+S+KFEZt+D6JT
         nzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=dISpi/L9fnODHGIWlW7P7Iqm26ll4CfZEkovJUIbMzw=;
        b=gHqiFghhgk14NMpvmy8iNuCEBbk/l/+aXbgE4n9MV7mZLpPauA532ltFAgPExG8jV3
         BwmS9rpKMeXST6Mg27Rsm/TlyeOIIA3zEhsAPP0Z8/BzNNA8YhkULFYppkRAcEp1mr5K
         QkTMrs9HbtLQsFGOwJrfisIW2NSfnvPsxnZ+aLShZTmT1NCCiXSqIkr+RKegwK1nMNij
         fzagOR0Kg3LraiRF1uQVcZsEgDBCc97F198CSIeuBcb7mo4mDRjSnCSWMaPYrZOqI/Y6
         FvNOqL4cmwVcXoauWJMV/rPB/W1YHMPBYKMBheYlml1I8h3Y/NECgab98mrWcnvYkwb1
         wBvA==
X-Gm-Message-State: ACgBeo3OUxgNk9ojcuVojciPFx+rzOxdSog8Kf72AIZjYqmkdsAVd9M4
	1Vs3OSjdRGzMi99YUxaeFsIoU6Z74v5TdHyyCh9QVg==
X-Google-Smtp-Source: AA6agR5wB5bRH5DvCFU3Cbp1IUNCCfX8S9AcbNdoZVotwOzwrcqfL452OBxVba471MjIX2Jiydut2Xk6b/3a1w6kKyM=
X-Received: by 2002:a17:90a:9709:b0:1f3:7ac:73dd with SMTP id
 x9-20020a17090a970900b001f307ac73ddmr16617715pjo.184.1660542114080; Sun, 14
 Aug 2022 22:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220630110745.345705-1-patrick.rudolph@9elements.com>
 <20220630110745.345705-2-patrick.rudolph@9elements.com> <945f5419-3352-4be5-b8fa-5973138f37aa@www.fastmail.com>
 <CALNFmy2-b=V2BroMOgFWZ+++NknvtvQXetVQNaJtpAYW1+iOVA@mail.gmail.com> <0a4b11b1-f30d-40d7-bab3-c8c188798d71@www.fastmail.com>
In-Reply-To: <0a4b11b1-f30d-40d7-bab3-c8c188798d71@www.fastmail.com>
From: Patrick Rudolph <patrick.rudolph@9elements.com>
Date: Mon, 15 Aug 2022 07:41:43 +0200
Message-ID: <CALNFmy0T8JUndadBQj+uwJ4g2raTCCkSrwnfgZ0ocvEp0ZeOcg@mail.gmail.com>
Subject: Re: [RESEND][PATCH u-boot v2019.04-aspeed-openbmc v5 1/2] arm/dts:
 Add IBM Genesis3 board
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
Cc: christian.walter@9elements.com, openbmc@lists.ozlabs.org, takken@us.ibm.com, Joel Stanley <joel@jms.id.au>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,
the first and second version of this patch were including ast2500.dtsi
and enabled the devices.
Joel and Zev recommended including the EVB dts to have less copy&paste code.

Please advise how to continue. Both versions are working and have been
send to the ML.

Regards,
Patrick


On Thu, Aug 11, 2022 at 8:17 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 11 Aug 2022, at 15:30, Patrick Rudolph wrote:
> > There's no SD card slot, there are two MACs in RGMII mode and nothing
> > that's required to boot on i2c bus.
> > In the defconfig used I disabled SD card and I2C support, so this is
> > not an issue.
> > Should I still disable it in the devicetree, just for reference?
>
> It's at least more idiomatic to `#include "ast2500.dtsi"` and then
> enable the controllers you require, rather than #including the dts for a
> board not entirely related to the design you're bringing up.
>
> That would be my preference. Is the result much more verbose? It feels
> like it shouldn't be if you only need networking and SPI flash.
>
> Andrew
