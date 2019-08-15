Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA0E8E238
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 02:57:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4687N51hsbzDql8
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 10:57:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vz/xVhtJ"; 
 dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4687BD0X1gzDqmF
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 10:49:07 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id p3so474159pgb.9
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 17:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=LkNBZMG16tcflFHB1/bONqFd+DaM+XCQskcJF8JxKQc=;
 b=vz/xVhtJZRn0cd4WorQ06yJeLptBd+ZcaoNrTeCk3NZedIRp4R8itSDfBnPWRj6L2W
 6BxRfs41nygTXuj+y2rv9sdSGFHDs2XPAUVI1j59oc7MfRnsLSKmPeyRNz5hksM7C8my
 h/eI10WVPRGFUSee7j2ZC8OlIPyHrj33V6HB/wl3Xet+NAohgVhdP8U3O8ERsGXYf+AZ
 Jhip7B0tc/IJ6Cf15Knu4v+tm8SoiNxs5A4M+TWYNLnQcug7CBmuOqqvw8FpSd4ciekb
 xmpYggeuSUQ+lLZ3lteQY2CX9P9X3NEC4XZIAlEPiSnwVa8SHr/c2fxVyMlIA7WTxuWD
 WaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=LkNBZMG16tcflFHB1/bONqFd+DaM+XCQskcJF8JxKQc=;
 b=RYyAe6/ZA0QbBj6KnTkuLz20xdccfBfkQtnEnqySjEosOJG0dZjsYIdRE6pxh829Iz
 /EsiYFcEjxMl7e59Dy6Aval9V7rZ+zzxYn9XLyfqqDXY8ZZvrES/URrTHlgvMftCQQWE
 GjOBlnuRbfXfp9IyMoO4sz1KCc6tB0nHABzG4xI3wiNLzGuKKDtLG3YaAjCN6fBu8MYS
 9zS8BvNImYMfltUlSSrCRjKwDKzda9GsRn3VAs1t7g5W/YO/5nAFv2nPowoSzSBaeqv3
 B4OiDUJYbG3IjDvBd6IRWCOKeNmqQ/owz+OZ68qj1xNdHUrgT7j9KxLFm05m4CH3SdoZ
 GiCw==
X-Gm-Message-State: APjAAAVSUOxGQtVetLtN/bzFvfyk0bYQcTPy0O5QMV7lWmihhR1kW+88
 kGBcm6Tltx0Oeb8UeuBhydIIUesHrQb+MLy9/xf7Xg==
X-Google-Smtp-Source: APXvYqydoSW77CnizHDALmSN9RCHptB3Zzu4MrzhwwE2DDxS6AsIMyQ91GeAbxkvMvKhS92M5DDwF1NoMspZ5cwlwxg=
X-Received: by 2002:a63:2784:: with SMTP id n126mr1493168pgn.92.1565830143963; 
 Wed, 14 Aug 2019 17:49:03 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 14 Aug 2019 17:48:52 -0700
Message-ID: <CAO=notzZQ4La6sUWYsDqFsbtXV_A4EhdsUA7iTsouxZMsm+bqQ@mail.gmail.com>
Subject: unexpected configuration output given examples
To: James Feist <james.feist@linux.intel.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When hard-coding bus and addresses, I ran into an interesting issue.
Previously, my sensors were dynamically bus'd with hard-coded
addresses, like:

{
    "Exposes": [
        {
            "Address": "0x1c",
            "Bus": "$bus",
            "Name": "$bus board local",
            "Name1": "$bus board external",
            "Type": "TMP441"
        },
...
}

Leads to:
xyz.openbmc_project.Configuration.TMP441 interface -         -                 -
.Address                                 property  t         28
        emits-change
.Bus                                     property  t         20
        emits-change

Which is great.

But:
{
    "Exposes": [
        {
           "Address": "0x54",
           "Bus": 15,
           "Name": "$bus i2cool 0",
           "Type": "MAX31725"
        },
...
}

Leads to:
xyz.openbmc_project.Configuration.MAX31725 interface -         -               -
.Address                                   property  s         "0x54"
        emits-change
.Bus                                       property  t         15
        emits-change


Which crashes the hwmon temp program because it's "getting" a uint64_t
and not a string.

My only caveat worthwhile is that the hwmon instance is already
present because that sensor is in the device-tree.  So I would expect
it to only fail on the export.

Note, I did also try "Address" as an int and not a string, but that
then failed the json validation.

Thanks,
Patrick
