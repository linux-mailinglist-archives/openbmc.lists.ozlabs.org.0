Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 741F32F2227
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 22:49:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF6mr6gnvzDqXL
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 08:49:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2b;
 helo=mail-io1-xd2b.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BxWB6Q2u; dkim-atps=neutral
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF6m468VzzDqB7
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 08:48:51 +1100 (AEDT)
Received: by mail-io1-xd2b.google.com with SMTP id q1so74962ion.8
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 13:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=7Mac0XFdZpTwo67wiyvyJoyKoVAXtRoy3vU78gIJy68=;
 b=BxWB6Q2u1EmBwN388VGwfLspLbRIA46use7EDqSzAWFAnl9IaDLcrKFNhhfQrlxWQq
 wEdlrcQr6Gad3vWC16RqpcjUcUym206Ji4Dg+z+aSh804mWsemO6yL/uGa7ZvNci8cJx
 oaU7qchd9aqMwiEMWfk+gGMbKiF2/pp25U9fyT2mPhCuq1HhKo6OdzUaxAR6vWIHft3i
 /npmcWWYJQEZLf008ECy9cdoHKVx/xmaay+qY56fYD1qdDu4jxPI9k+Cr5da+XNikQpV
 CDBkm+jbfvdNtqHA5wN6KEf69B2CDJjZfxS2n9E+M2d6+SX/589m+FmNhylcbDMuKymc
 Bj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=7Mac0XFdZpTwo67wiyvyJoyKoVAXtRoy3vU78gIJy68=;
 b=Dg8IDU0QTEl0eyar/Zxtad5gNlSrS+ubbdeQOFl6wLWeCrDWZ6OV7+OYKxQ8QYNsmH
 Nc7USHjdB/Lue8naJJDF674l0XhxT28p17PQ+AixAgJ7n4IFWFhbcOEqIPUth0bfZ/yE
 3GLiNHPq4M6LRiuyn7FOz0652GZ1ADVsf+hkrMXOOYey+tKaAi0qdWXd336NWVNdOiFV
 B52ghb/UmL0tU9svmA7UuyLrZSN1DrKrwt7mTQVyGVe1iBdjz92vd6228Qc/F9WoC2M6
 UALtILwVXlIFLHXy5t01xJKr2F92q1p1LrnWYUDfbH6L+y/un+9WQIkgnZIXn3cLuObI
 lFpA==
X-Gm-Message-State: AOAM530GSMnx8jcJZRUYH8RtHXB8eotKsIkaTJ3QjIdyvF8SGWYOWQcd
 9dU0L99jpfnu3ggf1DLKonv1TueXU7c=
X-Google-Smtp-Source: ABdhPJy9QVSylcWPYvXLqNktgtckih6AYPYlO8s7uC9j3ZJtQScdrc3R+Rw9BOFwz12pPWhnDnnu8Q==
X-Received: by 2002:a6b:3115:: with SMTP id j21mr985594ioa.55.1610401728073;
 Mon, 11 Jan 2021 13:48:48 -0800 (PST)
Received: from [10.42.18.7] ([70.39.113.236])
 by smtp.gmail.com with ESMTPSA id s6sm556863ild.45.2021.01.11.13.48.47
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2021 13:48:47 -0800 (PST)
From: Mike Jones <proclivis@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: READ_EIN/READ_EOUT
Message-Id: <9E1C7198-6C02-4A72-BE5C-5CF05AF2E9BB@gmail.com>
Date: Mon, 11 Jan 2021 14:48:46 -0700
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
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

Within the PMBus standard are two commands for energy: READ_EIN, =
READ_EOUT.

These commands exist on both regulators and hot swap devices.

- Are these functions getting used?
 -And if so, to what purpose, examples of where to look in the layers =
for the usage, and any other helpful pointers=
