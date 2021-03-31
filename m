Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5639834FAA1
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 09:44:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9JGy2Fksz3bx5
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 18:44:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=cffktVa3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=cffktVa3; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9JGj1Ncqz2xYv;
 Wed, 31 Mar 2021 18:43:56 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id g15so18487086qkl.4;
 Wed, 31 Mar 2021 00:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9fLwNldZAVcEFbnzafL88z8nyPvcygnyy6SA/tbSgoQ=;
 b=cffktVa3X1Rg1vbLm4GZOPnYL7vaTyFmVPSCvCZFWM9vpiTgK2VHTmJ8VVvJxRlwaM
 VWVVDlAJfY7QTeouHs2PlTtl6cVGrSx28JMZDz9Y63rTAskFRcSYm3QNtzhJ+g5P6Vth
 c4JGC0JckCBhjSqoZ4Sn5q1midRjhQhPPh7EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9fLwNldZAVcEFbnzafL88z8nyPvcygnyy6SA/tbSgoQ=;
 b=e1NMUCzxn60MpyxxYDcRRf2sQxKBfNGtDvwKkhr0wSc8y74MbLvV5fhN26oAQtmhfP
 wb7Ei0uy+1SUzFSk0BmdGGuf2ZSYjR3651byIizwKw3ZWaNmr9HCOSA5DUEUZn1Jtf1Z
 qcp8KLV+9/d2UNt1AanIZaLdl6BtUxw6DdWanpsBmABKduWqOZvU4gytqRu6RU0YaVk8
 r7uct75ktNPzYB2i9hiLPEWErkZQo15ey33Qzwe4DodPYv87eGw8B09/PT8mwLV5DtQm
 g5Lo2RmBbyVAiPDAQG9dZ18ObEESWkExZGN5AGbLAmH2gBthb015YsF7atZN5bE6imZr
 HAdA==
X-Gm-Message-State: AOAM533yqURn3P4cAkqo67kal+UqpC/jXU4938z8H0zNRzHcl3ZnQ8Kh
 hmE1QoHPDoAt3xKquGReiaLT80u4q6TXDx5Q1+o=
X-Google-Smtp-Source: ABdhPJx0+wo2BnZkBPanhIURXpEVT9uMJNN95cUQIWK7OTUuooxK0Kdh+cOK8Nk7AwARUp8eroSraEjIGYAXCzOJXG0=
X-Received: by 2002:a05:620a:1410:: with SMTP id
 d16mr1878260qkj.465.1617176632868; 
 Wed, 31 Mar 2021 00:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210330002338.335-1-zev@bewilderbeest.net>
 <20210330002338.335-4-zev@bewilderbeest.net>
 <CACPK8XcwMYgc9R24KuGa0hqKQAxawDScHp1+y62aeEvcpvPiSw@mail.gmail.com>
In-Reply-To: <CACPK8XcwMYgc9R24KuGa0hqKQAxawDScHp1+y62aeEvcpvPiSw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 Mar 2021 07:43:40 +0000
Message-ID: <CACPK8XfU_az1WpOFjtVbEbqO46sv4eWbjSGwbzua4niQZ3pUQw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: aspeed: add ASRock E3C246D4I BMC
To: Zev Weiss <zev@bewilderbeest.net>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 31 Mar 2021 at 07:41, Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 30 Mar 2021 at 00:25, Zev Weiss <zev@bewilderbeest.net> wrote:
> >
> > This is a relatively low-cost AST2500-based Xeon E-2100/E-2200 series
> > mini-ITX board that we hope can provide a decent platform for OpenBMC
> > development.
> >
> > This initial device-tree provides the necessary configuration for
> > basic BMC functionality such as host power control, serial console and
> > KVM support, and POST code snooping.
> >
> > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

> > +&vuart {
> > +       status = "okay";
> > +       aspeed,sirq-active-high;
>
> We don't have support for this yet, but I'll leave it in and you will
> need to send a follow up if the property changes.

Oh, I missed that this was part of your series to add support for that
property. Please keep the device tree out of the series when you
re-send the vuart patches. They go through different trees, so it's
easier if you send them separately in this case.
