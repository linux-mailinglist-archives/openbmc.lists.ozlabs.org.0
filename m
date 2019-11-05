Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 796D2EF511
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 06:40:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476dmc3g9vzF3r7
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 16:40:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::136;
 helo=mail-il1-x136.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y4qvZ5LP"; 
 dkim-atps=neutral
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476dlx5zrGzF3qY
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 16:39:57 +1100 (AEDT)
Received: by mail-il1-x136.google.com with SMTP id d83so17106344ilk.7
 for <openbmc@lists.ozlabs.org>; Mon, 04 Nov 2019 21:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1CoBiR8Q7F7g+lMX2a7an57ll4ouOa1OsvIomqVAb1M=;
 b=Y4qvZ5LPjftSd6Qtzf0AAAfIbsWqncQsou9dlxlUUQp/plcUm79qI/hnruM5iIFwyy
 hjlt9i+IurpZnkVQkotAiRdXLL0QTQFq049bog81sM5i0fKJ600j4RhSXVmTetLDGWB/
 vGvlgs4auvvx9rqYp6NuUwmF12hdi5a7hIQC9uP/l87piUw9phVWlDg9nbRY37RrK8QN
 3O3AgvTGOO3R8T/ohxY7nxJ7OQGxFYTW/ElzkRDSEMWjkNqmCk0f8Tkdoxpy9W5u2+vN
 4X7C8cVb3tLE/1M0lDFV+9jJH8w7qEf0NlPhQJ+NEjmNtvuoOWqc9XJH0/vn6+ngvrxW
 QFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1CoBiR8Q7F7g+lMX2a7an57ll4ouOa1OsvIomqVAb1M=;
 b=rlZtggvX5Ir4heJjOiV54IoQqlXHoPBCQ+/T6DG+04jvKJCvjcCSUT9Y3DNfMZeAFY
 0zB2GWlv5N2LZYyuP3NcUW7cL3JRi7PoLJ1L99hh0MtYsvGg39kVjEh/7CeVTSgPru66
 sDCm1xMY4ARK7PIZd8vVDLXNm9dA13hbOZzYom1C+wdf6RfdWqZ4pB1DB3yaqZ76E3xK
 mXCYk6EDwtMV/E+KAyLpD0rEjaAFvx9aWXm4caE3B19FAaS8TGSx+TNUWFJi5QeHQyTw
 Jl8WvX7wOlKXCcpMjbZwPsBtN7Ka69h/1YlvjBrx2nkQ7bekK+qh5jVJgqDFhmJMD4r3
 DU5A==
X-Gm-Message-State: APjAAAX+9pxtwD1ccdE6YAgSBQSRr5kGV9QAK8lKA9D6oKlZGZ9VbOiK
 a/wXnsXeT81HQtTAWYbWu29hIiKybU1HwQZYS30XmcWc8kI=
X-Google-Smtp-Source: APXvYqwEUFqeTr664dnyYxe0cuPEOxxk7WiXSGz33bG2WBwJO52jtyyawY5g7Up6yoCGT8fzL8o3N5Xb9wrPlBTMCbU=
X-Received: by 2002:a92:17c8:: with SMTP id 69mr33005504ilx.42.1572932393425; 
 Mon, 04 Nov 2019 21:39:53 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtkwC6CoVFDYwwtD38U5whRTbuodxWUF3A0DM+XvQoPJfA@mail.gmail.com>
 <c6719aad-1d87-318b-a680-df8844bf6a7c@linux.intel.com>
In-Reply-To: <c6719aad-1d87-318b-a680-df8844bf6a7c@linux.intel.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 5 Nov 2019 13:39:42 +0800
Message-ID: <CAARXrtkHZx4_+gYm0TFu4g0Pm=evYeOL1-RujTGFf_EJoLGu3w@mail.gmail.com>
Subject: Re: How to run tests in bmcweb
To: James Feist <james.feist@linux.intel.com>
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

On Sat, Nov 2, 2019 at 12:21 AM James Feist <james.feist@linux.intel.com> wrote:
>
> On 11/1/19 1:59 AM, Lei YU wrote:
> > I am trying to add a unit test case in bmcweb and run it.
> > With local CI, the tests are not run:
> >
> >   WORKSPACE=$(pwd) UNIT_TEST_PKG=bmcweb
> > ./openbmc-build-scripts/run-unit-test-docker.sh
> >   ...
> >   [100%] Built target bmcweb
> >   /home/leiyu/work/bmcweb > ctest .
> >   Test project /home/leiyu/work/bmcweb
> >   No tests were found!!!
> >   ...
> >
> > So the question is, how do I run tests in bmcweb? Should
> > openbmc-build-scripts be updated to support that?
>
> I believe the tests in bmcweb have degraded and stopped working, so they
> were disabled. I haven't run them myself, so I'm not sure how bad they
> degraded. If you want to try to run them locally you need to pass
> -DBMCWEB_BUILD_UT=1 when you run the cmake command.
>
> https://github.com/openbmc/bmcweb/blob/c78d791eb1fa9d12e987e7b1ad885ada92d0757a/CMakeLists.txt#L292

I tried to enable BMCWEB_BUILD_UT and build it in local-ci, and it
really is broken badly.

Output posted at Pastebin: https://pastebin.com/1pMWSM3N

May I ask the maintainers to fix the tests in bmcweb? So that it makes
the community easier to contribute code into bmcweb.
Thanks!
