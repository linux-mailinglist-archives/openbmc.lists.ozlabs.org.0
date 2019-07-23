Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7736372693
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:28:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tj593JqdzDq7F
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:28:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tTGC4PsHzDqGW
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 05:35:14 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6NJVseJ059425
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 15:35:11 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tx86vgp63-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 15:35:10 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Tue, 23 Jul 2019 20:35:10 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 23 Jul 2019 20:35:07 +0100
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6NJZ6A646727652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jul 2019 19:35:06 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A23986A063;
 Tue, 23 Jul 2019 19:35:06 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7664A6A05F;
 Tue, 23 Jul 2019 19:35:06 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 23 Jul 2019 19:35:06 +0000 (GMT)
Subject: OpenBMC feature docs (was: Multi-node support)
To: Thaj <tajudheenk@gmail.com>, openbmc <openbmc@lists.ozlabs.org>
References: <CAH2KKebkJUxfEQbjcySkGWEteWjCem8EDKwVahAPnw-0-DfPJw@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Date: Tue, 23 Jul 2019 14:35:05 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAH2KKebkJUxfEQbjcySkGWEteWjCem8EDKwVahAPnw-0-DfPJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19072319-0012-0000-0000-000017558183
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011483; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01236426; UDB=6.00651668; IPR=6.01017782; 
 MB=3.00027858; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-23 19:35:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072319-0013-0000-0000-0000582FF000
Message-Id: <1ee24584-9728-cb48-2ca4-f85f64d794b1@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-23_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907230199
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

Thaj,

OpenBMC features are given in the main [README][] and [docs repo][].  If 
you have additions, changes, or more information about any features, 
including ideas for new features, please add them, or send an email and 
I can try to add them.

And as far as I can tell, the feature roadmap is given by:
1. Email to the list (like your email).
2. Discuss release content at a [release planning][] meeting.
3. https://github.com/openbmc/openbmc/#features-of-openbmc

[README]: https://github.com/openbmc/openbmc/blob/master/README.md
[docs repo]: https://github.com/openbmc/docs/blob/master/features.md
[release planning]: https://github.com/openbmc/openbmc/wiki/Release-Planning


On 7/21/19 11:56 PM, Thaj wrote:
> Hi,
>
> Does OpenBMC support Multi-node server configuration ?
>
> Where can I get the roadmap of features in OpenBMC ?
>
> Regards,
> Thaj

