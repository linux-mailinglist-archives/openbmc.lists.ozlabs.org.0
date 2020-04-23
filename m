Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A24ED1B6083
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 18:16:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497Mqq59k9zDr3Z
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 02:16:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497MFc5QJQzDqZG
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 01:50:12 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NF8jbg134547; Thu, 23 Apr 2020 11:50:09 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30kb4bx5sx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Apr 2020 11:50:08 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03NFFZgr163389;
 Thu, 23 Apr 2020 11:50:08 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30kb4bx5sn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Apr 2020 11:50:08 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03NFjekG001020;
 Thu, 23 Apr 2020 15:50:07 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 30fs675atn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Apr 2020 15:50:07 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03NFo7Fp48890148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 15:50:07 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F37CFB2065;
 Thu, 23 Apr 2020 15:50:06 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8CC9B2068;
 Thu, 23 Apr 2020 15:50:06 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.137.230])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 23 Apr 2020 15:50:06 +0000 (GMT)
Subject: Re: mTLS on bmcweb
To: =?UTF-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>,
 "ztai@google.com" <ztai@google.com>
References: <mailman.1237.1587601186.5884.openbmc@lists.ozlabs.org>
 <1DF7E55B-29E9-43A2-9981-F67521B2B3E2@quantatw.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <c34fc105-657d-1e33-e3fc-90cb5afba75a@linux.ibm.com>
Date: Thu, 23 Apr 2020 10:50:05 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1DF7E55B-29E9-43A2-9981-F67521B2B3E2@quantatw.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_10:2020-04-23,
 2020-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1011 mlxscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004230118
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/23/20 5:47 AM, P. K. Lee (李柏寬) wrote:
> Hi,
>
> I encountered the same issue when using Redfish to replace the certificate.
> Regardless of whether the parameters include --cert --key --cacert or only --cacert, the authentication can still succeed.
>
> Best,
> P.K.
>
>> Date: Wed, 22 Apr 2020 14:58:06 -0700
>> From: Zhenfei Tai <ztai@google.com>
>> To: openbmc@lists.ozlabs.org
>> Subject: mTLS on bmcweb
>> Message-ID:
>> 	<CAMXw96Pp511sUO=q1XLz2uJzh4S6D7tUwmkvpbnq_yU-iJfiKg@mail.g
>> mail.com>
>> Content-Type: text/plain; charset="utf-8"
>>
>> Hi,
>>
>> I'm trying out bmcweb mTLS which should be enabled by default by
>> https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt#L89
>>
>> In my test, I created a self signed key and certificate pair, stacked them
>> up into server.pem in /etc/ssl/certs/https that bmcweb uses.
>>
>> However when I tried to curl bmcweb service, I was able to get response by
>> only supplying the cert.
>>
>> curl --cacert cert.pem  https://${bmc}/redfish/v1
>>
>> With the mTLS enabled, I expected it should error out since no client
>> certificate is provided.
>>
>> Could someone with relevant knowledge help with my question?

I'm not sure what you are asking.  Are you asking how to install mTLS 
certs into the BMC and then use them to connect?  I am still waiting for 
documentation that describes how to configure and use the mTLS feature.

I've added an entry to the security working group as a reminder to do 
this.  (I don't have the skill to document this feature.)

- Joseph

>>
>> Thanks,
>> Zhenfei

