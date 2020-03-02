Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0794A1759E8
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 13:00:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WJc04MSJzDqbl
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 23:00:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WJZx6ByPzDqbk
 for <openbmc@lists.ozlabs.org>; Mon,  2 Mar 2020 22:59:04 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 022Bnabw128780
 for <openbmc@lists.ozlabs.org>; Mon, 2 Mar 2020 06:59:01 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfmwv50kb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 02 Mar 2020 06:59:01 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Mon, 2 Mar 2020 11:58:58 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Mar 2020 11:58:56 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 022BwtD039911492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 11:58:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EA1511C04A;
 Mon,  2 Mar 2020 11:58:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3467311C050;
 Mon,  2 Mar 2020 11:58:54 +0000 (GMT)
Received: from [9.109.160.230] (unknown [9.109.160.230])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  2 Mar 2020 11:58:54 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: service for tracking user activity (phosphor-audit)
From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
In-Reply-To: <da51cb6767c7f1e9130204f6f9c4af0019552b5b.camel@yadro.com>
Date: Mon, 2 Mar 2020 17:28:52 +0530
Content-Transfer-Encoding: quoted-printable
References: <4efbcd540d3dd4bfb8021bdb6864326f72092852.camel@yadro.com>
 <da51cb6767c7f1e9130204f6f9c4af0019552b5b.camel@yadro.com>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-TM-AS-GCONF: 00
x-cbid: 20030211-0012-0000-0000-0000038C3863
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030211-0013-0000-0000-000021C8EB03
Message-Id: <99257ED6-F024-4BFB-A902-47615674CB02@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_03:2020-02-28,
 2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020091
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
Cc: gmills@us.ibm.com, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 geissonator@yahoo.com, joseph-reynolds@charter.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

My vote is to create a repo of its own. Also, I don=E2=80=99t see any =
issues with using Meson.

!! Vishwa !!

> On 28-Feb-2020, at 10:45 PM, Ivan Mikhaylov <i.mikhaylov@yadro.com> =
wrote:
>=20
> On Mon, 2019-08-26 at 15:31 +0300, Ivan Mikhaylov wrote:
>> hi all, There it is updated design proposal about audit service which =
provides
>> a
>> way to track user activity. Right now most parts are described there. =
If you
>> have any ideas or anything to add, feel free to share in this thread.
>>=20
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23870
>>=20
>>=20
>> thanks.
>>=20
>=20
> Thank you, everyone involved in the review process of this document! =
Just got
> back from the leave, and wanted to ask who should create the rep or =
which rep
> part it should belong to? I want to use the meson build system for =
this project,
> any problems with this decision? Also, any other tips or suggestions =
are
> welcome. I'll start working on it in next 1-2 weeks.
>=20
> Thanks.
>=20

