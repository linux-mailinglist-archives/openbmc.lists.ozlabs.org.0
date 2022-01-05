Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72284485715
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 18:10:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTbZb2m9Jz302S
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 04:09:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iMAsjsDL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232;
 helo=mail-oi1-x232.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=iMAsjsDL; dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTbZ85r7Kz2xXV
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jan 2022 04:09:34 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id w80so27057640oie.9
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jan 2022 09:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:date:subject:message-id
 :to; bh=RxO5/lj2/NxM7YPPCq5TJG+Xt4xb7TgJms8ahfMBHA8=;
 b=iMAsjsDLVrKAGiobSzZ0j0cikPIMQexsRXm9S+7eJbYx9djux/gRZozwMJ2RiV2lbz
 Q2b7pzwr/0hWZcAEHkHK5/bRRREgJIP3KK5JViJc2WWD0JCjsiCLaJ8lKzSuQudThD0n
 0nLirxLpp5K0s32MoeVyNINwfXQjwEyhLmnaTc9eOx6J8yoH7zM4e0S5MSX0No6+qzrh
 CP6rQpajG+KbBdYTTFXf+aZCtJyZlVaLpTtSgvC7+BoInVByN7OfnMUW5ZBMHYilX5T2
 mKezTcFg3QzUaTaR9qdfj5Hs2H5HwzfiHlOdsNzI8/gAwynA3WtCnwW6S7A038FxA3uC
 FL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
 :subject:message-id:to;
 bh=RxO5/lj2/NxM7YPPCq5TJG+Xt4xb7TgJms8ahfMBHA8=;
 b=4m51bXofydcFTUZHHUFY+9eVet8DGuY1SFzYdp6OyFvr0pWnbkBxEykakeFwdzX7Gx
 0RqJj5gDPkqHkKxVwUmsU8jpU4VPfK+BnhR9ohCJYRytWX4TWGYenRwm0U/Q33inhZJj
 Qk9QsdWHkcABTL1nV5QiABalhG/APNOzO1AkqmNNzKVHXq9srAAplTwDgR4NnU7GHs6u
 i5hQsnptU8zyLS8ERnN1fekDS77qZn4qQ+i0C6e5a8o7uOJHfa+jxw8F2SxgBvF8DCeA
 hc7bJ1MEnTsKWpHenUcNj4f4lrmGDbyjcP1gs33i/fCEfYc2ai5da+g6FvBc4S1rVHqH
 Wl0w==
X-Gm-Message-State: AOAM5334d1BIMmXfXfG7svyATKE+Za1r3VDsQYk9A6yEZWvSa2XweaSw
 7spD+PH8m8YceSxgr3L2932npc6SeEw=
X-Google-Smtp-Source: ABdhPJw6V4tcwz5XWIIiMygRLpKaDD6vtM7AJ1bYzrc/ld8XoMS/rMUYn5WYIr05gxzzmQGSSUnnvQ==
X-Received: by 2002:aca:5cc2:: with SMTP id q185mr3368598oib.74.1641402571155; 
 Wed, 05 Jan 2022 09:09:31 -0800 (PST)
Received: from smtpclient.apple ([2600:100e:b014:fd43:d40d:d2c4:9548:bd2b])
 by smtp.gmail.com with ESMTPSA id x13sm8255619oof.19.2022.01.05.09.09.30
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 09:09:30 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 5 Jan 2022 10:09:29 -0700
Subject: Sensor Whitelist
Message-Id: <9F164585-0D50-47A9-AE4C-54695769F02B@gmail.com>
To: openbmc@lists.ozlabs.org
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

I=E2=80=99m getting an error from psusensor saying my driver is not found in=
 sensor whitelist.

What defines this whitelist?

Note that the driver name is ltc3888, which is part of hwmon module ltc2978.=
 In case the white listed name must refer to the module name instead of the d=
river name the module supports.

Also, I have not added this sensor to ipmi, but I am also using adm1278 with=
out ipmi and it works. But in that case, the driver and module names are the=
 same.

I searched for answers and found little. Perhaps there are docs but I am sea=
rching for the wrong key words.

Mike

Sent from my iPad=
