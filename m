Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDAC16F5C9
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 03:49:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S0d35dxXzDqLt
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 13:49:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KBnktgIl; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S0ZH1bsczDqLN
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 13:47:03 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id s23so749660lfs.10
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 18:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=on4w0ZZi1caXEGwEhPQ/M/53wEVpJn1rByFdvBImxm8=;
 b=KBnktgIlhFYCbmuRFX7IwPQindduUuvH0z4SCaAMQLDTSj3lw+VlMMzQCfbDBgpfyt
 IZc/Hn4twxgVCz6fA4O2My/uS20ndjoMBtQJumS0ZZMoE9Dvziii8ImGE9OWrpH8upE9
 AVwkC1QVas5fcAglBFi3Y0BPexQtdVSc41COux7weGgECK/YaYAAYib9SUa6CA6Z1IuU
 xC+/fc3jUJjh+r/vNRTTzY0m/UnF5+6QK6m6uZRZlxA8BrAYvr9a2SNNyrtd78x4a63C
 +1Mp6Bpb3pAXiSXdBdFuzUtpCdIpOcbSYx3J9A33hiO7w+mao4by1uhfUWhHoKlT7vJQ
 CXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=on4w0ZZi1caXEGwEhPQ/M/53wEVpJn1rByFdvBImxm8=;
 b=c4gfOWj5vi+xtBUVr4Ggp82l42FY1g1FViv76JNT7N9LR29O8RfoZa9flg5+IjN09h
 hAN5Xpa3vMc/VJonnbSij8f8m/TvI4j0vHfnKNNw4Y5EdzmO2//N6VSGB/Z1wWcuH2YV
 4H2rozsIqoGE+w1HfXuDgUtnHmWckmLSeABEm0POMn14aFV+mKvvfI4EHbk8LNVhx+IH
 /c7WtK4uXBd66uu+0KsvAy5uQi8+smf7oB7GSuyY0iKzLCsdzyKTLEVLP7IKPmUIseIT
 CH3oWUw60OjVHqGFdz2X+xQW9H05N46WpeN/M6TE+U7ooaitcuzfhGPXl9FenSjxstkb
 YZ+A==
X-Gm-Message-State: APjAAAW3gLx9nIdmbQqcL7snCaYkTQAzcJBhrUX8C1zzHgxIFI/YmMV8
 A1Rv+i4HuIU2A/U82Dq0aJt7GzHAguT8BSVDcR8=
X-Google-Smtp-Source: APXvYqyPaMjaeAcNzldiqX0W9W2nLtdeo7g0z2TSWd5AjOdXV24MsgAxMzPJjGuQS1voSWsH+KL+O07RxDwBYpepH4U=
X-Received: by 2002:a19:2396:: with SMTP id j144mr1029637lfj.113.1582685218242; 
 Tue, 25 Feb 2020 18:46:58 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtkPQWxhC3XdR-7kE8Kj4HC10gPk8=v7gPDVoZa_L7x-6w@mail.gmail.com>
 <20200218203934.GB2219@patrickw3-mbp.lan.stwcx.xyz>
 <CAARXrtkwsy3t=bz7wHa=oEG-KwE7dBJ0Upkft-RN9XNgiFdSHA@mail.gmail.com>
 <20200220163830.GD41328@patrickw3-mbp.dhcp.thefacebook.com>
 <CAARXrt=7=X53tQ33C9+wBkUV7tZXgVZCtf8un7y8wpRxVdVufw@mail.gmail.com>
 <20200224203215.GE67957@patrickw3-mbp.dhcp.thefacebook.com>
 <CAARXrtnykCRL2EXekwb62aBie6YRQuSLBftZAg2AzheKA0vGug@mail.gmail.com>
 <20200225155947.GL67957@patrickw3-mbp.dhcp.thefacebook.com>
In-Reply-To: <20200225155947.GL67957@patrickw3-mbp.dhcp.thefacebook.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 26 Feb 2020 10:46:46 +0800
Message-ID: <CAARXrtmqL5rg=n02b0nWagFOMsdRMp0BpN4nJTXiqEE5sBVDZg@mail.gmail.com>
Subject: Re: [sdbusplus] To generate client header (was: Re: To generate a
 common header for public information of interfaces)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Feb 25, 2020 at 11:59 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Tue, Feb 25, 2020 at 04:22:40PM +0800, Lei YU wrote:
> > > Examples of poor code are not a use case.  Both of these examples are
> > > trivially converted to convert<enum>ToString APIs.  We should do that
> > > rather than facilitate unmaintainable code.
> >
> > My concern to use "convertXXX" APIs is that it requires the client
> > code to link the server code, where logically all it needs is the enum
> > string.
>
> I'm not sure if you're referring to an API level issue or ABI level
> issue.  Almost anything at an API level can be dealt with by headers (as
> you're proposing to generate) and light-weight indirects.  Being worried
> about linking at an ABI level seems like a premature optimization (we
> only make libphosphor-dbus.so today anyhow).

I am referring to the code structure. Clean code should include the
headers it really needs, and should not include unnecessary headers.
If clientA's code needs to talk to serverB, it ideally includes
clientB.hpp instead of serverB.hpp.
So the proposal here is to make sdbusplus generate the client header
to be used by client code.

>
> > This is exactly why I propose to provide enum strings in by the client header.
> > Currently, client code (poorly) uses "hard-coded" strings directly. If
> > we provide the constexpr strings in the client header, the client code
> > could be "refacted" to use the definitions from the client header.
> > Then sdbusplus is freely to update the string format without breaking
> > client code.
>
> Why not just fix them to use enums properly?  There is zero reason for
> applications to be dealing in string manipulation for these.
>

It still does not resolve the case when user *does* want to use a enum
string as constexpr.
If sdbusplus could provide constexpr function to convert enum to
string, it will be fine.
Do you think if that's possible?

> > > So maybe we call it "client" rather than "common"?  Common implies that
> > > there are header files that are okay to import under any case and I
> > > don't see that to be the case with what you're proposing we define.
> > >
> >
> > Yeah, agreed.
>
> :thumbsup:
>
> > > Again, I don't have any issue with the interface names.  I do take issue
> > > with the enumeration strings because they shouldn't ever be used outside
> > > of sdbusplus (or a similar dbus binding).
> > >
> >
> > For the interface names, the patch is updated at:
> > https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/29404
> > Let's treat it as a start point of client code.
>
> I'll take a look soon.
>
> --
> Patrick Williams
