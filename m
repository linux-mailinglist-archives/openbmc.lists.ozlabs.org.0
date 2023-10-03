Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DD57B61CE
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 08:57:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ndfUf8AB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S07tX36D7z3clc
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 17:57:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ndfUf8AB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S07sv31Vgz3c3D
	for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2023 17:57:05 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c012232792so6451811fa.0
        for <openbmc@lists.ozlabs.org>; Mon, 02 Oct 2023 23:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696316219; x=1696921019; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FfJA992CYJJutCMUynHW6oD9A3N9/SE/3LR+g9biDIU=;
        b=ndfUf8AB3LTYs81vzkkj09VP5U56f9IPm00m3l1Ys3x5N3JREtzQdKG2KdaMPki5N8
         o/YbFS70ePcmSR1ISrfoHIyX7gQiJrdLX3dovZNEqc5SqIp8BZ6JvO0PyIlmvMXmLK3t
         ArLvy7xOCOu15dd8gk4dQL6FSiD98zLbZWerCfJrp0YVySh5/vk75oOqPzXq0cp79bO7
         adD5q+toWYHJuJRNN7lOKedhmRxWk0RkOf/a30MobrQ9r36Hj+aiKvcG6nCB1Lg8i+hi
         Me2Y0Afz6vLjFSBPqxyKWMZKKN/JquF5I+ORb3gvvlYTLMDijym95WAblS+mYtyJQpWU
         TXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696316219; x=1696921019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfJA992CYJJutCMUynHW6oD9A3N9/SE/3LR+g9biDIU=;
        b=DY34n61yqzmz9Z+F+GdvnC9QuRE5tICk5MrY4YB6L1/NwkRw86L6REdUevDqsn6mT/
         c2pWU5R5+oT9kypidZWFPz1/T8YcraxOrrEK98cPBOE0rutcFbVd2MxSYAPHSrj566mK
         QshIRos+rr6ajwg+9golgDNQLEEEzqDaoDr3+3erMenhoT0uTa0ZLrz0y9fdT2sLSXFM
         LtEVsW6bEEKNsErEZ2JRsB7DVaQvYs5ATxCvkMHu2utNVdNeXATiLk77rdmm+z8Htm80
         X+PHKbM8Ezw4oL9aZN7ItwrrL3oCoSKz0SrkP54dTexC7FO2K6ld3Nudv5ZF45vmyb6F
         jL9g==
X-Gm-Message-State: AOJu0YzYLfOi0Qa0TE2nUxEdNVzM9ujKEimcHBWJcRDXToMRt55u+XIb
	cSC/0C0Nxt6L+qLzdTzMC5Qk33J5gWA7Ay8ZmaA=
X-Google-Smtp-Source: AGHT+IFLFq9eofBLjO0jeIK4HsMzYgv8vQ7e1Y0vQC4/hrIVwD6V82Ydlk1ILG9yNFedzZcLLM4kyR4SmgsvF0boR7E=
X-Received: by 2002:a05:651c:212:b0:2bc:dcd6:97b1 with SMTP id
 y18-20020a05651c021200b002bcdcd697b1mr12546204ljn.47.1696316218684; Mon, 02
 Oct 2023 23:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231002161350.64229-1-tmaimon77@gmail.com> <2023100323-reunite-upfront-8922@gregkh>
In-Reply-To: <2023100323-reunite-upfront-8922@gregkh>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 3 Oct 2023 09:56:47 +0300
Message-ID: <CAP6Zq1jHzRP1Ytzk8YXyR8ppAP=ZoPvPkYvC2yMRfTt5140zqw@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 0/3] usb: ChipIdea: add Nuvoton NPCM UDC support
To: Greg KH <gregkh@linuxfoundation.org>
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
Cc: devicetree@vger.kernel.org, peng.fan@nxp.com, linux-usb@vger.kernel.org, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, peter.chen@kernel.org, xu.yang_2@nxp.com, j.neuschaefer@gmx.net, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Greg,

Forgot to add in Acked-by: Peter Chen <peter.chen@kernel.org> in V3,
Resend the patch set with the Ack.

Should I do it differently?


On Tue, 3 Oct 2023 at 09:51, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Oct 02, 2023 at 07:13:47PM +0300, Tomer Maimon wrote:
> > This patch set add USB device controller for the NPCM Baseboard
> > Management Controllers (BMC).
> >
> > NPCM UDC driver is a part of the USB ChipIdea driver.
> >
> > Adding CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS flag to modify the vbus_active
> > parameter to active in case the ChipIdea USB IP role is device-only and
> > there is no otgsc register.
> >
> > BMC NPCM7XX and BMC NPCM8XX has ten identical NPCM UDC modules,
> >
> > The NPCM UDC were tested on NPCM845 evaluation board.
> >
> > Addressed comments from:
> >  - Krzysztof Kozlowski : https://www.spinics.net/lists/kernel/msg4951321.html
>
> Why is this a RESEND?
>

Thanks,

Tomer
