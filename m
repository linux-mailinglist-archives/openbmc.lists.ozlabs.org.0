Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3D1270965
	for <lists+openbmc@lfdr.de>; Sat, 19 Sep 2020 02:18:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtWWT6rB7zDqvV
	for <lists+openbmc@lfdr.de>; Sat, 19 Sep 2020 10:18:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=f28At7nL; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtWVl37BSzDqtV
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 10:17:30 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id b142so5555021ybg.9
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 17:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9q7LsLNscznVgElKQdvO+dp4Hxn3G7CALzJhCYJ8Io0=;
 b=f28At7nLYXiKuzybGRw6bSh/qYWLJJ1W1qPJYV6lpSXj6R8jxVYbTGtVKKQYOZPuyw
 Wx/adJv8cfF1ppJ14Kcl+jDLNbwfY916gw4xoFYTWHCPDmCl72Ux2Krm+h36mrwFq3YC
 p1SPNDz8pxmV+kSOQHSKEMWf3JjDYZwUSTRw/czGyu7VB4CBReHqToPrKGmw0ZzjWMTS
 e5yg1BFLRq5gGl+Qh+DYASFhWdtbrq265agV6RBve1HdEF/oEbgB6UlF5gV0HRNO6WvZ
 8z32VqP91G5I4hGKzqbQXzO5r44zKi2pnet5pxTVXY6ayExe/9Sgmbr4ky3w4mLlFSfk
 vn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9q7LsLNscznVgElKQdvO+dp4Hxn3G7CALzJhCYJ8Io0=;
 b=mZb0TkjnCMck2rLgNen0QW2eF2lCfEr89UAMDxJW6M88Fou6ggqCA1h/m4pMbbyN7Q
 UglHL6WnPTgT0RQVSLToFrOKSZe4ceE/4RTlE0x6Mdddgt0eZIdeiWu17qGcDy0nQhin
 txR6ketwA7qrFwC2urMHGJv9q+bH88tkdZ13sQS38bqgKWg2/bQOdQirC207DoDEXInB
 hQqZ3j4+hlSKOLJKIRV0lcyud0avNLU1AsYCEPVlKsF+Bbqg4QAOxxwlFl1Nv/W7kjON
 +zk65Tow6kbkc3LdZBzIm7P0OasnzOZ+U8rexkMojtNOUktUt+2ZOXVyqgh+HystwPF9
 bAFA==
X-Gm-Message-State: AOAM531BIvlcCfRH8+bizi+wkzVtVw6VvBt7Vj37zdVt3Cw/2vumIcNb
 IPu/zZMh2iTTvkpCTJK1yb1iioCz6n/KRUSeoPcQQQ==
X-Google-Smtp-Source: ABdhPJyWl5XTkkUGUn4/JAGI3iqLjhG2RqQlPlmRDc1dhkbLlmfrgJVKRO+FFH6eKzF68P3/Fanv3ukvqAUcLzqBlxk=
X-Received: by 2002:a25:cf84:: with SMTP id f126mr9678885ybg.148.1600474645877; 
 Fri, 18 Sep 2020 17:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <46F3C05C-7CEC-42FD-A9B7-8E55AE56FE3F@fb.com>
 <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
In-Reply-To: <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 18 Sep 2020 17:17:15 -0700
Message-ID: <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
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

On Fri, Sep 18, 2020 at 4:28 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 9/18/20, 2:38 PM, "Ed Tanous" <ed@tanous.net> wrote:
>
>     On Fri, Sep 18, 2020 at 12:52 PM Vijay Khemka <vijaykhemka@fb.com> wr=
ote:
>     >
>     > Team,
>     >
>     > I am again want to discuss complete system reset. We had discussion=
 in past for this and I implemented this as a chassis instance system_chass=
is0 and allowed user to initiate PowerCycle which will reset the complete s=
ystem.
>     >
>     > Please help me understand following scenario
>     >
>     > Host reset =E2=80=93 resetting host only
>
>     Should be done by initiating a reset action on the
>     /redfish/v1/Systems/system endpoint.
>
>     > Chassis reset =E2=80=93 resetting host and bmc via single command.
>
>     IMO, this shouldn't be supported as a single command in redfish.  If
>     you want this behavior, issue a reset to the System resource similar
>     to above, then issue a separate reset action to the Manager resource
>     at /redfish/v1/Managers/bmc.
>
>     In less complicated terms, I tend to abstract these kinds reset down =
to:
>     System reset: Reset as if I'd done a soft/hard reset of the main host=
 processor
