Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79244169E47
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 07:11:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48QsCc367KzDqTb
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 17:11:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Qs8L3tylzDqTX
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 17:09:06 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01O68Fg5089752
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 01:09:03 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yb008vd4d-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 01:09:03 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Mon, 24 Feb 2020 06:09:00 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 24 Feb 2020 06:08:59 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01O68wpD47513844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 06:08:58 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C616AE053;
 Mon, 24 Feb 2020 06:08:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88ABDAE04D;
 Mon, 24 Feb 2020 06:08:57 +0000 (GMT)
Received: from [9.109.160.230] (unknown [9.109.160.230])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 24 Feb 2020 06:08:57 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Request for Feedback :: Time Mode setting in timemanager
From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
In-Reply-To: <20200220163326.GC41328@patrickw3-mbp.dhcp.thefacebook.com>
Date: Mon, 24 Feb 2020 11:38:56 +0530
Content-Transfer-Encoding: quoted-printable
References: <68732B2D-EB7D-418A-86D9-3095223A31FB@linux.vnet.ibm.com>
 <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
 <20200218202507.GA2219@patrickw3-mbp.lan.stwcx.xyz>
 <329B2251-4BA2-425F-A8E1-886C4E2F686F@fuzziesquirrel.com>
 <20200218215128.GF2219@patrickw3-mbp.lan.stwcx.xyz>
 <B09077F7-2752-4C7C-B005-38B00C6DD428@linux.vnet.ibm.com>
 <20200220163326.GC41328@patrickw3-mbp.dhcp.thefacebook.com>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-TM-AS-GCONF: 00
x-cbid: 20022406-0008-0000-0000-00000355CFE0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022406-0009-0000-0000-00004A76E716
Message-Id: <9B609C37-44FE-4636-BFFE-76BB48DAEB10@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-24_01:2020-02-21,
 2020-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxlogscore=698 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240052
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

On deferring consuming the updates to Manual/NTP settings, so far, some =
of the customers have expressed dislike for this design. We don=E2=80=99t =
have this design in the traditional systems. What we have tho is that we =
don=E2=80=99t allow setting the time on BMC when the system power is on. =
 In a way, that behavior kind of matches with deferring the updates to =
Manual / NTP when the system power is on with the BMC based systems.

We are having this discussion internally. This mail was to see what the =
community feels about those settings.

Proposal for now is to:  *Remove the support for TimeOwner*. It will be =
as good as BOTH

Once I have some concrete data from the internal discussion, I will come =
back on the Manual/NTP settings.

Thanks,
!! Vishwa !!

> On 20-Feb-2020, at 10:03 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Wed, Feb 19, 2020 at 12:07:06PM +0530, Vishwanatha Subbanna wrote:
>> Thanks for the good discussion on this.
>>=20
>> Patrick, I see you mentioned the TimeOwner in your response. =
TimeOwner was
>> another thing that was disliked by the users and I had sent an email =
couple
>> months ago asking if anyone still needs it. I did not see anyone =
saying they
>> need. I then proposed removing TimeOwner feature.
>>=20
>> So, if we want to make it simpler, we would want to:
>>=20
>> - Remove TimeOwner concept
>> - Remove the deferred updates to Manual / NTP settings.
>>=20
>> Please let me know if you see anything that might be affected by this =
?.
>=20
> I tried to provide history as best as I recollect, mostly to be =
helpful.
>=20
> As I've mentioned elsewhere in this thread, Facebook servers use a
> Host-owned RTC.  Unless someone can speak to non-Power servers that =
have
> a BMC-owned RTC, this might only affect IBM(*).  You'll need to decide =
what
> impact removing this feature may have to you and your customers.
>=20
> If you'd like to put together a proposal and seek feedback on what the
> potential side effects for specific customer classes might be, I can
> certainly do that, but right now I don't really have enough =
information
> on what the "new" design would be just from those two bullets.
>=20
> (*) - And OpenPower.
> --=20
> Patrick Williams

