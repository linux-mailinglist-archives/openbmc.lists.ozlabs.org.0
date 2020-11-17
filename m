Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E36A2B561C
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 02:17:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZp2G2zvFzDqPQ
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 12:17:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UzrhGmoU; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZp1B17bVzDq5k;
 Tue, 17 Nov 2020 12:16:13 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id f18so14817964pgi.8;
 Mon, 16 Nov 2020 17:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8QL8bbL+oGG6j6oJ9WDXTBxGYp2AuVWWexQCgXhyNIw=;
 b=UzrhGmoUmM8ZOz+737sUWqYfpZdtl90uocjfMWmiVl9dmtFbEMana3Bc3y8L9pp7II
 wnIpwQwAs70r5FmJBe+p10GqkY84K1z+l1imKI25hqOoG7gPXQccxHBPMS7nsymmz/YU
 6gvgFLulRuKS2VqsccCdluS6S4soaChBTxcLwijS1onUrjad1u/DvPJe6e9ZvdeeOC5T
 CbCpRZ4wvMez0H2dz5reHYPdu6qlyjTKzntDoQsCsbQzB5nGOkGax9Jk9UDSfO7fveLX
 i0TJvZVrRZnMqmZZplsdXRGfvKRfOlIQ6BQiVPIGbY0dtA0um6bhTEYCnAv7dpqPM6NB
 2ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8QL8bbL+oGG6j6oJ9WDXTBxGYp2AuVWWexQCgXhyNIw=;
 b=V3Uy+b0zu9RIqbstNwPa+EEYadJb7T9xH4/zzlxWygcSF+Uj0Hu74df9OWs2dFM2/A
 S2i9anhHHGSWPuSL+t0mgZAwEvcA3QRTsqNEEA6yU9H1OJtATI+PhUuEnah42/7OvSTD
 o3fHpwSFFo87HSFMqJ4iJSfD3OG+h8OkjXglHnM4S0SkZQvJrsKc5sA0l7meNptLMi0h
 0kvyUzgt5A0Wz8Ypd41TgQuFjZWZnSsSLjearSs4tpLn7T/eIGzl8lYKFHmy+VhnTFF2
 KaYndSC9z2k54jc15unE1vIL6sHNkwWFvB6NV0ZmClcRnH+lGaNPgOOj+H2qPK564aVt
 hTZw==
X-Gm-Message-State: AOAM533XkscPx9W3Aey5w+3NJ66KxZ1DhvRf2kE7BkI7YNSeOxTousBU
 RQ+nVsgLWnNAbGlwJMFkJuQ=
X-Google-Smtp-Source: ABdhPJyZmrK95Glb6r1a/zk7QiBx5GV1jnOBBZa8fDAoJbRhXkoD/TKm2WoqieMhtraGYKlO38A0hA==
X-Received: by 2002:a17:90a:4a12:: with SMTP id
 e18mr1870538pjh.9.1605575770256; 
 Mon, 16 Nov 2020 17:16:10 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id h14sm19306404pfr.32.2020.11.16.17.16.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Nov 2020 17:16:09 -0800 (PST)
Date: Mon, 16 Nov 2020 17:16:03 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: aspeed: minipack: Fixup I2C tree
Message-ID: <20201117011602.GA28529@taoren-ubuntu-R90MNF91>
References: <20201110072446.8218-1-rentao.bupt@gmail.com>
 <CACPK8Xcpj_LsYOJ=S0p1D5Wqof_2m7SLnPRantQen61B2_XjAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xcpj_LsYOJ=S0p1D5Wqof_2m7SLnPRantQen61B2_XjAA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 16, 2020 at 03:33:45AM +0000, Joel Stanley wrote:
> On Tue, 10 Nov 2020 at 07:24, <rentao.bupt@gmail.com> wrote:
> >
> > From: Tao Ren <rentao.bupt@gmail.com>
> >
> > Create all the i2c switches in device tree and use aliases to assign
> > child channels with consistent bus numbers.
> >
> > Besides, "i2c-mux-idle-disconnect" is set for all the i2c switches to
> > avoid potential conflicts when multiple devices (beind the switches) use
> > the same device address.
> >
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> I will apply for 5.11.

Great. Thank you Joel!


Cheers,

Tao
