Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D03D2525C4
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 05:23:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bbrmd1YsczDqYk
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 13:23:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=ztai@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=CSKzem+h; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bbrlr1rvwzDqXq
 for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2020 13:22:57 +1000 (AEST)
Received: by mail-ot1-x331.google.com with SMTP id 5so371698otp.12
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 20:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=in1E06neB+ZzElb4QHRhfs3oxnIiENgk2riVptlcQMw=;
 b=CSKzem+hgfK1xrxkF1AaSPubiZoIhZTzGmhAX7B5KH7kg0BQYyVSixxOqQ4d5ESm5H
 VKvg7Igv566vrCsZUsYB6ivSGZLbkkWkrmJ4pC2E43rGUFhuA6Ya3ZsB2WtE8HLkdO9s
 VAA73FmMEsBW38J6zzKThSraMy4l1/IrR7xgB59KnD7SBIU7eBh0+lMfgBdXoKboVHtY
 kidkTpcdCkbpU49k1UMavriMjlUvvYzWQiwfsz7Kp6h3ING8KdQTpR0U/BcNiJpJqlnI
 79gbao4gOOIUzgVePB5vH7oOmNLOVLJVEKUW8PlqPgW0Wrqg6nLGsWpiosI2DJlwEzS+
 YRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=in1E06neB+ZzElb4QHRhfs3oxnIiENgk2riVptlcQMw=;
 b=gLmRZ/Z8D/MdhQrS7H+8eTN4QWTmYQeOHs5PtU+c1VkgqTqcMsyDRkRweJ/JcpeZqx
 0h2DnJiibdVeLx9pKYlG1u7AT/TtpwLf7qqD7O9CGakOYZ4Kjx5pOHZvKxFjC1ZbptXA
 s/wWi8z7bmJFH2FrRASO2CWNWnIspyk2/ttkGnaToor3M91r8hoMnV7c4MJf2yOtmME/
 R0qkM+FuhjBi9x5ITi0Bwo2QVxOf9t6iwMquhqREF84+AhIZJaR/Q9oLwqI3BTB5Kp41
 DjTSfQnOy0DdbGDUq4IEvJuz06r01EqaRwdgKjKJOu9wmka6agzhsE8LQ7d5cDx73lAC
 kOEA==
X-Gm-Message-State: AOAM531BRx1FywulyPSRZHL2rOXM8OnZML+dKNxzxPKoewpc38WTy1iS
 muADRg2gOrTz62RBuN3q8Mzkxq9MsrViV7MUvQtPu3IkgxK6KA==
X-Google-Smtp-Source: ABdhPJyAfeGyTzaicn2RyBHiXRh5BLBEXkiwND8/lHQPwunYrNgptGNxzwipj5zCRd+Z1e6tFmejHZCd6UWQESUw9gs=
X-Received: by 2002:a9d:2f23:: with SMTP id h32mr9172815otb.334.1598412173641; 
 Tue, 25 Aug 2020 20:22:53 -0700 (PDT)
MIME-Version: 1.0
From: Zhenfei Tai <ztai@google.com>
Date: Tue, 25 Aug 2020 20:22:43 -0700
Message-ID: <CAMXw96MQ-=Ftc5HjNThKd8A6X0hdBdjC43d6RJfzyDoN+b=7YQ@mail.gmail.com>
Subject: Seek feedback: BMC console and debug info
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000d0db2005adbf5555"
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

--000000000000d0db2005adbf5555
Content-Type: text/plain; charset="UTF-8"

Hi,

We have worked with our vendor on a system that provides console and debug
information, which can be useful in times of debugging BMC issues.

On a high level, we use obmc-console
<https://github.com/openbmc/obmc-console> and phosphor-debug-collector
<https://github.com/openbmc/phosphor-debug-collector> to collect data.

   - obmc-console: We collect console inputs from the *host* and save to
   local log files (max 8 files of 1 MB size with rotation.)
   - phosphor-debug-collector: We run this process on the BMC with no
   modification.

For the interface, the data is exposed via bmcweb where there are a pair of
URIs for console inputs and debug collector respectively.
e.g.

   - /redfish/v1/Systems/system/LogServices/Console -- Enable/disable
   console inputs data collection.
   - /redfish/v1/Systems/system/LogServices/ConsoleDownload -- Download the
   log files in a zipped file.

It will be great if we can get some feedback on whether the community finds
such a system useful and advice to improve the design.

Thanks,
Zhenfei

--000000000000d0db2005adbf5555
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><div><br></div><div>We have worked with our vendor =
on a system that provides console and debug information, which can be usefu=
l in times of debugging BMC issues.=C2=A0</div><div><br></div><div>On a hig=
h level, we use=C2=A0<a href=3D"https://github.com/openbmc/obmc-console">ob=
mc-console</a> and=C2=A0<a href=3D"https://github.com/openbmc/phosphor-debu=
g-collector">phosphor-debug-collector</a> to collect data.</div><div><ul><l=
i>obmc-console: We collect console inputs from the <i>host</i> and save to =
local log files (max 8 files of 1 MB size with rotation.)</li><li>phosphor-=
debug-collector: We run this process on the BMC with no modification.</li><=
/ul></div><div>For the interface, the data is exposed via bmcweb where ther=
e are a pair of URIs for console inputs and debug collector respectively.</=
div><div>e.g.</div><ul><li>/redfish/v1/Systems/system/LogServices/Console -=
- Enable/disable console inputs data collection.=C2=A0</li><li>/redfish/v1/=
Systems/system/LogServices/ConsoleDownload -- Download the log files in a z=
ipped file.</li></ul><div><div></div><div>It will be great if we can get so=
me feedback on whether the community finds such a system useful and advice =
to improve the design.</div></div><div><br></div><div>Thanks,</div><div>Zhe=
nfei</div></div>

--000000000000d0db2005adbf5555--
