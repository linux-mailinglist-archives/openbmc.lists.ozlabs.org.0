Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E43520AF0
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 04:02:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky1X35xkFz3byP
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 12:02:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=VlWNey+0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::c35;
 helo=mail-oo1-xc35.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=VlWNey+0; dkim-atps=neutral
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky1Wc2MdYz2xF8
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 12:02:18 +1000 (AEST)
Received: by mail-oo1-xc35.google.com with SMTP id
 q73-20020a4a334c000000b0035eb110dd0dso2878339ooq.10
 for <openbmc@lists.ozlabs.org>; Mon, 09 May 2022 19:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mitqiUZ6H8a93w/If7QQRiRYnEDsr+LESTNqWKDUEjM=;
 b=VlWNey+0LBjZjpTqaAi3dm0KX2hqnZYaIHU3LD6MUr/7+FAzlMyANNhXKcNS0aB3/L
 BlFdz604tW68mNtpoaG/U0FQFDlvuY9LPHOW1GjByuTIOgQzKi5ekMWiTJ38aZJj7Q7T
 9/neGHz6tUNjRD7Ub3uHKz7YYCZ3tnxaaRIvPxF0owlBbFuL0Z4cthTlg+oL65Vh2ole
 6LEzvXC29Yj/9m/PKRgCr9CfX0R5HKnITDaI3YhmZjqdCQZER/+FCzgd9yP3aRwTPE+D
 UNM6wyoiXo2Mbr88bKTHQuPHmEjBBXqByCVatlpfGiO3lm+HzINbnrELz5zqmWpaQMk3
 HLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mitqiUZ6H8a93w/If7QQRiRYnEDsr+LESTNqWKDUEjM=;
 b=qSyWDl28SPy/h1iR+51TANyr9QHvEsB6Fw9yBxxT3k7ty0ei4R/4IkpviA4lTLSJkJ
 sDrfdaPAdF4T0Y1O/OXdcK2+llXPfxep1fPpm/MfW07P74a1nFejbGcXnwGfj6/yJoUG
 2Qgbi9wuzz4giZkkkfNVPRFbhKmBuw8Zwz8flbSYkMcZut8ee2RfAMOll79md1DWVQIu
 T8Lc5NSmMAy5pYSTvne0aipT4noPdOQAa+wh7AfYngvN9TD16DlBAEP9wZzLbVSNaPpI
 vtarYrNl6yIHPuSX0919G/OZYZJMLz6JYnR6fA0TVWoGGaJMSaXjSWYbA/S+GkE9d+vE
 1PxA==
X-Gm-Message-State: AOAM531v2AgQQ9mpiFg9s+QHKtDUSEU3lSMpczfXht1oskdoUEjGUh/F
 9JqcmaE5GqRIRy5/H1ls1CTum5LBp6qhHVm/rc8Nvg==
X-Google-Smtp-Source: ABdhPJy9LrMTWVn4nmwlSWp2qw6b+B97g3fV6hpJrgz+WHg9AEtq2CsqklmUfymLPJuhLKk2Y15gZFwiTeQh96SNKTs=
X-Received: by 2002:a4a:96e3:0:b0:35e:6c87:9133 with SMTP id
 t32-20020a4a96e3000000b0035e6c879133mr7083801ooi.32.1652148135506; Mon, 09
 May 2022 19:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UG6o2_kFfor81+MmWW7pqxQ4bQu9FkVXaEbGhQ_JLQi-Q@mail.gmail.com>
 <CACWQX81w1ZzXx64r0UcxpZrNyWB7HudMzZpSttqEeNav98JC9g@mail.gmail.com>
In-Reply-To: <CACWQX81w1ZzXx64r0UcxpZrNyWB7HudMzZpSttqEeNav98JC9g@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 10 May 2022 10:03:09 +0800
Message-ID: <CAGm54UHRT7U_iP0FYdAcmmDtXVjLVREhGpyZvfhvpNbGqb5Rog@mail.gmail.com>
Subject: Re: [External] Re: Delayed match callback with sdbusplus asio APIs
To: Ed Tanous <ed@tanous.net>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Ed Tanous <edtanous@google.com>,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 10, 2022 at 4:53 AM Ed Tanous <ed@tanous.net> wrote:
>
> On Thu, Mar 10, 2022 at 9:17 PM Lei Yu <yulei.sh@bytedance.com> wrote:
> >
> > This mail is to describe an issue that the match signal's callback is
> > delayed if it's using sdbusplus asio APIs.
> >
> > # TL;DR
> > If the app is using sync DBus calls and using asio to register a match
> > callback, the callback may be delayed if it occurs when the sync DBus
> > call is ongoing.
> > Note the issue does not occur if it's not using asio APIs.
>
> You're doing blocking calls in an async daemon.  That's why your code
> has a bug in it.
>
> One such example is on line 89:
> auto reply = bus.call(method);
>
> That will block the main event reactor until it returns.  Take a look
> at something like bmcweb for how to do async method calls without
> blocking the main reactor.

So does it mean we can NOT use blocking DBus calls at all with async daemon?

-- 
BRs,
Lei YU
