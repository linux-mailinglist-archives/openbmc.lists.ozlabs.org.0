Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 051B238CC14
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 19:25:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmtmV6Y4yz3bTv
	for <lists+openbmc@lfdr.de>; Sat, 22 May 2021 03:25:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=c+3Nhbdm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::333;
 helo=mail-wm1-x333.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=c+3Nhbdm; dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmtmD1kvcz305x
 for <openbmc@lists.ozlabs.org>; Sat, 22 May 2021 03:25:31 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id
 f20-20020a05600c4e94b0290181f6edda88so918547wmq.2
 for <openbmc@lists.ozlabs.org>; Fri, 21 May 2021 10:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OFeCFtjwraOWxTdQm6xtJ9XKY3kWmjNgroqXVkk0C64=;
 b=c+3NhbdmxzrWYxWWWNMET74ACQLygpj/g3sq3d18GlnJ0OzBlMj4vDJsBYwR4/TzWa
 kQmitIIlWdT+GYfySj9Qlc6ODP+qw6KduayRNwU5vTU21IarN2dZCH1OmjeiakK1/acj
 xVPoCESLrkHZNPrq3cW4dPS8xK045cQdiyiIAWoWCaLAzJpKWK6/5u50o7Yfur0S2w6A
 oiZcXOYXxnGAkj9W96ddsIyM4YetdM5LEXopgBuTvh/yE1seJzOv8WZsJSMaHUwwokdW
 06Wa1Hr2yzULMJHsGDmQr33K7YV/wqh2Pw/MVLLHOYRMy1EqZxId7JloYgY0dFKxyW07
 xLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OFeCFtjwraOWxTdQm6xtJ9XKY3kWmjNgroqXVkk0C64=;
 b=guueYZx+3K+vUSdvNOhfSAfpYyCp4HOusG0hVyZqNWmsqd49qwN/u4W/cpMARVYYRT
 uYlv19e/M0QqQHC90+vlKgN1Ig+Hbef8WOBptbLFLnoUY6T3co2Tm9hScausBkZ4XH6Q
 lYiV5Yl+YoUQHiEyEdMDFeaf1e40IR86Y9b1T4TBXLnWFXcCTqjF9bkIlXw1oYrtqFzE
 DO1CNDfLjO2goZyg52MjE7t1LFa3nQSUzkN3TqFpieBTj5xGXMs5PPSCF5CnlEhefgnk
 sOVmnZFGY6/2XLvntAl59zWxMx/qjs07G1xEViJQtgxbXS8tCmSY+eVhXJPCceqBzMoz
 SRxg==
X-Gm-Message-State: AOAM532YMDFzWKr70rnCdSEM4n/fMh9NtAkytcTDXWXQGDbIwB/laxlp
 9pgdeEoQQNY4ntpL1mfPOhuYXwNHL8y0bhzsBrMcZg==
X-Google-Smtp-Source: ABdhPJx7pEGQCqj5H6bvp3Hm9Ud3JgTJzfKu7iLtDCFJylcJQLWGpfpiKlvpuFrBf7Wdiv7zXVZyvuV0FXZX7gM7W20=
X-Received: by 2002:a1c:7313:: with SMTP id d19mr9802096wmb.14.1621617929076; 
 Fri, 21 May 2021 10:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAOLfGj5orNO2U3zdO6LuBGY05mXFewofqRiOUXyA=ks74LzMhg@mail.gmail.com>
 <20210521061023.4zy5s7fzycz5lppx@gmail.com>
 <CAOLfGj76F6WRRU9kS2eQ=FhM=2GAM6NAiiPiRjucVO1Nupm1ag@mail.gmail.com>
In-Reply-To: <CAOLfGj76F6WRRU9kS2eQ=FhM=2GAM6NAiiPiRjucVO1Nupm1ag@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Fri, 21 May 2021 10:25:17 -0700
Message-ID: <CAH2-KxBq9Ghf1-7DgQ1RS5FD-1XtNu1U-vuna5qmmMkPU+vJCg@mail.gmail.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
To: Nan Zhou <nanzhou@google.com>
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
Cc: Spencer Ku <spencer.ku@quanta.corp-partner.google.com>,
 Litzung Chen <litzung.chen@quanta.corp-partner.google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, a.senichev@yadro.com,
 Richard Hanley <rhanley@google.com>, Artem Senichev <artemsen@gmail.com>,
 a.filippov@yadro.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, May 21, 2021 at 8:11 AM Nan Zhou <nanzhou@google.com> wrote:
