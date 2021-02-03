Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E7B30DF51
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 17:12:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW6CC2b7xzDx05
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 03:12:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=OxwXaOd+; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW6B81cKbzDwlH
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2021 03:11:24 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id p15so24964518wrq.8
 for <openbmc@lists.ozlabs.org>; Wed, 03 Feb 2021 08:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1YOfa4DC4rIvtY4efrVke0T4nlwjwSvN3Ktw4HmomQY=;
 b=OxwXaOd+9oV6ioB+x0i0BEJ/+0IOJ9lD/30guUMy6f+yfJlnjau+1ulOZzRxFcq0qd
 3preK7tKXpCwS53YUZFBIfeZ00ZoXBc1vj7rJuFec2cZPas27LqAWc81JvmTIQ3lvm8B
 S/ce9B6dzak6vBm7s53JysjlF4D/SDhfjBGbj8i7YhJMyBnpsAINEkYOUFwN5bDocAXT
 oaKjl8nrZ3+EDzhylepLnd08LGE8JxuPD+S4DEMyREkUfuZqA8t10bgCuHxWBg0aJ81R
 uJMf2a9+pYA3PPwIrEvUzTlsKiGk1PbNwG+e/C7Ty3orNKn0eP0KB+CRIp8VichX0ca/
 LLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1YOfa4DC4rIvtY4efrVke0T4nlwjwSvN3Ktw4HmomQY=;
 b=nxSWBby4Xs6/QcEkvkpEfAsIyDSvvQ9KfG7evCGcwFDR543qBuBqt/HlLBHXGYcPQm
 FUylNT2qzb9kB622R+n3uLvBIc+b1zzLhLkrZTLn8kDSPiR7UFv0FfXveY6y7thRPQD1
 XB7U8k6XgtT/uN09fupeXTtZghrupok0vUiPyqwrB5HakrkUdgpHtNkn2lhAie4RSfbL
 MhlEq6BPXBEQIbkbq28I1UBeb2TEBSZtzFWzvGgmHg01FAixWQNRD1ERRYTNnGJY9thZ
 4612DDA+GDa0kVThZaOO95QAElF1+Trbm8HSvsd1lgWqajd1cZ/2l+1FvthhH0i4vCxS
 ydaw==
X-Gm-Message-State: AOAM531H96yhYkm8xyTivQMHN0tqtMt2dgu0CUciwv2gipTNXjC6na0J
 wy7PGW/CzujyZTS4ZLSPDCRfLj4ofs89MxLLihyhWA==
X-Google-Smtp-Source: ABdhPJxAhTCKJTvMwc+tY5S7bYpjXUi+V+YOlGCumteXXtuZlaDsRGzcNTHx/YJ3nT3Wvc0Y8FHwMTHYmBjf7nrnrBE=
X-Received: by 2002:a5d:49cf:: with SMTP id t15mr4286320wrs.217.1612368675208; 
 Wed, 03 Feb 2021 08:11:15 -0800 (PST)
MIME-Version: 1.0
References: <TYZPR04MB441643EFC954C795DD1290A886BB0@TYZPR04MB4416.apcprd04.prod.outlook.com>
 <CAH2-KxA20CfM9upvUkB=jhapVNF4AdVROA4wafFxxYftmvwO=w@mail.gmail.com>
 <HK0PR04MB2564A9FFB0B2C5116BC409C286B49@HK0PR04MB2564.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB2564A9FFB0B2C5116BC409C286B49@HK0PR04MB2564.apcprd04.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 3 Feb 2021 08:11:02 -0800
Message-ID: <CAH2-KxCaq+qXbPMiM=N8RN4MdYNYmYKF8zC07HVZ7ySTob9voA@mail.gmail.com>
Subject: Re: [entity-manager] Issue about entity-manager getting stuck
To: =?UTF-8?B?U2Nyb24gQ2hhbmcgKOW8teS7suW7tik=?= <Scron.Chang@quantatw.com>
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

On Tue, Feb 2, 2021 at 11:22 PM Scron Chang (=E5=BC=B5=E4=BB=B2=E5=BB=B6)
<Scron.Chang@quantatw.com> wrote:
>
> Hi Ed,
> Thanks for your reply.
>
> In my case, I have a script using the following command to check the host=
 status and then resetting the peci module based on its result.
> busctl get-property xyz.openbmc_project.State.Chassis /xyz/openbmc_projec=
t/state/os xyz.openbmc_project.State.OperatingSystem.Status OperatingSystem=
State

This sounds like something that should be using a match expression
rather than polling every second.  If you did that, your problem would
likely go away (and your system would be better off as a whole for
it).

