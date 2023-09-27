Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 900307B0383
	for <lists+openbmc@lfdr.de>; Wed, 27 Sep 2023 14:10:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AUauWF8R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rwb6D30qNz2ydW
	for <lists+openbmc@lfdr.de>; Wed, 27 Sep 2023 22:10:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AUauWF8R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a33; helo=mail-vk1-xa33.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rwb5Y5kZzz2yPq
	for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2023 22:09:52 +1000 (AEST)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-49351972cbeso3874943e0c.2
        for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2023 05:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695816587; x=1696421387; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p4rGt0XRlPacL5YggOXB08MWd6iS0qcmMTU/xjWBGVw=;
        b=AUauWF8RiKzccPtkqyhnRu8f+19pUTUROgjJ7b2Vm1QhAwmvSpj/wRjHtz3U3xsstX
         mNYaZDfCsXEk+8iow2MuqFcXyn6dWdfSzy6XYYNmAzJEaBRLqkG/tjYZBh2Q4aFOmpnv
         xCu2WiFAQLb0rRW9ejXHzvXXc7DNXaz6nv6NA/KrJ9RgGIyu9XNwsJ6WmBg9AXrBLc7y
         R5MegUmXwklrmzRh5c60gSH/TltpVaz1HeH1X/2P0vSzyn5S1twOXYPbnCGuGo+f4A2v
         kxPhNXgeqfS7qisCX8UjOksI49ClU97JWqo0Ckihao9MCIJhxWyFFyG2HdXWxs++fouQ
         akzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695816587; x=1696421387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4rGt0XRlPacL5YggOXB08MWd6iS0qcmMTU/xjWBGVw=;
        b=AlQ6sxHr2UJE6uYcLDfHR/2s0JZ9c9eyh30KQ7OiIHSGf/cbXddKLhANLvMSjecNjh
         1oXwEoo2N9RCpzQiDfW81NZcRkQd0uRvoF0QYIQecL3ciWY1SlTbOcTH3tVFme96jxPF
         w7QyDEFKLpVJXLIiyQhT048Wzsj7R337aI6YHN1vqq5xCGAxSCj4DxsuzRWaasi2VKuh
         7gyL7CDfosKglLee0R381qb1+wxzTa8RpcsjEw0PoBNTi3pUyf0XH/ab//16I83L/O3t
         3QjL6iIvoC/+wNr1GYDUp+vlSNKSsjBlMU5hj68xyaAK0yWEHpJxfcVfBQyYzB10hRaw
         B61w==
X-Gm-Message-State: AOJu0YyobjwAFdl0O0d15F4bMVHkHEomQK8g0pPa1sxevg9UA+oYw109
	Ky21L9U8fPNsWwbNNGKkwgOQDmWhOx7lvk3AJKw=
X-Google-Smtp-Source: AGHT+IFPdM9iQ/Rv2ZUNZR6AdiGk42gJRjIVK/Hs7IX9o7+TWs0rWiqUzogWzgw0Vc5E6fJ1OiAKUQaWRGijB61+XX8=
X-Received: by 2002:a05:6122:995:b0:49a:a931:dfba with SMTP id
 g21-20020a056122099500b0049aa931dfbamr845708vkd.4.1695816586974; Wed, 27 Sep
 2023 05:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <f794bf89-584b-41ff-a021-ab973cae89f8@moroto.mountain>
 <ad3feca0-94da-4b81-b52b-6a893bd07e5c@xs4all.nl> <88c78401-a3bf-4996-a703-c2869d3d7d23@kadam.mountain>
In-Reply-To: <88c78401-a3bf-4996-a703-c2869d3d7d23@kadam.mountain>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Wed, 27 Sep 2023 20:09:36 +0800
Message-ID: <CADnNmFpW1VGwzVfXW-sdnM-YwNPv2+6YNviAt+Mbth_phgaBUw@mail.gmail.com>
Subject: Re: [bug report] media: nuvoton: Add driver for NPCM video capture
 and encoding engine
To: Dan Carpenter <dan.carpenter@linaro.org>
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, openbmc@lists.ozlabs.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Dan,

> > On 26/09/2023 16:23, Dan Carpenter wrote:
> > > Hello Marvin Lin,
> > >
> > > The patch 70721089985c: "media: nuvoton: Add driver for NPCM video
> > > capture and encoding engine" from Sep 22, 2023 (linux-next), leads to
> > > the following Smatch static checker warning:
> > >
> > >     drivers/media/platform/nuvoton/npcm-video.c:1004 npcm_video_raw()
> > >     warn: sleeping in atomic context
> >
> > Hmm, why didn't my smatch run see this? Does this check require something
> > special? Does it rely on having run build_kernel_data.sh?
>
> Yep.  It relies on build_kernel_data.sh.  Otherwise it that code is all
> released.

I can see these warnings after running build_kernel_data.sh:
drivers/media/platform/nuvoton/npcm-video.c:1004 npcm_video_raw()
warn: sleeping in atomic context
drivers/media/platform/nuvoton/npcm-video.c:1089 npcm_video_irq()
warn: sleeping in atomic context

I'll send below patch to fix them, thanks for the bug report.

--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -412,7 +412,7 @@ static unsigned int npcm_video_add_rect(struct
npcm_video *video,
        struct rect_list *list = NULL;
        struct v4l2_rect *r;

-       list = kzalloc(sizeof(*list), GFP_KERNEL);
+       list = kzalloc(sizeof(*list), GFP_ATOMIC);
        if (!list)
                return 0;

@@ -467,7 +467,7 @@ static struct rect_list
*npcm_video_new_rect(struct npcm_video *video,
        struct rect_list *list = NULL;
        struct v4l2_rect *r;

-       list = kzalloc(sizeof(*list), GFP_KERNEL);
+       list = kzalloc(sizeof(*list), GFP_ATOMIC);
        if (!list)
                return NULL;

Regards,
Marvin
