Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FFF3921AB
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 22:51:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fr35Z3pvFz2ylk
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 06:51:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=K1PzTszN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=K1PzTszN; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fr34r6VDqz2xtl
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 06:50:51 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so1024851pjp.4
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 13:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=/qBBLq71HTVNOHIzBuBGbByXoUhYvz9vr+dyxmGWymI=;
 b=K1PzTszNBxft9X+VgpPkTKADZTm5BIeZ32miQpVaexJUlU2zLK3RzmlUXROKGZD1Ny
 Pg1b9N8JGDTBzgDxc6QKfCgtktIaiuWFjsKYeZvhxXBTZsZni4lJ0ISlXWebdX16ZdRo
 nAB7OAseBsWvQnsRuVr22Zq39YJ8/DqSnqsqZJTm7IH04yuxKwNNSN9+vKdpq4/fYIvc
 0mCXSIxUt9UsBEObfk0xasQc3kJuSsKmsKtTjZ09OIMofRBeVuHLr1CqWnMKfYNBTeiz
 ChshLQtjkWoT+82dotky0AOzpAuko5TdZzbDQCK28reR8RaP2bPSu4Qdxq2Ms50cMqcY
 Yvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=/qBBLq71HTVNOHIzBuBGbByXoUhYvz9vr+dyxmGWymI=;
 b=prtNSCgHYdRHJgK2hcE6DyF0GtQLuZjtBWjvwwCrSoIK43+C+7anl4RByHL47TO0h+
 q6Ej7vkdwVeBEKMgJtzBLU0sfpPIw2hPRDNphv2wr5CI1jO9lFGfJYv88V/nlct4/gQX
 /Ty+gBggtB9sY8k62mVyNCNFdkK66VIf8wsRp3tLrB+Nx6XaBzUv6WxiFobi9ISuxhHP
 zxxaW1xEP8hF6rDrhmMYOHl0CJtwwROZEF3sOWhHngwibWHICagX8x5pCqtCYFVR3tDu
 BLFlUMCl5D4hjNV+1Bh1Kjidklg19G69vn3fHC+EfblB9JhE3yzvQFs+0T5T+lBDe3rR
 ToIA==
X-Gm-Message-State: AOAM531F3Y2DKucWQOhZvPbpEmCaDg8KDkNUmEox1U+F09xDnX/L5cIc
 D7cWlPo7Pf7rCUTK+YwKwB61HwueQEr6VxKMGeoSYYEhJqn+hQ==
X-Google-Smtp-Source: ABdhPJytLOwDc3b0CHigVmMhdy6Y5232TgmoJQWAo8G8zMMzejhlcc+dXaTsidBHwUfjO/y+CsvYRM3UrbcBdLME3Ug=
X-Received: by 2002:a17:90a:5288:: with SMTP id
 w8mr5780656pjh.170.1622062247376; 
 Wed, 26 May 2021 13:50:47 -0700 (PDT)
MIME-Version: 1.0
From: Willy Tu <wltu@google.com>
Date: Wed, 26 May 2021 13:50:36 -0700
Message-ID: <CAHwn2XnqABuyc3uMQDs+YgwYJL+yKLwCYn1myOVdZ=gkhw3L-A@mail.gmail.com>
Subject: [bmcweb] Device Level Logging Services
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000000f50ee05c341cc43"
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
Cc: Ed Tanous <edtanous@google.com>, Derek Chan <dchanman@google.com>,
 Nan Zhou <nanzhou@google.com>, Rui Zhang <ruizhan@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000f50ee05c341cc43
Content-Type: text/plain; charset="UTF-8"

Hi all,

Main discussion:
https://lore.kernel.org/openbmc/CAHwn2XknKWyv6Bsq48tkvA52rHKZRFoEJgUuZUmMj6uZb584JQ@mail.gmail.com/
(a
bit outdated)

This will be a sub-thread about logging services that will be used to
support Drive (and could support others).

