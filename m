Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC0D408FEB
	for <lists+openbmc@lfdr.de>; Mon, 13 Sep 2021 15:47:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7STm303Nz2yKN
	for <lists+openbmc@lfdr.de>; Mon, 13 Sep 2021 23:47:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=aq/Sv8Hi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::c35;
 helo=mail-oo1-xc35.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=aq/Sv8Hi; dkim-atps=neutral
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7STM6DT4z2yHb
 for <openbmc@lists.ozlabs.org>; Mon, 13 Sep 2021 23:47:17 +1000 (AEST)
Received: by mail-oo1-xc35.google.com with SMTP id
 q26-20020a4adc5a000000b002918a69c8eeso3401407oov.13
 for <openbmc@lists.ozlabs.org>; Mon, 13 Sep 2021 06:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=3XyvWQ6+wMy0b/YiAvfuGGvQ9a3UKS8hNLKLux03WaQ=;
 b=aq/Sv8Hidb1EdHEVSGwDZLWwU+03ktRyRjzeyZMxDlzEUvWtumT94hGL9TeTECK9Tb
 yyr6ct33wiEAgkyfPzZUMs/zylCsFo2qC3zQflagV9LUm33Qenz2yABE9b4lOxmLPfsd
 83DnlS9ZMHCT0LZzbx/Cp6B06qqiz98P7d0rMje32gytCjxj+6UNVnS1XXyO4y0U4pmc
 p3w3MKz8q0aCtsZJDeoLDSER3Fr6S7oxceHaoh+lA9kBcJCLMmTOiL+XOVrcPwIwAPl1
 pYPc9sAxqsYexfy8q5FV/NosdvWa1ub3dZoy2XBm14fpA+WGEV+iwCBhTaEcL5YDw/bR
 TH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3XyvWQ6+wMy0b/YiAvfuGGvQ9a3UKS8hNLKLux03WaQ=;
 b=JSVdPfYHG42OVpxpPJGfztXa8l0DS03rIolA8UNgrNxpvqy6Ec+9ieNAuna8BktWh5
 C90x1w9mvZgBqwChYO6ObdnEoJK045UwTjRjjVBCMfyG4rde3M1orYCz5z1lWmOTr8ws
 OwaablvFqxp6jiWJKU103DPK7TN7YQxGrvXUh9T1kRTNEWeVIrvCx50FEYIe1DFFpEpj
 luldpx0yeAM20RMV8yL5OAeu5IEUxdnb3fp0x7RMyzvK1ENxEkHQcVS+rdrWu2lyR8S1
 A4g/znFhoFalsSOpY8VJCdY4E80uMFyzu1XGMYuWHahPSvHfdtVsMooKE2QffTaP0VtD
 ZoqA==
X-Gm-Message-State: AOAM530/lGSHc7xLToo2Exewg+hjslU/1ENHXFyw3BPlMNaGXDwumM8X
 CZ9qL9t5yvCHbidqoecehm6giNOWMqWk6HSTCS+saZn8X8JutLD7
X-Google-Smtp-Source: ABdhPJxCo4wLLoUR/Gd7TCTJ++dxao/zWOUECx4bY9rT56+JbEazKQvchL4fImQdU6FDHurChG6Bv4t8b6Uaiyiq+rA=
X-Received: by 2002:a4a:e297:: with SMTP id k23mr9213444oot.4.1631540834114;
 Mon, 13 Sep 2021 06:47:14 -0700 (PDT)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Mon, 13 Sep 2021 21:47:03 +0800
Message-ID: <CAGm54UG1guTohXRB5CPYJR=4PQmdXaqZ0Tgq5Z0WXPS7QBxg5Q@mail.gmail.com>
Subject: About KVM screenshot
To: openbmc <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This email is to introduce some progress and ask for comments about
the KVM screenshot function.

The whole KVM screenshot is implemented by the below pieces:
1. The vncsnapshot[1] is slightly modified for cross-compile, and a
bitbake recipe is created for it;
2. A service is created to host the DBus interface to provide the
"Trigger" and "Clear" methods for KVM screenshot;
3. OEM redfish actions are implemented to trigger and clear the KVM
screenshot, including the download of the picture;

Be noted that the function is currently experimental and not stable:
* vncsnapshot has some bug on skipping the black screen, so we have to
add a delay to capture the screen;
* When the BMC is in high load, it takes longer to open and capture
the KVM, so the above delay may not be enough.

If the work is got interested, we could try to upstream the changes, including:
* Submit a patch to meta-openembedded to add vncsnapshot recipe (with
patches for cross-compile)
* Add an interface to phosphor-dbus-interface to host the service interface;
* Add a new daemon (in a new repo or share some existing repo?)
* Submit patches to bmcweb about the OEM Redfish actions (for now it's
Bytedance OEM action)

Feedbacks and suggestions are welcome.

[1]: https://sourceforge.net/projects/vncsnapshot/files/vncsnapshot/1.2a/

-- 
BRs,
Lei YU
