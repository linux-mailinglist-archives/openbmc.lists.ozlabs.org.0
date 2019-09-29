Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B52E8C13DD
	for <lists+openbmc@lfdr.de>; Sun, 29 Sep 2019 09:50:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46gyPs3gJ7zDqjJ
	for <lists+openbmc@lfdr.de>; Sun, 29 Sep 2019 17:50:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46gyLV2CVgzDqbf
 for <openbmc@lists.ozlabs.org>; Sun, 29 Sep 2019 17:47:45 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Sep 2019 00:47:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,562,1559545200"; d="scan'208";a="189926987"
Received: from yongli3-mobl.ccr.corp.intel.com (HELO yongli3MOBL)
 ([10.239.196.61])
 by fmsmga008.fm.intel.com with ESMTP; 29 Sep 2019 00:47:39 -0700
From: "Yong Li" <yong.b.li@linux.intel.com>
To: "'Vijay Khemka'" <vijaykhemka@fb.com>, "'Kun Yi'" <kunyi@google.com>,
 "'Joel Stanley'" <joel@jms.id.au>, "'Andrew Jeffery'" <andrew@aj.id.au>,
 "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
References: <CAGMNF6XaNL1HGf7=zKeJrO7CBH_1Y+yhUJi9FQRQ--2V9U+KUA@mail.gmail.com>
 <E6FDE343-5FC6-4493-9D53-BE6317525DB7@fb.com>
In-Reply-To: <E6FDE343-5FC6-4493-9D53-BE6317525DB7@fb.com>
Subject: RE: Accessing kernel panic information without BMC console?
Date: Sun, 29 Sep 2019 15:47:38 +0800
Message-ID: <000201d5769a$2b91bc30$82b53490$@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG0LG6TYa/CxU+/JEaGo3dvibi+vgJCn0tEp3LFn0A=
Content-Language: en-us
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTFmZDJhMTUtM2NiZS00NWFmLTgwNjktNjY2MTNlMmM3ZTE1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoid3RzenQ5cEdBUGNOWXhtXC9wWUpFT0QrdHhWVGRkV24xNUZVRnVMRmVTbW1MQTFUR3ZneVpyVllsZEJpVGRSU0kifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: request-justification,no-action
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

I am working on this ramoops feature too, and it works on ast2500, just =
enable some kernel config and modify the dts.

I will send out a patch about this change later.

Thanks,
Yong
-----Original Message-----
From: openbmc =
<openbmc-bounces+yong.b.li=3Dlinux.intel.com@lists.ozlabs.org> On Behalf =
Of Vijay Khemka
Sent: Saturday, September 28, 2019 6:28 AM
To: Kun Yi <kunyi@google.com>; Joel Stanley <joel@jms.id.au>; Andrew =
Jeffery <andrew@aj.id.au>; OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Accessing kernel panic information without BMC console?



=EF=BB=BFOn 9/27/19, 3:05 PM, "openbmc on behalf of Kun Yi" =
<openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of =
kunyi@google.com> wrote:

    Hello there,
   =20
    Wonder whether anyone has had experience persisting kernel panic
    information or sending them through network? For a lot of our =
devices
    the console is either unconnected or served by obmc-console-client
    only, which wouldn't be able to capture kernel oops.
   =20
    We are starting to look into these tools:
   =20
    https://www.kernel.org/doc/html/v5.3/admin-guide/ramoops.html
    Ramoops says it requires persistent RAM.. Which may make it =
infeasible
    since we don't persist memory (or, we try not to).
   =20
    =
https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__linux.die.net_man_=
8_netdump&d=3DDwIBaQ&c=3D5VD0RTtNlTh3ycd41b3MUw&r=3Dv9MU0Ki9pWnTXCWwjHPVg=
pnCR80vXkkcrIaqU7USl5g&m=3D0H6Yf0igviHCOSHAbOPQxxM-_B0Lh1EyZm4dpdMqe2g&s=3D=
H3n57FRZwV0z_wOHqmaiRa-kQ6h3doWg712SV4ez-GU&e=3D=20
    netdump seems promising.
   =20
    https://www.kernel.org/doc/html/v5.3/admin-guide/kdump/kdump.html
    It seems we need more pieces to get kdump working. Have anyone tried
    kexec/kdump on their platforms?

I have used kdump in past was very happy with it. Yes, it needs lot more =
pieces to make it work.
   =20
   =20
   =20
    Regards,
    Kun
   =20


