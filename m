Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 219247274A
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 07:25:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tkLp2BFXzDqN7
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 15:25:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KfZJ+U6j"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tkLF72L3zDqGL
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 15:24:37 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id h6so358627iom.7
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 22:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KfuR9GEEeiZxAFvbC7dth6tQfO9VuwUb89wEz5TjFsQ=;
 b=KfZJ+U6jTtDQIhdINAXgCoSzNHpwgWYT44yoMUyxdGj4TqtPHDaZWgPpbdf8hUXZdb
 sDAjlL7xpA70R89S3Hrt3tLyPwz30lLCVER3IMzMLfO/Pej0r6R0A9KEayovpQ395HMH
 VdZ+n3trMRtPZB3J5oxwmnebCcQqZuFaGz4jBSdlR7iH0UUz73jQX37mwc7eQUtwqJWP
 UpE1r/WS7qEjQpCBlGQiXFmh3H6b3wSbT2fasypCHK12c2bB8BJpQN7tQPSLGIhltDPm
 J2X8BwpuC8HYHz/Vzq0PDdLFR4M5qq2xKkLuN/KqXSfDg154vfk635xPSWts+iXAW+/f
 Ecuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KfuR9GEEeiZxAFvbC7dth6tQfO9VuwUb89wEz5TjFsQ=;
 b=crMo43w2SxoeB4y9l6maOQezshHreLHUFsUIhpR8TQZZqx3XCICcLAVCHT3+idN4Q8
 +tNmaYU62N3iQDUMT0CQW+Opui5wYpXIqdmMwlnk3FI8UHDgoAGSbEDSKsSNS9fgvwE0
 vAqQdisAQ6cYHqpaKNxN4jKi6SW2qyICnPHEO83jeayse6B2WXjyQLewws/YUW0sCD4D
 cV8HhLGHFI5YRhxpYzMa+4nWimSaBoN7tm4PIlgL33gD2l5Ks53cWIPvZSCSspQJ6RsB
 XkRZVuwh2Z/NLCR7yjCLVUK3zZoiMx/OfKrHf2XTKx4DsZ3AAERY33n8F5rVtKvRqC/g
 6yNA==
X-Gm-Message-State: APjAAAVkfFICJmg3Il5apAjdbCg6wUSmwukYVYGuBSRDSWZhQQlDGFqV
 o7Xtflgskg1dSUsxh2l/i7uNLI+VpCs8opWEDNM=
X-Google-Smtp-Source: APXvYqy0szJ/MAoKhlH+f5QOIySVYqyhWOF+RZNDFtL8IpBljj2J6rYdf7fTnSijLX9YLzktWxMfgQiE+22vXIeXTis=
X-Received: by 2002:a6b:901:: with SMTP id t1mr65805856ioi.42.1563945874001;
 Tue, 23 Jul 2019 22:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAHkHK09bSzJZ0eRPYH9cd7SOB4bektv4uK1WO1=dEcTec=jxTg@mail.gmail.com>
In-Reply-To: <CAHkHK09bSzJZ0eRPYH9cd7SOB4bektv4uK1WO1=dEcTec=jxTg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 24 Jul 2019 13:24:22 +0800
Message-ID: <CAARXrtkqv25KVKvhU5wbk0gLp=F4T=-hL4KJLdWkTK2twGt3gQ@mail.gmail.com>
Subject: Re: How to switch pcie/ocp Nics for ncsi
To: John Wang <wangzhiqiang8906@gmail.com>,
 Patrick Venture <venture@google.com>
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

Zaius has a similar design that it uses two GPIOs to select from 3 NCSI sources.
But I do not see related code from meta-zaius.

@Patrick Venture is it possible to share what you have done on Zaius machine
about how to configure the GPIOs to select the NCSI source?

Thanks!


On Wed, Jul 24, 2019 at 11:44 AM John Wang <wangzhiqiang8906@gmail.com> wrote:
>
> HI,all
>
> FP5280G2 BMC MAC0 is for NCSI, and there is a
> separated GPIO to select the NCSI to connect to PCIe or OCP
>
>                                         -->PCIE
> mac0-->mux(TS3L501)
>                       ^                 -->OCP
>                       |
>                GPIOH7
>
> I want to switch pcie/ocp NICs and preserve the state bewteen
> BMC reboots and AC cycles.
>
> My solutions is:
>
> use gpio-hog, and dynamically modify the dts file in userspace.
> But maybe it is a bad choice.
>
> are there any good suggestions?
>
> Thanks.
>
> John
