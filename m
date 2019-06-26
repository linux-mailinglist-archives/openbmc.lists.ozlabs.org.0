Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1B757380
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 23:20:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ywt03vGSzDqSC
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2019 07:20:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YwsR5hP4zDqLT
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2019 07:19:55 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5QL7gnu028758
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 17:19:51 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tcdskpkqc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 17:19:51 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Wed, 26 Jun 2019 22:19:51 +0100
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 26 Jun 2019 22:19:49 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5QLJmi715926116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 21:19:49 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBD192805C
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 21:19:48 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD7BF28059
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 21:19:48 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.184])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2019 21:19:48 +0000 (GMT)
Subject: Re: Security Working Group meeting Wednesday June 26 - results
To: openbmc@lists.ozlabs.org
References: <b0cb634e-fcc5-2858-6b31-e22e10f26dd4@linux.vnet.ibm.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Date: Wed, 26 Jun 2019 16:19:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <b0cb634e-fcc5-2858-6b31-e22e10f26dd4@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19062621-2213-0000-0000-000003A56D30
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011337; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01223702; UDB=6.00644000; IPR=6.01004881; 
 MB=3.00027480; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-26 21:19:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062621-2214-0000-0000-00005F0212FF
Message-Id: <44a95ee2-fe13-a506-57a8-dc9f21248dd7@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-26_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906260245
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


Highlights from the meeting:
- How to move away from default passwords (items 1b, 6).
- Host interface and related security model discussion (item 7).
- How to move forward with threat models (items 3, 4).

The full notes are linked to from the wiki.

- Joseph

On 6/23/19 9:22 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday June 26 at 10:00am PDT.
>
> Current topics:
> - Development work
> - BMC use cases
> - Release planning (2.7 Aug 2019 - 
> https://github.com/openbmc/openbmc/wiki/Release-Planning)
>
> Access, agenda, and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> - Joseph
>

