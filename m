Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D5790CFD
	for <lists+openbmc@lfdr.de>; Sat, 17 Aug 2019 06:46:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 469SM7276GzDsNQ
	for <lists+openbmc@lfdr.de>; Sat, 17 Aug 2019 14:46:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c33; helo=mail-yw1-xc33.google.com;
 envelope-from=james.mihm@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tuMrLy6n"; 
 dkim-atps=neutral
Received: from mail-yw1-xc33.google.com (mail-yw1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 469SLR2jc7zDsLx
 for <openbmc@lists.ozlabs.org>; Sat, 17 Aug 2019 14:45:47 +1000 (AEST)
Received: by mail-yw1-xc33.google.com with SMTP id x74so2453228ywx.6
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 21:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JIXl6enO/V92Y9pHAtX4/GzJ1cQhPrBDQB8Qd43MPII=;
 b=tuMrLy6n2GhhDG6RnWA2Lmvku2/+56dsCrn337D4SaFr2ZCftCmOXLi0ONU745fF9Q
 PSTwXRj3mR34Ouqcm7BcOGomSCkuK8L/zET9x8XndyOw/sydzx5zk3s7XiVXeN03ub4p
 gVxzMhQ4naM8IBoxC9fvgpunLzxK/9seMgvPIXd5lbH91BAUmLbwBxoF7yrX27oHQAZe
 an71e7rHTr26Y77YRfnf9IwDy9cFD85ymH2Qqfnme6xOcMDcAQxHMSaeNhCMya1uyNqE
 h5JYRcxnXpW7J7+lUtNWkTePBzULxHxX682XMqqu+ziUTkRy3jhPeLSBp8WlGEQJ2S80
 NAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JIXl6enO/V92Y9pHAtX4/GzJ1cQhPrBDQB8Qd43MPII=;
 b=V1lAYYeCsob2dzNE4Xp3pxVAmi2HwL+ugMqVo5csIUv5yJ6acHWts62gWBGKOWzgnf
 XQHCUG9LDd+tRCgYD8cNAGwyeF2uWIRl8d6Pep0Z7Pe8XyRSooNIiZwLOdg72zg58EKa
 F+De8vY0E3az8B/EGk3YLD/zOtgVm8BlVJ5LY4dj7fs6AbIJdRpFPwbNU10BcSS7N74W
 hGmsi3kTS7M0WU8jwGwW2mQJYpLCE84/zoQ8Xo9GpU3+59jBmfwbrkM3I671hJoLVISs
 TYdMCqvVVrndkG5TEm8IpWOfJcYawc/u4JOR9AdXwWOm06lOVfIFMwAmzhyAoBfn1Yb8
 n4CQ==
X-Gm-Message-State: APjAAAWoXUiML7SYWA/N67BrTYhFpP1l/lYaoKvQnfV1c0m42Abf4BvQ
 LbME5gS8gaPJw7R5Q4vUrFZF83pKSIScP/E5wTc=
X-Google-Smtp-Source: APXvYqz9amF7+GmAiHI7TRdaYxA6iojQX6nfOIXxQ5bRXO9HAnPyMqNJhFj3cl7ACzjN7DSIhvoFy5vZ0d2rgwa7ISI=
X-Received: by 2002:a81:de4e:: with SMTP id o14mr8817705ywl.369.1566017143058; 
 Fri, 16 Aug 2019 21:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <e336595b3dbf4162a4bfb8a8880077d2@nokia-sbell.com>
 <38c0bc79-4ffe-c9c5-423c-b6a98f0dcd58@elsoft.ch>
 <03edb9afa89345ec90f2b711ef0c3d73@nokia-sbell.com>
In-Reply-To: <03edb9afa89345ec90f2b711ef0c3d73@nokia-sbell.com>
From: James Mihm <james.mihm@gmail.com>
Date: Fri, 16 Aug 2019 21:45:06 -0700
Message-ID: <CADy_Pt0Jv+uAZNnxZBy72+U5Szs0D8SojXUuiu3H73VF3mvr8A@mail.gmail.com>
Subject: Re: OpenBMC version 2.7 run in target S2600WF shows BMC not
 ready(xyz.openbmc_project.State.BMC.BMCState.NotReady)
To: "Jiang, Hongjiang (NSB - CN/Hangzhou)" <hongjiang.jiang@nokia-sbell.com>
Content-Type: multipart/alternative; boundary="000000000000863680059048c749"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000863680059048c749
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Check out the Intel development repo at  https://github.com/intel-bmc. You
should be able to find what you need there.
This is the Intel repository that we're working on getting upstreamed which
takes a little longer.

James.

On Fri, Aug 16, 2019 at 1:24 AM Jiang, Hongjiang (NSB - CN/Hangzhou) <
hongjiang.jiang@nokia-sbell.com> wrote:

> Hi,
>
> Thanks for your info. I will check this package and see if I can do some
> hacking=F0=9F=98=8A
>
>
> Best Regards,
> Jiang Hongjiang
>
> Nokia
>
>
> Jiang Hongjiang
>
>
>
> +86 13666669403
>
>
>
>
> -----Original Message-----
> From: David M=C3=BCller (ELSOFT AG) <d.mueller@elsoft.ch>
> Sent: Friday, August 16, 2019 3:05 PM
> To: Jiang, Hongjiang (NSB - CN/Hangzhou) <hongjiang.jiang@nokia-sbell.com=
>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: OpenBMC version 2.7 run in target S2600WF shows BMC not
> ready(xyz.openbmc_project.State.BMC.BMCState.NotReady)
>
> Hello
>
> Jiang, Hongjiang (NSB - CN/Hangzhou) wrote:
>
> > Currently I compiled OpenBMC tag 2.7-0 with machine target S2600WF( as
> > I have only wolfpass server in hand), and flash it to a real S2600WF
> server.
>
> As far as I can see support for the Intel s2600wf board is currently
> broken as it uses the (no longer working) x86-power-control package.
>
> Please see https://github.com/openbmc/x86-power-control/issues/1 for more
> details.
>
> Dave
>

--000000000000863680059048c749
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Check out the Intel development repo at=C2=A0

<a href=3D"https://github.com/intel-bmc">https://github.com/intel-bmc</a>. =
You should be able to find what=C2=A0you need there.=C2=A0<div>This is the =
Intel repository that we&#39;re working on getting upstreamed which takes a=
 little longer.</div><div><br></div><div>James.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 16, 2019=
 at 1:24 AM Jiang, Hongjiang (NSB - CN/Hangzhou) &lt;<a href=3D"mailto:hong=
jiang.jiang@nokia-sbell.com">hongjiang.jiang@nokia-sbell.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
Thanks for your info. I will check this package and see if I can do some ha=
cking=F0=9F=98=8A<br>
<br>
<br>
Best Regards,<br>
Jiang Hongjiang<br>
<br>
Nokia<br>
<br>
<br>
Jiang Hongjiang<br>
<br>
<br>
<br>
+86 13666669403<br>
<br>
<br>
<br>
<br>
-----Original Message-----<br>
From: David M=C3=BCller (ELSOFT AG) &lt;<a href=3D"mailto:d.mueller@elsoft.=
ch" target=3D"_blank">d.mueller@elsoft.ch</a>&gt; <br>
Sent: Friday, August 16, 2019 3:05 PM<br>
To: Jiang, Hongjiang (NSB - CN/Hangzhou) &lt;<a href=3D"mailto:hongjiang.ji=
ang@nokia-sbell.com" target=3D"_blank">hongjiang.jiang@nokia-sbell.com</a>&=
gt;<br>
Cc: <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@l=
ists.ozlabs.org</a><br>
Subject: Re: OpenBMC version 2.7 run in target S2600WF shows BMC not ready(=
xyz.openbmc_project.State.BMC.BMCState.NotReady)<br>
<br>
Hello<br>
<br>
Jiang, Hongjiang (NSB - CN/Hangzhou) wrote:<br>
<br>
&gt; Currently I compiled OpenBMC tag 2.7-0 with machine target S2600WF( as=
 <br>
&gt; I have only wolfpass server in hand), and flash it to a real S2600WF s=
erver.<br>
<br>
As far as I can see support for the Intel s2600wf board is currently broken=
 as it uses the (no longer working) x86-power-control package.<br>
<br>
Please see <a href=3D"https://github.com/openbmc/x86-power-control/issues/1=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/x86-power=
-control/issues/1</a> for more details.<br>
<br>
Dave<br>
</blockquote></div>

--000000000000863680059048c749--
