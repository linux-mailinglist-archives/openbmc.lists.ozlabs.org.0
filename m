Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D74391CB3
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 18:08:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqwqJ5qQQz2yxl
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 02:08:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cjTWqnwi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e;
 helo=mail-lj1-x22e.google.com; envelope-from=artemsen@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cjTWqnwi; dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fqwq156Vnz2y6B
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 02:08:28 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id o8so2408784ljp.0
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 09:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=U7DadwXap5+T766gn+9+KFkg5kccfOtXXK1K5Q6ReOE=;
 b=cjTWqnwiDycSC7LJ84kW8kmec1Md+poQ988W5ttZPW+08hNII9JsjGHH0RZd4MNlKr
 f+JgmhblXMigCCZGIoCilARKi8URyk5TjwdfyP55hdT5BKhvWEKfadmPeW09n93u6ehl
 NGRim3PGn8n9w2AtxjDD4puZ1AXeB4n03/JNxHjtCzGmAjMi1+B/CYjJmC0cAgSTD9ML
 c1Sqak+NBY0JWAAKjCRk9H6XxNUAJAICMp93vVSOj2HMHiozRFCUNAUft1VSFW9ncDDI
 fNvWMgaDmgjAOed+DgHjIldUWaqdEX73AY4xeY+2qN16f1csaroiPZFQtyGZuOVgoa7m
 gCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U7DadwXap5+T766gn+9+KFkg5kccfOtXXK1K5Q6ReOE=;
 b=Lu6FPUbEEkIO5KsP6G4TF1QnH5jC7wA/t/g4ZfVbdn2gwLO5qQvl5C9SwiGauqOPeA
 9Er/t80mtOOL2Yi5rMpXKzpYQKs7sViKXsAXomchVMOB2vfOs2CnD9TNq2KbEav25YMu
 YY7SOqwbNF1DoBEMp8uZWqdnD6zUJ+1HMJa0AAyfdCyl5ZLzeJzbmglsGr6BgjG0DWrB
 ND6jBNxa1v/WwZRiu5tWQsPDVS66aJHRZvvDzvI3bqC2YWf2wJsRo30PHhhj1dVCvGdF
 m3BF+H/Vvq3GGia7Gzv+zkc63OlabV4wDEGpadwRBjikTkG1CIa5WS2/WKIMTNY8SrPw
 eMJw==
X-Gm-Message-State: AOAM532br2Et5qTjPkF+23QVVpyNqcLlxxNYVTvy0yBepP9SVor0Mi+v
 r5cn6FAxTfBGR3ZWShPHLpE=
X-Google-Smtp-Source: ABdhPJxPBd/lv9SB7D5BHnMueFTWfAbEdKoc662pDGWm1B+KUZGn9CvuGxO+Or3mH+Jy/ihuqfVueQ==
X-Received: by 2002:a2e:a7c7:: with SMTP id x7mr2892685ljp.46.1622045299490;
 Wed, 26 May 2021 09:08:19 -0700 (PDT)
Received: from gmail.com (109-252-116-140.nat.spd-mgts.ru. [109.252.116.140])
 by smtp.gmail.com with ESMTPSA id
 c26sm2061365lfv.63.2021.05.26.09.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 09:08:18 -0700 (PDT)
Date: Wed, 26 May 2021 19:08:16 +0300
From: Artem Senichev <artemsen@gmail.com>
To: Nan Zhou <nanzhou@google.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
Message-ID: <20210526160816.pvpxzwnix3lgwaln@gmail.com>
References: <CAOLfGj4n-RHYAq5oSRkrC-VpCFUFT2Nr3G4UeqQ8DuMbNurrNw@mail.gmail.com>
 <20210524075248.m7mimyya42xas3nx@gmail.com>
 <CAH2-KxABm3A7pdPfPbu-RY-98qs0FE8bQZwo-WO6spixU6JotA@mail.gmail.com>
 <20210525064127.xfgo5dceyvzrzpy6@gmail.com>
 <CAOLfGj6dzb6Q-BOU0AJy_thd1Gt78+and_cmU4tOUNide3Gf0w@mail.gmail.com>
 <CAOLfGj6YympZyvXO7NCPMaHNEi9CwAS97y6_-fncDHbqv5s8Bg@mail.gmail.com>
 <20210526061119.b7n2beqthbemsoba@gmail.com>
 <CAOLfGj6Ep89yknFbx2qHLv9woQ80SNJQD2cwJOa7y=tE7=VyLg@mail.gmail.com>
 <20210526085623.mhls24mmo4idu5we@gmail.com>
 <CAOLfGj7b0TEwqAEocAo=hGobCuZUoC4Zk9X_jY8Cs7NzQgi14w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOLfGj7b0TEwqAEocAo=hGobCuZUoC4Zk9X_jY8Cs7NzQgi14w@mail.gmail.com>
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

On Wed, May 26, 2021 at 08:17:11AM -0700, Nan Zhou wrote:
> >
> > > > > 3. zlib_file.xpp, zlib_exception.xpp:
> > > > > will be removed or slightly changed; we can potentially use the linux
> > > > > logrotate which has built-in compression and file rotation (in this
> > case
> > > > > these compression utilities will be removed).
> > > > > The latest log file isn't compressed any more. History log files are
> > > > > still compressed.
> > > > Just curious, how are you going to remove the oldest messages from the
> > > > latest file in runtime? You are not going to rewrite the entire file on
> > > > every input character, are you?
> > >
> > > The following is my current idea: we will rename the latest file to
> > > something else and notify the writer (hostlogger) to close its old file
> > > descriptor and open a new one (should be doable via linux logrotate and
> > > inotify or some signal handlers, as logrotate is able to send some
> > signals
> > > to hostlogger if a rotation is performed). The writer keeps appending
> > logs
> > > most of the time using the same fd unless the latest file is rotated.
> > This
> > > should be better than truncating the file where the reader (BMCWeb) won't
> > > have race conditions (it might read old snapshots but it is not a big
> > deal
> > > in our case).
> > Currently we can keep the last N lines of the host's output, the oldest
> > messages are removed. It is easy to implement with a buffer in memory.
> > But how are you going to get rid of the old lines if you write data
> > directly
> > to the log file?
> > Rotation will not help you with that (we actually don't need to store such
> > old
> > logs).
> 
> We plan to implement something similar to rotate count
> <https://linux.die.net/man/8/logrotate> in linux logrotate. It is basically
> like a ring buffer in the file system. We keep N log files. The latest log
> file is in plain text and the writer keeps appending data to it. The rest
> N-1 files are compressed.

In this case, you will keep full logs without gaps:
```
Host start <- log is empty, start logging
|
[...] <- write file, compress and rotate file
|
Host reboot or shut down
```

If there are too many logs, logrotate removes the oldest one and we lose the
boot log (form host start).

This is the default Hostlogger mode:
```
Host start <- log is empty, start logging
|
[line 3000] <- flush 3000 lines to the persistent file
|
[...] <- these logs are skipped (the last 3000 lines are in memory)
|
Host reboot or shut down <- flush last 3000 lines to the file
```

-- 
Regards,
Artem Senichev
Software Engineer, YADRO.
