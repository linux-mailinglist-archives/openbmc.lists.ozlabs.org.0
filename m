Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1B710E420
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 02:09:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47R6Sz06CJzDqT1
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 12:09:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47R6SF6bdxzDqSn
 for <openbmc@lists.ozlabs.org>; Mon,  2 Dec 2019 12:08:26 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Dec 2019 17:08:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,267,1571727600"; d="scan'208";a="293237811"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.56])
 by orsmga001.jf.intel.com with ESMTP; 01 Dec 2019 17:08:22 -0800
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Alexander Amelkin'" <a.amelkin@yadro.com>,
	<openbmc@lists.ozlabs.org>
References: <000001d5a682$2b3fabd0$81bf0370$@linux.intel.com>
 <b0b878b8-ff90-9e22-2831-44b086c0d8a2@yadro.com>
In-Reply-To: <b0b878b8-ff90-9e22-2831-44b086c0d8a2@yadro.com>
Subject: RE: license conflicts with OpenSSL
Date: Mon, 2 Dec 2019 09:08:21 +0800
Message-ID: <002701d5a8ac$fe40d280$fac27780$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHawBYDnsmnfIhSGCalU7aJkJIZmgI7X/05p4n83YA=
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMWM4ZDk5YjYtYjY0YS00MDVkLTk0YTAtY2QwNGIxNzFhNjU3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSFNXU1JPZjU0Y2tNZTc5ZlhHdGQybjlRd3ByWWh4ZTZNMnQ0N0lXZnBiSHJzUXRQa1h6RnlTaXVzNXV6Vk1wZiJ9
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

Thanks Alexander for your quick response!

My understanding is that you will perform some changes in the upstream
https://github.com/ipmitool/ipmitool, to remove these unused/obsolete
dependencies.

But I notice the ipmitool_1.8.18.bb file in openembedded is using these
.tar.bz2 files from sourceforge.net. Just want to know do you upload the =
new
versions to sourceforge.net?

Thanks,
Yong
From: Alexander Amelkin <a.amelkin@yadro.com>=20
Sent: Friday, November 29, 2019 7:28 PM
To: Yong Li <yong.b.li@linux.intel.com>; openbmc@lists.ozlabs.org
Subject: Re: license conflicts with OpenSSL

Hi Young and all!
I checked and I can say that ipmitool needs readline solely for =
ipmishell
support. I think that if ipmitool is confgured with --disable-ipmishell,
then there will be no license clash with readline as it won't be linked.
The requirement for ncurses looks totally obsolete. Nothing seems to =
change
if I just drop the requirement for tgetent(), which is what requires
ncurses. The tgetent() function is never called from anywhere in =
ipmitool
code. I think I will just drop the requirement for ncurses from ipmitool
soon.
With best regards,
Alexander Amelkin,
Maintainer of ipmitool
https://github.com/ipmitool/ipmitool
29.11.2019 9:56, Yong Li wrote:
Hi All,
=A0
Just found that some packages included in openbmc have license conflict
issues between OpenSSL and GPL
=A0
Ipmitool package and krb5 package are both linked to openssl and other =
GPL
libs.=20
=A0
Based on the discussion in
https://lists.debian.org/debian-legal/2004/05/msg00595.html, I think =
they
are conflict licenses.
=A0
Just want to know if we need to do something? Such as add an additional
license file?
=A0
=A0
More information:
meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
LICENSE =3D "BSD-3-Clause"
DEPENDS =3D "openssl readline ncurses"
=A0
Readline is GPLv3
=A0
meta-openembedded/meta-oe/recipes-connectivity/krb5/krb5_1.17.bb:
LICENSE =3D "MIT"
DEPENDS =3D "bison-native ncurses util-linux e2fsprogs e2fsprogs-native
openssl"
=A0
Util-linux is GPLv2
=A0
=A0
Thanks,
Yong

