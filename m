Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA22319259D
	for <lists+openbmc@lfdr.de>; Wed, 25 Mar 2020 11:32:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nPZk53WMzDqjv
	for <lists+openbmc@lfdr.de>; Wed, 25 Mar 2020 21:32:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=aHp2r9oR; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nPZ42kbgzDqQR
 for <openbmc@lists.ozlabs.org>; Wed, 25 Mar 2020 21:32:09 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id E513441209
 for <openbmc@lists.ozlabs.org>; Wed, 25 Mar 2020 10:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 mime-version:content-transfer-encoding:content-type:content-type
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mta-01; t=1585132322; x=
 1586946723; bh=nOXWxjfojL1aRlFSI5q6O5oRgKRqtJMZQbxVxwotZCQ=; b=a
 Hp2r9oRw3G6XHwAnKreGfN5g3tgGVDXouDsouWXrqDMmeiHtqGceL0+cgnogWPId
 nKqG6lQjlPCnhgscLhGZlR53EQ3wYl6vdyy2jeowoqUa/Vz5KlnWBr7g27XPU511
 c9vi/V+XcnO881/9oi4vwcHF3o1rLudr0Lr48vaIsk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nYQ_vavsAFxt for <openbmc@lists.ozlabs.org>;
 Wed, 25 Mar 2020 13:32:02 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (t-exch-01.corp.yadro.com
 [172.17.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 03E0A411FC
 for <openbmc@lists.ozlabs.org>; Wed, 25 Mar 2020 13:32:02 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (172.17.10.102) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 25 Mar 2020 13:32:02 +0300
Received: from T-EXCH-02.corp.yadro.com ([fe80::dc05:58eb:7d02:5cde]) by
 T-EXCH-02.corp.yadro.com ([fe80::dc05:58eb:7d02:5cde%14]) with mapi id
 15.01.0669.032; Wed, 25 Mar 2020 13:32:02 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Fwd: Which repo is more stable, feature complete, most
 functionality? https://github.com/openbmc/openbmc or
 https://github.com/Intel-BMC/openbmc
Thread-Topic: Fwd: Which repo is more stable, feature complete, most
 functionality? https://github.com/openbmc/openbmc or
 https://github.com/Intel-BMC/openbmc
Thread-Index: AdXMzLm+yefvKybER6mmRI5lr0TYXA1O1ElEABc6nIAACtBuFw==
Date: Wed, 25 Mar 2020 10:32:02 +0000
Message-ID: <1d2f080689bc4e4f839c95717f24377e@yadro.com>
References: <8117ef0c5f9a4c599ebe1d53aae209b3@SCL-EXCHMB-13.phoenix.com>
 <CADy_Pt3xOgPXungY+nwpYjFVcvCqMek_gHLeFWXOUoSjLom3RQ@mail.gmail.com>
 <CADy_Pt2mZ8E4EgY0y3wRSLh080cBBmoERgJvR7Lk8Rj4ep39-w@mail.gmail.com>,
 <b00d43e6-b296-a5a1-3c20-50f40bdfafd9@yadro.com>
In-Reply-To: <b00d43e6-b296-a5a1-3c20-50f40bdfafd9@yadro.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [172.17.1.114]
Content-Type: text/plain; charset="koi8-r"
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

And by the way, the intel-bmc/openbmc does not build at the latest revision=
 (commit 200ec68a685a48314076d82eb9af215ce256a02f).
The recipe for the phosphor-webui has a reference to a non existent revisio=
n in the intel-bmc/phosphor-webui repository.
________________________________________
=EF=D4: openbmc <openbmc-bounces+a.filippov=3Dyadro.com@lists.ozlabs.org> =
=CF=D4 =C9=CD=C5=CE=C9 Alexander Amelkin <a.amelkin@yadro.com>
=EF=D4=D0=D2=C1=D7=CC=C5=CE=CF: 25 =CD=C1=D2=D4=C1 2020 =C7. 11:19:29
=EB=CF=CD=D5: openbmc@lists.ozlabs.org
=F4=C5=CD=C1: Re: Fwd: Which repo is more stable, feature complete, most fu=
nctionality? https://github.com/openbmc/openbmc or https://github.com/Intel=
-BMC/openbmc

James, I have to disagree.

The last time I tried (Mar 12, commit 276f647402), the openbmc/openbmc repo=
 was still unable to control power of the host system on Wolfpass. That is =
why we're still using Intel-BMC/openbmc for our wolfpass-based board in dev=
elopment.

On the other hand, the Intel-BMC/openbmc repo lacks virtual media support.

We would love to use the main openbmc/openbmc for our x86 board but so far =
it just doesn't work.

Alexander.

24.03.2020 21:11, James Mihm =D0=C9=DB=C5=D4:
I meant to include the mailing list on my response.

James.

---------- Forwarded message ---------
From: James Mihm <james.mihm@gmail.com<mailto:james.mihm@gmail.com>>
Date: Mon, Mar 9, 2020 at 7:11 PM
Subject: Re: Which repo is more stable, feature complete, most functionalit=
y? https://github.com/openbmc/openbmc or https://github.com/Intel-BMC/openb=
mc
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com<mailto:Bruce_Mitchell@phoeni=
x.com>>


Bruce,

The Intel-BMC/openbmc repo is where we (i.e., Intel) pushes our internal fo=
rk externally while in the process of upstreaming. The intent for this repo=
 is for it to be functional on an Intel development platform (e.g., Wolfpas=
s) at all times while upstreaming changes to the openbmc/openbmc repo. The =
long term goal is for Intel to be pushing all development upstream to the o=
penbmc/openbmc repo, and using the Intel-BMC repository for sharing future =
capabilities that are not yet publically announced. Where our goal is to pu=
sh our internal development fork to the Intel-BMC/openbmc repo every two we=
eks.

Two exceptions for upstreaming are the webui and linux kernel patches. Upst=
reaming the linux kernel patches is challenging and some of the patches may=
 never make it upstream. With the migration of the webui to vue.js there's =
not much point in upstreaming the Intel fork of phosphor-webui.

My answer to your question is to use the openbmc/openbmc repository, but no=
t for controlling your car brakes.

James.



On Thu, Jan 16, 2020 at 4:27 PM Bruce Mitchell <Bruce_Mitchell@phoenix.com<=
mailto:Bruce_Mitchell@phoenix.com>> wrote:
Which repo is more stable, feature complete, most functionality?  https://g=
ithub.com/openbmc/openbmc or https://github.com/Intel-BMC/openbmc

While the WebUI for https://github.com/Intel-BMC/openbmc may look better,
presently its functionality for BMC operation seems intermittent compared t=
o the functionality of https://github.com/openbmc/openbmc.
I am referring to basic things such as displaying the BMC's Firmware Versio=
n, the lack of displaying any NIC for Network Settings, the "hang" for Heal=
th Hardware Status.

This is not a request about ahead or behind; I am asking about stable, feat=
ure complete, most functionality.

Using a metaphor here; if you had to select today one of the 2 for controll=
ing your car's breaks which would it be?

Thank you.

