Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 170699FC63
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 09:58:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JJ661TS1zDr2r
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 17:58:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JJ5T3JmGzDqvh
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 17:58:17 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 00:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; d="scan'208";a="197501243"
Received: from unknown (HELO yongli3MOBL) ([10.239.205.212])
 by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2019 00:58:13 -0700
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Milton Miller II'" <miltonm@us.ibm.com>,
 "'Zheng Bao'" <fishbaoz@hotmail.com>
References: <MN2PR04MB6669921B935ABDEC69C6DB6ECDA00@MN2PR04MB6669.namprd04.prod.outlook.com>
 <OF57E3A1EC.B5D71CB2-ON00258463.005F98C0-00258463.005F98C9@notes.na.collabserv.com>
In-Reply-To: <OF57E3A1EC.B5D71CB2-ON00258463.005F98C0-00258463.005F98C9@notes.na.collabserv.com>
Subject: RE: KCS ipmi interface doesnt work
Date: Wed, 28 Aug 2019 15:58:12 +0800
Message-ID: <000001d55d76$57d41aa0$077c4fe0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKSoxtK/rlYX7ZF+zmRf4mFFY0mEwIi038zpYSMpxA=
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYmU3Y2ZiYzYtOGQ1ZS00YjY4LTk4NDItZmU3NTkxNDlmYmU4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiOUNOaE9uaHVrV3VZaXdUTzRnRTVua01XRGRcL0hUOW1jTDVVXC9kMlM0ZWUrR2VZaHRWK0tkd2VRVk44YzRaWEtkIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
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
Cc: 'OpenBMC Maillist' <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Intel platforms are using the KCS interface for BIOS/BMC communication.

Notice there is a known issue about the dbus name, need to convert the =
dash to underscore

Ipmi-kcs3 needs to change to ipmi_kcs3

kcsbridged -c ipmi_kcs3
kcsbridged -c ipmi_kcs4

https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor/+/23001/

Thanks,
Yong
-----Original Message-----
From: openbmc =
<openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org> On Behalf =
Of Milton Miller II
Sent: Wednesday, August 28, 2019 1:24 AM
To: Zheng Bao <fishbaoz@hotmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: KCS ipmi interface doesnt work

On August 27, 2019 around 5AM in some timezone, Zheng Bao wrote:

>     =20
> Hi, All,
> My server BIOS tries to send ipmi command "self test", but openbmc( I=20
>tried Zaius)  doesn't response.
>=20
> =20
> Is this right? Or how can I debug this? Thanks.=20
>=20

Zaius is an OpenPower machine.  OpenPower is using the bt (block
transfer) device on the lpc bus to comunicate with the host for IPMI and =
does not use the KCS protocol or the keyboard device.

Someone else can suggest a better platform to copy the IPMI =
configuration to use KCS.

milton

