Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 909A43910D5
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 08:42:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqhGM4mXkz2yxW
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 16:42:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=P+QNZ6AS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=P+QNZ6AS; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqhG52NB3z2xxk
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 16:42:36 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id c15so183279qte.6
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 23:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rMcHIfpjdk/sp1BoCf1r2xbssti1F/SX4Ghi8WRs+a0=;
 b=P+QNZ6ASdOIGU5uXvAKBr+3V8AVHZksajl1uiN76Ku4Km6G/4tsUDWmCnuwW9srcPu
 04pgJTEkU7Cas3T8/hCZyujj9tec9tlR+Q093wJEsSFHIBH96RkDdkms8x0xO9sDswxk
 3hVtslpPkbf4xaxW/UxnVK64JWdJ4c3hVP8U4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rMcHIfpjdk/sp1BoCf1r2xbssti1F/SX4Ghi8WRs+a0=;
 b=RbMpgZCH6t5IEQmdmUci4w0G/iKOVLfe4ugRgbjqVk11UNE4oI5a2XStt9SK0OblV0
 /K8AhAHaBCzkdcEVZ1CZWxr8NDIXVtqwi0pD6ETSboBczPTASbObmpXk/nqM3qViJ6Du
 Lqq8UP2NKjAVKysNVgn5gKC/ybTG91CoLgnIaYbWLUPeF5rgh9ZHlDOxoEiDGJkzciAB
 Wu/qu07mhJmzuZW4fyUFzgj2FeoxZzcOmClCgqPZdM5aEapQf54BBM8qum31qThQE2dJ
 cpXTwSWUq3pnVDklUwGrgdb41wIl08CaOqJksile28PnVF/2/klPEn1QebvPrgF8iHYo
 aeKQ==
X-Gm-Message-State: AOAM531HjPgMT+w6bM3f1ACaCSUoWQNNE8g/hC7PaW1Pni1le6K7sJKl
 AXfFndWZJznLUBURzL0LGLGO8LxvRYJimzDyPFI=
X-Google-Smtp-Source: ABdhPJyItdusLmmyn0bXKQ0BxpZI9a7FI0CFPtIguJMurd7dUYuj4V/7shdUSLCNgAuPeyd9qqRj/SVFnWW3EfYY1fk=
X-Received: by 2002:a05:622a:648:: with SMTP id
 a8mr22926963qtb.176.1622011352646; 
 Tue, 25 May 2021 23:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210526062908.1662985-1-andrew@aj.id.au>
In-Reply-To: <20210526062908.1662985-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 26 May 2021 06:42:19 +0000
Message-ID: <CACPK8Xf4Q+8_oSPoZyPz0XgLK1VCmJZjJ+JxNate-xpF8pA9Mg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10] mctp-lpc: Match register addresses to
 updated devicetree
To: Andrew Jeffery <andrew@aj.id.au>
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

On Wed, 26 May 2021 at 06:29, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> This driver was overlooked in the rearrangement we did upstream. It will
> go away soon enough with the reworks to the KCS subsystem.
>
> Cc: Andrew Geissler <geissonator@gmail.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Thanks, applied to dev-5.10.

Cheers,

Joel
