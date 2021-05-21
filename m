Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3319A38BF1B
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 08:10:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmbnf1Vtbz309g
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 16:10:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lvlpGapF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=artemsen@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lvlpGapF; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmbnL59tYz2xZG
 for <openbmc@lists.ozlabs.org>; Fri, 21 May 2021 16:10:29 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id a2so27962921lfc.9
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 23:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=slMA6Oyr7+McPigE40pOXSlt5zvB2pEoLgl0c5ab1RA=;
 b=lvlpGapFGgCwVixoDugemDzj0SRdTYNJa3ESg94gFdl/gI7crSv+3/C1XmWlStqAho
 pehRCWWFFnFcIRvb/6xWgRtYr8SChLRYhQyBEvelnkSIX4D0zMjRD7afGns6Lyu3okIb
 4SYJ9FksWSYxVdWCJahYZd1Kumn6I+YzEQEuRWN9pV37EEGnK99C8U/ebxnQ0/NV8boH
 UtuGL8W/EUHHClgKr5cICD5cY/eNfWYSRJbHonTklz7JVpSSBdti4B6wispcF0M8Tab7
 sDMyJ28Ut5uZQATASlyoXo7WfeaM/lQ2oPUTVHDBTbYr2QeVRNVlr1JoZrboie7RVpi7
 iCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=slMA6Oyr7+McPigE40pOXSlt5zvB2pEoLgl0c5ab1RA=;
 b=Xs0oT7ByfDmzBqvsAJKzgAGjGL++nVOLsemt77sdHx9lVqAvNBqarkZMoTXNW1ELjF
 zzIzRtnUW1XVijBnNGEj/ED7zE7doIFvSUWZNJN+XFehP7xBB33Um2+PC7r/gbmuHB17
 b52EnL42e/tH06ksV2MYNIJ3GW7Wiy3TdgqdMbtQBMRY60ZoIUjDMXunKYM8Nlr0WwaW
 x5k6W4LwWYPu5MhsDDGhcE+datPxbRB+suZj/OvO3lE7H6CKQrFTIVoP5lRQDVTkhp9+
 yun7YZ3XCWFO8oMesBi4qn70n/MnP8Tt/IygvERdIN9mfw2bFCv6gpOIR1oCpxSy5GGT
 zkbA==
X-Gm-Message-State: AOAM532NQm8HcA+6xHtaanmfi6um80JPxdWweFyFem3OAmyhOnoylAce
 1CyF9Kh4Rcjj9GxTCfQ8rNU=
X-Google-Smtp-Source: ABdhPJzzkeQpA1ahbi+xA9/zNSfEnSJYonIQa3st1uHRyKWWP7XTPs7Gc0/Hqjw+rC1ORODEQVXSXw==
X-Received: by 2002:ac2:592a:: with SMTP id v10mr1052924lfi.400.1621577426247; 
 Thu, 20 May 2021 23:10:26 -0700 (PDT)
Received: from gmail.com ([109.252.116.140])
 by smtp.gmail.com with ESMTPSA id m16sm219469lfj.98.2021.05.20.23.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 23:10:25 -0700 (PDT)
Date: Fri, 21 May 2021 09:10:23 +0300
From: Artem Senichev <artemsen@gmail.com>
To: Nan Zhou <nanzhou@google.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
Message-ID: <20210521061023.4zy5s7fzycz5lppx@gmail.com>
References: <CAOLfGj5orNO2U3zdO6LuBGY05mXFewofqRiOUXyA=ks74LzMhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOLfGj5orNO2U3zdO6LuBGY05mXFewofqRiOUXyA=ks74LzMhg@mail.gmail.com>
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
 openbmc@lists.ozlabs.org, a.amelkin@yadro.com, Ed Tanous <edtanous@google.com>,
 Richard Hanley <rhanley@google.com>, a.senichev@yadro.com,
 a.filippov@yadro.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 04:29:09PM -0700, Nan Zhou wrote:
> Hi all,
> 
> In the previous thread (
> https://lists.ozlabs.org/pipermail/openbmc/2021-March/025234.html), we
> (engineers from Google and Quanta) discussed our attempt to share host
> serial logs via Redfish, which includes polling logs via LogService and
> streaming log bytes via EventService (e.g. SSE). We went with the event log
> architecture
> <https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md>
> and did the implementation.
> 
> We still want to reuse the phosphor-hostlogger and do some modification. We
> believe it is better to try to reuse existing codes if possible and improve
> them rather than creating new things that have similar functionalities (in
> our case, it is a daemon that could collect logs and persist them).

I agree, reusing code is a right choice, but only when it is really possible.
For now it looks like you want to remove most of the Hostlogger features to
transform it from buffer-like to stream-like service.

> We want to do the following modification in phosphor-hostlogger (from the
> input and output point of view, just very few things will be changed)
> 
> 1. One limitation of phosphor-hostlogger is that it will lose data in the
> memory (the ring buffer maintained by hostlogger) when BMC gets force
> restarted;

When BMC goes to reboot it stops all services, at that moment hostlogger gets
a signal and flushes all gathered logs to a file.

> we propose to remove the ring buffer and write to the log file
> as soon as some characters are received.

I am not sure it is a good idea.
The host can generate a lot of logs, but we have very limited free space. In
addition, such heavy traffic will lead to a quick breakdown of the flash (most
available products are guaranteed to withstand around 100,000 P/E cycles only).

> This implicitly removes the needs
> of the ring buffer, and the persistence triggering (host reboot, sigterm,
> etc) in hostlogger. We believe this keeps the same functionality but saves
> hundreds of lines of codes in phosphor-hostlogger.

You are suggesting to delete the buffer, DBus watcher, log rotate. How are you
going to keep the same functionality if you remove everything related to it?

> 2. We propose not to compress the latest log file. This saves us the
> overhead of doing decompression when BMCWeb just needs to retrieve the most
> recent logs. There are still going to be log rotations in the file level.
> Files other than the latest log file are still going to be compressed. We
> can modify existing codes to achieve this or use the linux logrotate
> directly.
> 
> Furthermore, we will add host serial logs into BMCWeb, both LogService and
> EventService. In LogService, we will teach BMCWeb how to read the latest
> log file that is not compressed and the other compressed old logs, and how
> to assemble LogEntries out of raw serial logs. We will discuss EventService
> in future threads but the very initial idea is to setup inotify on log
> files and SSE to stream out new bytes to clients (like what the existing
> event logging is doing).
> 
> As we said above, for phosphor-hostlogger, the input is still the
> obmc-server unix socket, and the output are still persisted log files. But
> the functionality will get improved (less data loss), code gets simplified
> (no ring buffer and persistence triggering), and it will become easier and
> more performant to get BMCWeb hooked up for log streaming via Redfish.
> 
> Please let us know what you think. We appreciate any feedback. Thank you
> very much!
> 
> Sincerely,
> Nan

-- 
Regards,
Artem Senichev
Software Engineer, YADRO.
