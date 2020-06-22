Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E2E204220
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 22:47:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rM0r0Y6fzDqYP
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 06:47:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rM0664zQzDqX6
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 06:46:45 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05MKXrX0043269; Mon, 22 Jun 2020 16:46:41 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31tys279ug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 16:46:40 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05MKjfSf014715;
 Mon, 22 Jun 2020 20:46:40 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01wdc.us.ibm.com with ESMTP id 31sa38jb9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 20:46:40 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05MKkdKm34800000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jun 2020 20:46:39 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D1ACBE053;
 Mon, 22 Jun 2020 20:46:39 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08EDFBE04F;
 Mon, 22 Jun 2020 20:46:38 +0000 (GMT)
Received: from [9.85.150.176] (unknown [9.85.150.176])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 22 Jun 2020 20:46:38 +0000 (GMT)
Subject: Re: Message registries continuation
To: James Feist <james.feist@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <74794819-3b3c-0c39-30e0-b2ca6c46d9fb@linux.ibm.com>
 <85015a54-0de6-42e2-bd56-732c7f0a420d@linux.intel.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <bf459022-2ff9-e596-6c7d-25717a0efe43@linux.ibm.com>
Date: Mon, 22 Jun 2020 15:46:38 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <85015a54-0de6-42e2-bd56-732c7f0a420d@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-22_12:2020-06-22,
 2020-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 cotscore=-2147483648 phishscore=0
 malwarescore=0 mlxlogscore=926 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006220131
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

Hi James,

Something I forgot below - when building up our event logs, I have about 
a dozen fields (mostly OEM)
that I have to get from the OpenBMC event log's corresponding PEL (IBM's 
enterprise log format).

PELs aren't on D-Bus for a few reasons, such as they can be several KB 
in size and consist of several
dozen discrete fields, so that rules out bmcweb getting them that way.

I do have a shared library that has the PEL APIs I need (PELs themselves 
are in files). Is it OK if I
just link in that library as needed when a USE_PELs or whatever option 
is set?
Alternatively, I could also dlopen it I suppose.

Just trying to avoid a surprise during review.

Thanks

On 6/16/2020 3:39 PM, James Feist wrote:
> On 6/16/2020 12:47 PM, Matt Spinler wrote:
>> Hi James,
>>
>> Picking up the discussion again from 
>> https://lists.ozlabs.org/pipermail/openbmc/2020-February/020620.html
>> about reading  in message registries...
>>
>> When this was left off, I believe we were leaning toward being able 
>> to copy message registry JSON files
>> into some target directory on the BMC during the build where bmcweb 
>> would load them on startup
>> and leave them in their JSON objects, and they would be pulled from 
>> there when LogService requests
>> were made.
>>
>> This was to be able to support multiple languages, and in general 
>> just to support other registries besides
>> the existing OpenBMC one that is hardcoded in a header file. (We're 
>> going to have an IBM registry we
>> use together with our D-Bus logs based LogService.)
>
> There's 3 registries, fwiw: 
> https://github.com/openbmc/bmcweb/tree/master/redfish-core/include/registries
>
>>
>> An open issue we still had was if these registries had to be 
>> validated, or if that was left to whoever
>> made them.  A stake in the ground could be that we leave the OpenBMC 
>> registry as it is in a header
>> file, which negates validation, or put it in JSON too and validate 
>> just that one during the build.
>> Or if there are any other ideas here...
>
> Entity-manager uses valijson, in that way you could validate them 
> against a schema: https://github.com/tristanpenman/valijson. It plays 
> nicely with nlohmann-json. Although if these are compiled in json 
> files, I'm not sure it's a large issue. We could just create a 
> compile-time script to validate.
>
>>
>> As far as the directory used, I think that /usr/share/bmcweb/ would 
>> be appropriate, or maybe
>> /usr/share/bmcweb/registries/ if either of those are OK with you.
>
> I think the directory is a good idea so it can load any json file from 
> that directory. Maybe /usr/share/bmcweb/registries/<language> even to 
> make it easier to switch between languages?
>
>>
>> Also, it may be overkill to need to  read in the same registry for 
>> every language, as there could
>> be dozens and realistically they will never all be used on a single 
>> system, but if the desire is only
>> to load them at startup before the current language is known I don't 
>> really see a way around it.
>
> I think this would require a default language and a bmcweb reload if 
> the language changed? Its probably ok to change languages after 
> startup, as long as the default language is loaded immediately to 
> lower the chances of run-time issues. As changing languages is 
> probably a very infrequent operation.
>
>>
>> Thanks!
>> Matt