>
> On Thu, May 20, 2021 at 04:29:09PM -0700, Nan Zhou wrote:
>>
>> > Hi all,
>> >
>> > In the previous thread (
>> > https://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html), we
>> > (engineers from Google and Quanta) discussed our attempt to share host
>> > serial logs via Redfish, which includes polling logs via LogService and
>> > streaming log bytes via EventService (e.g. SSE). We went with the event log
>> > architecture
>> > <https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md>
>> > and did the implementation.
>> >
>> > We still want to reuse the phosphor-hostlogger and do some modification. We
>> > believe it is better to try to reuse existing codes if possible and improve
>> > them rather than creating new things that have similar functionalities (in
>> > our case, it is a daemon that could collect logs and persist them).
>> I agree, reusing code is a right choice, but only when it is really possible.
>> For now it looks like you want to remove most of the Hostlogger features to
>> transform it from buffer-like to stream-like service.
>
> Hostlogger will still consume bytes from obmc-console-server and persist logs in files. If the log itself has EOL, it will be splitted in the file as well.
> I thought that is all things we want in the Hostlogger.
>
>> > We want to do the following modification in phosphor-hostlogger (from the
>> > input and output point of view, just very few things will be changed)
>> >
>> > 1. One limitation of phosphor-hostlogger is that it will lose data in the
>> > memory (the ring buffer maintained by hostlogger) when BMC gets force
>> > restarted;
>> When BMC goes to reboot it stops all services, at that moment hostlogger gets
>> a signal and flushes all gathered logs to a file.
>
> Yes, I understand hostlogger registers a sigterm handler. But what if BMC lost its power before sigterm gets sent? That's what I mean by "force restart".
>
> > we propose to remove the ring buffer and write to the log file
> > as soon as some characters are received.
>
>> I am not sure it is a good idea.
>> The host can generate a lot of logs, but we have very limited free space. In
>> addition, such heavy traffic will lead to a quick breakdown of the flash (most
>> available products are guaranteed to withstand around 100,000 P/E cycles only).
>
> I would like to get input from Ed for this point. +Ed Tanous.

Gave my input on the previous email before I read this one.  Lets
follow this up on that thread.

>
>> > This implicitly removes the needs
>> > of the ring buffer, and the persistence triggering (host reboot, sigterm,
>> > etc) in hostlogger. We believe this keeps the same functionality but saves
>> > hundreds of lines of codes in phosphor-hostlogger.
>> You are suggesting to delete the buffer, DBus watcher, log rotate. How are you
>> going to keep the same functionality if you remove everything related to it?
>
> Log rotation is kept. Ring buffer and DBus watcher are great in the original design but become unnecessary if we persist logs immediately. Do we miss
> anything that the previous hostlogger provides (transfer bytes from the unix socket to EOL-separated compressed logs)? I believe in this proposal we have
> less data loss, simpler codes, and make it more performant for Redfish integration.
>
> On Thu, May 20, 2021 at 11:10 PM Artem Senichev <artemsen@gmail.com> wrote:
>>
>> On Thu, May 20, 2021 at 04:29:09PM -0700, Nan Zhou wrote:
>> > Hi all,
>> >
>> > In the previous thread (
>> > https://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html), we
>> > (engineers from Google and Quanta) discussed our attempt to share host
>> > serial logs via Redfish, which includes polling logs via LogService and
>> > streaming log bytes via EventService (e.g. SSE). We went with the event log
>> > architecture
>> > <https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md>
>> > and did the implementation.
>> >
>> > We still want to reuse the phosphor-hostlogger and do some modification. We
>> > believe it is better to try to reuse existing codes if possible and improve
>> > them rather than creating new things that have similar functionalities (in
>> > our case, it is a daemon that could collect logs and persist them).
>>
>> I agree, reusing code is a right choice, but only when it is really possible.
>> For now it looks like you want to remove most of the Hostlogger features to
>> transform it from buffer-like to stream-like service.
>>
>> > We want to do the following modification in phosphor-hostlogger (from the
>> > input and output point of view, just very few things will be changed)
>> >
>> > 1. One limitation of phosphor-hostlogger is that it will lose data in the
>> > memory (the ring buffer maintained by hostlogger) when BMC gets force
>> > restarted;
>>
>> When BMC goes to reboot it stops all services, at that moment hostlogger gets
>> a signal and flushes all gathered logs to a file.
>>
>> > we propose to remove the ring buffer and write to the log file
>> > as soon as some characters are received.
>>
>> I am not sure it is a good idea.
>> The host can generate a lot of logs, but we have very limited free space. In
>> addition, such heavy traffic will lead to a quick breakdown of the flash (most
>> available products are guaranteed to withstand around 100,000 P/E cycles only).
>>
>> > This implicitly removes the needs
>> > of the ring buffer, and the persistence triggering (host reboot, sigterm,
>> > etc) in hostlogger. We believe this keeps the same functionality but saves
>> > hundreds of lines of codes in phosphor-hostlogger.
>>
>> You are suggesting to delete the buffer, DBus watcher, log rotate. How are you
>> going to keep the same functionality if you remove everything related to it?
>>
>> > 2. We propose not to compress the latest log file. This saves us the
>> > overhead of doing decompression when BMCWeb just needs to retrieve the most
>> > recent logs. There are still going to be log rotations in the file level.
>> > Files other than the latest log file are still going to be compressed. We
>> > can modify existing codes to achieve this or use the linux logrotate
>> > directly.
>> >
>> > Furthermore, we will add host serial logs into BMCWeb, both LogService and
>> > EventService. In LogService, we will teach BMCWeb how to read the latest
>> > log file that is not compressed and the other compressed old logs, and how
>> > to assemble LogEntries out of raw serial logs. We will discuss EventService
>> > in future threads but the very initial idea is to setup inotify on log
>> > files and SSE to stream out new bytes to clients (like what the existing
>> > event logging is doing).
>> >
>> > As we said above, for phosphor-hostlogger, the input is still the
>> > obmc-server unix socket, and the output are still persisted log files. But
>> > the functionality will get improved (less data loss), code gets simplified
>> > (no ring buffer and persistence triggering), and it will become easier and
>> > more performant to get BMCWeb hooked up for log streaming via Redfish.
>> >
>> > Please let us know what you think. We appreciate any feedback. Thank you
>> > very much!
>> >
>> > Sincerely,
>> > Nan
>>
>> --
>> Regards,
>> Artem Senichev
>> Software Engineer, YADRO.
