Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA42811A7A
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 15:47:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vxRD1cj6zDqHn
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 23:47:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vxNF10HVzDqD7
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 23:45:15 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x42DaTVK032438
 for <openbmc@lists.ozlabs.org>; Thu, 2 May 2019 09:45:10 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s802h4urh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 02 May 2019 09:45:10 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.ibm.com>;
 Thu, 2 May 2019 14:45:09 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 2 May 2019 14:45:06 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x42Dj5qF21102594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 May 2019 13:45:05 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAEE7124053;
 Thu,  2 May 2019 13:45:05 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95136124052;
 Thu,  2 May 2019 13:45:05 +0000 (GMT)
Received: from [9.10.99.36] (unknown [9.10.99.36])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  2 May 2019 13:45:05 +0000 (GMT)
Subject: Re: [phosphor-fan-presence] ask fan fail behavior
To: =?UTF-8?B?SGFuayBMaW91ICjlionmmYnnv7Ap?= <Hank.Liou@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <21923ba4201f4a5eacf5580295a617c4@quantatw.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Date: Thu, 2 May 2019 08:45:09 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <21923ba4201f4a5eacf5580295a617c4@quantatw.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19050213-2213-0000-0000-000003854F3A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011035; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01197518; UDB=6.00628099; IPR=6.00978375; 
 MB=3.00026695; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-02 13:45:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050213-2214-0000-0000-00005E429A32
Message-Id: <0c3dd1c4-9b4a-2210-0222-a7a4a9f9cea0@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-02_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=965 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905020094
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


On 5/2/2019 5:37 AM, Hank Liou (劉晉翰) wrote:
>
> Hi All,
>
> Is there a mechanism in phosphor-fan-presence that will set all fans' 
> speed except failed one as a fan fails? I have read 
> phosphor-fan-presence for a while, but I only 
> found set_speed_on_missing_owner, a function in control/actions.cpp. 
> Things get worse that I don't know how to trigger it not to say 
> to test it. Any comment is welcome.
>

Hi,


I don't think there's a way to set a new speed on all fans 'but' the 
failing one, but you can set a new speed when a fail is detected 
(detected by the fan state being set to not functional) with 
count_state_before_speed().


Here is some documentation on that: 
https://github.com/openbmc/phosphor-fan-presence/blob/master/control/example/events.yaml#L127. 
And here it is in use: 
https://github.com/openbmc/meta-ibm/blob/master/meta-witherspoon/recipes-phosphor/fans/witherspoon-phosphor-fan-control-events-config-native/events.yaml#L374




> Sincerely,
>
> Hank Liou
>

