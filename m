Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 067A02EB166
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 18:31:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9KKQ6RS7zDqd2
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 04:31:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::331;
 helo=mail-wm1-x331.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=mHv7cOXL; dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9KGN6l7jzDqfr
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 04:28:21 +1100 (AEDT)
Received: by mail-wm1-x331.google.com with SMTP id e25so299788wme.0
 for <openbmc@lists.ozlabs.org>; Tue, 05 Jan 2021 09:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=89k0qb1zO7yej/csLMW0knj6mhK2RDf2AdE2atpkvns=;
 b=mHv7cOXLelUL0HNJCDkyCxllrB8zCszDqCpbLBuV4ruXhWT49KhLjQlJr3LDCsIgRB
 rlZia9+0OWyJPUy3kLL6YtgHj+wmpqCyCkepwkYUSsI3p91bBkCRh/h92PXlFUU/hsTU
 0Zhz4TBg9e9ZDsjywAZBzzYxz4nsg62/07qpnhgzEoYk5gVOJCBifEMFXO/BjIcKHrJK
 FicmWnD9Rok8tCV7MKeAd2HI3KbqSw8wxobdt1TvcQoVRP5DrdqxVKY6XHrZ/hbSgO5h
 lEcj4QSYNVrNmH/lWY9ZSFFVLxCc5kvZ7kLrbPK28XF3r2ZvXm4Tz+zKAqy4astmLDmW
 F6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=89k0qb1zO7yej/csLMW0knj6mhK2RDf2AdE2atpkvns=;
 b=td/WarspJhCI/OZBQRP5ZmS9q6K3p8E6jqUa4AUxsWhv/eeljyqUQjYF9lFNw76an2
 6cWQkTGDrV+XUUPCwrBlJHcwI4pS7uhlFOu8XOdfb6LIQcAzwCJAVJxxyUAL2C9/1j+a
 bxu/vv22oztB2BaouNlM0uD5Z3jKAGh9F062ybrK3kpQq0JGQHCXYcolUq1acJFzUN87
 SjBeaZSLiY/OmUR+IdtAtt47/kll8eHGcI/q5ywBsL3VrWTlnzCMksrQAq2LGBwQB8EO
 Hi+xcJpNQscXDrsmeZDcEuHtkicBwqvg9ANOvQZtzDMuPCZSnUtYB9jC7Nhy5F5yzJK/
 eUOA==
X-Gm-Message-State: AOAM531CIDCj1Zz5k50VeUwWlYomuxYnB8Sh+oQEOo0XGmWcymcB4UK5
 vW969+R10bkBtIUaxo4TQXZ8/wziYfNVwqs9LGztCQ==
X-Google-Smtp-Source: ABdhPJxjC2oxBvavkAEVk/0ttxNT5hl24zPG+TXk+wo59lDT8wJ45p5bHEuU0c2Xy8eL6kU6lytQMRPlVz0L+OS/3b8=
X-Received: by 2002:a1c:220a:: with SMTP id i10mr159312wmi.93.1609867696619;
 Tue, 05 Jan 2021 09:28:16 -0800 (PST)
MIME-Version: 1.0
References: <SN6PR17MB255899EA5DB3A379ABEA68E996D20@SN6PR17MB2558.namprd17.prod.outlook.com>
In-Reply-To: <SN6PR17MB255899EA5DB3A379ABEA68E996D20@SN6PR17MB2558.namprd17.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 5 Jan 2021 09:28:06 -0800
Message-ID: <CAH2-KxBV9_0Dt79Quy0f4HkXXPdHfBw9FsG=4KwdWXBYNEA-ew@mail.gmail.com>
Subject: Re: add a new yaml interface definition
To: Mahesh Kurapati <mahesh.kurapati@keysight.com>
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

On Mon, Jan 4, 2021 at 1:42 PM Mahesh Kurapati
<mahesh.kurapati@keysight.com> wrote:
>
> Hello,
>
>
>
> Thank you for the video on the phosphor-dbus-interfaces architecture.  It=
 clarified the development flow.
>
>
>
> I am trying to expose some of the discrete GPIO signals,

We should think very carefully about if we want to expose raw GPIOs
directly to dbus.  In practice, almost all GPIOs need some kind of
filtering (debounce, power state filtering, minor state machine of
other GPIOs) and that tends to be very difficult to model directly in
a generic way.  In general, it's a much better idea to model your GPIO
as a high level concept, like an LED, or a Power state controller,
then expose a well defined API to dbus for that device.  That means
that downstream clients can identify the GPIO interface reasonably and
expose the appropriate APIs to the user.

> and methods to generate audio and visual alarms for our management softwa=
re.  I will define two new yaml files describing these interfaces.  From th=
e training video I understood that I should use the sbus++ to generate the =
cpp boilerplate code and make it part of the library.  I will extend my dae=
mon code to implement the actual functionality as explained in the video.  =
Where I am stuck is on how do I add my yaml files to the phosphor-dbus-inte=
rfaces infrastructure?  How to do this in my yocto environment?  Please hel=
p.
>
>
>
> Thank you,
>
> Mahesh
