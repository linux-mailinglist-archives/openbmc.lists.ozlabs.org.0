Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEDB4768C4
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 04:39:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDyXT1qh9z3c5h
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 14:39:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oyA6hUaH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=oyA6hUaH; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDyX54pqVz2ynt
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 14:38:59 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id t3so554684lfe.12
 for <openbmc@lists.ozlabs.org>; Wed, 15 Dec 2021 19:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=V7nAjGzPuiGdZvL4FOpuWJ9b8fgBjWsRW2Bzwj1GC50=;
 b=oyA6hUaHXi219qfnWB50W370xxLK2cVOvwU1jLNAN6YTNWloX/VndFO7i4M9dguow0
 yWeP7AA6Op7aQECjcg1gvK/c9AT34fhJEeKclr1dumYlrnLdO9psF7TZUlzDX0WGjc0Z
 5f+YsciVh212USHDFqLsBZIl1U6yVI/FNcJLju9Tlh/MrYKljkLkh7UR/Efbqr+Ak4o8
 nW13pw6VVR+ldleIFXt0rCxAaVaumwgTWAGIQoMMa8Los7oEUX8//dEaVVc59VfUsukx
 pJUma/Dl84dYbOFROv2OZdvDYiMjwyDN8W78nlWTep3lYsc4c58E9Di5b6HZTIJvf+0E
 7RMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=V7nAjGzPuiGdZvL4FOpuWJ9b8fgBjWsRW2Bzwj1GC50=;
 b=t0BVmUwmlyIJKSRG/9mHCbaTe1o1mGel2qNzx06yomBeU9WDGbk9BoXDlYC4gL9Qox
 qoQBQRk2Punc8cAd4N5St4K+TFQT+eFUGHpTsbjDTFPfjvxJBvHkU0kwih/25wnKT9al
 8EKdhPw4L9IfRO33ezPoZYt31KcEAyjp5ea6jmmpE8zL/R9dbDZv3PTqS8qviZZW7Y7r
 qeSpKKBV7a+9QQrFflU6XrVRJnvtqV1dGtRNElfC2hyIfaF8VCjXXtYdUKyLlTd6VLcy
 R1Ld54pmb99D/qpMRlgGYffWD+61c1YDHUsrhxDoOvrJesa9bxRMaITPiLkUlwr0GwpN
 4cMQ==
X-Gm-Message-State: AOAM532vBgupjraDHS4z7FfLfXnflHa8wMI0dFvO4RUE5xDzRY0H7UTd
 LRyzEgj9m8orEK1uV4t4fqMn4nydpUu3oYE5mX6O/KPMpua7Dg==
X-Google-Smtp-Source: ABdhPJwFCPLQggOIv7RfBRk4a/8DXRGhuyMUbNHk/0YRlHRGF5VAtiTpXcqITDUtZANk5mZoq1eB29KDxvccBoIRMJU=
X-Received: by 2002:a19:8c48:: with SMTP id i8mr12958886lfj.179.1639625932006; 
 Wed, 15 Dec 2021 19:38:52 -0800 (PST)
MIME-Version: 1.0
From: Oskar Senft <osk@google.com>
Date: Wed, 15 Dec 2021 22:38:36 -0500
Message-ID: <CABoTLcTACbnnPZ8dfc_oFwgoT5JikYBHgfTjzknJbqC98rLMQQ@mail.gmail.com>
Subject: Slow performance of VUART on AST2500 with 5.15.5
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
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
 Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi everyone

I'm doing some more validation work with meta-tyan
(https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/49181) on the
current 5.15.5 kernel. I noticed that when using ttyS0 from the host
(being the VUART in the AST2500), that the transfer host->BMC is
really slow (like 300 baud slow). This is true even after stopping
obmc-console-server and just doing `cat /dev/ttyVUART0`, so I figured
it must be a kernel problem. When I then tried kernel 5.2.11 (with the
DTS from 5.15.5 minus the uart_routing node), then VUART behaved
normally. After having done this comparison, I think that 5.15.5 is
generally just much slower.

Is anyone aware of AST2500 VUART (or something else that would affect
performance on an AST2500) having gotten broken somewhere between
5.2.11 and 5.15.5?

Thanks
Oskar.
