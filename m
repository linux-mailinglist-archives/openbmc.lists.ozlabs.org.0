Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5129F732C8
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 17:32:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tzq44C10zDqNw
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 01:32:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tzpR1zDszDqHG
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 01:31:26 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6OFUBcp001553
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 11:31:23 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2txrpycc4y-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 11:31:23 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Wed, 24 Jul 2019 16:31:22 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 24 Jul 2019 16:31:20 +0100
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6OFVJxO60555712
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jul 2019 15:31:19 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BB446A04F;
 Wed, 24 Jul 2019 15:31:19 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC21E6A051;
 Wed, 24 Jul 2019 15:31:18 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 24 Jul 2019 15:31:18 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday July 24
To: Chittari Pabba <ChittariP@ami.com>, openbmc <openbmc@lists.ozlabs.org>
References: <ee35ab16-f95b-f51b-956f-fb07b2234aaf@linux.ibm.com>
 <00DE8410EF1E8148ABEDA156FA727A3C03ED1DA70A@atlms2.us.megatrends.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Date: Wed, 24 Jul 2019 10:31:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <00DE8410EF1E8148ABEDA156FA727A3C03ED1DA70A@atlms2.us.megatrends.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19072415-0036-0000-0000-00000ADDE471
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011487; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01236815; UDB=6.00651908; IPR=6.01018181; 
 MB=3.00027871; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-24 15:31:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072415-0037-0000-0000-00004CBA97F4
Message-Id: <f0049a8c-570b-59a1-0df8-17a97e8c7065@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-24_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=983 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907240171
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


On 7/24/19 10:16 AM, Chittari Pabba wrote:
> I like to add following item to today agenda items" Tracking Yocto Linux security fixes tracking"

I've added that.  I am also interested in that topic.  Thank you!

- Joseph

>
> -----Original Message-----
> From: openbmc <openbmc-bounces+chittarip=ami.com@lists.ozlabs.org> On Behalf Of Joseph Reynolds
> Sent: Tuesday, July 23, 2019 3:39 PM
> To: openbmc <openbmc@lists.ozlabs.org>
> Subject: Security Working Group - Wednesday July 24
>
> This is a reminder of the OpenBMC Security Working Group meeting scheduled for this Wednesday July 24 at 10:00am PDT.
>
> * * * The call-in access changed on July 10 (the previous meeting) - details below * * *
>
> Current topics:
> - Development work (including approved network security considerations)
> - SPDM
> - Default user config: root, ipmi group, password limited to char[20]
>
>
> Access, agenda, and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> - Joseph
>
> The Security Working Group meeting access changed on July 10.  The old access will not be used.  The new access is given in the wiki and in this email.  This is effective now, so please update your calendars.
> Here is the information for the web video conference and telephone access:
> - Join via Web:https://ibm.webex.com/meet/joseph.reynolds1
> - Join via Phone: Use access code: 927 034 486 -- United States Toll
> Free: 1-844-531-0958. Click here for other phone numbers <https://ibm.webex.com/cmp3300/webcomponents/widget/globalcallin/globalcallin.do?siteurl=ibm&serviceType=MC&ED=756982637&tollFree=1>
>
> - Visit the Webex web site for more ways to join or for an updated access code.
>
>
> Please consider the environment before printing this email.
>
> The information contained in this message may be confidential and proprietary to American Megatrends, Inc.  This communication is intended to be read only by the individual or entity to whom it is addressed or by their designee. If the reader of this message is not the intended recipient, you are on notice that any distribution of this message, in any form, is strictly prohibited.  Please promptly notify the sender by reply e-mail or by telephone at 770-246-8600, and then delete or destroy all copies of the transmission.

