Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 691EA26C18E
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 12:19:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Brx0l4xTFzDqVS
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 20:19:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=lhTd8dEO; dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Brx013RrZzDqCs
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 20:18:56 +1000 (AEST)
Received: by mail-lf1-x142.google.com with SMTP id b12so6343364lfp.9
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 03:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=csIwAabSYDj7rcpRTTD+orxcNqW1qSuuLquwhQ5NQD0=;
 b=lhTd8dEOCBqOBh8YCLPWAAvUbXxlQPV/DfiftcWR6EPU7Jx7KqEtUxjU0mkf8UCFPY
 hjbV84fksRSJgvChHzMWk/IbcpAqYpsgPqZdT47B4hBODnVAksalbxxcTFCky/hBOXzg
 TA5frC+MtoohvXzDeDkHcBAf9IEuh34b0oyjTPPGwic16yUMMhGihL4jHmYBs+qNLA+w
 uPmmvAsjA4x3Hv4c/I4ayj6gtLT0SaJfR4cig95iotuwwxSk0rI3Zj4Gi3xOucOTTOgW
 FGli1J/+xzyCJ33fdQLSTrTklhsazcFHVVoHwMma/be705P5cosAB9pVoM5HTGlPi/Dy
 xclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=csIwAabSYDj7rcpRTTD+orxcNqW1qSuuLquwhQ5NQD0=;
 b=Sb7Xj4/2GVBLAknXiSU2A+1EGNAG2DLA1wOMdw7VVutKnZ+S2vwyb9H/MeCC3tAYbG
 uvjiKaagQ8UqWhOHH7w6MnzVqyo/jtBo1uReWbz96h/AtkEHwoL2MwyZFAszn5Aaq5Qt
 L31o+zgIzTAIfSKlLN3OuhcSDsNbD+rlFMfcFlaGhZwNe413FexZRLAX9VxFf19E8DlM
 QbX6YNXPxUCOlrWxOnL8xD0VvV8ewf0I6lJAeq7u+7XMeY31Rti3H7ItFXdcrpzaXM5N
 yDItXhS8W8dYs5ZZRzJPPydeITVdbr+VkKUiA0AC+2MIjDiAunzvQyyJxfXAOxKYXIWz
 LLXA==
X-Gm-Message-State: AOAM532x7RRR5rtpdoyA3ylZkj56H/eoS13JV4HOg6o1tvV5N+cjmkr1
 ap3PuYclpTe+ISEA/cbi+8AvlfprjcOio03jOl8hew==
X-Google-Smtp-Source: ABdhPJw2kRKTDUO/AdshPJJJJsc9z4qH8bTKQwWN4weIgrc1MNEun+cOkNClQlL7VjvW3ccHdCXRUQ15JO6oe3hyBLU=
X-Received: by 2002:a19:c645:: with SMTP id w66mr7534634lff.112.1600251531410; 
 Wed, 16 Sep 2020 03:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UETBZ-EAR-2tha+qHTH7h3H_1vZUe2Tp5kOTzY0isKLtw@mail.gmail.com>
 <636cd7a2-8b60-2868-104f-70378bf30a08@yadro.com>
 <CAGm54UFJYnk=dcaWd7rsyUoBHqMkwgSLi5oYAjsMCmkugE+HaA@mail.gmail.com>
 <9ae6b1f98e354503aab6ed1af5452e8cffba7d7f.camel@yadro.com>
 <CAGm54UHG611qtbKObUkFOYjaSkSd+tMabJ=kOwo9TkauyejyRg@mail.gmail.com>
 <27aecca09a3f74d12974bfafde830ded5d69a7e0.camel@yadro.com>
In-Reply-To: <27aecca09a3f74d12974bfafde830ded5d69a7e0.camel@yadro.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 16 Sep 2020 18:18:40 +0800
Message-ID: <CAGm54UFFzkTTKCXCCpFunp8i23Eu8n25gXWcjx5RWm9ioWwrdg@mail.gmail.com>
Subject: Re: Design proposal for dual BMC flash with "golden image"
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Alexander Amelkin <a.amelkin@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 16, 2020 at 5:55 PM Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
> > For now, we use "devmem" to manipulate the registers for testing purpose.
> > It's nice to have that driver, but in productions there will be no
> > need to use devmem nor the ioctl on watchdog, so it's not a must for
> > us to use the driver.
> >
>
> And how you switch safely into golden side in this case?
>

The plan is:
1. When the primary flash is broken and u-boot could not be started,
aspeed will switch to the golden side automatically.
2. When the primary flash's u-boot is OK, but the kernel/rofs fails a
couple of times, the u-boot could detect this and switch to the golden
side by setting the related registers. See example in
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/aspeed-layer/recipes-bsp/u-boot/files/0005-config-ast-common-Fall-back-to-secondary-flash-on-fa.patch
