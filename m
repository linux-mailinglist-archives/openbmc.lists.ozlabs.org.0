Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8926274DC2
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 02:21:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwzPD1t5vzDqZj
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 10:21:20 +1000 (AEST)
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
 header.s=20150623 header.b=trbDpMam; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwzK53R93zDqb9
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 10:17:44 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id s19so14147541ybc.5
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 17:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WJtIBSzDaPEhH8EH5BhKr/hbRhzhYqyDc3F4uflNWpg=;
 b=trbDpMamgBpDnA8TpdWfUjnFE1g6TQ8uLgbfOuHxjL4IosPLOG9P5ZE1gEgKSumGEe
 +6SYQFsWq8QbpnAF+F/jgJ+OXq3EKVnny4DPFO7T2aIacf681WKouEsYOtsuZV9T2N0T
 bQasD8RjlllZOhSxaJ+5SlfBwc68rsDM2j0D+AtYzv7roGtfkfAnnDmNkYWwyAzH8LhH
 /yIXxU0p3YJ7kct1AJGhy+5zcGdSdw8Tk7MIAcmi5kWGFLRuPtfs7qzwRHzX+7L3tBrj
 c4utTzlt5xeKSr07mG/8gBvBfsjpedjfBzbyvdXtz7XyRWSv2y9tlof+ltoHmRNhSrMQ
 TdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WJtIBSzDaPEhH8EH5BhKr/hbRhzhYqyDc3F4uflNWpg=;
 b=ApsRyNMKdoAVIDfb6hbPQKNjiyjjfi0F6Sjq6JA+zoe4VsjOJ2Pd15q/Z8tNd3hirN
 /6I0BKQypUBhW33amdgGOJfzLKd1OQbJinwOO/wWkDY3l0fCENVNS2MEZ3QF8u8qRvyg
 qYe++OqmQqUoW0EvG0hDNzayru7iZPFul48/XiyguL9c81u5FWjhHA29mAtUOq99B1Tu
 603TJZ4RJQrF8MtcZQaiFTyAiO4+98/IVsWf2aRgzgjhjGJyG2Xy3odEYNeqPZ8MHWYI
 WVAsk9ZliiTdua+SV4oY7Jsh9hOk1SarCN8ZEzBYihHeM5VBDvImKoDMWSIE0mt/31la
 RXCA==
X-Gm-Message-State: AOAM531mSjUJuOdk2GNNU1KnC5Ou5dlMRi3siRuWCCspxqvZQ0m7nFeu
 hbDexrE1FROkjHchD1TKSfwhCSeNIMY8eCpDqrpXmA==
X-Google-Smtp-Source: ABdhPJy1ZXn5STo8nIXuMPhkH/gdvP8SrlpbjaHv9xZ9xGaXU7D9UEecg4n+eKAwjd+RA2eUNzjp3I4YKAWqxMUqLMw=
X-Received: by 2002:a25:aaf4:: with SMTP id t107mr9465822ybi.209.1600820260604; 
 Tue, 22 Sep 2020 17:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <46F3C05C-7CEC-42FD-A9B7-8E55AE56FE3F@fb.com>
 <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
In-Reply-To: <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 22 Sep 2020 17:17:29 -0700
Message-ID: <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
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

On Tue, Sep 22, 2020 at 12:16 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> After a bit of study on redfish, I got some basic definition for chassis =
from redfish document  as below.
> https://redfish.dmtf.org/schemas/v1/Chassis.v1_13_0.json
>        "Chassis": {
>             "additionalProperties": false,
>             "description": "The Chassis schema represents the physical co=
mponents of a system.  This resource represents the sheet-metal confined sp=
aces and logical zones such as racks, enclosures, chassis and all other con=
tainers.  Subsystems, such as sensors, that operate outside of a system's d=
ata plane are linked either directly or indirectly through this resource.  =
A subsystem that operates outside of a system's data plane are not accessib=
le to software that runs on the system.",
>             "longDescription": "This resource shall represent a chassis o=
r other physical enclosure for a Redfish implementation.",
>
> In my understanding, chassis reset should be treated as complete power cy=
cle of whole chassis and we can use redfish command "ForceRestart or PowerC=
ycle"

I'd probably guess that in this case we'd map both ForceRestart and
PowerCycle to the same action, if we're just pulling the power rail.

>
> As per our implementation in bmcweb, we have implemented 2 interface (sya=
tem and chassis) where we deal with chassis reset
> 1.  https://github.com/openbmc/bmcweb/blob/684bb4b89f88b394b00b140d71c161=
143393f80b/redfish-core/lib/systems.hpp#L1754
> In this system interface every reset type except ForceOff is calling acti=
on for host and for ForceOff command, it is calling chassis poweroff.
>
> 2. https://github.com/openbmc/bmcweb/blob/684bb4b89f88b394b00b140d71c1611=
43393f80b/redfish-core/lib/chassis.hpp#L585
> Here we only implement "PowerCycle" command.
>
> Why did we implement chassis reset command at 2 different interface, I mi=
ght be missing something here.
>
> As per x86-power-control, in both above cases chassis command point to ac=
tion on host only
> https://github.com/openbmc/x86-power-control/blob/e63dea0875a70ff50f430a4=
bdc84b646a56b9ce7/power-control-x86/src/power_control.cpp#L2389

Because most systems don't have the ability to do a complete AC reset,
so today we tend to map a Chassis reset to a host reset for
compatibility.  I suspect your use case is the first system that will
add the ability to do the "right" thing, and actually cycle power to
the chassis.

>
> where can we implement action on chassis.
>
> Can I add ForceRestart for chassis in redfish chassis interface as chassi=
s sled (complete power removal and restore)
> https://github.com/openbmc/bmcweb/blob/684bb4b89f88b394b00b140d71c1611433=
93f80b/redfish-core/lib/chassis.hpp#L585

You can add ForceRestart, but you need to implement it in such a way
that it's selecting it per-chassis, given that you'll have 2 chassis
instances, one capable of an AC reset, one that isn't.  Today, the
code does the wrong thing, and maps all chassis resets to the
/org/xyz/openbmc_project/chassis0 path, because there was no
association for power state mapping back to a chassis path.  You'll
likely need to do some engineering in this regard, or just map
/org/xyz/openbmc_project/chassis0 to your "chassis" reset.

>
> I understand that it is not very clear from refish how to map each resour=
ce and command.
>
> Please suggest a direction here.
>
> Regards
> -Vijay
>
