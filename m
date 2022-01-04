Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A28D248488D
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 20:29:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT2jv4TGFz2xsj
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 06:29:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fQ+Zyf/Q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fQ+Zyf/Q; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT2jS6jf7z2xBT
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 06:29:00 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 204Hwbpo030954
 for <openbmc@lists.ozlabs.org>; Tue, 4 Jan 2022 19:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DSmhEgez+7HxcLeardQa3uRv3EQ5gfEerTtD5mHDgLY=;
 b=fQ+Zyf/QYD5A1PZ8OKxzFh7MMWrmz2MNCz3NRQEQ2MIoYZAYkHAurnZ+k5yf/Tn3AeRg
 r7Bmak4ij6vHfCK2ihKMqRw8lx96P2qCJEd0t8D8nzTtgTdSxVjhQye/xorHCTZ3mbzt
 Gm41romM2yNNpREOR3Fx3hZXuyhEZhJQLFQj1Yb24hooeyo3NJ4RjYwkYLHZl6ziCgUh
 aGLmIIXJAgR1ytctWhq9Y7a/iqh5BsfmmpzI24VYhL6hNa88fRZuKQB4HNK6VlKxnW2j
 0lW2Ye/it36jejS34oqfhla/5PKeoM7qJ4ap22OWma6lmO9Q71n4VqQb0L8ygc/1yr51 ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcp2qg3b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 04 Jan 2022 19:28:57 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 204JRmjs024660
 for <openbmc@lists.ozlabs.org>; Tue, 4 Jan 2022 19:28:57 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcp2qg3ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 19:28:57 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 204JSfYA009659;
 Tue, 4 Jan 2022 19:28:56 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 3daekahc1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 19:28:56 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 204JStI429032754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 19:28:55 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9AF1AE05C;
 Tue,  4 Jan 2022 19:28:55 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8B28AE063;
 Tue,  4 Jan 2022 19:28:55 +0000 (GMT)
Received: from [9.160.61.42] (unknown [9.160.61.42])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 Jan 2022 19:28:55 +0000 (GMT)
Message-ID: <c60f01b8-a200-3dd5-56dc-9a327e1e4bc0@linux.ibm.com>
Date: Tue, 4 Jan 2022 13:28:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [obmc]: sometime, the method of GetObject in phosphor-objmgr
 cannot get path or object
Content-Language: en-US
To: www <ouyangxuan10@163.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <63f93b08.79d.17dea0b1142.Coremail.ouyangxuan10@163.com>
From: Matt Spinler <mspinler@linux.ibm.com>
In-Reply-To: <63f93b08.79d.17dea0b1142.Coremail.ouyangxuan10@163.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zbw79SFRMXcjAUUlhvh72Eec0hKJtAnI
X-Proofpoint-ORIG-GUID: WQBH4NPA51EMpl6LhBwNyHjcjlyu-QnL
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_09,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040126
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



On 12/23/2021 7:25 PM, www wrote:
> Dear All, Sometimes the GetObject method in phosphor-objmgr fails to=20
> obtain path or object. Does anyone know why? How to solve it? Services=20
> and objects exist. thanks=EF=BC=8C Byron =E2=80=8D =E2=80=8D =E2=80=8D =
=E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=
=8D =E2=80=8D=20
> =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=
=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =
=E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D=20
> =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D=20
> Dear All,
>
> Sometimes the GetObject method in phosphor-objmgr fails to obtain path=20
> or object.=C2=A0Does anyone know why? How to solve it?
>
> Services and objects exist.
>

I've never heard of any sort of mapper problems like this.=C2=A0 How often=
=20
does it happen?

If you were to restart that service, would the mapper then see it? Can=20
you tell from the journal if that service starts before or after the=20
mapper service (not that it should matter of course)?


> thanks=EF=BC=8C
> Byron
>
>
>
>

