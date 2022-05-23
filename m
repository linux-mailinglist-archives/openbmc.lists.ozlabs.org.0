Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 778F6530C43
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 11:06:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6BKQ2mvDz3bkN
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 19:06:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VzeQybxf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e;
 helo=mail-lj1-x22e.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VzeQybxf; dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6BK04SPwz305S
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 19:06:27 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id m11so4960825ljc.1
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 02:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c31VgxAPOxEUsROXeBcUQluD+gl7iW0O4zV+RmQn2l4=;
 b=VzeQybxfmt+mm9PPUb3UHtTpQKpSuDC/a9OVBfno9GR6vKLUGb4Pg4AjBLUNMWYTuy
 grgMIhNKERZ0dMKDNFL+KfdUIyK+8XxOh0w2JhcZ+MMjzatt8Wb10lxMces8JKUD2my8
 JdCgZHdUi4J0CdGGJfHcHaJXd7KvCpHpEDLm4sz+qmLjCR5rIHSsYWG5gfgU3Qcey6ym
 PJiciL2cQd+eRBmxKuE/OIc0mkdgtiyEhE+gdEZH7YfWX2wm1Cb3MVfldijAYlA2Tlj9
 Fz34w1fMiuZS9OsNY98EsFaBnu9lLEplLLp5wdpQou/0fSNnWTLkmCf+Oi12BjKoTlux
 sGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c31VgxAPOxEUsROXeBcUQluD+gl7iW0O4zV+RmQn2l4=;
 b=iDerVE8uGQEsMdNhswDKI2K8Wsjenvt6bO8WVYNhdZy/wZjfVPdkXn2JqoePI1w1ZL
 0QtxlxHNRAzU6T7EXIJSStxb0Xct0XHa4RaJrf0pRvhM1GHyrrtUnfZNE3NmgoPYNkV9
 FgTf7aoToZKxhGgiIEzH0qp/Mx8PzVAs+uoxs75t9ViaxHuPImD5H5sVzEWU6sa1k62L
 tpVg61bzmx3wnhVXuMAx7QW9cibYKz8uNNPQsy6pfAPy+cvRLuEM/CxJCpXmJNDrKEVG
 gFhp0Qn2YiuN2PsdvKkg/LgMVFrQsfrcIbhxadtfNEFzP9QIrqNWbTvFAOQTMyHTlzY8
 NeOQ==
X-Gm-Message-State: AOAM533yPFdM7gKTfE2Er8LaxJbi4O8L7rGEdVoASn65iWYZdoGTSmzm
 nWqOf/vDtRoHwZnBBFUDVhZPKendEFojz8+xi0U=
X-Google-Smtp-Source: ABdhPJzQV4IXbyzcOthbMe7j41Fs7BnkjjlQ4eONXsKw18HGNDtmbpONBK22qWAVgeySQWNNUCwIXjvZj4PeAs2AJos=
X-Received: by 2002:a2e:8691:0:b0:253:def8:ed29 with SMTP id
 l17-20020a2e8691000000b00253def8ed29mr8503892lji.423.1653296779214; Mon, 23
 May 2022 02:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220510031056.1657-1-ctcchien@nuvoton.com>
 <20220510031056.1657-2-ctcchien@nuvoton.com>
 <YoUwe6Tj4Uh6ukc8@zn.tnic>
 <CAHpyw9fjThEP4NuU08aNJ_raHpq9-j9KgBb8YuZ_shXTjhm3JA@mail.gmail.com>
 <YoYPGWreQuF9QZzc@zn.tnic>
 <CAHpyw9es-n+bW9SsGBmmr3ghBFk8Q8E6ZTbE42BpU-6p8LfHtw@mail.gmail.com>
 <YoeE8cBhUkF3K44/@zn.tnic>
In-Reply-To: <YoeE8cBhUkF3K44/@zn.tnic>
From: Medad Young <medadyoung@gmail.com>
Date: Mon, 23 May 2022 17:06:07 +0800
Message-ID: <CAHpyw9fAfNf8j++JtLhuudSWj6N1-KAxA_fxEGL998WNVXTPdQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] ARM: dts: nuvoton: Add memory controller node
To: Borislav Petkov <bp@alien8.de>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 Benjamin Fair <benjaminfair@google.com>,
 linux-edac <linux-edac@vger.kernel.org>, KFTING <KFTING@nuvoton.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 James Morse <james.morse@arm.com>, YSCHU@nuvoton.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Borislav,

thanks for your comments.

Borislav Petkov <bp@alien8.de> =E6=96=BC 2022=E5=B9=B45=E6=9C=8820=E6=97=A5=
 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:09=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, May 20, 2022 at 10:31:05AM +0800, Medad Young wrote:
> > for the second warning, I did upadate my .git/config according to your
> > advise. but I thought I met orthe problem, I will try to fix it
>
> You need to do "git commit --amend" on the patch so that it updates the
> author.

I did do "git commit --amend",
I beleve the issue is about the mail server I used,
I use gmail to send the mail due to the mail server of my company
does't support smtp
so now I should sign the commit with my gmail account.

>
> > for the first warning, did I really need to fix it?
>
> Yes, you need to fix both.
>
> Again, before you send, run checkpatch on your patches, one by one.

OK

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

B.R.
Medad
