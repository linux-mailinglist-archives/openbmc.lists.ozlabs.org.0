Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 814D882296
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 18:40:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462NmG4czfzDqQy
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2019 02:40:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="eXCb62bK"; 
 dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462Nlh1h3mzDqWJ
 for <openbmc@lists.ozlabs.org>; Tue,  6 Aug 2019 02:39:43 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id 19so39917372pfa.4
 for <openbmc@lists.ozlabs.org>; Mon, 05 Aug 2019 09:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ibqJtus34QJWpYqWkyLzi1pBXxj0MTGoY6Rf3GAXox8=;
 b=eXCb62bKbQ7wr4d2UyHESkXWcfgInyoMIR04oUkZrL4fVCx9M6YlVt3v/lq3H4cteV
 waUCSdd/rh8ThmZdlKN4FIy+im2TZt75jUmrnnBAbTb251rAmfeO84oDD2ygjIFvIzxl
 CfQybspFOtWDzT5eNNiO7Gcrj4eyzjm9qCJTBO4Ro94NtHdAPgxbXvQs8d39QhFUcmTv
 Zl8UpgU5WZ/ajZU8HJlQ+SCGFz5DRpXwYfzwaZmpRxuza5B3Eiw0iCRBa57p3W+Kc1Jy
 8qZbR2CtCIyUJNVmO0XITST1gjrGIOwiEWt+nA/vkHpJVNec6DXLcecXgAwreIPka43C
 uwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ibqJtus34QJWpYqWkyLzi1pBXxj0MTGoY6Rf3GAXox8=;
 b=A2TQ7+LC/TNSontxzLQOK9PqlQpsjH1kGQpEisfFELVHRC2heCFGL2P5p1ZDO/9UKZ
 1qZBlzT9Jyxs0+gioIMq/G4G/VkNzfxlAZ/tOiLHSuZ+EmoWJZh4KNRIqKHGz8wiVwvI
 eT+DMjCHCEK/mjIlSqUmbdacihrALlvfYP5JOsPnW6NUkDFxHwbwOJsYanLYL52tYZOb
 WOIvW0MOrOYlrULZWJxtTKOLMkNXIpmNlpFh80GpE8uARlWOFHoLiVJc8Quj+tuvb0wd
 GIp3plV/m97pVKaoZTHrsoMzGc3T0xTGTZskcACnZynJVpvsSwC6wAm1/S5V8SjdxVt3
 BKUQ==
X-Gm-Message-State: APjAAAUmvYzcO3ibCDMsHJ7ZdDW5JdovQEBZxbbavnePW+d6Q5a+cjnX
 4gdV0Gn3ait1EtYBMW6bVoeVfVb7fIR7QebhmxIQbg==
X-Google-Smtp-Source: APXvYqxlIlwGDX9tcvExvZlP5SRepv9Ryorfu3UgFQj2Y9lN96QTUwGS0UQxAOVMskP3cL/fnkv7lyNqXprNOog66GI=
X-Received: by 2002:a65:6288:: with SMTP id f8mr130877410pgv.292.1565023180392; 
 Mon, 05 Aug 2019 09:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <95784a9aed5d4f269fdf95684500d48e@lenovo.com>
 <CAO=notyC=6U8Afq8yOPxW0e933kXq3ubTVR5mc3WVGBhd4F08g@mail.gmail.com>
 <CAO=notwQv43Nbe9nUfzFDM1GYDqc6u6Oro83BGdcZ1rjePu-hg@mail.gmail.com>
In-Reply-To: <CAO=notwQv43Nbe9nUfzFDM1GYDqc6u6Oro83BGdcZ1rjePu-hg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 5 Aug 2019 09:39:29 -0700
Message-ID: <CAO=notyQpRiwYMsGY83DyvaM-a_c+fCpguFyFW4dqQz3_yWWjA@mail.gmail.com>
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

On Mon, Aug 5, 2019 at 9:32 AM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Aug 5, 2019 at 9:17 AM Patrick Venture <venture@google.com> wrote:
> >
> > On Mon, Aug 5, 2019 at 4:56 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:
> > >
> > > Hi Patrick,
> > >
> > >
> > >
> > > I have some questions about BIOS update via phosphor-ipmi-flash with L2A, please help to clarify. Thanks.
> > >
> > >
> > >
> >
> > Thanks for giving it a shot!  I don't have any systems using this for
> > BIOS update, so I'm curious where there may be issues lurking :)
> >
> >
> > > 1. How can I update the status (success or failure) after upgrade BIOS firmware? Currently, the update status only appear "running".
> > >
> >
> > I see, the update mechanism doesn't have a verification option.  A bit
> > of an oversight.  I'll have something up for review later today.  Then
> > it'll be something you configure similarly to the verifySystemd json
> > entry.
> >
> > > 2. It was failed when triggered "phosphor-ipmi-flash-bios-update.target" since the job-mode is null string. It can work well when I add string "replace" to job-mode. How can I config (json file or configure parameter) to support it?
> >
> > I'll take a look!  The parameter for job-mode, I thought, was
> > optional?  Since we don't specify it for other jobs (verification,
> > etc).  The string should be empty by default and then not added as a
> > null-string:
> >
> > https://github.com/openbmc/phosphor-ipmi-flash/blob/f0c71df2514927e933f6fc33d9669ab0663a0706/bmc/update_systemd.cpp#L49
>
> I see it is required!  Since I always configure with reboot, I never
> saw this failure. I'll default it to "replace"

First patch in the series generated from your email:

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-flash/+/24165

Next: json configuration option to control the job-mode.
Then merge verification and update objects, s.t. you can specify the
status path.

*** A later patchset can have the status be not a path, but a dbus
property or dbus path -- if someone wants to implement a new object
for this, it's somewhat trivial.

>
> >
> > I don't think I have a unit-test that verifies the parameters are sent
> > down properly, so I'll also add that today AND I'll add an optional
> > mode parameter to the json.
> >
> > Sending for review today.
> >
> > ...
> >
> > >
> > >
> > >
> > > Regards,
> > > Andrew
