Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7837B350440
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 18:15:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9WcL3Jrwz30Gt
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 03:14:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r8TcYEta;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=r8TcYEta; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9Wc65jghz2xfy
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 03:14:46 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12VG3tVr047208; Wed, 31 Mar 2021 12:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=yYiCgJXWmS/RqBvh6LPMG/KkN8iqZWF1hN1maLoG+Xw=;
 b=r8TcYEtal+B5Gkgw9xWZ7FeiUSY+2SC2Q8ywewevqcSkzhqCHg3T8WRkuewVBNIIvzpy
 YuYzLfZuecoz9Jd9vjmqate5zujeQfipwsJlt1xjsry7IcVG2W8hCrHUe7U5JM2eLaFi
 imyUwxjpvh78H2SjVU3vhEXFw2Wbq3X0Yj96QMIWTLvgJKefTe3YR1OVbD3yYtg0VMeF
 Hm2lteNDV9Yt6oyAjot5KVFitEZm55a9sa0ZgUGVfS7Y/K3fUKlX+gD4wvBLeaDXDsky
 mXqv9R1bMrSq0Zbi3EiFne5MLBhs64tGskuGBFm+u5ixogEHZv3pwnMKbbwuW+yiWc0x wg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37mn0nxhda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 12:14:43 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12VG26Vp000724;
 Wed, 31 Mar 2021 16:14:43 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 37mb3aysv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 16:14:42 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12VGEfkn27328876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 16:14:41 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A69116A054;
 Wed, 31 Mar 2021 16:14:41 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 456B86A066;
 Wed, 31 Mar 2021 16:14:41 +0000 (GMT)
Received: from demeter.local (unknown [9.160.114.226])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 31 Mar 2021 16:14:41 +0000 (GMT)
Subject: Re: The common solution to support bind/unbind the hwmon driver base
 on the host state.
To: Thu Nguyen OS <thu@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <7252DA19-35E9-4A14-A7DF-7BBC54A312C2@amperemail.onmicrosoft.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <12cb9e34-d110-1575-0b39-296083bd6410@linux.ibm.com>
Date: Wed, 31 Mar 2021 11:14:39 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <7252DA19-35E9-4A14-A7DF-7BBC54A312C2@amperemail.onmicrosoft.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: I6IOnTJg7qn-76VN36N7CGme0OfqA99p
X-Proofpoint-ORIG-GUID: I6IOnTJg7qn-76VN36N7CGme0OfqA99p
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-31_08:2021-03-31,
 2021-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310110
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

On 3/30/21 9:14 PM, Thu Nguyen OS wrote:
> Hi All, Currently, In Mtjade platform of Ampere, we have SMPro mdf=20
> drivers (SMPro hwmon, SMPro errmon, SMPro misc driver). The drivers=20
> will be loaded by kernel when the BMC boot up. But they are only=20
> binded when the host is already On. =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=
=8D=20
>
> Hi All,
>
> Currently, In Mtjade platform of Ampere, we have SMPro mdf drivers=20
> (SMPro hwmon, SMPro errmon, SMPro misc driver).
>
> The drivers will be loaded by kernel when the BMC boot up. But they=20
> are only binded when the host is already On.
>
> They are also unbinded when the host is Off.
>
> To support binding/unbinding the SMPro drivesr, we have one service=20
> name driver-binder.
>
>  1. When the Dbus property CurrentHostState of service
>     xyz.openbmc_project.State.Host changes to =E2=80=9Cnot Off=E2=80=9D, =
we will bind
>     the drivers.
>  2. When the Dbus property RequestedHostTransition of service
>     xyz.openbmc_project.State.Host OR Dbus property
>     RequestedPowerTransition of xyz.openbmc_project.State.Chassis
>
> change to Off, we will unbind the drivers.
>
> The driver-binder is working as expected, it have the configuration=20
> file to configure which drivers will be binded/unbinded.
>
> But that is our solution.
>
> Do we have any common solution to do that job?
>

Thu,

I don't have a solution.=C2=A0 But I do want to be able to bind and unbind=
=20
drivers for the BMC-attached USB ports (as the underlying mechanism when=20
the BMC admin disables the ports), so I think it would be good to have a=20
common solution or understand the best practices.

Joseph

> Regards.
>
> Thu Nguyen.
>

