Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8700F403EDE
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 20:09:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4VX02nYlz2yJl
	for <lists+openbmc@lfdr.de>; Thu,  9 Sep 2021 04:09:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cyEb+/8S;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cyEb+/8S; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4VWV1nKZz2xvN
 for <openbmc@lists.ozlabs.org>; Thu,  9 Sep 2021 04:08:53 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 188I3Ti7075543; Wed, 8 Sep 2021 14:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-transfer-encoding : content-type :
 mime-version : references : subject; s=pp1;
 bh=iqVpuBtbluPILGTSBsLjd4FyeMnWUfgZ84HLd7yGTtA=;
 b=cyEb+/8S7Rqb0JWXkoXctYE19KyZOXbDucYnVDEH/l2J4koYmGfA3a6wzm+FFaXJC+ON
 RAxo5VKuICWRIQg2FtZiWHWdQIKPoiVoGF89Bdh/ia3M9YoitFL9U7fEQ8Jo4FaT/Sl4
 lbAEiJ14pkBnUv61IGKpRVaWW44BBFt+G9JoT+iYMWy9H6mDcuJ+c5cV1JwzjLfy+PJn
 xPjBA2MXNeeCK38uBdYSDijdpd5LnqkwWecMIR6e8+VdCwXBsSSXMjzzusAkL4gYFk93
 5nQrln9/qjJ5jsIc/T/5wH/s2vfLxhhwc36dtpkDovTHVVFdhQNGEsIn+4fSJadGS8rU ZQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3axxm36vf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 14:08:46 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 188I8111029002;
 Wed, 8 Sep 2021 18:08:45 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 3axcnj8gp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 18:08:45 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 188I8hNH44040656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Sep 2021 18:08:43 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E50C7805F;
 Wed,  8 Sep 2021 18:08:43 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85C4D7805C;
 Wed,  8 Sep 2021 18:08:43 +0000 (GMT)
Received: from mww0332.dal12m.mail.ibm.com (unknown [9.208.69.80])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  8 Sep 2021 18:08:43 +0000 (GMT)
In-Reply-To: <DM6PR11MB4410B4A178CF1DC94978349894D49@DM6PR11MB4410.namprd11.prod.outlook.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "Ren, Zhikui" <zhikui.ren@intel.com>
Date: Wed, 8 Sep 2021 18:08:41 +0000
Message-ID: <OFB24DE87E.E2015B33-ON0025874A.0062F370-0025874A.0063AC5E@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <DM6PR11MB4410B4A178CF1DC94978349894D49@DM6PR11MB4410.namprd11.prod.outlook.com>,
 <DM6PR11MB4410B40F9D7DC46B72B0C87594CE9@DM6PR11MB4410.namprd11.prod.outlook.com>
 <YTFJHVW+bYoa1vIT@heinlein>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF97   July 2, 2021
X-MIMETrack: Serialize by http on MWW0332/03/M/IBM at 09/08/2021 18:08:41,
 Serialize complete at 09/08/2021 18:08:41
X-Disclaimed: 27247
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: I5SYzYxB-NdicaptDo1QlF-xTGS-V6oU
X-Proofpoint-ORIG-GUID: I5SYzYxB-NdicaptDo1QlF-xTGS-V6oU
Subject: RE: beep code manager  for openbmc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-08_06:2021-09-07,
 2021-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 phishscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109080113
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

Ren, Zhikuui wrote:
>Patrick Williams wrote:>>On Thu, Sep 02, 2021 at 08:15:21PM +0000, Ren, Zh=
ikui wrote:
>>> Hi All,
>>>
>>> Beepcode manager is a stand-alone beep code service should be
>created to
>>manage the beeper hardware, and provide D-Bus methods to expose the
>>beeper function globally, all other services can use the beeper
>hardware by
>>calling the beep methods.
>>>
>>> This package has been included in our distribution. Now we would
>like  to
>>upstream it and make it available to the community.
>>>
>>>
>>> Since it is now a very light service that only have one source
>file and a service
>>file. I am wondering whether this service can go to an existing
>repository.
>>> If not, we would like to request a new repository for it.
>>>

My thought is perhaps with our progress code logging and 7-segment=20
post code display in phosphor-host-postd ?

I could see several of the events mentioned be triggered by writing=20
a post code, and there are already a few separate programs in that=20
repository, one to record codes and one to display on some 7-segment=20
led hardware.  The phosphor-post-code-manager which records the=20
history is in its own repository (before the desire to combine them).

I'm certianally open to other suggestions just thought I'd plant a=20
seed for discussion.

>>> Thanks,>>> Zhikui
>>>

[various other discussions on interfaces , making the beep codes=20
configurable , etc]

>[Ren, Zhikui] To summarize, I think the following steps can be taken:>1. F=
ind an existing home or create a new one for Beep code manager
>2. Upstream existing code as initial check in
>3. create phosphor-dbus-interfaces for it=20
>4. update to use phosphor-dbus-interface
>5. further improvements including the two discussed above
>
>Any comments/feedback?=20
>
>Thanks,
>Zhikui

milton


