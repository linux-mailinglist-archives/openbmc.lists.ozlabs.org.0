Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68142332FAF
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 21:15:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw5zb3G8hz3cLR
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 07:15:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=IxvGVYbg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32c;
 helo=mail-wm1-x32c.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=IxvGVYbg; dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw5zJ3609z3cHd
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 07:14:49 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so7858916wmi.3
 for <openbmc@lists.ozlabs.org>; Tue, 09 Mar 2021 12:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=N7yuLcI0WW8C7tyYgotbq9XSfJFksmZVzrjGdvyd/C0=;
 b=IxvGVYbgu7nhSKuO57VmKQkNh/1hGx3KLZiB3NIagrfiPjzB8klXXoLFvirALMDuz8
 09FccQ6J9ZxpdUMW3o5LtoK1p7BIHFLee7/I+hm2h6+5H5YawylZ5zrZ1SIsPQaXc6Cd
 DDdPW0Vam+HpcW/YfN7j/YO0af58Q5w9DQLKPhDz2x0/uocBAAHi8zm8ueLKlOUJC1F4
 OZ4Dc4pwA+kpZaqVm6PqGQn3EbsR38LbR6UtZ4df1X2dIFgmfiwsXm8PsHsdhHcCcmBO
 2GSRwDqtyi/Wox5dMTjJlcKUrYbYzkYbTuWlHU5KefkFW9WPMZGdGzMwv01Ld4Y5Ty2z
 KFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=N7yuLcI0WW8C7tyYgotbq9XSfJFksmZVzrjGdvyd/C0=;
 b=Koee3Yfwos+AZqNyekLFsdjtIT01aJf4mcn+Z8nTo7kcSMZ8BRrBU9kgEbpO/s3AeD
 RBK/HK0cTe3EfxvLGCb8uvp5hcb5VfeEsgkS8AtjLoCk0ZbYn/lfribN4Obn/cTZ0PV3
 n7H6G5hbuk7OS8BbDWgtlcZFKt6nZkJlvMJPe5YX3EpbB+UdPU1bmMtlIQMKclD8eNt4
 HHA+D8ji34sj05A3Gexfv6Rjnxyfh2Yrh6qwfR0yXDfUh8gTLiGdqMTk26F+Q7shPRl9
 34z45D+JSmMaV+tkTNC8qOCUcz6dTrqEa/+oNff37IR5zXo4jkO2A/nYO7vNjEYnVfZm
 RQMA==
X-Gm-Message-State: AOAM532mssVcXPanKuR6S9/1ji12ZMI/KqlN6WM6c7unIHXBWYSeTq8/
 f7J+3RSmLxNW5AvWKR2IQ6bVCXWK2aTkxVfnBltjrZugJOJJGQ==
X-Google-Smtp-Source: ABdhPJxAGwHTkYzimso8/n+Ibgv9nIYs8Dp7DCB6kpV/IiLtqvR7LJqygM/TiX/ZU4jBeP3TCunAlsCR413YLwZEQaw=
X-Received: by 2002:a1c:a7d3:: with SMTP id q202mr5833203wme.93.1615320882229; 
 Tue, 09 Mar 2021 12:14:42 -0800 (PST)
MIME-Version: 1.0
From: Ed Tanous <edtanous@google.com>
Date: Tue, 9 Mar 2021 12:14:31 -0800
Message-ID: <CAH2-KxCRXUyr+xbtFhyGr6_Et4qXKZG4JPi23MC3WGjRu4itKg@mail.gmail.com>
Subject: Redfish-Usecase-Checker on bmcweb
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

Has anyone tried to use Redfish-Usecase-Checker on bmcweb?

It seems like it would be a good, DMTF recommended way to capture and
test the results of a lot of the stuff we've been specifying in commit
messages.  In a perfect world, down the line, it'd be great if it
completely replaced the long curl statements we put in the commit
messages.

Does anyone else have experience, or have thoughts on this?

https://github.com/DMTF/Redfish-Usecase-Checkers
