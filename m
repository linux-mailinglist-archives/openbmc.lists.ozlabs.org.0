Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C550B39131E
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 10:56:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqlDt5ZbLz2yjJ
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 18:56:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Eq2mNoKB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232;
 helo=mail-lj1-x232.google.com; envelope-from=artemsen@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Eq2mNoKB; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqlDZ46ZXz2y8Q
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 18:56:29 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id c15so626746ljr.7
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 01:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/k3oov1LDa17VpkkU2hU8s/8Y6AtqelYuLvrX9zIBW8=;
 b=Eq2mNoKBtJ4dhQO+7NVFAelOTNpeL3FKyYczO3/cwc41xVRy+25AkuJVHRyKPdohR3
 T4B7XGi/QFXsAWFupWBk8MPAqO8PU74h3Z/sVq2refaic0AVKy8Kb9tqaRvjuA4DpHea
 FRlvhR8CrRre3LxTCCCByMv9eIsWKIUPoZOhURrxez9aMNiiiUJ8sDoFyKhRXvfS3vuw
 wSJlr6eePtNnLG56JExSb5c+zytxVPb6VKrfVfbvVjGqELnRi+L+0ytcba6NUv75QLHR
 KQa/B6XFF7uLKIXu78jocj0mhfvShKNimcneSo+7u5HwHTmKZ69gWJIU1V9fsRZxClzh
 VOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/k3oov1LDa17VpkkU2hU8s/8Y6AtqelYuLvrX9zIBW8=;
 b=X/qQUWa8PIRQUGrSYxuZM6AiFaCRRON4W0kK4XKLLskLFslEXcnk/K4MNUekVbZsyG
 L4PJPM5GtHT2/+mAoS1lHjfrN1paULXgfRBlxKswDGFEqXmKewWl6uhIDPWkyrUY4w4V
 fFCKsMZ7WZ09xPnuph+kJTv3a+PXZWX7PkKsiwaphh7O4ctnnyS/ZBoOrKTikH8CezRH
 MubTUAdatUrZtBNPO3IDF6mMCi65ZffJN+CEG6BzB0aDza1oZ/GGQKMJd4wkhBdjEJsi
 dH87/XIZu0nHX8LtU5OWMnw07CMlBRuidNIQKQkXP3/eb5i2jPim12x3aCAWd/kpZ177
 Bfmw==
X-Gm-Message-State: AOAM530abkin5UGF78jJs0KMshsf8w69/5Ec6RO+xxlaRzlLE0Rj3/p4
 UAO+SLTKhPgxQ40TRcciR74=
X-Google-Smtp-Source: ABdhPJxM2grProERV42QFvH3tNFpWWr/p9QMnU53N53aOwYKjkRyoWCPlulHM93m5juf4zbXqAnjGg==
X-Received: by 2002:a05:651c:8f:: with SMTP id
 15mr1518195ljq.220.1622019386281; 
 Wed, 26 May 2021 01:56:26 -0700 (PDT)
Received: from gmail.com (109-252-116-140.nat.spd-mgts.ru. [109.252.116.140])
 by smtp.gmail.com with ESMTPSA id
 o17sm1972225lfi.91.2021.05.26.01.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:56:25 -0700 (PDT)
Date: Wed, 26 May 2021 11:56:23 +0300
From: Artem Senichev <artemsen@gmail.com>
To: Nan Zhou <nanzhou@google.com>
Subject: Re: Link phosphor-hostlogger and bmcweb
Message-ID: <20210526085623.mhls24mmo4idu5we@gmail.com>
References: <20210521061023.4zy5s7fzycz5lppx@gmail.com>
 <CAH2-KxBcfqB7ArTEg977ai1fKK_Ppwt+odwqtJgV+3GZ8szs2Q@mail.gmail.com>
 <CAOLfGj4n-RHYAq5oSRkrC-VpCFUFT2Nr3G4UeqQ8DuMbNurrNw@mail.gmail.com>
 <20210524075248.m7mimyya42xas3nx@gmail.com>
 <CAH2-KxABm3A7pdPfPbu-RY-98qs0FE8bQZwo-WO6spixU6JotA@mail.gmail.com>
 <20210525064127.xfgo5dceyvzrzpy6@gmail.com>
 <CAOLfGj6dzb6Q-BOU0AJy_thd1Gt78+and_cmU4tOUNide3Gf0w@mail.gmail.com>
 <CAOLfGj6YympZyvXO7NCPMaHNEi9CwAS97y6_-fncDHbqv5s8Bg@mail.gmail.com>
 <20210526061119.b7n2beqthbemsoba@gmail.com>
 <CAOLfGj6Ep89yknFbx2qHLv9woQ80SNJQD2cwJOa7y=tE7=VyLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOLfGj6Ep89yknFbx2qHLv9woQ80SNJQD2cwJOa7y=tE7=VyLg@mail.gmail.com>
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

On Tue, May 25, 2021 at 11:51:44PM -0700, Nan Zhou wrote:
> > > 3. zlib_file.xpp, zlib_exception.xpp:
> > > will be removed or slightly changed; we can potentially use the linux
> > > logrotate which has built-in compression and file rotation (in this case
> > > these compression utilities will be removed).
> > > The latest log file isn't compressed any more. History log files are
> > > still compressed.
> > Just curious, how are you going to remove the oldest messages from the
> > latest file in runtime? You are not going to rewrite the entire file on
> > every input character, are you?
> 
> The following is my current idea: we will rename the latest file to
> something else and notify the writer (hostlogger) to close its old file
> descriptor and open a new one (should be doable via linux logrotate and
> inotify or some signal handlers, as logrotate is able to send some signals
> to hostlogger if a rotation is performed). The writer keeps appending logs
> most of the time using the same fd unless the latest file is rotated. This
> should be better than truncating the file where the reader (BMCWeb) won't
> have race conditions (it might read old snapshots but it is not a big deal
> in our case).

Currently we can keep the last N lines of the host's output, the oldest
messages are removed. It is easy to implement with a buffer in memory.
But how are you going to get rid of the old lines if you write data directly
to the log file?
Rotation will not help you with that (we actually don't need to store such old
logs).

-- 
Regards,
Artem Senichev
Software Engineer, YADRO.
