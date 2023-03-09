Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BE96B2901
	for <lists+openbmc@lfdr.de>; Thu,  9 Mar 2023 16:43:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXYP019xGz3cfj
	for <lists+openbmc@lfdr.de>; Fri, 10 Mar 2023 02:43:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RJvTCUc7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com; envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RJvTCUc7;
	dkim-atps=neutral
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXYNN59b4z3cMl
	for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2023 02:42:43 +1100 (AEDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-17683b570b8so2667049fac.13
        for <openbmc@lists.ozlabs.org>; Thu, 09 Mar 2023 07:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678376557;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5zQFS5cFr+NLR3byA/JJjnwldV4L2/Devk6frpZIsz8=;
        b=RJvTCUc76WYItSW+mZEKsixTvkI9O7rERR+ezFfKK7ZLKpB06r4YR73ZsU2tA8pNUQ
         /Bk7Vo/5ICBreDcnA6O6Dcvn0ZH984IoSuxLqrjSxTYiefn58Q0KJOUCrd/WCCkleG6e
         nHPQIb5zaW1RuCm/j2+lGlHtw2K7Lww8RAzT+jNoorTbLF0/+y0lFZaHAsS4RiUjvp6c
         GSxlM/M3vqnrrucTcXD+hyh077CYo5Wynx0QO6rHJnPHN7rzd2CkIOP8MGbLcTASx6qm
         CH38D2/lwMVCUbebf5kkywVUZaUnTGl48GoKZ4OYZN3wA8QJHra4qSgJQbCmruuKahls
         MQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678376557;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5zQFS5cFr+NLR3byA/JJjnwldV4L2/Devk6frpZIsz8=;
        b=UOfXfSsuLzrTWwwjZONhrLN7Uy4ZXMQULkrO5KvFt8zazUy5NLlFOu6GNnXJCSxTgG
         Ph04uOz0CY6yaTqUWUXrymxLae5SSxZdKP1FytAUzceSxMBOkaViwJz6cpUYNZU95mb4
         sWM86YOf1xmltoWZHOWZbxyxHGkUy+Gi6PEg/N2/fKgrWsPkYLvN6LV6VrxzUQGPBYtI
         e6pkB5Y3KRaoV2/7T/oK4A0EUW7oOe04xlJRnjTgXXmlOSw4vn4Jm1b4eo6QlQobN1l3
         zwzQToRxJhvrJ+9/hGLQ7pkRk/KCkmODIaYqs1dcKtnx7PAhPJmC+XVg1mgEM4aVm8TW
         ZWMA==
X-Gm-Message-State: AO0yUKWSGq4XdY6JEd/xP+COmb9pKSqooWaGGA4Z+fb87aLhnwvPNJvT
	/00B9Cyq8AB2CU70JIqzYKBcOCbNVlM=
X-Google-Smtp-Source: AK7set+F6gbBd5NxS5H9EKCxL4IaoLaay2zNkk08ApZsi695XTsMT2jUV+piy3ins/Vbr2oJMQDAiw==
X-Received: by 2002:a05:6870:819e:b0:172:55cf:f6cc with SMTP id k30-20020a056870819e00b0017255cff6ccmr12275678oae.51.1678376557685;
        Thu, 09 Mar 2023 07:42:37 -0800 (PST)
Received: from smtpclient.apple ([2600:1700:5d10:ed10:45fa:5429:7762:214f])
        by smtp.gmail.com with ESMTPSA id g2-20020a056870c38200b0017703b8a5f8sm2751690oao.49.2023.03.09.07.42.37
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Mar 2023 07:42:37 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Education session on phosphor-state-manager and systemd
Message-Id: <80E0032B-8AA7-4600-A866-7FD589FF97FB@gmail.com>
Date: Thu, 9 Mar 2023 09:42:36 -0600
To: OpenBMC List <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
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

I=E2=80=99ll be doing an education session on PSM and systemd next =
Wednesday the 15th at 10:30-11:30am Central time.

Patrick will be helping to record it so it=E2=80=99ll be available =
offline for those that can=E2=80=99t make it.

We=E2=80=99ll be doing it in the General discord voice channel, all are =
welcome.

Andrew=
