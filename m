Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39061610D53
	for <lists+openbmc@lfdr.de>; Fri, 28 Oct 2022 11:32:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzHQT0C6Yz3cFP
	for <lists+openbmc@lfdr.de>; Fri, 28 Oct 2022 20:32:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BqMNQqj1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BqMNQqj1;
	dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzHPr4Nv9z3bqt
	for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2022 20:32:14 +1100 (AEDT)
Received: by mail-ed1-x533.google.com with SMTP id r14so7034658edc.7
        for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2022 02:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dh1xVgTPV5Au3arjZp3BvX8vrdegnZOK+9nKJ7EbDOs=;
        b=BqMNQqj1ThMvr/7JgqjmKCiqGXwcRaEfZecjqODRDTJDOgjI8QQtIpcqsbuuTC/y4P
         7CcY/2SbhSPQbA2CojBa9YeJdinQUz4cVsmO7jc4Y//QcsPmRuHuGtYuahmBAr4kfka2
         T73UmNrZuHlc6r1v8UisiNFBt2e+fOxvfh9jY3kWpfiE/JZfNTfgos89tkiMSARqszuP
         dkG10+21b6CPDaEL1UZwQ8AGh0pIsZSXbamiAQVgAWMpCYfAGvcRio7p8Gp8r3jP+EnE
         CwpiHSupQXHFipRwDLnphflEsdGRGG/9klC9I6/f/ZdKXhm2ZubO2hiViydAmGOIhxAD
         IXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dh1xVgTPV5Au3arjZp3BvX8vrdegnZOK+9nKJ7EbDOs=;
        b=OzL7gjlXXyIPao8n5kZ5/BFfn+Bj8Rt3p6wd6SpXbmBHIgClY+TannYj6j13meF6uE
         2b26YiyIp3SKeptPv9N3babzLnGQHtBEuFqjgnNkhf+FiR0kOBc1meCIXPWtGsHf30vf
         P8GbLBuP+s3xrGGj8wVcPj93MqusTbYtpYDQRID/a3BlF1c2HufKBcl0ljHuUmZjulMr
         0whuBMWLNj9TuOgjNTZCja+EqOJEaQrO/eU20iNHm3TTDCDPc5ep0vZx/d8q0Ml/nQhJ
         jaSbUKFxYMF3RPT7qbKWjbPUTU8oo8rDqztMPdGEjwlkTBaS3PemYRba1gtwLxZIprtL
         a91w==
X-Gm-Message-State: ACrzQf2fM0ZUjpmyC1FP0XIYqZtZdFaB7BZhHK31NqnlQZtGSUPORHFQ
	JiEmxuVw7ywwhaSU+5oqaGcSzJLulsDv7AL9F2/vdFG+Or0of1Rr
X-Google-Smtp-Source: AMsMyM6wsmpdUzgOYGoNr5u0XbJL9PRajBw3GGxaiic/QgNob+6RtPtU35VfrglibNAxA8mP1gxOFo5M7JYPO8I/ikM=
X-Received: by 2002:a05:6402:249f:b0:453:eb1b:1f8b with SMTP id
 q31-20020a056402249f00b00453eb1b1f8bmr48931481eda.235.1666949527126; Fri, 28
 Oct 2022 02:32:07 -0700 (PDT)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Fri, 28 Oct 2022 19:30:00 +0530
Message-ID: <CAE33tLG4oOjTmNJ=a0jNEEdTj_501offkYUFcEVwk6rAnZYKSw@mail.gmail.com>
Subject: RISC-V Support in OpenBMC
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000006c48df05ec14ee22"
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

--0000000000006c48df05ec14ee22
Content-Type: text/plain; charset="UTF-8"

Hi Team,

Whether OpenBMC supports BMC controller with RISC-V architecture? If so,
how we can generate BMC firmware image for the BMC controller with RISC-V
architecture.

Are there any BMC SoC available in market with RISC-V architecture?

Thanks and Regards,

Akash

--0000000000006c48df05ec14ee22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Team,<div><br></div><div>Whether OpenBMC supports BMC c=
ontroller with RISC-V architecture? If so, how we can generate BMC firmware=
 image for the=C2=A0BMC controller with RISC-V architecture.</div><div><br>=
</div><div>Are there any BMC SoC available in market with RISC-V architectu=
re?=C2=A0</div><div><br></div><div>Thanks and Regards,</div><div><br></div>=
<div>Akash</div></div>

--0000000000006c48df05ec14ee22--
