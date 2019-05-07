Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E0915DAD
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 08:47:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yqsf5S10zDqLS
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 16:47:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=chou.brad@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Cx0vjDf6"; 
 dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yqrj4MLZzDqHX
 for <openbmc@lists.ozlabs.org>; Tue,  7 May 2019 16:46:29 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id e24so8110545pfi.12
 for <openbmc@lists.ozlabs.org>; Mon, 06 May 2019 23:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=9ISMuwSdWMls3TCuyd85KH4z7yMOd3cb9DnF2a9MIDg=;
 b=Cx0vjDf6vZh71odlDcrjSlThxu070rvMmSau8I+A++R8DyyM47CFVnGK/c9islHgQ5
 tB0eto+P5VNkBcrRJurwN7UkCnY7zXx8/eILPGwjszyi6rjNWTq66tZ9LCWBG3jF9XmJ
 SAYxmHDslJbLy42KKpbW86tWaamboG3i4e/2EELjbP4QTaCso1IcPo0YYFx6wXPlFYUW
 wDpy7mPUhYxxbIbQHOqrL08JRc64CM0EZ8GIg7zzYDSD4wzg4XEybPeYd8dAxx6TgZLp
 yovdRMAid6uyFY4sghbXdiONiuYZ/c4uFjK7RvVkwv2CDvkZLU13qF9LCpEj67Ff+n1Y
 S3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=9ISMuwSdWMls3TCuyd85KH4z7yMOd3cb9DnF2a9MIDg=;
 b=pZgoQ4EQpXHle6A0VzaYj/EoWSspJTq/JsDhxP7lEXxP1yy/qp2mgGDBCGx5taF/N7
 Y1UXmkXh+k9+nNN6dQPRkpUKaRNlaJxnlPpLQpnQg8Cpf6d0arM4wIyHY0+bsQewhel8
 r/3aFTh0va/cwvZ1njcTrR4vbAwJgLntL+KTogJwG1nIq0N8pr+jW9d7V4ce3C8CyQXr
 lLhx64tX4Y4q1PYzV/hWjECynRbT4ts8khlUQm4oCaQ5hMf6uTDugzuF1RKdpUfKiem4
 mgssTRnwbC1wEMuPIvF3CJjnA7siFP4pUtBXrhT0+M9C9qn/FNogAN0AuadVlJ8vPqIb
 /hQg==
X-Gm-Message-State: APjAAAW0MI7TjJNrvlZ6X/1sn+oeW5Iy2zAruKMYrgloIqsrPHUKE//z
 2XLIsaKAmyGDuwywBYkeKfrLmoLf
X-Google-Smtp-Source: APXvYqyGb5jzwuoN2ylXZGHwDNf8BacCX1FZv8IOkYEy0H8ELO7qtnonU6IDyuEuy2I0wCsFh9Ng2A==
X-Received: by 2002:a63:b507:: with SMTP id y7mr37639738pge.237.1557211586446; 
 Mon, 06 May 2019 23:46:26 -0700 (PDT)
Received: from [192.168.1.2] ([220.130.36.2])
 by smtp.gmail.com with ESMTPSA id u7sm16226947pfu.157.2019.05.06.23.46.24
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 23:46:25 -0700 (PDT)
From: Brad Chou <chou.brad@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: How to set GPIOs to pre-defined value
Message-Id: <365A980B-9730-411A-A91B-EB0A97026D95@gmail.com>
Date: Tue, 7 May 2019 14:46:22 +0800
To: openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3445.9.1)
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

Hi All,
Is there a way to set ALL GPIOs to a pre-defined initial in/out =
direction and high/low value ?
I see there is a gpio_defs.json, but seems only the direction can be =
set, ie. In or out, not high / low settings.
Now, I am using a shell script with gpioset utility to do the job.
But I know using shell to do it is a bad idea.
Does anyone have better ideas ?

Thanks.=
