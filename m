Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0152285DC
	for <lists+openbmc@lfdr.de>; Thu, 23 May 2019 20:22:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458yXm2jpczDqXf
	for <lists+openbmc@lfdr.de>; Fri, 24 May 2019 04:22:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458yWg2MPVzDqY1
 for <openbmc@lists.ozlabs.org>; Fri, 24 May 2019 04:21:47 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4NIGfxk010665
 for <openbmc@lists.ozlabs.org>; Thu, 23 May 2019 14:21:45 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2snyem3bg8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 May 2019 14:21:44 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gmills@linux.vnet.ibm.com>;
 Thu, 23 May 2019 19:21:44 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 23 May 2019 19:21:42 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4NILfrb33423710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 May 2019 18:21:41 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 131BCC605A;
 Thu, 23 May 2019 18:21:41 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D74D6C605F;
 Thu, 23 May 2019 18:21:40 +0000 (GMT)
Received: from [9.10.100.31] (unknown [9.10.100.31])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 23 May 2019 18:21:40 +0000 (GMT)
Subject: Re: OpenBMC GUI Navigation Update
To: Derick <derick.montague@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <CANT4NrJdiFyJBR9SA-jVA0JZ8C=cf7HvBXjxaiHHBEocxaWR6Q@mail.gmail.com>
 <592E3848-A5D7-45DA-8E20-A3315BE359D9@intel.com>
 <006052f8-dce3-d523-6d7e-8bb610648deb@intel.com>
 <CANT4NrKDC92KOmUcsdP6hWarJKuRP7VTZSwD-F32g+Loqe4VEA@mail.gmail.com>
 <865C376D1B77624AAA570EFEF73CE52F94537DF0@fmsmsx118.amr.corp.intel.com>
 <CAOUmYFTYtxQBJk7iRAVJ7YUgH2-z_t=i9R1opwifJ72M97XaFA@mail.gmail.com>
 <CAOUmYFQECLzVUhSV-dRdGQbwjysQDrbEfT+xn_n1BcWdAn6_qg@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Date: Thu, 23 May 2019 13:21:42 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAOUmYFQECLzVUhSV-dRdGQbwjysQDrbEfT+xn_n1BcWdAn6_qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19052318-0016-0000-0000-000009B8F0C3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011150; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01207553; UDB=6.00634186; IPR=6.00988534; 
 MB=3.00027021; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-23 18:21:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052318-0017-0000-0000-000043568869
Message-Id: <a93570a4-966a-8169-5bcf-8d18647207c0@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-23_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=699 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905230122
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


On 5/22/2019 9:57 PM, Derick wrote:
> Current Navigation Structure
> - Users
>    - Manage User Account
>
> New Navigation Structure
> - Access Control
>    - Certificate Management
>    - LDAP User Management
>    - Local User Management


Makes sense to me.

