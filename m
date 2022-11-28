Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFA763AA33
	for <lists+openbmc@lfdr.de>; Mon, 28 Nov 2022 14:56:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLRpf0BbTz3cG1
	for <lists+openbmc@lfdr.de>; Tue, 29 Nov 2022 00:56:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=AZIntmgH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=AZIntmgH;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLRp56xDnz2xl6
	for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2022 00:56:13 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id x5so16954534wrt.7
        for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2022 05:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cQy4ZcuMMNlZ/e3hTW9Goswe/QbVr2SlPlBcyT0pTR0=;
        b=AZIntmgHjNvoxDdYqxwvXuECzIgO6z5IEGOV+TUH7LojJY/CZ8gjRKCH7L/OAbO7oD
         Wt6Q7a8JTNVcbwy8/6VfGui5AztnQnvd5eAwV5tZtnBsNlqo0/krd3mTn/HLg5C4Twor
         6O9iXVUBxKo5BMQmVYgE/Mb+fEqIUfAxiJlHL9nvTNGrj04h8GErfoxJgb0WrUG0CcwT
         9AxwlULFWF0lHaKzLht2ajWdNKzAl254rFmeTM1u1KlCy7749kOwCH3Zi1OYjugSmGrb
         7nK+HNRJkwGPZ42Dfp8RDZx8rNl3vGYaN3VBT1quYjSO2ys/El7jxJm6xYDv4DID4NIX
         5siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cQy4ZcuMMNlZ/e3hTW9Goswe/QbVr2SlPlBcyT0pTR0=;
        b=rfNel23aYTIfz9mkc3F4nzznZue8XQVdMsDfrr7qTS6thAA7X0yskT3/hKduwbFTdp
         KS98pANHVFbBgSNljsZxSlBKpCSq1dop/97nFNKjPRoTO4+FzhGHN2FwFP+EvCUmZW6X
         CcDQkh+razDyiO167UViMbsPjEQyC4cQ48PAtjTWxe7IZTPQ+WDZQdVxGFpNjdxLDtkJ
         9h8fAkGdAnVcw8R0fCN/2K00DeMHl5Kij8DuvAjrL+rt6fwXdrB41ag2m8f2hdS6nOZs
         bBIO/J+UEhOns7IakCwDkO85Gbtr6zLSwNg5mQpqP47HL9GCpK1CWFpIME/aoa5PJbaj
         PNeQ==
X-Gm-Message-State: ANoB5pnN0rBxI9uk7a/WQFptXgfhMLcnuV/SECnfRr1BrQ5trzLoCCrQ
	K3vi+WSIT5PpfCLoe0fcOb/tKT8cOndmIYdHsTkc51vrCfu9wA==
X-Google-Smtp-Source: AA0mqf5J0r4/KvxfrRmssFSxLlkAwQF+VMLXN8Ng+zDNEGTpVFVcV91nei3gUUVV+4rCaweaPf4PZS05jOB6F1/+Oj8=
X-Received: by 2002:a05:6000:114a:b0:22e:244d:687a with SMTP id
 d10-20020a056000114a00b0022e244d687amr20008117wrx.82.1669643764535; Mon, 28
 Nov 2022 05:56:04 -0800 (PST)
MIME-Version: 1.0
From: Zhang Jian <zhangjian.3032@bytedance.com>
Date: Mon, 28 Nov 2022 21:55:53 +0800
Message-ID: <CA+J-oUtt_Run28NrbNFMWc7-9O4R8P_T2GKc88SVjXOEGJjkNg@mail.gmail.com>
Subject: sdbusplus: asio: Hang problem with asio::connection using new_method_call
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi temas;

I encountered a problem when I was trying to use the dbus synchronized
call `new_method_call`
via `asio::connection`, the dbus server sometimes can't receive and
respond to the request.

I found out that when the `asio` service is synchronous calling, the
dbus request is coming.

In this case, the dbus server can't receive the request. Also, at the
same time, another dbus request is
coming. The dbus server will handle 2 requests at the same time.

   After debugging, I found the callback `socket.async_read_some`[0]
is not called, I don't know
why.
[0]: https://github.com/openbmc/sdbusplus/blob/master/include/sdbusplus/asio/connection.hpp#L324

I wrote a simple test case to reproduce this problem.
https://github.com/zhangjian3032/bug_simple/blob/master/case1/README.md


1. Build this case
```
meson build
ninja -C build
```

2. Run the dbus server `fake_server_bar`
Because this bug happens when the dbus server is synchronous calling,
so we need to
run a dbus server that only provides a service to be called, and this
problem will be reproduced
when the dbus server is synchronous calling, thus for every dbus
request, this dbus server
will sleep 1 second to simulate the synchronous calling(actually, it
could happen at any time,
1 second is just so easy to reproduce).

```
~# ./build/case1/fake_server_bar
```

3. Run the dbus server `fake_server`
This server had a timer to sync call the dbus server `fake_server_bar`
every 5 seconds.

```
# using a new terminal.

~# ./build/case1/fake_server
```

4. Run the dbus client `fake_client`
This client will send a dbus request to the dbus server `fake_server`
every 10ms,
wait a minute, you will see this bug(Client will hang and timeout exception).

```
# using a new terminal.
~# ./build/case1/fake_client
```

5. Optional: Run the dbus client `busctl --user get-property com.foo
/com/foo com.foo Foo`
When this bug happens, using this command can break the hang and
timeout exception.
```
# using a new terminal.
busctl --user get-property com.foo /com/foo com.foo Foo
```

# Others
Because I found the socket callback `socket.async_read_some` is not
called, so I tried to
run `read_immediate` after sync call, here's a workaround on this.
