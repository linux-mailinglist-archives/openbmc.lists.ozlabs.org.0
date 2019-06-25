Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D06CB55B41
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 00:33:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YLXs2W0yzDqYJ
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 08:33:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=148.163.137.20; helo=mx0b-00154904.pphosted.com;
 envelope-from=paul.vancil@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="OFYGu3sd"; 
 dkim-atps=neutral
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YLX868tQzDqP4
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 08:32:54 +1000 (AEST)
Received: from pps.filterd (m0170395.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PMUSr9021553
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2019 18:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=smtpout1;
 bh=JUcqfxUp9tdbXVEVO9pSLRa1eA57Rl+mjIgoMIlyEWg=;
 b=OFYGu3sdPeWSjW5XAIn2rZZmwQuqfF8+CbzO1JlsoM8Y+1v+MxerRdCubSoac68uH4Uf
 svxpmuHNLpdUx4lW9qSPh5Xmo6jkYdpmIaZMGNTLsUr2LCoZLlwih6IqSKiNZPtZCPVf
 GD35bVQeIM0FVla9Y72nWKgvyoAdcK5/vI9CohUEZGKRalG9kSExp7H837BmWdz+rkyC
 747zIcRaplmW0kk5f+bp+lzT/PKSwkLCQoV2aZRnSRNDOROPl63UqrCaMT1UQ95fhpU1
 dqFYUuStdSjdlzopp39/8zKWIy33HfGtu/tSRXbYpeqt3m3AvxDyOKKfI54yOH0SwRtj Yg== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com with ESMTP id 2tbh9wu5bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2019 18:32:50 -0400
Received: from pps.filterd (m0134746.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PMSnTF062267
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2019 18:32:49 -0400
Received: from ausxipps310.us.dell.com (AUSXIPPS310.us.dell.com
 [143.166.148.211])
 by mx0a-00154901.pphosted.com with ESMTP id 2tbpctxhbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2019 18:32:49 -0400
X-LoopCount0: from 10.166.135.92
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,349,1549951200"; 
 d="scan'208,217";a="382568851"
From: <Paul.Vancil@dell.com>
To: <openbmc@lists.ozlabs.org>
Subject: RE Redfish Host Interface and Related Security model
Thread-Topic: RE Redfish Host Interface and Related Security model
Thread-Index: AdUrpa94Z9q40lnKRZ6vCymmDAf4iQ==
Date: Tue, 25 Jun 2019 22:32:46 +0000
Message-ID: <4d162450d2f3445998067bda33f3abc0@AUSX13MPS306.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: multipart/alternative;
 boundary="_000_4d162450d2f3445998067bda33f3abc0AUSX13MPS306AMERDELLCOM_"
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=674 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250178
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=755 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250179
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

--_000_4d162450d2f3445998067bda33f3abc0AUSX13MPS306AMERDELLCOM_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello.  I will call into security WG meeting tomorrow 6/26.
I have seen you have "Replace host IPMI with PLDM & MCTP" on the Security F=
eature Wish List,
And I think I once saw a comment in email thread the Redfish didn't have a =
host interface - can't find though.

Actually, Redfish does have a Host Interface specification that I wanted to=
 make sure you are aware of -- especially from a security point of view.
So I would like to get on the agenda list for some meeting to give an overv=
iew -- Redfish Host Interface and related security model
The security model has been often misunderstood..

-Thanks, Paul Vancil, Dell ESI




--_000_4d162450d2f3445998067bda33f3abc0AUSX13MPS306AMERDELLCOM_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">
<div>Hello.&nbsp; I will call into security WG meeting tomorrow 6/26.</div>
<div>I have seen you have &quot;Replace host IPMI with PLDM &amp; MCTP&quot=
; on the Security Feature Wish List,</div>
<div>And I think I once saw a comment in email thread the Redfish didn't ha=
ve a host interface &#8211; can&#8217;t find though.</div>
<div>&nbsp;</div>
<div>Actually, Redfish does have a Host Interface specification that I want=
ed to make sure you are aware of -- especially from a security point of vie=
w.</div>
<div>So I would like to get on the agenda list for some meeting to give an =
overview -- Redfish Host Interface and related security model</div>
<div>The security model has been often misunderstood..</div>
<div>&nbsp;</div>
<div>-Thanks, Paul Vancil, Dell ESI</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</span></font>
</body>
</html>

--_000_4d162450d2f3445998067bda33f3abc0AUSX13MPS306AMERDELLCOM_--
