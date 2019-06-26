Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BBE574D1
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 01:16:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YzSR1RxbzDqbp
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 09:16:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YzRr5xnQzDqT4
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2019 09:16:23 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5QNCO87090761
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 19:16:21 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tch9jstjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 19:16:21 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 26 Jun 2019 23:16:20 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 26 Jun 2019 23:16:17 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2019062623161683-1059210 ;
 Wed, 26 Jun 2019 23:16:16 +0000 
In-Reply-To: <CAARXrtmqkYeHiE9rr4uYL_b3YtK=-hsnmR3DJtdy1_ZVLKWtUQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.1] fsi: core: Fix NULL dereference issue
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Lei YU <mine260309@gmail.com>
Date: Wed, 26 Jun 2019 23:16:16 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CAARXrtmqkYeHiE9rr4uYL_b3YtK=-hsnmR3DJtdy1_ZVLKWtUQ@mail.gmail.com>,
 <20190614071643.18607-1-mine260309@gmail.com>
 <b75c57a9f3ac3c6e91c470d69dcd2ab6a4f6ee03.camel@ozlabs.org>
X-Mailer: IBM iNotes ($HaikuForm 1054) | IBM Domino Build
 SCN1812108_20180501T0841_FP55 May 22, 2019 at 11:09
X-LLNOutbound: False
X-Disclaimed: 44027
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19062623-1799-0000-0000-00000C051FD6
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.425523; ST=0; TS=0; UL=0; ISC=; MB=0.153174
X-IBM-SpamModules-Versions: BY=3.00011337; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01223741; UDB=6.00644023; IPR=6.01004920; 
 BA=6.00006343; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00027482; XFM=3.00000015;
 UTC=2019-06-26 23:16:19
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-06-26 20:09:28 - 6.00010095
x-cbparentid: 19062623-1800-0000-0000-00000007269E
Message-Id: <OF9F6022F6.01453507-ON00258425.007CA75A-00258425.007FD53F@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-26_13:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 06/26/2019 around 02:39AM in some timezone, Lei YU wrote:

>On Wed, Jun 26, 2019 at 9:33 AM Jeremy Kerr <jk@ozlabs.org> wrote:
>>
>> Hi Lei,
>>
>> > The failure case in fsi=5Fslave=5Finit() is wrong and could cause
>NULL
>> > dereference issue.
>> > E.g. on FP5280G2 machine, it could get failure in
>> > fsi=5Fslave=5Fset=5Fsmode(),
>> > and when it does fsi rescan, kernel crashes due to:
>> >
>> >     Unable to handle kernel NULL pointer dereference at virtual
>> > address 00000060
>> >
>> > The fix is to make it not calling kfree() but just goto err=5Ffree.
>> >
>> > However, in err=5Ffree, it calls put=5Fdevice() to free the device,
>it
>> > still
>> > cause issue during fsi rescan, that the device is used after
>freed.
>> >
>> >     WARNING: CPU: 0 PID: 1433 at lib/refcount.c:190
>> > refcount=5Fsub=5Fand=5Ftest=5Fchecked+0x94/0xac
>> >     refcount=5Ft: underflow; use-after-free.
>> >
>> > So the put=5Fdevice() is removed and "err=5Ffree" label is renamed to
>> > "fail".
>>
>> It looks like this will leak memory (through the struct fsi=5Fslave)
>that
>> has been kzalloc()ed. After device=5Fregister, we need to call
>> put=5Fdevice() to free the struct fsi=5Fslave, but there's no mechanism
>for
>> that to happen if we remove it from fsi=5Fslave=5Finit().
>
>The memory is "leaked" in this function, that the slave device is not
>freed
>here. But eventually, it will be freed in fsi=5Fslave=5Frelease() (if I
>understand
>the code correctly), so there is no leak, eventually.

This is definitely bad.  In other paths the struct device for the
fsi-slave might be kept beyond the lifetime of the fsi-master slave
device, which would lead to use after free.

Each kobject must have its own release method and be allocated via
a separate kmalloc.

>
>> The error paths for this function do need to be fixed, but I don't
>think
>> this is the right approach.
>>
>> Do you have a backtrace of the
>refcount=5Fsub=5Fand=5Ftest=5Fchecked+0x94/0xac
>> warning? This may not be the actual struct device that underflows.
>
>Yes, below is the full trace:

This is just one possibility.


BTW, there doesn't seem to be any MAINTAINERS entry for drivers/fsi

Milton

