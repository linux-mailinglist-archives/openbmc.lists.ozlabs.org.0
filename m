Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D8179109A
	for <lists+openbmc@lfdr.de>; Mon,  4 Sep 2023 06:50:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Yt+gNEEx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfGRG5ZV9z3bvB
	for <lists+openbmc@lfdr.de>; Mon,  4 Sep 2023 14:50:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Yt+gNEEx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfGQh303yz2yVZ
	for <openbmc@lists.ozlabs.org>; Mon,  4 Sep 2023 14:50:03 +1000 (AEST)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-44d3cdba3f6so492313137.2
        for <openbmc@lists.ozlabs.org>; Sun, 03 Sep 2023 21:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693802997; x=1694407797; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iacGK+V2SyI7u62NbaMeNw3cu42K5/MOVGdVpsBcQr4=;
        b=Yt+gNEExHGNMO0AyIV3jHdw/AprBAR7k/Vh2lhtUt/xC58v5HiZ9CSjwGJv/4jT9c6
         eM8/58Wjt5/CR+07ETexA/xDx6sqKnXxURA1zIQXuP3MfTAQEzchfuLZqRWU8a5izlKv
         mpOkTgdlPH9nhqNh+vMCxNad749qvSvZ9DdEeyJm1lrQEoLK94YQSwCdoDj9teDVRzET
         Wreu+7jcPR7srtsw3eWYpYoHEUJed1iuISY5kao7Gc3lBTXkJg8DRSzJC0XlUPqyx6se
         x/k/3ca4LtBedenu7cW8uRnbL2aJKWPXshmMBtRNeKcDp+/3YpWok5RqaL4OMgdXENSY
         8p0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693802997; x=1694407797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iacGK+V2SyI7u62NbaMeNw3cu42K5/MOVGdVpsBcQr4=;
        b=iDL3jNV8Cr11xlhx/i+VT35eGcDI1bLt0dKoRV+Ou4CeCD9BRGLozgqyR90xLcFvye
         6Bw8AGlRk16IMPvCIdP+69s4xELrJahEXIa1lPqXDmOF7IuGS0wjbGuID5AHFs0NwGCO
         vKhPRX7W/V+zqmB3y8r3WeaTr0Hbf8Sv5QQUlY2bAxh7cyuXEmFA36+XZo7e/zlNDRJa
         ef31tx8gCgcopQVZMKVl6hpDOyMOjZ020jXU/Ih32WyyVyGcCp5GI+fPlSmOSts4OhvD
         zHqfgG5lM3O/zYyQ3fYDyLA69Z4VX24HouazNppa7Tzb0hI2ixEisrImzgH+/102rqLr
         Z26g==
X-Gm-Message-State: AOJu0Yz1xafcW6rIk54/H6DQEK/yE/zIz23t+tC8Tctreoz2MIV+PSAE
	ZiNiIOjUgTUvPIhRdkNtRXzI4eW17pEX3zOInCc=
X-Google-Smtp-Source: AGHT+IEzJp2QEDITKv7Z+jdponAfIao6TEeQ9Rfl7fRLOLifmlMjC+/WEbeYvphjh6RikNhq5bcaorABVRljL2aKGqU=
X-Received: by 2002:a05:6102:3a56:b0:44e:b30a:c0da with SMTP id
 c22-20020a0561023a5600b0044eb30ac0damr7596914vsu.26.1693802997437; Sun, 03
 Sep 2023 21:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230828091859.3889817-1-milkfafa@gmail.com> <20230828091859.3889817-8-milkfafa@gmail.com>
 <0c91f68d-d172-bd14-9115-b6977ad2d01f@xs4all.nl> <CADnNmFqVbRWs5Uf_tJdrM0AopF_CmSHYwBK8-+1go_K6Hefkcw@mail.gmail.com>
 <ecc13f10-82b9-f99b-8ebf-ff505d65fe2e@xs4all.nl>
In-Reply-To: <ecc13f10-82b9-f99b-8ebf-ff505d65fe2e@xs4all.nl>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Mon, 4 Sep 2023 12:49:46 +0800
Message-ID: <CADnNmFoRjyHghQPA72HUmmCEr81oUBJPDG+QtuTFaem_imNB=Q@mail.gmail.com>
Subject: Re: [PATCH v14 7/7] media: nuvoton: Add driver for NPCM video capture
 and encode engine
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, kwliu@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-media@vger.kernel.org, tali.perry1@gmail.com, andrzej.p@collabora.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org, kflin@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Hans,

Thanks for the reply.

> > When userspace dequeues the 1st buffer (video->list[0]), it needs to
> > know the count of HEXTILE rectangles in the buffer,
> > so after dequeuing the buffer it will call this control to get the
> > rect count (video->rect[0]). And when a buffer is dequeued,
> > npcm_video_buf_finish() will be called, in which the buffer index (in
> > this example, buffer index = 0) will be stored to video->vb_index.
> > Then when userspace calls this control, npcm_video_get_volatile_ctrl()
> > will return the rect count of vb_index = 0.
> > In this way, I think userspace is always reading the correct control's
> > value even if userspace is slow.
> > Does it make sense to you or is there anything I missed?
>
> Ah, I don't think I have ever seen anyone use buf_finish in that way!
>
> Very inventive, and perfectly legal. Actually a very nice idea!
>
> So, with that in mind there are still some things that need to change.
>
> First of all, you can drop the 'VOLATILE' flag from the control, instead
> just call v4l2_ctrl_s_ctrl() from buf_finish() to update the control.
> And in stop_streaming the control value should probably be set to 0.
>
> The use of volatile for a control is a last resort, and in this case it
> is not volatile at all.
>
> Secondly, this behavior has to be documented: in buf_finish add a comment
> along the lines of: "This callback is called when the buffer is dequeued,
> so update this control with the number of rectangles."
>
> And where the control is defined, refer to buf_finish to explain where it
> is set.
>
> Finally the user-facing documentation has to be updated (npcm-video.rst)
> to explain this behavior.

OK. Will drop the VOLATILE flag and update comment/document in the next version.

Regards,
Marvin
