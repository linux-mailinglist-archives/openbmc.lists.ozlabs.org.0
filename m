Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E82383CA8
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 20:47:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkSml2VqPz302Y
	for <lists+openbmc@lfdr.de>; Tue, 18 May 2021 04:47:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=XWThq3UJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=XWThq3UJ; dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkSmS3sc4z2yWM
 for <openbmc@lists.ozlabs.org>; Tue, 18 May 2021 04:47:17 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id v8so5333444lft.8
 for <openbmc@lists.ozlabs.org>; Mon, 17 May 2021 11:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tMo2ZtiFpSwmvmi0iWXDlESEos4mJEKYQuWgbB7JP7U=;
 b=XWThq3UJOdCnRadQ7jg//WWAHj4M9e0xTNgvU/bpo0eQ518ea4ORLJ8cad1ufFPd1F
 Gtqo0HV+IISR/PiKJIHyhpDAUScOMpJb68FhJmLr+fcDF5o6d2LQN22AdultTebj4MK+
 pL//aWax136p/6ZRBwE2TTEBXJAulXmqs73r5vTRcG2YWn/F7SxFFgVnmNz8iHPIXDG2
 fuGcwfgFvyxh9OszRtBbm6iLUJy0vehR/XeN6BT1WSHVIUoXx5TmRjRQQ3KHavNO78ly
 YOQmg2uCoRWH51MVsID5ftp+mqP57Wyjnv0Rt5IVufmXnVaGe0/M08vBkj2ZhopnF2zI
 3sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tMo2ZtiFpSwmvmi0iWXDlESEos4mJEKYQuWgbB7JP7U=;
 b=du/sPBB+kUkS6FEajgyDMWGWdDRRbPiz3Mi/AzO0raTwYL2vB9romnsivyQeJwTE+I
 d5C31DBNmQvY6FGUQv4+DGH7lryN53MFW1uKmzB03VVOWp7NLCRs5FoyzZnmfJtdebcM
 W65MjMW3Uvtk8RplSGkw5JX0cULvSemt0B7u5wwLPZFM1RMqlZrejzUtqG36kkmZ4uxg
 QjhbeYPKQK9O6s4rC5MTdRG3wu9J3AqkIrpQGefpdQY8I6qJRPC8L1KkuNdA2pSPa+sR
 KBQxVu9iY+JVgOACyO/6HzTfvfvLtv5KwR+TvvvMABGls3afOK4jWbqefZfXercNMali
 zT6Q==
X-Gm-Message-State: AOAM532EPe3WRBR7UHpqxuFqAqpvOLLxDMeBd0xgI7l9P0SUbGC5j/Pv
 1UPa8swr9glSYGP/BaCQQKQzTua2AC/NvzRrtAP7Ktt5mtyfoZk0
X-Google-Smtp-Source: ABdhPJwJlhZqX9uj1vxdczmSsVyevX8x+Ylg16MttKamqVPBzNl8ZINCo7m+4dfBk3ibpYye4ToGA7s9T80MF2SIdLc=
X-Received: by 2002:a05:6512:1303:: with SMTP id
 x3mr850861lfu.276.1621277227948; 
 Mon, 17 May 2021 11:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <YHdMjAsKKA+BKW8X@heinlein>
 <0030cde6-7b48-2d21-1f26-629ca0ae661d@linux.intel.com>
In-Reply-To: <0030cde6-7b48-2d21-1f26-629ca0ae661d@linux.intel.com>
From: William Kennington <wak@google.com>
Date: Mon, 17 May 2021 11:46:56 -0700
Message-ID: <CAPnigKncNwEyWamX81XDATSqqMqwmp-4HVaOs+DY5ibFJnjrkQ@mail.gmail.com>
Subject: Re: Time for C++20.
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Just use https://github.com/fmtlib/fmt format like many repos are already doing.

On Mon, May 17, 2021 at 8:18 AM Bills, Jason M
<jason.m.bills@linux.intel.com> wrote:
>
>
>
> On 4/14/2021 1:11 PM, Patrick Williams wrote:
> > Hello.
> >
> > Per [1], as a project we've generally committed to using the latest C++
> > standard.  C++20 was released in early Sept. 2020 and already had pretty
> > decent compiler support at the time it was released.  We're currently
> > using GCC10 and according to [2] it has support for nearly every C++20
> > feature I could see us regularly wanting to use(*).  It seems like it
> > is a reasonable time for us to move on to it.
> >
> > * - Except I recall seeing some mention of std::source_location being
> >      useful to fix some of the issues with phosphor-logging, but that
> >      won't be available until GCC11.
> I just remembered and was excited to finally use std::format only to
> find that it isn't available in GCC.  Even the example code on the
> reference page fails to run:
> https://en.cppreference.com/w/cpp/utility/format/format. :)
>
> I couldn't find anywhere that GCC has plans to include std::format.
> Does anyone know if or when std::format might be added to GCC?
>
> >
