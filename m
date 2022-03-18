Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAD04DDC48
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 15:56:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKnBq36qHz3bNB
	for <lists+openbmc@lfdr.de>; Sat, 19 Mar 2022 01:56:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NJfvfS01;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=hughsient@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NJfvfS01; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKnBS1skCz308B
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2022 01:55:42 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id g24so10407670lja.7
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 07:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=roliexHUW2qJMWsDNgn/V7sWJ8eDwQov7sgeEG3+dH8=;
 b=NJfvfS018TIK+2DF1P0RP54y2LZ63taufI6KIIp4hfH3RlvBMSfg8h8qXTLMT6hjSx
 L5nE74KW9zzVlYHZ75d1kcQswcCvdg5M7FKXY2G1haehiMjs7vi7fSfzjTSyQ2Rk6GBn
 jvyxUQjgREYXn11mtReiTLhrpyMB36hc5owLrGE39NcTw3toMHqy3ENjP5ea7mhqQUs/
 mrC0nyDUSlQJOQ1m64cyJ7m0TPqHUW39ybE+2QUOv9W1Hd/HJXgl8AJpiKjExuZt5awJ
 nMZC9BhrFmD98667e7x2qgyDk1DIZIvaBzYbjv9/GJz7whYqg6jnn5eeucmxYYgODUdG
 +ZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=roliexHUW2qJMWsDNgn/V7sWJ8eDwQov7sgeEG3+dH8=;
 b=c5BY7A0Xqjf+yYoL1JsCs2EJ0l2jZZe0tvjDLYSsoYBRCgczTvrV4SNMpMyj3g5Hu1
 BhBDaVsOlZD6S7fGVaKcEdXR7UOWWElGI8zOr9KC7itpbAoAX9ix5aJOG70Z3rKzVAvz
 9r8Izh6sj+QbNgTtctOyczRIUlOKpbSj3fq0VHmIAyJFh1EtJ7QoFhrV+vjPF9fgrAzt
 Wa8omhgIQg/01VhCYsZwC5xH2kSWIS3qPUkIwl0qASLO1ED/Kh11R4Q5Zf3tT32jFRfn
 J4CRA1ROJGqT/SEwlg3dyYSiRAYJrbkDwdBzKhUjANf/KemeoZVIrDdcibk2IqxCMQzL
 TdHg==
X-Gm-Message-State: AOAM530SAU6CyJ+mrOPcWtw86IWCS3pZSfi84NUO3V/4rkpLQr3158R1
 vm3+kS0RYb+0AyT2R0KbFHL8cG0X+fcgrWRwxRc=
X-Google-Smtp-Source: ABdhPJxCKAJAIvzK20Ym+2SYB3FdtoqtGtNGhTUdMnLS2A75TA90PO8n49jkzjVCT7X7cRQw9kPMBdEvcvE1ueRZM1U=
X-Received: by 2002:a05:651c:1543:b0:249:218f:2228 with SMTP id
 y3-20020a05651c154300b00249218f2228mr6278491ljp.492.1647615335560; Fri, 18
 Mar 2022 07:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAD2FfiEKfS-=ER9qJ9mftjCsiAiseytrDCcbiCn+EcyKOLd9Mg@mail.gmail.com>
 <YjO0QqLKbNned7dk@heinlein> <20220318133944.sczzlgki25bynokw@cheese>
In-Reply-To: <20220318133944.sczzlgki25bynokw@cheese>
From: Richard Hughes <hughsient@gmail.com>
Date: Fri, 18 Mar 2022 14:55:24 +0000
Message-ID: <CAD2FfiHaNRtTxvick0J_XQ5SQzyXqvi8n+hav_bNrixUE_fqjQ@mail.gmail.com>
Subject: Re: Software Bill of Materials
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: openBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 18 Mar 2022 at 13:39, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
> I think many general purpose offerings do this in the way Richard
> describes.  Can we include that world-view in the disucssion too?

I think it's all going to be a hybrid solution anyway, e.g. some
auto-generated, some generated with some additional input and some
just curated. I wrote a bit more about the bigger picture
https://blogs.gnome.org/hughsie/2022/03/10/firmware-software-bill-of-materials/
if that helps.

Richard
