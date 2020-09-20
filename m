Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8EE2717FE
	for <lists+openbmc@lfdr.de>; Sun, 20 Sep 2020 22:58:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bvg0130h5zDqkh
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 06:58:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=JR4j1eZL; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvfzB5SKhzDqbm
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 06:57:39 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id 133so1542099ybg.11
 for <openbmc@lists.ozlabs.org>; Sun, 20 Sep 2020 13:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0GEZ7YHQnF3BX9EcGfF06mrlhr1CZ6FbfKpRMScYV8I=;
 b=JR4j1eZLq68yhHiW73zfc4433v1jfaBML7q1EREKs3lBVB6vENhrcvj7TwfyGSJQhK
 O8jkbZ5cdzVBwPQT9wE+zesKKYqOTIy3aaojCEQ3ZO/WJpoHth2KFzI+J1LocP5jlRrD
 KBem6RCyAzfzmbbyggKzrNprwgG3grXNeNdriMrt4x0C+Eic7Jsvbbd7iHDtBw4K2cZI
 QsP50qR6xtwm/Z9NbTAHcjAkEJrAXtJcTXB8T5xK++YooYz1S70uIiwE13Ot0QS3mzOS
 kG30/bYT1t4g+8Bn3BG4CGymCHBCOUrbwUhNq07v7IcggA89B0mM5MmXNx3MjPvkVG7t
 AdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0GEZ7YHQnF3BX9EcGfF06mrlhr1CZ6FbfKpRMScYV8I=;
 b=GAX1mXhOeRm21WUjpxvX1N4dJAi1D0SfiZlOdnI25Tmmy1XN21UZWLIatWqeGZEn75
 F8lhCHZlMKUAFiqwvmXLlwwrKVLPe168WopZDw5JNA1yforvMV0qped1Ioq08T2UwXjr
 6bT+rUjJD5h+m04uTIsL/5pi2sMkIP1gqbJlgzF7zZ9OJ1iBRYp+qg/mmhYhwk6mL1LD
 qNkp4xsL9Jxm6SmSZvoGvnM32GxdCHH73wIY1/XcX9FT2WVtD+cvO+/ScyOIzEMUiCg3
 STyy9jzVdxClFzdHlgFL9cwtOPFK+oWNf24CXZw03HogLuQXfHyqxOVnlv2jmVtpArIt
 L8jg==
X-Gm-Message-State: AOAM531y09wS5No/J2BtD4x1zQMftqhCgWmum24caDSGIvTw3lfymDXR
 43+AMUQ+pG7RUlgcrQKf3M843v58YHLST5NaSovzn/BLT4VLYyDC
X-Google-Smtp-Source: ABdhPJwIFx2jR40fk6zndghXpiU3wNx1zsOTzS8gvSYEKGZxp6+Y5gsKB9EHfPtvGoOkVAdsuIf2GX/HWL5Ockhv408=
X-Received: by 2002:a25:1581:: with SMTP id 123mr23626252ybv.480.1600635453530; 
 Sun, 20 Sep 2020 13:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <29b244dc-5a8b-a82f-b62c-30791d2c0962@linux.vnet.ibm.com>
In-Reply-To: <29b244dc-5a8b-a82f-b62c-30791d2c0962@linux.vnet.ibm.com>
From: Ed Tanous <ed@tanous.net>
Date: Sun, 20 Sep 2020 13:57:22 -0700
Message-ID: <CACWQX83ayt4eBcfH9wi87hz4-YMGqTC1=c=WdOzLcv_0wQ6mDg@mail.gmail.com>
Subject: Re: Proposal to make webui-vue the standard
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 18, 2020 at 9:36 AM Gunnar Mills <gmills@linux.vnet.ibm.com> wr=
ote:
>
> Hi All,
>
> From some continued discussion yesterday in the GUI Design Workgroup, we =
would like to see the community move away from phosphor-webui and for webui=
-vue to become the standard. All companies on the call were in favor of thi=
s but I=E2=80=99ll let them chime in for themselves.
>
> As stated in previous emails there are many benefits to the webui-vue GUI=
.
> webui-vue adds:
>
> Improved user experience based on feedback from OpenBMC users
> Conformance with the W3C Web Content Accessibility Guidelines 2.1 specifi=
cation
> Ability to easily theme to meet brand guidelines
> Dynamically generate navigation
> Language translation-ready
> Full Redfish
> Modern front-end framework with an active community and future developmen=
t roadmap
>
> The phosphor-webui front-end framework, AngularJS, will sunset in June of=
 2021. Based on this, the most active contributing companies have moved to =
