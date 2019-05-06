Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BDB154FA
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2019 22:39:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yZNr1wrwzDqLV
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 06:39:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yZMV34wfzDqC4
 for <openbmc@lists.ozlabs.org>; Tue,  7 May 2019 06:38:45 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x46KG4kH110876
 for <openbmc@lists.ozlabs.org>; Mon, 6 May 2019 16:38:42 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2satkv3rtb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 06 May 2019 16:38:42 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Mon, 6 May 2019 21:38:41 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 May 2019 21:38:39 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x46KccY058720378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 May 2019 20:38:38 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B93E678064;
 Mon,  6 May 2019 20:38:38 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83D957805E;
 Mon,  6 May 2019 20:38:38 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  6 May 2019 20:38:38 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 06 May 2019 15:40:47 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Brandon Wyman <bjwyman@gmail.com>
Subject: Re: [PATCH dev-5.0 v3] ARM: dts: aspeed: Add Swift BMC machine
In-Reply-To: <CAK_vbW2X1DLqBi4EbPH9Cw0FM3o1P2SRguKVkkK47UYPCyxJdQ@mail.gmail.com>
References: <5bbc8649-5a38-fe38-9a97-9c4ec582b511@linux.ibm.com>
 <1556572128-20917-1-git-send-email-anoo@linux.ibm.com>
 <CAK_vbW2X1DLqBi4EbPH9Cw0FM3o1P2SRguKVkkK47UYPCyxJdQ@mail.gmail.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19050620-0020-0000-0000-00000EE47912
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011061; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01199556; UDB=6.00629329; IPR=6.00980432; 
 MB=3.00026760; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-06 20:38:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050620-0021-0000-0000-000065B85934
Message-Id: <67fa3f20dacbed3cec61af33e85664a4@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=630 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905060164
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


>> +
>> +               rear-power {
>> +                       gpios = <&gpio ASPEED_GPIO(N, 3) 
>> GPIO_ACTIVE_LOW>;
>> +               };
> 
> Are you sure about this one? I see GPION3 as a no connect.
> 

You're right, this has been removed in the latest version of the 
schematics. Will remove it.

