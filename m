Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 177B131E7C9
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 10:16:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dh8Gl1J1Cz30Mn
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 20:16:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W9rL35Xt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=W9rL35Xt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dh8GV5Cvdz30KJ
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 20:16:33 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11I90dgw021127; Thu, 18 Feb 2021 04:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=78b9IowpIN80tBpf3BN7s1bLt0ujq7LTg4YpMlbLuiI=;
 b=W9rL35XtoLPmqN+hnLqMYZdeFYgiMsm6Q15MVC20MLI0s6NvJ9Z/nlHJBPhjCe1fDRu6
 YgkOMHAvpriWqn2/lonWkTGQDD4FmA5mutKFJy2t3TYsrOPlbjKbkKqAOndlOy1j38oF
 lrORIru9wpGyc7kN3tClTrWwQJqNxX7UAiPjoaQkI2f9p3xcWhjEDtzwa5f9oWfswkp3
 xxJNj0ue8YL5TOM89XR1dbB/DB8leMYP6oJiVJNQIpzHP0O69Y98rQmvvo9hNcZ/btpm
 n2OgtWtKwh0rrgdFms4vfMIRfLDTso0hkndH2p+6q8pQq3DrXJpyJ1rsiQ+70zI79wYF NA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36smxnh1vt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 04:16:29 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11I9Daf0024992;
 Thu, 18 Feb 2021 09:16:27 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 36p6d8jate-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 09:16:27 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11I9GP6m21299574
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Feb 2021 09:16:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DB23A4040;
 Thu, 18 Feb 2021 09:16:23 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65BE61304CC;
 Thu, 18 Feb 2021 08:58:13 +0000 (GMT)
Received: from [9.199.53.107] (unknown [9.199.53.107])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 18 Feb 2021 08:58:13 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: What is OpenBMC ?
From: vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
In-Reply-To: <177b3af96fa.eaf65e85615103.194541248329848746@maxvytech.com>
Date: Thu, 18 Feb 2021 14:25:48 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <9CE8D362-F1E1-4C37-8B01-A645D0C0CB4E@linux.vnet.ibm.com>
References: <177b3af96fa.eaf65e85615103.194541248329848746@maxvytech.com>
To: Daniel <sd2@maxvytech.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-18_03:2021-02-18,
 2021-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 mlxlogscore=783 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102180071
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Daniel,

Welcome.. Hopefully these links help. OpenBMC is a system management =
software layer that runs on BMC SoC.

=
https://www.servethehome.com/explaining-the-baseboard-management-controlle=
r-or-bmc-in-servers/
https://en.wikipedia.org/wiki/OpenBMC
https://github.com/openbmc/docs/tree/master/architecture

Thanks,
!! Vishwa !!


> On 18-Feb-2021, at 11:19 AM, Daniel <sd2@maxvytech.com> wrote:
>=20
> This Message Is =46rom an External Sender
> This message came from outside your organization.
> Hi,
>=20
> I am new to OpenBMC or even BMC concept. Since a project requirement =
has come related to this concept , i want to learn about this concept. I =
am an embedded software developer.
>=20
> Is OpenBMC an OS? somewhere i noticed that it will generate an image =
file to a target machine.
>=20
> What are the prerequisites that a target BMC should have?
>=20
> and please explain the following as well,
>=20
> *Can we install in an FPGA board? if yes, what is the hardware =
requirement to install this OpenBMC?
>=20
> *How redfish is used in OpenBMC?
>=20
> *I would like to get some clarification in this concept.
>=20
> *"Development board must support OpenBMC" what is the meaning of this =
statement?
>=20
>=20
>=20
> Thank you,
>=20
>=20
>=20
>=20
> Regards,
> Daniel Kirubakaran S
> Embedded SW Developer
> Maxvy Technologies Pvt Ltd
> Bangalore

