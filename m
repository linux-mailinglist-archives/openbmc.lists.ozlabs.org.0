Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAA19C9D0
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 09:06:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H32G0RntzDq72
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 17:06:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OcNgcHca"; 
 dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H2y602KlzDqXZ
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 17:02:37 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id e20so34769935iob.9
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 00:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g7VVpbPFgBJYv/Vx29Yqrz0PZwvOcyTa2zYr69vKv8E=;
 b=OcNgcHcagZETGyfn5Mqaa/LFW2pHe259ynyzuEIwMmPevg645ClgYyTZGuiiAC9nrp
 oa4T6yLRvsAoE2VJ536DEjirF3A7LmjLy0eKV8vuCzvJnXQpXN9qFh+J2ICRTjSrMDNi
 VRo+mIyzkU+5zjnjNJTUq7N4mWcmOAao4AxHEP5A1nZJhMVdIGelDfHtxlUycs/K71aC
 a2B7M8kEt0aI8KRB0e4mYGe6W7A/YcmrgNFo+gevoL1yDJiCTmKYQPM1VMERgb5n28f6
 +P9KvYxQ5liWt17089veuIJwAXM6RHBBsE8UGkg3sXmsKPFTlfk7OAICyfYWKBROeqUz
 p1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g7VVpbPFgBJYv/Vx29Yqrz0PZwvOcyTa2zYr69vKv8E=;
 b=DE26vrAj1rIGyzI8zY/GnPUcVxxSiTDeZlw1xGscAG/FJYMrJfEfdPo9JkG1lQlso8
 R7SsTDRLgCu1pHnSIwGRGJF3DDCR2D2amz2YoJ0QEKuTJlsU0J1st5RRD3jOI04yk8/1
 XagmWSqJPL2cfObPwxsCGzMAj9QjJdegpGtFdnolmP/JtlrIiOP0i5ZmbutaZo5itM8J
 06kdaj+x5l2Iura7ZPRcQHp58PxC6lXni2FkYJSkkg0ydbBdo/W7cPlLBWGJyjKxJ9zi
 lx//qpSPIIF82wxZ2EmPgpgvBs4I7kvwpMNKTnnTSN3lCnCuAMo8PFjMv2c2+FlQ1tUM
 mPoA==
X-Gm-Message-State: APjAAAXOV9ZHPzMD4rz/JDRUJ3nqq+odgm/J/s9ZBsv2hjoU+sKvjGe1
 5/CDew8ttabZsUm3SikfjNOzp6W8JrTOo2ur49c=
X-Google-Smtp-Source: APXvYqxrvGPhft3cvWAJMdrjy3T7cL2LOrdHeCsI5APDkh9J9tzmbJLWHF0gsepUUuKRTlVMERUzKa0R6W8dwCdr9ew=
X-Received: by 2002:a05:6638:213:: with SMTP id
 e19mr15636018jaq.119.1566802953107; 
 Mon, 26 Aug 2019 00:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notwjUWqOjBt7oRQpr7F95yANHT_SicGz-XVSXDPYNywKfw@mail.gmail.com>
In-Reply-To: <CAO=notwjUWqOjBt7oRQpr7F95yANHT_SicGz-XVSXDPYNywKfw@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 26 Aug 2019 15:02:23 +0800
Message-ID: <CAARXrtnRg0xSQ8mRS6XVqHyEJXS7TobqGjdwTeoyhapRoZS59g@mail.gmail.com>
Subject: Re: psu code mgmt
To: Patrick Venture <venture@google.com>
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

On Thu, Aug 22, 2019 at 6:47 AM Patrick Venture <venture@google.com> wrote:
>
> Lei Yu;
>
> I wanted to ask about the psu-code-mgmt, will it be exposing dbus
> interfaces similarly to bmc-code-mgmt (I think I see that it is).  I

Yes, it will expose the exact same dbus interfaces as to bmc/pnor-code-mgmt,
e.g.

# /xyz/openbmc_project/software/82b2c6e0
  "data": {
    "Activation": "xyz.openbmc_project.Software.Activation.Activations.Ready",
    "ExtendedVersion": "psu-dummy1-v1.2,psu-dummy2-v2.3,psu-dummy3-v3.4",
    "Path": "/tmp/images/82b2c6e0",
    "Purpose": "xyz.openbmc_project.Software.Version.VersionPurpose.PSU",
    "RequestedActivation":
"xyz.openbmc_project.Software.Activation.RequestedActivations.None",
    "Version": "psu-dummy-test.v0.1"
  },

> wanted to confirm that we could write a simple handler or type for
> talking to psu-code-mgmt from phosphor-ipmi-flash.  Today I wrote a
> guide on how to do part of that --
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-flash/+/24606
>
> We'd add something like:
>
> [{
>     "blob": "/flash/psu",
>     "handler": { "type": "file", "path": "/tmp/psu-firmware" },
>     "actions": {
>         "preparation": {
>             "type": "systemd",
>             "unit": "phosphor-ipmi-flash-psu-prepare.target"
>         },
>         "verification": { "type": "psuSystemdVerification" },
>         "update": { "type": "psuSystemdActivation" }
>     }
> }]
>
> So then if we implement a psuSystemdVerification and
> psuSystemdActivation, those can all the things you expect and stage
> the file where you expect, etc.

Yup, it should work the same as BMC software.

>
> Patrick