webui-vue

According to the OpenBMC github I only see IBM has moved.  Maybe
you're talking about forks?

> resulting in a decrease of development activity on phosphor-webui over th=
e past six months.

Ironically, you sent this out on the same day Vue 3.0 was announced;
It looks like the next 2.X Vue release goes to 18 month support.
Hopefully Vue 2.0->3.0 porting isn't the same thing as Angular 1.X ->
2.X.

>
> We also believe webui-vue allows us to move forward other areas, for exam=
ple, turning off exposing the D-Bus interfaces as a REST API. This change w=
ould break phosphor-webui. Since webui-vue uses Redfish this is not the cas=
e for it. https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29344
>
> As requested, below is an updated timeline:
>
> With Virtual Media merged, 8 identified issues to reach parity:
> https://github.com/openbmc/webui-vue/issues?q=3Dis%3Aissue+is%3Aopen+labe=
l%3Aphosphor-webui-feature-parity
> IBM plans to work on, with an estimated completion of mid-October:
>
> Two file Firmware upload (#9)
> Loading webui-vue from the BMC causes content-security-policy errors (#32=
)

This is important, and having the UI load without errors or warnings
speaks to the quality of the UI as a whole, and also allows finding
regressions much easier.  Looking forward to when this lands.

> Radio button for DHCP - Network settings (#36)
>
> And will work on when the Redfish interfaces for these are implemented:
>
> Remote Logging (#34)
> SNMP (#33)
>
> The last 2 identified issues, we are looking for community help but might=
 take these up ourselves one day:
>
> Mutual TLS (#30)

This is used, and I think important overall for the security posture
of OpenBMC.  I would like to avoid regressing the default security of
OpenBMC in this regard.

> CSRF allow list (#29)

Do you think the person that checked in the code around the security
bug could take a look at it?  It looks like Derick wrote the commit
that needs fixed.
https://github.com/openbmc/webui-vue/commit/e080a1a7593e83a49d623ffdd452fd0=
e1c617889#diff-d33bbe646af7d8d45caaeb27b20b4813

>
> The last issue, Next URL forward (#28) has a review up.  Thanks Mateusz!

The current iterations of this patchset regresses security and
functionality in regards to phosphor-webui.  Once it's up to par, it
seems like a great addition.

>
> Please let us know if we have missed any features needed to reach parity =
with phosphor-webui.
>
> Would any of these outstanding issues keep the community from accepting w=
ebui-vue as the standard?

Known security issues (both bugs and missing features) currently
prevent me from supporting a full changeover, but it sounds like
you're hot on the heels of getting these fixed.  Once all the above
are fixed, I'm in full support of a change of defaults.

>
> Not sure officially making webui-vue the standard means a lot, we plan to=
 update docs/ links to point at webui-vue and view as the first step toward=
s eventually deprecating / archiving phosphor-webui.
>
> Is there any objection to this?
>
> Some previous discussion on these topics here:
> https://lists.ozlabs.org/pipermail/openbmc/2020-August/022637.html
> https://lists.ozlabs.org/pipermail/openbmc/2020-February/020491.html
>
> Thanks,
> Derick, Gunnar, and Yoshie
