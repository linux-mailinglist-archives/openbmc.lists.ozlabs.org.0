Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0791312C0
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 14:22:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rx592TGjzDqBt
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 00:22:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=tyler.sabdon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QRz+SRre"; 
 dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rx3h6V5szDqFY
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 00:21:20 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id 2so26966866pfg.12
 for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2020 05:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JEbiDLBi+FDBYJ3plJTl3vKJqXrCDkQBh0/O3Z1z5Kc=;
 b=QRz+SRrey1tw4P3xDb06lFlxfrrdBmZBLBw8EKJ7+37RRF19eC9EwXm64e1tiFm9KZ
 9FzaDPs4AlnMlFXZxQx+J/3SQ5j4IWAsgF2V1TnVhVBDqo/f2JSAjSVP9iDxXhtgWcks
 iHIsxyKHhnPh8oJZNFpjruHLIzwuwKkKzAqSeR9NfsfTR7/kXpZLCYCgN1RgrufF92WI
 IdnsRVraG/Wa9lLa0w+gEogNEsEkFEo6rqcpHaDn/UEdofJyh9SgeigD7msnpDwF9u8B
 sBGrPJEV0FUoFs0lWdx5PH4CBfCr5flZcs6aNhVl1PZXbp2SEwX9p4KF+BBwVWrwkriO
 wKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JEbiDLBi+FDBYJ3plJTl3vKJqXrCDkQBh0/O3Z1z5Kc=;
 b=MxUwe99pxI2CU6NuxIEWB55e73fT7+k/DnfgDtSQ67T8vg9yBtMF2VMOSJMrU/balM
 HyFOqjQK5qS9eCMDC72y0aDBBrziMWV5024fAZnhubv2Nd23TSL0xhduKm+ZFO7vtAYT
 D6wJhfXGCvKeh8UaaEPg5uWPd6tV3U9clyoGsT3ZMVWiUC47dMZznZFTRlJD1ERp653o
 pXci7S9y2caZboo7Wtda4CG1t/H1W+t8KqIB3yGFQPJI6HqaybYj0T+AqlHya/+tyWbK
 7GW7KLOwrSD4OhTLWYQ7vCupvFwSuLt08PVnyX4mFvexqZuXv/sQnUIYGzYmuZL5axjt
 6jNw==
X-Gm-Message-State: APjAAAUlML6sbHdl8CZoUhHYNIC/I+w4BqUvi1hHdfE/NHAC5C8cMR+r
 iSBVf0neOQZgrrHv4vxn6Gvwi08eCYRyEYiLIqU=
X-Google-Smtp-Source: APXvYqyj/P2dqiZt4oSp2TzrNeuvIOGn9zuepHaTBaR+9LiydMfJaqIGRb6GF5W2WDGdKSN03Zc45r6Yd6pwcxGZtAs=
X-Received: by 2002:a05:6a00:2ae:: with SMTP id
 q14mr108778130pfs.155.1578316876041; 
 Mon, 06 Jan 2020 05:21:16 -0800 (PST)
MIME-Version: 1.0
References: <6d26931a.d7c4.16f3cc7df52.Coremail.zhang_cy1989@163.com>
 <HK0PR03MB4660E4CBAC59CFBDFBD16525CF2B0@HK0PR03MB4660.apcprd03.prod.outlook.com>
 <6d3c538d.4fd2.16f40026df2.Coremail.zhang_cy1989@163.com>
 <HK0PR03MB46603D582930A30113B225A0CF2B0@HK0PR03MB4660.apcprd03.prod.outlook.com>
 <497fe31a.5fa1.16f402e2506.Coremail.zhang_cy1989@163.com>
In-Reply-To: <497fe31a.5fa1.16f402e2506.Coremail.zhang_cy1989@163.com>
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Mon, 6 Jan 2020 21:20:59 +0800
Message-ID: <CAO9PYRLmQfM1Tua5hBcP-RCoW76z+AihPa7S_cOy_NWQ6dZ4aQ@mail.gmail.com>
Subject: Re: RE: Re:RE: systemctl start obmc-host-start@0.target fail
To: zhang_cy1989 <zhang_cy1989@163.com>
Content-Type: multipart/alternative; boundary="000000000000bd5301059b7888d8"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 CS20 CHLi30 <CHLI30@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000bd5301059b7888d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all:
    Thanks for your sharing and that's really helpful. I still have a
