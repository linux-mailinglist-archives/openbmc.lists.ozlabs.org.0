Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B753D44A9
	for <lists+openbmc@lfdr.de>; Sat, 24 Jul 2021 05:53:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWsjG592Qz30Cf
	for <lists+openbmc@lfdr.de>; Sat, 24 Jul 2021 13:53:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=DRbfS5kq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=DRbfS5kq; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWshx48MMz2yfh
 for <openbmc@lists.ozlabs.org>; Sat, 24 Jul 2021 13:52:48 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id t68so3399983qkf.8
 for <openbmc@lists.ozlabs.org>; Fri, 23 Jul 2021 20:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S9nA0xX4VWcLUqWx9FTIcNz6bNZF1QD/vi29DqjSFCA=;
 b=DRbfS5kqzjfc65IpUjhmmqB2D2Dq8sYaKRqieDqf8YMeGNIS/bFOGsz3f4rhVP1FXx
 wTFUpsdD1W9InP126d5C/ddlcl2Q2Ia+WMoEcRz6ujZjSdLm7QfTuTToLQCmsLLim3IL
 layxc7DUFTdCB12GbWavzK4oubpw/noN+TGSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S9nA0xX4VWcLUqWx9FTIcNz6bNZF1QD/vi29DqjSFCA=;
 b=O7zg2e38S+ZwsQvWPY7NxDp4GzTBcg0XiLUoDSrhvfjahT+WFY5VQssH1KxlVtLXFm
 sWtPwsVjd5Tj9RlekHodqnsv7EQpoq/2g5EM9rv6u8ycnZNPUG/we2DjOPnfO+C0w3cZ
 hwJA7rPILYeDKtwWmsF537MstE7JQlqd7dfnN/loQCfp4ifLMgn4Qzh05XtGnWab45D5
 1gKv3Rp8eq80pkmdpSlxZTdawY35ZmvxbASPtSFZJKmEasc/NjBo9ZDFyo8W80eQHv8T
 mF7zBXazKW7M+kTwrbQQgcgRQmKqDKA72qy+ZkP3FT2ChO8JvKSDGuVfVvmn685iSXzU
 e01Q==
X-Gm-Message-State: AOAM530WXa1XGGudrCCy5YJQr5p+tTyn/tz9plzlfnRORh1QI27KB/63
 /RHWqWDORsRgYhL5afG0LBf/LWVKIZKmCEYQpu4=
X-Google-Smtp-Source: ABdhPJyebfdekxKCQgx/mIURVbkmHThu2U3rUlXL66ZMaWE4u9qMOfXl3jm1/SfciXHrIoQGzP1JMPeNtuK0+FtFezo=
X-Received: by 2002:a05:620a:38e:: with SMTP id
 q14mr4774398qkm.465.1627098764861; 
 Fri, 23 Jul 2021 20:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAMyVXe=jZxh+r-=t-KW-w0eEznVb02Wfg5NS60O+CDQQ-0w4jw@mail.gmail.com>
In-Reply-To: <CAMyVXe=jZxh+r-=t-KW-w0eEznVb02Wfg5NS60O+CDQQ-0w4jw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Sat, 24 Jul 2021 03:52:33 +0000
Message-ID: <CACPK8XeM1vB2fiP01u4vGzGpwkoLjZXpxuFhTGTsbME-6zZDcA@mail.gmail.com>
Subject: Re: OpenBMC Uboot: Missing Driver for Ethernet Switch KSZ9893R
To: Sushil Dubey <sushilkdubey@gmail.com>
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

Hello Sushil,

On Fri, 23 Jul 2021 at 08:09, Sushil Dubey <sushilkdubey@gmail.com> wrote:
>
> Hello All,
>
>
>
> I am working on an AST2600 based OpenBMC project where we are using Ethernet Switch KSZ9893R.
>
>
>
> Microchip KSZ9893R is a 3-Port Gigabit Ethernet Switches with RGMII/MII/RMII Interface.
>
>
>
> I investigated OpenBMC/Uboot for KSZ9893R support but could not find it GitHub - openbmc/u-boot: OpenBMC "Das U-Boot" Source Tree.
>
>
>
> After further investigation, I found this driver is already upstream at mainline Uboot : https://github.com/u-boot/u-boot/blob/master/drivers/net/ksz9477.c
>
>
>
> Can anyone please take a look and get this driver in the OpenBMC tree?

You're welcome to submit a patch to the mailing list that adds this
driver to the tree. As the maintainer will review and merge that.

Cheers,

Joel
