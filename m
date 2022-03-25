Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F10A04E781F
	for <lists+openbmc@lfdr.de>; Fri, 25 Mar 2022 16:41:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ5t94mg2z307B
	for <lists+openbmc@lfdr.de>; Sat, 26 Mar 2022 02:41:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OPGuYo/i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=logananth13.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OPGuYo/i; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQ5sm47qCz2xrm
 for <openbmc@lists.ozlabs.org>; Sat, 26 Mar 2022 02:41:14 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id y10so3401369pfa.7
 for <openbmc@lists.ozlabs.org>; Fri, 25 Mar 2022 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9rqCkGcaQjVQe63PA3mLp6/BLgjcz1Q2mehHWOj5894=;
 b=OPGuYo/iF3QaNTHGYnvrv35PKnkdqmSbk1lnCBlvbFu/dKYZ8hgMlUX9fDb639RT7C
 2qK+S63MlGU4WWIr5t3afLo35+vAtDp8S01L4U3MS54FbjF4Xz8V7uz/4gGNqqJF7IH+
 2/MEgE4L3Byu3mFFLwPZ1p0z/pLTw31Zz71PreYPCs6ffGtJ/z7mG9B9oIDOargDhw7O
 S1oEx3HsRp3G4JTvPoa7FxPBXp0Tir7I0iJpHxndoTbaMKXgQg0ms5gjO+LV+d4mk/n/
 xat336eHdc4Kuybu6EMiKexMlRlax+y4V/bkVL17388ihXCFWC1DfzxOuxoTIWj02xL7
 7Lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9rqCkGcaQjVQe63PA3mLp6/BLgjcz1Q2mehHWOj5894=;
 b=mihhJELDDOsSJGUr8PEVbvN+6ENxPnU9DYU563thHFfj+r/CK6XuOejks5Cby8JEhU
 do9U/EheCBG3hrSo9EKHO9IGJImInZMp0xNK2ZleMwut5EQUKwLxr1NJ5rzPqRBuRO9X
 q5oDICMxocziK8HZANpXw4HXwzyLtgGT4t/N797KJVe2NPP6ASR/YRDYpRhTRALPxcUN
 0yzDoS46ms1Gazg1uanpCGfDDk7r4G3mRJV/qm+PrLcAWrHxQNuoZkvHxRYsaVAdZbwV
 8O30xR694cvMpyz2a+xcMWPVhXvX4QsZdNI1yOXodshyK75Fjrhl24B/zmqTwBaQ3CYA
 C6CA==
X-Gm-Message-State: AOAM5314AjJGohOt9dFx3b4AmXqcCmdfqSc+Kv3vAG8/2vmjsC3na1tY
 uwk9ayaEAot1aYTWAaXE8fT3asrASCTxRQLHEmY=
X-Google-Smtp-Source: ABdhPJxIH6BNq76XsCk3I8jXlUa7a6oDi51FMJow11dXyDVm0VdhGpNUd4G2zLw4PhgDmLv4Ja4AZkn8Zq7CFVoEDqA=
X-Received: by 2002:a63:f452:0:b0:382:7af1:6ad6 with SMTP id
 p18-20020a63f452000000b003827af16ad6mr167175pgk.500.1648222871517; Fri, 25
 Mar 2022 08:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAGpPFEHeN0NL3EJ238BbGLNpaayRo4SGcfWdRTdNiEgpq2a0Ng@mail.gmail.com>
 <ea0c2d76-0a89-487a-a710-d6a07ae967b9@www.fastmail.com>
 <CAGpPFEHTu83O1S9NOP02WQpbuvrf3RRUf=VnPNc352CrzxnnQw@mail.gmail.com>
 <YjyVjLQE1mjqGm5X@heinlein>
