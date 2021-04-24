Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C81A36BCD5
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 03:04:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTk7m2WK0z2yxX
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 11:04:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gapps-ntust-edu-tw.20150623.gappssmtp.com header.i=@gapps-ntust-edu-tw.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=m72DjeEf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=gapps.ntust.edu.tw (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=m10902803@gapps.ntust.edu.tw;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gapps-ntust-edu-tw.20150623.gappssmtp.com
 header.i=@gapps-ntust-edu-tw.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=m72DjeEf; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FS06Q5dmCz2xZH
 for <openbmc@lists.ozlabs.org>; Sat, 24 Apr 2021 15:27:39 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id e9so9266963plj.2
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 22:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gapps-ntust-edu-tw.20150623.gappssmtp.com; s=20150623;
 h=from:to:references:in-reply-to:subject:date:message-id:mime-version
 :content-transfer-encoding:thread-index:content-language;
 bh=gcyihooymZxwhPxMal5PKJzandHUGWJgCDZ1JQbyu8s=;
 b=m72DjeEfkuzJ/klggi4TAJ2SBzPTZHFZkF5xhIkdGv9gOcp+sFL34Q65PGihRZEUbS
 JVRnPofiYDD69JpuEcPCVJXc8Vj8rANaoY2fzKx6A8sH6Er1ChZ5wbzt89TiSk/LL+kE
 /ZjBQAYLitpCttHa2Ge8y4Q940dIQDIwjsTu3f1fsg8XfhZya9mlz84pzwxu05D/IrSs
 8y9h116rxFTAHVFtYCuN9nuOpBg4p8j/+/LrfIhrLNrFHJ09ua5CqR/3o5h2yKhWldta
 5su5K18PQlZqPnQ1VZ5Sqs11ExoFQMQjNAdX40FhFVuZInCRjzlL8smz+gDqVHpjoP4C
 N0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=gcyihooymZxwhPxMal5PKJzandHUGWJgCDZ1JQbyu8s=;
 b=sBE1qUDJFxLffknjcqu1XjfRV00Se8JrUy96/81+2IM6e8umMJCzl7bw50tj4PJqAZ
 n3ZCBmtwL/L/RqgAaU++z3NNIPAZ7LHzU2nmtjCp7EfF3MOWS0N3hWiuf1Zh1cqk3NLI
 l6iHtsrfhuIEoL19LHSONY8OUbugz0q/lezwMJNN6vsXB8I3ezwVd416yW1U4dMsi4fe
 pB5owlTdd2LSiOvYffB+NHGIIMakxrEi5kC3DNXAiTLbJEhePHDJpA+wCNaoF5/P28P1
 /Yry2ZFz+FjG7oWp/NyXoRH0SsLAcHjNAPPKug1uBYdCXvtkzjFGjHwZf31uHfmI9qKh
 imUw==
X-Gm-Message-State: AOAM532slqmQWMbS9L4WQFt1Eu8o0OfkCqRqrg7Rna7XWuKl5GE749ak
 ivAECxUMFpfZZDDC18vqi0dg/A==
X-Google-Smtp-Source: ABdhPJwNr6IMZ3OK36bNhW8dekDxMv6M6VDgxjafELV2jAHHXZheEeZdxhiyx5kTNvtWbCnZeGk8aQ==
X-Received: by 2002:a17:902:d4d0:b029:eb:59ea:2f32 with SMTP id
 o16-20020a170902d4d0b02900eb59ea2f32mr7568493plg.58.1619242055826; 
 Fri, 23 Apr 2021 22:27:35 -0700 (PDT)
Received: from LuthfiMufadelLaptop ([140.118.76.56])
 by smtp.gmail.com with ESMTPSA id k21sm5848972pfi.28.2021.04.23.22.27.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 22:27:35 -0700 (PDT)
From: <m10902803@gapps.ntust.edu.tw>
To: "'Brad Bishop'" <bradleyb@fuzziesquirrel.com>, <openbmc@lists.ozlabs.org>
References: <000a01d73108$15144bb0$3f3ce310$@gapps.ntust.edu.tw>
 <20210415130835.bgl3qlql2jzskjl3@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210415130835.bgl3qlql2jzskjl3@thinkpad.fuzziesquirrel.com>
Subject: RE: OpenBMC Installation
Date: Sat, 24 Apr 2021 13:27:33 +0800
Message-ID: <000f01d738ca$88362cc0$98a28640$@gapps.ntust.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHgnvlkNpVGXSgn6ar8bqhz5Bu3TAIEgU/fqqAx9CA=
Content-Language: en-id
X-Mailman-Approved-At: Tue, 27 Apr 2021 11:04:39 +1000
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

Hi,

>Which program?  OpenBMC is an entire Linux distribution composed of dozens
of programs.
I used OpenBMC repository to build Romulus image and QEMU to run it. I
follow the guide to run the OpenBMC with GUI

>Which QEMU target did you use?
I used Romulus image

>What was the error message?
When I update the network it says:
Network settings could not be saved
Or, when I try to update the firmware, it says:
Unable to upload image file

Regards,
Luthfi

