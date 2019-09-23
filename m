Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1BBBACB5
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 04:37:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46c7l74kz2zDqMX
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 12:37:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="g9kkacNz"; 
 dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46c7kY49PVzDqKh
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 12:36:50 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id 7so12074972ljw.7
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 19:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=USl4MVviRuIDat+XPlJNsgMVaSeMBGql1cN72m4m9Ik=;
 b=g9kkacNzsGfwaxSYuLWA53u8lIHlREiZNc9UGY7v5EFuj6RczCQ2+rev/CbMnBzPrY
 i9TkkhI/TYnEuySkhTbNq4BgKiwfUE0I2I5G8MsrVfQxAMsuDnii6gIaVbwwqlDxrlEe
 k7MCVZjDAKpKQ8UfSx4HPnjpzDvbhiVzPm3ovdPO2efZvAPWiwW2L+gWP3y7mOWY0Mtv
 w4EZLC4ErA9e+l5O2Kiki7AeMaHQQshXHfOdztm+c4VKEnZ8tlVjX4ol+Hjwe4PbyaIq
 8JOB6/Z7vnVFsTg6Vpr1Lc11+WubQ6gCJtxP1vBesdA13giZYCM/wFlyHzqZ0u73xoOm
 m1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=USl4MVviRuIDat+XPlJNsgMVaSeMBGql1cN72m4m9Ik=;
 b=bTrwXGhnGQRCUn2JQBPvGyXPUqauywvWLOEoDHALqZIqA899C1iEictVA7Zm0Zkd0O
 kF2LxTwnvD9sQHbc14w27Dbc2y++zsG4JQkecsLFb4eM6IHZKGHfRrZXxY5fYVuEOtvD
 I5Kr6MK2TRz5T9ckbfpbP/iw1iIJkSk1QelV9utbQRlCyf0nqF5HIBpfqeXEA5UN0HWz
 tV6DBIEn0mPefKRH8URKzK8L/kduj/GKQkIBCI/HEtdRiJz3szuO/20dFpber/UZZj6d
 9iGZL0b70bnZYonO/8A3PYja70p9MWLa1z/visXX5DeX8VG1hUKB4iZu/7ULSa1R/1jC
 L0xw==
X-Gm-Message-State: APjAAAXrP/uE5f5I+hksgQVBxjdPXYvzvX3No4uk7LgGyw3fE57/U+vf
 1n0aVraZRv6Uokm90yO9vyQgsDYDmZ0NpEePjgGriw==
X-Google-Smtp-Source: APXvYqzCMR+YsqYDthfJxqmF/QKSV8RCv3mxvky2Asr15AFus0Ob+mFNqk1FmztYgMeMFjhjdmC3yTIavpPVxMPyc2I=
X-Received: by 2002:a05:651c:1127:: with SMTP id
 e7mr16244821ljo.186.1569206202584; 
 Sun, 22 Sep 2019 19:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <OFDC47175F.41C9D828-ON0025847E.0008C328-0025847E.00091D63@notes.na.collabserv.com>
In-Reply-To: <OFDC47175F.41C9D828-ON0025847E.0008C328-0025847E.00091D63@notes.na.collabserv.com>
From: William Kennington <wak@google.com>
Date: Sun, 22 Sep 2019 19:36:31 -0700
Message-ID: <CAPnigKn7OkWC9hX8Pb7LRp1uO4nUEZd7gpXthrd0pooVfOR-Jw@mail.gmail.com>
Subject: Re: Proposal for 2 properties for Nameservers
To: Manojkiran Eda <manojeda@in.ibm.com>
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

+1

On Sun, Sep 22, 2019 at 6:40 PM Manojkiran Eda <manojeda@in.ibm.com> wrote:
>
> Hi All,
>
> This mail is regarding , the proposal for adding an additional property `StaticNameservers` and also for changing the definition of the existing `Nameservers` property.
>
> - Currently, we have a single DBUS property under Ethernet interface named `Nameservers` that captures only StaticNameservers configured on the system. It does not populate the information regarding the DNS information that is obtained by DHCP server.
>
> It is also to be noted that the static & dynamic configuration can co-exist at the same time(means we might have the DNS set manually by user and also by the DHCP Server at the same time).
>
> As per the discussion with Ratan & Wak(https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-networkd/+/24224/),we had come to a conclusion that we need have two properties in the Backend for nameservers (similar to what we have in redfish):
>
> 1. Nameservers - A read only property which captures the current nameservers on the system (which may be static or/and dynamic)
> 2. StaticNameservers - A writeable property which captures only the static nameservers.
>
> Please let me know, if anyone have concerns with this proposal.
>
> Thanks,
> Manoj
>
