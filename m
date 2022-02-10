Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 707B24B1734
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 21:45:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jvpfk0CmVz3bcS
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 07:45:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U1egvXID;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=U1egvXID; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvpfF1bYXz3bWG
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 07:45:08 +1100 (AEDT)
Received: by mail-oi1-x22b.google.com with SMTP id m10so7356125oie.2
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 12:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:date:subject:message-id
 :to; bh=K3lGXBGGAILmX42z4zHKEbENasQw84mJJbfkiuEvS7g=;
 b=U1egvXIDwynq2zhn2eF9C3QRF6rbaS7HZFI+E7az0GGtAdXn0aUiqaw3Q4F8fbR2ez
 yCrxH2dCuT7XdOPi67n34rEhKTMQjYjhu7IJXw9+bhmAi7zsgDAsfQBWbfm1bB+dx+Ik
 BXXPT0dLI8mPpkimqI/DJVa5kbP8WquM49gKrFO7zjrOneW6Z92PXyJeWHe2fTrm+t0V
 DYVXN6Kfv5OZB50SUHNlJS9iYCK8o6hJ3SQuvSR7Y27Oc6GGT+nLc/2cWA7atzVe7/6n
 GB6wDgzNVLxJ0zAbjg340HWN59Wfydp7KQImybeE+ib9b3IBoylQIbKo5y1N9ioDyKmV
 A5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
 :subject:message-id:to;
 bh=K3lGXBGGAILmX42z4zHKEbENasQw84mJJbfkiuEvS7g=;
 b=xlOdqXA+jdImdOaTitrF6Qzbz5jFH1NRmQfGT4n+AyZg9eNHTlN6EG3ihartcVG8Jd
 9Rqoczl4/a0OZDReXWLt6UCcQ3Yj+MxnTX7kUJdo3owKqzXHzuLaiwNrlVi/ffPW7bRZ
 GOiFFsyD869ahG48GHZgxIuz78Hb4Avi44T0KwpAGRGjf5rafghcGXw8N43wPGXO7Jyl
 tzWeMnCkeukgDvMfPjr0YRNaFH7BWl5+uGQ3kS4YOjWx9k9i60V5QN9/B/QbXX/C7/hJ
 CmjqkTqXGcrGfN2CyqCPtxOv7yw6mfSSbx4cdojQ/A7f2P5WDgCJa384sIF6nQZ3ys54
 exfw==
X-Gm-Message-State: AOAM5339wkDcuEYuVJrCc1O3e5Rngg4XUVY1o/tLRf+L2+9fdxkhB7Kd
 +l5SKhYP/BTbWcZQxVTYXRwbiKsdLt7YRw==
X-Google-Smtp-Source: ABdhPJzSdmnEcMtBtD4RYQkf9AM4qJMnv46J9rF6bLLPmQLefuFTWJ7B22jVikNgweYzxf8JB0ubyA==
X-Received: by 2002:a05:6808:3014:: with SMTP id
 ay20mr1869201oib.257.1644525905173; 
 Thu, 10 Feb 2022 12:45:05 -0800 (PST)
Received: from smtpclient.apple ([2600:100e:b06e:39d8:445d:312:6662:4d1b])
 by smtp.gmail.com with ESMTPSA id q8sm8629251oiw.12.2022.02.10.12.45.04
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 12:45:04 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 10 Feb 2022 13:45:03 -0700
Subject: meta-phosphor/sensors and phosphor-power/phosphor-regulators
 compatibility 
Message-Id: <CEA51A0E-5ADB-41AC-BD2A-80319CD0E6D8@gmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
X-Mailer: iPad Mail (19C56)
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

I think meta-phosphor/sensors and phosphor-power/phosphor-regulators interfe=
re with each other.

When I power on chassis, journalctl shows errors from phosphor-regulators sa=
ying the device or resource is busy and mentions the correct i2c. It stops t=
rying after a few attempts. Looking at the code, I see that phosphor-regulat=
ors is using /dev/i2c.

At the time of chassis on, the i2c has traffic on the bus, from sensors.

Is there a way to make these play nice?

Mike

Sent from my iPad=
