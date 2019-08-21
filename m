Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FE298780
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 00:48:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DN9c3b64zDqQf
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 08:48:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lXtBS+tr"; 
 dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DN8x3jVfzDqNZ
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 08:47:43 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d3so2178388plr.1
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 15:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=7NC2BdCpYTcO/IxhRFk+SyxTia/EASsZwZM8vZicr2o=;
 b=lXtBS+trhfF6A6bkn53u7GmG3zuuwf5g0np7Pawx7TAFTjgOht1QM/RASyBWrEnEmP
 Oe4YT4u2hnPa3SYahmSyzJEoolb6mvlHSLmrCGG82amZafnxoNLoKSVS2OPWtIpPgG/g
 EdyyDxNLHtzD/1W6L3DM7XGABlsPSX66rkyG+cLzG0oDuvZMlAEf0CY9DyFz8+tlM3Oi
 U7YB1I4ngcZQ9K3mHZcgczOAeWBiytuvQl5aJS44+IUxVKmKdcpUN+G7avs9LTeR4MMU
 YtpzT6EynoMcdlKxuLSAbtjkx/+01luvUN0gwyMaMc42fTelh7uNRS/rQOn4n86Nozkb
 uDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=7NC2BdCpYTcO/IxhRFk+SyxTia/EASsZwZM8vZicr2o=;
 b=tGMBjfFfVfnTWuHXi0VPgajHcfhSSjowpqdqo2ID54HeWXnECdNtj2Rx57HWUQTld2
 LKjpGB6dEFBITl6QNHofCR6LSsV+RX0NzPmtpAaKEBDEra98acfwamRND778LU9lmleG
 r3Q+o6Trqv0SbqvWMoeLg7H4BI7BLKHaGVezojwRi73z1jeupaeA88z2SKXPBOPIo0tx
 +flTb5ZKUI8W8ioQL7s00NkHfUiQUwo7b0RzCmcsqiocwUgEmySBKW0DMd3ocryBGyWD
 gxxxOlkqXQHduZKxVNgrkqs2TJd7ZKU3qHpQ/QyYUmYa2vRGYNkuVgoXThpIkRIcxMHu
 iUVQ==
X-Gm-Message-State: APjAAAVxgbP2nePyAAM+3+5zATs+Hrh6Rp8jXctgafUk2Ypjs+kSbliF
 htfVgqkndH1K0/FI5B9hsaSPmU98nyk05bAk7skYZw==
X-Google-Smtp-Source: APXvYqyCqrtEsJldX0yZJI+pTOBsdyufUbhnFGmm7VhLaFo8DubldQl3WIMzWMgt5ww0vV2EBw2cF9S0S7TV7UbfLXU=
X-Received: by 2002:a17:902:a9c3:: with SMTP id
 b3mr35858836plr.179.1566427659704; 
 Wed, 21 Aug 2019 15:47:39 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 21 Aug 2019 15:47:28 -0700
Message-ID: <CAO=notwjUWqOjBt7oRQpr7F95yANHT_SicGz-XVSXDPYNywKfw@mail.gmail.com>
Subject: psu code mgmt
To: Lei YU <mine260309@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Lei Yu;

I wanted to ask about the psu-code-mgmt, will it be exposing dbus
interfaces similarly to bmc-code-mgmt (I think I see that it is).  I
wanted to confirm that we could write a simple handler or type for
talking to psu-code-mgmt from phosphor-ipmi-flash.  Today I wrote a
guide on how to do part of that --
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-flash/+/24606

We'd add something like:

[{
    "blob": "/flash/psu",
    "handler": { "type": "file", "path": "/tmp/psu-firmware" },
    "actions": {
        "preparation": {
            "type": "systemd",
            "unit": "phosphor-ipmi-flash-psu-prepare.target"
        },
        "verification": { "type": "psuSystemdVerification" },
        "update": { "type": "psuSystemdActivation" }
    }
}]

So then if we implement a psuSystemdVerification and
psuSystemdActivation, those can all the things you expect and stage
the file where you expect, etc.

Patrick
