Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F0E5EEF98
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 09:47:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdQSr319Nz3c2v
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 17:47:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=IydWqzkp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=IydWqzkp;
	dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdQSS5jmPz2xKV
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 17:47:34 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id a14so624005ljj.8
        for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 00:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=xyS/QwUQvrSM6CBtjMF9+ED/ghVx/NCN+vMvO0iX6go=;
        b=IydWqzkpBD7+TdH2625yeV8tHXuRr+/uJfCGoCtdWCCX7H5r+HVrtwYtU0nP762SsY
         XMgrUnFCUEXc3RvAypmPccmjjjqzM4Q9UFVyE5VShpnwxDGZA13QG1Bfpq+agDEEnVml
         9SKYGPdVeK9tK4b9C9qULb4gtHp+k99lNyw+OL7j/LTsYAfcHrWCqx7gy1izNtAEni7w
         lMS9Aj9LjJJqEC+uMQUjWvRSIm7lTt/56rVoEwkPbjMLpO/9wWo/gLpoadn4HizaFVNE
         XPPK/TLxz0l/x4KrIPSzMli4BZ32b9qTq5t2Cc0dxFf7p+JinD54GfhyFWueB5agBVkC
         PJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=xyS/QwUQvrSM6CBtjMF9+ED/ghVx/NCN+vMvO0iX6go=;
        b=E+Ufh61KHHt+WlO0CDOz168S+vi44g7NmHjF/ZRtjGo8BYx7B3WvqUL2qdPj0YDtMU
         4XNDU6wBjsqWqShtyTCtnuNRwWU7jHMJgbhYgnRq8ZkJU9WpQaz3yIr2WPlrP+vWCnuY
         q5E79/E9WAsoMVdYA+sSPrJ3GGREjmgun73TaO42hZZDTm1Ieai0zkpKq7XIhp0XRscz
         s4Zjpsju7ORVGUNsP1JMeFXNMfCJNB0+Jq52zM4kGwQ9go0IdafMAQM0QoeB0hrkQC2/
         4uP5le0vLnlDG+f1VQAEPTmmJ3gZWYnUTQ45v41PEBlDyHq9QzV/0uGIxZc9gCbx/DB6
         GRdw==
X-Gm-Message-State: ACrzQf0VpH04UJvbhNQQ75E30N+w5T3R11cu0E5vNSKKZXeWPucEva/5
	Gm+k+LdEYo1Wv2GIrZ2hMh/GRb6CK3wDkUciwMVDWg==
X-Google-Smtp-Source: AMsMyM7qXt6yhk4i3mCm43nFvssFGsIwNE64dDNfKoR4nrb8RBovCgHXLx0IMm3odHd7EG3tdEUl0amWF61yr0DtOes=
X-Received: by 2002:a05:651c:198a:b0:26c:27a:c504 with SMTP id
 bx10-20020a05651c198a00b0026c027ac504mr655514ljb.443.1664437645389; Thu, 29
 Sep 2022 00:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <ddf0d5f853c443e285b986581b01bd75@ti.com>
In-Reply-To: <ddf0d5f853c443e285b986581b01bd75@ti.com>
From: Zhang Jian <zhangjian.3032@bytedance.com>
Date: Thu, 29 Sep 2022 15:47:14 +0800
Message-ID: <CA+J-oUuyOiVc-b7quBWVaauwe=zcSjU1m7Bg0XDwnv05E8A27A@mail.gmail.com>
Subject: Re: [External] ipmitool reading i2c devices
To: "Patton, Schuyler" <spatton@ti.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Schuyler,

On Thu, Sep 29, 2022 at 2:22 PM Patton, Schuyler <spatton@ti.com> wrote:
>
> Hi all,
>
> I am trying to use an ipmitool running on a Linux PC and trying to read the i2c bus on a board running openbmc. This is the command I am using:
>
> Ipmitool -v -I lanplus -H <ip address> -C 17 -U root -P 0penBmc i2c bus=1 0x40 2
>
>
>
> Looking at the apphandler.cpp code I see that a white list is required. I added one based on the format described in the cpp source file. This is the error I am seeing:
>
>
>
> I2C Master Write-Read command failed: Invalid command.
>
This command is dangerous and controlled by ENABLE_I2C_WHITELIST_CHECK,
There are 2 ways we can use this command,
1. Disable this option, let i2c-whitelist-check=disable, this is dangerous.
[0]: https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-host_git.bb#L29

2. Install a white list, see
https://github.com/openbmc/phosphor-host-ipmid/blob/master/apphandler.cpp#L1554
>
>
> Othe ipmitool commands work such as bmc info.  Is there additional config that I need to do to be able to read a device on an I2C bus?
>
>
>
> Thanks and Regards,
>
> Schuyler Patton
>
>
