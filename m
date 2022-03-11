Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFBC4D5A5C
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 06:17:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFDhB3CDVz30BV
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 16:17:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=iVVV5zWg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=iVVV5zWg; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFDgm44Fkz2xVn
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 16:16:47 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id i5so8298901oih.1
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 21:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=jckCdFeHNPuojn+MlbEjOw36HO5ZjYhOYdNe8Pqj/JQ=;
 b=iVVV5zWg8T5t6tiifGSrWwcmCxeQwtrnVoaae3wWq7+n8VQ4N+3KtGKahkpLHHq8zX
 zrKBz7untspg/fAj9iEoQEcyjN9PjmKkCjSRraXWfDLpoavpO5uwv4aXSNt65y8xR3Dj
 N/rYup3j8gRX96De4c8ibHBrNoKnK52uMFxjYWFA4qyRPgmKhQFF0XHrTSsZpY8JcDyi
 2t7PShCiEHeKq+grQWUgysWzVl5CzM8Z3GnpKsgOkZBJx1BfoCcqYL2BG609zKo20Jd1
 loDOZfBvS9HhmeQrMz11iXKxk6OeWqgstWTJS/uJI1UQlQvY1VolPtdsPICPLKKewbIs
 1/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=jckCdFeHNPuojn+MlbEjOw36HO5ZjYhOYdNe8Pqj/JQ=;
 b=pLWEGeZNxDr65wxl0Pz4lc6/N9lTBrD2xlu4u/GkiAYdMvAjoWqLUonQDbwKAexn6T
 tYlOL3l7Hx8SrTA9wZ+3wO+j+SKILsd7o+Nw4F3PJwFng5vWOj5pX9ljuQD2WnZirdX9
 aRS191Mo8fqL2bZ9HhjicKZ6nVmuWtLZ1zr6fjq3Un9LKDbQgn64kq1tRPCZnEl6Xx84
 Z4lAJSPnvSzXqG233W5cXHPMG7+sY5c8JnozxUyuNFN4MwG+jxRuRYuapCt2ZSvaLEdS
 L5BYI0VpVsQ8EvPMF+ZkR3yTdxG+7QprvIEHupXdxXHS4X5oiYETmrPcSc/cofqdYc4u
 uULQ==
X-Gm-Message-State: AOAM532JnrnJm4jDqcgO4DbYqkbZ3N6GEDbwvnxeaWgIvV4VjBeMhEDj
 lVpC7zXfZp7bJ7Xsu/5BJVQqEGoYHLOWULF6/z02aSGCzThC6Q==
X-Google-Smtp-Source: ABdhPJwIfdEvv1W7EFcZtiI1aMmUfJw7sjcdJihHzHmWDL/cgxUZdi2ul185RuIbPUf1dcmJkY19XRTUzI6+Oqzl03c=
X-Received: by 2002:a05:6808:1450:b0:2d9:dad1:a14e with SMTP id
 x16-20020a056808145000b002d9dad1a14emr11893775oiv.294.1646975804466; Thu, 10
 Mar 2022 21:16:44 -0800 (PST)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 11 Mar 2022 13:16:33 +0800
Message-ID: <CAGm54UG6o2_kFfor81+MmWW7pqxQ4bQu9FkVXaEbGhQ_JLQi-Q@mail.gmail.com>
Subject: Delayed match callback with sdbusplus asio APIs
To: openbmc <openbmc@lists.ozlabs.org>
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
Cc: Ed Tanous <edtanous@google.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This mail is to describe an issue that the match signal's callback is
delayed if it's using sdbusplus asio APIs.

# TL;DR
If the app is using sync DBus calls and using asio to register a match
callback, the callback may be delayed if it occurs when the sync DBus
call is ongoing.
Note the issue does not occur if it's not using asio APIs.

# Details

Pasted a full buildable source at https://pastebin.com/KEmpvDzp
The code
* Registers a match for host power status, and print the changes.
* Uses a timer to get sensors via sync DBus calls.

With this code, it's very easy to reproduce the above issue in QEMU,
just toggle the `RequestedHostTransition` to On and Off for a few
times:
# busctl set-property xyz.openbmc_project.State.Host0
/xyz/openbmc_project/state/host0 xyz.openbmc_project.State.Host
RequestedHostTransition s xyz.openbmc_project.State.Host.Transition.On
# busctl set-property xyz.openbmc_project.State.Host0
/xyz/openbmc_project/state/host0 xyz.openbmc_project.State.Host
RequestedHostTransition s
xyz.openbmc_project.State.Host.Transition.Off

We can see the journal logs:
# journalctl | grep -e test_asio -e "Moving to \"Off" -e "POWER_OUT set to 0"
Mar 11 04:59:25 power-control[195]: POWER_OUT set to 0
Mar 11 04:59:25 test_asio[23478]: aiso callback, property:
RequestedHostTransition, value:
xyz.openbmc_project.State.Host.Transition.On
Mar 11 04:59:33 power-control[195]: Host0: Moving to "Off" state
Mar 11 04:59:37 power-control[195]: POWER_OUT set to 0
Mar 11 04:59:45 power-control[195]: Host0: Moving to "Off" state
Mar 11 04:59:48 power-control[195]: POWER_OUT set to 0
Mar 11 04:59:56 test_asio[23478]: aiso callback, property:
RequestedHostTransition, value:
xyz.openbmc_project.State.Host.Transition.Off
Mar 11 04:59:56 test_asio[23478]: aiso callback, property:
RequestedHostTransition, value:
xyz.openbmc_project.State.Host.Transition.On
Mar 11 04:59:56 test_asio[23478]: aiso callback, property:
RequestedHostTransition, value:
xyz.openbmc_project.State.Host.Transition.Off
Mar 11 04:59:56 test_asio[23478]: aiso callback, property:
RequestedHostTransition, value:
xyz.openbmc_project.State.Host.Transition.On
Mar 11 04:59:56 test_asio[23478]: aiso callback, property:
RequestedHostTransition, value:
xyz.openbmc_project.State.Host.Transition.Off
Mar 11 04:59:56 power-control[195]: Host0: Moving to "Off" state

In the log, `POWER_OUT set to 0` means RequestedHostTransition is set
to On, and `Host0: Moving to "Off" state` means it's set to Off.
You can see that test_asio's callback is not triggered during
04:59:33~04:59:48, and it's triggered for multiple times on 04:59:56.

# More info
* If the sync DBus calls are removed, the issue is not reproduced.
* If I do not use asio at all, and use sync DBus calls with
`sdeventplus::utility::Timer`, the issue is not reproduced.

That is to say, this issue only occurs when asio and sync DBus calls are mixed.


@Ed Tanous @William Kennington @Patrick Williams Could you kindly
check the above behavior and let's see what could be wrong?

Thanks!

-- 
BRs,
Lei YU
