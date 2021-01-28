Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBDA3081BA
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 00:15:10 +0100 (CET)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRbsl67zBzDrj0
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 10:15:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aewin.com (client-ip=218.32.79.23; helo=mg.aewin.com.tw;
 envelope-from=prvs=1658a5256c=prince.yh.kuo@aewin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aewin.com header.i=@aewin.com header.a=rsa-sha256
 header.s=mg header.b=wcCAdrB9; dkim-atps=neutral
Received: from mg.aewin.com.tw (unknown [218.32.79.23])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DR1zZ5BbkzDqWM
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 11:48:02 +1100 (AEDT)
X-MailGates: (flag:3,DYNAMIC,RELAY,NOHOST:PASS)(compute_score:DELIVER,40
	,3)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=aewin; d=aewin.com;
 b=utHvT3fMOp/Jzkqd6S+NCXPkhfuIjZPyhio9/M+wa0zXp38c679+i+v+8CVPsd5SdSGqlr06q01kq/PFdxZ+l666SZoGKCPo8ztp/RTUEI6AZ7UGGg3vvrHHWsdNV1e+Y6BeT2bqIl4LxAv+GQ6WoEOHnhJ7cnb7dlRyfzFzRfM=;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aewin.com; s=mg;
 t=1611794880; bh=v2oat1xxMgvsoY/iEaRa57Ig69cvMV4C2USWzI2AHLo=;
 l=1403; h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=wcCAdrB9JA/zvbzJjdTshjspNppLOF0KBlLextIsK6F3CUpa4KY/eCLcHm4EZh0YX
 ivGrsJ5Li+Z/6xsbW8JTbKtc6X8OR1yGFhmQd1yLq1vkjTn6RwJH5CJ14tZOQ19uO5
 izSfICf8iAa7wBs4GQVahVss3k6l3NeHmnO4wYCc=
Received: from 124.9.12.7
 by mg.aewin.com.tw with MailGates ESMTP Server V5.0(17774:0:AUTH_RELAY)
 (envelope-from <prince.yh.kuo@aewin.com>);
 Thu, 28 Jan 2021 08:47:57 +0800 (CST)
Received: from 122.146.42.118
 by webmail.aewin.com.tw with Mail2000 ESMTPA Server V7.00(6620:1:AUTH_LOGIN)
 (envelope-from <prince.yh.kuo@aewin.com>);
 Thu, 28 Jan 2021 08:47:50 +0800 (CST)
From: "prince.yh.kuo" <prince.yh.kuo@aewin.com>
To: "'Andrew Geissler'" <geissonator@gmail.com>
References: <6010b181.1c69fb81.7b936.e70fSMTPIN_ADDED_BROKEN@mx.google.com>
 <1A168CFD-4555-4E27-8E25-466D6243854A@gmail.com>
In-Reply-To: <1A168CFD-4555-4E27-8E25-466D6243854A@gmail.com>
Subject: RE: [OpenBMC] - QEMU link seem like can't download
Date: Thu, 28 Jan 2021 08:47:50 +0800
Message-ID: <000301d6f50f$346afe30$9d40fa90$@yh.kuo@aewin.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Adb0VtAdpvurKyCrTG6tHWxKQQafhQAuDU7A
Content-Language: zh-tw
X-Mailman-Approved-At: Fri, 29 Jan 2021 10:14:19 +1100
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,
Thanks for your reply.
Have a nice day :)

Many thanks
Prince

-----Original Message-----
From: Andrew Geissler [mailto:geissonator@gmail.com]=20
Sent: Wednesday, January 27, 2021 10:48 AM
To: prince.yh.kuo
Cc: openbmc@lists.ozlabs.org
Subject: Re: [OpenBMC] - QEMU link seem like can't download



> On Jan 21, 2021, at 4:31 AM, prince.yh.kuo <prince.yh.kuo@aewin.com> =
wrote:
>=20
> Hi,
> I=E2=80=99m a beginner of OpenBMC and I found QEMU link seem like =
can=E2=80=99t download, is right?
> <image001.jpg>

Thanks for pointing this out. The build env changed recently and that =
resulted in
a different link for this tool.

I put a doc fix up at =
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/40033

New link for tool is =
https://jenkins.openbmc.org/job/latest-qemu-x86/lastSuccessfulBuild/artif=
act/qemu/build/qemu-system-arm=20

> Regards,
> Prince
> =20
> =E9=83=AD=E8=82=B2=E5=AE=8F(Prince Kuo)
> =
=E5=85=B6=E9=99=BD=E7=A7=91=E6=8A=80=E8=82=A1=E4=BB=BD=E6=9C=89=E9=99=90=E5=
=85=AC=E5=8F=B8
> AEWIN Technology Co.,Ltd
> =
=E6=96=B0=E5=8C=97=E5=B8=82=E6=B1=90=E6=AD=A2=E5=8D=80=E5=A4=A7=E5=90=8C=E8=
=B7=AF=E4=BA=8C=E6=AE=B5133=E8=99=9F9=E6=A8=93
> 9F., No.133, Sec. 2, Datung Rd., Xizhi Dist., New Taipei City 22101, =
Taiwan
> Email : prince.yh.kuo@aewin.com.tw
> TEL : +886-2-8692-6677 ext 9307
> FAX : +886-2-8692-6655

