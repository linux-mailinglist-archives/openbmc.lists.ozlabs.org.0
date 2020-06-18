Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B9F1FEAE2
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 07:26:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nVm43JtDzDrD0
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 15:26:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Z4R0N+iY; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nVlH1kZRzDrCP
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 15:25:45 +1000 (AEST)
Received: by mail-lj1-x242.google.com with SMTP id 9so5659202ljv.5
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 22:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nRHBPxl8D9UicA4rTVRRCH8VeUxAsbJIEwmop3srSrI=;
 b=Z4R0N+iYP+ySFCp+JLFpUgTaehhpkj+F3JH+GXo77j4E2aaxmzKrCNa3bSnZUbiXsp
 OFfICTDh/mvLVZsPlbm+rsXiHvl7YNAhaWRXLAShiFEt1x9PepzJ+FxbqsKg5ODDcgdu
 LWVfA8djPgcuSmQirQyylW+nZucN22rFfHBLCVAvBbn2O8F3XQrkYqEOxcF35EPY5vpb
 Fx4okbOcZ17/S1Hm5lOgEZYMRNKPHjRUDgk+j1YDFsvtLXJyxjD10lGNFBEFgV6Zy8uG
 Fvm6NSROQD2c8ml843eyp4kaGa8anqvCqlkvwHWYvSUeFMb9Hoc8iYsNQH93mca8vA7k
 Dwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nRHBPxl8D9UicA4rTVRRCH8VeUxAsbJIEwmop3srSrI=;
 b=Fkb/6U4yrCX1GHV63HkTnDF6oiJhnQLEAmWAhj6AxjvGnC8Za3DZ4xVp8d05Vgh/BV
 /Rycq2SbqMcTY7V0rBGDc0ZoPpToAd+XSRyFBILV5DO1otNL5ScTMhERxEgtSKvSuXYQ
 yYQTi/6LSMD/zjJIXlohLUcZ1T/Xwxxlrf9Ix24lg19jUoQztLrTcjYYghBI25UcQ+S+
 HKOrXp0Wu0oscuCzXxZn2nbRVNp8mlh+4SowsePH47lPJXENBuxqx4i2RpwOuPocukRO
 kkZ1joYlDDM4YprT650QTwwEQ/66TiTPexipP38maXWIxp2GlVAqEcH2yMbqFV2CFVEv
 r2aA==
X-Gm-Message-State: AOAM533qljxcv+lZeg8JBqN4qMPjHf1ta5srMAy3qnWj44D/vG3UFPAu
 CYLiHhK1i4sWKPj3OJvxJgkWSY7g8fS0f1A60teC+w==
X-Google-Smtp-Source: ABdhPJzh4r8WTUwFvEjXnojlYh7kYOqGnW5+LeW7Vki/eT3Hq71WcvBHAdvXIw4h8juEXdJyPkNLMXL8iEjG6+AcyQQ=
X-Received: by 2002:a05:651c:200a:: with SMTP id
 s10mr1348468ljo.19.1592457939856; 
 Wed, 17 Jun 2020 22:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <HK2PR04MB3826A23CDAA3FC0CE9660D1BFE9B0@HK2PR04MB3826.apcprd04.prod.outlook.com>
In-Reply-To: <HK2PR04MB3826A23CDAA3FC0CE9660D1BFE9B0@HK2PR04MB3826.apcprd04.prod.outlook.com>
From: =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Date: Thu, 18 Jun 2020 13:25:28 +0800
Message-ID: <CAGm54UEHECbM+UjOsGvWDv3XvZr0NZq+-coDPe-MFvGyyDAOsQ@mail.gmail.com>
Subject: Re: There is no kcs device in the /dev directory
To: =?UTF-8?B?5ZGoIOi/nOa4hQ==?= <zhouyuanqing8@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "uperic@163.com" <uperic@163.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 18, 2020 at 12:51 PM =E5=91=A8 =E8=BF=9C=E6=B8=85 <zhouyuanqing=
8@outlook.com> wrote:
>
> Hi everyone,
>
>     There is no kcs device in the /dev directory=EF=BC=8CI used the follo=
wing command to find it in the root directory, and I did not find ipmi-kcs =
device, please help guide, thank you.

Probably you could check the device tree to see if the kcs is enabled or no=
t.

>
> 1.find / -name *kcs*
>
> 2.Below is my kernel configuration
> CONFIG_SERIAL_MCTRL_GPIO=3Dy
> # CONFIG_SERIAL_DEV_BUS is not set
> # CONFIG_TTY_PRINTK is not set
> # CONFIG_HVC_DCC is not set
> CONFIG_IPMI_HANDLER=3Dy
> # CONFIG_IPMI_PANIC_EVENT is not set
> # CONFIG_IPMI_DEVICE_INTERFACE is not set
> # CONFIG_IPMI_SI is not set
> # CONFIG_IPMI_SSIF is not set
> # CONFIG_IPMI_WATCHDOG is not set
> # CONFIG_IPMI_POWEROFF is not set
> CONFIG_IPMI_KCS_BMC=3Dy
> CONFIG_ASPEED_KCS_IPMI_BMC=3Dy
> CONFIG_ASPEED_BT_IPMI_BMC=3Dy
> CONFIG_HW_RANDOM=3Dy
> CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
> # CONFIG_RAW_DRIVER is not set
> # CONFIG_TCG_TPM is not set
> # CONFIG_XILLYBUS is not set
> # end of Character devices
>
> Thanks
> Harley
