Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C0A6C18A
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 21:36:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pnZg3f3vzDqTh
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 05:36:43 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pnZ20lNTzDqSZ
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 05:36:08 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6HJYHYe044171; Wed, 17 Jul 2019 15:36:01 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tt94p9w51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jul 2019 15:36:01 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6HJYKvF018362;
 Wed, 17 Jul 2019 19:36:00 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 2tq6x69xej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jul 2019 19:36:00 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6HJa0HG34865570
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jul 2019 19:36:00 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68410AC064;
 Wed, 17 Jul 2019 19:36:00 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F2A9AC059;
 Wed, 17 Jul 2019 19:36:00 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 17 Jul 2019 19:36:00 +0000 (GMT)
Subject: Re: BMC threat model docs
To: Chittari Pabba <ChittariP@ami.com>, openbmc <openbmc@lists.ozlabs.org>
References: <685b6066-fdd1-9fc7-82be-372f6ad9ff22@linux.ibm.com>
 <00DE8410EF1E8148ABEDA156FA727A3C03ED1D95CB@atlms2.us.megatrends.com>
 <00DE8410EF1E8148ABEDA156FA727A3C03ED1D95EC@atlms2.us.megatrends.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <e61a380d-60ef-2784-c9f9-8daf91ab224f@linux.ibm.com>
Date: Wed, 17 Jul 2019 14:35:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <00DE8410EF1E8148ABEDA156FA727A3C03ED1D95EC@atlms2.us.megatrends.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-17_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907170220
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


On 7/17/19 12:26 PM, Chittari Pabba wrote:
> Joseph,
>
> I am new to this group; hence I don't know communication protocol, my apology for that. Next time onwards I will use open BMC email list to send for any of our questions or our feedback or suggestions on Open BMC security.

Welcome to the group.  I am looking forward to working with you.  It 
took me a while to get up to speed working the open source way.  The 
guidelines for OpenBMC are here: 
https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md

- Joseph

> Thanks,
> Chittari
>
> -----Original Message-----
> From: Chittari Pabba
> Sent: Wednesday, July 17, 2019 1:21 PM
> To: 'Joseph Reynolds' <jrey@linux.ibm.com>; openbmc <openbmc@lists.ozlabs.org>
> Subject: RE: BMC threat model docs
>
> Thank you, Joseph, for quick response !!! I will review the Open BMC threat model document and will provide my feedback.
>
> -----Original Message-----
> From: openbmc <openbmc-bounces+chittarip=ami.com@lists.ozlabs.org> On Behalf Of Joseph Reynolds
> Sent: Wednesday, July 17, 2019 12:27 PM
> To: openbmc <openbmc@lists.ozlabs.org>
> Subject: BMC threat model docs
>
> I got a private email asking
>   > [where are the] BMC project threat model documents?
>
> The approved network threat model is here:
> https://github.com/openbmc/docs/blob/master/security/network-security-considerations.md
>
> The threat model is very basic and does little more than identify OpenBMC's network services.  The level of detail was initially superficial to get approval for the document.  I hope to add more details and add new sections for BMC network connections including LDAP, remote logging, remote media, ip-kvm, event subscriptions, etc.  Then add a section for Redfish security considerations.
>
> The network threat model is only a subset of the overall BMC threat model.  (For example, the BMC faces threats from its environment and its host system.)  The OpenBMC project has no overall BMC threat model, and mine is in review here:
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22404
> (You can find other threat model reviews by searching gerrit for "threat" or "security").
>
> I am using my review to collect information about BMC threats, which in turn depends on how the BMC is used, so I am collecting information about BMC use cases too.  Any and all contributions are welcome, and can be added as review comments, email to the community, or directly to me. I am struggling with the threat model scope, and how to organize the document.  Any feedback is welcome.
>
> - Joseph
>
>
> Please consider the environment before printing this email.
>
> The information contained in this message may be confidential and proprietary to American Megatrends, Inc.  This communication is intended to be read only by the individual or entity to whom it is addressed or by their designee. If the reader of this message is not the intended recipient, you are on notice that any distribution of this message, in any form, is strictly prohibited.  Please promptly notify the sender by reply e-mail or by telephone at 770-246-8600, and then delete or destroy all copies of the transmission.

