Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 218E549018B
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 06:36:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcgdD6dyhz2ywb
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 16:36:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=rjCAFr31;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::335;
 helo=mail-wm1-x335.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=rjCAFr31; dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jcgcp0j1nz2xXX
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jan 2022 16:36:23 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id
 ay4-20020a05600c1e0400b0034a81a94607so19122784wmb.1
 for <openbmc@lists.ozlabs.org>; Sun, 16 Jan 2022 21:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EA8+kVLxt9CGX2bWoK7aIZf1k1F16fF06BQS7ZwkP2o=;
 b=rjCAFr31M0F+pG/oteEl6w0N049sPvdMNuJbZ9nYX0/y6DS4/YOidtIyLelSdIs7vh
 pfxwEJNPMTRqILR4oDWZNAeLh2yA7ZuD9ROGpa2ngKZrFy+MgpmUKk01yYGLGGzeAuuh
 m2qhdMnM7conMGUusLOjcTkZm4TurYe4PMUmKIZDwA2UvCr4bNlOz61FMiOrcQM1lP9b
 ikrGd1JBpI+LGF9Igb8rODSO2/N3yZMfy0My+1Qp2Aztd8PYYcvUoYp91Jz8pqaSCS/U
 rfyJ/+pfxQSJRLOvehOrYk1wbypF3ov0xb/9TQFC3aR/SNI/OI+EwG0Ahi/K3dIm5OLS
 VQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EA8+kVLxt9CGX2bWoK7aIZf1k1F16fF06BQS7ZwkP2o=;
 b=fDg1xDLLUbnEJmmwMYTecFiA0HJ2YhmzdVCxwiUmx37HP2/2ELtIRnhfS0xavrDlqO
 QUv2Jx+rqmQde9JVAIepCYlRWx+iUi2y+26QgJak38nBK1PgtTrApQRfgo+Xj1FPqoyB
 GwRx17XVIh8uCxv9we0L/Dk+6wwCVdZyzqIglSqouahNC/Zcu7Tif5ozKl1Vl4ffQtP+
 Nth5QoblGwVx4LUqrrKYBZknkF5biL7KQp7Dw+WOQSieKk831KjeYssSdE2/vcrjGwbW
 OYPWEydFBw+C43baMERaLRg93Teokmy+OVxdPINHWqJY4HcxEGToXe6geQ0RQWJQMP5B
 G2ww==
X-Gm-Message-State: AOAM532KvEzUQJbn3LVyrmo2+LgiQz2IYUEAp5y4CewYC99Wol8x3px/
 nQ0O5mr5SQH1Q6SgDUflLxZ2d8bMuhNJaL0hT8kUeg==
X-Google-Smtp-Source: ABdhPJysLyVs18RDawzOHTq6ha9DTd85Rzn6RU+krVz6ajqKSeGfytQC4dmw3oZhnx5buSwtfWd90xJenZsDgcm+k6M=
X-Received: by 2002:adf:c843:: with SMTP id e3mr18764827wrh.38.1642397777710; 
 Sun, 16 Jan 2022 21:36:17 -0800 (PST)
MIME-Version: 1.0
References: <CAGpPFEFoTO-cUxvxEnoNQ3YoKBWRK+pOeyGzni6E5Da-=w+stA@mail.gmail.com>
 <CACPK8Xec1P8xF9t8Uj1Fg0YsX4v6Y6Gi=KkeZD70AoLPqZB=PA@mail.gmail.com>
 <YeHE3qPWS0LpmLIb@heinlein>
In-Reply-To: <YeHE3qPWS0LpmLIb@heinlein>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Mon, 17 Jan 2022 13:36:05 +0800
Message-ID: <CAGm54UGCgosz0BX4EWUTqZHMw5ETM74KOBNOCy-GG0vt1u4f6A@mail.gmail.com>
Subject: Re: Procedure for the send review on u-boot patch
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, logananth hcl <logananth13.hcl@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Jan 15, 2022 at 2:46 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Thu, Jan 13, 2022 at 10:40:40PM +0000, Joel Stanley wrote:
> > Hello,
> >
> > On Thu, 13 Jan 2022 at 08:52, logananth hcl <logananth13.hcl@gmail.com> wrote:
> > >
> > > Hai All,
> > >
> > > In openbmc/u-boot repo(branch - v2016.07-aspeed-openbmc)
> > > https://github.com/openbmc/u-boot/tree/v2016.07-aspeed-openbmc
> > >
> > > I want to send a review on this particular branch in u-boot through upstream.
> > > Is there any specific procedure to upstream it,
> > > kindly provide your suggestions.
> >
> > I strongly recommend using the newer v2019.04 based branch for any new
> > system you're bringing up.
>
> It doesn't seem like anyone is using this branch for any Aspeed system though.
>
> ```
> $ git grep "v2019.04"
> meta-aspeed/recipes-bsp/u-boot/u-boot-common-aspeed-sdk_2019.04.inc:PV = "v2019.04+git${SRCPV}"
> ```
>
> I think everyone doing AST2400/AST2500 work has been copying from existing
> systems and still pointing to the v2016.07 branch that we have working in the
> tree.
>

Doing `git grep u-boot-aspeed-sdk` and there are a few systems using
the new u-boot.

Just a note: the new u-boot requires a different layout by default, it
matches the `openbmc-flash-layout-64.dtsi` but differs from the 32MiB
`openbmc-flash-layout.dtsi`.
So one needs to adjust the `bootcmd` if switching from v2016.07 to v2019.04.


-- 
BRs,
Lei YU
