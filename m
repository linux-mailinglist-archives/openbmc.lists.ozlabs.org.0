Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B1A4D94E3
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 07:53:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHkdm5f09z30J6
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 17:53:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QgvVvl0t;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QgvVvl0t; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHkdN4fMHz2xX8
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2022 17:53:26 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id s16so14790251qks.4
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 23:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=AtiW3Cfnxr35ExfYk2O1ZNJuVLApYxnOnnKjhdE/1hs=;
 b=QgvVvl0tPbCFGJFxOa12bKalpdcsKUVoiIt1RuTyCbkSTWTI4ttyb/ayj7MyJxSe2X
 UdFn8tT1lJFyxUIQzy4WzWOsX1ZElBQdQqXHp4dbfaC7Ptw249PWWSVvyImpdXO7AwQG
 /eBmgu3KTjPD849i1ePAy3EoJt7XcsyyXxXT2TiBwfKyGJMfzqS9T1f4Kjv2dwM5ctra
 keX7ixsLp+Y75Vvfq91oPglNQ/uEad7AhbFUuPXrf9fAJhmq+9OACtqxk9k3Vwl/Vjud
 4YfxNh9XS0fVitq2WDRj7/v1tGDXO2vhL0KL3Ol3m2rvq0FH2XzuvNqN6tIZeWD8UyLz
 iN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=AtiW3Cfnxr35ExfYk2O1ZNJuVLApYxnOnnKjhdE/1hs=;
 b=F2HXZSnl/RKuvs3Jm/o4BGRydE+5nJNc81kXvpuocnMfMnS1fhbcKY7tRyz/bHIM+d
 iEz14VpzuWfFqdm6/1A7DI0RYOQcIHesloBT89SZ1l+HKGTP9XKkLhsHNcF3qv6AjLVI
 mHN0D1Pto5CH0KbRO13+/Qvg0mkkgBV1P0WQc40qukKdIgUb6qb/bXt2c32N1bfQQ3u4
 afINyxHZFLyE5sO4QKkJ4J83Z0594eN4mbJyxJNyXcVONrXhcbxnGWJCQyfZqV/KYPjK
 gbBKMjs8ibDENHJT+KaZHnua1+Vur4vI/Jh131Y+ZNFXfFaeNNdhmRMFu8H1w67bAEMV
 Vvnw==
X-Gm-Message-State: AOAM533tJRlRIbCquHN5vvjKN80vW3LwoMLRjdSK7AgL5pMyU1R8Bynf
 Q5KDhTIzmzrLlR3etYi5l1IzlM6OiqUtloXKvnx33R84N3E=
X-Google-Smtp-Source: ABdhPJyvQreb29pT/IB0VIrb5UOmv8UIhKJDs9eJdztjIPqp8hpHn1WtVY8KA3JQWfnlUkIyfJZZSHXLK2oVU5Gq1t0=
X-Received: by 2002:a05:620a:1a20:b0:67e:cf1:b42 with SMTP id
 bk32-20020a05620a1a2000b0067e0cf10b42mr176233qkb.143.1647327203202; Mon, 14
 Mar 2022 23:53:23 -0700 (PDT)
MIME-Version: 1.0
From: George Liu <liuxiwei1013@gmail.com>
Date: Tue, 15 Mar 2022 14:53:12 +0800
Message-ID: <CANFuQ7BCW3TcKj1D38MHJQv8D0EKfHdTdSfuXEd+Gpu+JE4PJA@mail.gmail.com>
Subject: phosphor-audit
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

Hey guys:

Regarding the design document of phopshor-audit, I have made some
design updates. I very much hope that everyone and TOF can review it.
If you have any comments and suggestions, please give pointers.

Thanks again :)

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/46023
