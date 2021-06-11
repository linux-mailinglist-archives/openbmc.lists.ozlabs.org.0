Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC6C3A48B5
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 20:32:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1qFP2MDwz3c2K
	for <lists+openbmc@lfdr.de>; Sat, 12 Jun 2021 04:32:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=XVSFTYxt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42a;
 helo=mail-wr1-x42a.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=XVSFTYxt; dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1qF46jzfz3bTh
 for <openbmc@lists.ozlabs.org>; Sat, 12 Jun 2021 04:31:50 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id o3so7026849wri.8
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jun 2021 11:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Vc0Kr8P296sfOlL713ddGLiWE7k23XNfgfMZcrm9B0=;
 b=XVSFTYxtjPRJmSB/DeN3gGZlHBmY4VD+RpZ9WFifG6fRoquhAje6REiIvur23sk9TI
 cyOljaFQQXojtdH+shE3DLZsDETeagLL0/2Le+5aU6bgFQu6M5wfMgjkMwS8xACBOEC9
 0ISyJFuPzbEwwNdK8VEF6QFthrwQk8SEOswWGGfx+IIrAbBsLp37edGtPbXOevAceAt8
 yGi2Ni7UNliRfHKLBE44KA6HTjWpn5KkDlxNzMfoCWtGd/d8rlH8mkQpuj4ei5a1nJK8
 pQa5eqS4MP2XVVKvl/AeZWcJDxytHgW7lleUst9FrW9p4tANJQBIGQsNL6StZcquRnC6
 Ttng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Vc0Kr8P296sfOlL713ddGLiWE7k23XNfgfMZcrm9B0=;
 b=la2H6jsgAEKMEsBDJubpyhZw0xakwZcmNmhWeGfs07pjb0PEE2IqlGYzB66IAEXMQj
 tyfftS2i9tNbM5OVKIxWDi3Rn+HvNL0HTXrypSIuj93QsKlj/X3zcFd+IMnmxvxy8+ag
 XuePdOR28n1nBcb4UzcL/GJwcBwMSTMVoGDcMc+aN2W45Mg2Hm2+nGsbNzqmuDcjM2n5
 5n4P6oRBS3AnHrzEiJ4d58LUSivmVp39Gbymelgh7YJFIh6EVkLTmijstJkaqj4xFJZZ
 F93t5fNgZoKfxPLSFGZrcwIBMJcVrtVPDC0L+l3gcwx1Ep+DtaIM0x+k/LZz61I0i/4O
 OY1g==
X-Gm-Message-State: AOAM530Kcdzju7sN/ZX51cOS87MesQMayrnEsVfg2isWLHS98TLesdKs
 f9pZRjXDDJO5jRjR6BDL/60ZWx43QLBthL+b+RZRHA==
X-Google-Smtp-Source: ABdhPJwz0eWhx+zIhDnOVgOyzudW8zPdInq92TMcgwhsDCKzckIqp8edRx7CVKyin/3FEq3amHjuJehCwsSpA7jbxus=
X-Received: by 2002:adf:9ccf:: with SMTP id h15mr191786wre.217.1623436306639; 
 Fri, 11 Jun 2021 11:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxABm3A7pdPfPbu-RY-98qs0FE8bQZwo-WO6spixU6JotA@mail.gmail.com>
 <20210525064127.xfgo5dceyvzrzpy6@gmail.com>
 <CAOLfGj6dzb6Q-BOU0AJy_thd1Gt78+and_cmU4tOUNide3Gf0w@mail.gmail.com>
 <CAOLfGj6YympZyvXO7NCPMaHNEi9CwAS97y6_-fncDHbqv5s8Bg@mail.gmail.com>
 <20210526061119.b7n2beqthbemsoba@gmail.com>
 <CAOLfGj6Ep89yknFbx2qHLv9woQ80SNJQD2cwJOa7y=tE7=VyLg@mail.gmail.com>
 <20210526085623.mhls24mmo4idu5we@gmail.com>
 <CAOLfGj7b0TEwqAEocAo=hGobCuZUoC4Zk9X_jY8Cs7NzQgi14w@mail.gmail.com>
 <20210526160816.pvpxzwnix3lgwaln@gmail.com>
 <CAOLfGj6WmBxQNm_LDNfW-m5Bs5sndxwoVJ6QupwHo+cvBDL7qA@mail.gmail.com>
 <20210526182153.xcbs5dp6sprzv7u2@gmail.com>
 <CAOLfGj6Sn77vH-TrE-GmHrYCJ7AMHs2zr0HR_yJrES1qX_buow@mail.gmail.com>
In-Reply-To: <CAOLfGj6Sn77vH-TrE-GmHrYCJ7AMHs2zr0HR_yJrES1qX_buow@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Fri, 11 Jun 2021 11:31:35 -0700
Message-ID: <CAH2-KxC8jkKMXmHa=9SsLBFORbHbsJ2DUTPhoCLp_0uam0q8tA@mail.gmail.com>
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

