Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 925CA413EA1
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 02:25:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDfFy2X55z2ynb
	for <lists+openbmc@lfdr.de>; Wed, 22 Sep 2021 10:25:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Bd+uSGdZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Bd+uSGdZ; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDfFY0PKGz2xtQ
 for <openbmc@lists.ozlabs.org>; Wed, 22 Sep 2021 10:25:03 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id w17so1085131qta.9
 for <openbmc@lists.ozlabs.org>; Tue, 21 Sep 2021 17:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=CaogP/yXlrk2pCDy0PVaSQzfWJAT0OGevV+3Ma2rybg=;
 b=Bd+uSGdZzVaDPT/O4e9Af07kwHABCookaPeQlkkMT31O/V7J3SYkfd4qdWzHtUrt1Z
 Mbmi4Ibwp3Iyfw+X9UCj8O+zUNwWzeJMHt+WO80abgjetsgfYdYJUc5d1jK6vDtOIgoE
 x+XM8nZNKhODd6fhccENDOF7mOPE4y8xluALs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=CaogP/yXlrk2pCDy0PVaSQzfWJAT0OGevV+3Ma2rybg=;
 b=d+BSX84/+ti9+5NLTRnTReQZnrdY+sRCxTjs2OqH/PCdCHGO5Mi4sY4JVrXdyPFmnj
 rz0s2YR594oUz4/lyz8VOMWFYCXpkP/RWx4xuG65adOvi9hiz5vRAK2UiI0PCd8LDOqj
 zd1u7IkuxAeYjPahOQJwnQa5g2BLzktqg6mWI/Eu512uxvLX7qsv6kg9RU9PlZtdrpdb
 VGkXSq7h/zyrSXXX+qlgHzmNVO8n21rzMVZi4wNbfBoKQmF4iZkOfA7TaGIRfIRrmks4
 SPir91+uxcVLoH0fg5PGgC3scYkG6vYJLYwF8GdjhrrkdACdNq8ZSyVTsAzR6AUJZPQz
 WKfQ==
X-Gm-Message-State: AOAM532tfWHKcBtZALvvPnrkDMGeH/KGLP0SpKs+ZCeBJQas4NpwyXE1
 wp8me9AamCJwarY3zV2VS72D3UZMvWABT5pi8hSY6yYF
X-Google-Smtp-Source: ABdhPJxS5Qm49bIc47/Cr2+qwxxJs3jXAw+ZDSX6rMrtFpTlNv3HJAzFsPqbiRVfnbEqvt7gzVKjQgHE+qaQuweW1H8=
X-Received: by 2002:a05:622a:45:: with SMTP id
 y5mr17245174qtw.145.1632270298460; 
 Tue, 21 Sep 2021 17:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XdMu_xc+3dp7T57azkMp==1W5xpt6t=bSZWiNaA7vDJ2A@mail.gmail.com>
In-Reply-To: <CACPK8XdMu_xc+3dp7T57azkMp==1W5xpt6t=bSZWiNaA7vDJ2A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Sep 2021 00:24:46 +0000
Message-ID: <CACPK8Xeu_3y4Mnsk-_rzWRQsx0nY=0cuqkM4FGoz_sbhOZ3BCQ@mail.gmail.com>
Subject: Re: Kernel moving to Linux v5.14
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 14 Sept 2021 at 02:11, Joel Stanley <joel@jms.id.au> wrote:
>
> The openbmc kernel will move to a 5.14 based tree for Aspeed and
> Nuvoton machines.
>
>     linux-openbmc: Move to Linux v5.14
>
>     This moves the OpeNBMC kernel to a v5.14 base. There are 78 patches in
>     the tree, plus a the MCTP core and device tree changes that were merged
>     in v5.15 which have been backported.
>
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/46847

This has now been merged. Thank you to those who reviewed the change.

Please address future kernel changes to the dev-5.14 tree.

Cheers,

Joel
