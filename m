Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C31CA112156
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 03:19:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SMx44gS8zDqQC
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 13:19:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SMwC1fB1zDqRm
 for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2019 13:18:33 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 18:18:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,275,1571727600"; d="scan'208";a="412415495"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.127])
 by fmsmga006.fm.intel.com with ESMTP; 03 Dec 2019 18:18:28 -0800
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Alexander Amelkin'" <a.amelkin@yadro.com>,
	<openbmc@lists.ozlabs.org>
References: <000001d5a682$2b3fabd0$81bf0370$@linux.intel.com>
 <b0b878b8-ff90-9e22-2831-44b086c0d8a2@yadro.com>
 <002701d5a8ac$fe40d280$fac27780$@linux.intel.com>
 <e90e0947-6024-7967-f62f-43f899ed0764@yadro.com>
In-Reply-To: <e90e0947-6024-7967-f62f-43f899ed0764@yadro.com>
Subject: RE: license conflicts with OpenSSL
Date: Wed, 4 Dec 2019 10:18:27 +0800
Message-ID: <001201d5aa49$1e12c9e0$5a385da0$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQHawBYDnsmnfIhSGCalU7aJkJIZmgI7X/05AZgqc2gCc6AWo6ds1oyA
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjk2Njg3ZTItOGJjOC00YmIyLWFhNjctMzZlODA1ZDgzZjY2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidU1cL2lOcEpDUjlpc1pQOEdjcEpSTlNWQzhuNllXYTZteE9qcGd1dmNwSGJZZndTdjdPVis4THY0dWdHV29XOWoifQ==
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Alexander for your information.

The .bb file in openBMC project also needs to remove the ncurse =
dependency.

Will monitor the PR and  submit the changes, also enabling " =
--disable-ipmishell"

Thanks,
Yong

-----Original Message-----
From: Alexander Amelkin <a.amelkin@yadro.com>=20
Sent: Monday, December 2, 2019 11:13 PM
To: Yong Li <yong.b.li@linux.intel.com>; openbmc@lists.ozlabs.org
Subject: Re: license conflicts with OpenSSL

02.12.2019 4:08, Yong Li wrote:
> Thanks Alexander for your quick response!
>
> My understanding is that you will perform some changes in the upstream =

> https://github.com/ipmitool/ipmitool, to remove these unused/obsolete=20
> dependencies.

You're correct. I've already posted a PR to remove the ncurses =
dependency:
https://github.com/ipmitool/ipmitool/pull/175

I'd like at least Vernon to approve it before I merge it into master.

> But I notice the ipmitool_1.8.18.bb file in openembedded is using=20
> these
> .tar.bz2 files from sourceforge.net. Just want to know do you upload=20
> the new versions to sourceforge.net?

No, the sourceforge.net is abandoned and will not be updated.

New releases will be available at =
https://github.com/ipmitool/ipmitool/releases

I don't yet have any schedule for the next release though.

WBR, Alexander.




