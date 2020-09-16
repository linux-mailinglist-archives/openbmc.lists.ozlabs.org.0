Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AF326D083
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 03:21:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsK0m3KmtzDqLt
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 11:20:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.169;
 helo=mail-pg1-f169.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=o88sS7AA; dkim-atps=neutral
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsJNG0VHhzDrFS
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 10:52:45 +1000 (AEST)
Received: by mail-pg1-f169.google.com with SMTP id 34so324451pgo.13
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 17:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=Pw1aKFgM0qIszALMtD/6DI1YR7dVopsfYz6Pd+5G5wA=;
 b=o88sS7AAHbxgt4fwE1QmVKm78Wn1R52Ux5zRUHUw46HN4fyUnuVWTajRgIYX7wBWdN
 bVcKo6aOVDKiYxnTPpFk5gzQ/O9STf91/tBwXf+IzPevcT5jKzNANWqybAkx2wNSzxts
 lG4wsqOHmcVu0EX4fsXBj2SFlkNaQ8BIf8F7LVnuXSFxUy7wrtplQsI3AAxyMw0W5HlW
 PG5WoTeSgdydTVQrOkwh63e0Lhe2/NLn9VTEXC2cuV5Mwpr2JO8Pr3/Pg6r3kEqeqNVi
 zzVq7W+VDtlJ0VN8dhS0gNmm3YMiKoul/pLMByc7E6Kr52pk4QOmN2EK9uawl77l1lew
 i2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=Pw1aKFgM0qIszALMtD/6DI1YR7dVopsfYz6Pd+5G5wA=;
 b=ie9Z5awkvwTsE9Rot2sesRb0btgodrOuPOR+Yh05EHHuq0/e9rYLg1jL063wMGC96E
 kMsnShz1Z5zeUrqjcuApulRPW5WPLPvU8c9lZolqiw2vqnr9URjwHJ6PlHE8L2p9nE7/
 yRc95nlsKUAP8Ib9mreTCPa8FtV5/4j3Zi9lT7XYBeCfikVYiUhVHxDKV+VW9v4AlSzd
 ELl/RP89xnONbpA2pcQnKiqO+sILPAKqMAnZ12Z8UYHB9ySQ7WWOvPr7dZ6piRDwcj9J
 2LJ5pRrfUfjILj2ZprGS5fcp58XzUnv/jgNFtW+/UYoWfVrWwhDlQGz6iA7RsdLx7FEd
 r8iA==
X-Gm-Message-State: AOAM530QKtxsRhJjosA/3zo+GCQfBhohIJWDMRlqg8CLwfKGYbU852QO
 CoZW9HPgCWdxXqaf0JGeLd2+GmYq4s8xbA==
X-Google-Smtp-Source: ABdhPJx9jKlssZM0feI5wCSlQPC5Ub41xv6qB07TUXQd2IvPwYL8A7Uhbjs+RsnkWHGREPK0EIFqyg==
X-Received: by 2002:a05:6602:2f0c:: with SMTP id
 q12mr21634437iow.76.1600293340456; 
 Wed, 16 Sep 2020 14:55:40 -0700 (PDT)
Received: from [10.42.10.6] ([174.128.225.114])
 by smtp.gmail.com with ESMTPSA id t22sm10194178ili.9.2020.09.16.14.55.39
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 14:55:39 -0700 (PDT)
From: Mike Jones <proclivis@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Removing watchdog and ipmi
Message-Id: <BAB0B8A7-DC0E-44EB-93F7-98A2DBEE77C0@gmail.com>
Date: Wed, 16 Sep 2020 15:55:37 -0600
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
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

What is the proper way to remove phosphor-watchdog and ipmi from a =
project?

The goal is to not have the watchdog interfere in a raspberrypi project =
because there is no host, and there is no need for ipmi for my purposes.

I have created host-poweron and host-poweroff services and can manually =
start/stop them and see my regulators go on/off. I want the webui server =
power widget to power on/off using these services, but I think the =
watchdog is interfering. My understanding is obmc-chassis-poweron/off =
will trigger host-poweron/off.

Based on meta-quanta, I don=E2=80=99t see any other services I have to =
define to hook up host-poweron/off. This is why I think removing the =
watchdog is enough. But if there is any other interfering factor in a =
hostless system, I need to know that as well.

Mike=
