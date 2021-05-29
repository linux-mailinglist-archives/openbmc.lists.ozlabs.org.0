Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF13394CBC
	for <lists+openbmc@lfdr.de>; Sat, 29 May 2021 17:16:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FslX14rRbz2yxm
	for <lists+openbmc@lfdr.de>; Sun, 30 May 2021 01:16:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=eSiS0Kni;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=saiallforums@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eSiS0Kni; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FslWm0cpkz2xtj
 for <openbmc@lists.ozlabs.org>; Sun, 30 May 2021 01:16:34 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id a4so2225892ljq.9
 for <openbmc@lists.ozlabs.org>; Sat, 29 May 2021 08:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DVZxgfgZjb8mPASWnDwJgQEAQ/Z3XiP1WF+Odpczmbw=;
 b=eSiS0KniEKLZ/3jnmRPfcCqF9h4kYngZCkTLkjjthq5Re7j91Dtk+HQ0+0pGoG41/n
 I4a3NQGLMJzUuo4BlzH8hx7RHyarJVOe0LjeTY2YUxVEbLqZ69FyQs7FTlHKiH+DH4MC
 n1JzBv+J+5W5P5wrHPhes821maxXYcAGzTgsYDxy4LwB5j1pUCh92BYBX60lX/GQZpgY
 JzYKkjHh34UpJdyhWp8JpVqzpOwrWhT0aFKuNtVUhL5b8ewmfdezlfJRFIXlgJUP+m6/
 isoRRd2kjAsiNKlY9MBzbApAEYgAYb7XnIVnfR61IoMmmubDGA371Vrfxw050iAKh5pU
 ZHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DVZxgfgZjb8mPASWnDwJgQEAQ/Z3XiP1WF+Odpczmbw=;
 b=Ty6GSwZZLR4bETz7Z6W0dpDDy3C4a3snjVLIeIzBVKad5sIwbZGRsQzP1CWJeCykGI
 ZwXz5543LSyfR9XKdghXvZ7qMVuNmjSUqcmZGYM8MOe+yux0txIdmnUYGtEF0JEA1Vjp
 3ulIdGkymREkMo63cVVB13qScrnOTmlcaTGxcqg55yB3Wr5bS4Li/mGgT93hE/dMbM5G
 oanFnNU8/XIPE1PNPOCrEx4y3neXsmXLdCq8df0C92sf0KCKppI62G8rFf2K0JgAR0hq
 nkupsim4cN7eq2LEh06DC84v45tRlf2oMuCnt0htadrRq5tnaOs6TXDEzTztiQpDvssB
 9tow==
X-Gm-Message-State: AOAM532zk4haGZ6ZYcaqAMcSc06ZE0nuiP5wltKA5Ggox1BIWTLkpNlC
 2H1xiTq9Msnx3Ozl8wCRJ+LjW0DGLVkzwDQMm5M=
X-Google-Smtp-Source: ABdhPJyRYg753cWX3iyJznT3vqCRX6neVp3YsS8/Dlwthk72B+Z8Ew63Nopbt4NshZxcOdam+o0I4XOLHIw/bSXwnMQ=
X-Received: by 2002:a2e:8682:: with SMTP id l2mr10774617lji.298.1622301385457; 
 Sat, 29 May 2021 08:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <95b58f69-d706-4388-8056-7d8b058ace06@www.fastmail.com>
 <1622243556-26190-1-git-send-email-dphadke@linux.microsoft.com>
In-Reply-To: <1622243556-26190-1-git-send-email-dphadke@linux.microsoft.com>
From: sainath grandhi <saiallforums@gmail.com>
Date: Sat, 29 May 2021 10:16:13 -0500
Message-ID: <CABqzqi4rwJPKnkYiRXDYs=3JWULjh7aY5_o8tYsLpj3DPCbh2A@mail.gmail.com>
Subject: Re: Using VFIO vs. developing a kernel module
To: Dhananjay Phadke <dphadke@linux.microsoft.com>
Content-Type: multipart/alternative; boundary="000000000000cc82b705c379795b"
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000cc82b705c379795b
Content-Type: text/plain; charset="UTF-8"

On Fri, May 28, 2021, 6:12 PM Dhananjay Phadke <dphadke@linux.microsoft.com>
wrote:

