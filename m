Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8810B69EC49
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 02:17:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLyvT339yz3bWC
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 12:17:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=GqrAlrvD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=GqrAlrvD;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLytl3K9qz3c8h;
	Wed, 22 Feb 2023 12:17:19 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id cy6so18846406edb.5;
        Tue, 21 Feb 2023 17:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gT5ZSNIpI/yGjRCiyO4SCf25/TIbnWrvagpIK4outfk=;
        b=GqrAlrvDzA2RyHnVeA3Sjo6RvBiHGY5GTdpeagHbSMILyqfK7KUgYsA4MvEc51TaAJ
         cTaPbgN7CAVHFn9e+Ont7H2L2pb9JH0UO3zXX77atqPW1/ncQQ2mZc+WYeyV0X6ArmYE
         Mrq+qH1vBEnhEaEmuxAANgQxRHzzgjKe39XSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gT5ZSNIpI/yGjRCiyO4SCf25/TIbnWrvagpIK4outfk=;
        b=21nVSMxfrQ+vbhfUo/pfS1kyXMcCiIsa4ugC7nBzj0ePVXKEcAi8ryuSeOHaWybVlc
         wEBaZMXJeOhPUiRHnfAWsAd63efkoPjPwgf3x0ihP948Y+yry8Qpt8gQ7jcyUJe0/M18
         oQs0PZ1A7te6cjxtvN45pOwS+VB4vyHoNQkAxnQBEnc1zig793MT/Te81B0U+2MP8iiz
         L5iOxMamWb3AFzCs0Ze0kPbq+ucJUPob6wvSk49DBx6Kq2tdULNZ2bFjtzNwiVqxqrQm
         p6IwdiVCwwZX03GzdKWNZswBr8GKtLn399yji34pzuatkMnn0Ee7cAWqoDo58/dceaMH
         SIFw==
X-Gm-Message-State: AO0yUKVrP9rkHDjHUqCYYIhNAnydyc4ZhjDEB3x9zZz6A1n929btILBY
	mUkgkpuYe/i6pQ76d04+zmt9ORr5qjZbcOzOS9einaVJ
X-Google-Smtp-Source: AK7set9exesMePic266XNZcQh4feMCxFbPgJgTLHbhqLICr+GjcL5odlL/ZqdseIwc2ukLyyBshlOXwGx6djDfoQtn8=
X-Received: by 2002:a17:906:8295:b0:8b1:3357:b16b with SMTP id
 h21-20020a170906829500b008b13357b16bmr6714865ejx.4.1677028635979; Tue, 21 Feb
 2023 17:17:15 -0800 (PST)
MIME-Version: 1.0
References: <20221118065109.2339066-1-quan@os.amperecomputing.com> <32FE8D60-98AF-4134-8FB0-46B0CE7CA420@amperemail.onmicrosoft.com>
In-Reply-To: <32FE8D60-98AF-4134-8FB0-46B0CE7CA420@amperemail.onmicrosoft.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Feb 2023 01:17:03 +0000
Message-ID: <CACPK8Xe062i-6RsF6m+G4W8TfVVh=xOpmSevP2qvPy=u1_UqzA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: mtjade: Add SMPro nodes
To: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Quan Nguyen OS <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 14 Feb 2023 at 04:02, Thang Nguyen OS
<thang@amperemail.onmicrosoft.com> wrote:

> Hi Joel,
> Can you also pick https://git.kernel.org/pub/scm/linux/kernel/git/next/li=
nux-next.git/commit/?id=3D7c07553807c5125c89de242d35c10c206fd8e6bb to fix U=
SB gadget issue? It is to support multiple devices (i.e. virtual media, USB=
 Ethernet, =E2=80=A6) at the same time?

This is also in dev-6.1 already.

Thanks for getting your changes upstream!

Cheers,

Joel
