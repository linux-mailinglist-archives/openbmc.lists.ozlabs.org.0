Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C120932831
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 16:22:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W1KbQKUC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNh9D3sQzz3cbg
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2024 00:22:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W1KbQKUC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNh8j4kWYz30Vk
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2024 00:21:56 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e04289a2536so4545361276.1
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 07:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721139714; x=1721744514; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t/2J6dIhhnWs/OvYVCSh0AyUKRWiWXR9HD//G2Voii0=;
        b=W1KbQKUCo1pK8gGPfwmcuhJQdaEdGAX2oQWKhT4lXkz7P+i11BK16V4+VOEl7MdjQR
         jk8kWlGhM6IFNm4ZGqd2XOj5fsvftabwJPDbK3aflDxZVP4dvs2E6R9slXMa9mb2AGwr
         qU3J0k/x48ufFQ044pVvmbe4BcLSVCcvKeWFuC04/5d5+ggWV2/PxoU5fEd8qJ3pjNM+
         6TWrDqvbptHGM0lTkf8qVdV9UCuQUjwCDFYQBVdAbfGH2aK9JUfIfghyohFnimLZJm4A
         pS6umZToMf/c9cK4GGumy6R8wZZojIuMhdsURjrRNZgzVrfM0SJZQVJvvokT+E47EuN0
         TVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721139714; x=1721744514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/2J6dIhhnWs/OvYVCSh0AyUKRWiWXR9HD//G2Voii0=;
        b=uYizRLbz8HPByKbNQt5iDbtnsZI1u/X+OotB6VKS3gkSPVGDRfSgidznyXbKMRnl4B
         SsZe46FrUhI/gLkc9jkblUFiZPPwVsT6iM6OhcPI+W7CEyBlHPIc4L5pcwDOjn4sq0FA
         0Ie5YXVlljNTCqhcAKCTJaYoNlAMk25KIPru7L+RHZKS0M/Y0Z+Tu9C6HJw2c4Xf8Ewt
         IbeDIAmmwqkhMsYRPdyitGFMLgfhrBIScUmrcHm3aVgkg0IiFmQDDwa2pIGVUdLzPY4l
         q21wZtO4o7+V8Bcdn+RmBOGlrP37hPFdVbcWDS5OpfDkVcyRrmf726ByPMWa/DXbKviP
         CvPg==
X-Gm-Message-State: AOJu0Yx2gGkCkh3kWsqU8h3MVdnYMUZFLFlqhm/+KJlJAHO29A13pXRv
	sM7Map8/RpzmIqgUtRJL3LRajR0eJjUhdedgxOK77nBHye+k2i3VVOwNWoZX2ZacGL+VItmJUAr
	MlaewJvXJCJ7ImvxV22GxplmSlFc=
X-Google-Smtp-Source: AGHT+IGS1oREOc6vtx/1MbHywusJ5ci7I8V+zBQysGemBGrMSFxYuKmozPpVD4oL2bhsUo1KXJcc6I5IGhr8LjmGHKc=
X-Received: by 2002:a5b:606:0:b0:e03:abe0:95be with SMTP id
 3f1490d57ef6-e05d80275d4mr1495547276.2.1721139714089; Tue, 16 Jul 2024
 07:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240710124157.2106609-1-tmaimon77@gmail.com> <00f9c8d1-4572-40bc-925e-17161cbec0fb@molgen.mpg.de>
In-Reply-To: <00f9c8d1-4572-40bc-925e-17161cbec0fb@molgen.mpg.de>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jul 2024 17:21:43 +0300
Message-ID: <CAP6Zq1iSr22Qs=_0FrGmFm0AHSKZPMAB0oC3gLOZCxeaHKiLDg@mail.gmail.com>
Subject: Re: [linux dev-6.6 v1] usb: chipidea: udc: enforce write to the memory.
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Paul,

Thanks a lot for your comments, it will be addressed in the next version.

Tomer

On Wed, 10 Jul 2024 at 16:52, Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Tomer,
>
>
> Thank you for your patch.
>
> Am 10.07.24 um 14:41 schrieb Tomer Maimon:
> > In the prime endpoint function, we need to read from qh.ptr->td.token
> > to ensure that the previous write to it has indeed been committed
> > to memory.
>
> Please document the datasheet name, revision and section. If this
> actually caused user visible problems, please also document the test case.
>
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >   drivers/usb/chipidea/udc.c | 15 ++++++++++++---
> >   1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > index 0b7bd3c643c3..0b14a1d54d59 100644
> > --- a/drivers/usb/chipidea/udc.c
> > +++ b/drivers/usb/chipidea/udc.c
> > @@ -190,12 +190,21 @@ static int hw_ep_get_halt(struct ci_hdrc *ci, int num, int dir)
> >    *
> >    * This function returns an error code
> >    */
> > -static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ctrl)
> > +static int hw_ep_prime(struct ci_hdrc *ci, struct ci_hw_ep *hwep, int num,
> > +                    int dir, int is_ctrl)
> >   {
> >       int n = hw_ep_bit(num, dir);
> >
> >       /* Synchronize before ep prime */
> >       wmb();
> > +
> > +     /*
> > +      * We add the read from qh.ptr->td.token to make sure the previous
> > +      * write to it indeed got into the mamory so when we prime the DMA
>
> m*e*mory
>
> > +      * will read the updated data
> > +      */
> > +     if (hwep->qh.ptr->td.token & 0x80000000)
> > +             pr_info("%s(): hwep->qh.ptr->td.token=%08x\n", __func__, hwep->qh.ptr->td.token);
> >
> >       if (is_ctrl && dir == RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num)))
> >               return -EAGAIN;
> > @@ -632,7 +641,7 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
> >               hwep->qh.ptr->cap |= cpu_to_le32(mul << __ffs(QH_MULT));
> >       }
> >
> > -     ret = hw_ep_prime(ci, hwep->num, hwep->dir,
> > +     ret = hw_ep_prime(ci, hwep, hwep->num, hwep->dir,
> >                          hwep->type == USB_ENDPOINT_XFER_CONTROL);
> >   done:
> >       return ret;
> > @@ -658,7 +667,7 @@ static int reprime_dtd(struct ci_hdrc *ci, struct ci_hw_ep *hwep,
> >       hwep->qh.ptr->td.token &=
> >               cpu_to_le32(~(TD_STATUS_HALTED | TD_STATUS_ACTIVE));
> >
> > -     return hw_ep_prime(ci, hwep->num, hwep->dir,
> > +     return hw_ep_prime(ci, hwep, hwep->num, hwep->dir,
> >                               hwep->type == USB_ENDPOINT_XFER_CONTROL);
> >   }
> >
>
>
> Kind regards,
>
> Paul