>     Chassis reset: Reset as if I'd unplugged the particular component fro=
m
>     mains power (AC or DC)
>     Manager reset: Reset as if I'd done a soft/hard reset of the BMC
> I completely agree with you on above part.
>
>     Per the above, if you're looking for a chassis level reset (IE pullin=
g
>     main power) this should be done in a Chassis Resource.
> Then chassis reset should call proper chassis reset dbus command.

Um.... Either I'm terrible at reading code, or it already does?
Codelink to the Chassis schema calling the
/xyz/openbmc_project/state/chassis0 URL:
https://github.com/openbmc/bmcweb/blob/23e64207a6668319df1f273641febdeab4c0=
9148/redfish-core/lib/chassis.hpp#L527

>
>     > System reset =E2=80=93 This is a hard reset of complete system incl=
uding every device.
>
>     This is I think the new one you're adding, and should be modeled unde=
r
>     a new chassis resource  /redfish/v1/Chassis/<Chassis name>, and by
>     issuing a ForceReset action to it.  I know in the past, for systems
>     that weren't capable of initiating a full chassis reset, we've modele=
d
>     this as a host reset for compatibility purposes.  It should be noted,
>     this is arguably "wrong" but kept around because we weren't prepared
>     to break client implementations that expected that action to be there=
.
>
>     As a side note, is anyone a PMBUS expert?  A quick look at the spec
>     seems like there should be a way to issue an AC-reset to a PMBUS
>     enabled power supply, but I got stuck reading the docs, given the
>     complexities of modern power supplies.  Is there someone that just
>     knows the magic string to send to it?  In that way, we could implemen=
t
>     the above in the "right" way, while still not breaking peoples
>     compatibility with the older interfaces.  Now back to Vijay.
>
>     I'm assuming a lot of this is in context to your current patch:
>     https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gerrit.openbmc=
-2Dproject.xyz_c_openbmc_bmcweb_-2B_36557&d=3DDwIFaQ&c=3D5VD0RTtNlTh3ycd41b=
3MUw&r=3Dv9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=3DWsoH-XNAOK3Qh6X9q0=
ZjO_7QfoFm35nc2VMby37UTgQ&s=3D1IYYiDRN_ZeEB6NAu1X3kgvDNYCopzpgvsEXqqFVmH4&e=
=3D
>
>     Your existing patch doesn't work because you're modifying the
>     Redfish-provided enums to add your new action, when redfish would
>     recommend adding a resource specific to that physical box that can
>     call your new endpoint.
> I didn't know about redfish action schema, I will change that.

The Redfish actions are how all power state changes are modeled today.
It's a good thing to know if you're diving into this stuff.

>
>     >
>     >
>     >
>     > Redfish defines only above 2 type and system reset can be covered u=
nder chassis reset.
>
>     I'm not really following this.  Redfish exposes the different types
>     you need through multiple Chassis Resources.  If you have a higher
>     level chassis that contains items below it, you would have a new
>     Chassis resource, which implements a Reset action on it.
>
>     I'm going to go out on a limb and assume you're working on Tioga for =
a
>     moment.  I would expect that the Tioga Sled to have one chassis, and
>     the Tioga BladeCenter to have another chassis, with ContainedBy,
>     Contains, and PoweredBy links in the appropriate places on each.
>
>     > As per implementation in x86-power-control, host reset and chassis =
reset both takes same action like rebooting host only. For system reset it =
has a separate interface system_chassis0 and PowerCycle command triggers th=
is reset.
>
>     I'm really surprised that this chassis level reset would go in
>     x86-power-control.  That daemon is really for host level control, not
>     chassis, and considering that almost every implementation is going to
>     have a different way to "pull the power" I'd expect these to go in a
>     different repo, or at the very least a different application, so the
>     various BMCs can swap them out with the correct one for their chassis=
.
>     I probably missed a discussion on this a while back.
>
> This was added as a  systemd target call on this command. So power contro=
l will
> Call user defined system reset target service on issue or system reset co=
mmand
> And each platform can develop their own target like setting some i2c regi=
ster or
> Setting some gpio.

That's a good extension mechanism, but really it should live in a
separate daemon.  Not all power state management requires systemd
targets, or can handle the latency imposed there.  Also there are a
lot of cases that can fail in hardware, and require holding the
message return to dbus until the hardware has been exercised, and that
kinds of error handling tend to be difficult to do on systemd
targets..

>
>     >
>     >
>     >
>     > Please help me how do I support this system reset in redfish.
>
>     Hopefully the above helps!
> Thanks, It does helps a lot. I would submit a new patch.

Great.  Happy to help.

>
>     >
>     >
>     >
>     > Regards
>     >
>     > -Vijay
>