>
> Now I understood the reason why entity-manager catch the nameOwnerChanged=
 signal.
> However, please allow me to discuss one question furthermore. How does en=
tity-manager define the waiting time for the system to become ready? Accord=
ing to the source code, the current waiting time is 5 seconds.
> (Please refer to this line:
> https://github.com/openbmc/entity-manager/blob/f094125cd3bdbc8737dc8035a6=
e9ac252f6e8840/src/EntityManager.cpp#L1687)
>
> If the waiting time can change to 1 second, the entity-manager's response=
 can become faster and barely get stuck. I found entity-manager did use 1 s=
econd before this PR.
> (Please refer to this PR:
> https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/25193)
>
> In this PR, there is not much comment. May I ask the reason for changing =
the waiting time? And what should be concerned if entity-manager uses the s=
horter waiting time?

All the properties changed events can take more than a second to
process.  5 seconds is on the safe size.


PS, please don't top post.   This mailing list prefers inline replies.

>
> Scron Chang
> E-Mail  Scron.Chang@quantatw.com
> Ext.    11936
>
>
> -----Original Message-----
> From: Ed Tanous <edtanous@google.com>
> Sent: Thursday, January 28, 2021 1:07 AM
> To: Scron Chang (=E5=BC=B5=E4=BB=B2=E5=BB=B6) <Scron.Chang@quantatw.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: [entity-manager] Issue about entity-manager getting stuck
>
> On Tue, Jan 26, 2021 at 10:34 PM Scron Chang (=E5=BC=B5=E4=BB=B2=E5=BB=B6=
)
> <Scron.Chang@quantatw.com> wrote:
> >
> > Hi all,
> >
> > I am using openbmc/entity-manager in this version: "f094125cd3bdbc8737d=
c8035a6e9ac252f6e8840" and I found calling Dbus makes entity-manager get st=
uck.
> >
> > Reproduce this by following steps:
> > 1. systemctl stop xyz.openbmc_project.EntityManager 2. open another
> > terminal and do this while-loop: "while true; do busctl ; sleep 1; done=
"
> > 3. systemctl start xyz.openbmc_project.EntityManager I think the root
> > cause is this function: "nameOwnerChangedMatch." (Please refer to this
> > line:
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
h
> > ub.com%2Fopenbmc%2Fentity-manager%2Fblob%2Ff094125cd3bdbc8737dc8035a6e
> > 9ac252f6e8840%2Fsrc%2FEntityManager.cpp%23L1859&amp;data=3D04%7C01%7CSc=
r
> > on.Chang%40quantatw.com%7C31b46c0c041b402dc3d608d8c2e5f9dd%7C179b03270
> > 7fc4973ac738de7313561b2%7C1%7C0%7C637473640299652770%7CUnknown%7CTWFpb
> > GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> > %3D%7C1000&amp;sdata=3DVcBRR5%2BTG%2FFscHR14bsDMqghE73qRhGYhztE25FKIzE%=
3
> > D&amp;reserved=3D0.)
>
> My first thought is: Don't run an empty busctl in a loop then, but I'm gu=
essing that's not what you're really trying to do.  If we had more ideas ab=
out what you were really hoping to accomplish, we might have some better ad=
vice for how to proceed.
>
> The intent of that code is to reconfigure entity-manager when interfaces =
are changed, so if you're constantly attaching and detaching to dbus, entit=
y-manager (and object manager) never sees the system as "up" and keeps wait=
ing for the system to finish stabilizing before it runs the config logic.
>
> In your specific case above, the code could be a little smarter, and igno=
re unique names in that check, only caring about newly-defined well known n=
ames, but without knowing your real use case, it's hard to know if that wou=
ld help.
>
> >
> > Manually calling Dbus or calling Dbus in a script makes NameOwnerChange=
d signal and thus triggers the function: "propertiesChangedCallback" repeat=
edly. Meanwhile, the async_wait in propertiesChangedCallback gets returned =
because of the operation_aborted.
>
> Personal opinion: Don't call busctl continuously in a script.  It's ineff=
icient, and causes problems like this.
>
> > So here is the conclusion:
> > Manually calling Dbus in a period that is less than 5 seconds leads ent=
ity-manager keeping to trigger new async_wait and abort the old one. Howeve=
r, the async_wait never gets done.
> >
> > Is this a bug of entity-manager, or I get something wrong. Please help =
me with this.
>
> IMO, entity-manager is working as intended, but lets try to figure out wh=
at you're really trying to do, and see if we can find you a solution.
>
> >
> > Scron Chang
> > E-Mail  Scron.Chang@quantatw.com
> >
