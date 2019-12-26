Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 532B012A9CD
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 03:33:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47jvCK3yTKzDqCV
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 13:33:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-hk2-obe.outbound.protection.outlook.com
 (client-ip=40.107.130.82; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="DJnOSa4J"; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300082.outbound.protection.outlook.com [40.107.130.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47jvBg3P64zDq6Q
 for <openbmc@lists.ozlabs.org>; Thu, 26 Dec 2019 13:32:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaIDlVHu986qzAck5hAfDbvse5D2PJ+T4+2ys8gQcvcTJz1m5/75od2wtK93PxzV7FyIIShuMhY7bBaZG6eBnSIHdUaqvqJObfd0Cj1vjxwL9qGNcddMtU7R+7EdB1xsLuE6qHZA7vyWhqwABNN5jZyt4Nea6rc+UL+uNk5MTHJ7PwUIsA/CA//ZDbJ7+VwttFXp4LnpsGHjDyvZADGm8brQQQ4gPd/aW+ieS9Uu5B82wvW2TtbiV8vWDcJf7iPtWRseAcs2h73Z7y5I3HtXpGdvqzEW3DHh5Z3jOtWzOBUV8cRjRmN0dO+MAMgrebe8bxwHHdOx+Tizg+0Jp6Svsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWfq1ZQkq5JvuHGH4dkAa+A//nstdRvvX8N5jk7PLTQ=;
 b=hr9E470wsfKfjwWYNdZ2+RQhPMpjZhXHb5rkrncrtecGsjZ7sRh0I8/ylBB+PrULnAHVaMRBb2/+5+CeGL1X5cTulCMp8m8VOGu3YJTfPnLBL97Pv/2V+MDZ1WN3CrU4aBbfXuoezjIWO7O5+dnpCKS33gZgAF00IIHK59CiqhAMnRfVFZ/YUSw0Uh5jzxHSGdUq9+hONYDxtw4vrlmmFJmpsF2N4D9ogS+bnNztobdR5QfRproij9jSvIkLmG9fzrsZJ8A+upsJuqofC+aEcicQj4oSJgfgpFyCK7AaSHUnqb3zzLzwCHKAMVKhjKZMVzr7cUCn/NFHorIeJt76PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWfq1ZQkq5JvuHGH4dkAa+A//nstdRvvX8N5jk7PLTQ=;
 b=DJnOSa4Jbx8PFuQ+gwKHqp6OuSG3qm2pQ79FUnkQTYyHBH8Pt4OkSNrBmGlcT4uQqE8sqAci35U6FgU6lmeySuR7jHDuEJU0oGtxx2EMMjzMtKlEH1n18aNCfba8PgXo2wCka8AePe8rkLcR2EXcZOtF8icPm5oxdLuEfNOcT5o=
Received: from HK0PR03MB4660.apcprd03.prod.outlook.com (52.132.237.207) by
 HK0PR03MB2914.apcprd03.prod.outlook.com (52.133.211.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.8; Thu, 26 Dec 2019 02:32:54 +0000
Received: from HK0PR03MB4660.apcprd03.prod.outlook.com
 ([fe80::c63:ab0f:5220:9999]) by HK0PR03MB4660.apcprd03.prod.outlook.com
 ([fe80::c63:ab0f:5220:9999%6]) with mapi id 15.20.2581.007; Thu, 26 Dec 2019
 02:32:54 +0000
From: CS20 CHLi30 <CHLI30@nuvoton.com>
To: zhang_cy1989 <zhang_cy1989@163.com>
Subject: RE: Re:RE: systemctl start obmc-host-start@0.target fail
Thread-Topic: Re:RE: systemctl start obmc-host-start@0.target fail
Thread-Index: AQHVuxd2dgun2IBbEEOrXiAK9S1+uKfLnUVQgAAS8wCAAACuoA==
Date: Thu, 26 Dec 2019 02:32:54 +0000
Message-ID: <HK0PR03MB46603D582930A30113B225A0CF2B0@HK0PR03MB4660.apcprd03.prod.outlook.com>
References: <6d26931a.d7c4.16f3cc7df52.Coremail.zhang_cy1989@163.com>
 <HK0PR03MB4660E4CBAC59CFBDFBD16525CF2B0@HK0PR03MB4660.apcprd03.prod.outlook.com>
 <6d3c538d.4fd2.16f40026df2.Coremail.zhang_cy1989@163.com>
In-Reply-To: <6d3c538d.4fd2.16f40026df2.Coremail.zhang_cy1989@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=CHLI30@nuvoton.com; 
x-originating-ip: [60.250.194.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d47ce2c-f744-417c-0a16-08d789abe94b
x-ms-traffictypediagnostic: HK0PR03MB2914:|HK0PR03MB2914:
x-microsoft-antispam-prvs: <HK0PR03MB2914D6676EDDC611CBD4D25ACF2B0@HK0PR03MB2914.apcprd03.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 02638D901B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39850400004)(346002)(376002)(396003)(136003)(189003)(199004)(7696005)(33656002)(9686003)(81156014)(55016002)(81166006)(8676002)(8936002)(66946007)(64756008)(76116006)(26005)(66476007)(186003)(66446008)(66556008)(4326008)(86362001)(4001150100001)(71200400001)(6916009)(478600001)(53546011)(52536014)(316002)(2906002)(5660300002)(6506007)(966005)(579004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HK0PR03MB2914;
 H:HK0PR03MB4660.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bJxrGmFSFW84QlMmmkhpWOlEjx2ShO8uXbDHQuX3sIQl+DvLv5K80/yiSKvZEc2ufnKI4qK3EjbRxxhtw+MN9gkpU9Xzq1Cudy2ItcxgEiqsJXybFMxLkDJ6wOr/u+6oKLNZ1mYTHef4Sk8/rapIYlB0nlYZcE88Z+ALVvgP0m4993C4bxqEBw5AIktwBDl6FOEJpxDloMajr2TcP7B/lNNExvsbjS5KPNTV9mEhZoxNvG13cWzUO6tn/RNkotoOWWGITVa/gXTiyyEhbI+1WBGUZ8Zkf50e419JJzSSI5C44QZqW3c545abpOUYmpGpy9b46oZAKZ29d/yXmvCvmdSAFSFInhlNE2dzUaK4/j0Ww5LVMDOwOXMagck4vRaZqli68YrXCRnEECEI3z9uGEQArrNImZ2bdF69YRA9oGa27s3yYEO3yXoyeHLfjzuDTQzfQ4Rf+eOLYAyPNrGZPcVM8u6Q0SjNbRaxlWxZAJk=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR03MB46603D582930A30113B225A0CF2B0HK0PR03MB4660apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d47ce2c-f744-417c-0a16-08d789abe94b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2019 02:32:54.1077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Z6E25idla02yf/bJnDjNqLvgpQPRLBneFLSEY66g1Lv8aMaXYT4XPeJVcRaaTZSpKgX/CoyV3doOzPpOz+pcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB2914
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

--_000_HK0PR03MB46603D582930A30113B225A0CF2B0HK0PR03MB4660apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Felixzhang,

Yes, you can using op-power-control on X86 motherboard for sure.

Example about using op-power-control:
systemctl list-dependencies obmc-host-start@0.target<mailto:obmc-host-start=
@0.target>

obmc-host-start@0.target (Power ON)
-> mapper-wait@-org-openbmc-control-chassis0.service
-> phosphor-reset-host-reboot-attempts@0.service
-> obmc-host-startmin@0.target
     -> mapper-wait@-org-openbmc-control-chassis0.service
     -> obmc-enable-host-watchdog@0.service
     -> phosphor-watchdog@poweron.service
     -> obmc-chassis-poweron@0.target
          -> op-power-start@0.service
          -> mapper-wait@-xyz-openbmc_project-state-chassis0.service
          -> phosphor-fan-control-init@0.service
          -> phosphor-fan-monitor-init@0.service
          -> phosphor-fan-presence-tach@0.service

BTW, here is the list about the sequence of obmc-host-start@0.target<mailto=
:obmc-host-start@0.target> for you refer it.
When you presss Power ON button from WebUI the state RequestedHostTransitio=
n change to ON, what happens behind that is done by systemd units, roughly =
described as below:
1.      Host state manager starts obmc-host-start@0.target
2.      The above target requires obmc-host-startmin@0.target
3.      The above target requires obmc-chassis-poweron@0.target and start_h=
ost@0.service
4.      obmc-chassis-poweron@0.target requires op-power-start@0.service and=
 op-wait-power-on@0.service
5.      op-power-start@0.service is to call the PowerControl service to DC =
on. And op-wait-power-on@0.service is to wait for PGood after DC on.
6.      After that (DC is on and PGood is OK), start_host@0.service is to s=
tart the host CPU.

Best regards,
Tim
From: zhang_cy1989 [mailto:zhang_cy1989@163.com]
Sent: Thursday, December 26, 2019 10:22 AM
To: CS20 CHLi30 <CHLI30@nuvoton.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re:RE: systemctl start obmc-host-start@0.target fail

Dear,Tim
   Thank you for guidance.
   I will study the dbus-monitor and the dependencies of obmc-host-start@0.=
target<mailto:obmc-host-start@0.target>.
 @CS20 CHLi30
  I need ask you another advice.

  I use the romulus recipes to build BMC firmware. And use this fw to the X=
86 motherboard + AST2500.
  The romulus is base on openpower. And my platform is X86 motherboard.
  Is it feasible that using romulus BMC firmware to X86 motherboard, specia=
lly the power control part?

  Would you have better suggestion?

  Looking forward to your replay.

 Best Regards
 Felixzhang


At 2019-12-26 09:34:09, "CS20 CHLi30" <CHLI30@nuvoton.com<mailto:CHLI30@nuv=
oton.com>> wrote:
Hi Felixzhang,

About this kind of systemd target start fail, you can use dbus-monitor to c=
heck target dependency more detail.
BTW, you can also use systemctl list-dependecies obmc-host-start@0.target<m=
ailto:obmc-host-start@0.target> to get all related services.

For example for using x86-power-control:
systemctl list-dependencies obmc-host-start@0.target<mailto:obmc-host-start=
@0.target>

obmc-host-start@0.target<mailto:obmc-host-start@0.target> (Power ON)
-> mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.service<mailto:m=
apper-wait@-xyz-openbmc_project-Chassis-Control-Power0.service>
-> phosphor-reset-host-reboot-attempts@0.service<mailto:phosphor-reset-host=
-reboot-attempts@0.service>
-> obmc-host-startmin@0.target<mailto:obmc-host-startmin@0.target>
     -> mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.service<mai=
lto:mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.service>
     -> obmc-enable-host-watchdog@0.service<mailto:obmc-enable-host-watchdo=
g@0.service>
     -> phosphor-watchdog@poweron.service<mailto:phosphor-watchdog@poweron.=
service>
     -> obmc-chassis-poweron@0.target<mailto:obmc-chassis-poweron@0.target>
          -> intel-power-start@0.service<mailto:intel-power-start@0.service=
>
          -> mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.servic=
e<mailto:mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.service>
          -> phosphor-fan-control-init@0.service<mailto:phosphor-fan-contro=
l-init@0.service>
          -> phosphor-fan-monitor-init@0.service<mailto:phosphor-fan-monito=
r-init@0.service>
          -> phosphor-fan-presence-tach@0.service<mailto:phosphor-fan-prese=
nce-tach@0.service>

Then you should found that might some services doesn't start normally and c=
ause your obmc-host-tart@0.target<mailto:obmc-host-tart@0.target> start fai=
l.

Best regards,
Tim
From: openbmc [mailto:openbmc-bounces+chli30=3Dnuvoton.com@lists.ozlabs.org=
] On Behalf Of zhang_cy1989
Sent: Wednesday, December 25, 2019 7:19 PM
To: openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>
Subject: systemctl start obmc-host-start@0.target<mailto:obmc-host-start@0.=
target> fail



Dear All
   On ast2500+x86 platform, use the romulus bmc firmware, the detail inform=
ation:
ID=3D"openbmc-phosphor"
NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
VERSION=3D"2.7.0-0"
VERSION_ID=3D"2.7.0-0-gcb91a7773-dirty"
PRETTY_NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)=
 2.7.0-0"
BUILD_ID=3D"2.7.0"
OPENBMC_TARGET_MACHINE=3D"romulus"

  The BMC ip: 192.168.0.1
  Remote Computer ip: 192.168.0.2

  I use the ipmitool to communicate with BMC:
ipmitool -I lanplus -H 192.168.0.1 -U root -P 0penBmc power on

 And from the journalctl results, I found those infromations:
......
-- The unit op-wait-power-on@0.service<mailto:op-wait-power-on@0.service> h=
as entered the 'failed' state with result 'timeout'.
Nov 28 07:55:47 romulus systemd[1]: Failed to start Wait for Power0 to turn=
 on.
-- Subject: A start job for unit op-wait-power-on@0.service<mailto:op-wait-=
power-on@0.service> has failed
-- Defined-By: systemd
-- Support: https://lists.freedesktop.org/mailman/listinfo/systemd-devel<ht=
tps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.freedesktop.org_=
mailman_listinfo_systemd-2Ddevel&d=3DDwMGbg&c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01=
UFDmisvMR1k-EoDM&r=3D_vvS1tH9U_15yp1--_mdcWxVamV74LY4Xz5Zy4-7UIo&m=3DEhLiDs=
jPMBS98eeZEQG2UAHMPrvbvGb_OublwmQy2uc&s=3DUO9vddeGuzrgEFSgZkdgqCUEsjWHcXBof=
qYYlHxCNkM&e=3D>
--
-- A start job for unit op-wait-power-on@0.service<mailto:op-wait-power-on@=
0.service> has finished with a failure.
--
-- The job identifier is 906 and the job result is failed.
Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Chassis0 (Power O=
n).
-- Subject: A start job for unit obmc-chassis-poweron@0.target<mailto:obmc-=
chassis-poweron@0.target> has failed
-- Defined-By: systemd
-- Support: https://lists.freedesktop.org/mailman/listinfo/systemd-devel<ht=
tps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.freedesktop.org_=
mailman_listinfo_systemd-2Ddevel&d=3DDwMGbg&c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01=
UFDmisvMR1k-EoDM&r=3D_vvS1tH9U_15yp1--_mdcWxVamV74LY4Xz5Zy4-7UIo&m=3DEhLiDs=
jPMBS98eeZEQG2UAHMPrvbvGb_OublwmQy2uc&s=3DUO9vddeGuzrgEFSgZkdgqCUEsjWHcXBof=
qYYlHxCNkM&e=3D>
--
-- A start job for unit obmc-chassis-poweron@0.target<mailto:obmc-chassis-p=
oweron@0.target> has finished with a failure.
--
-- The job identifier is 886 and the job result is dependency.
Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Start Host0 Minim=
um.
-- Subject: A start job for unit obmc-host-startmin@0.target<mailto:obmc-ho=
st-startmin@0.target> has failed
-- Defined-By: systemd
-- Support: https://lists.freedesktop.org/mailman/listinfo/systemd-devel<ht=
tps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.freedesktop.org_=
mailman_listinfo_systemd-2Ddevel&d=3DDwMGbg&c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01=
UFDmisvMR1k-EoDM&r=3D_vvS1tH9U_15yp1--_mdcWxVamV74LY4Xz5Zy4-7UIo&m=3DEhLiDs=
jPMBS98eeZEQG2UAHMPrvbvGb_OublwmQy2uc&s=3DUO9vddeGuzrgEFSgZkdgqCUEsjWHcXBof=
qYYlHxCNkM&e=3D>
--
-- A start job for unit obmc-host-startmin@0.target<mailto:obmc-host-startm=
in@0.target> has finished with a failure.
--
-- The job identifier is 752 and the job result is dependency.
Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Start Host0.
-- Subject: A start job for unit obmc-host-start@0.target<mailto:obmc-host-=
start@0.target> has failed
-- Defined-By: systemd
-- Support: https://lists.freedesktop.org/mailman/listinfo/systemd-devel<ht=
tps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.freedesktop.org_=
mailman_listinfo_systemd-2Ddevel&d=3DDwMGbg&c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01=
UFDmisvMR1k-EoDM&r=3D_vvS1tH9U_15yp1--_mdcWxVamV74LY4Xz5Zy4-7UIo&m=3DEhLiDs=
jPMBS98eeZEQG2UAHMPrvbvGb_OublwmQy2uc&s=3DUO9vddeGuzrgEFSgZkdgqCUEsjWHcXBof=
qYYlHxCNkM&e=3D>
--
-- A start job for unit obmc-host-start@0.target<mailto:obmc-host-start@0.t=
arget> has finished with a failure.
Nov 28 08:24:09 romulus systemd[1]: obmc-host-start@0.target<mailto:obmc-ho=
st-start@0.target>: Job obmc-host-start@0.target<mailto:obmc-host-start@0.t=
arget>/start failed with result 'dependency'.
Nov 28 08:24:09 romulus systemd[1]: obmc-host-start@0.target<mailto:obmc-ho=
st-start@0.target>: Triggering OnFailure=3D dependencies.
Nov 28 08:24:10 romulus systemd[1]: obmc-host-startmin@0.target<mailto:obmc=
-host-startmin@0.target>: Job obmc-host-startmin@0.target<mailto:obmc-host-=
startmin@0.target>/start failed with result 'dependency'.
Nov 28 08:24:10 romulus systemd[1]: obmc-host-startmin@0.target<mailto:obmc=
-host-startmin@0.target>: Triggering OnFailure=3D dependencies.
Nov 28 08:24:10 romulus systemd[1]: obmc-chassis-poweron@0.target<mailto:ob=
mc-chassis-poweron@0.target>: Job obmc-chassis-poweron@0.target<mailto:obmc=
-chassis-poweron@0.target>/start failed with result 'dependency'.
Nov 28 08:24:10 romulus systemd[1]: obmc-chassis-poweron@0.target<mailto:ob=
mc-chassis-poweron@0.target>: Triggering OnFailure=3D dependencies.
......

I alse do the following action:
systemctl start obmc-host-start@0.target<mailto:obmc-host-start@0.target>
And alse get the similar fail result.

I don't how to debug this isuue.Could you give me some suggestions?

Best Regards
Felixzhang








________________________________
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.




________________________________
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.

--_000_HK0PR03MB46603D582930A30113B225A0CF2B0HK0PR03MB4660apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:SimSun;
	mso-fareast-language:ZH-CN;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:SimSun;
	mso-fareast-language:ZH-CN;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:SimSun;
	mso-fareast-language:ZH-CN;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1905472;
	mso-list-type:hybrid;
	mso-list-template-ids:2111480000 1995309118 -1677698728 -296977634 -104658=
9692 -502788112 -571331528 -1524846100 668229974 -1673620022;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:18.0pt;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-tab-stop:54.0pt;
	mso-level-number-position:left;
	margin-left:54.0pt;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:90.0pt;
	mso-level-number-position:left;
	margin-left:90.0pt;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:126.0pt;
	mso-level-number-position:left;
	margin-left:126.0pt;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:162.0pt;
	mso-level-number-position:left;
	margin-left:162.0pt;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:198.0pt;
	mso-level-number-position:left;
	margin-left:198.0pt;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:234.0pt;
	mso-level-number-position:left;
	margin-left:234.0pt;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:270.0pt;
	mso-level-number-position:left;
	margin-left:270.0pt;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:306.0pt;
	mso-level-number-position:left;
	margin-left:306.0pt;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l1
	{mso-list-id:454056397;
	mso-list-type:hybrid;
	mso-list-template-ids:-1826343062 67698703 -1677698728 -296977634 -1046589=
692 -502788112 -571331528 -1524846100 668229974 -1673620022;}
@list l1:level1
	{mso-level-tab-stop:18.0pt;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;}
@list l1:level2
	{mso-level-tab-stop:54.0pt;
	mso-level-number-position:left;
	margin-left:54.0pt;
	text-indent:-18.0pt;}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:90.0pt;
	mso-level-number-position:left;
	margin-left:90.0pt;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:126.0pt;
	mso-level-number-position:left;
	margin-left:126.0pt;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:162.0pt;
	mso-level-number-position:left;
	margin-left:162.0pt;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:198.0pt;
	mso-level-number-position:left;
	margin-left:198.0pt;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:234.0pt;
	mso-level-number-position:left;
	margin-left:234.0pt;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:270.0pt;
	mso-level-number-position:left;
	margin-left:270.0pt;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\25BA;
	mso-level-tab-stop:306.0pt;
	mso-level-number-position:left;
	margin-left:306.0pt;
	text-indent:-18.0pt;
	font-family:"Arial",sans-serif;
	mso-bidi-font-family:"Times New Roman";}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">Hi Felixzhan=
g,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">Yes, you can=
 using op-power-control on X86 motherboard for sure.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">Example abou=
t using op-power-control:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">systemctl li=
st-dependencies
<a href=3D"mailto:obmc-host-start@0.target">obmc-host-start@0.target</a><o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">obmc-host-st=
art@0.target (Power ON)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">-&gt; mapper=
-wait@-org-openbmc-control-chassis0.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">-&gt; phosph=
or-reset-host-reboot-attempts@0.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">-&gt; obmc-h=
ost-startmin@0.target<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp; -&gt; mapper-wait@-org-openbmc-control-chassis0.service<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp; -&gt; obmc-enable-host-watchdog@0.service<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp; -&gt; phosphor-watchdog@poweron.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp; -&gt; obmc-chassis-poweron@0.target<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; op-power-start@0.service<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; mapper-wait@-xyz-openbmc_p=
roject-state-chassis0.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; phosphor-fan-control-init@=
0.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; phosphor-fan-monitor-init@=
0.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; phosphor-fan-presence-tach=
@0.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">BTW, here is=
 the list about the sequence of
<a href=3D"mailto:obmc-host-start@0.target">obmc-host-start@0.target</a> fo=
r you refer it.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">When you pre=
sss Power ON button from WebUI the state RequestedHostTransition change to =
ON, what happens behind that is done by systemd
 units, roughly described as below:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:18.0pt;text-indent:-18.0pt;mso-=
list:l1 level1 lfo2">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:&quot;Calibr=
i&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><span style=3D=
"mso-list:Ignore">1.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"font-family:&q=
uot;Calibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">Host=
 state manager starts
<u>obmc-host-start@0.target</u><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:18.0pt;text-indent:-18.0pt;mso-=
list:l1 level1 lfo2">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:&quot;Calibr=
i&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><span style=3D=
"mso-list:Ignore">2.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"font-family:&q=
uot;Calibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">The =
above target requires
<u>obmc-host-startmin@0.target</u><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:18.0pt;text-indent:-18.0pt;mso-=
list:l1 level1 lfo2">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:&quot;Calibr=
i&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><span style=3D=
"mso-list:Ignore">3.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"font-family:&q=
uot;Calibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">The =
above target requires
<u>obmc-chassis-poweron@0.target</u> and <u>start_host@0.service</u><o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:18.0pt;text-indent:-18.0pt;mso-=
list:l1 level1 lfo2">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:&quot;Calibr=
i&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><span style=3D=
"mso-list:Ignore">4.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><u><span lang=3D"EN-US" style=3D"font-family=
:&quot;Calibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">o=
bmc-chassis-poweron@0.target</span></u><span lang=3D"EN-US" style=3D"font-f=
amily:&quot;Calibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-=
TW">
 requires <u>op-power-start@0.service</u> and <u>op-wait-power-on@0.service=
</u><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:18.0pt;text-indent:-18.0pt;mso-=
list:l1 level1 lfo2">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:&quot;Calibr=
i&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><span style=3D=
"mso-list:Ignore">5.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><u><span lang=3D"EN-US" style=3D"font-family=
:&quot;Calibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">o=
p-power-start@0.service</span></u><span lang=3D"EN-US" style=3D"font-family=
:&quot;Calibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">
 is to call the PowerControl service to DC on. And <u>op-wait-power-on@0.se=
rvice</u> is to wait for PGood after DC on.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:18.0pt;text-indent:-18.0pt;mso-=
list:l1 level1 lfo2">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:&quot;Calibr=
i&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><span style=3D=
"mso-list:Ignore">6.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"font-family:&q=
uot;Calibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">Afte=
r that (DC is on and PGood is OK),
<u>start_host@0.service</u> is to start the host CPU.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><o:p>&nbsp;<=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">Best regards=
,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">Tim<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
zhang_cy1989 [mailto:zhang_cy1989@163.com]
<br>
<b>Sent:</b> Thursday, December 26, 2019 10:22 AM<br>
<b>To:</b> CS20 CHLi30 &lt;CHLI30@nuvoton.com&gt;<br>
<b>Cc:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> Re:RE: systemctl start obmc-host-start@0.target fail<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">Dear,Tim<o:p></o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;&nbsp; Thank you for=
 guidance.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;&nbsp; I will study =
the dbus-monitor and the dependencies of
<a href=3D"mailto:obmc-host-start@0.target">obmc-host-start@0.target</a>.<o=
:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;</span><span lang=3D=
"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;=
color:#333333;background:#E0E0E0">@CS20 CHLi30</span><span lang=3D"EN-US" s=
tyle=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:bla=
ck"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp; I need ask you anot=
her advice.
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp; I use the romulus r=
ecipes to build BMC firmware. And use this fw to the X86 motherboard &#43; =
AST2500.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp; The romulus is base=
 on openpower. And my platform is X86 motherboard.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;
</span><b><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;=
Arial&quot;,sans-serif;color:#DD4032">Is it feasible that using romulus BMC=
 firmware to X86 motherboard, specially the power control part?</span></b><=
span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;=
,sans-serif;color:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp; Would you have bett=
er suggestion?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp; Looking forward to =
your replay.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;Best Regards<o:p></o=
:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;Felixzhang<o:p></o:p=
></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></=
p>
<p><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&q=
uot;,sans-serif;color:black">At 2019-12-26 09:34:09, &quot;CS20 CHLi30&quot=
; &lt;<a href=3D"mailto:CHLI30@nuvoton.com">CHLI30@nuvoton.com</a>&gt; wrot=
e:<o:p></o:p></span></p>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm" id=3D"isReplyContent">
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">Hi Felixz=
hang,</span><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quo=
t;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;</s=
pan><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&=
quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">About thi=
s kind of systemd target start fail, you can use
<b>dbus-monitor</b> to check target dependency more detail.</span><span lan=
g=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-se=
rif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">BTW, you =
can also use
<b>systemctl list-dependecies <a href=3D"mailto:obmc-host-start@0.target">o=
bmc-host-start@0.target</a></b> to get all related services.</span><span la=
ng=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-s=
erif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;</s=
pan><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&=
quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">For examp=
le for using x86-power-control:</span><span lang=3D"EN-US" style=3D"font-si=
ze:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><b><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quo=
t;Calibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">system=
ctl list-dependencies
<a href=3D"mailto:obmc-host-start@0.target">obmc-host-start@0.target</a></s=
pan></b><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;</s=
pan><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&=
quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW"><a href=
=3D"mailto:obmc-host-start@0.target">obmc-host-start@0.target</a>
 (Power ON)</span><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-famil=
y:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">-&gt;
<a href=3D"mailto:mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.s=
ervice">
mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.service</a></span><=
span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;=
,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">-&gt;
<a href=3D"mailto:phosphor-reset-host-reboot-attempts@0.service">phosphor-r=
eset-host-reboot-attempts@0.service</a></span><span lang=3D"EN-US" style=3D=
"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:black"><o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">-&gt;
<a href=3D"mailto:obmc-host-startmin@0.target">obmc-host-startmin@0.target<=
/a></span><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;=
Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nb=
sp;&nbsp;&nbsp; -&gt;
<a href=3D"mailto:mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.s=
ervice">
mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.service</a></span><=
span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;=
,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nb=
sp;&nbsp;&nbsp; -&gt;
<a href=3D"mailto:obmc-enable-host-watchdog@0.service">obmc-enable-host-wat=
chdog@0.service</a></span><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nb=
sp;&nbsp;&nbsp; -&gt;
<a href=3D"mailto:phosphor-watchdog@poweron.service">phosphor-watchdog@powe=
ron.service</a></span><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nb=
sp;&nbsp;&nbsp; -&gt;
<a href=3D"mailto:obmc-chassis-poweron@0.target">obmc-chassis-poweron@0.tar=
get</a></span><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&q=
uot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt;
<a href=3D"mailto:intel-power-start@0.service">intel-power-start@0.service<=
/a></span><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;=
Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt;
<a href=3D"mailto:mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.s=
ervice">
mapper-wait@-xyz-openbmc_project-Chassis-Control-Power0.service</a></span><=
span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;=
,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt;
<a href=3D"mailto:phosphor-fan-control-init@0.service">phosphor-fan-control=
-init@0.service</a></span><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt;
<a href=3D"mailto:phosphor-fan-monitor-init@0.service">phosphor-fan-monitor=
-init@0.service</a></span><span lang=3D"EN-US" style=3D"font-size:10.5pt;fo=
nt-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt;
<a href=3D"mailto:phosphor-fan-presence-tach@0.service">phosphor-fan-presen=
ce-tach@0.service</a></span><span lang=3D"EN-US" style=3D"font-size:10.5pt;=
font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;</s=
pan><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&=
quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">Then you =
should found that might some services doesn&#8217;t start
 normally and cause your <a href=3D"mailto:obmc-host-tart@0.target">obmc-ho=
st-tart@0.target</a> start fail.</span><span lang=3D"EN-US" style=3D"font-s=
ize:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">&nbsp;</s=
pan><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&=
quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">Best rega=
rds,</span><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot=
;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:#1F497D;mso-fareast-language:ZH-TW">Tim</span=
><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&quo=
t;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quo=
t;Calibri&quot;,sans-serif;color:black">From:</span></b><span lang=3D"EN-US=
" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;colo=
r:black">
 openbmc [<a href=3D"mailto:openbmc-bounces&#43;chli30=3Dnuvoton.com@lists.=
ozlabs.org">mailto:openbmc-bounces&#43;chli30=3Dnuvoton.com@lists.ozlabs.or=
g</a>]
<b>On Behalf Of </b>zhang_cy1989<br>
<b>Sent:</b> Wednesday, December 25, 2019 7:19 PM<br>
<b>To:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs=
.org</a><br>
<b>Subject:</b> systemctl start <a href=3D"mailto:obmc-host-start@0.target"=
>obmc-host-start@0.target</a> fail</span><span lang=3D"EN-US" style=3D"font=
-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></p>
<div>
<p><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&q=
uot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">Dear All<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">&nbsp;&nbsp; On ast2500&#43;x86 platform=
, use the romulus bmc firmware, the detail information:<o:p></o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><b><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quo=
t;Arial&quot;,sans-serif;color:#DD4032">ID=3D&quot;openbmc-phosphor&quot;</=
span></b><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:#DD4032"><br>
<b>NAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro=
)&quot;</b><br>
<b>VERSION=3D&quot;2.7.0-0&quot;</b><br>
<b>VERSION_ID=3D&quot;2.7.0-0-gcb91a7773-dirty&quot;</b><br>
<b>PRETTY_NAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Project Reference=
 Distro) 2.7.0-0&quot;</b><br>
