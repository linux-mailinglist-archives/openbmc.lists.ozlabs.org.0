Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FBC391EEF
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 20:22:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqznV1tFjz2yyS
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 04:22:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ekJPcHHU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231;
 helo=mail-lj1-x231.google.com; envelope-from=artemsen@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ekJPcHHU; dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqznD12Fvz2xvH
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 04:22:07 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id v5so2892128ljg.12
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 11:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4c3EYTmKA/xDP4xFXnVU2/3OHqqgDDmCyL2hb5dpP9c=;
 b=ekJPcHHUb9H9ceqdYKj1H1V/AiapYUNEeC9nHQi6r1gG7nJnWaLozGy/Fm32SuEny8
 rx2asfVrVoSkfK6K9NmnInDc0Hd9cJcR/wuQtLmeKYwzgVlxGrnjJnnzAwZ+QRLKgM4l
 Aly+CeDHaErW5LinKgFIc3PLCq1PR+9hwwzK5v2qR6TCPyeJxeW1MViiUun7Lpp9Ib9L
 Wmdt9dpAVDgs8q/GJPXcaIY/yCJH1z7c0Qw1vOp/ogckbD0h5L8iFMikycjR6F7HtmbX
 6EYweJMq3ak9lq1f8MNXuT644H+eat88JZ9UOa3aurtBacVOEuAPKHeuZ4kOgUQuFz7S
 4u7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4c3EYTmKA/xDP4xFXnVU2/3OHqqgDDmCyL2hb5dpP9c=;
 b=EsQM1zNof1315s2PTX/z/uYPxqOFeU1g/zBkwfJu9xzuEuZ6gdaoXOp9kbZlXN29L/
 /JUFFq31/L4+FkR5k3jrJeYiOWIfYP1aqnttgCo2qIs7k7wsugrmo8khKIdof9ojYNsx
 ke8Afug+Lsy1IIFkVbb3TsUnFd5BJwNI1kr5sdVM7weh1dGY94YP2vgUfJ1rSAsaGrom
 zcNy+I+4yHAdbZfkyNh4eS4S8j8j6MKqAjoZlwSMNA4eUf2/ltU0n2Mn7VCfUcSvNQEO
 ECuFlP033GORK8yePaSuZIpQWPlHojKUivAuw59lpX/bBip1iu0+NUuLxiUwly5IqyRy
 UaMw==
X-Gm-Message-State: AOAM533MrHG/cZv+9e/qJF90fDwt63S6DgFz0DipsFlOoIIe/+ANJB4q
 oWl0Vw7XfNtRt/c2Jju6LYA=
X-Google-Smtp-Source: ABdhPJxfFyUQSNWicI45kXM/VLBUbsaOpne12vwt/QzBxX3q70WfydVSJ6OUobQGI/LVyltvZOXpHg==
X-Received: by 2002:a2e:571c:: with SMTP id l28mr3225096ljb.275.1622053319244; 
 Wed, 26 May 2021 11:21:59 -0700 (PDT)
Received: from gmail.com (109-252-116-140.nat.spd-mgts.ru. [109.252.116.140])
 by smtp.gmail.com with ESMTPSA id
 t10sm2438721ljg.65.2021.05.26.11.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 11:21:55 -0700 (PDT)
Date: Wed, 26 May 2021 21:21:53 +0300
From: Artem Senichev <artemsen@gmail.com>
To: Nan Zhou <nanzhou@google.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
Message-ID: <20210526182153.xcbs5dp6sprzv7u2@gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOLfGj6WmBxQNm_LDNfW-m5Bs5sndxwoVJ6QupwHo+cvBDL7qA@mail.gmail.com>
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
 Alexander Amelkin <a.amelkin@yadro.com>, Ed Tanous <edtanous@google.com>,
 Richard Hanley <rhanley@google.com>, a.senichev@yadro.com,
 a.filippov@yadro.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 26, 2021 at 09:20:38AM -0700, Nan Zhou wrote:
> >
> > > We plan to implement something similar to rotate count
> > > <https://linux.die.net/man/8/logrotate> in linux logrotate. It is
> > basically
> > > like a ring buffer in the file system. We keep N log files. The latest
> > log
> > > file is in plain text and the writer keeps appending data to it. The rest
> > > N-1 files are compressed.
> > In this case, you will keep full logs without gaps:
> > ```
> > Host start <- log is empty, start logging
> > |
> > [...] <- write file, compress and rotate file
> > |
> > Host reboot or shut down
> > ```
> > If there are too many logs, logrotate removes the oldest one and we lose
> > the
> > boot log (form host start).
> > This is the default Hostlogger mode:
> > ```
> > Host start <- log is empty, start logging
> > |
> > [line 3000] <- flush 3000 lines to the persistent file
> > |
> > [...] <- these logs are skipped (the last 3000 lines are in memory)
> > |
> > Host reboot or shut down <- flush last 3000 lines to the file
> 
> 
> Thanks for your explanation, but I didn't get it. Are you arguing that one
> can keep more logs in memory rather than on disk?

Of course not! =)

> If there are too many logs in a boot cycle, won't the current hostlogger
> lose some earlier logs (boot logs) as well?

That's the point!
Hostlogger does not lose these logs. It writes the boot messages, then skips
the middle and writes the last 3000 lines when the host shuts down.
We have two log files per host session: start and end.
It is too expensive to store all host output, so mid-session messages are
skipped.
It can be easily implemented with a buffer, but I am not sure we can achieve
this with logrotate.

> Or did me missing something?
> 
> Also, we already talked about it: there's a problem that if BMC loses the
> power before it sends out a signal to hostlogger, data in memory won't be
> persisted.

Yes, I agree that this is a problem. But there are ways to fix it without
breaking the current functionality of Hostlogger.
We can use rsyslog with external log server, or increase the buffer size
in obmc-console-server, or use systemd-cat with logrotate.
We can even add a new mode to Hostlogger that will not use the buffer, but
as I said earlier, there are not many common parts. 

-- 
Regards,
Artem Senichev
Software Engineer, YADRO.
