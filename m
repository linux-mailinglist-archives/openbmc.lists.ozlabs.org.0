Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 870BF34628C
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 16:15:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Zg93hg4z30GL
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 02:15:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HC8agYbT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HC8agYbT; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Zft5VZhz30B7
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 02:15:01 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12NF8xa4166960; Tue, 23 Mar 2021 11:14:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VklDzQWxDdHl44ka8VvfhegBbBx0XFunfLcrAivOduU=;
 b=HC8agYbT6DcGsq1c2Pj404gOjV0bX6An2A0vOl6hKPP39KOtLmetth27gccm7OM4zQvs
 49NxrrVfkjlUrCyd8Ft7q7qTvZ9AaVlK024/B3ByBTuwOayeOVhbt4G23UIkLHEjUhOW
 ROKeTFmN6YGR8u2J6trkPWEL0AS0dxxnSAYkK0mZVHwTnvFG9/Hb6XAlidcHzUmpCBam
 EHnZFlpu1cZ0wKuzNQttk+Dun9yN6hTrdeHOIt34QjmVZYETE7OPB6mllANpDH141PtU
 dG/2Jq58Zey56m24Xeb6pz3AWDDTnBMSvYhkyRzQuDSO06/hg2i6pl3lCr1Os5iFmAcF WA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37ef54yj4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 11:14:58 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12NF7FSn014843;
 Tue, 23 Mar 2021 15:14:58 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 37d9d9xsax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 15:14:58 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12NFEvko23003504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 15:14:57 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AAAAAE05C;
 Tue, 23 Mar 2021 15:14:57 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB998AE062;
 Tue, 23 Mar 2021 15:14:56 +0000 (GMT)
Received: from demeter.local (unknown [9.160.86.38])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 23 Mar 2021 15:14:56 +0000 (GMT)
Subject: Re: [OpenBMC]: root is rejected to login an aarch64 openBmc system
To: wangmin@phytium.com.cn, "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
References: <!&!AAAAAAAAAAAuAAAAAAAAAO4CP8j4rjtAsuu29GjYeJQBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABwHLy5A/79RoxKRBG5yGpSAQAAAAA=@phytium.com.cn>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <3c7899d1-39c7-c0f4-7822-21fa8d66f709@linux.ibm.com>
Date: Tue, 23 Mar 2021 10:14:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <!&!AAAAAAAAAAAuAAAAAAAAAO4CP8j4rjtAsuu29GjYeJQBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABwHLy5A/79RoxKRBG5yGpSAQAAAAA=@phytium.com.cn>
Content-Language: en-US
X-TM-AS-GCONF: 00
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-23_06:2021-03-22,
 2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103230112
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
Cc: =?UTF-8?B?J+WImOWLh+m5jyc=?= <liuyongpeng@phytium.com.cn>,
 shuyiqi@phytium.com.cn
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/23/21 4:52 AM, wangmin@phytium.com.cn wrote:
> I am sorry, the startup log was pasted wrong contents in the last=20
> email. The following texts are showing the startup log. [ 8.450487][=20
> 1] VFS: Mounted root (squashfs filesystem) readonly on device 1:0. =E2=80=
=8D =E2=80=8D=20
> =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=
=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =
=E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D=20
>=20

You asked why root login fails.=C2=A0 The log below shows a number of=20
failures.=C2=A0 These include:
> systemd[1]: Running with  unpopulated /etc.
> systemd[1]: System cannot  boot: Missing /etc/machine-id and /etc is moun=
ted read-only.

The root user login credentials are stored in /etc/passwd and=20
/etc/shadow.=C2=A0 Also, the Linux-PAM authentication stack is stored under=
=20
/etc/pam.d/.=C2=A0 So, if /etc is messed up, logins will fail.

I don't see any fstab entries for /etc, meaning nothing hides its=20
content.=C2=A0 Can you look at your readonly /etc file system (from your=20
build artifacts, or inside your install image) to see if the files=20
mentioned above are present?=C2=A0 But please note I am not an fstab expert.

Good luck,
Joseph

> I am sorry, the startup log was pasted wrong contents in the last=20
> email. The following texts are showing the
>
> startup log.
>
> [=C2=A0=C2=A0=C2=A0 8.450487][ 1] VFS: Mounted root (squashfs filesystem)=
 readonly on=20
