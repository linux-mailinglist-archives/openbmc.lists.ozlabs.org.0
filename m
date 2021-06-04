Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B6C39B0C4
	for <lists+openbmc@lfdr.de>; Fri,  4 Jun 2021 05:17:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fx7Gl2HtDz306H
	for <lists+openbmc@lfdr.de>; Fri,  4 Jun 2021 13:17:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mHpXOeQE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=wh800805@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mHpXOeQE; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fx7GS0Sr0z2yYQ
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jun 2021 13:16:45 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id o9so3897251pgd.2
 for <openbmc@lists.ozlabs.org>; Thu, 03 Jun 2021 20:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=RT+lcSsRKG4VbY8gsMjuptqJx2ngWmKoAOceKjFVb0U=;
 b=mHpXOeQEkrMg2V7p0GkpVRLvD0i0CtPXKlcmUUA4fZZ4bdYBDWiw2yDbeqFIGgcP6L
 yHC1uQzPOC0MlcG5goVeB3oRr8D/nZCHWy0EyfE0pSsf9+JZTYONl5h5+fNyzAfAXuWe
 dbtKVRx7mESkcAltqGVfxT1cFoAGZoXzkABY78WJGEUClQ8m51cqfjaa9160x1DVEyr9
 2MsCLzRcgB0FR+ulwXn4sRqbEZZG/We06nbZyj1wnfH9YOpkp29gYFHn9Ig7M2jdNEaB
 0OJkrvPbpfUnpUqfkKSBaiIRvQSzUZ6y18DCAcrhVjth4etKXZ4mQBZ5edf+LlHWd/vm
 nnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=RT+lcSsRKG4VbY8gsMjuptqJx2ngWmKoAOceKjFVb0U=;
 b=L047zrdKTVqcJi3zXgsYqL9qD6SYNnci3Cpg59SLc5yYsRDaUIb22wmX+gdAy8Xa/m
 uXvoIzuuxnwj+sb9S6o9ZgWcgpi1EpGXKYhYAIeF7Fj7Odqbq0AS0srtaOE4ckUnRm33
 YX2oLf+vmI5epc5zGCt4Xwxrff/oO/4UgoVN6PRIwdXjnyKKh51Kpw31YWTBjzLYHIJR
 dh+b4yIlzdaK/SC3TaZO96yF2HjYbhOsF29+pIjImY7Ev8Dp9B7Y82m/JcNP+To1wicu
 LwwYrn8FpGglrqgkbFPbjvbLtm988DQKTbbgj0ruu0gphn6C79o6Slsloz3jl8vlnbFc
 5O4w==
X-Gm-Message-State: AOAM530TWMGvi8qpcWXVbE+5nonFDDARm0ZdgQxARHTrpceF1n//LUaN
 IznKTX2bCQVaXBgejkeSlRhFb5uYo4Dc
X-Google-Smtp-Source: ABdhPJwmkqx5Wasno9BV8ubKu6+l9KjdiPbSxfiyJychTzdfRwqGxuNbCh2Kr4ymTJiTKRJbh+xlvA==
X-Received: by 2002:a63:ff43:: with SMTP id s3mr2739606pgk.86.1622776601928;
 Thu, 03 Jun 2021 20:16:41 -0700 (PDT)
Received: from smtpclient.apple (114-45-13-75.dynamic-ip.hinet.net.
 [114.45.13.75])
 by smtp.gmail.com with ESMTPSA id y6sm3264850pjf.40.2021.06.03.20.16.40
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Jun 2021 20:16:41 -0700 (PDT)
From: =?utf-8?B?5ZCz56eJ5piM?= <wh800805@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Power Restore Policy (Intel platform)
Message-Id: <88E210B7-A803-41D9-8261-6F291B092641@gmail.com>
Date: Fri, 4 Jun 2021 11:16:33 +0800
To: openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3654.100.0.2.22)
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

Hi Teams

I am new to OpenBMC, In Power Restore Policy function, I setting "Always =
On=E2=80=9D via web, and reboot the BMC (the system is power off), I =
expect the system will start, but it don=E2=80=99t.=20

My system is intel platform, and already install x86-power-control.

All suggestions are welcome, very thanks

BR
Paul=