In-Reply-To: <YjyVjLQE1mjqGm5X@heinlein>
From: logananth hcl <logananth13.hcl@gmail.com>
Date: Fri, 25 Mar 2022 21:10:59 +0530
Message-ID: <CAGpPFEEOvzRb9awNm3zCjGdCngdUJ=veu1puWXqA1kksAedk7g@mail.gmail.com>
Subject: Re: Applying patches to U-boot 2019.04
To: Patrick Williams <patrick@stwcx.xyz>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="000000000000c47be305db0ccabc"
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
Cc: openbmc@lists.ozlabs.org, "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c47be305db0ccabc
Content-Type: text/plain; charset="UTF-8"

Thank you for your suggestions,

The problem is basically from my local build, now it's resolved and copied
to the path as mentioned,

Then updated the paths in the repotest and pushed the patch within the same
commit.

Thank you.


On Thu, Mar 24, 2022 at 9:30 PM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Wed, Mar 23, 2022 at 08:25:18PM +0530, logananth hcl wrote:
> > I have pushed the related machine layer u-boot patch files,
> > in the following gerrit link,
> >
> > https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/52263
> >
> > Suggest me to add these patch files to the list.
> >
> > In the local build itself, u-boot bb_patches are not applied during
> > bitbake(copied to the build's u-boot folder), is there any restriction on
> > this to apply bb_patch files.
>
> I don't see this behavior.  I downloaded your patch and see the correct
> modifications in my build directory.  I checked this file and see the
> 'console_slotN' modifications from patch 0002 being applied.  Are you
> certain they are not applying for you?
>
>
> .../lf-build-yosemitev2/tmp/work/yosemitev2-openbmc-linux-gnueabi/u-boot-aspeed-sdk/1_v2019.04+gitAUTOINC+ed55c4e7c3-r0/git/arch/arm/mach-aspeed/ast2500/platform.S
>
> > I'm facing repotest failure, I think that will be resolved once it is
> added
> > in the repotest.
>
> I made the same comment in the commit, but we can simply update the
> paths in repotest.  You've only renamed the files so we can move the
> paths in repotest at the same time (with the same commit).  We just
> don't want to add new patches.
>
> --
> Patrick Williams
>

--000000000000c47be305db0ccabc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for your suggestions,<div><br></div><div>The pro=
blem is basically from my local build, now it&#39;s resolved and copied to =
the path as mentioned,</div><div><br></div><div>Then updated the paths in t=
he repotest and pushed the patch within the same commit.</div><div><br></di=
v><div>Thank you.</div><div>=C2=A0</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 24, 2022 at 9:30 PM Pat=
rick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Wed, Mar 23, 2022 at 08:25:18PM +0530, logananth hcl wrote:<br>
&gt; I have pushed the related machine layer u-boot patch files,<br>
&gt; in the following gerrit link,<br>
&gt; <br>
&gt; <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/5226=
3" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project.xyz/=
c/openbmc/openbmc/+/52263</a><br>
&gt; <br>
&gt; Suggest me to add these patch files to the list.<br>
&gt; <br>
&gt; In the local build itself, u-boot bb_patches are not applied during<br=
>
&gt; bitbake(copied to the build&#39;s u-boot folder), is there any restric=
tion on<br>
&gt; this to apply bb_patch files.<br>
<br>
I don&#39;t see this behavior.=C2=A0 I downloaded your patch and see the co=
rrect<br>
modifications in my build directory.=C2=A0 I checked this file and see the<=
br>
&#39;console_slotN&#39; modifications from patch 0002 being applied.=C2=A0 =
Are you<br>
certain they are not applying for you?<br>
<br>
.../lf-build-yosemitev2/tmp/work/yosemitev2-openbmc-linux-gnueabi/u-boot-as=
peed-sdk/1_v2019.04+gitAUTOINC+ed55c4e7c3-r0/git/arch/arm/mach-aspeed/ast25=
00/platform.S<br>
<br>
&gt; I&#39;m facing repotest failure, I think that will be resolved once it=
 is added<br>
&gt; in the repotest.<br>
<br>
I made the same comment in the commit, but we can simply update the<br>
paths in repotest.=C2=A0 You&#39;ve only renamed the files so we can move t=
he<br>
paths in repotest at the same time (with the same commit).=C2=A0 We just<br=
>
don&#39;t want to add new patches.<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--000000000000c47be305db0ccabc--
