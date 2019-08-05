Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB3382629
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 22:40:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462V5L2m5SzDqRS
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2019 06:40:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dHEZmYva"; 
 dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462V4V6v4HzDqWg
 for <openbmc@lists.ozlabs.org>; Tue,  6 Aug 2019 06:39:37 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id o13so40302107pgp.12
 for <openbmc@lists.ozlabs.org>; Mon, 05 Aug 2019 13:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rqMc5gytOQLKE5pyJkmPw/qn6jv1RAY5ZmYX89sat6Q=;
 b=dHEZmYvarW0NmNLYE7FFNLpf8ApdxPdBImlcnj0BNEPlgJXPZxRLyzP/Oj5HxLEBkl
 g+6+hmR2ij1g0cp2WD7Kth0hoPvBWieaZauU+PBTF8HtkiYWjfmKh2MJ6TZbm1xmzv20
 vWGFaZ/OfWFgiTfDS1aDZ0PekswxO4y2CiKWEtPni7Rnuo6+kkLpQa7zQQTXlTc/gl3t
 4hlNsP1bquKpjcQW0Ht1JpiHB7v93iukZEGPqD98yExlWSCq0/lIgJ9VxNpgkyqDMsze
 OactAU6CdP09EU9hZrwJ0U0fa8ktpUCy9ueQHR6R8qi4Wfi9u0Cuhqla/ERxBhcx27pW
 Frpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rqMc5gytOQLKE5pyJkmPw/qn6jv1RAY5ZmYX89sat6Q=;
 b=sRUC2u7gELJbGCyhhNNylu3p7sKFEC7r7T8AbgxPn7dGPd1wZPT5VPsv1TCgiLDE6L
 su5exTGWl9PpLHgHbT5dLCv7OOvL8INpVTD/xfA9H2A4VQ4PRpPYtkjxwJ6kgucpWi/8
 51O2LTI8rVO2t55zWLuSQE5mqSceeJ/Q8npEUQhocVtELsID7B3ffiQfFepT5xtXC6tr
 0cz/MIf7zbd7fR4N7t0CVD1IoYRb9QD9qFElFp6L8NYa7u8X9IImEqk/iS37defXul1Y
 7Zhxe3BgMfZtRDMiw6UETUOiCD/Iny6ayeAAhXGOJSX9axsg11BYhFavRTj8f5EUa/8X
 WqwA==
X-Gm-Message-State: APjAAAU2cXjf0IehYGW/29zPdF1Qi3TevSEWQ2VNTlzOdKgFefm+1z/a
 RfSHKtxXRuIraUdDo9D6dnbq4R7QttXXN+U99edYPA==
X-Google-Smtp-Source: APXvYqz8SeCWR10ASWJpqwHT2168eCuzUTAxkD9n3TsiEeT6db3F14Xq1sqOBAXNeQ75/+Dg57NuzvSRitND8xWP7nU=
X-Received: by 2002:aa7:914e:: with SMTP id 14mr74588823pfi.136.1565037572180; 
 Mon, 05 Aug 2019 13:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <95784a9aed5d4f269fdf95684500d48e@lenovo.com>
 <CAO=notyC=6U8Afq8yOPxW0e933kXq3ubTVR5mc3WVGBhd4F08g@mail.gmail.com>
 <CAO=notwQv43Nbe9nUfzFDM1GYDqc6u6Oro83BGdcZ1rjePu-hg@mail.gmail.com>
 <CAO=notyQpRiwYMsGY83DyvaM-a_c+fCpguFyFW4dqQz3_yWWjA@mail.gmail.com>
 <CAO=notzWsPKqV_+rgm=Hzv27YfoRQtz8OPwVDOmGuvRS20BDwA@mail.gmail.com>
In-Reply-To: <CAO=notzWsPKqV_+rgm=Hzv27YfoRQtz8OPwVDOmGuvRS20BDwA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 5 Aug 2019 13:39:20 -0700
Message-ID: <CAO=notwQ52OeLrFNisQyfj__3LuEE2u_48FhdcApUDyOGYOovQ@mail.gmail.com>
Subject: Re: Clarify some questions about BIOS update (phosphor-ipmi-flash)
To: Andrew MS1 Peng <pengms1@lenovo.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Yonghui YH21 Liu <liuyh21@lenovo.com>, Lisa YJ19 Liu <liuyj19@lenovo.com>,
 Duke KH Du <dukh@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 5, 2019 at 10:39 AM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Aug 5, 2019 at 9:39 AM Patrick Venture <venture@google.com> wrote:
> >
> > On Mon, Aug 5, 2019 at 9:32 AM Patrick Venture <venture@google.com> wrote:
> > >
> > > On Mon, Aug 5, 2019 at 9:17 AM Patrick Venture <venture@google.com> wrote:
> > > >
> > > > On Mon, Aug 5, 2019 at 4:56 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:
> > > > >
> > > > > Hi Patrick,
> > > > >
> > > > >
> > > > >
> > > > > I have some questions about BIOS update via phosphor-ipmi-flash with L2A, please help to clarify. Thanks.
> > > > >
> > > > >
> > > > >
> > > >
> > > > Thanks for giving it a shot!  I don't have any systems using this for
> > > > BIOS update, so I'm curious where there may be issues lurking :)
> > > >
> > > >
> > > > > 1. How can I update the status (success or failure) after upgrade BIOS firmware? Currently, the update status only appear "running".
> > > > >
> > > >
> > > > I see, the update mechanism doesn't have a verification option.  A bit
> > > > of an oversight.  I'll have something up for review later today.  Then
> > > > it'll be something you configure similarly to the verifySystemd json
> > > > entry.
> > > >
> > > > > 2. It was failed when triggered "phosphor-ipmi-flash-bios-update.target" since the job-mode is null string. It can work well when I add string "replace" to job-mode. How can I config (json file or configure parameter) to support it?
>
> This patch will enable you to specify "mode" in the json. *** note: i
> will set some time aside shortly to document writing json
> configurations.
>
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-flash/+/24167
>
> > > >
> > > > I'll take a look!  The parameter for job-mode, I thought, was
> > > > optional?  Since we don't specify it for other jobs (verification,
> > > > etc).  The string should be empty by default and then not added as a
> > > > null-string:
> > > >
> > > > https://github.com/openbmc/phosphor-ipmi-flash/blob/f0c71df2514927e933f6fc33d9669ab0663a0706/bmc/update_systemd.cpp#L49
> > >
> > > I see it is required!  Since I always configure with reboot, I never
> > > saw this failure. I'll default it to "replace"
> >
> > First patch in the series generated from your email:
> >
> > https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-flash/+/24165
> >
> > Next: json configuration option to control the job-mode.
> > Then merge verification and update objects, s.t. you can specify the
> > status path.

This patchset adds support for a new update configuration that lets
you read the status from a file.

https://gerrit.openbmc-project.xyz/24171

> >
> > *** A later patchset can have the status be not a path, but a dbus
> > property or dbus path -- if someone wants to implement a new object
> > for this, it's somewhat trivial.
> >
> > >
> > > >
> > > > I don't think I have a unit-test that verifies the parameters are sent
> > > > down properly, so I'll also add that today AND I'll add an optional
> > > > mode parameter to the json.
> > > >
> > > > Sending for review today.
> > > >
> > > > ...
> > > >
> > > > >
> > > > >
> > > > >
> > > > > Regards,
> > > > > Andrew
