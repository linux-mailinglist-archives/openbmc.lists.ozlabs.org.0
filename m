Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0EE49581
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 00:58:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SRTV5gPHzDqHb
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 08:58:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SRT30PGlzDqHb;
 Tue, 18 Jun 2019 08:58:14 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5HMuawZ076897; Mon, 17 Jun 2019 18:58:07 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t6gnxxmuf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jun 2019 18:58:06 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5HMt7Ic028678;
 Mon, 17 Jun 2019 22:58:06 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 2t4ra62yq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jun 2019 22:58:06 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5HMw5Q637748996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 22:58:05 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BDBAAE063;
 Mon, 17 Jun 2019 22:58:05 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FBC2AE060;
 Mon, 17 Jun 2019 22:58:04 +0000 (GMT)
Received: from birb.localdomain (unknown [9.102.42.215])
 by b01ledav005.gho.pok.ibm.com (Postfix) with SMTP;
 Mon, 17 Jun 2019 22:58:04 +0000 (GMT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id A07DA4EC6EE; Tue, 18 Jun 2019 08:58:02 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: Adriana Kobylak <anoo@linux.ibm.com>, Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Move away from default password
In-Reply-To: <67d4cc41211749ef9ff888a31d9e8615@linux.vnet.ibm.com>
References: <1164a9a82b2b59087059c59391e65d04@linux.vnet.ibm.com>
 <1ec23c9c-6fd1-1a37-150e-6ac7c950cc0d@linux.intel.com>
 <67d4cc41211749ef9ff888a31d9e8615@linux.vnet.ibm.com>
Date: Tue, 18 Jun 2019 08:58:02 +1000
Message-ID: <871rzr6cqt.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906170198
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 Openbmc <openbmc@lists.ozlabs.org>, "Thomaiyar, Richard
 Marian" <richard.marian.thomaiyar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adriana Kobylak <anoo@linux.ibm.com> writes:
>>> 1. Unique password per BMC.
>>> In this approach, there is a way to change the factory default=20
>>> password. =C2=A0Example flow: assemble the BMC, test it, factory reset,=
=20
>>> generate unique password (such as `pwgen`), then use a new function=20
>>> =E2=80=9Csave factory default settings=E2=80=9D which would save the cu=
rrent=20
>>> setting into a new =E2=80=9Cfactory settings=E2=80=9D flash partition. =
After that,=20
>>> a factory reset would reset to the factory installed password, not to=20
>>> the setting in the source code.
>
> How would this new "factory settings" flash partition be protected=20
> against being modified by an unauthorized or malicious user?

My guess would be it'd be protected the same way that the default
password is today: not at all. If an attacker can write to flash, the
only way to reset the box is to dediprog the BMC flash chip.

--=20
Stewart Smith
OPAL Architect, IBM.
