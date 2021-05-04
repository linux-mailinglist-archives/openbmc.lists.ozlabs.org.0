Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8853A373122
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 22:01:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZW2N3HTSz309X
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 06:01:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=IrBLNr32;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=IrBLNr32; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZW261q1yz2yZM
 for <openbmc@lists.ozlabs.org>; Wed,  5 May 2021 06:01:33 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id y2so13784759ybq.13
 for <openbmc@lists.ozlabs.org>; Tue, 04 May 2021 13:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gNiBjw3C5NDFHapqqaBodgcTtZU94LHBL5+lGIJqBYc=;
 b=IrBLNr32+6PPWK6t0UkfwXTxtG89o/Ad+BdhZxwvhtfRGJq/KKZXHZyU852yC65YTK
 1LGu7h5/WrsA49IuDsIBZVnqJsQKI6ki8TD7mnGN6We0ZP2zstuXgXWIqwV9TI1+rLaS
 CUXVBEsunwcbg3659l4ll/KIRnV1uZadXV9VYJxAgaM8Wnhsevv8fOkQFu0JhhRBZ2VE
 AE3P8Dt30hWl2Pc2zgqoDZZE43OgPD8gRD5i4oaysOdZDc5iN/+wbb1LYXIZdJk5TS23
 tT6IudgajsMs+TQqcpMQVSTHm/Yk/3tVmjmuo1e8Z8p5LAd39Y1BJEi1zd+IxrrP91lv
 hseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gNiBjw3C5NDFHapqqaBodgcTtZU94LHBL5+lGIJqBYc=;
 b=YhlvB95T3CsEhX8i9e/RJoPqnFK/fgwDw9GbeJf/+2IEFDnq+6gXhRnRHKh+X/t8yB
 f4yMK34A7jRKeeGWUSbAxpGTO0qmzLehO1eIVFnBWWLKovMUFpaTxQhXtBwBzi3ctG/k
 7+qwoiUV3IFWB5s8l4DP6510Fb8dV0edAo+RTxTcSYXrCWP+Evlv9ErdBLiMaaIFVfb2
 yZEdDVNyR5+TqSXCF6onMthy4TjamkjTGYNZ6Y620FJ2F69WJK98eupjIKYqbYHbvzgo
 9HeqhBbybmuZlW2ozvHypCdUREUrL+hMvxtjIX0/HPkd0kpQEI7GOuu5nkv4MwmF/jms
 J/XQ==
X-Gm-Message-State: AOAM532gy9/wXwxhbqjeWDGLdJ8PZORFRU/POg5laE5QsKBtjD6xjK57
 cbMEkglJW74LYJ9ciHofoex4SlC89GsOjW6Fn/VJiA==
X-Google-Smtp-Source: ABdhPJwy64MaSE1DIw5RQ0AbGeo4Pz0wQhoQZSxqM9S0b9+ZDPcl085m3AxmBAb2l5Pvdufx/Ru3oE2WQ1JhMhlC9BQ=
X-Received: by 2002:a25:c8c2:: with SMTP id
 y185mr18158080ybf.452.1620158489560; 
 Tue, 04 May 2021 13:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <11e4ee9d-d19c-dd79-aedd-8104a7ad081b@os.amperecomputing.com>
In-Reply-To: <11e4ee9d-d19c-dd79-aedd-8104a7ad081b@os.amperecomputing.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 4 May 2021 13:01:18 -0700
Message-ID: <CACWQX81-6+PTTzFe6o5d6wvF99ELn-KTL8Or53fGXkKkKaUUEA@mail.gmail.com>
Subject: Re: How to add Redfish EventLog using commands
To: Thang Nguyen <thang@os.amperecomputing.com>
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

On Tue, May 4, 2021 at 2:54 AM Thang Nguyen
<thang@os.amperecomputing.com> wrote:
>
> Hi,
>
> I am looking for the mechanism to add events to Redfish EventLog. I
> checked on the Redfish EventService design
> (https://github.com/openbmc/docs/blob/master/designs/redfish-eventservice.md)
> and it seems only has C++ functional calls (sd_journal_send(),
> phosphor::logging::log(), ...) but not user commands that can be used in
> the shell script.

This kind of logging and handling would imply that your script has
outlived what should realistically be put in a bash script, and should
be rewritten in something compiled (probably c++).  Redfish logs
require string and variable manipulation that is generally not well
defined in bash scripts.

>
> There are many use cases for adding EventLogs:
>
> 1. Use phosphor-gpio-monitor to monitor signals like power/reset,
> button, ... and log the event

Considering that Redfish event log is for high level things, I suspect
this isn't a great fit.  power/reset would be handled within whatever
state system you're using (phosphor-state-manager or
x86-power-control), right?

>
> 2. Use phosphor-gpio-monitor to check if the Host boot fail, control the
> mux to switch to other boot devices, along with logging events.

This seems like something that shouldn't be done from bash;

>
> 3. Check device presences (from /sys interfaces) and log events, ...

Redfish itself should have no knowledge of specific linux interfaces,
or linux at all.  Dependent on the actual /sys device you're looking
for, there's probably already daemons that expose those types of
events.  Without going into more specifics, I'm not sure this is
advised.

>
>
> I checked on existing repositories like phosphor-sel-logger,
> dbus-sensors, ... and they only support events for their features (like
> power dc on/off, sensor threshold, inventory data added/removed, ...)
> and the Redfish events added in C++.

Which is I think the right design choice.

>
> I can have a C++ codes to just support options to add different EventLog
> data with parameters. But it can't be inside meta- folder so need a
> repository for it.

For what it's worth, the bash scripts shouldn't be going in the meta
repo either.

> I think it's not worth for creating a new repo just
> to support an application with dozen like of codes to just add EventLog.

Disagree about whether it's worth it.  WIth that said, depending on
what you're trying to do, there's likely already a repo for the
feature you're trying to implement.

>
> Do you have any idea of any existing repo support adding Redfish
> EventLog from script/command line or any repo that we can extend to
> support such command?
>
>
> Best Regards,
>
> Thang Q. Nguyen -
>
