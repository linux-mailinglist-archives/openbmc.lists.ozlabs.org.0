Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D062306284
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 18:49:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQrhf1sp9zDqgf
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 04:49:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d34;
 helo=mail-io1-xd34.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ivsiw0f0; dkim-atps=neutral
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQrgd4cfyzDqYp
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 04:48:45 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id p72so2704759iod.12
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 09:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wU6DA1oPZsZiTRKdAHTddAptaWkJXyWVcNu0ncWSTSo=;
 b=ivsiw0f0nJA6DaDU1vyjFkcToXw7UvVLUfDOd/YwWGUKHMJ7eqepACZlhl7W2YD4iO
 oy3vSMLMIuCnGZwraIiBHiCctbI/60iEUaAT/6quwI/TOlcPWTlWq8INJ14NoOXzEVzd
 ITNHeYPDsSIOmTLMrh5c5NSBipKbIuso0B2QMFPRrqYN5td2Hj6ZahOMEzCq0e6t/SoR
 TZjXAEGfJsZpC1rOuuSpCc5W7G9xT9f3Vprtd/69KHEluiperGs8+6eFw056iMWMuGT5
 KsBozBOXXaExHCQ5ip9XSebR4kyq5EK7j7G/sgcfSYRpU9SE/k3CkITqGf7ge6fCaMpv
 TayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wU6DA1oPZsZiTRKdAHTddAptaWkJXyWVcNu0ncWSTSo=;
 b=Z6RvfTLnKXKbN0zaR+4unbGi6BeyofcU+ZNYZthwre1fi3qBCVADX3tUIixI+XDTWe
 sEnZgb3eg0GDMRlXOgBYKMEQnOmwoBzJ4GOhrFge1xQBukvwT48kRRr/7Ms/78QARpm3
 cjyjjio3YqE6Yl7EVf7mHzCeEGDofId66AmV3BK9J8EgpX0tP9p3a5yng4SOalxiXWa4
 zkXuYtrzJNXIY55sODbwAImjRCaPikCESigaQC2Ph3YxsCJmmUF5swfyt7et1i8QKIFW
 a3SilbG1B2P15Qr0ApUf1Fw4UMNbf9Nc4NWZmh07G9y8HFCPE/cXXqBEkHXiwMy02p+M
 9UEQ==
X-Gm-Message-State: AOAM530d/i4lg8w/qg9d9QUQu06NpT03jZL1eSuBY8EMwzCe+6PzCwQW
 XxQlgP4rQJrOa2E6o/n9ibRbogjQHbs+cPQl5QTnlw==
X-Google-Smtp-Source: ABdhPJy9lzcYelGumzeUWbskdq2orPyEQPw+tE63oWqje8HB/Grx+s6T2F/fZjove2ldR4ujdtgyeeLi15Xbka4uyyU=
X-Received: by 2002:a02:bb99:: with SMTP id g25mr9984867jan.140.1611769721623; 
 Wed, 27 Jan 2021 09:48:41 -0800 (PST)
MIME-Version: 1.0
References: <PS1PR06MB260095F62386276E75ADC5708ABB0@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <CAO=notwtzF96o9oJe=5px4KFWFdzWQxHMMbFdA2JmwEFBLC8bA@mail.gmail.com>
In-Reply-To: <CAO=notwtzF96o9oJe=5px4KFWFdzWQxHMMbFdA2JmwEFBLC8bA@mail.gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Wed, 27 Jan 2021 09:48:03 -0800
Message-ID: <CADKL2t4xDhpYmA==E6TczfNbvVReQJM0p84rwpy5vLrDXqsNBg@mail.gmail.com>
Subject: Re: Supporting new interfaces in phosphor-ipmi-flash
To: Patrick Venture <venture@google.com>
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
Cc: Brandon Kim <brandonkim@google.com>, Troy Lee <troy_lee@aspeedtech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 27 Jan 2021 at 08:04, Patrick Venture <venture@google.com> wrote:
>
> On Wed, Jan 27, 2021 at 1:44 AM Troy Lee <troy_lee@aspeedtech.com> wrote:
> >
> > Hi team,
> >
> > For security consideration, user might want to disable AST2500/AST2600 =
P2A functionality by default. To compensate the effect to phosphor-ipmi-fla=
sh, we're planning to support two alternative in-band firmware upgrade over=
 PCIe for AST2500/AST2600 (AST2520 and AST2620 are excluded):
> >  - Through a reserved **VGA** memory on BAR[0], or
> >  - Through a reserved **PCIe** shared memory on BAR[1]
> >
> > The usage pretty much the same as P2A, but it runs on different BAR, of=
fset and length.
> > This will involves modifying phosphor-ipmi-flash/[tools|bmc]. Should I =
create new **interfaces**, e.g. astpcie/astvga?
>
> I'm not sure it makes sense to create new interfaces, but rather to
> add optional parameters for those differences... but I've added some
> people to the reply line to help answer.

I'd also prefer optional parameters so we can keep all these PCIe
configurations grouped together.

>
> >
> > Thanks,
> > Troy Lee
> >
> >
