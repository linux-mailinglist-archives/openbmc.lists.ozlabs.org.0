Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFD6B055A
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 00:04:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TGCP0TynzDqPW
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 08:04:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c29; helo=mail-yw1-xc29.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ch9csCFH"; 
 dkim-atps=neutral
Received: from mail-yw1-xc29.google.com (mail-yw1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TGBr4zmkzF3ty
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 08:04:02 +1000 (AEST)
Received: by mail-yw1-xc29.google.com with SMTP id d19so6537882ywa.0
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 15:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mqg0fSDS82ewB6a+We9jEPA4wNvXnIfdImQUtE4fl2s=;
 b=Ch9csCFHzzUhQ0V6IYFl4JRX31H6bIeyEwwHxtryfrsqHhm2tILOqPq08KzdfSLj/o
 5U8KJRARjNXrLLcyTZoQ+K+BaE7vpXvH9XBZ93dppcNyIFpa1pR8lsjOLsGHwVmsWwXX
 anFqomtwKpiE7ndZCFqsGhorbK2oICthsCS4m/O16WE3b/CV4CSC4+779EholpnZNdBM
 vJkYWdGVEeSlAJT/XyoZZHIF+X/r7K4pJycX5k/jYXPlVo1Gc2HmaNAn5dQxL8GVqJFb
 EK9shlD/KqpOtei4NK0k2degtaFQFGsaHaggkbjUssuvLzs3u2ePLaNsgMD0LeQuX0hQ
 hL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mqg0fSDS82ewB6a+We9jEPA4wNvXnIfdImQUtE4fl2s=;
 b=EGnAULvCzpOvAe2qu8OE9LvCoiRwBD2FslK21Ou6q6pejF+PilaYjABXb2zP1S5U6d
 byam1EL6+moghLM0yoCGOb33vlk75XKcruIajwDOiQ8MS8t3V+SW+59Gh9AlBgAMZhoW
 MGS9yKMw04fRKQSkGpbqk4ZbadJGiDQTQO3Jh8OC93H17wdF9FVud1GrydNtGPfjb+a7
 ZZ7w4ewnhlO4rEiu43Ls28AKpU5cnK9Wa9YduqKHNJgHEUZ1eqJzRNpwCQjsb89NyA93
 3fyynMFbEYYpBcDQUQEGbnxCxPTDgbFGwn7ZAuw7FrKyMLOG2sI2SYbnHo4hkazoY8Tr
 CtxA==
X-Gm-Message-State: APjAAAXERWYfgUxceWJf7HJbOj682n2VgF49Kizzx1I/v5mRIHi4jiLU
 5ASADMlqVtRl1jR1+Lg3B1RO67LAUPCges4ohkA/4vfoSwQ=
X-Google-Smtp-Source: APXvYqwTrzdul+dg/VdkLqAqByiip1ZLuATVtGG+CowOy3Tqq+WyOTG/G7OdG0QHYza2tehE/aIENsCBHwAd69QhMrw=
X-Received: by 2002:a0d:f2c4:: with SMTP id
 b187mr27741832ywf.103.1568239439931; 
 Wed, 11 Sep 2019 15:03:59 -0700 (PDT)
MIME-Version: 1.0
From: Jandra A <jandraara@gmail.com>
Date: Wed, 11 Sep 2019 17:03:49 -0500
Message-ID: <CAMTupoQjtr7KOv96=-UC98T3UBEdQqEuTJjFD8MY53nh6yU8tQ@mail.gmail.com>
Subject: Expiring Passwords and CA law
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, jrey@linux.ibm.com, 
 richard.purdie@linuxfoundation.org, ed.tanous@intel.com, 
 vishwa <vishwa@linux.vnet.ibm.com>
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

Hello all,

Here are the GUI design proposals for changing expired password
screens on the existing login page.

Users would interact with these designs when:
- attempting to login with an expired password
- on the first login, using the initial password created by the BMC
(to accommodate for the CA law)

Prototype: https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319247221_1_Login____existingBrand

GitHub Issue:
https://github.com/openbmc/phosphor-webui/issues/94

As a reminder, at this time these are static images with hotspots (not
coded yet). Use the right and left arrow keyboard to navigate through
the mockups. To comment, click on the bottom right of the screen where
it says '# Comments'. Also, feel free to leave comments and questions
on the issue.

Looking forward to your feedback,
Jandra Aranguren
