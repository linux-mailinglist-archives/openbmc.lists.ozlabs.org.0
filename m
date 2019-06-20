Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9674DD73
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 00:39:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VGvq1v2KzDrMc
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 08:39:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VGv82NLvzDrLk
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 08:38:43 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5KMbHoI051898
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 18:38:39 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t8ht3tpas-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 18:38:38 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Thu, 20 Jun 2019 23:38:37 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Jun 2019 23:38:34 +0100
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5KMcXoJ41353508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jun 2019 22:38:33 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F555AE062;
 Thu, 20 Jun 2019 22:38:33 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B07BAAE05C;
 Thu, 20 Jun 2019 22:38:32 +0000 (GMT)
Received: from birb.localdomain (unknown [9.102.43.75])
 by b01ledav005.gho.pok.ibm.com (Postfix) with SMTP;
 Thu, 20 Jun 2019 22:38:32 +0000 (GMT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id E04E94EC62A; Fri, 21 Jun 2019 08:38:28 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: =?utf-8?Q?Carter_Su=28=E8=8B=8F=E5=AD=9D=29?= <suxiao@inspur.com>,
 "openbmc\@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Move away from default password
In-Reply-To: <ca82e6a6ab5440e3b9f9754a66d5452c@inspur.com>
References: <ca82e6a6ab5440e3b9f9754a66d5452c@inspur.com>
Date: Fri, 21 Jun 2019 08:38:28 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19062022-0052-0000-0000-000003D35BEF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011299; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01220896; UDB=6.00642291; IPR=6.01002034; 
 MB=3.00027398; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-20 22:38:35
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062022-0053-0000-0000-00006165AFEF
Message-Id: <87ef3n51cr.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-20_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=729 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906200160
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

Carter Su(=E8=8B=8F=E5=AD=9D) <suxiao@inspur.com> writes:
> Having a default password is a security risk, but if per BMC has an uniqu=
e password, it may not very convenient for customer to use.
> Customers will change the default password when they install new
> machinery, or they may creat new account and password for BMC to use.

I think there's a gap between what customers *should* do and what they
*actually* do.

Defaulting to as secure as possible is nice as it somewhat saves people
from themselves.

--=20
Stewart Smith
OPAL Architect, IBM.

