Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B265E5AE8
	for <lists+openbmc@lfdr.de>; Thu, 22 Sep 2022 07:45:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MY44n6xgnz3c46
	for <lists+openbmc@lfdr.de>; Thu, 22 Sep 2022 15:45:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=iBTDyitG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.19.142; helo=fllv0016.ext.ti.com; envelope-from=spatton@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=iBTDyitG;
	dkim-atps=neutral
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MY44K1BnQz2yRV
	for <openbmc@lists.ozlabs.org>; Thu, 22 Sep 2022 15:45:03 +1000 (AEST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28M5ignw007099;
	Thu, 22 Sep 2022 00:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1663825482;
	bh=v7SuJ2ixPmaxGvAQPT7mFFRU2UmOcjE0knBpdpMuxVY=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=iBTDyitGyXWnRH5iDNRyISSoTzK61PpxS2Nls9E2wAcHezitY56VKs3Vx1Xg1rFHd
	 fJhZAYr/77qfQaf1fWB57FVn557waAalMzLwFVGfrV5CAbQrGN8oKsRHWvZenP63et
	 r0Gz8UvDejCPO32myT7ktuvs1DOdpA5fQIVqdCLk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28M5ifA6026335
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Sep 2022 00:44:41 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 22
 Sep 2022 00:44:41 -0500
Received: from DLEE102.ent.ti.com ([fe80::2cde:e57d:8075:c010]) by
 DLEE102.ent.ti.com ([fe80::2cde:e57d:8075:c010%17]) with mapi id
 15.01.2507.006; Thu, 22 Sep 2022 00:44:41 -0500
From: "Patton, Schuyler" <spatton@ti.com>
To: Andrew Jeffery <andrew@aj.id.au>,
        "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: RE: [EXTERNAL] Re: new port seeing ipmid exiting with seg fault
Thread-Topic: [EXTERNAL] Re: new port seeing ipmid exiting with seg fault
Thread-Index: Adi7uig+46mXlu/cTLeuedYC8FAEiAAg+26ABIEjAyA=
Date: Thu, 22 Sep 2022 05:44:41 +0000
Message-ID: <8ce9679e73c147f1a220083c6ac7c9cf@ti.com>
References: <66a2cce533124f56b60f68f9f0b807af@ti.com>
 <317d91c1-870a-4370-8ce4-12fc1a531486@www.fastmail.com>
In-Reply-To: <317d91c1-870a-4370-8ce4-12fc1a531486@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.33.123]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Hi Andrew and all,

I have used remote gdb to debug the cause of the seg faults for phosphor-ho=
st-ipmid to this structure (MetaPassStruct in user_channel/passwd_mgr.cpp).=
 This structure appears to initialized correctly, extremely large values. I=
 notice that a commit (05703ad - Anton Blanchard, I am using a 64 bit machi=
ne) was made to change structure elements of the MetaPassStruct and the com=
mit message mentioned this would fix seg faults. I added a bbappends that p=
ulls in the ipmid current top of tree of a23af1 and this included 05703ad c=
ommit but the ipmid now fails before getting to the passwdmgr that was seg =
faulting earlier.=20

Apologies as I am new to OpenBMC but I was looking for guidance on which ip=
mid commit I should use beyond the bfd3a17 commit that seg faults.

Regards,
Schuyler

-----Original Message-----
From: Andrew Jeffery <andrew@aj.id.au>=20
Sent: Monday, August 29, 2022 9:00 PM
To: Patton, Schuyler <spatton@ti.com>; openbmc@lists.ozlabs.org
Subject: [EXTERNAL] Re: new port seeing ipmid exiting with seg fault

Hi Schuyler,

On Tue, 30 Aug 2022, at 00:45, Patton, Schuyler wrote:
> Hi all,
>
> In our port the ipmid is exiting with a seg fault.  Does anyone have=20
> any suggestions on what to look at or what the problem might be? I=20
> have included some info I collected from systemctl and journalctl.=20
> Thanks in advance for any pointers, suggestions.

You might find some useful tricks for debugging the segfault in my blog pos=
t here:

https://amboar.github.io/notes/2022/01/13/openbmc-development-workflow.html

Broadly, the idea is to get gdb hooked up to debug either the process or th=
e core dump. If you can extract the core dump from the system then you can =
use the bbdbg script in concert with your local OpenBMC build tree to gener=
ate a rootfs context to debug the core using gdb-multiarch. The other way t=
o go is to get gdbserver onto the BMC and then use remote gdb (again using =
e.g. bbdbg to generate the context in which gdb runs).

Hope that helps,

Andrew