> On Fri, 28 May 2021, Andrew Jeffery wrote:
> >
> > On Thu, 27 May 2021, at 22:53, sainath grandhi wrote:
> >> Hello,
> >> Our project has an FPGA connected to BMC as a PCIe endpoint. This
> >> endpoint provides a set of registers via MMIO and an interrupt for
> >> notifying completion of work. This endpoint also implements AER
> >> capability.
> >>
> >> We have two options to enable this endpoint.
> >> 1) Write a new kernel module with a character device interface for
> >> user-space interaction.
> >> 2) Use VFIO infrastructure provided by Linux and write an user-space
> >> application.
> >>
> >> I am reaching out to the community to check if there is any
> >> recommended option, using VFIO vs. implementing a new kernel module,
> >> or any previous experiences weighing in one option over the other.
> >
> > I don't have any experience with VFIO, so take this with a grain of salt.
> >
> > Generally you should write an in-kernel driver for it. The reason you
> > might not want to do so is if the device's register interface changes
> > frequently, as it's more pain to update the kernel than some userspace
> > application, which slows iteration. But handling DMAs and interrupts
> > make userspace more painful, so unless VFIO helps there (I assume it
> > does), then that would push the implementation back towards the kernel.
>
> VFIO requires IOMMU to protect kernel memory corruption by device DMA,
> which is programmed by (untrusted) userspace app. Unless the BMC SoC
> implements IOMMU (SMMU) for I/O virtualization (I/O page tables), it
> would not be possible/safe to use VFIO for DMA/interrupts.
>
> See https://www.kernel.org/doc/Documentation/vfio.txt
>
> Yeah. In our case the endpoint does not have DMA.  And uses INTx for
> interrupt to avoid memory corruption issues.


Our BMC does not support SMMU, so I am using VFIO with no IOMMU
> configuration. Linux kernel introduced VFIO without IOMMU for such
> platforms so that userspace applications can still take advantage of the
> VFIO facilities.
>

If you just want to program MMIO registers, you could mmap() PCIe sysfs
> resource files that represent MMIO bars and let application write and
> read registers, including polling for completion.
>
> See https://www.kernel.org/doc/Documentation/PCI/sysfs-pci.rst
>
> If none of these options are viable, then a custom kernel driver would
> be necessary.
>
> Regards,
> Dhananjay
>

--000000000000cc82b705c379795b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, May 28, 2021, 6:12 PM Dhananjay Phadke &lt;<a =
href=3D"mailto:dphadke@linux.microsoft.com">dphadke@linux.microsoft.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 28 May 2021, An=
drew Jeffery wrote:<br>
&gt;<br>
&gt; On Thu, 27 May 2021, at 22:53, sainath grandhi wrote:<br>
&gt;&gt; Hello,<br>
&gt;&gt; Our project has an FPGA connected to BMC as a PCIe endpoint. This<=
br>
&gt;&gt; endpoint provides a set of registers via MMIO and an interrupt for=
<br>
&gt;&gt; notifying completion of work. This endpoint also implements AER<br=
>
&gt;&gt; capability.<br>
&gt;&gt;<br>
&gt;&gt; We have two options to enable this endpoint.<br>
&gt;&gt; 1) Write a new kernel module with a character device interface for=
<br>
&gt;&gt; user-space interaction.<br>
&gt;&gt; 2) Use VFIO infrastructure provided by Linux and write an user-spa=
ce<br>
&gt;&gt; application.<br>
&gt;&gt;<br>
&gt;&gt; I am reaching out to the community to check if there is any<br>
&gt;&gt; recommended option, using VFIO vs. implementing a new kernel modul=
e,<br>
&gt;&gt; or any previous experiences weighing in one option over the other.=
<br>
&gt;<br>
&gt; I don&#39;t have any experience with VFIO, so take this with a grain o=
f salt.<br>
&gt;<br>
&gt; Generally you should write an in-kernel driver for it. The reason you<=
br>
&gt; might not want to do so is if the device&#39;s register interface chan=
ges<br>
&gt; frequently, as it&#39;s more pain to update the kernel than some users=
pace<br>
&gt; application, which slows iteration. But handling DMAs and interrupts<b=
r>
&gt; make userspace more painful, so unless VFIO helps there (I assume it<b=
r>
&gt; does), then that would push the implementation back towards the kernel=
.<br>
<br>
VFIO requires IOMMU to protect kernel memory corruption by device DMA,<br>
which is programmed by (untrusted) userspace app. Unless the BMC SoC<br>
implements IOMMU (SMMU) for I/O virtualization (I/O page tables), it<br>
would not be possible/safe to use VFIO for DMA/interrupts.<br>
<br>
See <a href=3D"https://www.kernel.org/doc/Documentation/vfio.txt" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://www.kernel.org/doc/Documenta=
tion/vfio.txt</a><br><br>Yeah. In our case the endpoint does not have DMA.=
=C2=A0 And uses INTx for interrupt to avoid memory corruption issues.</bloc=
kquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"></div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Our=
 BMC does not support SMMU, so I am using VFIO with no IOMMU configuration.=
 Linux kernel introduced VFIO without IOMMU for such platforms so that user=
space applications can still take advantage of the VFIO facilities.<br></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
If you just want to program MMIO registers, you could mmap() PCIe sysfs<br>
resource files that represent MMIO bars and let application write and<br>
read registers, including polling for completion.<br>
<br>
See <a href=3D"https://www.kernel.org/doc/Documentation/PCI/sysfs-pci.rst" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.kernel.org/doc/=
Documentation/PCI/sysfs-pci.rst</a><br>
<br>
If none of these options are viable, then a custom kernel driver would<br>
be necessary.<br>
<br>
Regards,<br>
Dhananjay<br>
</blockquote></div></div></div>

--000000000000cc82b705c379795b--
