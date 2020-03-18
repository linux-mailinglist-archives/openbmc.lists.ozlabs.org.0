Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C41189F76
	for <lists+openbmc@lfdr.de>; Wed, 18 Mar 2020 16:17:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jDDg2HhqzDqyc
	for <lists+openbmc@lfdr.de>; Thu, 19 Mar 2020 02:17:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jD954gBfzDqDc
 for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2020 02:14:32 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IF3Vv9023806
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 11:14:29 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yukx5n7e0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 11:14:29 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Wed, 18 Mar 2020 15:14:27 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Mar 2020 15:14:25 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02IFEOIV50462950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 15:14:24 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EFB011C079;
 Wed, 18 Mar 2020 15:14:24 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8BF311C076;
 Wed, 18 Mar 2020 15:14:23 +0000 (GMT)
Received: from [9.199.52.119] (unknown [9.199.52.119])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 18 Mar 2020 15:14:23 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: OpenBMC GUI: Date and time settings
From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
In-Reply-To: <CAH3qHna+U+VcKCKxgMkA0-JSBi0yaSzt_6uCZqLsnFZgumupXw@mail.gmail.com>
Date: Wed, 18 Mar 2020 20:44:21 +0530
Content-Transfer-Encoding: quoted-printable
References: <CAH3qHna+U+VcKCKxgMkA0-JSBi0yaSzt_6uCZqLsnFZgumupXw@mail.gmail.com>
To: Ryan Arnell <ryanarnellibm@gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-TM-AS-GCONF: 00
x-cbid: 20031815-0012-0000-0000-0000039341C2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031815-0013-0000-0000-000021D0248F
Message-Id: <64CAA2C9-5628-414C-BC95-D4E6970CA285@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_06:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003180070
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Ryan,

I looked at the prototype and it looks fine for most part. On the NTP, I =
see it makes =E2=80=9Ctime.google.com=E2=80=9D as mandatory ( since I =
could not edit ) and lets only the secondary to be editable. Is that =
intentional or just that I could not edit =E2=80=9Ctime.google=E2=80=9D =
?.

If it=E2=80=99s mandatory, then I would suggest we don=E2=80=99t make it =
so unless there is a reason.

Thanks,
!! Vishwa !!

> On 13-Mar-2020, at 3:58 AM, Ryan Arnell <ryanarnellibm@gmail.com> =
wrote:
>=20
> Hello all,
> Here are the UI design proposals for date and time on the 'Date and =
time setting' page under 'Configuration'.
>=20
> Users would interact with these designs when:
> - Checking the BMC=E2=80=99s current time
> - Correcting time drift
> - Adding an NTP server
>=20
> Prototype: =
https://ibm.invisionapp.com/share/Q6NZ13M3A5B#/319420720_01-Date-And-Time-=
Settings-02
> GitHub story: https://github.com/openbmc/webui-vue/issues/3
>=20
> As a reminder, these mockups are static images with clickable hotspots =
to indicate the intended path. You can also use your right and left =
arrows to navigate through the flow.
>=20
> To comment you can either:
> - Add comment within the Github story (preferred)
> - Click on the bottom-right of the Invision prototype and select =
comment
> Thanks in advance for your feedback!
>=20
> Ryan Arnell               =20
> UX Engineer | IBM Design | IBM Studios Austin