For bmcweb, I am wondering if we can support custom logging services other
than the static ones that we have in
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/log_services.hpp
.

I am thinking about supporting custom log service at a device level that
can be exported by different hardwares log entries that are more specific.
Then at each device resource can link  the Status.Condition to
the LogEntries.

Initial Idea,

For example, I want to have log entries for Drive devices.

ComputerSystemId could still be system or bmc and the Redfish endpoint will
be something like.

```
/redfish/v1/Systems/system/LogServices/Drive0LogService/Entries
```

On the D-bus side, the service exporting the log can add log entry
<https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Logging/Entry.interface.yaml>
 under.

We can have
```
/xyz/openbmc_project/logging/device/drive_0
|__/xyz/openbmc_project/logging/device/drive_0/entry/...
```

We can parse the `xyz.openbmc_project.ObjectMapper` at
`/xyz/openbmc_project/logging/device` with depth of 1 to get all the new
device log services and so on.

Please let me know if there are any questions about it. If no one is
against it, I'll work on implementing it.

Best,

Willy Tu




Best,

Willy Tu

--0000000000000f50ee05c341cc43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>Main discussion:=C2=A0<a href=
=3D"https://lore.kernel.org/openbmc/CAHwn2XknKWyv6Bsq48tkvA52rHKZRFoEJgUuZU=
mMj6uZb584JQ@mail.gmail.com/">https://lore.kernel.org/openbmc/CAHwn2XknKWyv=
6Bsq48tkvA52rHKZRFoEJgUuZUmMj6uZb584JQ@mail.gmail.com/</a>=C2=A0(a bit outd=
ated)</div><div><br></div><div>This will be a sub-thread about logging serv=
ices that=C2=A0will be used to support Drive (and could support others).</d=
iv><div><br></div><div>For bmcweb, I am wondering if we can support custom =
logging services other than the=C2=A0static ones that we have in=C2=A0<a hr=
ef=3D"https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/log_se=
rvices.hpp">https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/=
log_services.hpp</a>.</div><div><br></div><div>I am thinking about supporti=
ng custom log=C2=A0service at a device level that can be exported by differ=
ent hardwares log=C2=A0entries that are more specific. Then at each device =
resource can link=C2=A0 the Status.Condition to the=C2=A0LogEntries.<br></d=
iv><div><br></div><div>Initial Idea,</div><div><br></div><div>For=C2=A0exam=
ple, I want to have log entries for Drive devices.=C2=A0</div><div><br></di=
v><div>ComputerSystemId could still be system or bmc and the Redfish endpoi=
nt=C2=A0will be something like.<br></div><div><br></div><div><div>```</div>=
<div>/redfish/v1/Systems/system/LogServices/Drive0LogService/Entries<br></d=
iv><div>```</div></div><div><br></div><div>On the D-bus side, the service e=
xporting the log can add=C2=A0<a href=3D"https://github.com/openbmc/phospho=
r-dbus-interfaces/blob/master/xyz/openbmc_project/Logging/Entry.interface.y=
aml">log entry</a>=C2=A0under.</div><div><br></div><div>We can have=C2=A0</=
div><div>```</div><div>/xyz/openbmc_project/logging/device/drive_0<br></div=
><div>|__/xyz/openbmc_project/logging/device/drive_0/entry/...</div><div>``=
`</div><div><br></div><div>We can parse the `xyz.openbmc_project.ObjectMapp=
er` at `/xyz/openbmc_project/logging/device` with depth of 1 to get all the=
 new device log services and so on.</div><div><br></div><div>Please let me =
know if there are any questions about it. If no one is against it, I&#39;ll=
 work on implementing it.</div><div><br></div><div>Best,</div><div><br></di=
v><div>Willy Tu</div><div><br></div><div><br></div><div><br></div><div><br>=
</div><div>Best,</div><div><br></div><div>Willy Tu</div></div>

--0000000000000f50ee05c341cc43--
