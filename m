Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A37AA7B69E5
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 15:09:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kUvRlnDh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0J813MC5z3vXM
	for <lists+openbmc@lfdr.de>; Wed,  4 Oct 2023 00:09:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kUvRlnDh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::929; helo=mail-ua1-x929.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0J7Q1BMxz2ysD
	for <openbmc@lists.ozlabs.org>; Wed,  4 Oct 2023 00:09:21 +1100 (AEDT)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-7abcef80a82so435351241.3
        for <openbmc@lists.ozlabs.org>; Tue, 03 Oct 2023 06:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696338558; x=1696943358; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Znjfur39qqjdzsEXvyYiHZuLbuaT0vTImvdbRdQV+4=;
        b=kUvRlnDhGHxj5p4s9pdXRTuPLZVrJ6eI2dsU2SVdjq+6U9VSzT+KME8FstBVKDDXuF
         Ln4sgbIk17Iu9cexsqIj75nueM//vTuVo8zP/CBimuIUIFxeOfuHAj4bwawL7VGFSwd0
         2KrxGbpk9YgakCXvtK5SDV1ucfIH9GB5yzNXM1DNetTxVCGKMtTgCndYRP6XE57SMlEm
         mq9I5Gr2yHRyaJuQVSlnpVvEFOrMts+RCFzbyRjstx7LAzDnfCzWNpWgYcAyUZN/CwOr
         qvHE+PPArHuzs7uvMpmyxVfRxkjT7y4q4IFLs0tRegoLWqJatqOY839OsuSoFigzujHq
         L0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696338558; x=1696943358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Znjfur39qqjdzsEXvyYiHZuLbuaT0vTImvdbRdQV+4=;
        b=fpLDUlTuVG989s87V/bJ3R1mLZFl5Yy0HNk4JdS+CJnGp2hBbGLZ+uPQPV4QhzJNB6
         PsWTr/tBepOgStK9LWoGV1yPCNw7QZlNZGf21oABtTc9l1yrL1AhRAC7pGRnid8UixER
         a63PChshTGzETuT3+aLo/pdxtbjLjBuemxFZoDBgUYb3ZNzMjbeAiqruPSX+m+thY5Ey
         PuDBTAal9WK6utak+SyxsKa5Kgvo6WTCQtelU3VpE9zK5dITBuGoo6Vd9oB+bqCEezAA
         ls6Wl7EhVnE73hKH7lDoAXBxtTHydj5BcXCkuFzssLfMPNswdbfWvLb/XmPNENKH5vil
         PmDg==
X-Gm-Message-State: AOJu0YxfBsZrjCtfgWgGtN+StkGB0DvsEF0U1TM3X5K1IeSstQNOS9E/
	GrwjNURQ+6ao4quiQ9NH/fAODMZwl4DjgTg4XiA=
X-Google-Smtp-Source: AGHT+IHxLU2viRDvkfkjpNz6nLNjvh8SF9YyPfx8WmQylu/hSi9YoR5Ymu6Rg5pcSwG4lhIaG29eWFWaLLA0k+xwzLw=
X-Received: by 2002:a67:d094:0:b0:452:7526:73ae with SMTP id
 s20-20020a67d094000000b00452752673aemr12677763vsi.26.1696338557858; Tue, 03
 Oct 2023 06:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <3134a802-75fe-49f3-bcd6-06addc2ffaf5@moroto.mountain>
 <CADnNmFrOeGxUL1U9eJngKpMpoVVZXN4Owxxo9Ee18tEYxZ6FhQ@mail.gmail.com> <dd71316e-18e6-47a4-a267-67328b1a1158@kadam.mountain>
In-Reply-To: <dd71316e-18e6-47a4-a267-67328b1a1158@kadam.mountain>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Tue, 3 Oct 2023 21:09:09 +0800
Message-ID: <CADnNmFoNe50AkcVCk2fx4rUkNVZ2QJ2eud0dz5AExy0+4u7Fbw@mail.gmail.com>
Subject: Re: [PATCH] media: nuvoton: npcm-video: Fix IS_ERR() vs NULL bug
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
Cc: Joseph Liu <kwliu@nuvoton.com>, openbmc@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Marvin Lin <kflin@nuvoton.com>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> On Tue, Oct 03, 2023 at 08:02:33PM +0800, Kun-Fa Lin wrote:
> > Hi Dan,
> >
> > Thanks for the patch.
> >
> > > The of_parse_phandle() function returns NULL on error.  It never returns

                          ^^
> > > error pointers.  Update the check accordingly.
                               ^^
> >
> > Commit message contains some redundant whitespaces.
> >
>
> I have no idea what you're talking about?  Are you talking about two
> spaces after a period?  :P
>

Yes :P

Regards,
Marvin
