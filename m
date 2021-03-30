Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C2434DDFA
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 04:09:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8XvG2zTkz3024
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 13:09:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=GVXvSyrX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=GVXvSyrX; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8Xv21ynTz2yyh
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 13:09:13 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id n8so14975610oie.10
 for <openbmc@lists.ozlabs.org>; Mon, 29 Mar 2021 19:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lsmXnflQ+REPrFug7OyLCNnkIdCF6Ac+j+SAiz0G6xU=;
 b=GVXvSyrXsICrT2GNp6D5Ne3ve75xYQ/NLzAZSfRO9mq/PdXYQ89Iw/ZewDQ6xcOKjb
 fBwgusm9kSmWG4Rdf94ckjAxvNSHu535EwVctXkAliZYNvHLLkSdhNdlQ0VeZEAdff74
 MU6qV0+6LvLZJ7UK39JqpZJrUJ4sRVf7ySlanjH4zuc+3bIJnAQuPYKu7OLtE+ds1GQ4
 gEj0LRzredB3rxHz2y+fUU0tithejqflmBPgFIsITvWuKAIgJ1eJDZupWnxShad7jZwP
 rytBvZds2xhKaFszhMKqXhTu619PsfIpLdo81/Ea6DTCzDsIn+VsYwrLFS1IiPtkxbvA
 rA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lsmXnflQ+REPrFug7OyLCNnkIdCF6Ac+j+SAiz0G6xU=;
 b=L+yDQAKEydL0pdrvWYiGN6HWXI7NEqCWdn9ennNrSi+3dwFEFqS9oUscw8RlZS1Olk
 W7JBKRI0imIyRqco4TFHaiE+1PKOLhVpokaRwfT76O75ETQJaraZoP5U5V3qNdLGQUk7
 7NLu/zcEFgX2xb3Ysy00i3iVOEXUV9j7lzQHCxANFr79lXMo3TeKkXf5s1A2pVf+cvEf
 r+seCClsCI/vDrwhrj76QnMu9IuQLQnlSBKxJ4oG+mCQXnViOxzSBDFv3NbCwp14Sz+g
 fgW/Q8vuk7oBVlRIRPUzBuLYeCnbI6R0hNB+hu+aiJXs+j1hOpNNxMrOlrrH81+oHZ/4
 AobQ==
X-Gm-Message-State: AOAM5327tBnqO934Msi6OO2+kU8DkhOaLD4Jqv5OFVphnBCLXzpuEm/h
 DcD9rors+3K/df8rmcCs2xIKU6EPJtSTPdulSb32/A==
X-Google-Smtp-Source: ABdhPJzTzL/fCgPipDQ2Fo7pehMwm08rXiOxZWM3YN82Kab1+UieOUH+kCywQ/oDdJHZrZpJVcxiP55o0h/xyBF7mm0=
X-Received: by 2002:a05:6808:98a:: with SMTP id
 a10mr1532877oic.28.1617070150502; 
 Mon, 29 Mar 2021 19:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <gmu36wVnmbV9lyt9EpYcnZmnPwjF9wtDS0N8K0jOk9UR2uUO0QwQaackzJRPLjil_ZqLxTzX3qEMGl3IE6baoIpS-xh9aMnQL3VkAyXK6KU=@protonmail.com>
 <0a6dd101-fbea-7fdf-b9a6-3895b48a7f47@linux.ibm.com>
 <5197cbe7-1a8b-80ab-2712-9a8f07457432@linux.vnet.ibm.com>
 <nGEUmLQrNSqmytvShVUeFvOUKjW1cOTYv9Hrcmj7LyP1rfIdLOt8f7IkqzPKaXHZXHRGYtHBcjnt6Qo5c1fIw4doEmVwMmGI2e2rNhNXWZw=@protonmail.com>
 <5bcbc6b0-b9d3-a002-0f24-97bd91ba5bf8@linux.vnet.ibm.com>
 <36bafa0b-5dd3-6da5-b18d-847ee4a46459@linux.intel.com>
 <CAGm54UEc9DOGZS0LLhFMP4SNw_-sJ2oa146wXfYvmF3As4xXsQ@mail.gmail.com>
 <axfftQgj4Du8QvWHD4CHEuPSLSJGtLZZTzpZplCpN1Mu63yr4Xm1RiZTuewl3CNqPUZ8mrmZdJsEJUOQiL39Ft64mfW7DzBdLrkDLhylGiY=@protonmail.com>
In-Reply-To: <axfftQgj4Du8QvWHD4CHEuPSLSJGtLZZTzpZplCpN1Mu63yr4Xm1RiZTuewl3CNqPUZ8mrmZdJsEJUOQiL39Ft64mfW7DzBdLrkDLhylGiY=@protonmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 30 Mar 2021 10:08:59 +0800
Message-ID: <CAGm54UHGr+F-vnO69PLr0MN699BDEDsZiHYoX1WPmF1DZnQLVw@mail.gmail.com>
Subject: Re: IPMI SEL Parsing
To: rgrs <rgrs@protonmail.com>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 29, 2021 at 11:37 PM rgrs <rgrs@protonmail.com> wrote:
>
> Hi Lei,
>
> Thanks, phosphor-sel-logger logs to phosphor-logging after enabling SEL_LOGGER_SEND_TO_LOGGING_SERVICE.
>
> The APIs IpmiSelAdd() adds entry to SELs (tested using busctl)
> But, "ipmitool sel list" doesn't print correctly. It prints "Undetermined Hardware Failure" for these entries.

You need to define the inventory-sensor yaml for ipmid so that it
knows how to map the sensor id to inventories.
Then ipmid will construct the expected sel data.
See details in https://github.com/openbmc/phosphor-host-ipmid/blob/master/selutility.cpp#L149

-- 
BRs,
Lei YU
