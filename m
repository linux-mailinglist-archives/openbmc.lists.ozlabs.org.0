Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8088F52E2F2
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 05:14:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4Bfh34xPz300x
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 13:14:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=0drQUu23;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::32c;
 helo=mail-ot1-x32c.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=0drQUu23; dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4BfH1NmPz2xXS
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 13:14:29 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id
 r12-20020a056830448c00b0060aec7b7a54so970510otv.5
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 20:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Br9NHpdluZIkn4BiH41BQEbSdWF2toDUH+mqL9rhbAU=;
 b=0drQUu23c81kheshixApba0GjmHUDgawrFFy7nOGR8vT+JbWSxNAhtQ/dRKQYuYEzx
 bS0YN9yo9zZZkDZqYZVDWJ95/SJ8YIa3yrBeGyDLPDav9KDeXDU9KwDVO0w+PAJzrmfO
 EgOq6gni9LEbNHZzhAQ5Cc4ejNezBN1ne0GZcoc1yNpMqtb8A2UHKKkjOmPjAw0SZcpm
 hCw4qua6m77QAVR2qsZpTAMlEaehAJk80uDr8SRmtKe7lwO2A8YnkXgeWfgwbOJi/c0B
 fEgVSpd2IYjdV+TMupbMpUpD87QVd49UzV5IDn1LBv/8IVC00lxk9wVWt5SEKLF8O2Qs
 LE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Br9NHpdluZIkn4BiH41BQEbSdWF2toDUH+mqL9rhbAU=;
 b=oG0RjfRzKaRaYA9sUrjg+b6XZbH8oXMTleqCqqFVIhnv/9iVR99WBQMvPlZ/POvbXH
 oacQQFZeE9guPliDk5Svu2VdMotDpx67XMMy8GmT0AIPfWRL1oCqyy14UD6n0hbm/9KA
 p6T6/510Cqr/LKY8wwxbgrrqHZIy/Yj1yr6j0131W/1NBEovrNGflgPPhOheCijC0pF0
 s0ql8kWxdMvUdm/UV6vqZ50WucjKESARjS//w4Y5C18yWRse4Ud4AOVH70fFKaycJkiq
 w55ehQ6LR9csXHMMqSOhZ2ts4UKzdA3gTFwE9+Mi5vk/lGw/vxLDgPPd8lZ2ja32jgiw
 4h/g==
X-Gm-Message-State: AOAM531UYvhJyeYYaZW2HteP0GJ++kInaYo5WovabHJ+PPA8bW8BLYqH
 Lqdqv17ZgBnIVjafOMJujNzLdSDFY92oTYoxjlLk19JEclTbRP9W
X-Google-Smtp-Source: ABdhPJxreEUPQ1ntszCHyijoGIb4fH3GHAh1J/Ci+Wcoz3+Y5rSJGMgC3vP/sGxVOk5iOJHUGkATaEUkfgWvfBk9bvw=
X-Received: by 2002:a9d:2621:0:b0:606:254a:bc78 with SMTP id
 a30-20020a9d2621000000b00606254abc78mr3233202otb.57.1653016465920; Thu, 19
 May 2022 20:14:25 -0700 (PDT)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 20 May 2022 11:14:15 +0800
Message-ID: <CAGm54UHU9s0bTq-AR9tJunoX2Wa9tQ0PH_zWJ2QrYdR3SRqcvg@mail.gmail.com>
Subject: The incomplete result of mapper GetSubTree/Paths
To: openbmc <openbmc@lists.ozlabs.org>
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
Cc: Ed Tanous <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This email is to describe an issue in mapper that the
GetSubTree/GetSubTreePaths could return incomplete results when it's
doing introspect.

Steps to reproduce the issue:
1. Configure phosphor-logging to get max 1000 entries. (with
-Derror_info_cap=1000 meson option)
2. Create 1000 logging entries.
3. Call GetSubTreePaths and make sure it gets the correct 1000 entries:
    # busctl call "xyz.openbmc_project.ObjectMapper"
"/xyz/openbmc_project/object_mapper"
"xyz.openbmc_project.ObjectMapper" GetSubTreePaths sias
/xyz/openbmc_project/logging/entry 0 1
xyz.openbmc_project.Logging.Entry | awk '{print $2;}'
    1000
4. Restart logging service
    # systemctl restart xyz.openbmc_project.Logging.service
5. After the service is restarted, call GetSubTreePaths for multiple
times in the short time (e.g. within 10 seconds)
    # busctl call "xyz.openbmc_project.ObjectMapper"
"/xyz/openbmc_project/object_mapper"
"xyz.openbmc_project.ObjectMapper" GetSubTreePaths sias
/xyz/openbmc_project/loggiz.openbmc_project.Logging.Entry | awk
'{print $2;}'
    47
    # busctl call "xyz.openbmc_project.ObjectMapper"
"/xyz/openbmc_project/object_mapper"
"xyz.openbmc_project.ObjectMapper" GetSubTreePaths sias
/xyz/openbmc_project/loggiz.openbmc_project.Logging.Entry | awk
'{print $2;}'
    375
    # busctl call "xyz.openbmc_project.ObjectMapper"
"/xyz/openbmc_project/object_mapper"
"xyz.openbmc_project.ObjectMapper" GetSubTreePaths sias
/xyz/openbmc_project/loggiz.openbmc_project.Logging.Entry | awk
'{print $2;}'
    851
    # busctl call "xyz.openbmc_project.ObjectMapper"
"/xyz/openbmc_project/object_mapper"
"xyz.openbmc_project.ObjectMapper" GetSubTreePaths sias
/xyz/openbmc_project/loggiz.openbmc_project.Logging.Entry | awk
'{print $2;}'
    1000

We can see that the result of GetSubTreePaths is increasing until it gets 1000.
This actually happens when mapper is doing introspect of the logging
service, and getting more and more objects.

The above "incomplete" behavior will impact the logic that depends on
the result of GetSubTreePaths.
E.g. in ipmid, the "cached SEL" feature depends on the reliable result
of GetSubTreePath, to get the number of current logging entries. If
it's not correct, ipmid will not know the "missed" entries.

The question is, should we make sure mapper returns the "stable"
result in the above case?
When it's doing introspect of a service (e.g. nameOwnerChanged), it
could throw if the service is not fully introspected, and only return
the "correct" result after the service is fully introspected.

If mapper could not guarantee the stable result, the service calling
mapper will have to add more complex logic to make sure it gets the
"full and correct" result.

-- 
BRs,
Lei YU
