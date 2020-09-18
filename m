Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0549B27086E
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 23:39:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtS0D1p6PzDqvV
	for <lists+openbmc@lfdr.de>; Sat, 19 Sep 2020 07:39:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=OOJkILY2; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtRzL2vcKzDqk7
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 07:38:36 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id c17so5363468ybe.0
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 14:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=z6Bf54eNRwafL3jhFdeTzL0W02W4i/cxzuNDVbVy2zw=;
 b=OOJkILY2FeO2gHZ+kSSFS8Qo5WZdeFF0ALWJbW8iS4nD6XoKF75gMBGIR+wdCghinv
 rBzIA6xgzJilepifpR0M/DnTRbQeBuNFs285YDYIMVZqiFodZxaNXEkhO1jGephZPG9C
 aS/Iy7pBB+pvzc8ElLGTCd/4Tuv4uIE+laJw1Zbs1UPYhZdhdZii7HBxIM9h3COrhBfG
 op7Q9rGXCj+1c07Gff/O9J9fsiHgduCJeakITc9ItiTIGPzZm5FriSE1wDXrzh3OHSQs
 onD41g3QmGFvsw9AaVASJRoNpMoOJ7qkyuHsUJiAJ5DoAnLrDSwkh4qZu7Htd1avM0cj
 PV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z6Bf54eNRwafL3jhFdeTzL0W02W4i/cxzuNDVbVy2zw=;
 b=HtI9Gz7gxafeGd5TMW3E8DD+3bG995VxuO8hzJN0Ub8mVh8xh8qKkarh95VhwMdIso
 PkJsQREteHyzxsAiDr2NxiVox2tMAdtRPXn+Q+zg5BNVJes1vSAIZMh91EX+ucFYpuNF
 iylK+2jNOPVVOR+mKtB1Aldxzn7iEus8mjaxuiWAoaRAEkZ4ZceabtbG2o0p4M0KnxBZ
 1Lqrh2mJepTFqrN6cZ//yoey+MKIv35BO5JC6Q6U3w04UYl1E72owVPxNX70huox/z51
 q1vHpTG0Au82nBEqWP5VXwHA+QSnok7HnWii6njDwZAeq9GFGLoM3lRsTh5L2EPLelVG
 +PCA==
X-Gm-Message-State: AOAM533N8Bl+5Y+WcSj7Nn7ST51XnTX2vLVtVmy7EQiWQXuf2DdX4aya
 V9UxEGSMTYK9egzwCyIfL+ink4A/IeB9BHBBXDq53g==
X-Google-Smtp-Source: ABdhPJwdXF526igiQfhXMymY9n+cLRuW5PYsoRPT/846SZAx1b2jj4sS/RI/g+GiuZu8xSPnKDni4+Gj6mnT4s2cUYA=
X-Received: by 2002:a25:14c4:: with SMTP id 187mr55349836ybu.449.1600465113033; 
 Fri, 18 Sep 2020 14:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <46F3C05C-7CEC-42FD-A9B7-8E55AE56FE3F@fb.com>
In-Reply-To: <46F3C05C-7CEC-42FD-A9B7-8E55AE56FE3F@fb.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 18 Sep 2020 14:38:22 -0700
Message-ID: <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
Subject: Re: Chassis reset
To: Vijay Khemka <vijaykhemka@fb.com>
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

On Fri, Sep 18, 2020 at 12:52 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Team,
>
> I am again want to discuss complete system reset. We had discussion in pa=
st for this and I implemented this as a chassis instance system_chassis0 an=
d allowed user to initiate PowerCycle which will reset the complete system.
>
> Please help me understand following scenario
>
> Host reset =E2=80=93 resetting host only

Should be done by initiating a reset action on the
/redfish/v1/Systems/system endpoint.

> Chassis reset =E2=80=93 resetting host and bmc via single command.

IMO, this shouldn't be supported as a single command in redfish.  If
you want this behavior, issue a reset to the System resource similar
to above, then issue a separate reset action to the Manager resource
at /redfish/v1/Managers/bmc.

In less complicated terms, I tend to abstract these kinds reset down to:
System reset: Reset as if I'd done a soft/hard reset of the main host proce=
ssor
Chassis reset: Reset as if I'd unplugged the particular component from
mains power (AC or DC)
Manager reset: Reset as if I'd done a soft/hard reset of the BMC

Per the above, if you're looking for a chassis level reset (IE pulling
main power) this should be done in a Chassis Resource.

> System reset =E2=80=93 This is a hard reset of complete system including =
every device.

This is I think the new one you're adding, and should be modeled under
a new chassis resource  /redfish/v1/Chassis/<Chassis name>, and by
issuing a ForceReset action to it.  I know in the past, for systems
that weren't capable of initiating a full chassis reset, we've modeled
this as a host reset for compatibility purposes.  It should be noted,
this is arguably "wrong" but kept around because we weren't prepared
to break client implementations that expected that action to be there.

As a side note, is anyone a PMBUS expert?  A quick look at the spec
seems like there should be a way to issue an AC-reset to a PMBUS
enabled power supply, but I got stuck reading the docs, given the
complexities of modern power supplies.  Is there someone that just
knows the magic string to send to it?  In that way, we could implement
the above in the "right" way, while still not breaking peoples
compatibility with the older interfaces.  Now back to Vijay.

I'm assuming a lot of this is in context to your current patch:
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36557

Your existing patch doesn't work because you're modifying the
Redfish-provided enums to add your new action, when redfish would
recommend adding a resource specific to that physical box that can
call your new endpoint.

>
>
>
> Redfish defines only above 2 type and system reset can be covered under c=
hassis reset.

I'm not really following this.  Redfish exposes the different types
you need through multiple Chassis Resources.  If you have a higher
level chassis that contains items below it, you would have a new
Chassis resource, which implements a Reset action on it.

I'm going to go out on a limb and assume you're working on Tioga for a
moment.  I would expect that the Tioga Sled to have one chassis, and
the Tioga BladeCenter to have another chassis, with ContainedBy,
Contains, and PoweredBy links in the appropriate places on each.

> As per implementation in x86-power-control, host reset and chassis reset =
both takes same action like rebooting host only. For system reset it has a =
separate interface system_chassis0 and PowerCycle command triggers this res=
et.

I'm really surprised that this chassis level reset would go in
x86-power-control.  That daemon is really for host level control, not
chassis, and considering that almost every implementation is going to
have a different way to "pull the power" I'd expect these to go in a
different repo, or at the very least a different application, so the
various BMCs can swap them out with the correct one for their chassis.
I probably missed a discussion on this a while back.

>
>
>
> Please help me how do I support this system reset in redfish.

Hopefully the above helps!

>
>
>
> Regards
>
> -Vijay
