Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4220482185
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 18:18:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462NGv0dtWzDqVB
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2019 02:18:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="P96wCpma"; 
 dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462NGF6NZRzDqTk
 for <openbmc@lists.ozlabs.org>; Tue,  6 Aug 2019 02:17:39 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id b3so36693679plr.4
 for <openbmc@lists.ozlabs.org>; Mon, 05 Aug 2019 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3oQbBeeXcqdvN5rdqpIoqgAaIOFvzmWs8Z5CxXBKQn8=;
 b=P96wCpmap5nzv9uxg05HGVeXNk6gJ7J2TdVHf90dSj5yCgyDdtVceB33jhPAw+tezu
 /NDs7aueHpCqtd/kGMgTpoTti/eIhKvgwn4YLok4cOIwz8dhcz54ojyYIefY8GD03Bxv
 RTiYivi6zja3SqeM4m7Ks9WIT+o6QOtg3HRrli66ZIuZPJVbmvrngcKPO9j7SgXKEbCe
 ValzO2xZVGZrdkA3E1PeY+ts2K9ltQOIa/u6QPi34CrW1Is7HPmdCjcPsE8Ji3Plcxr4
 ohGwUpM+uGqJNS4tD8vxI9ckow0OW9jiPfeIHjPtaPHw38PvffPO8b6Cwhq3lC4oMXCD
 0cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3oQbBeeXcqdvN5rdqpIoqgAaIOFvzmWs8Z5CxXBKQn8=;
 b=gjC29PdIogNWS+278JxTn5X/D0/fe8/34udLHEHTnf13FN8fK3xTSArTDi8LGVGDel
 SvaiCq2XV5oCd56dX5Kct1JHecdeAyfbiDVTgWEd7PHS+DseOfUovZPwLZ6XzHhNivFK
 f9nlFxBfFSZIG4l+SFI+/kHfrXgTgoxGfehEdtrwaA1hc9LVDFpMJby6+JIgposnAc83
 ZGcHjkpoqp75znvZNgKvKlgPznJlWxDiynGsQTDvqdt1AwRwScOj26OFzdDgVvS6jFe5
 fQ0lXvMUGJPOvOtSgglLYRG8/aQs0xypRURTjHb3m7XAEY7c082qweWgQBRy9I9IrGUC
 rU9g==
X-Gm-Message-State: APjAAAV5IGHRiAeRt7ElSDmVRfQFW4Wy26u/ACewoa9/YLUlQSn0CXlM
 bU6xBRW5CVfgRSNEOfXSAocwVo/1klLjIRYj04BgXA==
X-Google-Smtp-Source: APXvYqwAuvDFMoDipv1QavxcKJAGoDSqA45Z3N4oobHZEPrCbNQgka87rLpJ4241TocJT4Oad2Sermk6/xPTrESK+n8=
X-Received: by 2002:a17:902:9307:: with SMTP id
 bc7mr140277180plb.183.1565021855058; 
 Mon, 05 Aug 2019 09:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <95784a9aed5d4f269fdf95684500d48e@lenovo.com>
In-Reply-To: <95784a9aed5d4f269fdf95684500d48e@lenovo.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 5 Aug 2019 09:17:23 -0700
Message-ID: <CAO=notyC=6U8Afq8yOPxW0e933kXq3ubTVR5mc3WVGBhd4F08g@mail.gmail.com>
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

On Mon, Aug 5, 2019 at 4:56 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:
>
> Hi Patrick,
>
>
>
> I have some questions about BIOS update via phosphor-ipmi-flash with L2A, please help to clarify. Thanks.
>
>
>

Thanks for giving it a shot!  I don't have any systems using this for
BIOS update, so I'm curious where there may be issues lurking :)


> 1. How can I update the status (success or failure) after upgrade BIOS firmware? Currently, the update status only appear "running".
>

I see, the update mechanism doesn't have a verification option.  A bit
of an oversight.  I'll have something up for review later today.  Then
it'll be something you configure similarly to the verifySystemd json
entry.

> 2. It was failed when triggered "phosphor-ipmi-flash-bios-update.target" since the job-mode is null string. It can work well when I add string "replace" to job-mode. How can I config (json file or configure parameter) to support it?

I'll take a look!  The parameter for job-mode, I thought, was
optional?  Since we don't specify it for other jobs (verification,
etc).  The string should be empty by default and then not added as a
null-string:

https://github.com/openbmc/phosphor-ipmi-flash/blob/f0c71df2514927e933f6fc33d9669ab0663a0706/bmc/update_systemd.cpp#L49

I don't think I have a unit-test that verifies the parameters are sent
down properly, so I'll also add that today AND I'll add an optional
mode parameter to the json.

Sending for review today.

...

>
>
>
> Regards,
> Andrew
