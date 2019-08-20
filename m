Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF23296EB6
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 03:13:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CqS10PTWzDqRK
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 11:13:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=148.163.133.20; helo=mx0a-00154904.pphosted.com;
 envelope-from=paul.vancil@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="C92Z9imr"; 
 dkim-atps=neutral
X-Greylist: delayed 26844 seconds by postgrey-1.36 at bilbo;
 Wed, 21 Aug 2019 11:07:19 AEST
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CqJR06f3zDrPc
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 11:07:16 +1000 (AEST)
Received: from pps.filterd (m0170390.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KHdnHD022895
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 13:39:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=Xeg9rQA3jNfIepnIU0YJ3tqfO35MBU2Wmjwtu9cAL3Y=;
 b=C92Z9imre8vo9o3GDoP5WlU0oLVJgPDV0OZgIY82cJIMkGKtHURh3XxhJdFG3OvbS2xN
 yjL2jKZYpjRIq571UzS4PJ9391Lb5QePfK/PuY1dgW/Dgj/YbNynlHh1f3bcvt9oUG0+
 ndE/2fby6nCMziBa0007+KoGHU4kBdn5HiX0j43ICcbifIHSsXT0a8979aSR4XQDl9Xr
 272cFm2/yPbaYRPuy09YO+k2htmHSafHv43bqrzwI7E9TRs9gBXVR+FxDCrXGppJfgIw
 YufaIs3Xqi99YqvW4/MVos9qH53n2wYPK5Z7C9gGx0diuAUNQRbP26ehzKAPWwaTR0B7 SA== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0a-00154904.pphosted.com with ESMTP id 2ugfdm1ukh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 13:39:49 -0400
Received: from pps.filterd (m0134318.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KHbXLU114871
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 13:39:48 -0400
Received: from ausxippc110.us.dell.com (AUSXIPPC110.us.dell.com
 [143.166.85.200])
 by mx0a-00154901.pphosted.com with ESMTP id 2uec7dfvj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 13:39:48 -0400
X-LoopCount0: from 10.166.135.94
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,349,1549951200"; d="scan'208";a="846071150"
From: <Paul.Vancil@dell.com>
To: <openbmc@lists.ozlabs.org>
Subject: Telemetry Redfish Mockup location at DMTF
Thread-Topic: Telemetry Redfish Mockup location at DMTF
Thread-Index: AdVXffjt5pIc6PV9Q2GEUvsqM049eA==
Date: Tue, 20 Aug 2019 17:39:46 +0000
Message-ID: <fbf557cba2d045b3a57d0adc508ae727@AUSX13MPS306.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=2
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=2
 clxscore=1015 lowpriorityscore=0 mlxscore=2 impostorscore=0
 mlxlogscore=180 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200162
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=284 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908200163
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

For those who have access to the DMTF private repo on github,
The location of the current Telemetry mockup is:
 https://github.com/DMTF/Redfish/tree/master/mockups/public-telemetry
 This mockup has some issues (i.e. errors).
  I am working on pull requests into Redfish for the fixes.
  Then they will make this public as soon as possible.
  Thanks
   Paul Vancil