<b>BUILD_ID=3D&quot;2.7.0&quot;</b><br>
<b>OPENBMC_TARGET_MACHINE=3D&quot;romulus&quot;</b></span><span lang=3D"EN-=
US" style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,sans-serif;colo=
r:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">&nbsp; The BMC ip: 192.168.0.1<o:p></o:p=
></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">&nbsp; Remote Computer ip: 192.168.0.2<o=
:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">&nbsp; I use the ipmitool to communicate=
 with BMC:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">ipmitool -I lanplus -H 192.168.0.1 -U ro=
ot -P 0penBmc power on<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">&nbsp;And from the journalctl results, I=
 found those infromations:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">......<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">-- The unit
<a href=3D"mailto:op-wait-power-on@0.service">op-wait-power-on@0.service</a=
> has entered the 'failed' state with result 'timeout'.<br>
Nov 28 07:55:47 romulus systemd[1]: Failed to start Wait for Power0 to turn=
 on.<br>
-- Subject: A start job for unit <a href=3D"mailto:op-wait-power-on@0.servi=
ce">op-wait-power-on@0.service</a> has failed<br>
-- Defined-By: systemd<br>
-- Support: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__lists.freedesktop.org_mailman_listinfo_systemd-2Ddevel&amp;d=3DDwMGbg&am=
p;c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&amp;r=3D_vvS1tH9U_15yp1--=
_mdcWxVamV74LY4Xz5Zy4-7UIo&amp;m=3DEhLiDsjPMBS98eeZEQG2UAHMPrvbvGb_OublwmQy=
2uc&amp;s=3DUO9vddeGuzrgEFSgZkdgqCUEsjWHcXBofqYYlHxCNkM&amp;e=3D">
https://lists.freedesktop.org/mailman/listinfo/systemd-devel</a><br>
--<br>
-- A start job for unit <a href=3D"mailto:op-wait-power-on@0.service">op-wa=
it-power-on@0.service</a> has finished with a failure.<br>
--<br>
-- The job identifier is 906 and the job result is failed.<br>
Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Chassis0 (Power O=
n).<br>
-- Subject: A start job for unit <a href=3D"mailto:obmc-chassis-poweron@0.t=
arget">obmc-chassis-poweron@0.target</a> has failed<br>
-- Defined-By: systemd<br>
-- Support: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__lists.freedesktop.org_mailman_listinfo_systemd-2Ddevel&amp;d=3DDwMGbg&am=
p;c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&amp;r=3D_vvS1tH9U_15yp1--=
_mdcWxVamV74LY4Xz5Zy4-7UIo&amp;m=3DEhLiDsjPMBS98eeZEQG2UAHMPrvbvGb_OublwmQy=
2uc&amp;s=3DUO9vddeGuzrgEFSgZkdgqCUEsjWHcXBofqYYlHxCNkM&amp;e=3D">
https://lists.freedesktop.org/mailman/listinfo/systemd-devel</a><br>
--<br>
-- A start job for unit <a href=3D"mailto:obmc-chassis-poweron@0.target">ob=
mc-chassis-poweron@0.target</a> has finished with a failure.<br>
--<br>
-- The job identifier is 886 and the job result is dependency.<br>
Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Start Host0 Minim=
um.<br>
-- Subject: A start job for unit <a href=3D"mailto:obmc-host-startmin@0.tar=
get">obmc-host-startmin@0.target</a> has failed<br>
-- Defined-By: systemd<br>
-- Support: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__lists.freedesktop.org_mailman_listinfo_systemd-2Ddevel&amp;d=3DDwMGbg&am=
p;c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&amp;r=3D_vvS1tH9U_15yp1--=
_mdcWxVamV74LY4Xz5Zy4-7UIo&amp;m=3DEhLiDsjPMBS98eeZEQG2UAHMPrvbvGb_OublwmQy=
2uc&amp;s=3DUO9vddeGuzrgEFSgZkdgqCUEsjWHcXBofqYYlHxCNkM&amp;e=3D">
https://lists.freedesktop.org/mailman/listinfo/systemd-devel</a><br>
--<br>
-- A start job for unit <a href=3D"mailto:obmc-host-startmin@0.target">obmc=
-host-startmin@0.target</a> has finished with a failure.<br>
--<br>
-- The job identifier is 752 and the job result is dependency.<br>
Nov 28 07:55:47 romulus systemd[1]: Dependency failed for Start Host0.<br>
-- Subject: A start job for unit <a href=3D"mailto:obmc-host-start@0.target=
">obmc-host-start@0.target</a> has failed<br>
-- Defined-By: systemd<br>
-- Support: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3=
A__lists.freedesktop.org_mailman_listinfo_systemd-2Ddevel&amp;d=3DDwMGbg&am=
p;c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&amp;r=3D_vvS1tH9U_15yp1--=
_mdcWxVamV74LY4Xz5Zy4-7UIo&amp;m=3DEhLiDsjPMBS98eeZEQG2UAHMPrvbvGb_OublwmQy=
2uc&amp;s=3DUO9vddeGuzrgEFSgZkdgqCUEsjWHcXBofqYYlHxCNkM&amp;e=3D">
https://lists.freedesktop.org/mailman/listinfo/systemd-devel</a><br>
--<br>
-- A start job for unit <a href=3D"mailto:obmc-host-start@0.target">obmc-ho=
st-start@0.target</a> has finished with a failure.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">Nov 28 08:24:09 romulus systemd[1]:
<a href=3D"mailto:obmc-host-start@0.target">obmc-host-start@0.target</a>: J=
ob <a href=3D"mailto:obmc-host-start@0.target">
obmc-host-start@0.target</a>/start failed with result 'dependency'.<br>
Nov 28 08:24:09 romulus systemd[1]: <a href=3D"mailto:obmc-host-start@0.tar=
get">obmc-host-start@0.target</a>: Triggering OnFailure=3D dependencies.<br=
>
Nov 28 08:24:10 romulus systemd[1]: <a href=3D"mailto:obmc-host-startmin@0.=
target">
obmc-host-startmin@0.target</a>: Job <a href=3D"mailto:obmc-host-startmin@0=
.target">
obmc-host-startmin@0.target</a>/start failed with result 'dependency'.<br>
Nov 28 08:24:10 romulus systemd[1]: <a href=3D"mailto:obmc-host-startmin@0.=
target">
obmc-host-startmin@0.target</a>: Triggering OnFailure=3D dependencies.<br>
Nov 28 08:24:10 romulus systemd[1]: <a href=3D"mailto:obmc-chassis-poweron@=
0.target">
obmc-chassis-poweron@0.target</a>: Job <a href=3D"mailto:obmc-chassis-power=
on@0.target">
obmc-chassis-poweron@0.target</a>/start failed with result 'dependency'.<br=
>
Nov 28 08:24:10 romulus systemd[1]: <a href=3D"mailto:obmc-chassis-poweron@=
0.target">
obmc-chassis-poweron@0.target</a>: Triggering OnFailure=3D dependencies.<o:=
p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">......<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">I alse do the following action:<o:p></o:=
p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><b><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quo=
t;Arial&quot;,sans-serif;color:#528135">systemctl start
<a href=3D"mailto:obmc-host-start@0.target">obmc-host-start@0.target</a> </=
span></b><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">And alse get the similar fail result.
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">I don't how to debug this isuue.Could yo=
u give me some suggestions?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">Best Regards<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">Felixzhang<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;A=
rial&quot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;margin-bottom:12.0p=
t"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&q=
uot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;margin-bottom:12.0p=
t"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&q=
uot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></p>
<p><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&q=
uot;,sans-serif;color:black">&nbsp;<o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span=
 lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Arial&quot;,san=
