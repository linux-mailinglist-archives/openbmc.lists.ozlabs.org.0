Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 425756C3F05
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 01:19:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph8Gv0qBzz3bjw
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 11:19:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=drut-io.20210112.gappssmtp.com header.i=@drut-io.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=wvSfu3os;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=drut.io (client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com; envelope-from=abhishek@drut.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=drut-io.20210112.gappssmtp.com header.i=@drut-io.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=wvSfu3os;
	dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdPhL4KpPz3cf1
	for <openbmc@lists.ozlabs.org>; Sat, 18 Mar 2023 00:13:21 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id 133so1692006qkh.8
        for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2023 06:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=drut-io.20210112.gappssmtp.com; s=20210112; t=1679058798;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PDbfr/QAhA0Hqe3m2Zq4snKHSzB0kg4IKsUnWvepz0s=;
        b=wvSfu3osZtXaOyduA35I8iksif3OU/R0YlNMdxMwpZN92nzCOndssUW7vmzJbmI9vC
         iDCXt9SQui269PI6QmKXy3Q42vmJp+Q8BcClqnmdLHSntzRjYBp9Lzdm15fMHnJmn2ij
         AMKBlz/nbPHwZPVDFS6qNrNQ9qY3OLvdsTRroN1lqy+JEZgh1wwUUPbgRdAyXbDEp0W5
         u3AcVXomfQK1uVm/gYcOUTsSXP8zkttMioUHB8gF+3rHSCAiEjkM3mJCTIPADDLQFqvp
         2k4jzZHqKE/k7eJ1X6NfvzL4QmQiOKJFT5u3Ph0Y+FGg1PouVri2uKwF/4sdO9bzI5Q6
         w32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679058798;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PDbfr/QAhA0Hqe3m2Zq4snKHSzB0kg4IKsUnWvepz0s=;
        b=6hluMSMICpiukOayjQ/Jp7TSvp6OkHFCRXxqcB76LmVh3EHy04vHxvWOhNEYfODh0Y
         9JwQKOPeRONRfozx7WLftqqfNl761wDxnCQZwbHWG39glvF4+Gs9Mq1F+4lVIEel+11O
         9tJpRWdl+uZX9GlGiovHY4mSkv0sbn+GKxUHXuDtiYtOU1gnZckhdIMc2LEqUabthplb
         l5adcUQ5LF32LJAJgLugmTll+gso2SRIxV4jKSemxsGpZviI0aSDXJLxrDqNFYRaXIEk
         7GJv7rV0Q7BzKdEByfwjLPquidPVxhp+g46qwekTEONUcQL6bSUFwrfUDpO+aAFykTcl
         T9hg==
X-Gm-Message-State: AO0yUKXjeIFTNVxUN5pzuOQq42eKAS05QMGf3mztQey1CkKUICbrZE3R
	GrwAzaevV/ZpRzS3x8lqOobdarR+59L/APztR25fpB4MTHw1eu+haynl2A==
X-Google-Smtp-Source: AK7set+LY1yqDIQ9LaJiizkAbaUCo1EmOVwoH84O6snphiWSiAsUafYig4HZHqHqfhMCUjplfmZTjR3WLS2UNVGoRl8=
X-Received: by 2002:a05:620a:211b:b0:745:72b3:304f with SMTP id
 l27-20020a05620a211b00b0074572b3304fmr5151488qkl.5.1679058797970; Fri, 17 Mar
 2023 06:13:17 -0700 (PDT)
MIME-Version: 1.0
From: Abhishek Singh Dagur <abhishek@drut.io>
Date: Fri, 17 Mar 2023 18:43:06 +0530
Message-ID: <CAJ1un7j0FNpYaaviQxoKQN4O+C8RejqA918CdBamPySKyAEJUQ@mail.gmail.com>
Subject: Using QEMU how to redirect serial /dev/ttyS2 output of guest machine
 to host machine.
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000035daa405f718572f"
X-Mailman-Approved-At: Wed, 22 Mar 2023 11:17:46 +1100
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
Cc: qemu-devel@nongnu.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000035daa405f718572f
Content-Type: text/plain; charset="UTF-8"

Hi all,

We are using obmc-phosphor-image on an ast2500 board which is trying to
communicate with other devices over serial port /dev/ttyS2.
As we are trying to emulate the machine on qemu we need to redirect the
request to the host machine so that it can handle this request and return
appropriately.
We tried using QEMU options like -serial ,-chardev but still not the
concrete way we get to do it.

It will be very helpful if you can provide us some guidance on this.

Thank you,
Abhishek

--00000000000035daa405f718572f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>We are using=C2=A0obmc-phosphor=
-image on an ast2500 board which is trying to communicate=C2=A0with other d=
evices over serial port /dev/ttyS2.</div><div>As we are trying to emulate t=
he machine on qemu we need to redirect the request to the host machine so t=
hat it can handle this request and return appropriately.</div><div>We tried=
 using QEMU options like -serial ,-chardev but still not the concrete way w=
e get to do it.</div><div><br></div><div>It will be very=C2=A0helpful=C2=A0=
if you can provide us some guidance on this.</div><div><br></div><div>Thank=
 you,</div><div>Abhishek</div></div>

--00000000000035daa405f718572f--