question for chassis power on/off.  I add service to run poweron shell
while obmc-host-start@t0.target triggered and run poweroff shell while
obms-host-shutdown@0.target triggered. After issuing chassis power on
command, my platform can power on system but power off after few seconds. I
check journalctl as below:
Jan 06 11:05:39   systemd[1]: Starting Start Watchdog0...
Jan 06 11:05:39   systemd[1]: Starting Assert bmc_booted LED...
Jan 06 11:05:39   phosphor-watchdog[352]: watchdog: enabled and started
Jan 06 11:05:39   phosphor-ledmanager[222]: [[0;1;31m[[0;1;39m[[0;1;31mNo
service providers for physical LED[[0m
Jan 06 11:05:39   systemd[1]: Started Start Watchdog0.
Jan 06 11:05:39   systemd[1]: Started Assert bmc_booted LED.
Jan 06 11:05:39   systemd[1]: Reached target Start Host0 Minimum.
Jan 06 11:05:39   systemd[1]: Reached target Start Host0.
Jan 06 11:05:39   systemd[1]: Startup finished in 4.527s (kernel) + 1min
32.169s (userspace) =3D 1min 36.697s.
Jan 06 11:05:39   phosphor-host-state-manager[315]: Received signal that
host is running
Jan 06 11:05:39   phosphor-host-state-manager[315]: Change to Host State
Jan 06 11:05:39   phosphor-timemanager[320]: Changing time settings is
*deferred* now
Jan 06 11:06:09   phosphor-watchdog[352]: watchdog: Timed out
Jan 06 11:06:09   systemd[1]: unit_file_find_fragment:
obmc-host-timeout@.target+0
=E2=86=92 obmc-host-timeout@0.target
Jan 06 11:06:09   phosphor-watchdog[352]: watchdog: disabled
Jan 06 11:06:09   systemd[1]: Reached target Quiesce Target.
Jan 06 11:06:09   systemd[1]: Reached target Host instance 0 timed out
refreshing Watchdog.
Jan 06 11:06:09   systemd[1]: Stopping Phosphor poweron watchdog...
Jan 06 11:06:09   systemd[1]: phosphor-watchdog@poweron.service: Succeeded.
Jan 06 11:06:09   systemd[1]: Stopped Phosphor poweron watchdog.
Jan 06 11:06:09   phosphor-host-state-manager[315]: Auto reboot enabled,
rebooting
Jan 06 11:06:09   phosphor-host-state-manager[315]: Beginning reboot...
Jan 06 11:06:09   phosphor-host-state-manager[315]: Host State transaction
request
Jan 06 11:06:09   systemd[1]: unit_file_find_fragment:
obmc-host-reboot@.target+0
=E2=86=92 obmc-host-reboot@0.target
Jan 06 11:06:09   systemd[1]: unit_file_find_fragment:
obmc-host-shutdown@.target+0
=E2=86=92 obmc-host-shutdown@0.target
Jan 06 11:06:09   systemd[1]: unit_file_find_fragment:
obmc-host-stopping@.target+0
=E2=86=92 obmc-host-stopping@0.target
Jan 06 11:06:09   systemd[1]: unit_file_find_fragment:
obmc-host-stopped@.target+0
=E2=86=92 obmc-host-stopped@0.target
Jan 06 11:06:09   systemd[1]: unit_file_find_fragment:
obmc-power-stop-pre@.target+0
=E2=86=92 obmc-power-stop-pre@0.target
Jan 06 11:06:09   systemd[1]: unit_file_find_fragment:
obmc-host-stop-pre@.target+0
=E2=86=92 obmc-host-stop-pre@0.target
Jan 06 11:06:09   systemd[1]: Created slice
system-phosphor\x2dreboot\x2dhost.slice.
Jan 06 11:06:09   systemd[1]: Reached target Chassis0 (Power Off).
Jan 06 11:06:09   systemd[1]: Stopped target Start Host0.
Jan 06 11:06:09   systemd[1]: Stopped target Start Host0 Minimum.
Jan 06 11:06:09   systemd[1]: Reached target Stop Host0 (Pre).
Jan 06 11:06:09   systemd[1]: Stopped target Host instance 0 timed out
refreshing Watchdog.
Jan 06 11:06:09   systemd[1]: Stopped target Quiesce Target.
Jan 06 11:06:09   systemd[1]: Starting Configure GPIOs for Host Power
Control...
Jan 06 11:06:09   systemd[1]: Starting Wait for /org/openbmc/HostIpmi/1...
Jan 06 11:06:09   systemd[1]: Started Reboot host0.
Jan 06 11:06:09   init_once.sh[404]: init_once.sh
Jan 06 11:06:09   phosphor-chassis-state-manager[290]: Received signal that
power OFF is complete
Jan 06 11:06:09   phosphor-chassis-state-manager[290]: Change to Chassis
Power State
Jan 06 11:06:09   systemd[1]: Started Configure GPIOs for Host Power
Control.
Jan 06 11:06:09   systemd[1]: Starting Stop Host...
Jan 06 11:06:09   poweroff.sh[408]: out -> poweroff

The power on process suspended by phosphor-watchdog timeout. I have no idea
to clear watchdog timer. Could you provide any suggestion for this
situation? Thanks.

Tyler.

zhang_cy1989 <zhang_cy1989@163.com> =E6=96=BC 2019=E5=B9=B412=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8811:11=E5=AF=AB=E9=81=93=EF=BC=
=9A

> Dear Tim
>   Thanks a milion.
>   The infromation is very useful for me.
>
>   Thank you again for your prompt reply.
>
>   Best Regards
>
> Felix
> =E5=9C=A8 2019-12-26 10:32:54=EF=BC=8C"CS20 CHLi30" <CHLI30@nuvoton.com> =
=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Felixzhang,
>
>
>
> Yes, you can using op-power-control on X86 motherboard for sure.
>
>
>
> Example about using op-power-control:
>
> systemctl list-dependencies obmc-host-start@0.target
>
>
>
> obmc-host-start@0.target (Power ON)
>
> -> mapper-wait@-org-openbmc-control-chassis0.service
>
> -> phosphor-reset-host-reboot-attempts@0.service
>
> -> obmc-host-startmin@0.target
>
>      -> mapper-wait@-org-openbmc-control-chassis0.service
>
>      -> obmc-enable-host-watchdog@0.service
>
>      -> phosphor-watchdog@poweron.service
>
>      -> obmc-chassis-poweron@0.target
>
>           -> op-power-start@0.service
>
>           -> mapper-wait@-xyz-openbmc_project-state-chassis0.service
>
>           -> phosphor-fan-control-init@0.service
>
>           -> phosphor-fan-monitor-init@0.service
>
>           -> phosphor-fan-presence-tach@0.service
>
>
>
> BTW, here is the list about the sequence of obmc-host-start@0.target for
> you refer it.
>
> When you presss Power ON button from WebUI the state
> RequestedHostTransition change to ON, what happens behind that is done by
> systemd units, roughly described as below:
>
> 1.      Host state manager starts *obmc-host-start@0.target*
>
> 2.      The above target requires *obmc-host-startmin@0.target*
>
> 3.      The above target requires *obmc-chassis-poweron@0.target* and
> *start_host@0.service*
>
> 4.      *obmc-chassis-poweron@0.target* requires
> *op-power-start@0.service* and *op-wait-power-on@0.service*
>
> 5.      *op-power-start@0.service* is to call the PowerControl service to
> DC on. And *op-wait-power-on@0.service* is to wait for PGood after DC on.
>
> 6.      After that (DC is on and PGood is OK), *start_host@0.service* is
> to start the host CPU.
>
>
>
> Best regards,
>
> Tim
>
> *From:* zhang_cy1989 [mailto:zhang_cy1989@163.com]
> *Sent:* Thursday, December 26, 2019 10:22 AM
> *To:* CS20 CHLi30 <CHLI30@nuvoton.com>
> *Cc:* openbmc@lists.ozlabs.org
> *Subject:* Re:RE: systemctl start obmc-host-start@0.target fail
>
>
>
> Dear,Tim
>
>    Thank you for guidance.
>
>    I will study the dbus-monitor and the dependencies of
> obmc-host-start@0.target.
>
>  @CS20 CHLi30
>
>   I need ask you another advice.
>
>
>
>   I use the romulus recipes to build BMC firmware. And use this fw to the
> X86 motherboard + AST2500.
>
>   The romulus is base on openpower. And my platform is X86 motherboard.
>
>   *Is it feasible that using romulus BMC firmware to X86 motherboard,
> specially the power control part?*
>
>
>
>   Would you have better suggestion?
>
>
>
>   Looking forward to your replay.
>
>
>
>  Best Regards
>
>  Felixzhang
>
>
>
> At 2019-12-26 09:34:09, "CS20 CHLi30" <CHLI30@nuvoton.com> wrote:
>
> Hi Felixzhang,
>
>
>
> About this kind of systemd target start fail, you can use *dbus-monitor*
> to check target dependency more detail.
>
> BTW, you can also use *systemctl list-dependecies
> obmc-host-start@0.target <obmc-host-start@0.target>* to get all related
> services.
>
>
>
> For example for using x86-power-control:
>
> *systemctl list-dependencies obmc-host-start@0.target
> <obmc-host-start@0.target>*
>
>
>
> obmc-host-start@0.target (Power ON)
>
> -> mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.service
>
> -> phosphor-reset-host-reboot-attempts@0.service
>
> -> obmc-host-startmin@0.target
>
>      -> mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.service
>
>      -> obmc-enable-host-watchdog@0.service
>
>      -> phosphor-watchdog@poweron.service
>
>      -> obmc-chassis-poweron@0.target
>
>           -> intel-power-start@0.service
>
>           ->
> mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.service
>
>           -> phosphor-fan-control-init@0.service
>
>           -> phosphor-fan-monitor-init@0.service
>
>           -> phosphor-fan-presence-tach@0.service
>
>
>
> Then you should found that might some services doesn=E2=80=99t start norm=
ally and
> cause your obmc-host-tart@0.target start fail.
>
>
>
> Best regards,
>
> Tim
>
> *From:* openbmc [
> mailto:openbmc-bounces+chli30=3Dnuvoton.com@lists.ozlabs.org
> <openbmc-bounces+chli30=3Dnuvoton.com@lists.ozlabs.org>] *On Behalf Of *
> zhang_cy1989
> *Sent:* Wednesday, December 25, 2019 7:19 PM
> *To:* openbmc@lists.ozlabs.org
> *Subject:* systemctl start obmc-host-start@0.target fail
>
>
>
>
>
> Dear All
>
>    On ast2500+x86 platform, use the romulus bmc firmware, the detail
> information:
>
> *ID=3D"openbmc-phosphor"*
> *NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"*
> *VERSION=3D"2.7.0-0"*
> *VERSION_ID=3D"2.7.0-0-gcb91a7773-dirty"*
> *PRETTY_NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Dist=
ro)
> 2.7.0-0"*
> *BUILD_ID=3D"2.7.0"*
> *OPENBMC_TARGET_MACHINE=3D"romulus"*
>
>
>
>   The BMC ip: 192.168.0.1
>
>   Remote Computer ip: 192.168.0.2
>
>
>
>   I use the ipmitool to communicate with BMC:
>
> ipmitool -I lanplus -H 192.168.0.1 -U root -P 0penBmc power on
>
>
>
>  And from the journalctl results, I found those infromations:
>
> ......
>
> -- The unit op-wait-power-on@0.service has entered the 'failed' state
> with result 'timeout'.
> Nov 28 07:55:47 romulus systemd[1]: Failed to start Wait for Power0 to
> turn on.
> -- Subject: A start job for unit op-wait-power-on@0.service has failed
> -- Defined-By: systemd
> -- Support: https://lists.freedesktop.org/mailman/listinfo/systemd-devel
> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.freedesktop=
.org_mailman_listinfo_systemd-2Ddevel&d=3DDwMGbg&c=3Due8mO8zgC4VZ4q_aNVKt8G=
9MC01UFDmisvMR1k-EoDM&r=3D_vvS1tH9U_15yp1--_mdcWxVamV74LY4Xz5Zy4-7UIo&m=3DE=
hLiDsjPMBS98eeZEQG2UAHMPrvbvGb_OublwmQy2uc&s=3DUO9vddeGuzrgEFSgZkdgqCUEsjWH=
cXBofqYYlHxCNkM&e=3D>
> --
> -- A start job for unit op-wait-power-on@0.service has finished with a
> failure.
> --
> -- The job identifier is 906 and the job result is failed.
> Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Chassis0 (Power
> On).
> -- Subject: A start job for unit obmc-chassis-poweron@0.target has failed
> -- Defined-By: systemd
> -- Support: https://lists.freedesktop.org/mailman/listinfo/systemd-devel
> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.freedesktop=
.org_mailman_listinfo_systemd-2Ddevel&d=3DDwMGbg&c=3Due8mO8zgC4VZ4q_aNVKt8G=
9MC01UFDmisvMR1k-EoDM&r=3D_vvS1tH9U_15yp1--_mdcWxVamV74LY4Xz5Zy4-7UIo&m=3DE=
hLiDsjPMBS98eeZEQG2UAHMPrvbvGb_OublwmQy2uc&s=3DUO9vddeGuzrgEFSgZkdgqCUEsjWH=
cXBofqYYlHxCNkM&e=3D>
> --
> -- A start job for unit obmc-chassis-poweron@0.target has finished with a
> failure.
> --
> -- The job identifier is 886 and the job result is dependency.
> Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Start Host0
> Minimum.
> -- Subject: A start job for unit obmc-host-startmin@0.target has failed
> -- Defined-By: systemd
> -- Support: https://lists.freedesktop.org/mailman/listinfo/systemd-devel
> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.freedesktop=
.org_mailman_listinfo_systemd-2Ddevel&d=3DDwMGbg&c=3Due8mO8zgC4VZ4q_aNVKt8G=
9MC01UFDmisvMR1k-EoDM&r=3D_vvS1tH9U_15yp1--_mdcWxVamV74LY4Xz5Zy4-7UIo&m=3DE=
hLiDsjPMBS98eeZEQG2UAHMPrvbvGb_OublwmQy2uc&s=3DUO9vddeGuzrgEFSgZkdgqCUEsjWH=
cXBofqYYlHxCNkM&e=3D>
> --
> -- A start job for unit obmc-host-startmin@0.target has finished with a
> failure.
> --
> -- The job identifier is 752 and the job result is dependency.
> Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Start Host0.
> -- Subject: A start job for unit obmc-host-start@0.target has failed
> -- Defined-By: systemd
> -- Support: https://lists.freedesktop.org/mailman/listinfo/systemd-devel
> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.freedesktop=
.org_mailman_listinfo_systemd-2Ddevel&d=3DDwMGbg&c=3Due8mO8zgC4VZ4q_aNVKt8G=
9MC01UFDmisvMR1k-EoDM&r=3D_vvS1tH9U_15yp1--_mdcWxVamV74LY4Xz5Zy4-7UIo&m=3DE=
hLiDsjPMBS98eeZEQG2UAHMPrvbvGb_OublwmQy2uc&s=3DUO9vddeGuzrgEFSgZkdgqCUEsjWH=
cXBofqYYlHxCNkM&e=3D>
> --
> -- A start job for unit obmc-host-start@0.target has finished with a
> failure.
>
> Nov 28 08:24:09 romulus systemd[1]: obmc-host-start@0.target: Job
> obmc-host-start@0.target/start failed with result 'dependency'.
> Nov 28 08:24:09 romulus systemd[1]: obmc-host-start@0.target: Triggering
> OnFailure=3D dependencies.
> Nov 28 08:24:10 romulus systemd[1]: obmc-host-startmin@0.target: Job
> obmc-host-startmin@0.target/start failed with result 'dependency'.
> Nov 28 08:24:10 romulus systemd[1]: obmc-host-startmin@0.target:
> Triggering OnFailure=3D dependencies.
> Nov 28 08:24:10 romulus systemd[1]: obmc-chassis-poweron@0.target: Job
> obmc-chassis-poweron@0.target/start failed with result 'dependency'.
> Nov 28 08:24:10 romulus systemd[1]: obmc-chassis-poweron@0.target:
> Triggering OnFailure=3D dependencies.
>
> ......
>
>
>
> I alse do the following action:
>
> *systemctl start obmc-host-start@0.target <obmc-host-start@0.target> *
>
> And alse get the similar fail result.
>
>
>
> I don't how to debug this isuue.Could you give me some suggestions?
>
>
>
> Best Regards
>
> Felixzhang
>
>
>
>
>
>
>
>
>
>
>
>
> ------------------------------
>
> The privileged confidential information contained in this email is
> intended for use only by the addressees as indicated by the original send=
er
> of this email. If you are not the addressee indicated in this email or ar=
e
> not responsible for delivery of the email to such a person, please kindly
> reply to the sender indicating this fact and delete all copies of it from
> your computer and network server immediately. Your cooperation is highly
> appreciated. It is advised that any unauthorized use of confidential
> information of Nuvoton is strictly prohibited; and any information in thi=
s
> email irrelevant to the official business of Nuvoton shall be deemed as
> neither given nor endorsed by Nuvoton.
>
>
>
>
> ------------------------------
> The privileged confidential information contained in this email is
> intended for use only by the addressees as indicated by the original send=
er
> of this email. If you are not the addressee indicated in this email or ar=
e
> not responsible for delivery of the email to such a person, please kindly
> reply to the sender indicating this fact and delete all copies of it from
> your computer and network server immediately. Your cooperation is highly
> appreciated. It is advised that any unauthorized use of confidential
> information of Nuvoton is strictly prohibited; and any information in thi=
s
> email irrelevant to the official business of Nuvoton shall be deemed as
> neither given nor endorsed by Nuvoton.
>
>
>
>
>

--000000000000bd5301059b7888d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all:<div>=C2=A0 =C2=A0 Thanks for your sharing and that=
&#39;s really helpful. I still have a question for chassis power on/off.=C2=
=A0 I add service to run poweron shell while obmc-host-start@t0.target trig=
gered and run poweroff shell while obms-host-shutdown@0.target triggered. A=
fter issuing chassis power on command, my platform can power on system but =
power off after few seconds. I check journalctl as below:</div>Jan 06 11:05=
:39 =C2=A0 systemd[1]: Starting Start Watchdog0...<br>Jan 06 11:05:39 =C2=
=A0 systemd[1]: Starting Assert bmc_booted LED...<br>Jan 06 11:05:39 =C2=A0=
 phosphor-watchdog[352]: watchdog: enabled and started<br>Jan 06 11:05:39 =
=C2=A0 phosphor-ledmanager[222]: [[0;1;31m[[0;1;39m[[0;1;31mNo service prov=
iders for physical LED[[0m<br>Jan 06 11:05:39 =C2=A0 systemd[1]: Started St=
art Watchdog0.<br>Jan 06 11:05:39 =C2=A0 systemd[1]: Started Assert bmc_boo=
ted LED.<br>Jan 06 11:05:39 =C2=A0 systemd[1]: Reached target Start Host0 M=
inimum.<br>Jan 06 11:05:39 =C2=A0 systemd[1]: Reached target Start Host0.<b=
r>Jan 06 11:05:39 =C2=A0 systemd[1]: Startup finished in 4.527s (kernel) + =
1min 32.169s (userspace) =3D 1min 36.697s.<br>Jan 06 11:05:39 =C2=A0 phosph=
or-host-state-manager[315]: Received signal that host is running<br>Jan 06 =
11:05:39 =C2=A0 phosphor-host-state-manager[315]: Change to Host State<br>J=
an 06 11:05:39 =C2=A0 phosphor-timemanager[320]: Changing time settings is =
*deferred* now<br>Jan 06 11:06:09 =C2=A0 phosphor-watchdog[352]: watchdog: =
Timed out<br>Jan 06 11:06:09 =C2=A0 systemd[1]: unit_file_find_fragment: ob=
mc-host-timeout@.target+0 =E2=86=92 obmc-host-timeout@0.target<br>Jan 06 11=
:06:09 =C2=A0 phosphor-watchdog[352]: watchdog: disabled<br>Jan 06 11:06:09=
 =C2=A0 systemd[1]: Reached target Quiesce Target.<br>Jan 06 11:06:09 =C2=
=A0 systemd[1]: Reached target Host instance 0 timed out refreshing Watchdo=
g.<br>Jan 06 11:06:09 =C2=A0 systemd[1]: Stopping Phosphor poweron watchdog=
...<br>Jan 06 11:06:09 =C2=A0 systemd[1]: phosphor-watchdog@poweron.service=
: Succeeded.<br>Jan 06 11:06:09 =C2=A0 systemd[1]: Stopped Phosphor poweron=
 watchdog.<br>Jan 06 11:06:09 =C2=A0 phosphor-host-state-manager[315]: Auto=
 reboot enabled, rebooting<br>Jan 06 11:06:09 =C2=A0 phosphor-host-state-ma=
nager[315]: Beginning reboot...<br>Jan 06 11:06:09 =C2=A0 phosphor-host-sta=
te-manager[315]: Host State transaction request<br>Jan 06 11:06:09 =C2=A0 s=
ystemd[1]: unit_file_find_fragment: obmc-host-reboot@.target+0 =E2=86=92 ob=
mc-host-reboot@0.target<br>Jan 06 11:06:09 =C2=A0 systemd[1]: unit_file_fin=
d_fragment: obmc-host-shutdown@.target+0 =E2=86=92 obmc-host-shutdown@0.tar=
get<br>Jan 06 11:06:09 =C2=A0 systemd[1]: unit_file_find_fragment: obmc-hos=
t-stopping@.target+0 =E2=86=92 obmc-host-stopping@0.target<br>Jan 06 11:06:=
09 =C2=A0 systemd[1]: unit_file_find_fragment: obmc-host-stopped@.target+0 =
=E2=86=92 obmc-host-stopped@0.target<br>Jan 06 11:06:09 =C2=A0 systemd[1]: =
unit_file_find_fragment: obmc-power-stop-pre@.target+0 =E2=86=92 obmc-power=
-stop-pre@0.target<br>Jan 06 11:06:09 =C2=A0 systemd[1]: unit_file_find_fra=
gment: obmc-host-stop-pre@.target+0 =E2=86=92 obmc-host-stop-pre@0.target<b=
r>Jan 06 11:06:09 =C2=A0 systemd[1]: Created slice system-phosphor\x2dreboo=
t\x2dhost.slice.<br>Jan 06 11:06:09 =C2=A0 systemd[1]: Reached target Chass=
is0 (Power Off).<br>Jan 06 11:06:09 =C2=A0 systemd[1]: Stopped target Start=
 Host0.<br>Jan 06 11:06:09 =C2=A0 systemd[1]: Stopped target Start Host0 Mi=
nimum.<br>Jan 06 11:06:09 =C2=A0 systemd[1]: Reached target Stop Host0 (Pre=
).<br>Jan 06 11:06:09 =C2=A0 systemd[1]: Stopped target Host instance 0 tim=
ed out refreshing Watchdog.<br>Jan 06 11:06:09 =C2=A0 systemd[1]: Stopped t=
arget Quiesce Target.<br>Jan 06 11:06:09 =C2=A0 systemd[1]: Starting Config=
ure GPIOs for Host Power Control...<br>Jan 06 11:06:09 =C2=A0 systemd[1]: S=
tarting Wait for /org/openbmc/HostIpmi/1...<br>Jan 06 11:06:09 =C2=A0 syste=
md[1]: Started Reboot host0.<br>Jan 06 11:06:09 =C2=A0 init_once.sh[404]: i=
nit_once.sh<br>Jan 06 11:06:09 =C2=A0 phosphor-chassis-state-manager[290]: =
Received signal that power OFF is complete<br>Jan 06 11:06:09 =C2=A0 phosph=
or-chassis-state-manager[290]: Change to Chassis Power State<br>Jan 06 11:0=
6:09 =C2=A0 systemd[1]: Started Configure GPIOs for Host Power Control.<br>=
Jan 06 11:06:09 =C2=A0 systemd[1]: Starting Stop Host...<br><div>Jan 06 11:=
06:09 =C2=A0 poweroff.sh[408]: out -&gt; poweroff</div><div><br></div><div>=
The power on process suspended by phosphor-watchdog timeout. I have no idea=
 to clear watchdog timer. Could you provide any suggestion for this situati=
on? Thanks.</div><div><br></div><div>Tyler.</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">zhang_cy1989 &lt;<a href=
=3D"mailto:zhang_cy1989@163.com">zhang_cy1989@163.com</a>&gt; =E6=96=BC 201=
9=E5=B9=B412=E6=9C=8826=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8811:11=
=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div style=3D"line-height:1.7;color:rgb(0,0,0);font-size:14px;f=
ont-family:Arial"><div>Dear Tim</div><div>=C2=A0 Thanks a milion.</div><div=
>=C2=A0 The infromation is very useful for me.</div><div><br></div><div>=C2=
=A0 Thank you again for your prompt reply.<br></div><div>=C2=A0 <br></div><=
div>=C2=A0 Best Regards</div><div><br></div><div>Felix<br></div>=E5=9C=A8 2=
019-12-26 10:32:54=EF=BC=8C&quot;CS20 CHLi30&quot; &lt;<a href=3D"mailto:CH=
LI30@nuvoton.com" target=3D"_blank">CHLI30@nuvoton.com</a>&gt; =E5=86=99=E9=
=81=93=EF=BC=9A<blockquote id=3D"gmail-m_-4363428767718468764isReplyContent=
" style=3D"padding-left:1ex;margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204)">






<div>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">Hi Felixzhang,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">Yes, you can using op-power-control on X86 m=
otherboard for sure.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">Example about using op-power-control:<u></u>=
<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">systemctl list-dependencies
<a href=3D"mailto:obmc-host-start@0.target" target=3D"_blank">obmc-host-sta=
rt@0.target</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">obmc-host-start@0.target (Power ON)<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">-&gt; mapper-wait@-org-openbmc-control-chass=
is0.service<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">-&gt; phosphor-reset-host-reboot-attempts@0.=
service<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">-&gt; obmc-host-startmin@0.target<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0 -&gt; mapper-wait@-=
org-openbmc-control-chassis0.service<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0 -&gt; obmc-enable-h=
ost-watchdog@0.service<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0 -&gt; phosphor-watc=
hdog@poweron.service<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0 -&gt; obmc-chassis-=
poweron@0.target<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -&gt; op-power-start@0.service<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -&gt; mapper-wait@-xyz-openbmc_project-state-chassis0.service<=
u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -&gt; phosphor-fan-control-init@0.service<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -&gt; phosphor-fan-monitor-init@0.service<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -&gt; phosphor-fan-presence-tach@0.service<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">BTW, here is the list about the sequence of
<a href=3D"mailto:obmc-host-start@0.target" target=3D"_blank">obmc-host-sta=
rt@0.target</a> for you refer it.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">When you presss Power ON button from WebUI t=
he state RequestedHostTransition change to ON, what happens behind that is =
done by systemd
 units, roughly described as below:<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:18pt">
<span style=3D"font-family:Calibri,sans-serif;color:rgb(31,73,125)" lang=3D=
"EN-US"><span>1.<span style=3D"font:7pt &quot;Times New Roman&quot;">=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></span><span style=3D"font-family:Calibri,sans-serif;color:rg=
b(31,73,125)" lang=3D"EN-US">Host state manager starts
<u>obmc-host-start@0.target</u><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:18pt">
<span style=3D"font-family:Calibri,sans-serif;color:rgb(31,73,125)" lang=3D=
"EN-US"><span>2.<span style=3D"font:7pt &quot;Times New Roman&quot;">=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></span><span style=3D"font-family:Calibri,sans-serif;color:rg=
b(31,73,125)" lang=3D"EN-US">The above target requires
<u>obmc-host-startmin@0.target</u><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:18pt">
<span style=3D"font-family:Calibri,sans-serif;color:rgb(31,73,125)" lang=3D=
"EN-US"><span>3.<span style=3D"font:7pt &quot;Times New Roman&quot;">=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></span><span style=3D"font-family:Calibri,sans-serif;color:rg=
b(31,73,125)" lang=3D"EN-US">The above target requires
<u>obmc-chassis-poweron@0.target</u> and <u>start_host@0.service</u><u></u>=
<u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:18pt">
<span style=3D"font-family:Calibri,sans-serif;color:rgb(31,73,125)" lang=3D=
"EN-US"><span>4.<span style=3D"font:7pt &quot;Times New Roman&quot;">=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></span><u><span style=3D"font-family:Calibri,sans-serif;color=
:rgb(31,73,125)" lang=3D"EN-US">obmc-chassis-poweron@0.target</span></u><sp=
an style=3D"font-family:Calibri,sans-serif;color:rgb(31,73,125)" lang=3D"EN=
-US">
 requires <u>op-power-start@0.service</u> and <u>op-wait-power-on@0.service=
</u><u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:18pt">
<span style=3D"font-family:Calibri,sans-serif;color:rgb(31,73,125)" lang=3D=
"EN-US"><span>5.<span style=3D"font:7pt &quot;Times New Roman&quot;">=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></span><u><span style=3D"font-family:Calibri,sans-serif;color=
:rgb(31,73,125)" lang=3D"EN-US">op-power-start@0.service</span></u><span st=
yle=3D"font-family:Calibri,sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">
 is to call the PowerControl service to DC on. And <u>op-wait-power-on@0.se=
rvice</u> is to wait for PGood after DC on.<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:18pt">
<span style=3D"font-family:Calibri,sans-serif;color:rgb(31,73,125)" lang=3D=
"EN-US"><span>6.<span style=3D"font:7pt &quot;Times New Roman&quot;">=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></span><span style=3D"font-family:Calibri,sans-serif;color:rg=
b(31,73,125)" lang=3D"EN-US">After that (DC is on and PGood is OK),
<u>start_host@0.service</u> is to start the host CPU.<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">Best regards,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Calibri,sans-serif;color:=
rgb(31,73,125)" lang=3D"EN-US">Tim<u></u><u></u></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:Calibri=
,sans-serif" lang=3D"EN-US">From:</span></b><span style=3D"font-size:11pt;f=
ont-family:Calibri,sans-serif" lang=3D"EN-US"> zhang_cy1989 [mailto:<a href=
=3D"mailto:zhang_cy1989@163.com" target=3D"_blank">zhang_cy1989@163.com</a>=
]
<br>
<b>Sent:</b> Thursday, December 26, 2019 10:22 AM<br>
<b>To:</b> CS20 CHLi30 &lt;<a href=3D"mailto:CHLI30@nuvoton.com" target=3D"=
_blank">CHLI30@nuvoton.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> Re:RE: systemctl start obmc-host-start@0.target fail<u></u>=
<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">Dear,Tim<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0=C2=A0 Thank you for guidance.<u=
></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0=C2=A0 I will study the dbus-mon=
itor and the dependencies of
<a href=3D"mailto:obmc-host-start@0.target" target=3D"_blank">obmc-host-sta=
rt@0.target</a>.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0</span><span style=3D"font-size:=
10.5pt;font-family:Arial,sans-serif;color:rgb(51,51,51);background:rgb(224,=
224,224)" lang=3D"EN-US">@CS20 CHLi30</span><span style=3D"font-size:10.5pt=
;font-family:Arial,sans-serif;color:black" lang=3D"EN-US"><u></u><u></u></s=
pan></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0 I need ask you another advice.
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0 I use the romulus recipes to bu=
ild BMC firmware. And use this fw to the X86 motherboard + AST2500.<u></u><=
u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0 The romulus is base on openpowe=
r. And my platform is X86 motherboard.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0
</span><b><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;colo=
r:rgb(221,64,50)" lang=3D"EN-US">Is it feasible that using romulus BMC firm=
ware to X86 motherboard, specially the power control part?</span></b><span =
style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:black" lang=3D=
"EN-US"><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0 Would you have better suggestio=
n?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0 Looking forward to your replay.=
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0Best Regards<u></u><u></u></span=
></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0Felixzhang<u></u><u></u></span><=
/p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:black=
" lang=3D"EN-US">At 2019-12-26 09:34:09, &quot;CS20 CHLi30&quot; &lt;<a hre=
f=3D"mailto:CHLI30@nuvoton.com" target=3D"_blank">CHLI30@nuvoton.com</a>&gt=
; wrote:<u></u><u></u></span></p>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm" id=3D"gmail-m_-4363428767718468764isReplyContent">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">Hi Felixzhang,</span><span =
style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:black" lang=3D=
"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">=C2=A0</span><span style=3D=
"font-size:10.5pt;font-family:Arial,sans-serif;color:black" lang=3D"EN-US">=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">About this kind of systemd =
target start fail, you can use
<b>dbus-monitor</b> to check target dependency more detail.</span><span sty=
le=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:black" lang=3D"EN=
-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">BTW, you can also use
<b>systemctl list-dependecies <a href=3D"mailto:obmc-host-start@0.target" t=
arget=3D"_blank">obmc-host-start@0.target</a></b> to get all related servic=
es.</span><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;colo=
r:black" lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">=C2=A0</span><span style=3D=
"font-size:10.5pt;font-family:Arial,sans-serif;color:black" lang=3D"EN-US">=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">For example for using x86-p=
ower-control:</span><span style=3D"font-size:10.5pt;font-family:Arial,sans-=
serif;color:black" lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.5pt;font-family:Calib=
ri,sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">systemctl list-dependenc=
ies
<a href=3D"mailto:obmc-host-start@0.target" target=3D"_blank">obmc-host-sta=
rt@0.target</a></span></b><span style=3D"font-size:10.5pt;font-family:Arial=
,sans-serif;color:black" lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">=C2=A0</span><span style=3D=
"font-size:10.5pt;font-family:Arial,sans-serif;color:black" lang=3D"EN-US">=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US"><a href=3D"mailto:obmc-host=
-start@0.target" target=3D"_blank">obmc-host-start@0.target</a>
 (Power ON)</span><span style=3D"font-size:10.5pt;font-family:Arial,sans-se=
rif;color:black" lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">-&gt;
<a href=3D"mailto:mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.s=
ervice" target=3D"_blank">
mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.service</a></span><=
span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:black" la=
ng=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">-&gt;
<a href=3D"mailto:phosphor-reset-host-reboot-attempts@0.service" target=3D"=
_blank">phosphor-reset-host-reboot-attempts@0.service</a></span><span style=
=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:black" lang=3D"EN-U=
S"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">-&gt;
<a href=3D"mailto:obmc-host-startmin@0.target" target=3D"_blank">obmc-host-=
startmin@0.target</a></span><span style=3D"font-size:10.5pt;font-family:Ari=
al,sans-serif;color:black" lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0 -&=
gt;
<a href=3D"mailto:mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.s=
ervice" target=3D"_blank">
mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.service</a></span><=
span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:black" la=
ng=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0 -&=
gt;
<a href=3D"mailto:obmc-enable-host-watchdog@0.service" target=3D"_blank">ob=
mc-enable-host-watchdog@0.service</a></span><span style=3D"font-size:10.5pt=
;font-family:Arial,sans-serif;color:black" lang=3D"EN-US"><u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0 -&=
gt;
<a href=3D"mailto:phosphor-watchdog@poweron.service" target=3D"_blank">phos=
phor-watchdog@poweron.service</a></span><span style=3D"font-size:10.5pt;fon=
t-family:Arial,sans-serif;color:black" lang=3D"EN-US"><u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0 -&=
gt;
<a href=3D"mailto:obmc-chassis-poweron@0.target" target=3D"_blank">obmc-cha=
ssis-poweron@0.target</a></span><span style=3D"font-size:10.5pt;font-family=
:Arial,sans-serif;color:black" lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -&gt;
<a href=3D"mailto:intel-power-start@0.service" target=3D"_blank">intel-powe=
r-start@0.service</a></span><span style=3D"font-size:10.5pt;font-family:Ari=
al,sans-serif;color:black" lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -&gt;
<a href=3D"mailto:mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.s=
ervice" target=3D"_blank">
mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.service</a></span><=
span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:black" la=
ng=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -&gt;
<a href=3D"mailto:phosphor-fan-control-init@0.service" target=3D"_blank">ph=
osphor-fan-control-init@0.service</a></span><span style=3D"font-size:10.5pt=
;font-family:Arial,sans-serif;color:black" lang=3D"EN-US"><u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -&gt;
<a href=3D"mailto:phosphor-fan-monitor-init@0.service" target=3D"_blank">ph=
osphor-fan-monitor-init@0.service</a></span><span style=3D"font-size:10.5pt=
;font-family:Arial,sans-serif;color:black" lang=3D"EN-US"><u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -&gt;
<a href=3D"mailto:phosphor-fan-presence-tach@0.service" target=3D"_blank">p=
hosphor-fan-presence-tach@0.service</a></span><span style=3D"font-size:10.5=
pt;font-family:Arial,sans-serif;color:black" lang=3D"EN-US"><u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">=C2=A0</span><span style=3D=
"font-size:10.5pt;font-family:Arial,sans-serif;color:black" lang=3D"EN-US">=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">Then you should found that =
might some services doesn=E2=80=99t start
 normally and cause your <a href=3D"mailto:obmc-host-tart@0.target" target=
=3D"_blank">obmc-host-tart@0.target</a> start fail.</span><span style=3D"fo=
nt-size:10.5pt;font-family:Arial,sans-serif;color:black" lang=3D"EN-US"><u>=
</u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">=C2=A0</span><span style=3D=
"font-size:10.5pt;font-family:Arial,sans-serif;color:black" lang=3D"EN-US">=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">Best regards,</span><span s=
tyle=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:black" lang=3D"=
EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Calibri,=
sans-serif;color:rgb(31,73,125)" lang=3D"EN-US">Tim</span><span style=3D"fo=
nt-size:10.5pt;font-family:Arial,sans-serif;color:black" lang=3D"EN-US"><u>=
</u><u></u></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:Calibri=
,sans-serif;color:black" lang=3D"EN-US">From:</span></b><span style=3D"font=
-size:11pt;font-family:Calibri,sans-serif;color:black" lang=3D"EN-US">
 openbmc [<a href=3D"mailto:openbmc-bounces+chli30=3Dnuvoton.com@lists.ozla=
bs.org" target=3D"_blank">mailto:openbmc-bounces+chli30=3Dnuvoton.com@lists=
.ozlabs.org</a>]
<b>On Behalf Of </b>zhang_cy1989<br>
<b>Sent:</b> Wednesday, December 25, 2019 7:19 PM<br>
<b>To:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> systemctl start <a href=3D"mailto:obmc-host-start@0.target"=
 target=3D"_blank">obmc-host-start@0.target</a> fail</span><span style=3D"f=
ont-size:10.5pt;font-family:Arial,sans-serif;color:black" lang=3D"EN-US"><u=
></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<p><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:black=
" lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">Dear All<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0=C2=A0 On ast2500+x86 platform, =
use the romulus bmc firmware, the detail information:<u></u><u></u></span><=
/p>
</div>
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.5pt;font-family:Arial=
,sans-serif;color:rgb(221,64,50)" lang=3D"EN-US">ID=3D&quot;openbmc-phospho=
r&quot;</span></b><span style=3D"font-size:10.5pt;font-family:Arial,sans-se=
rif;color:rgb(221,64,50)" lang=3D"EN-US"><br>
<b>NAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro=
)&quot;</b><br>
<b>VERSION=3D&quot;2.7.0-0&quot;</b><br>
<b>VERSION_ID=3D&quot;2.7.0-0-gcb91a7773-dirty&quot;</b><br>
<b>PRETTY_NAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Project Reference=
 Distro) 2.7.0-0&quot;</b><br>
<b>BUILD_ID=3D&quot;2.7.0&quot;</b><br>
<b>OPENBMC_TARGET_MACHINE=3D&quot;romulus&quot;</b></span><span style=3D"fo=
nt-size:10.5pt;font-family:Arial,sans-serif;color:black" lang=3D"EN-US"><u>=
</u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0 The BMC ip: 192.168.0.1<u></u><=
u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0 Remote Computer ip: 192.168.0.2=
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0 I use the ipmitool to communica=
te with BMC:<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">ipmitool -I lanplus -H 192.168.0.1 -U =
root -P 0penBmc power on<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0And from the journalctl results,=
 I found those infromations:<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">......<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">-- The unit
<a href=3D"mailto:op-wait-power-on@0.service" target=3D"_blank">op-wait-pow=
er-on@0.service</a> has entered the &#39;failed&#39; state with result &#39=
;timeout&#39;.<br>
Nov 28 07:55:47 romulus systemd[1]: Failed to start Wait for Power0 to turn=
 on.<br>
-- Subject: A start job for unit <a href=3D"mailto:op-wait-power-on@0.servi=
ce" target=3D"_blank">op-wait-power-on@0.service</a> has failed<br>
-- Defined-By: systemd<br>
-- Support: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__lists.freedesktop.org_mailman_listinfo_systemd-2Ddevel&amp;d=3DDwMGbg&am=
p;c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&amp;r=3D_vvS1tH9U_15yp1--=
_mdcWxVamV74LY4Xz5Zy4-7UIo&amp;m=3DEhLiDsjPMBS98eeZEQG2UAHMPrvbvGb_OublwmQy=
2uc&amp;s=3DUO9vddeGuzrgEFSgZkdgqCUEsjWHcXBofqYYlHxCNkM&amp;e=3D" target=3D=
"_blank">
https://lists.freedesktop.org/mailman/listinfo/systemd-devel</a><br>
--<br>
-- A start job for unit <a href=3D"mailto:op-wait-power-on@0.service" targe=
t=3D"_blank">op-wait-power-on@0.service</a> has finished with a failure.<br=
>
--<br>
-- The job identifier is 906 and the job result is failed.<br>
Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Chassis0 (Power O=
n).<br>
-- Subject: A start job for unit <a href=3D"mailto:obmc-chassis-poweron@0.t=
arget" target=3D"_blank">obmc-chassis-poweron@0.target</a> has failed<br>
-- Defined-By: systemd<br>
-- Support: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__lists.freedesktop.org_mailman_listinfo_systemd-2Ddevel&amp;d=3DDwMGbg&am=
p;c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&amp;r=3D_vvS1tH9U_15yp1--=
_mdcWxVamV74LY4Xz5Zy4-7UIo&amp;m=3DEhLiDsjPMBS98eeZEQG2UAHMPrvbvGb_OublwmQy=
2uc&amp;s=3DUO9vddeGuzrgEFSgZkdgqCUEsjWHcXBofqYYlHxCNkM&amp;e=3D" target=3D=
"_blank">
https://lists.freedesktop.org/mailman/listinfo/systemd-devel</a><br>
--<br>
-- A start job for unit <a href=3D"mailto:obmc-chassis-poweron@0.target" ta=
rget=3D"_blank">obmc-chassis-poweron@0.target</a> has finished with a failu=
re.<br>
--<br>
-- The job identifier is 886 and the job result is dependency.<br>
Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Start Host0 Minim=
um.<br>
-- Subject: A start job for unit <a href=3D"mailto:obmc-host-startmin@0.tar=
get" target=3D"_blank">obmc-host-startmin@0.target</a> has failed<br>
-- Defined-By: systemd<br>
-- Support: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__lists.freedesktop.org_mailman_listinfo_systemd-2Ddevel&amp;d=3DDwMGbg&am=
p;c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&amp;r=3D_vvS1tH9U_15yp1--=
_mdcWxVamV74LY4Xz5Zy4-7UIo&amp;m=3DEhLiDsjPMBS98eeZEQG2UAHMPrvbvGb_OublwmQy=
2uc&amp;s=3DUO9vddeGuzrgEFSgZkdgqCUEsjWHcXBofqYYlHxCNkM&amp;e=3D" target=3D=
"_blank">
https://lists.freedesktop.org/mailman/listinfo/systemd-devel</a><br>
--<br>
-- A start job for unit <a href=3D"mailto:obmc-host-startmin@0.target" targ=
et=3D"_blank">obmc-host-startmin@0.target</a> has finished with a failure.<=
br>
--<br>
-- The job identifier is 752 and the job result is dependency.<br>
Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Start Host0.<br>
-- Subject: A start job for unit <a href=3D"mailto:obmc-host-start@0.target=
" target=3D"_blank">obmc-host-start@0.target</a> has failed<br>
-- Defined-By: systemd<br>
-- Support: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__lists.freedesktop.org_mailman_listinfo_systemd-2Ddevel&amp;d=3DDwMGbg&am=
p;c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&amp;r=3D_vvS1tH9U_15yp1--=
_mdcWxVamV74LY4Xz5Zy4-7UIo&amp;m=3DEhLiDsjPMBS98eeZEQG2UAHMPrvbvGb_OublwmQy=
2uc&amp;s=3DUO9vddeGuzrgEFSgZkdgqCUEsjWHcXBofqYYlHxCNkM&amp;e=3D" target=3D=
"_blank">
https://lists.freedesktop.org/mailman/listinfo/systemd-devel</a><br>
--<br>
-- A start job for unit <a href=3D"mailto:obmc-host-start@0.target" target=
=3D"_blank">obmc-host-start@0.target</a> has finished with a failure.<u></u=
><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">Nov 28 08:24:09 romulus systemd[1]:
<a href=3D"mailto:obmc-host-start@0.target" target=3D"_blank">obmc-host-sta=
rt@0.target</a>: Job <a href=3D"mailto:obmc-host-start@0.target" target=3D"=
_blank">
obmc-host-start@0.target</a>/start failed with result &#39;dependency&#39;.=
<br>
Nov 28 08:24:09 romulus systemd[1]: <a href=3D"mailto:obmc-host-start@0.tar=
get" target=3D"_blank">obmc-host-start@0.target</a>: Triggering OnFailure=
=3D dependencies.<br>
Nov 28 08:24:10 romulus systemd[1]: <a href=3D"mailto:obmc-host-startmin@0.=
target" target=3D"_blank">
obmc-host-startmin@0.target</a>: Job <a href=3D"mailto:obmc-host-startmin@0=
.target" target=3D"_blank">
obmc-host-startmin@0.target</a>/start failed with result &#39;dependency&#3=
9;.<br>
Nov 28 08:24:10 romulus systemd[1]: <a href=3D"mailto:obmc-host-startmin@0.=
target" target=3D"_blank">
obmc-host-startmin@0.target</a>: Triggering OnFailure=3D dependencies.<br>
Nov 28 08:24:10 romulus systemd[1]: <a href=3D"mailto:obmc-chassis-poweron@=
0.target" target=3D"_blank">
obmc-chassis-poweron@0.target</a>: Job <a href=3D"mailto:obmc-chassis-power=
on@0.target" target=3D"_blank">
obmc-chassis-poweron@0.target</a>/start failed with result &#39;dependency&=
#39;.<br>
Nov 28 08:24:10 romulus systemd[1]: <a href=3D"mailto:obmc-chassis-poweron@=
0.target" target=3D"_blank">
obmc-chassis-poweron@0.target</a>: Triggering OnFailure=3D dependencies.<u>=
</u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">......<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">I alse do the following action:<u></u>=
<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.5pt;font-family:Arial=
,sans-serif;color:rgb(82,129,53)" lang=3D"EN-US">systemctl start
<a href=3D"mailto:obmc-host-start@0.target" target=3D"_blank">obmc-host-sta=
rt@0.target</a> </span></b><span style=3D"font-size:10.5pt;font-family:Aria=
l,sans-serif;color:black" lang=3D"EN-US"><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">And alse get the similar fail result.
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">I don&#39;t how to debug this isuue.Co=
uld you give me some suggestions?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">Best Regards<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">Felixzhang<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:Arial,sa=
ns-serif;color:black" lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span style=3D"font-siz=
e:10.5pt;font-family:Arial,sans-serif;color:black" lang=3D"EN-US">=C2=A0<u>=
</u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span style=3D"font-siz=
e:10.5pt;font-family:Arial,sans-serif;color:black" lang=3D"EN-US">=C2=A0<u>=
</u><u></u></span></p>
<p><span style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:black=
" lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div class=3D"MsoNormal" style=3D"text-align:center" align=3D"center"><span=
 style=3D"font-size:10.5pt;font-family:Arial,sans-serif;color:black" lang=
=3D"EN-US">
<hr width=3D"100%" size=3D"2" align=3D"center">
</span></div>
<p class=3D"MsoNormal"><span style=3D"font-family:Arial,sans-serif;color:gr=
ay" lang=3D"EN-US">The privileged confidential information contained in thi=
s email is intended for use only by the addressees as indicated by the orig=
inal sender of this email. If you are
 not the addressee indicated in this email or are not responsible for deliv=
ery of the email to such a person, please kindly reply to the sender indica=
ting this fact and delete all copies of it from your computer and network s=
erver immediately. Your cooperation
 is highly appreciated. It is advised that any unauthorized use of confiden=
tial information of Nuvoton is strictly prohibited; and any information in =
this email irrelevant to the official business of Nuvoton shall be deemed a=
s neither given nor endorsed by
 Nuvoton. </span><span style=3D"font-size:10.5pt;font-family:Arial,sans-ser=
if;color:black" lang=3D"EN-US"><u></u><u></u></span></p>
</blockquote>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"EN-US"><u=
></u>=C2=A0<u></u></span></p>
<p><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<hr width=3D"100%" align=3D"center">
<span style=3D"font-size:12pt;line-height:0.7;font-family:Arial;color:rgb(1=
28,128,128)">The privileged confidential information contained in this emai=
l is intended for use only by the addressees as indicated by the original s=
ender of this email. If you are not the
 addressee indicated in this email or are not responsible for delivery of t=
he email to such a person, please kindly reply to the sender indicating thi=
s fact and delete all copies of it from your computer and network server im=
mediately. Your cooperation is highly
 appreciated. It is advised that any unauthorized use of confidential infor=
mation of Nuvoton is strictly prohibited; and any information in this email=
 irrelevant to the official business of Nuvoton shall be deemed as neither =
given nor endorsed by Nuvoton.
</span>


</blockquote></div><br><br><span title=3D"neteasefooter"><p>=C2=A0</p></spa=
n></blockquote></div>

--000000000000bd5301059b7888d8--
