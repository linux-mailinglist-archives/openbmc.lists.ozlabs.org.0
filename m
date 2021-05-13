Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C31EF37F126
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 04:09:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgZqD5K8sz303t
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 12:09:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=iaeH6/iQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iaeH6/iQ; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgZpy3W9nz309g
 for <openbmc@lists.ozlabs.org>; Thu, 13 May 2021 12:09:30 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id 1so18830529qtb.0
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 19:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8DhreuyttT9C2MKbFua5bAvKOXXJc5oXqwIHadWTQuY=;
 b=iaeH6/iQr38Y8r7RPQEc2lBqnS+2weirxSL+e+WHERvo5zW8kYuU/ElZMSfW2gjU3c
 AZ8BHPqfL2qwcCpcszcs2U0ouQuMXHNmt4AJAk/1KPiKrefhv5qmcON63tgmSb8kCssg
 xmJXe3RPA7zlWRxuqJ+QELiFxjByMZHIklCAr8sXYI5gZDsjFWEMHzBmy5y2WOYnqgX6
 9d9ed8e+gbrCBtcfT2YXnAxt0kVx0iLbQeL9smZkvOV8pmSG4gPNNYIwjIfku/g/cVqF
 hOpanBdjFzl9TJa0huEl2O8gQXDj6CR5huJk1ZUxm8OkyqIGQ1YnIDXJoYuaM+gxA9Cf
 9WhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8DhreuyttT9C2MKbFua5bAvKOXXJc5oXqwIHadWTQuY=;
 b=aQhHMaLmNJgy7JU6rVEoUhlM65OFotkqSEvA25gXbbQLDtoD3f6Nq0HmM1wwE0+cPD
 A4b46SU0U5ARasmwiC65qqcNcxXji+zs1pHvINq89g8HcFpYOFaL8sa6SSKAVghftlX/
 F1soi9+vd7aQnBfgQ6Ei9zAhXK2q0xEEdnjXUF3zx7+mtTN4omzRUsSkNGNeGAi6wp+n
 LXff+Ivudn8MqA8KO0jSlaDnU2cjoH/JRoNYHIlrFl1sYmV44OHNy466MdIkDF6xc0NR
 nAakHFppGPgJn2AVPp4dX21ffulkZGVPTNLl6HX3S6LYprsWbjzvX433veNIXhpA/sr/
 IgwA==
X-Gm-Message-State: AOAM5324BvkKyjTHOUnoi271BqU0lrdya7ifmmXsDfC5gjIofVDddmdu
 m6rXysdx+LnW5FnK6P7cjzbUhzuJXMye1b/Vp8o=
X-Google-Smtp-Source: ABdhPJz2w2qUAljJ3MwJMrEYuRSOhgojlXEl4HAYnlJHxRQbGgVLWNUJD6txRhpkiJkg2VupEJxSZOIh/15sS93uVbQ=
X-Received: by 2002:ac8:4d82:: with SMTP id a2mr36303376qtw.182.1620871767539; 
 Wed, 12 May 2021 19:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <CANFuQ7D-ujDJ0ZwE4QEYRPCSM78d3SdUuT=pB2Fk3t18QMr95Q@mail.gmail.com>
 <YJyGDAcEtdpcC0C1@heinlein>
In-Reply-To: <YJyGDAcEtdpcC0C1@heinlein>
From: George Liu <liuxiwei1013@gmail.com>
Date: Thu, 13 May 2021 10:09:16 +0800
Message-ID: <CANFuQ7AvV_R-Q0q0-QEKH_CsYv9vk7dVHzL+e4NvjifeFRbknw@mail.gmail.com>
Subject: Re: Use the right values for CODE_LINE and CODE_FUNC in journal traces
To: Patrick Williams <patrick@stwcx.xyz>
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

On Thu, May 13, 2021 at 9:51 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Tue, May 11, 2021 at 02:03:19PM +0800, George Liu wrote:
> > But for the log method, has defined a variable parameter, so it can
> > not receive a default parameter again.
> > link: https://github.com/openbmc/phosphor-logging/blob/master/phosphor-logging/log.hpp#L157
> >
> > Does everyone have a better way to process it? Please let me know and
> > we can discuss it here.
>
> There was similiar discussion in the past of using source_location to
> get the real file/line as you suggested.  I don't think anyone put tons
> of thought into how to get it into the function though.
>
> source_location isn't supported by GCC until 11 per [1] and we don't
> have that in Yocto yet.  I know I was at least holding off until we get
> that to do much experimentation.
>
> 1. https://en.cppreference.com/w/cpp/compiler_support
>
> --
> Patrick Williams

Thanks Patrick.
We will keep following up.

George Liu
