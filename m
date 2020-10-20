Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF5F2940B3
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 18:42:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFzv06VXjzDqfb
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 03:42:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12d;
 helo=mail-il1-x12d.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AofZsQy/; dkim-atps=neutral
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFzt33HNxzDqXX
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 03:41:45 +1100 (AEDT)
Received: by mail-il1-x12d.google.com with SMTP id t12so3186610ilh.3
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 09:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=fFcRI2LPQr1AnIaRkCckT88wKq10cMu9OQjcmp3LATk=;
 b=AofZsQy/uwhO5q+gryMdGB/o8HxxhxlWS1Mh0IPLIVxHCLSJKxxhvHL6+SM+IqAbCK
 yM0HKZAkJYpqt2u4/u5apb2dRgwhXtFLaPaBfIhm63wZojoSzAvyhA0bbRdrKc0M0AoL
 5s65fEK7ab77xmd8jQ6hBbA5WXENMIURnrBQkMFe8e4GzlUoMPNIhA4MBOCHDyGODGCn
 NQSSIdWo37btfplAMnsba+OBq8AdvpyiY5R+RgnR19RgvAtGZUWvFicugTM1wElyV+yx
 JOzPaOXFTvseVEB7IILCoXTJYeFDVIVyRwVDd3/UxEWvhDUkmsJ3lO+djyW0k97X9iZV
 kcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fFcRI2LPQr1AnIaRkCckT88wKq10cMu9OQjcmp3LATk=;
 b=eZqhOTsAetE/yaqxfFr6xvdbSAZM95+1gA3sUsSNPuxhctAxKK+riLYw6wj4wIXFUx
 NEekPP4nrALZuXq7BRrIkfN3aKcg8PPoOdCdfzW1PTUxTazy7nJuSuPDK8uWHhO8u6jP
 FhWPIpfA9qNAOKhYv5VTO70MRHseCccuPWgpcIrbWLaNmE+Sy/KEuDl0kVG3UcVtJ6Hw
 95QdCMEXgT/VWn6y0QmSZVgUNALHfTjM4ewG5jj54xdyLu7KgQB8Ieno4e2xAOu3acka
 V4QjfGXnj+uzjFxLNkSXRdhrNWhSbtB+ksiZsDA4XHONITjrjCDRJ4LFm6ZYTaQGzwab
 /ahA==
X-Gm-Message-State: AOAM5301GzsDV2NrMeOH5c8jE5Y+RVYD21oz1Ow3qkcG/l2cMU23Tidv
 CBnDB/HViyWxwkDVkYvvlrbP4QaIc2cq3hG1XjZAdrCsJ0g=
X-Google-Smtp-Source: ABdhPJybSRULL9i5e8/Pyh0hZPb82UmCEneeg0e9DtayX9R6LesJcPMc0CTPM0gxpN8LLls1eQrC3TDZQQUb7IPUveg=
X-Received: by 2002:a92:d906:: with SMTP id s6mr2708859iln.225.1603212100925; 
 Tue, 20 Oct 2020 09:41:40 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?0JrQvtC90YHRgtCw0L3RgtC40L0g0JDQu9Cw0LTRi9GI0LXQsg==?=
 <aladyshev22@gmail.com>
Date: Tue, 20 Oct 2020 19:41:30 +0300
Message-ID: <CACSj6VVJjwvu7+sF+wUWvTv4sBetBGOAGrxT8ewit2PO7Nh0jQ@mail.gmail.com>
Subject: IPMI boot flags
To: openbmc@lists.ozlabs.org
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

Hello!
What is the initial state of IPMI boot flags? (IPMI spec, pdf page
422: https://www.intel.ru/content/www/ru/ru/products/docs/servers/ipmi/ipmi-second-gen-interface-spec-v2-rev1-1.html)
This corresponds to <Get System Boot Options> chassis function
("ipmiChassisGetSysBootOptions" with "bootOptionParameter=bootFlags":
https://github.com/openbmc/phosphor-host-ipmid/blob/master/chassishandler.cpp).
I don't see any JSON control for boot flag values. And they contain
some important information as Legacy vs EFI boot.

Best regards,
Konstantin Aladyshev
