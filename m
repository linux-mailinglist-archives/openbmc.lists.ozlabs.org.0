Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B5A141030
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 18:48:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zpSx0zFXzDqxf
	for <lists+openbmc@lfdr.de>; Sat, 18 Jan 2020 04:48:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zpS81wsszDqwg
 for <openbmc@lists.ozlabs.org>; Sat, 18 Jan 2020 04:47:51 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HHlDIo137898; Fri, 17 Jan 2020 12:47:46 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xk0qudchc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 12:47:46 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00HHlkci140381;
 Fri, 17 Jan 2020 12:47:46 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xk0qudch1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 12:47:46 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00HHeYaB009336;
 Fri, 17 Jan 2020 17:47:45 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 2xhmfaautp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 17:47:45 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00HHlilQ61407660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jan 2020 17:47:44 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BF04BE058;
 Fri, 17 Jan 2020 17:47:44 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BC90BE054;
 Fri, 17 Jan 2020 17:47:43 +0000 (GMT)
Received: from [9.53.178.224] (unknown [9.53.178.224])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jan 2020 17:47:43 +0000 (GMT)
Subject: Re: Moving the WebUI to Vue; Repo vs Branch
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <60d44fed-74e2-70e3-e91f-ae1289d1700f@linux.vnet.ibm.com>
 <f560dbcf-1003-1dac-92ca-358d090a90ac@linux.vnet.ibm.com>
 <4dc89e63-f99b-3df1-b4a6-f80ca996c440@linux.vnet.ibm.com>
 <F8F79845-FD04-4457-8B30-FBC98F4D0FB8@fuzziesquirrel.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <307066a0-e6de-94bd-5d9b-30b52c2bdf0b@linux.vnet.ibm.com>
Date: Fri, 17 Jan 2020 11:47:43 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <F8F79845-FD04-4457-8B30-FBC98F4D0FB8@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_04:2020-01-16,
 2020-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 mlxlogscore=899 adultscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001170139
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Derick <derick.montague@gmail.com>, Yoshie Muranaka <yoshiemuranaka@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 1/17/2020 7:12 AM, Brad Bishop wrote:
>> On Jan 15, 2020, at 12:54 PM, Gunnar Mills <gmills@linux.vnet.ibm.com> wrote:
>> Brad, could you create this repo?
>> webui-vue as a possible name but up for other suggestions.
>>
> webui-vue created


Thank you Brad!

Readme, license, maintainers commits up for review now if anyone is 
interested: 
https://gerrit.openbmc-project.xyz/q/project:openbmc%252Fwebui-vue

Will be more commits in the coming days as we move the prototype over: 
https://github.com/gtmills/phosphor-webui-vue

