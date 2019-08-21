Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A7598101
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 19:09:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DDfD0PbnzDqll
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 03:09:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=148.163.137.20; helo=mx0b-00154904.pphosted.com;
 envelope-from=paul.vancil@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="J186Cu/s"; 
 dkim-atps=neutral
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DDdP1fk7zDqkL
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 03:08:22 +1000 (AEST)
Received: from pps.filterd (m0170398.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7LH4iCN002291
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 13:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=J0io9T/JeQAn3ARTfUFS03oOPzevgydwmoyzPkPgUlk=;
 b=J186Cu/sZpNAMaypYOB9x/1Qq3ae5WutFeal7uHK3+FT1NNzGQYjI1x/v7bG90UcTwUj
 yCDxY/A8l2pNNmYqT2rduW0GMcFHBqTW2hba+f4ebo1gw+TfYGYYrRwcEWa+iBIaEI0Q
 /pU3syOGw8+3eBkNd3g4BIMuZvNBUbFdaZLnA42tLYZqpris/YhYOvtoHQkspcLHMY28
 2dj55W+DcJUJkVKpZUE1dtRZaGCegI9dd98EmOc28OXM+cpdpWF1KadNKOJn4R2cHTqA
 eBg3tiT4VVBu9rmq4aAc9lSHem8+ok5mIG1YlYHz2yFOQ1EL+9cvpVG7M+NTt9dtAPq/ +g== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0b-00154904.pphosted.com with ESMTP id 2ugn6knpme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 13:08:18 -0400
Received: from pps.filterd (m0134318.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7LH2v9E018535
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 13:08:17 -0400
Received: from ausxippc110.us.dell.com (AUSXIPPC110.us.dell.com
 [143.166.85.200])
 by mx0a-00154901.pphosted.com with ESMTP id 2uec7e0uhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 13:08:17 -0400
X-LoopCount0: from 10.166.135.98
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,349,1549951200"; d="scan'208";a="846526680"
From: <Paul.Vancil@dell.com>
To: <neladk@microsoft.com>, <openbmc@lists.ozlabs.org>
Subject: RE: Telemetry Redfish Mockup location at DMTF
Thread-Topic: Telemetry Redfish Mockup location at DMTF
Thread-Index: AdVXffjt5pIc6PV9Q2GEUvsqM049eAAZhsAAABeOw0A=
Date: Wed, 21 Aug 2019 17:08:15 +0000
Message-ID: <cf52a78d26364365820f5b70e80ef422@AUSX13MPS306.AMER.DELL.COM>
References: <fbf557cba2d045b3a57d0adc508ae727@AUSX13MPS306.AMER.DELL.COM>
 <BYAPR21MB1191F6E61DC3BF7CA78C37CAC8AA0@BYAPR21MB1191.namprd21.prod.outlook.com>
In-Reply-To: <BYAPR21MB1191F6E61DC3BF7CA78C37CAC8AA0@BYAPR21MB1191.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=938 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210174
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908210174
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

Neeraj,
It works if you have access to the github.com/DMTF/Redfish repo.
It has not been made public because of the errors, etc.
I assume you do not have access.
I am working on a BMC-specific mockup this week as soon as I get the design=
 spec updated (hopefully that finished today).
Need to identify a place under github for such mockups.  Maybe just a Mocku=
ps folder under openbmc/docs/designbs/Mockups? =20
Thanks
paulv=20

-----Original Message-----
From: Neeraj Ladkani <neladk@microsoft.com>=20
Sent: Wednesday, August 21, 2019 12:51 AM
To: Vancil, Paul; openbmc@lists.ozlabs.org
Subject: RE: Telemetry Redfish Mockup location at DMTF


[EXTERNAL EMAIL]=20

Hi Paul,=20

Link didn't work for me. Can you reconfirm.=20

Neeraj

-----Original Message-----
From: openbmc <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org> On =
Behalf Of Paul.Vancil@dell.com
Sent: Tuesday, August 20, 2019 10:40 AM
To: openbmc@lists.ozlabs.org
Subject: Telemetry Redfish Mockup location at DMTF

For those who have access to the DMTF private repo on github, The location =
of the current Telemetry mockup is:
 https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub=
.com%2FDMTF%2FRedfish%2Ftree%2Fmaster%2Fmockups%2Fpublic-telemetry&amp;data=
=3D02%7C01%7Cneladk%40microsoft.com%7C23e27aa9627a47be38be08d725d4d0f5%7C72=
f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637019468286104259&amp;sdata=3DXZs=
0FM7p97grbS50EuS0lAWk%2Br%2BaMuGxReRSxgZ1Lvs%3D&amp;reserved=3D0
 This mockup has some issues (i.e. errors).
  I am working on pull requests into Redfish for the fixes.
  Then they will make this public as soon as possible.
  Thanks
   Paul Vancil
