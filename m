Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D8A8BDD0
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 17:56:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467HQW66fVzDqfG
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 01:56:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bTUekn2f"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467HPk4b4bzDqfG
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 01:56:10 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id k3so452863pgb.10
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 08:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NzH0zTEonOYlV67yGHvi8Vxu/fSCUVplyPzFv4by8Kk=;
 b=bTUekn2fhXGbatzCEygIVUI3uem3DSHx8gVkthxUaFXMDGPJ/3/cIB6vs6oq0vbkt2
 cJXRbLFJad4tmprckKo5Q30ty6HD1H+tskwuyRIFjNmf1olK/MFcz9p1bbyvC+IrL5IK
 2FXyrG7Fvc4iRLo3AJhT33k1T0Qnko4T9ngQLw1kApTNZ2l8CASfewXk2TI3e+DnECLG
 GxfWqN3ADUdXG3q7aocppFGP8TWVM+MMXavUi1rporOOUv6kett6uEkPxRy95k1R4umm
 yDxpAkOEkG21pmN1bOvXC/8YL5ppFVfWZu56jw1JVnKJ5S8L4SByIZxeKKO7K3GgyTgm
 hKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NzH0zTEonOYlV67yGHvi8Vxu/fSCUVplyPzFv4by8Kk=;
 b=GveGPseyc0ZAWbg/8yZPaJv0+p9+wKVOMm1hhbLfYdsMh5eSV6VOiMvG9F2cWAXRdp
 E6lyiQXW+mvSA+HOfp1R8kIvJZVNTa9bQGgzDfHT7ohvMg3CQ+uC8oAozs+/QozEx2x7
 szwISshVBGbOX/dfoMCbqv4/o9ugbwNd8JkEJv2XVTiuxlLCCTtY4Vh4IxVfs3IJe+6N
 ubp4xIjzftXZBWdnWcJiuHBEVuFvkNhlyTa64wRFfkH0NdTQsPAQxsJ7SMbAblwB2+jt
 QaumxU02kE8C+YW09nDTAjj8K1HmqbrdIWV7OtxGqvPrbg+99SWbc7TbLIJIFqgS+nfO
 yAIw==
X-Gm-Message-State: APjAAAXoS7sla7HJFfQ44LeT3hHETur6L9+MZdWY3i4cGGTXH6+tQ0Op
 BT1NknzXdaUi5+Fh/DJSuZQBxl77Pb5C0bo25/m43A==
X-Google-Smtp-Source: APXvYqxDzBRU6f2at4U96r7awwei7YcuJu5S0TNGlVov5zAN7RiJ2s5KUPhkc3vKLWbCxuu+GfMmuhfp0tEcDjLyV4U=
X-Received: by 2002:a62:1515:: with SMTP id 21mr24836382pfv.81.1565711766566; 
 Tue, 13 Aug 2019 08:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <d739c79fc78643c8aa6da29522290874@lenovo.com>
 <2841ed2f-ef3d-7cbb-3afb-c8c657382455@linux.ibm.com>
In-Reply-To: <2841ed2f-ef3d-7cbb-3afb-c8c657382455@linux.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 13 Aug 2019 08:55:55 -0700
Message-ID: <CAO=notwKnBztj3GUhG45i0weNM53V8yo5j33qupr21qH1SUZ4w@mail.gmail.com>
Subject: Re: OpenBMC Solution To CVE issues
To: Joseph Reynolds <jrey@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Yonghui YH21 Liu <liuyh21@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 13, 2019 at 7:46 AM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> On 8/12/19 10:21 PM, Yonghui YH21 Liu wrote:
> >
> > HI All,
> >
> >          I saw there are some solutions to public CVE issues, some
> > solution are not enable by default setting.
> >
> I've provided by initial thoughts about how these CVEs affect OpenBMC.
> This is from the point of view of code running on OpenBMC 2.7.0
> systems.  My responses disregard vulnerabilities which may affect the
> build host.
>
> Will BMC subject matter experts review the information below and provide
> answers?
>
> - Joseph
>
> >          As we know, there are some new coming CVE issues. Could you
> > help confirm whether below issues will be fixed? Is yes, when will be
> > ready?
> >
> >       CVE-2019-12900
> >
> The problem: BZ2 decompress - affects bzip2 through 1.0.6
> Impact: we are impacted, we are at bzip2 1.0.6
> How to exploit?  Do any OpenBMC interfaces use BZ2 compression? Image
> upload?  Web interfaces?  If so, we may be impacted.
>
> > CVE-2018-20843
> >
> The problem: affects Expat XML before 2.2.7
> Impact: Not applicable, OpenBMC does not use XML
>
> > CVE-2019-9169
> >
> The problem: glibc/libc6 regexec proceed_next_node
> Impact: we are impacted, we are on glibc 2.29
> How to exploit?  Do any OpenBMC interfaces parse regular expressions?
> If so we may be impacted?  If not, this will be hared to exploit.

We parse regular expressions, however they're pre-programmed, versus
allowing user-input.  This makes them difficult to exploit.  I don't
know if bmcweb offers that type of input from the user, but I can't
imagine -- but someone can follow-up.

>
> > CVE-2018-20750
> >
> The problem: libvncserver/rfbserver.c, affects LibVNC through 0.9.12
> Impact: we may be impacted, we are on 0.9.12
> Does our KVM use vncserver?
>
> > CVE-2019-13404
> >
> The problem: Python installer, applies to Windows
> Impact: not applicable, note that OpenBMC removed Python from the image
>
> > Thank your great support in advance!
> >
> > Thanks
> >
>
