Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5891533BB5
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 01:05:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HrJ63QCQzDqV1
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 09:05:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Fph9kr69"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HrHX1t30zDqSs;
 Tue,  4 Jun 2019 09:05:11 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id 14so11610720qtf.0;
 Mon, 03 Jun 2019 16:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gKC8wZFQPFd0VqtTDuB/ARVN69VSJ5fdx588jc+YHbA=;
 b=Fph9kr69BV+Z5ewLR8tUn0LqxNfGrpbUUhyh6Sz9DGsYoQqpSIST+V6e78/Eqf5VwM
 M2NYCQqLMxpeLpjwUBt1kk9PT55+SqUEDhmUrDp69/235v1Cp3lW9I3LM4cxPi3yrn64
 o4L9Uile7n5d/VnKpcBwOrfrpE+/DWYcQ5nMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gKC8wZFQPFd0VqtTDuB/ARVN69VSJ5fdx588jc+YHbA=;
 b=IqbQCJ2kIqAN1+KG6x0rcimiQHSVKAMe00ZIln6o0HaeyjmWHEvxapiOASKPMaTDCT
 vFK9dPW+3aflpJGJrOuNg3+gsp3ibVlCLJcv+8G4sNTKgkhO712O+jueD9sHe/Tl2Idy
 9UP7o2j6tehvaDZd4hjwsIm7xuPRLpDYEbXZqyz8vsHNXJR5AmY4+gcGTdJw3dVU+Lxo
 qFFBT1OJYb7tZomlLFYpQnzA/K7Agu/gmDOpc9G+MyyTpAEBONkuaznU3q3nAPiWg8wQ
 x3fFVMTYVY+bD3EfGFsFlQWQn3X1VgVGdyToi1IsrTulquGUQQ25kOliLx6UzEFD7WzC
 wfaQ==
X-Gm-Message-State: APjAAAVI/jCFXQxGjLyzju2An+3RhGrUeFPkNuOTC1jz80ePn8q5S6Z9
 qAgoP1VulR8fUJ5neLxI/ceIOCHQDY1xUaID97Y=
X-Google-Smtp-Source: APXvYqx2QJTwlNwzzlPfoov62Kue4C8bYtxTO3h/vLI+WOMXehesYQYiJEk9JUsIFreM1Hku84aoug4H2yLokYZCTec=
X-Received: by 2002:ac8:5518:: with SMTP id j24mr24944260qtq.255.1559603107854; 
 Mon, 03 Jun 2019 16:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <1559334700-51970-1-git-send-email-anoo@linux.ibm.com>
 <CACPK8Xc8_SAkxQ1_HTFOkCsV8ejWS=MVXazH+bvDcE=9xKLF8A@mail.gmail.com>
 <66ef1d874db0bf4963f3ea80d3436c3f@linux.vnet.ibm.com>
In-Reply-To: <66ef1d874db0bf4963f3ea80d3436c3f@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Jun 2019 23:04:55 +0000
Message-ID: <CACPK8Xdg+epi33nz5f2euLOR3UWNiVSXP52hUcstE=63XnNrjA@mail.gmail.com>
Subject: Re: [PATCH dev-5.1] ARM: dts: aspeed: swift: Add VDD (IR35219) devices
To: Adriana Kobylak <anoo@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 3 Jun 2019 at 19:37, Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> On 2019-06-03 04:06, Joel Stanley wrote:
> > On Fri, 31 May 2019 at 20:31, Adriana Kobylak <anoo@linux.ibm.com>
> > wrote:
> >>
> >> From: Adriana Kobylak <anoo@us.ibm.com>
> >>
> >> Add the VDD (IR35219) devices to the Swift device tree.
> >>
> >> +       ir35219@70 {
> >> +               compatible = "infineon,ir35219";
> >
> > There's no driver for these in our tree. Do you have one coming?
>
> Eddie will be writing one [Swift VDD VRM device driver
> #311](https://github.com/ibm-openbmc/dev/issues/311)
> Should we put this patch on hold until the driver is done?

Yes. We generally don't put things in the device tree if there's no driver.

Cheers,

Joel
