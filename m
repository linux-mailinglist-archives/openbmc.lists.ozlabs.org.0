Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B04E1BE32F
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 17:56:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C3624kZPzDrBg
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 01:56:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e31;
 helo=mail-vs1-xe31.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PIcUGWLK; dkim-atps=neutral
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C2xS0FpDzDqSN
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 01:48:58 +1000 (AEST)
Received: by mail-vs1-xe31.google.com with SMTP id a5so1691959vsm.7
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 08:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=szcTTZAoyj+vyfRwNgr8OrZ8sw2beVd/icjS8IrQaFM=;
 b=PIcUGWLKzlENhLVVknT+yLTvlIbn+GyUjt8+chsKRwd3pLw+3f+VF0hLjKT9+i1Px9
 HjkvdPSGKGy9eFTpoScFMWh35A8GhIiQIqnN+8Mc2dw/M78OQQJTpMKNBVfJPlL+JArq
 cSCGhRutUa10IXcYevDcEl97ZZnLhm1n4i5rG/T16b8N5ZODB7MvmKxxjHErq4pLQH6+
 MyMx1iX2zFrf2Ep9yQd2tJhmRY3Px49PYJgWJiGn2KDQjOTt6g1nMAiLeZQ1/WrEFsCX
 4yhkL9vfUuWs97NzylvCx03qIVC0Uj6GN0/+evo6tiRYtgCItomWf5Z6wSZkYMrAMFAg
 R2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=szcTTZAoyj+vyfRwNgr8OrZ8sw2beVd/icjS8IrQaFM=;
 b=KuA8fGwmqHG77d2winbdSFF0aZjDYOukbuG1zvV+vISSq0XuP3oZK+p1DJ4V4aYN7c
 dLnOI3qe9C1Zerh7Ni3hAQbFwrO1lFSsdtEwpUDcdlkotcRs0hcF4d279gLxu/LfrwF4
 rhhqIuyIQqNvZI1Yc7EB+s0EOMoIGrLJCbpZVm3BjEzdzvYytolzDrZzeCeHiBWjk6B1
 f+P1s5f//L3uFd/U4ioIa3QO2P9pI576UtGiySvaWqepDJKBHO+cW+O/ZKktAVQ6u3Ba
 FeujK5cIyd0O4zWIcpXRdC8zd/T++ch4BLW2+RYQ3++yAK8f3eOhwT2ZJ3E/HIEe6zgd
 KeTQ==
X-Gm-Message-State: AGi0PuYmP10e69tARTLYdd33ZiWC3xpX7fujknhgbpwmPtiZfWb4vm5+
 ty9Y/C2g/oWO9SrG1gIBb9DlXbck/ErEyL/bc+q6+RqOKks=
X-Google-Smtp-Source: APiQypIedsZmozCuaOPstKymOMi3mqAikP3ZkdjvVtYCrYF/L364GCr33kbjWNUIWeO9plJGkD4FkApIcoWD2XYGacg=
X-Received: by 2002:a67:79d0:: with SMTP id
 u199mr25457834vsc.115.1588175333083; 
 Wed, 29 Apr 2020 08:48:53 -0700 (PDT)
MIME-Version: 1.0
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Wed, 29 Apr 2020 10:48:41 -0500
Message-ID: <CAG5Oiwj+-OnkPMc+dfeo0P=MfREPz_7E+zBaMaYy6AHMLO+BxA@mail.gmail.com>
Subject: OpenBMC 2.8 Release
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

It's that time again!

You all have probably seen the Dunfell update emails, which means we
are nearing another release. We will have our 2.8 release in May after
a 2-week period of testing.

Assuming we continue as before, we will finish the yocto update, tag a
release candidate and branch. This new branch will become the release
while still allowing contributions on master. Hopefully everyone will
also testing the release in parallel on their platforms. (For planning
discussions on the release process, see:
https://github.com/openbmc/openbmc/wiki/Release-Planning

We'll need to make sure that the project documentation is current.
Also, I need the main features/functionality enhancements for the 2.8
release notes. You can send me email with a feature you worked on and
a brief description, or just add it directly here:
https://github.com/openbmc/openbmc/wiki/Current-Release-Content

Thanks everyone!
Kurt Taylor (krtaylor)