On Wed, May 26, 2021 at 12:21 PM Nan Zhou <nanzhou@google.com> wrote:
>>
>> > If there are too many logs in a boot cycle, won't the current hostlogger
>> > lose some earlier logs (boot logs) as well?
>> That's the point!
>> Hostlogger does not lose these logs. It writes the boot messages, then skips
>> the middle and writes the last 3000 lines when the host shuts down.
>> We have two log files per host session: start and end.
>> It is too expensive to store all host output, so mid-session messages are
>> skipped.
>> It can be easily implemented with a buffer, but I am not sure we can achieve
>> this with logrotate.
>
> Thanks for the information. I am not aware of this functionality in the current hostlogger. Are you saying it will be implemented in the future or I miss it in the current codes.
> One of our options for log rotations is writing our own codes, I am sure we can implement the logic you mentioned above without too much effort.
> The linux logrotate also has "prerotate scripts", we can carefully name the compressed log file and keep the oldest several ones (which have host boot logs) out of rotation.

For what it's worth, I don't know if we have to use logrotate
as-written if it's not a good fit here, but that style of writing to
disk makes for easily tail-able logs, and has pretty well defined
behavior for log rotation.  If we could keep the behavior (or the
behavior + rotating on boot events), even if we didn't use logrotate
itself, I think it would be a benefit to this.

>
>> > Or did me missing something?
>> >
>> > Also, we already talked about it: there's a problem that if BMC loses the
>> > power before it sends out a signal to hostlogger, data in memory won't be
>> > persisted.
>> Yes, I agree that this is a problem. But there are ways to fix it without
>> breaking the current functionality of Hostlogger.
>> We can use rsyslog with external log server, or increase the buffer size
>> in obmc-console-server, or use systemd-cat with logrotate.
>> We can even add a new mode to Hostlogger that will not use the buffer, but
>> as I said earlier, there are not many common parts.
>
> I guess you are arguing we need a new daemon rather than modify Hostlogger, right? +Ed Tanous here to see what his opinion is.

If Nans use case is in fact totally different, and can't be handled in
the same application I think that's ok, but I'd like to see the new
application put in the hostlogger repo so it can share the routines
that are common (things like finding and opening the unix socket,
managing the reads, and the zlib integration) and to ensure that users
find it when searching for code that solves this problem, as on the
outset they're pretty similar, just with seemingly different rules.
If we don't put it there, it seems like we'd have to duplicate a lot
of code.

>
> On Wed, May 26, 2021 at 11:22 AM Artem Senichev <artemsen@gmail.com> wrote:
>>
>> On Wed, May 26, 2021 at 09:20:38AM -0700, Nan Zhou wrote:
>> > >
>> > > > We plan to implement something similar to rotate count
>> > > > <https://linux.die.net/man/8/logrotate> in linux logrotate. It is
>> > > basically
>> > > > like a ring buffer in the file system. We keep N log files. The latest
>> > > log
>> > > > file is in plain text and the writer keeps appending data to it. The rest
>> > > > N-1 files are compressed.
>> > > In this case, you will keep full logs without gaps:
>> > > ```
>> > > Host start <- log is empty, start logging
>> > > |
>> > > [...] <- write file, compress and rotate file
>> > > |
>> > > Host reboot or shut down
>> > > ```
>> > > If there are too many logs, logrotate removes the oldest one and we lose
>> > > the
>> > > boot log (form host start).
>> > > This is the default Hostlogger mode:
>> > > ```
>> > > Host start <- log is empty, start logging
>> > > |
>> > > [line 3000] <- flush 3000 lines to the persistent file
>> > > |
>> > > [...] <- these logs are skipped (the last 3000 lines are in memory)
>> > > |
>> > > Host reboot or shut down <- flush last 3000 lines to the file
>> >
>> >
>> > Thanks for your explanation, but I didn't get it. Are you arguing that one
>> > can keep more logs in memory rather than on disk?
>>
>> Of course not! =)
>>
>> > If there are too many logs in a boot cycle, won't the current hostlogger
>> > lose some earlier logs (boot logs) as well?
>>
>> That's the point!
>> Hostlogger does not lose these logs. It writes the boot messages, then skips
>> the middle and writes the last 3000 lines when the host shuts down.
>> We have two log files per host session: start and end.
>> It is too expensive to store all host output, so mid-session messages are
>> skipped.
>> It can be easily implemented with a buffer, but I am not sure we can achieve
>> this with logrotate.
>>
>> > Or did me missing something?
>> >
>> > Also, we already talked about it: there's a problem that if BMC loses the
>> > power before it sends out a signal to hostlogger, data in memory won't be
>> > persisted.
>>
>> Yes, I agree that this is a problem. But there are ways to fix it without
>> breaking the current functionality of Hostlogger.
>> We can use rsyslog with external log server, or increase the buffer size
>> in obmc-console-server, or use systemd-cat with logrotate.
>> We can even add a new mode to Hostlogger that will not use the buffer, but
>> as I said earlier, there are not many common parts.
>>
>> --
>> Regards,
>> Artem Senichev
>> Software Engineer, YADRO.
