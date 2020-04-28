Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 507CC1BB442
	for <lists+openbmc@lfdr.de>; Tue, 28 Apr 2020 04:57:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B5t81rxPzDqsv
	for <lists+openbmc@lfdr.de>; Tue, 28 Apr 2020 12:57:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gVAOz6p5; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B5jW6387zDqNn
 for <openbmc@lists.ozlabs.org>; Tue, 28 Apr 2020 12:50:22 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id h4so6278109ljg.12
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 19:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oiR/kz1cVpL3jgZ0JzcYKflJ9Bwj9GVkhGQ/j44NxgQ=;
 b=gVAOz6p5198H2ZnjC2CvUOkObUb59QzElY6d1/pywkARRpIAv9rnw/+NV+kRAHaFT/
 j1BMByjuuA7O4bO777jskHjE/m9Q9Nm6gEVs6Zu+BMa2aHgd0cL1M106ptq6/oROFSYA
 XX7rDwaY51pTIVE6r+kwyJHm0eSwh4HcCVMsdySt3+CZahTdbepj4jM/G0FJw384x/Uo
 jD00xG6RTk1/At8iJ61tKNPt57VghpoV/jMi8lXNVVbnowHQMnFgVy6euBTZS5OIDy9X
 C0Uv1oZKvxAlzlGKDyU9AfzmKyJG35D48VY4ezyi3GXhW47HmpYTrnD4GPA+WZ1YZtbx
 5Yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oiR/kz1cVpL3jgZ0JzcYKflJ9Bwj9GVkhGQ/j44NxgQ=;
 b=MQUgkkCmc53a2WUSgAUW1bw/TxYOtBRCiZw0Xw0Jt8zIFRzjyC82EMvl9CIg80DP9e
 4+gcmPKK/r/GAMxJKEVaHVbLsw3ZdyE8CkJ3DOmbY74CmLIhXiVnG8BmtE/HJ1mtxBWK
 DmaClsOGQAnrOelk2b7jUAX7FCqGdAdktOPoN2rkvcHjCUW2ygH9meup7ew58DoFgTMq
 Rq4YN6cm0E2DFomzGnRiU6AquEwPDCy9aR5gH0rpNv7KefOrISMPCeRLa2vZEyDLGDBN
 20bMvDgr2PHtSDO4i840N6DZULR5PnLCQQ6+BxKNOooETAy/4RtZ5qfVdc/CIw9IKt7k
 QZKA==
X-Gm-Message-State: AGi0PuZ7TLs8YuQy078h9iqruw7PkI6/VLJ1+mRROytILOQspSEORKgL
 LOun3XLa1TGv7fCY9746uieLL3df22yRRuzhlwY=
X-Google-Smtp-Source: APiQypKyDycCnNrT3y+ds/7cwztgBSUaKgfMx2buHZe4SthW/z6GU5QYpBuAkqY5IkP7WOmUiStuaMg8kBm4zLM0TRM=
X-Received: by 2002:a2e:b0f5:: with SMTP id h21mr16255727ljl.3.1588042215375; 
 Mon, 27 Apr 2020 19:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAMXw96O6LpiR5CsmY4e_m2K-HNm_uHdRvRavf5iBSs1RqHYE6g@mail.gmail.com>
In-Reply-To: <CAMXw96O6LpiR5CsmY4e_m2K-HNm_uHdRvRavf5iBSs1RqHYE6g@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 28 Apr 2020 10:50:04 +0800
Message-ID: <CAARXrtnLOFVT2TuBa=mPBzVv1tXtrPEbqjms1d2AiX3n4L9wag@mail.gmail.com>
Subject: Re: Error with QEMU
To: Zhenfei Tai <ztai@google.com>
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

On Tue, Apr 28, 2020 at 7:05 AM Zhenfei Tai <ztai@google.com> wrote:
>
> Hi,
>
> I'm trying to test a bmc image using QEMU but got this error at startup before it's supposed to boot.
>
> qemu-system-arm: Aspeed iBT has no chardev backend
>
> Has someone seen similar errors before? I found some bug reports in github but no resolution was found.

I see this log, but it does not prevent the qemu from running the BMC. It shows:

    qemu-system-arm: Aspeed iBT has no chardev backend
    U-Boot 2016.07-00038-g59428fe010-dirty (Apr 26 2020 - 09:28:54 +0000)
    ....

And it runs the image OK.
