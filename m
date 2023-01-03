Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EEF65B902
	for <lists+openbmc@lfdr.de>; Tue,  3 Jan 2023 02:45:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmFtV0Tkdz3bk8
	for <lists+openbmc@lfdr.de>; Tue,  3 Jan 2023 12:45:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=zO3XHK9j;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=zO3XHK9j;
	dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmFst1sWlz3bNy
	for <openbmc@lists.ozlabs.org>; Tue,  3 Jan 2023 12:45:03 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id v70so26122843oie.3
        for <openbmc@lists.ozlabs.org>; Mon, 02 Jan 2023 17:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzruHaCoRFMCiB38HHruPAI5hlWviyaAl+a8ltOjjfY=;
        b=zO3XHK9jasOvuqdbEtmdyENodx//OrOQ/6jii5PjKRvM8tvHp5s6z0VRnvMqJpUZcP
         y/Z5AkLB9iFmhxfB4RGddZ+rDSF8+ky7EOxKGzpSPyvWYB7XGR8AmMdjncT//U17pBqu
         jbF+0KfI3Uc/xfqK8jYzIjRN5hHWLfcfWjnrvU/vrg01+R0TNbHEHM2E+oBC194uK3Oz
         CsoY6BM84Sj4gKqS8idznqZGZUhrbSmhqYb8GU3a8/dYBreKoex5xZNiIJp0QdoSVSUP
         tjEk4hTfPcnlgSL4xD+kmFKNuVA+E7kRSxTkTnv2RL8ubTJlcKexqK4SyXBOG/uQ0AVO
         DIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzruHaCoRFMCiB38HHruPAI5hlWviyaAl+a8ltOjjfY=;
        b=fYrtMSPZmANHDz413ZLwZAOjb2WtIqI3S8+/lp/WTVyPwAu/dMiYBEo+aPK93psgZi
         6izvZ/2pvjd1vteQ0NFO/oKa9N1xgX+f4wXtkKHUicPOja/C+sCFcVUGsrfVTnwrjbmQ
         WjfqwmCMx+CDGPdT1eT7ZkbDmxEtG+zxxvvNwDAe6AjmxWn+sNh4d2In1ifza20f9rlW
         0rcjdeCcI8BjH+gp5QdXyUa1azRtghhri3o+0fMdIYhbSg4GM4SSfCwyYXyIg6afdQht
         8vtP/k9qP8Enq/f3zrYhrbN1a2XOmB+lwf2hqat1WuUa5RZA4/ZK+/rqudODIhDDFl4O
         iWbA==
X-Gm-Message-State: AFqh2kqitA9Xqt2hH3ep1nSYXQwffrSeIndPyGkpoKdv0yfpb7p0o5eu
	IKBD8sHrLpNAVJudYSkGz0UY0catpLl+8zxlYHDs48yg8l3EvZNrRyPV1FRA2c+6vYqq5QbbdVS
	QwC6yoa0n5d6QDybviPcF0Rt9b+wL
X-Google-Smtp-Source: AMrXdXvaJTAv/60T5ke8qq+MUhXViholz450qazB/QZrp+dwig/0kc0C9FY0CvXU0M9Umltx0I+kI1qqFiF4ECbBkGk=
X-Received: by 2002:aca:1314:0:b0:35b:872b:edfb with SMTP id
 e20-20020aca1314000000b0035b872bedfbmr2006067oii.166.1672710299321; Mon, 02
 Jan 2023 17:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20221230024521.77064-1-jordan.chang@ufispace.com> <cd958688-1db3-b419-7295-6c03a06f61d2@molgen.mpg.de>
In-Reply-To: <cd958688-1db3-b419-7295-6c03a06f61d2@molgen.mpg.de>
From: Jordan Chang <jordan.chang@ufispace.com>
Date: Tue, 3 Jan 2023 09:44:48 +0800
Message-ID: <CAJ3czeRJ_ceKNPbLgJONMzvzKoa437dz7fCau39Bk2v64JsDTQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: Add
 Ufispace NCPLite platform BMC
To: Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: jay.tc.lin@ufispace.com, eason.ys.huang@ufispace.com, openbmc@lists.ozlabs.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Paul,

Thank you for taking time to review the patch.

On Fri, Dec 30, 2022 at 6:07 PM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Jordan,
>
>
> Thank you for the patch.
>
> Am 30.12.22 um 03:45 schrieb Jordan Chang:
> > Add initial device tree of Ufispace NCPLite platform which
> > used AST2600-based BMC.
>
> use*s*
Thanks for the correction. I will modify the commit message.

>
> Please extend the commit message to explain the #if 0 preprocessor
> statements.
>
Those lines are accidentally left. I will remove them and send another patc=
h.

> > Signed-off-by: Jordan Chang <jordan.chang@ufispace.com>
> > ---
> >   arch/arm/dts/Makefile            |   1 +
> >   arch/arm/dts/ast2600-ncplite.dts | 215 ++++++++++++++++++++++++++++++=
+
> >   2 files changed, 216 insertions(+)
> >   create mode 100644 arch/arm/dts/ast2600-ncplite.dts
>
> [=E2=80=A6]
>
>
> Kind regards,
>
> Paul


Best regards,
Jordan

--=20
******************************
This e-mail is confidential. If you are not=20
the intended recipient, you must not disclose, distribute or use the=20
information in it as this could be a breach of confidentiality.If you have=
=20
received this message in error, please advise us immediately by return=20
e-mail and delete the document. The address from which this message has=20
been sent is strictly for business mail only and the company reserves the=
=20
right to monitor the contents of communications and take action where and=
=20
when it is deemed necessary.
Thank you for your co-operation.
