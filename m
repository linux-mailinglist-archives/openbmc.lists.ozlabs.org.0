Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F426A2F0C3
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2025 16:04:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ys7Bq4zfWz3cBd
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2025 02:04:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739199841;
	cv=none; b=XmpXYbcj4QPleZ8xMSeBqY/TsRasFsUy2XSNut0Q6HRn3bxjgJDFWRicJdti5Pf4YkiVbNrKj6ky5TzG5+ugKKeOBh+tiSYSOjsJcBBFzTnVsml+5cfnIixKxulZc+TaoiRM1gwwdEx6wdnaB6LQwrSk3F2SQQvnWsfRNBWgQaMhR4rQJQY5hiPJg6FkO+GWrIUtqrlxoxtZwlBa1ttDrJERm2U378AfazRDgdi9cTTyMy4jo4g4X/qCL7A/cbhTY1IfAuky/aIybJH1E+zwXDNR+aBgWLXvJ/izkgVuPU8CM/3oY6sZY0MhMcSoKm/PyHexF0J6wCJJDfot9GQYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739199841; c=relaxed/relaxed;
	bh=7At89YuxFTOley4AXXwgfBnmSSQ8thbmIyLlVkprUL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SU4xNYut7f7w7Gxdw9WIqHpTyuD0i+WfoHCG1DQrSEtyhZp9KktgLbKdhnCvicEwKlVpaYQkkZRWdrSDviwpzxNq/t3oKpAHwBMYPdhRsbKAA+Dr2aQORoamGF/ThOzbeehqVrecpa27FzErLKSnpQM/NZv4Sqcghp0NQztZsNcQTsUay5jgt9TWrgKRhEPrM01IS+fSC9dOrdDAXApUH/0WjW5WEFhkeeCvRLyA9MvaUM49Cu1BzD5eK93W6dcLCNO7yk0w+/KnBrqAdRylZ9ntx4fugEOlTF5ZCrcqCOE+lGuFsCWjAk5NLCIVeJXNyZqnRCO76SjAOIx4XNQh+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UkycC5qg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UkycC5qg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ys7Bm3dWHz2ygR
	for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2025 02:04:00 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A7XFJF021503;
	Mon, 10 Feb 2025 15:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7At89Y
	uxFTOley4AXXwgfBnmSSQ8thbmIyLlVkprUL8=; b=UkycC5qgx9NGadO3jhshDP
	fuBmd6UbshanQPirMKuYuh0mV9cVPdTNN9/zkRMe5016lrJiuF9B9l0ucjh9sQCy
	s5pGXdtlIBaXXlS64RkAlizh4ol0oNt2lsQzi05EPqlKWvJLNcnfaY3TC9ASSY/E
	ZHQPYurp4Q3/AvMChZE9iLmHGpQjLxgHjUFmE5Od87bsvhHtY6wJel3M3KNJtloE
	BPaBu6u/QQ0BBDHsICEv4o3c5OsW71Rqaq+lnS0SUmLz6q5WbH+yohaGzSrBrZc2
	uvZ7s4tfF+kXJkkGxObJtKawejx2AftPCT85irQ624UAEpUOMMGyiCGOPFgb5yEA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44qd5nt4yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 15:03:54 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51ACnp19011651;
	Mon, 10 Feb 2025 15:03:53 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44pktjpmsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 15:03:53 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51AF3qF627394680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 15:03:52 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C53125805C;
	Mon, 10 Feb 2025 15:03:52 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88B1D5805A;
	Mon, 10 Feb 2025 15:03:52 +0000 (GMT)
Received: from [9.61.252.177] (unknown [9.61.252.177])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Feb 2025 15:03:52 +0000 (GMT)
Message-ID: <53e23a54-8541-46cd-b806-52336e1edfe8@linux.ibm.com>
Date: Mon, 10 Feb 2025 09:03:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sensor reaction
To: =?UTF-8?B?SmVmZjkgQ2hhbijpmbPmnb7lhIlfQVNSb2NrUmFjayk=?=
 <Jeff9_Chan@asrockrack.com>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <63724d62d1584a278148cda09ae5001e@asrockrack.com>
Content-Language: en-US
From: Matt Spinler <mspinler@linux.ibm.com>
In-Reply-To: <63724d62d1584a278148cda09ae5001e@asrockrack.com>
X-TM-AS-GCONF: 00
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Vky4JlCAPbUcwp4l_kT2oPzh_E9QW5q4
X-Proofpoint-ORIG-GUID: Vky4JlCAPbUcwp4l_kT2oPzh_E9QW5q4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_08,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 phishscore=0 mlxscore=0 clxscore=1011 spamscore=0
 mlxlogscore=566 suspectscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100125
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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



On 2/10/2025 1:25 AM, Jeff9 Chan(=E9=99=B3=E6=9D=BE=E5=84=89_ASRockRack) wr=
ote:
> Hi all, With entity manager, dbus-sensors, we can have event log for=20
> sensor threshold, how to add more action for it? For example we should=20
> shutdown host if a leak sensor reached critical state, can we start=20
> another service according to sensor
>=20
>
> Hi all,
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 With entity manager, dbus-sens=
ors, we can have event log for=20
> sensor threshold, how to add more action for it? For example we should=20
> shutdown host if a leak sensor reached critical state, can we start=20
> another service according to sensor status? phosphor-dbus-monitor? Any=20
> better solution?
>

Hi,

https://github.com/openbmc/phosphor-fan-presence/tree/master/docs/sensor-mo=
nitor
will do shutdowns by looking for assertions on the SoftShutdown or=20
HardShutdown
threshold interfaces.

You're welcome to add anything else there.=C2=A0 In the past I've used=20
phosphor-dbus-monitor
to do things like that, though I've found it can be tough to debug when=20
it doesn't work.


> best regards
>
> **
>
> *Jeff Chan*
>
> *ASRock Inc. *
>
> *Tel: +886-2-55599600 ext.38670*
>

