Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF961BA16B
	for <lists+openbmc@lfdr.de>; Mon, 27 Apr 2020 12:35:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499h4M3mswzDqf4
	for <lists+openbmc@lfdr.de>; Mon, 27 Apr 2020 20:35:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 499h3Y3kqNzDqM9
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 20:34:28 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03RAXYfr016612
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 06:34:27 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mfhcss23-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 06:34:26 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Mon, 27 Apr 2020 11:33:29 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 27 Apr 2020 11:33:27 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03RAYLfm61341752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Apr 2020 10:34:21 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4753852050;
 Mon, 27 Apr 2020 10:34:21 +0000 (GMT)
Received: from [9.102.1.95] (unknown [9.102.1.95])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 394415204F;
 Mon, 27 Apr 2020 10:34:20 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Request for Feedback :: Time Mode setting in timemanager
From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
In-Reply-To: <20200225022358.GH67957@patrickw3-mbp.dhcp.thefacebook.com>
Date: Mon, 27 Apr 2020 16:04:18 +0530
Content-Transfer-Encoding: quoted-printable
References: <68732B2D-EB7D-418A-86D9-3095223A31FB@linux.vnet.ibm.com>
 <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
 <20200218202507.GA2219@patrickw3-mbp.lan.stwcx.xyz>
 <329B2251-4BA2-425F-A8E1-886C4E2F686F@fuzziesquirrel.com>
 <20200218215128.GF2219@patrickw3-mbp.lan.stwcx.xyz>
 <B09077F7-2752-4C7C-B005-38B00C6DD428@linux.vnet.ibm.com>
 <20200220163326.GC41328@patrickw3-mbp.dhcp.thefacebook.com>
 <9B609C37-44FE-4636-BFFE-76BB48DAEB10@linux.vnet.ibm.com>
 <20200224203636.GF67957@patrickw3-mbp.dhcp.thefacebook.com>
 <CAARXrtnVf8cccGk29Xgk7V=LvX+ocnrn1jgQHwDT97xGkKO9vA@mail.gmail.com>
 <20200225022358.GH67957@patrickw3-mbp.dhcp.thefacebook.com>
To: Patrick Williams <patrick@stwcx.xyz>, liuxiwei@inspur.com
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
x-cbid: 20042710-0016-0000-0000-0000030B53CE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042710-0017-0000-0000-0000336F81D4
Message-Id: <F244EE72-6639-4FF3-B80C-AF4F4B23D046@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_05:2020-04-24,
 2020-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=306
 malwarescore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004270095
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

Further to the proposal I made to the community about removing TimeOwner =
feature, George Liu ( Thank you ) has put up a commit to :

- Remove TimeOwner feature :                          =
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-time-manager/+/312=
78/
- Consume changes to NTP/MANUAL settings immediately: =
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-time-manager/+/312=
84/

We have had many discussions with needed people here in IBM and we agree =
to the proposal.=20

With that said: Both IPMI and PLDM will now use =
"/xyz/openbmc_project/time/bmc=E2=80=9D as part of SetTime/GetTime =
instead of =E2=80=9C/xyz/openbmc_project/time/host=E2=80=9D

Thank you all for contributing into this discussion.

!! Vishwa !!

> On 25-Feb-2020, at 7:53 AM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Tue, Feb 25, 2020 at 10:01:21AM +0800, Lei YU wrote:
>> On Tue, Feb 25, 2020 at 4:37 AM Patrick Williams <patrick@stwcx.xyz> =
wrote:
>>>=20
>>> On Mon, Feb 24, 2020 at 11:38:56AM +0530, Vishwanatha Subbanna =
wrote:
>>>> Proposal for now is to:  *Remove the support for TimeOwner*. It =
will be as good as BOTH
>>>=20
>>> "TimeOwner =3D BOTH" today creates two virtual clocks from the =
physical
>>> RTC by implementing the Host clock as an offset from the BMC clock,
>>> doesn't it?  Is that going to continue to be the functionality with =
your
>>> proposal or are you reverting back to a single physical clock where =
both
>>> Host and BMC can update?
>>=20
>> "TimeOnwer =3D BOTH" does not creates two virtual clocks, "TimeOwner =
=3D
>> Split" does.
>> "BOTH" effectively enables both BMC and the Host to set the "single" =
clock.
>=20
> Got it, my mistake.
>=20
> --=20
> Patrick Williams

