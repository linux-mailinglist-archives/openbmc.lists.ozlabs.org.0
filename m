Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFED44F259
	for <lists+openbmc@lfdr.de>; Sat, 13 Nov 2021 10:49:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HrrJd1bLYz2xvv
	for <lists+openbmc@lfdr.de>; Sat, 13 Nov 2021 20:49:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ity1z2Ni;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232;
 helo=mail-lj1-x232.google.com; envelope-from=hughsient@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ity1z2Ni; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HrrJ8252hz2xDV;
 Sat, 13 Nov 2021 20:48:55 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id h11so23561427ljk.1;
 Sat, 13 Nov 2021 01:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+eVVBHbfcnHbENvpLfwe3mTM6CIsHi7ue3snsouE+OY=;
 b=Ity1z2NigqKV5EUC8DB7qyQ0Hhd5Yx/Dnj2mk0ca9ifbw7jeTqlLnjEkpkJdov+eYt
 FmPksCdG3A/drE3vMfmnXjJALWBORBn6bX9+wgPjrVgltwQ247o+g4x3DF7CW48Pr2fU
 OqFs+M5imbKWTvgCQ+tSg9L5x6q6VsHlZvKyuRQas4KISKoQX2SlWRD3tMkZzrG/0Tyy
 96cxyoIRWcXnacsxLHfrBP0VKrC7ROpXb46xbitA8d6uBNc2MNYqBt+H7eEsLZ9DwXZa
 d4/7eF5zNjMyEoKFoq2nNDG1tUlAnEsjGdshEFvl/mjeS6avFo31LZoGAJwr0bTWocRa
 1lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+eVVBHbfcnHbENvpLfwe3mTM6CIsHi7ue3snsouE+OY=;
 b=SZ3HMlhtbUxUxwT+IRUIoAuCAUORjxtyXMYdgXqkpGqAAubq0K6+fp7IOzI7RpptFs
 lQvNRovmVBVmusnGHCvO3YCHBC7sTw0nddiGgmnHqgcpZwmw3jQZKnrDq2KOiSCl4Ui3
 9I65Oanel42HxXcp/+qVGJJ1/3AD2XgWg3X4izazfSqAArUI3ATDfu/GZ2/3w7zpti2Z
 99kJ4h+eNEbngKOP8vl0lvXRBv6WboB8VfpaCKgil7tWeACUjTzLf0md8bB/Fqw0hCyA
 F+8is8KFfU09l+keZLb3NDJ0pEQSxuHnOh6EjjecDFdf2UYddLTKbh7FutG4FXqFp26F
 0gOg==
X-Gm-Message-State: AOAM532J8GrofoqV9zUDlZ7lm6rtmMRYnVOXNVI+JDsW1BrKpFV3VNMq
 6ztqPXhQwMjfAqwmPLpt9qvh26U5BgoohBaAvf8=
X-Google-Smtp-Source: ABdhPJz5A3xJ9U3YyemcWmC6QxVljfUD/rLLxJWuY+4sKSwbcpSDHg3fvd46EJGjyhXZtUTcCbm3b6kdrufez5k7hb4=
X-Received: by 2002:a2e:8189:: with SMTP id e9mr21852509ljg.333.1636796928178; 
 Sat, 13 Nov 2021 01:48:48 -0800 (PST)
MIME-Version: 1.0
References: <20211112202931.2379145-1-anoo@linux.ibm.com>
 <20211113002948.GE14774@packtop>
In-Reply-To: <20211113002948.GE14774@packtop>
From: Richard Hughes <hughsient@gmail.com>
Date: Sat, 13 Nov 2021 09:48:36 +0000
Message-ID: <CAD2FfiH2YaD=m0wPrqEaKaUtJDEHmxMXwCU3LW9UdOfC+AnCeQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: configs: aspeed: Add support for USB flash drives
To: Zev Weiss <zweiss@equinix.com>
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>,
 "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bruce.mitchell@linux.vnet.ibm.com" <bruce.mitchell@linux.vnet.ibm.com>,
 "olof@lixom.net" <olof@lixom.net>,
 "liuxiwei1013@gmail.com" <liuxiwei1013@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 13 Nov 2021 at 01:58, Zev Weiss <zweiss@equinix.com> wrote:
> Hmm, how common is it for BMCs to have a USB port?

If it helps, the evb-ast2500 has a couple of USB ports, and I've
actually been trying to enable USB (additionally with CONFIG_HIDRAW)
so that I can do a demo that uses fwupd to update the firmware on the
attached keyboard or mouse.

Richard