s-serif;color:black">
<hr size=3D"2" width=3D"100%" align=3D"center">
</span></div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif;color:gray">The privileged confidential information cont=
ained in this email is intended for use only by the addressees as indicated=
 by the original sender of this email. If you are
 not the addressee indicated in this email or are not responsible for deliv=
ery of the email to such a person, please kindly reply to the sender indica=
ting this fact and delete all copies of it from your computer and network s=
erver immediately. Your cooperation
 is highly appreciated. It is advised that any unauthorized use of confiden=
tial information of Nuvoton is strictly prohibited; and any information in =
this email irrelevant to the official business of Nuvoton shall be deemed a=
s neither given nor endorsed by
 Nuvoton. </span><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family=
:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
</blockquote>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span lang=3D"EN-US">=
<o:p>&nbsp;</o:p></span></p>
<p><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
</div>
<hr align=3D"center" width=3D"100%">
<span style=3D"font-size:12pt;line-height:0.7;font-family: 'Arial'; color:#=
808080">The privileged confidential information contained in this email is =
intended for use only by the addressees as indicated by the original sender=
 of this email. If you are not the
 addressee indicated in this email or are not responsible for delivery of t=
he email to such a person, please kindly reply to the sender indicating thi=
s fact and delete all copies of it from your computer and network server im=
mediately. Your cooperation is highly
 appreciated. It is advised that any unauthorized use of confidential infor=
mation of Nuvoton is strictly prohibited; and any information in this email=
 irrelevant to the official business of Nuvoton shall be deemed as neither =
given nor endorsed by Nuvoton.
</span>
</body>
</html>

--_000_HK0PR03MB46603D582930A30113B225A0CF2B0HK0PR03MB4660apcp_--