> device 1:0.
>
> [=C2=A0=C2=A0=C2=A0 8.457904][ 1] devtmpfs: mounted
>
> [=C2=A0=C2=A0=C2=A0 8.461538][ 1] Freeing unused kernel memory: 1344K
>
> [=C2=A0=C2=A0=C2=A0 8.466494][ 1] Run /sbin/init as init process
>
> [=C2=A0=C2=A0=C2=A0 8.561032][ 1] systemd[1]: systemd 244.3+ running in s=
ystem mode.=20
> (+PAM -AUDIT -SELINUX -IMA -APPARMOR -SMACK +SYSVINIT -UTMP=20
> -LIBCRYPTSETUP -GCRYPT -GNUTLS -ACL +XZ -LZ4 -SECCOMP +BLKID -ELFUTILS=20
> +KMOD -IDN2 -IDN -PCRE2 default-hierarchy=3Dhybrid)
>
> [=C2=A0=C2=A0=C2=A0 8.583865][ 1] systemd[1]: Detected architecture arm64.
>
> [=C2=A0=C2=A0=C2=A0 8.589282][ 1] systemd[1]: Running with unpopulated /e=
tc.
>
> Welcome to Phosphor OpenBMC (Phosphor OpenBMC Project Reference=20
> Distro) 0.1.0!
>
> [=C2=A0=C2=A0=C2=A0 8.616684][ 1] systemd[1]: Set hostname to <ft2500>.
>
> [=C2=A0=C2=A0=C2=A0 8.621737][ 1] systemd[1]: System cannot boot: Missing=
=20
> /etc/machine-id and /etc is mounted read-only.
>
> [=C2=A0=C2=A0=C2=A0 8.631004][ 1] systemd[1]: Booting up is supported onl=
y when:
>
> [=C2=A0=C2=A0=C2=A0 8.636815][ 1] systemd[1]: 1) /etc/machine-id exists a=
nd is populated.
>
> [=C2=A0=C2=A0=C2=A0 8.643403][ 1] systemd[1]: 2) /etc/machine-id exists a=
nd is empty.
>
> [=C2=A0=C2=A0=C2=A0 8.649646][ 1] systemd[1]: 3) /etc/machine-id is missi=
ng and /etc=20
> is writable.
>
> [=C2=A0=C2=A0=C2=A0 8.909871][ 1] systemd[1]: Failed to populate /etc wit=
h preset=20
> unit settings, ignoring: Read-only file system
>
> [=C2=A0=C2=A0=C2=A0 8.953437][ 1] systemd[1]:=20
> /lib/systemd/system/phosphor-ipmi-net@.socket:3: Invalid interface=20
> name, ignoring: sys-subsystem-net-devices-%i.device
>
> [=C2=A0=C2=A0=C2=A0 8.987426][ 1] systemd[1]: Failed to put bus name to h=
ashmap: File=20
> exists
>
> [=C2=A0=C2=A0=C2=A0 8.994294][ 1] systemd[1]: xyz.openbmc_project.State.H=
ost.service:=20
> Two services allocated for the same bus name=20
> xyz.openbmc_project.State.Host, refusing operation.
>
> [=C2=A0=C2=A0=C2=A0 9.010841][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-host-reset-running@.target+0 =E9=88=ABobmc-host-reset-running@0.targ=
et
>
> [=C2=A0=C2=A0=C2=A0 9.023396][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-host-stop@.target+0 =E9=88=ABobmc-host-stop@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.033834][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-host-startmin@.target+0 =E9=88=ABobmc-host-startmin@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.047367][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-power-on@.target+0 =E9=88=ABobmc-power-on@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.057600][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-power-start@.target+0 =E9=88=ABobmc-power-start@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.072831][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-power-start-pre@.target+0 =E9=88=ABobmc-power-start-pre@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.084856][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-host-started@.target+0 =E9=88=ABobmc-host-started@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.095814][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-host-starting@.target+0 =E9=88=ABobmc-host-starting@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.106930][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-host-start-pre@.target+0 =E9=88=ABobmc-host-start-pre@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.122329][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-host-quiesce@.target+0 =E9=88=ABobmc-host-quiesce@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.133285][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-chassis-poweroff@.target+0 =E9=88=ABobmc-chassis-poweroff@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.146007][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-power-off@.target+0 =E9=88=ABobmc-power-off@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.156446][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-power-stop@.target+0 =E9=88=ABobmc-power-stop@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.167236][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-power-stop-pre@.target+0 =E9=88=ABobmc-power-stop-pre@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.179055][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-host-stopped@.target+0 =E9=88=ABobmc-host-stopped@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.190016][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-host-stopping@.target+0 =E9=88=ABobmc-host-stopping@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.201162][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-host-stop-pre@.target+0 =E9=88=ABobmc-host-stop-pre@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.212993][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-chassis-powerreset@.target+0 =E9=88=ABobmc-chassis-powerreset@0.targ=
et
>
> [=C2=A0=C2=A0 =C2=A09.225026][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-chassis-poweron@.target+0 =E9=88=ABobmc-chassis-poweron@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.238767][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-chassis-powered-off@.target+0 =E9=88=ABobmc-chassis-powered-off@0.ta=
rget
>
> [=C2=A0=C2=A0=C2=A0 9.272031][ 1] systemd[1]:=20
> /lib/systemd/system/phosphor-pid-control.service:7: Neither a valid=20
> executable name nor an absolute path: {bindir}/swampd
>
> [=C2=A0=C2=A0=C2=A0 9.285365][ 1] systemd[1]: phosphor-pid-control.servic=
e: Unit=20
> configuration has fatal error, unit will not be started.
>
> [=C2=A0=C2=A0=C2=A0 9.308206][ 1] systemd[1]: unit_file_find_fragment:=20
> obmc-host-reset@.target+0 =E9=88=ABobmc-host-reset@0.target
>
> [=C2=A0=C2=A0=C2=A0 9.332286][ 1] systemd[1]: phosphor-pid-control.servic=
e: Cannot=20
> add dependency job, ignoring: Unit phosphor-pid-control.service has a=20
> bad unit file setting.
>
> [=C2=A0=C2=A0=C2=A0 9.346322][ 1] systemd[1]: xyz.openbmc_project.State.H=
ost.service:=20
> Cannot add dependency job, ignoring: Unit=20
> xyz.openbmc_project.State.Host.service failed to load properly: File=20
> exists.
>
> [=C2=A0=C2=A0=C2=A0 9.364178][ 1] random: systemd: uninitialized urandom =
read (16=20
> bytes read)
>
> [=C2=A0=C2=A0=C2=A0 9.371220][ 1] systemd[1]: system-mapper\x2dwait.slice=
: unit=20
> configures an IP firewall, but the local system does not support=20
> BPF/cgroup firewalling.
>
> [=C2=A0=C2=A0=C2=A0 9.384639][ 1] systemd[1]: (This warning is only shown=
 for the=20
> first unit using IP firewalling.)
>
> [=C2=A0=C2=A0=C2=A0 9.394482][ 1] systemd[1]: Created slice system-mapper=
\x2dwait.slice.
>
> [=C2=A0 OK=C2=A0 ] Created slice system-mapper\x2dwait.slice.
>
> [=C2=A0=C2=A0=C2=A0 9.415686][ 1] random: systemd: uninitialized urandom =
read (16=20
> bytes read)
>
> [=C2=A0=C2=A0=C2=A0 9.422990][ 1] systemd[1]: Created slice system-obmc\x=
2dconsole.slice.
>
> [=C2=A0 OK=C2=A0 ] Created slice system-obmc\x2dconsole.slice.
>
> [=C2=A0=C2=A0=C2=A0 9.443668][ 1] random: systemd: uninitialized urandom =
read (16=20
> bytes read)
>
> [=C2=A0=C2=A0=C2=A0 9.450959][ 1] systemd[1]: Created slice=20
> system-obmc\x2dled\x2dgroup\x2dstart.slice.
>
> [=C2=A0 OK=C2=A0 ] Created slice system-obmc\x2dled\x2dgroup\x2dstart.sli=
ce.
>
> [=C2=A0=C2=A0=C2=A0 9.476116][ 1] systemd[1]: Created slice=20
> system-org.openbmc.control.Host.slice.
>
> [=C2=A0 OK=C2=A0 ] Created slice system-org.openbmc.control.Host.slice.
>
> [=C2=A0=C2=A0=C2=A0 9.500025][ 1] systemd[1]: Created slice=20
> system-phosphor\x2dcertificate\x2dmanager.slice.
>
> [=C2=A0 OK=C2=A0 ] Created slice system-phosp=E9=88=A5=EE=9B=8Acertificat=
e\x2dmanager.slice.
>
> [=C2=A0=C2=A0=C2=A0 9.524018][ 1] systemd[1]: Created slice=20
> system-phosphor\x2ddiscover\x2dsystem\x2dstate.slice.
>
> [=C2=A0 OK=C2=A0 ] Created slice system-phosp=E9=88=A5=EE=9B=95ver\x2dsys=
tem\x2dstate.slice.
>
> [=C2=A0=C2=A0=C2=A0 9.548011][ 1] systemd[1]: Created slice=20
> system-phosphor\x2dipmi\x2dkcs.slice.
>
> [=C2=A0 OK=C2=A0 ] Created slice system-phosphor\x2dipmi\x2dkcs.slice.
>
> [=C2=A0=C2=A0=C2=A0 9.572014][ 1] systemd[1]: Created slice=20
> system-phosphor\x2dipmi\x2dnet.slice.
>
> [=C2=A0 OK=C2=A0 ] Created slice system-phosphor\x2dipmi\x2dnet.slice.
>
> [=C2=A0=C2=A0=C2=A0 9.596078][ 1] systemd[1]: Created slice=20
> system-phosphor\x2dreset\x2dhost\x2dcheck.slice.
>
> [=C2=A0 OK=C2=A0 ] Created slice system-phosp=E9=88=A5=EE=9B=8Areset\x2dh=
ost\x2dcheck.slice.
>
> [=C2=A0=C2=A0=C2=A0 9.620149][ 1] systemd[1]: Created slice=20
> system-phosphor\x2dreset\x2dhost\x2drunning.slice.
>
> [=C2=A0 OK=C2=A0 ] Created slice system-phosp=E9=88=A5=EE=9B=8Bset\x2dhos=
t\x2drunning.slice.
>
> [=C2=A0=C2=A0=C2=A0 9.644060][ 1] systemd[1]: Created slice=20
> system-phosphor\x2dreset\x2dsensor\x2dstates.slice.
>
> [=C2=A0 OK=C2=A0 ] Created slice system-phosp=E9=88=A5=EE=9B=99et\x2dsens=
or\x2dstates.slice.
>
> [=C2=A0=C2=A0=C2=A0 9.668015][ 1] systemd[1]: Created slice system-serial=
\x2dgetty.slice.
>
> [=C2=A0 OK=C2=A0 ] Created slice system-serial\x2dgetty.slice.
>
> [=C2=A0=C2=A0=C2=A0 9.691756][ 1] systemd[1]: Started Dispatch Password R=
equests to=20
> Console Directory Watch.
>
> [=C2=A0 OK=C2=A0 ] Started Dispatch Password =E9=88=A5=EE=9B=9As to Conso=
le Directory Watch.
>
> [=C2=A0=C2=A0=C2=A0 9.715715][ 1] systemd[1]: Started Forward Password Re=
quests to=20
> Wall Directory Watch.
>
> [=C2=A0 OK=C2=A0 ] Started Forward Password R=E9=88=A5=EE=9B=9Bests to Wa=
ll Directory Watch.
>
> [=C2=A0=C2=A0=C2=A0 9.739718][ 1] systemd[1]: Reached target Paths.
>
> [=C2=A0 OK=C2=A0 ] Reached target Paths.
>
> [=C2=A0=C2=A0=C2=A0 9.759675][ 1] systemd[1]: Reached target Slices.
>
> [=C2=A0 OK=C2=A0 ] Reached target Slices.
>
> [=C2=A0=C2=A0=C2=A0 9.779675][ 1] systemd[1]: Reached target Swap.
>
> [=C2=A0 OK=C2=A0 ] Reached target Swap.
>
> [=C2=A0=C2=A0=C2=A0 9.800012][ 1] systemd[1]: Listening on Syslog Socket.
>
> [=C2=A0 OK=C2=A0 ] Listening on Syslog Socket.
>
> [=C2=A0=C2=A0=C2=A0 9.821145][ 1] systemd[1]: Listening on Process Core D=
ump Socket.
>
> [=C2=A0 OK=C2=A0 ] Listening on Process Core Dump Socket.
>
> [=C2=A0=C2=A0=C2=A0 9.843743][ 1] systemd[1]: Listening on initctl Compat=
ibility=20
> Named Pipe.
>
> [=C2=A0 OK=C2=A0 ] Listening on initctl Compatibility Named Pipe.
>
> [=C2=A0=C2=A0=C2=A0 9.867847][ 1] systemd[1]: Listening on Journal Audit =
Socket.
>
> [=C2=A0 OK=C2=A0 ] Listening on Journal Audit Socket.
>
> [=C2=A0=C2=A0=C2=A0 9.887759][ 1] systemd[1]: Listening on Journal Socket=
 (/dev/log).
>
> [=C2=A0 OK=C2=A0 ] Listening on Journal Socket (/dev/log).
>
> [=C2=A0=C2=A0=C2=A0 9.907805][ 1] systemd[1]: Listening on Journal Socket.
>
> [=C2=A0 OK=C2=A0 ] Listening on Journal Socket.
>
> [=C2=A0=C2=A0=C2=A0 9.927816][ 1] systemd[1]: Listening on udev Control S=
ocket.
>
> [=C2=A0 OK=C2=A0 ] Listening on udev Control Socket.
>
> [=C2=A0=C2=A0=C2=A0 9.947744][ 1] systemd[1]: Listening on udev Kernel So=
cket.
>
> [=C2=A0 OK=C2=A0 ] Listening on udev Kernel Socket.
>
> [=C2=A0=C2=A0=C2=A0 9.969124][ 1] systemd[1]: Mounting Huge Pages File Sy=
stem...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting Huge Pages File=
 System...
>
> [=C2=A0=C2=A0=C2=A0 9.993276][ 1] systemd[1]: Mounting POSIX Message Queu=
e File System...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting POSIX Message Q=
ueue File System...
>
> [=C2=A0=C2=A0 10.017245][ 1] systemd[1]: Mounting Kernel Debug File Syste=
m...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting Kernel Debug Fi=
le System...
>
> [=C2=A0=C2=A0 10.037219][ 1] systemd[1]: Mounting Temporary Directory (/t=
mp)...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting Temporary Direc=
tory (/tmp)...
>
> [=C2=A0=C2=A0 10.055761][ 1] systemd[1]: Condition check resulted in Crea=
te list=20
> of static device nodes for the current kernel being skipped.
>
> [=C2=A0=C2=A0 10.068965][ 1] systemd[1]: Starting File System Check on Ro=
ot=20
> Device...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting File System Che=
ck on Root Device...
>
> [=C2=A0=C2=A0 10.093656][ 1] systemd[1]: Starting Journal Service...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Startin[ 10.099411][ 1] =
systemd[1]: Condition check resulted=20
> in Load Kernel Modules being skipped.
>
> g Journ[=C2=A0=C2=A0 10.108709][ 1] systemd[1]: Condition check resulted =
in FUSE=20
> Control File System being skipped.
>
> al Service...
>
> [=C2=A0=C2=A0 10.120331][ 1] systemd[1]: Mounting Kernel Configuration Fi=
le=20
> System...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting Kernel Configur=
ation File System...
>
> [=C2=A0=C2=A0 10.145358][ 1] systemd[1]: Starting Apply Kernel Variables.=
..
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Apply Kernel Va=
riables...
>
> [=C2=A0=C2=A0 10.165374][ 1] systemd[1]: Starting udev Coldplug all Devic=
es...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting udev Coldplug a=
ll Devices...
>
> [=C2=A0=C2=A0 10.187869][ 1] systemd[1]: Condition check resulted in Bind=
 mount=20
> volatile /var/cache being skipped.
>
> [=C2=A0=C2=A0 10.197113][ 1] systemd[1]: Condition check resulted in Bind=
 mount=20
> volatile /var/lib being skipped.
>
> [=C2=A0=C2=A0 10.206189][ 1] systemd[1]: Condition check resulted in Bind=
 mount=20
> volatile /var/spool being skipped.
>
> [=C2=A0=C2=A0 10.215515][ 1] systemd[1]: Condition check resulted in Bind=
 mount=20
> volatile /srv being skipped.
>
> [=C2=A0=C2=A0 10.229131][ 1] systemd[1]: Started Hardware RNG Entropy Gat=
herer=20
> Daemon.
>
> [=C2=A0 OK=C2=A0 ] Started Hardware RNG Entropy Gatherer Daemon.
>
> [=C2=A0=C2=A0 10.252583][ 1] systemd[1]: Started Journal Service.
>
> [=C2=A0 OK=C2=A0 ] Started Journal Service.
>
> [FAILED] Failed to mount Huge Pages File System.
>
> See 'systemctl status dev-hugepages.mount' for details.
>
> [FAILED] Failed to mount POSIX Message Queue File System.
>
> See 'systemctl status dev-mqueue.mount' for details.
>
> [FAILED] Failed to mount Kernel Debug File System.
>
> See 'systemctl status sys-kernel-debug.mount' for details.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [=C2=A0 OK=C2=A0 ] Started File System Check on Root Device.
>
> [FAILED] Failed to mount Kernel Configuration File System.
>
> See 'systemctl status sys-kernel-config.mount' for details.
>
> [=C2=A0 OK=C2=A0 ] Started Apply Kernel Variables.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Remount Root an=
d Kernel File Systems...
>
> [FAILED] Failed to start Remount Root and Kernel File Syst[=C2=A0=C2=A0=20
> 10.502419][ 0] random: fast init done
>
> ems.
>
> See 'systemctl status systemd-remount-fs.service' for details.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Flush Journal t=
o Persistent Storage=C2=A0=C2=A0 10.538824][21]=20
> systemd-journald[2228]: Received client request to flush runtime journal.
>
> 0m...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Load/Save Rando=
m Seed...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Create Static D=
evice Nodes in /dev...
>
> [=C2=A0 OK=C2=A0 ] Started udev Coldplug all Devices.
>
> [=C2=A0 OK=C2=A0 ] Started Flush Journal to Persistent Storage.
>
> [=C2=A0 OK=C2=A0 ] Started Load/Save Random Seed.
>
> [=C2=A0 OK=C2=A0 ] Started Create Static Device Nodes in /dev.
>
> [=C2=A0 OK=C2=A0 ] Reached target Local File Systems (Pre).
>
> [=C2=A0 OK=C2=A0 ] Reached target Local File Systems.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Create Volatile=
 Files and Directories...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting udev Kernel Dev=
ice Manager...
>
> [=C2=A0 OK=C2=A0 ] Started Create Volatile Files and Directories.
>
> [=C2=A0 OK=C2=A0 ] Started udev Kernel Device Manager.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Run pending pos=
tinsts...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting Kerne[=C2=A0=C2=
=A0 10.790127][27] igb 0000:04:00.1 enp4s0f1:=20
> renamed from eth1
>
> l Configuration File System...
>
> [FAILED] Failed to mount Kernel Configuration File System.
>
> [=C2=A0=C2=A0 10.827779][22] igb 0000:04:00.0 enp4s0f0: renamed from eth0
>
> See 'systemctl status sys-kernel-config.mount' for details.
>
> [=C2=A0=C2=A0 10.860175][51] igb 0000:04:00.3 enp4s0f3: renamed from eth3
>
> [FAILED] Failed to start Run pending postinsts.
>
> See 'systemctl status run-postinsts.service' for details.
>
> [=C2=A0=C2=A0 10.907728][57] igb 0000:04:00.2 enp4s0f2: renamed from eth2
>
> [=C2=A0 OK=C2=A0 ] Created slice system-xyz.openbmc_project.Hwmon.slice.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting Huge Pages File=
 System...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting POSIX Message Q=
ueue File System...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting Kernel Debug Fi=
le System...
>
> [FAILED] Failed to mount Kernel Configuration File System.
>
> See 'systemctl status sys-kernel-config.mount' for details.
>
> [FAILED] Failed to mount Huge Pages File System.
>
> See 'systemctl status dev-hugepages.mount' for details.
>
> [FAILED] Failed to mount POSIX Message Queue File System.
>
> See 'systemctl status dev-mqueue.mount' for details.
>
> [FAILED] Failed to mount Kernel Debug File System.
>
> See 'systemctl status sys-kernel-debug.mount' for details.
>
> [=C2=A0 OK=C2=A0 ] Reached target System Initialization.
>
> [=C2=A0 OK=C2=A0 ] Started Daily rotation of log files.
>
> [=C2=A0 OK=C2=A0 ] Started Daily Cleanup of Temporary Directories.
>
> [=C2=A0 OK=C2=A0 ] Reached target Timers.
>
> [=C2=A0 OK=C2=A0 ] Listening on Avahi mDNS/DNS-SD Stack Activation Socket.
>
> [=C2=A0 OK=C2=A0 ] Listening on BMC Webserver socket.
>
> [=C2=A0 OK=C2=A0 ] Listening on D-Bus System Message Bus Socket.
>
> [=C2=A0 OK=C2=A0 ] Listening on dropbear.socket.
>
> [=C2=A0 OK=C2=A0 ] Listening on Phosphor Host=E9=88=A5=EE=9B=95le SSH Per=
-Connection socket.
>
> [=C2=A0 OK=C2=A0 ] Listening on phosphor-ipmi-net@eth0.socket.
>
> [ =C2=A0OK=C2=A0 ] Reached target Sockets.
>
> [=C2=A0 OK=C2=A0 ] Reached target Basic System.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Avahi mDNS/DNS-=
SD Stack...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting SSH Key Generat=
ion...
>
> [=C2=A0 OK=C2=A0 ] Started LPC Snoop Daemon.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Name Service Ca=
che Daemon...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting LDAP daemon...
>
> [=C2=A0 OK=C2=A0 ] Started ttyVUART0 Console Server.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Host logging...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting OpenPOWER Host0=
 Control...
>
> [=C2=A0 OK=C2=A0 ] Started Phosphor certificate manager for authority.
>
> [=C2=A0 OK=C2=A0 ] Started Phosphor certificate manager for bmcweb.
>
> [=C2=A0 OK=C2=A0 ] Started Phosphor certificate manager for nslcd.
>
> [=C2=A0 OK=C2=A0 ] Started phosphor systemd target monitor.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting System Logging =
Service...
>
> [=C2=A0 OK=C2=A0 ] Started Lightweight SLP Server.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Permit User Ses=
sions...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Intel Power Con=
trol...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Phosphor Dump M=
anager...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Entity Manager.=
..
>
> [=C2=A0 OK=C2=A0 ] Started Fru Device.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Phosphor Invent=
ory Manager...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Phosphor LDAP p=
rivilege mapper...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Phosphor LED Gr=
oup Management Daemon...
>
> [=C2=A0 OK=C2=A0 ] Started IPMI SEL Logging Service.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Phosphor Log Ma=
nager...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Phosphor DBus S=
ervice Discovery Manager...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Phosphor Settin=
gs Daemon...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Phosphor Downlo=
ad Manager...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Post code manag=
er...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Rsyslog config =
updater...
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Phosphor User M=
anager...
>
> [=C2=A0 OK=C2=A0 ] Started System Logging Service.
>
> [FAILED] Failed to start SSH Key Generation.
>
> See 'systemctl status dropbearkey.service' for details.
>
> [FAILED] Failed to start Name Service Cache Daemon.
>
> See 'systemctl status nscd.service' for details.
>
> [=C2=A0 OK=C2=A0 ] Started LDAP daemon.
>
> [=C2=A0 OK=C2=A0 ] Started Permit User Sessions.
>
> [FAILED] Failed to start Phosphor Dump Manager.
>
> See 'systemctl status xyz.openbmc_project.Dump.Manager.service' for=20
> details.
>
> [FAILED] Failed to start Entity Manager.
>
> See 'systemctl status xyz.openbmc_project.EntityManager.service' for=20
> details.
>
> [DEPEND] Dependency failed for MCU Temp Sensor.
>
> [DEPEND] Dependency failed for Hwmon Temp Sensor.
>
> [DEPEND] Dependency failed for PSU Sensor.
>
> [DEPEND] Dependency failed for Exit Air Temp Sensor.
>
> [DEPEND] Dependency failed for Adc Sensor.
>
> [DEPEND] Dependency failed for Intrusion Sensor.
>
> [DEPEND] Dependency failed for IPMB Sensor.
>
> [DEPEND] Dependency failed for Fan Sensor.
>
> [DEPEND] Dependency failed for CPU Sensor.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting Temporary Direc=
tory (/tmp)...
>
> [=C2=A0 OK=C2=A0 ] Started Serial Getty on ttyS0.
>
> [=C2=A0 OK=C2=A0 ] Reached target Login Prompts.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Phosphor Ldap c=
onfig updater...
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> [=C2=A0=C2=A0 12.819393][23] random: crng init done
>
> [=C2=A0=C2=A0 12.823136][23] random: 7 urandom warning(s) missed due to r=
atelimiting
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [=C2=A0 OK=C2=A0 ] Stopped LPC Snoop Daemon.
>
> [=C2=A0 OK=C2=A0 ] Started LPC Snoop Daemon.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [=C2=A0 OK=C2=A0 ] Stopped Name Service Cache Daemon.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Name Service Ca=
che Daemon...
>
> [=C2=A0 OK=C2=A0 ] Stopped ttyVUART0 Console Server.
>
> [=C2=A0 OK=C2=A0 ] Started ttyVUART0 Console Server.
>
> [=C2=A0 OK=C2=A0 ] Stopped Lightweight SLP Server.
>
> [=C2=A0 OK=C2=A0 ] Started Lightweight SLP Server.
>
> [=C2=A0 OK=C2=A0 ] Stopped Phosphor Dump Manager.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Phosphor Dump M=
anager...
>
> [FAILED] Failed to start Name Service Cache Daemon.
>
> See 'systemctl status nscd.service' for details.
>
> [FAILED] Failed to start Phosphor Dump Manager.
>
> See 'systemctl status xyz.openbmc_project.Dump.Manager.service' for=20
> details.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [=C2=A0 OK=C2=A0 ] Stopped Entity Manager.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Entity Manager.=
..
>
> [FAILED] Failed to start Entity Manager.
>
> See 'systemctl status xyz.openbmc_project.EntityManager.service' for=20
> details.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [FAILED] Failed to mount Temporary Directory (/tmp).
>
> See 'systemctl status tmp.mount' for details.
>
> [DEPEND] Dependency failed for D-Bus System Message Bus.
>
> [=C2=A0 OK=C2=A0 ] Stopped LPC Snoop Daemon.
>
> [FAILED] Failed to start LPC Snoop Daemon.
>
> See 'systemctl status lpcsnoop.service' for details.
>
> [=C2=A0 OK=C2=A0 ] Stopped Name Service Cache Daemon.
>
> [FAILED] Failed to start Name Service Cache Daemon.
>
> See 'systemctl status nscd.service' for details.
>
> [=C2=A0 OK=C2=A0 ] Stopped ttyVUART0 Console Server.
>
> [FAILED] Failed to start ttyVUART0 Console Server.
>
> See 'systemctl status obmc-console@ttyVUART0.service' for details.
>
> [=C2=A0 OK=C2=A0 ] Stopped Lightweight SLP Server.
>
> [FAILED] Failed to start Lightweight SLP Server.
>
> See 'systemctl status slpd-lite.service' for details.
>
> [=C2=A0 OK=C2=A0 ] Stopped Phosphor Dump Manager.
>
> [=C2=A0 OK=C2=A0 ] Listening on D-Bus System Message Bus Socket.
>
> [FAILED] Failed to start Phosphor Dump Manager.
>
> See 'systemctl status xyz.openbmc_project.Dump.Manager.service' for=20
> details.
>
> [=C2=A0 OK=C2=A0 ] Stopped Entity Manager.
>
> [FAILED] Failed to start Entity Manager.
>
> See 'systemctl status xyz.openbmc_project.EntityManager.service' for=20
> details.
>
> [=C2=A0=C2=A0 17.251376][24] audit: type=3D1701 audit(1616511064.752:2):=
=20
> auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3552=20
> comm=3D"phosphor-rsyslo" exe=3D"/usr/bin/phosphor-rsyslog-conf" sig=3D6 r=
es=3D1
>
> [=C2=A0=C2=A0 17.267548][24] audit: type=3D1701 audit(1616511064.752:3):=
=20
> auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3553=20
> comm=3D"phosphor-user-m" exe=3D"/usr/bin/phosphor-user-manager" sig=3D6 r=
es=3D1
>
> [=C2=A0=C2=A0 17.283681][24] audit: type=3D1701 audit(1616511064.752:4):=
=20
> auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3525=20
> comm=3D"phosphor-certif" exe=3D"/usr/bin/phosphor-certificate-manager"=20
> sig=3D6 res=3D1
>
> [=C2=A0=C2=A0 17.300416][24] audit: type=3D1701 audit(1616511064.752:5):=
=20
> auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3550=20
> comm=3D"phosphor-downlo" exe=3D"/usr/bin/phosphor-download-manager" sig=
=3D6=20
> res=3D1
>
> [=C2=A0=C2=A0 17.316868][24] audit: type=3D1701 audit(1616511064.752:6):=
=20
> auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3543=20
> comm=3D"phosphor-ldap-m" exe=3D"/usr/bin/phosphor-ldap-mapper" sig=3D6 re=
s=3D1
>
> [=C2=A0=C2=A0 17.332888][24] audit: type=3D1701 audit(1616511064.752:7):=
=20
> auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3528=20
> comm=3D"phosphor-certif" exe=3D"/usr/bin/phosphor-certificate-manager"=20
> sig=3D6 res=3D1
>
> [=C2=A0=C2=A0 17.349614][24] audit: type=3D1701 audit(1616511064.752:8):=
=20
> auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3544=20
> comm=3D"phosphor-ledman" exe=3D"/usr/bin/phosphor-ledmanager" sig=3D6 res=
=3D1
>
> [=C2=A0=C2=A0 17.365550][24] audit: type=3D1701 audit(1616511064.752:9):=
=20
> auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3551=20
> comm=3D"post-code-manag" exe=3D"/usr/bin/post-code-manager" sig=3D6 res=
=3D1
>
> [=C2=A0=C2=A0 17.381328][24] audit: type=3D1701 audit(1616511064.752:10):=
=20
> auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3526=20
> comm=3D"phosphor-certif" exe=3D"/usr/bin/phosphor-certificate-manager"=20
> sig=3D6 res=3D1
>
> [=C2=A0=C2=A0 17.398133][24] audit: type=3D1701 audit(1616511064.752:11):=
=20
> auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3560=20
> comm=3D"phosphor-ldap-c" exe=3D"/usr/bin/phosphor-ldap-conf" sig=3D6 res=
=3D1
>
> Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0=20
> phytium_arm64 ttyS0
>
> phytium_arm64 login:
>
> phytium_arm64 login: root
>
> Login incorrect
>
> phytium_arm64 login: phytium
>
> Password:
>
> Login incorrect
>
> phytium_arm64 login:
>
> Log
>
> Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0=20
> phytium_arm64 ttyS0
>
> phytium_arm64 login: root
>
> Login incorrect
>
> phytium_arm64 login: phytium
>
> Password:
>
> Login incorrect
>
> phytium_arm64 login: phytium
>
> Password:
>
> Login incorrect
>
> phytium_arm64 login: phytium
>
> Password:
>
> Login incorrect
>
> phytium_arm64 login: phytium
>
> Password:
>
> Log
>
> Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0=20
> phytium_arm64 ttyS0
>
> phytium_arm64 login:
>
> phytium_arm64 login:
>
> phytium_arm64 login:
>
> phytium_arm64 login:
>

