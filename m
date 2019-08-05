Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 831B882273
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 18:33:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462NcC24ppzDqXW
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2019 02:33:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="G9+ITXNj"; 
 dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462NbX6TXMzDqW6
 for <openbmc@lists.ozlabs.org>; Tue,  6 Aug 2019 02:32:40 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id r7so39918375pfl.3
 for <openbmc@lists.ozlabs.org>; Mon, 05 Aug 2019 09:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wlNk7tho/A0/VmrjtRj2bdOrKO5VBufbytfCjUcTf5I=;
 b=G9+ITXNj74d3OBpWbtjHgPexlXduRATNx64uNLpOHNtbmecw0U7MjH+F3qZuvpiES2
 lSCYXnW39EpZfZcYMKf2SkjNzgZcI6G3VLqgn+3s2BZfEQaI7m0CYw3qzCsypv5K3wRH
 5ac9dhoYlCJ/CEjlg3trECt7Fhr0TYSMrhr+ITPgvhhyY+0hW3MkIxLKmmKC0F4ExVNZ
 qM0XSeGYtnyvSQrEvylnvgBxlu/4c4BMlnFwBNh3+mZMohXAFtnPGdaFtBesMLjYq595
 +iTcf5Yic6MMML+Jesf40vHyhSDmKQY4Xq2eAxc+0VXwaT9CyHMZ6iV4lvHFM/PQqksf
 WzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wlNk7tho/A0/VmrjtRj2bdOrKO5VBufbytfCjUcTf5I=;
 b=RMyjeEJ+QT8796Hc+1inIgFg7YXq9HOyoETDG4WvfM3CtxCI+ARe8vORttZFNkSIHS
 brbfHvC5eIOO74FmJ5lzFxyN16bM2RwuR0B9Q8b3rKfDt2a0YafXzOoaZygxKJHK2ucR
 gjMk+0Oz+YJPOFeIjOizuZ4O+KpilgMYpeqBdbWk4lZZGM+JiA7xSg6cIKx7vkrGucNx
 4g1jV1deThjP89nIfptde/eQL5BapOM/KLyhohWO6YQNX428zYhCbKMc051lrLumWnix
 cHHIYonYwXwAw5hy6XHqNFgaFLlUhNvXE5hIc47ypkZqpZ8nGYY/dm09Bgcvt5PA1I+T
 go/g==
X-Gm-Message-State: APjAAAVYeIoS5tz4jrolDPzH638gGrn/zsnEMSCY6YRtOLdug4PSL0on
 BVpXUgJgtCBJBT8idgsQDrVnNC5AZoZIBHZU4Tdg9g==
X-Google-Smtp-Source: APXvYqwCmXJoPA9c9ZoydvLvlJ81ux/rX7Vim8rby/6nAiTSDDbqpRDCPPfZW2iAcbh4gaGiW3roy3JRIbPIom2nWp4=
X-Received: by 2002:a65:6288:: with SMTP id f8mr130852505pgv.292.1565022755775; 
 Mon, 05 Aug 2019 09:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <95784a9aed5d4f269fdf95684500d48e@lenovo.com>
 <CAO=notyC=6U8Afq8yOPxW0e933kXq3ubTVR5mc3WVGBhd4F08g@mail.gmail.com>
In-Reply-To: <CAO=notyC=6U8Afq8yOPxW0e933kXq3ubTVR5mc3WVGBhd4F08g@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 5 Aug 2019 09:32:24 -0700
Message-ID: <CAO=notwQv43Nbe9nUfzFDM1GYDqc6u6Oro83BGdcZ1rjePu-hg@mail.gmail.com>
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

On Mon, Aug 5, 2019 at 9:17 AM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Aug 5, 2019 at 4:56 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:
> >
> > Hi Patrick,
> >
> >
> >
> > I have some questions about BIOS update via phosphor-ipmi-flash with L2A, please help to clarify. Thanks.
> >
> >
> >
>
> Thanks for giving it a shot!  I don't have any systems using this for
> BIOS update, so I'm curious where there may be issues lurking :)
>
>
> > 1. How can I update the status (success or failure) after upgrade BIOS firmware? Currently, the update status only appear "running".
> >
>
> I see, the update mechanism doesn't have a verification option.  A bit
> of an oversight.  I'll have something up for review later today.  Then
> it'll be something you configure similarly to the verifySystemd json
> entry.
>
> > 2. It was failed when triggered "phosphor-ipmi-flash-bios-update.target" since the job-mode is null string. It can work well when I add string "replace" to job-mode. How can I config (json file or configure parameter) to support it?
>
> I'll take a look!  The parameter for job-mode, I thought, was
> optional?  Since we don't specify it for other jobs (verification,
> etc).  The string should be empty by default and then not added as a
> null-string:
>
> https://github.com/openbmc/phosphor-ipmi-flash/blob/f0c71df2514927e933f6fc33d9669ab0663a0706/bmc/update_systemd.cpp#L49

I see it is required!  Since I always configure with reboot, I never
saw this failure. I'll default it to "replace"

>
> I don't think I have a unit-test that verifies the parameters are sent
> down properly, so I'll also add that today AND I'll add an optional
> mode parameter to the json.
>
> Sending for review today.
>
> ...
>
> >
> >
> >
> > Regards,
> > Andrew
