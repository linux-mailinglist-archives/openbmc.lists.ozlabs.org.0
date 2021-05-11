Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05761379F7E
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 08:03:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfS6L0g1Xz301K
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 16:03:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DlmqUi2d;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DlmqUi2d; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfS615Fxxz2xy3
 for <openbmc@lists.ozlabs.org>; Tue, 11 May 2021 16:03:36 +1000 (AEST)
Received: by mail-qv1-xf41.google.com with SMTP id u7so9594997qvv.12
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 23:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=W6/h0iixQ81VwCLhCPrgty36Npg3Oqpf0J9cAPnDg1E=;
 b=DlmqUi2dBG1KEwZJDknGpXB4pa+1v8QXhO06PwrhRX8rxJvzTIBjt9ffmmOPsOMVud
 P1A5f0GOq1QhRXJBl4X5xOPxl+2EaQEyr3m6fsKqdSfidYD87tnnrvXD1UgyTPM5swcb
 JfEkTbga/+6VHyCYE0k3vv0TzIlhGtjiJcaVn7fTQJGbDg/5OPVMa4Jn3N7BRzOnUare
 56eyq08p54uEYgQh9gp26VO01Y2RJzmXZ+BzxqswK1mxPNiQDJ+5dfmJLTAEpeOcl84W
 lOcFrV5MpaIHrQZTlHMUPZ5GUxD3zEQP38MtkJ4YHkFne3AZ1uboA77qWedgn1+kKTS/
 4JFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=W6/h0iixQ81VwCLhCPrgty36Npg3Oqpf0J9cAPnDg1E=;
 b=VsVDmquGpQ5zXhK2NfCqBhRSnlX6Lt/WVKvTd+lUK76oVoTl/kvJB1R6wNBpNngxZp
 Sp39aWj1/UU4QqPjZ3AG5DIZdcBzlJiLRQVsqSJ70yWCq0K99paa9LFUaaWKTcE9htKW
 6G7LbYcTTMamAP3EYqtczApwthee+lPX4crvxEe/YTSuOyrbETBRsRJqsMVbqpDmw+cQ
 0/kc7XtwW/w0KXRqeMiHKoXsev4qIK27gyVTfn9Bx2+ldvml55un6MQGV5g9k857/Nh4
 A6q3bFcCMxdy9NoYasqTnA7t97+pwUSlHkaLPFr6uScThQ5ACn0mx//hZ5oF5A+dBSGE
 dqPw==
X-Gm-Message-State: AOAM531DcS9ylwGppnMjqzJrc7BnVbKpkH7+Gpt31xMd+V2s7r5cxeTY
 9QXsEMEhjkngh19Vy06+DtxNz/RXAYKGqi392K3eUoEABgQ=
X-Google-Smtp-Source: ABdhPJwmaia2KDTOjgSkvvvi75lvM9RS9uwWqolJwsAo13za+obftbW6MbLCZHxSfa4+84ZDN1h9Li9FwfZu0jLqHaY=
X-Received: by 2002:a05:6214:21a7:: with SMTP id
 t7mr14935566qvc.4.1620713010534; 
 Mon, 10 May 2021 23:03:30 -0700 (PDT)
MIME-Version: 1.0
From: George Liu <liuxiwei1013@gmail.com>
Date: Tue, 11 May 2021 14:03:19 +0800
Message-ID: <CANFuQ7D-ujDJ0ZwE4QEYRPCSM78d3SdUuT=pB2Fk3t18QMr95Q@mail.gmail.com>
Subject: Use the right values for CODE_LINE and CODE_FUNC in journal traces
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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

Hey everyone:

I have a question:
When we track the CODE_LINE and CODE_FUNC values in the journal, the
CODE_LINE and CODE_FUNC attribute values are displayed incorrectly.
issue link: https://github.com/openbmc/openbmc/issues/2297

Today, OpenBMC has supported C++20, and has included
`experimental/source_location` in C++20, which can flexibly obtain the
CODE_LINE and CODE_FUNC attribute values.
The following is an example:

```
void log(const std::string_view& message, const
std::experimental::source_location& location =
std::experimental::source_location::current())
{
    std::cout << "info:" << location.file_name() << ":" <<
location.line() << " " << message << '\n';
}

int main()
{
    log("Hello world!");
}
```
link: https://en.cppreference.com/w/cpp/utility/source_location

So my initial idea is to define `const
std::experimental::source_location& location =
std::experimental::source_location::current()` into the log method.
But for the log method, has defined a variable parameter, so it can
not receive a default parameter again.
link: https://github.com/openbmc/phosphor-logging/blob/master/phosphor-logging/log.hpp#L157

Does everyone have a better way to process it? Please let me know and
we can discuss it here.

Thanks a lot.

George Liu
